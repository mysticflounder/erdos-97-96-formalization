/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 14:0-18

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0000 : Poly :=
[
  term ((-1304 : Rat) / 589) [(0, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0000 : Poly :=
[
  term ((2608 : Rat) / 589) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-1304 : Rat) / 589) [(0, 1), (2, 2), (16, 1)],
  term ((2608 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-1304 : Rat) / 589) [(0, 1), (3, 2), (16, 1)],
  term ((-2608 : Rat) / 589) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-2608 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((1304 : Rat) / 589) [(0, 1), (10, 2), (16, 1)],
  term ((1304 : Rat) / 589) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0000
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0001 : Poly :=
[
  term ((-1536 : Rat) / 589) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0001 : Poly :=
[
  term ((3072 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (14, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (3, 1), (10, 2), (14, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (3, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0001
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0002 : Poly :=
[
  term ((2304 : Rat) / 589) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0002 : Poly :=
[
  term ((-4608 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((2304 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((4608 : Rat) / 589) [(1, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((4608 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-2304 : Rat) / 589) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((-2304 : Rat) / 589) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-4608 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((2304 : Rat) / 589) [(1, 1), (3, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0002
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0003 : Poly :=
[
  term ((-456 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0003 : Poly :=
[
  term ((912 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0003
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0004 : Poly :=
[
  term ((456 : Rat) / 31) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0004 : Poly :=
[
  term ((-912 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0004
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0005 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0005 : Poly :=
[
  term ((227480 : Rat) / 1767) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0005
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0006 : Poly :=
[
  term ((113740 : Rat) / 1767) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0006 : Poly :=
[
  term ((-227480 : Rat) / 1767) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0006
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0007 : Poly :=
[
  term ((918 : Rat) / 31) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 7 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0007 : Poly :=
[
  term ((-1836 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((918 : Rat) / 31) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((1836 : Rat) / 31) [(3, 1), (4, 1), (7, 1), (10, 1), (16, 1)],
  term ((1836 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-918 : Rat) / 31) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((-918 : Rat) / 31) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-1836 : Rat) / 31) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((918 : Rat) / 31) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0007
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0008 : Poly :=
[
  term ((-2364 : Rat) / 589) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 8 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0008 : Poly :=
[
  term ((4728 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0008
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0009 : Poly :=
[
  term ((-15078 : Rat) / 589) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0009 : Poly :=
[
  term ((30156 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-15078 : Rat) / 589) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-30156 : Rat) / 589) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-30156 : Rat) / 589) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((15078 : Rat) / 589) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((15078 : Rat) / 589) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((30156 : Rat) / 589) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-15078 : Rat) / 589) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0009
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0010 : Poly :=
[
  term ((361 : Rat) / 62) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0010 : Poly :=
[
  term ((-361 : Rat) / 31) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((361 : Rat) / 62) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-361 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((361 : Rat) / 62) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((361 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((361 : Rat) / 31) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-361 : Rat) / 62) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-361 : Rat) / 62) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0010
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0011 : Poly :=
[
  term ((307267 : Rat) / 7068) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0011 : Poly :=
[
  term ((-307267 : Rat) / 3534) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((307267 : Rat) / 7068) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-307267 : Rat) / 3534) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((307267 : Rat) / 7068) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((307267 : Rat) / 3534) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((307267 : Rat) / 3534) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-307267 : Rat) / 7068) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-307267 : Rat) / 7068) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0011
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0012 : Poly :=
[
  term ((-114 : Rat) / 31) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0012 : Poly :=
[
  term ((228 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0012
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0013 : Poly :=
[
  term ((-41029 : Rat) / 1767) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0013 : Poly :=
[
  term ((82058 : Rat) / 1767) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0013
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0014 : Poly :=
[
  term ((-2632 : Rat) / 589) [(10, 1), (16, 1)]
]

/-- Partial product 14 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0014 : Poly :=
[
  term ((5264 : Rat) / 589) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(2, 2), (10, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(3, 2), (10, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(4, 1), (10, 2), (16, 1)],
  term ((-5264 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(10, 1), (11, 2), (16, 1)],
  term ((2632 : Rat) / 589) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0014
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0015 : Poly :=
[
  term ((551 : Rat) / 62) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0015 : Poly :=
[
  term ((-551 : Rat) / 31) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((551 : Rat) / 62) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-551 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((551 : Rat) / 62) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((551 : Rat) / 31) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((551 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-551 : Rat) / 62) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-551 : Rat) / 62) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0015
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0016 : Poly :=
[
  term ((5520 : Rat) / 589) [(14, 1), (16, 1)]
]

/-- Partial product 16 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0016 : Poly :=
[
  term ((-11040 : Rat) / 589) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((5520 : Rat) / 589) [(2, 2), (14, 1), (16, 1)],
  term ((-11040 : Rat) / 589) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((5520 : Rat) / 589) [(3, 2), (14, 1), (16, 1)],
  term ((11040 : Rat) / 589) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((11040 : Rat) / 589) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5520 : Rat) / 589) [(10, 2), (14, 1), (16, 1)],
  term ((-5520 : Rat) / 589) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0016
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0017 : Poly :=
[
  term ((121397 : Rat) / 7068) [(15, 2), (16, 1)]
]

/-- Partial product 17 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0017 : Poly :=
[
  term ((-121397 : Rat) / 3534) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((121397 : Rat) / 7068) [(2, 2), (15, 2), (16, 1)],
  term ((-121397 : Rat) / 3534) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((121397 : Rat) / 7068) [(3, 2), (15, 2), (16, 1)],
  term ((121397 : Rat) / 3534) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((121397 : Rat) / 3534) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-121397 : Rat) / 7068) [(10, 2), (15, 2), (16, 1)],
  term ((-121397 : Rat) / 7068) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0017
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNN_coefficient_14_0018 : Poly :=
[
  term ((-1776 : Rat) / 589) [(16, 1)]
]

/-- Partial product 18 for generator 14. -/
def rs_R009_ueqv_R009NNNNN_partial_14_0018 : Poly :=
[
  term ((3552 : Rat) / 589) [(2, 1), (4, 1), (16, 1)],
  term ((-1776 : Rat) / 589) [(2, 2), (16, 1)],
  term ((3552 : Rat) / 589) [(3, 1), (5, 1), (16, 1)],
  term ((-1776 : Rat) / 589) [(3, 2), (16, 1)],
  term ((-3552 : Rat) / 589) [(4, 1), (10, 1), (16, 1)],
  term ((-3552 : Rat) / 589) [(5, 1), (11, 1), (16, 1)],
  term ((1776 : Rat) / 589) [(10, 2), (16, 1)],
  term ((1776 : Rat) / 589) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNN_partial_14_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_14_0018
        rs_R009_ueqv_R009NNNNN_generator_14_0000_0018 =
      rs_R009_ueqv_R009NNNNN_partial_14_0018 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_14_0000_0018 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_14_0000,
  rs_R009_ueqv_R009NNNNN_partial_14_0001,
  rs_R009_ueqv_R009NNNNN_partial_14_0002,
  rs_R009_ueqv_R009NNNNN_partial_14_0003,
  rs_R009_ueqv_R009NNNNN_partial_14_0004,
  rs_R009_ueqv_R009NNNNN_partial_14_0005,
  rs_R009_ueqv_R009NNNNN_partial_14_0006,
  rs_R009_ueqv_R009NNNNN_partial_14_0007,
  rs_R009_ueqv_R009NNNNN_partial_14_0008,
  rs_R009_ueqv_R009NNNNN_partial_14_0009,
  rs_R009_ueqv_R009NNNNN_partial_14_0010,
  rs_R009_ueqv_R009NNNNN_partial_14_0011,
  rs_R009_ueqv_R009NNNNN_partial_14_0012,
  rs_R009_ueqv_R009NNNNN_partial_14_0013,
  rs_R009_ueqv_R009NNNNN_partial_14_0014,
  rs_R009_ueqv_R009NNNNN_partial_14_0015,
  rs_R009_ueqv_R009NNNNN_partial_14_0016,
  rs_R009_ueqv_R009NNNNN_partial_14_0017,
  rs_R009_ueqv_R009NNNNN_partial_14_0018
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_14_0000_0018 : Poly :=
[
  term ((2608 : Rat) / 589) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-1304 : Rat) / 589) [(0, 1), (2, 2), (16, 1)],
  term ((2608 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-1304 : Rat) / 589) [(0, 1), (3, 2), (16, 1)],
  term ((-2608 : Rat) / 589) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-2608 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((1304 : Rat) / 589) [(0, 1), (10, 2), (16, 1)],
  term ((1304 : Rat) / 589) [(0, 1), (11, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-4608 : Rat) / 589) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (14, 1), (16, 1)],
  term ((2304 : Rat) / 589) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((4608 : Rat) / 589) [(1, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((4608 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (3, 1), (10, 2), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 589) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 589) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((-4608 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(1, 1), (3, 3), (14, 1), (16, 1)],
  term ((2304 : Rat) / 589) [(1, 1), (3, 3), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1836 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((30156 : Rat) / 589) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 31) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-307267 : Rat) / 3534) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-551 : Rat) / 31) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11040 : Rat) / 589) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-121397 : Rat) / 3534) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((3552 : Rat) / 589) [(2, 1), (4, 1), (16, 1)],
  term ((918 : Rat) / 31) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-15078 : Rat) / 589) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 62) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((307267 : Rat) / 7068) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(2, 2), (10, 1), (16, 1)],
  term ((551 : Rat) / 62) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((5520 : Rat) / 589) [(2, 2), (14, 1), (16, 1)],
  term ((121397 : Rat) / 7068) [(2, 2), (15, 2), (16, 1)],
  term ((-1776 : Rat) / 589) [(2, 2), (16, 1)],
  term ((1836 : Rat) / 31) [(3, 1), (4, 1), (7, 1), (10, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((-30156 : Rat) / 589) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((1836 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-361 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-307267 : Rat) / 3534) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((228 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-30156 : Rat) / 589) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-551 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11040 : Rat) / 589) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-121397 : Rat) / 3534) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((3552 : Rat) / 589) [(3, 1), (5, 1), (16, 1)],
  term ((-918 : Rat) / 31) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((-918 : Rat) / 31) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((2364 : Rat) / 589) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((15078 : Rat) / 589) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((15078 : Rat) / 589) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1836 : Rat) / 31) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((30156 : Rat) / 589) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 62) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((307267 : Rat) / 7068) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(3, 2), (10, 1), (16, 1)],
  term ((551 : Rat) / 62) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((5520 : Rat) / 589) [(3, 2), (14, 1), (16, 1)],
  term ((121397 : Rat) / 7068) [(3, 2), (15, 2), (16, 1)],
  term ((-1776 : Rat) / 589) [(3, 2), (16, 1)],
  term ((918 : Rat) / 31) [(3, 3), (7, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 3), (9, 1), (16, 1)],
  term ((-15078 : Rat) / 589) [(3, 3), (15, 1), (16, 1)],
  term ((361 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((307267 : Rat) / 3534) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((551 : Rat) / 31) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11040 : Rat) / 589) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((121397 : Rat) / 3534) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3552 : Rat) / 589) [(4, 1), (10, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(4, 1), (10, 2), (16, 1)],
  term ((361 : Rat) / 31) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((307267 : Rat) / 3534) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((551 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11040 : Rat) / 589) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((121397 : Rat) / 3534) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3552 : Rat) / 589) [(5, 1), (11, 1), (16, 1)],
  term ((-361 : Rat) / 62) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-307267 : Rat) / 7068) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-361 : Rat) / 62) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-307267 : Rat) / 7068) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(10, 1), (11, 2), (16, 1)],
  term ((-551 : Rat) / 62) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5520 : Rat) / 589) [(10, 2), (14, 1), (16, 1)],
  term ((-121397 : Rat) / 7068) [(10, 2), (15, 2), (16, 1)],
  term ((1776 : Rat) / 589) [(10, 2), (16, 1)],
  term ((2632 : Rat) / 589) [(10, 3), (16, 1)],
  term ((-551 : Rat) / 62) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5520 : Rat) / 589) [(11, 2), (14, 1), (16, 1)],
  term ((-121397 : Rat) / 7068) [(11, 2), (15, 2), (16, 1)],
  term ((1776 : Rat) / 589) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 18. -/
theorem rs_R009_ueqv_R009NNNNN_block_14_0000_0018_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_14_0000_0018
      rs_R009_ueqv_R009NNNNN_block_14_0000_0018 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
