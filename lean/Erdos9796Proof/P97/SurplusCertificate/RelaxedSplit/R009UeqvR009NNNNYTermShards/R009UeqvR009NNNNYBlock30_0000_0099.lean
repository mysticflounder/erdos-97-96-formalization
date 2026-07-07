/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 30:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0000 : Poly :=
[
  term ((104 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0000 : Poly :=
[
  term ((208 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((208 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 3), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0000
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0001 : Poly :=
[
  term ((-42 : Rat) / 31) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0001 : Poly :=
[
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 3), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0001
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0002 : Poly :=
[
  term (-1 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0002 : Poly :=
[
  term (-2 : Rat) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term (-1 : Rat) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0002
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0003 : Poly :=
[
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (16, 1)]
]

/-- Partial product 3 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0003 : Poly :=
[
  term ((-980 : Rat) / 93) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (12, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 3), (2, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0003
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0004 : Poly :=
[
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (16, 1)]
]

/-- Partial product 4 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0004 : Poly :=
[
  term ((980 : Rat) / 93) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 1), (2, 1), (12, 2), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (12, 3), (16, 1)],
  term ((980 : Rat) / 93) [(0, 2), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 3), (2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0004
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0005 : Poly :=
[
  term ((-245 : Rat) / 93) [(0, 1), (2, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0005 : Poly :=
[
  term ((490 : Rat) / 93) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-245 : Rat) / 93) [(0, 1), (1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (14, 2), (16, 1)],
  term ((245 : Rat) / 93) [(0, 1), (2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 93) [(0, 1), (2, 1), (13, 2), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 2), (2, 1), (14, 2), (16, 1)],
  term ((-245 : Rat) / 93) [(0, 3), (2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0005
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0006 : Poly :=
[
  term ((-418 : Rat) / 93) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 6 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0006 : Poly :=
[
  term ((836 : Rat) / 93) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-418 : Rat) / 93) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-836 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((418 : Rat) / 93) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-836 : Rat) / 93) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((418 : Rat) / 93) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((836 : Rat) / 93) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((-418 : Rat) / 93) [(0, 3), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0006
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0007 : Poly :=
[
  term ((490 : Rat) / 93) [(0, 1), (2, 2), (16, 1)]
]

/-- Partial product 7 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0007 : Poly :=
[
  term ((-980 : Rat) / 93) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 2), (2, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 2), (12, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 2), (2, 2), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 3), (2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0007
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0008 : Poly :=
[
  term ((490 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 8 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0008 : Poly :=
[
  term ((-980 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 2), (3, 1), (5, 1), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 3), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0008
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0009 : Poly :=
[
  term ((158 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0009 : Poly :=
[
  term ((-316 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((158 : Rat) / 93) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((316 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((316 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-316 : Rat) / 93) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((158 : Rat) / 93) [(0, 3), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0009
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0010 : Poly :=
[
  term ((-932 : Rat) / 93) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0010 : Poly :=
[
  term ((1864 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-932 : Rat) / 93) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1864 : Rat) / 93) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((932 : Rat) / 93) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1864 : Rat) / 93) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((932 : Rat) / 93) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((1864 : Rat) / 93) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-932 : Rat) / 93) [(0, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0010
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0011 : Poly :=
[
  term ((-103 : Rat) / 93) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0011 : Poly :=
[
  term ((206 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-103 : Rat) / 93) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-206 : Rat) / 93) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 93) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-206 : Rat) / 93) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((103 : Rat) / 93) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((206 : Rat) / 93) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103 : Rat) / 93) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0011
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0012 : Poly :=
[
  term ((490 : Rat) / 93) [(0, 1), (3, 2), (16, 1)]
]

/-- Partial product 12 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0012 : Poly :=
[
  term ((-980 : Rat) / 93) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 2), (3, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (3, 2), (12, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 3), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0012
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0013 : Poly :=
[
  term ((245 : Rat) / 31) [(0, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 13 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0013 : Poly :=
[
  term ((-490 : Rat) / 31) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (1, 2), (4, 1), (14, 1), (16, 1)],
  term ((490 : Rat) / 31) [(0, 1), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((490 : Rat) / 31) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 2), (4, 1), (14, 2), (16, 1)],
  term ((245 : Rat) / 31) [(0, 3), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0013
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0014 : Poly :=
[
  term ((-29 : Rat) / 3) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 14 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0014 : Poly :=
[
  term ((58 : Rat) / 3) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-29 : Rat) / 3) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-58 : Rat) / 3) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((29 : Rat) / 3) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-58 : Rat) / 3) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((29 : Rat) / 3) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((58 : Rat) / 3) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-29 : Rat) / 3) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0014
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0015 : Poly :=
[
  term ((182 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 15 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0015 : Poly :=
[
  term ((-364 : Rat) / 93) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0015
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0016 : Poly :=
[
  term ((-72 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0016 : Poly :=
[
  term ((144 : Rat) / 31) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-144 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 31) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0016
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0017 : Poly :=
[
  term ((83 : Rat) / 93) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0017 : Poly :=
[
  term ((-166 : Rat) / 93) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((83 : Rat) / 93) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((166 : Rat) / 93) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-83 : Rat) / 93) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((166 : Rat) / 93) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-83 : Rat) / 93) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-166 : Rat) / 93) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((83 : Rat) / 93) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0017
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0018 : Poly :=
[
  term ((1040 : Rat) / 93) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 18 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0018 : Poly :=
[
  term ((-2080 : Rat) / 93) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((1040 : Rat) / 93) [(0, 1), (1, 2), (8, 1), (16, 1)],
  term ((2080 : Rat) / 93) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1040 : Rat) / 93) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((2080 : Rat) / 93) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1040 : Rat) / 93) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-2080 : Rat) / 93) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((1040 : Rat) / 93) [(0, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0018
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0019 : Poly :=
[
  term ((-182 : Rat) / 93) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0019 : Poly :=
[
  term ((364 : Rat) / 93) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((364 : Rat) / 93) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0019
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0020 : Poly :=
[
  term ((-208 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 20 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0020 : Poly :=
[
  term ((416 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (12, 1), (16, 1)],
  term ((-416 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-416 : Rat) / 31) [(0, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((208 : Rat) / 31) [(0, 1), (10, 1), (12, 3), (16, 1)],
  term ((416 : Rat) / 31) [(0, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 3), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0020
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0021 : Poly :=
[
  term ((1232 : Rat) / 93) [(0, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0021 : Poly :=
[
  term ((-2464 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 93) [(0, 1), (1, 2), (10, 1), (14, 1), (16, 1)],
  term ((2464 : Rat) / 93) [(0, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1232 : Rat) / 93) [(0, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((2464 : Rat) / 93) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1232 : Rat) / 93) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2464 : Rat) / 93) [(0, 2), (10, 1), (14, 2), (16, 1)],
  term ((1232 : Rat) / 93) [(0, 3), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0021
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0022 : Poly :=
[
  term ((200 : Rat) / 31) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 22 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0022 : Poly :=
[
  term ((-400 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((200 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((400 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-200 : Rat) / 31) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((400 : Rat) / 31) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-200 : Rat) / 31) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-400 : Rat) / 31) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 31) [(0, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0022
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0023 : Poly :=
[
  term ((-452 : Rat) / 93) [(0, 1), (10, 2), (16, 1)]
]

/-- Partial product 23 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0023 : Poly :=
[
  term ((904 : Rat) / 93) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(0, 1), (1, 2), (10, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(0, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((452 : Rat) / 93) [(0, 1), (10, 2), (12, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((452 : Rat) / 93) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((904 : Rat) / 93) [(0, 2), (10, 2), (14, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(0, 3), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0023
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0024 : Poly :=
[
  term ((184 : Rat) / 93) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0024 : Poly :=
[
  term ((-368 : Rat) / 93) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((184 : Rat) / 93) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((368 : Rat) / 93) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((368 : Rat) / 93) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-368 : Rat) / 93) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((184 : Rat) / 93) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0024
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0025 : Poly :=
[
  term ((-323 : Rat) / 186) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0025 : Poly :=
[
  term ((323 : Rat) / 93) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-323 : Rat) / 186) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-323 : Rat) / 93) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((323 : Rat) / 186) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-323 : Rat) / 93) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((323 : Rat) / 186) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((323 : Rat) / 93) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-323 : Rat) / 186) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0025
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0026 : Poly :=
[
  term ((-76 : Rat) / 93) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 26 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0026 : Poly :=
[
  term ((152 : Rat) / 93) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-76 : Rat) / 93) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((-152 : Rat) / 93) [(0, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 93) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-152 : Rat) / 93) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 93) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((152 : Rat) / 93) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-76 : Rat) / 93) [(0, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0026
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0027 : Poly :=
[
  term ((16 : Rat) / 93) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0027 : Poly :=
[
  term ((-32 : Rat) / 93) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(0, 1), (1, 2), (12, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 1), (12, 2), (14, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 1), (12, 3), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 2), (12, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 93) [(0, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0027
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0028 : Poly :=
[
  term ((1673 : Rat) / 186) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 28 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0028 : Poly :=
[
  term ((-1673 : Rat) / 93) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((1673 : Rat) / 186) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((1673 : Rat) / 93) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1673 : Rat) / 186) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((1673 : Rat) / 93) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1673 : Rat) / 186) [(0, 1), (12, 3), (16, 1)],
  term ((-1673 : Rat) / 93) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((1673 : Rat) / 186) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0028
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0029 : Poly :=
[
  term ((69 : Rat) / 62) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0029 : Poly :=
[
  term ((-69 : Rat) / 31) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((69 : Rat) / 62) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 31) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69 : Rat) / 62) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 31) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-69 : Rat) / 62) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-69 : Rat) / 31) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 62) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0029
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0030 : Poly :=
[
  term ((-42 : Rat) / 31) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 30 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0030 : Poly :=
[
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 1), (13, 4), (16, 1)],
  term ((84 : Rat) / 31) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0030
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0031 : Poly :=
[
  term ((-229 : Rat) / 372) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 31 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0031 : Poly :=
[
  term ((229 : Rat) / 186) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-229 : Rat) / 372) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-229 : Rat) / 186) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((229 : Rat) / 372) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-229 : Rat) / 186) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((229 : Rat) / 372) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((229 : Rat) / 186) [(0, 2), (14, 2), (16, 1)],
  term ((-229 : Rat) / 372) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0031
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0032 : Poly :=
[
  term ((-245 : Rat) / 31) [(0, 1), (14, 2), (16, 1)]
]

/-- Partial product 32 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0032 : Poly :=
[
  term ((490 : Rat) / 31) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (1, 2), (14, 2), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 1), (12, 1), (14, 3), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (12, 2), (14, 2), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((490 : Rat) / 31) [(0, 2), (14, 3), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0032
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0033 : Poly :=
[
  term ((-267 : Rat) / 62) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 33 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0033 : Poly :=
[
  term ((267 : Rat) / 31) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-267 : Rat) / 62) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-267 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((267 : Rat) / 62) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-267 : Rat) / 31) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((267 : Rat) / 62) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((267 : Rat) / 31) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-267 : Rat) / 62) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0033
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0034 : Poly :=
[
  term ((-985 : Rat) / 372) [(0, 1), (16, 1)]
]

/-- Partial product 34 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0034 : Poly :=
[
  term ((985 : Rat) / 186) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-985 : Rat) / 372) [(0, 1), (1, 2), (16, 1)],
  term ((-985 : Rat) / 186) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((985 : Rat) / 372) [(0, 1), (12, 2), (16, 1)],
  term ((-985 : Rat) / 186) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((985 : Rat) / 372) [(0, 1), (13, 2), (16, 1)],
  term ((985 : Rat) / 186) [(0, 2), (14, 1), (16, 1)],
  term ((-985 : Rat) / 372) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0034
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0035 : Poly :=
[
  term ((-104 : Rat) / 31) [(0, 2), (10, 1), (16, 1)]
]

/-- Partial product 35 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0035 : Poly :=
[
  term ((208 : Rat) / 31) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 2), (1, 2), (10, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 2), (10, 1), (12, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((208 : Rat) / 31) [(0, 3), (10, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0035
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0036 : Poly :=
[
  term ((73 : Rat) / 62) [(0, 2), (16, 1)]
]

/-- Partial product 36 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0036 : Poly :=
[
  term ((-73 : Rat) / 31) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((73 : Rat) / 62) [(0, 2), (1, 2), (16, 1)],
  term ((73 : Rat) / 31) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-73 : Rat) / 62) [(0, 2), (12, 2), (16, 1)],
  term ((73 : Rat) / 31) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-73 : Rat) / 62) [(0, 2), (13, 2), (16, 1)],
  term ((-73 : Rat) / 31) [(0, 3), (14, 1), (16, 1)],
  term ((73 : Rat) / 62) [(0, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0036
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0037 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (16, 1)]
]

/-- Partial product 37 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0037 : Poly :=
[
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 2), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (12, 2), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (13, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 3), (2, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0037
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0038 : Poly :=
[
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

/-- Partial product 38 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0038 : Poly :=
[
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 2), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (12, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (13, 2), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 3), (3, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0038
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0039 : Poly :=
[
  term ((-158 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 39 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0039 : Poly :=
[
  term ((316 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((158 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)],
  term ((-316 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((158 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((316 : Rat) / 93) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(1, 3), (3, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0039
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0040 : Poly :=
[
  term ((442 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 40 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0040 : Poly :=
[
  term ((-884 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 3), (3, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0040
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0041 : Poly :=
[
  term ((-142 : Rat) / 93) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 41 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0041 : Poly :=
[
  term ((284 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-142 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-284 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((142 : Rat) / 93) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((-284 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((142 : Rat) / 93) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((284 : Rat) / 93) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142 : Rat) / 93) [(1, 3), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0041
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0042 : Poly :=
[
  term ((-292 : Rat) / 93) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 42 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0042 : Poly :=
[
  term ((584 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-292 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-584 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((292 : Rat) / 93) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-584 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((292 : Rat) / 93) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((584 : Rat) / 93) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-292 : Rat) / 93) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0042
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0043 : Poly :=
[
  term ((-182 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 43 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0043 : Poly :=
[
  term ((364 : Rat) / 93) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (1, 1), (4, 1), (9, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (12, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (13, 2), (16, 1)],
  term ((364 : Rat) / 93) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 3), (4, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0043
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0044 : Poly :=
[
  term ((72 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0044 : Poly :=
[
  term ((-144 : Rat) / 31) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 31) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 3), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0044
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0045 : Poly :=
[
  term ((652 : Rat) / 93) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0045 : Poly :=
[
  term ((-1304 : Rat) / 93) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((652 : Rat) / 93) [(1, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0045
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0046 : Poly :=
[
  term ((182 : Rat) / 93) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 46 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0046 : Poly :=
[
  term ((-364 : Rat) / 93) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (1, 1), (9, 1), (12, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (12, 3), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 3), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0046
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0047 : Poly :=
[
  term ((487 : Rat) / 31) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 47 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0047 : Poly :=
[
  term ((-974 : Rat) / 31) [(0, 1), (1, 1), (9, 1), (14, 1), (16, 1)],
  term ((487 : Rat) / 31) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((974 : Rat) / 31) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-487 : Rat) / 31) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((974 : Rat) / 31) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-487 : Rat) / 31) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-974 : Rat) / 31) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((487 : Rat) / 31) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0047
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0048 : Poly :=
[
  term ((-376 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 48 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0048 : Poly :=
[
  term ((752 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-376 : Rat) / 93) [(0, 2), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-752 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((376 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-752 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((376 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((752 : Rat) / 93) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-376 : Rat) / 93) [(1, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0048
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0049 : Poly :=
[
  term ((861 : Rat) / 62) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0049 : Poly :=
[
  term ((-861 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((861 : Rat) / 62) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((861 : Rat) / 31) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-861 : Rat) / 62) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((861 : Rat) / 31) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-861 : Rat) / 62) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-861 : Rat) / 31) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((861 : Rat) / 62) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0049
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0050 : Poly :=
[
  term ((-808 : Rat) / 93) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 50 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0050 : Poly :=
[
  term ((1616 : Rat) / 93) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-808 : Rat) / 93) [(0, 2), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1616 : Rat) / 93) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((808 : Rat) / 93) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1616 : Rat) / 93) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((808 : Rat) / 93) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((1616 : Rat) / 93) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-808 : Rat) / 93) [(1, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0050
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0051 : Poly :=
[
  term ((34 : Rat) / 31) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 51 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0051 : Poly :=
[
  term ((-68 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((34 : Rat) / 31) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((68 : Rat) / 31) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-34 : Rat) / 31) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((68 : Rat) / 31) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34 : Rat) / 31) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-68 : Rat) / 31) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((34 : Rat) / 31) [(1, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0051
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0052 : Poly :=
[
  term ((200 : Rat) / 31) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 52 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0052 : Poly :=
[
  term ((-400 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 31) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((400 : Rat) / 31) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-200 : Rat) / 31) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((400 : Rat) / 31) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-200 : Rat) / 31) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-400 : Rat) / 31) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((200 : Rat) / 31) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0052
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0053 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 53 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0053 : Poly :=
[
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (12, 3), (13, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0053
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0054 : Poly :=
[
  term ((347 : Rat) / 62) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0054 : Poly :=
[
  term ((-347 : Rat) / 31) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((347 : Rat) / 62) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((347 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-347 : Rat) / 62) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((347 : Rat) / 31) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-347 : Rat) / 62) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-347 : Rat) / 31) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((347 : Rat) / 62) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0054
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0055 : Poly :=
[
  term ((-608 : Rat) / 93) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0055 : Poly :=
[
  term ((1216 : Rat) / 93) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-608 : Rat) / 93) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1216 : Rat) / 93) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((608 : Rat) / 93) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1216 : Rat) / 93) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((608 : Rat) / 93) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((1216 : Rat) / 93) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-608 : Rat) / 93) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0055
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0056 : Poly :=
[
  term ((-328 : Rat) / 93) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 56 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0056 : Poly :=
[
  term ((656 : Rat) / 93) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-328 : Rat) / 93) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-656 : Rat) / 93) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((328 : Rat) / 93) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-656 : Rat) / 93) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((328 : Rat) / 93) [(1, 1), (13, 3), (16, 1)],
  term ((656 : Rat) / 93) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-328 : Rat) / 93) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0056
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0057 : Poly :=
[
  term ((-223 : Rat) / 62) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0057 : Poly :=
[
  term ((223 : Rat) / 31) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-223 : Rat) / 62) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-223 : Rat) / 31) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((223 : Rat) / 62) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-223 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((223 : Rat) / 62) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((223 : Rat) / 31) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-223 : Rat) / 62) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0057
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0058 : Poly :=
[
  term ((-1183 : Rat) / 124) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0058 : Poly :=
[
  term ((1183 : Rat) / 62) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1183 : Rat) / 124) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-1183 : Rat) / 62) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1183 : Rat) / 124) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1183 : Rat) / 62) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1183 : Rat) / 124) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((1183 : Rat) / 62) [(1, 2), (15, 2), (16, 1)],
  term ((-1183 : Rat) / 124) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0058
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0059 : Poly :=
[
  term ((-208 : Rat) / 31) [(1, 2), (10, 1), (16, 1)]
]

/-- Partial product 59 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0059 : Poly :=
[
  term ((416 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (1, 2), (10, 1), (16, 1)],
  term ((-416 : Rat) / 31) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 31) [(1, 2), (10, 1), (12, 2), (16, 1)],
  term ((-416 : Rat) / 31) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 31) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((416 : Rat) / 31) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(1, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0059
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0060 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 60 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0060 : Poly :=
[
  term ((-84 : Rat) / 31) [(0, 1), (1, 2), (12, 1), (14, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 2), (1, 2), (12, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (12, 2), (14, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 2), (12, 3), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0060
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0061 : Poly :=
[
  term (1 : Rat) [(1, 2), (14, 1), (16, 1)]
]

/-- Partial product 61 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0061 : Poly :=
[
  term (-2 : Rat) [(0, 1), (1, 2), (14, 2), (16, 1)],
  term (1 : Rat) [(0, 2), (1, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term (-1 : Rat) [(1, 2), (12, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(1, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0061
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0062 : Poly :=
[
  term ((73 : Rat) / 62) [(1, 2), (16, 1)]
]

/-- Partial product 62 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0062 : Poly :=
[
  term ((-73 : Rat) / 31) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((73 : Rat) / 62) [(0, 2), (1, 2), (16, 1)],
  term ((73 : Rat) / 31) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-73 : Rat) / 62) [(1, 2), (12, 2), (16, 1)],
  term ((73 : Rat) / 31) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-73 : Rat) / 62) [(1, 2), (13, 2), (16, 1)],
  term ((-73 : Rat) / 31) [(1, 3), (15, 1), (16, 1)],
  term ((73 : Rat) / 62) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0062
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0063 : Poly :=
[
  term ((32 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 63 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0063 : Poly :=
[
  term ((-64 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((64 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0063
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0064 : Poly :=
[
  term ((394 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0064 : Poly :=
[
  term ((-788 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((394 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((788 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((788 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-394 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0064
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0065 : Poly :=
[
  term ((442 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 65 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0065 : Poly :=
[
  term ((-884 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0065
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0066 : Poly :=
[
  term ((442 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 66 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0066 : Poly :=
[
  term ((-884 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0066
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0067 : Poly :=
[
  term ((-221 : Rat) / 93) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0067 : Poly :=
[
  term ((442 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-221 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 93) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((221 : Rat) / 93) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0067
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0068 : Poly :=
[
  term ((-32 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 68 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0068 : Poly :=
[
  term ((64 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0068
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0069 : Poly :=
[
  term ((-394 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0069 : Poly :=
[
  term ((788 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((788 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-394 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((394 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0069
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0070 : Poly :=
[
  term ((-364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 70 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0070 : Poly :=
[
  term ((728 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((728 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-728 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-728 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0070
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0071 : Poly :=
[
  term ((442 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 71 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0071 : Poly :=
[
  term ((-884 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (12, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0071
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0072 : Poly :=
[
  term ((2278 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 72 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0072 : Poly :=
[
  term ((-4556 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4556 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((4556 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((4556 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0072
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0073 : Poly :=
[
  term ((-178 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0073 : Poly :=
[
  term ((356 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((356 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-178 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((178 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((178 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0073
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0074 : Poly :=
[
  term ((-1906 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (16, 1)]
]

/-- Partial product 74 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0074 : Poly :=
[
  term ((3812 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1906 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (11, 2), (16, 1)],
  term ((3812 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1906 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-3812 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1906 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3812 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1906 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0074
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0075 : Poly :=
[
  term ((-32 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0075 : Poly :=
[
  term ((64 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0075
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0076 : Poly :=
[
  term ((16 : Rat) / 93) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 76 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0076 : Poly :=
[
  term ((-32 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (4, 1), (12, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0076
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0077 : Poly :=
[
  term ((-596 : Rat) / 93) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 77 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0077 : Poly :=
[
  term ((1192 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-596 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((1192 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-596 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-1192 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((596 : Rat) / 93) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((-1192 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((596 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0077
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0078 : Poly :=
[
  term ((-190 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 78 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0078 : Poly :=
[
  term ((380 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((380 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((190 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-380 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((190 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0078
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0079 : Poly :=
[
  term ((-335 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 79 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0079 : Poly :=
[
  term ((670 : Rat) / 31) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-335 : Rat) / 31) [(0, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((670 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-335 : Rat) / 31) [(1, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-670 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((335 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-670 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((335 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0079
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0080 : Poly :=
[
  term ((32 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 80 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0080 : Poly :=
[
  term ((-64 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((64 : Rat) / 93) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (5, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0080
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0081 : Poly :=
[
  term ((394 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0081 : Poly :=
[
  term ((-788 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((394 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((788 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-394 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((788 : Rat) / 93) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(2, 1), (5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0081
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0082 : Poly :=
[
  term ((16 : Rat) / 93) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 82 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0082 : Poly :=
[
  term ((-32 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0082
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0083 : Poly :=
[
  term ((1247 : Rat) / 93) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 83 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0083 : Poly :=
[
  term ((-2494 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((1247 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-2494 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1247 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((2494 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(2, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((2494 : Rat) / 93) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(2, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0083
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0084 : Poly :=
[
  term ((197 : Rat) / 93) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0084 : Poly :=
[
  term ((-394 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((197 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-197 : Rat) / 93) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0084
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0085 : Poly :=
[
  term ((667 : Rat) / 93) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0085 : Poly :=
[
  term ((-1334 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((667 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1334 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((667 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((1334 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((1334 : Rat) / 93) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-667 : Rat) / 93) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0085
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0086 : Poly :=
[
  term ((-8 : Rat) / 93) [(2, 1), (5, 2), (16, 1)]
]

/-- Partial product 86 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0086 : Poly :=
[
  term ((16 : Rat) / 93) [(0, 1), (2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(0, 2), (2, 1), (5, 2), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 2), (2, 1), (5, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 1), (5, 2), (12, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 1), (5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0086
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0087 : Poly :=
[
  term ((-148 : Rat) / 93) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 87 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0087 : Poly :=
[
  term ((296 : Rat) / 93) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(0, 2), (2, 1), (8, 1), (16, 1)],
  term ((296 : Rat) / 93) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(1, 2), (2, 1), (8, 1), (16, 1)],
  term ((-296 : Rat) / 93) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((148 : Rat) / 93) [(2, 1), (8, 1), (12, 2), (16, 1)],
  term ((-296 : Rat) / 93) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((148 : Rat) / 93) [(2, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0087
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0088 : Poly :=
[
  term ((364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 88 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0088 : Poly :=
[
  term ((-728 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 2), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-728 : Rat) / 93) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 2), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((728 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((728 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0088
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0089 : Poly :=
[
  term ((182 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 89 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0089 : Poly :=
[
  term ((-364 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0089
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0090 : Poly :=
[
  term ((4 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 90 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0090 : Poly :=
[
  term ((-8 : Rat) / 3) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((8 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((8 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0090
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0091 : Poly :=
[
  term ((8 : Rat) / 93) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 91 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0091 : Poly :=
[
  term ((-16 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0091
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0092 : Poly :=
[
  term ((-442 : Rat) / 93) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 92 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0092 : Poly :=
[
  term ((884 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(2, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0092
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0093 : Poly :=
[
  term ((-221 : Rat) / 93) [(2, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 93 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0093 : Poly :=
[
  term ((442 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (14, 2), (16, 1)],
  term ((-221 : Rat) / 93) [(0, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((221 : Rat) / 93) [(2, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 93) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0093
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0094 : Poly :=
[
  term ((-2278 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 94 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0094 : Poly :=
[
  term ((4556 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4556 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4556 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4556 : Rat) / 93) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(2, 1), (11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0094
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0095 : Poly :=
[
  term ((-116 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0095 : Poly :=
[
  term ((232 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-116 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((116 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(2, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0095
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0096 : Poly :=
[
  term ((-1139 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 96 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0096 : Poly :=
[
  term ((2278 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1139 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 93) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0096
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0097 : Poly :=
[
  term ((-1418 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 97 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0097 : Poly :=
[
  term ((2836 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1418 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((2836 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1418 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2836 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1418 : Rat) / 93) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2836 : Rat) / 93) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1418 : Rat) / 93) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0097
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0098 : Poly :=
[
  term ((-58 : Rat) / 93) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0098 : Poly :=
[
  term ((116 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-58 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((58 : Rat) / 93) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 93) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0098
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNY_coefficient_30_0099 : Poly :=
[
  term ((332 : Rat) / 93) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 30. -/
def rs_R009_ueqv_R009NNNNY_partial_30_0099 : Poly :=
[
  term ((-664 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((332 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-664 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((332 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((664 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-332 : Rat) / 93) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((664 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-332 : Rat) / 93) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNY_partial_30_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_30_0099
        rs_R009_ueqv_R009NNNNY_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNNY_partial_30_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_30_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_30_0000,
  rs_R009_ueqv_R009NNNNY_partial_30_0001,
  rs_R009_ueqv_R009NNNNY_partial_30_0002,
  rs_R009_ueqv_R009NNNNY_partial_30_0003,
  rs_R009_ueqv_R009NNNNY_partial_30_0004,
  rs_R009_ueqv_R009NNNNY_partial_30_0005,
  rs_R009_ueqv_R009NNNNY_partial_30_0006,
  rs_R009_ueqv_R009NNNNY_partial_30_0007,
  rs_R009_ueqv_R009NNNNY_partial_30_0008,
  rs_R009_ueqv_R009NNNNY_partial_30_0009,
  rs_R009_ueqv_R009NNNNY_partial_30_0010,
  rs_R009_ueqv_R009NNNNY_partial_30_0011,
  rs_R009_ueqv_R009NNNNY_partial_30_0012,
  rs_R009_ueqv_R009NNNNY_partial_30_0013,
  rs_R009_ueqv_R009NNNNY_partial_30_0014,
  rs_R009_ueqv_R009NNNNY_partial_30_0015,
  rs_R009_ueqv_R009NNNNY_partial_30_0016,
  rs_R009_ueqv_R009NNNNY_partial_30_0017,
  rs_R009_ueqv_R009NNNNY_partial_30_0018,
  rs_R009_ueqv_R009NNNNY_partial_30_0019,
  rs_R009_ueqv_R009NNNNY_partial_30_0020,
  rs_R009_ueqv_R009NNNNY_partial_30_0021,
  rs_R009_ueqv_R009NNNNY_partial_30_0022,
  rs_R009_ueqv_R009NNNNY_partial_30_0023,
  rs_R009_ueqv_R009NNNNY_partial_30_0024,
  rs_R009_ueqv_R009NNNNY_partial_30_0025,
  rs_R009_ueqv_R009NNNNY_partial_30_0026,
  rs_R009_ueqv_R009NNNNY_partial_30_0027,
  rs_R009_ueqv_R009NNNNY_partial_30_0028,
  rs_R009_ueqv_R009NNNNY_partial_30_0029,
  rs_R009_ueqv_R009NNNNY_partial_30_0030,
  rs_R009_ueqv_R009NNNNY_partial_30_0031,
  rs_R009_ueqv_R009NNNNY_partial_30_0032,
  rs_R009_ueqv_R009NNNNY_partial_30_0033,
  rs_R009_ueqv_R009NNNNY_partial_30_0034,
  rs_R009_ueqv_R009NNNNY_partial_30_0035,
  rs_R009_ueqv_R009NNNNY_partial_30_0036,
  rs_R009_ueqv_R009NNNNY_partial_30_0037,
  rs_R009_ueqv_R009NNNNY_partial_30_0038,
  rs_R009_ueqv_R009NNNNY_partial_30_0039,
  rs_R009_ueqv_R009NNNNY_partial_30_0040,
  rs_R009_ueqv_R009NNNNY_partial_30_0041,
  rs_R009_ueqv_R009NNNNY_partial_30_0042,
  rs_R009_ueqv_R009NNNNY_partial_30_0043,
  rs_R009_ueqv_R009NNNNY_partial_30_0044,
  rs_R009_ueqv_R009NNNNY_partial_30_0045,
  rs_R009_ueqv_R009NNNNY_partial_30_0046,
  rs_R009_ueqv_R009NNNNY_partial_30_0047,
  rs_R009_ueqv_R009NNNNY_partial_30_0048,
  rs_R009_ueqv_R009NNNNY_partial_30_0049,
  rs_R009_ueqv_R009NNNNY_partial_30_0050,
  rs_R009_ueqv_R009NNNNY_partial_30_0051,
  rs_R009_ueqv_R009NNNNY_partial_30_0052,
  rs_R009_ueqv_R009NNNNY_partial_30_0053,
  rs_R009_ueqv_R009NNNNY_partial_30_0054,
  rs_R009_ueqv_R009NNNNY_partial_30_0055,
  rs_R009_ueqv_R009NNNNY_partial_30_0056,
  rs_R009_ueqv_R009NNNNY_partial_30_0057,
  rs_R009_ueqv_R009NNNNY_partial_30_0058,
  rs_R009_ueqv_R009NNNNY_partial_30_0059,
  rs_R009_ueqv_R009NNNNY_partial_30_0060,
  rs_R009_ueqv_R009NNNNY_partial_30_0061,
  rs_R009_ueqv_R009NNNNY_partial_30_0062,
  rs_R009_ueqv_R009NNNNY_partial_30_0063,
  rs_R009_ueqv_R009NNNNY_partial_30_0064,
  rs_R009_ueqv_R009NNNNY_partial_30_0065,
  rs_R009_ueqv_R009NNNNY_partial_30_0066,
  rs_R009_ueqv_R009NNNNY_partial_30_0067,
  rs_R009_ueqv_R009NNNNY_partial_30_0068,
  rs_R009_ueqv_R009NNNNY_partial_30_0069,
  rs_R009_ueqv_R009NNNNY_partial_30_0070,
  rs_R009_ueqv_R009NNNNY_partial_30_0071,
  rs_R009_ueqv_R009NNNNY_partial_30_0072,
  rs_R009_ueqv_R009NNNNY_partial_30_0073,
  rs_R009_ueqv_R009NNNNY_partial_30_0074,
  rs_R009_ueqv_R009NNNNY_partial_30_0075,
  rs_R009_ueqv_R009NNNNY_partial_30_0076,
  rs_R009_ueqv_R009NNNNY_partial_30_0077,
  rs_R009_ueqv_R009NNNNY_partial_30_0078,
  rs_R009_ueqv_R009NNNNY_partial_30_0079,
  rs_R009_ueqv_R009NNNNY_partial_30_0080,
  rs_R009_ueqv_R009NNNNY_partial_30_0081,
  rs_R009_ueqv_R009NNNNY_partial_30_0082,
  rs_R009_ueqv_R009NNNNY_partial_30_0083,
  rs_R009_ueqv_R009NNNNY_partial_30_0084,
  rs_R009_ueqv_R009NNNNY_partial_30_0085,
  rs_R009_ueqv_R009NNNNY_partial_30_0086,
  rs_R009_ueqv_R009NNNNY_partial_30_0087,
  rs_R009_ueqv_R009NNNNY_partial_30_0088,
  rs_R009_ueqv_R009NNNNY_partial_30_0089,
  rs_R009_ueqv_R009NNNNY_partial_30_0090,
  rs_R009_ueqv_R009NNNNY_partial_30_0091,
  rs_R009_ueqv_R009NNNNY_partial_30_0092,
  rs_R009_ueqv_R009NNNNY_partial_30_0093,
  rs_R009_ueqv_R009NNNNY_partial_30_0094,
  rs_R009_ueqv_R009NNNNY_partial_30_0095,
  rs_R009_ueqv_R009NNNNY_partial_30_0096,
  rs_R009_ueqv_R009NNNNY_partial_30_0097,
  rs_R009_ueqv_R009NNNNY_partial_30_0098,
  rs_R009_ueqv_R009NNNNY_partial_30_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_30_0000_0099 : Poly :=
[
  term ((-980 : Rat) / 93) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((836 : Rat) / 93) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((316 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((1864 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((584 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((284 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((206 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2774 : Rat) / 93) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 3) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 31) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-166 : Rat) / 93) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-2080 : Rat) / 93) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-974 : Rat) / 31) [(0, 1), (1, 1), (9, 1), (14, 1), (16, 1)],
  term ((752 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5047 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-400 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((904 : Rat) / 93) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((2240 : Rat) / 93) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((256 : Rat) / 93) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-400 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-68 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((323 : Rat) / 93) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((152 : Rat) / 93) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-168 : Rat) / 31) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1259 : Rat) / 93) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1673 : Rat) / 93) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((656 : Rat) / 93) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((1216 : Rat) / 93) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-131 : Rat) / 31) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((1889 : Rat) / 93) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term (23 : Rat) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((985 : Rat) / 186) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((267 : Rat) / 31) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-245 : Rat) / 93) [(0, 1), (1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-418 : Rat) / 93) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 2), (2, 2), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 2), (3, 1), (5, 1), (16, 1)],
  term ((158 : Rat) / 93) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-932 : Rat) / 93) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-103 : Rat) / 93) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (1, 2), (3, 2), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-29 : Rat) / 3) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((83 : Rat) / 93) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((1040 : Rat) / 93) [(0, 1), (1, 2), (8, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (12, 1), (16, 1)],
  term ((80 : Rat) / 3) [(0, 1), (1, 2), (10, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(0, 1), (1, 2), (10, 2), (16, 1)],
  term ((184 : Rat) / 93) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1571 : Rat) / 186) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-76 : Rat) / 93) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((-236 : Rat) / 93) [(0, 1), (1, 2), (12, 1), (14, 1), (16, 1)],
  term ((1673 : Rat) / 186) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((237 : Rat) / 62) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((-1105 : Rat) / 372) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-307 : Rat) / 31) [(0, 1), (1, 2), (14, 2), (16, 1)],
  term ((-143 : Rat) / 62) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-985 : Rat) / 372) [(0, 1), (1, 2), (16, 1)],
  term ((104 : Rat) / 31) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((788 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((728 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4556 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((356 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3812 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (12, 2), (16, 1)],
  term ((64 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((1192 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((380 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((670 : Rat) / 31) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2494 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1334 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(0, 1), (2, 1), (5, 2), (14, 1), (16, 1)],
  term ((296 : Rat) / 93) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-728 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (14, 2), (16, 1)],
  term ((4556 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((232 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2836 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-664 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-836 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (14, 2), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (2, 1), (12, 2), (14, 1), (16, 1)],
  term ((418 : Rat) / 93) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (12, 3), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-836 : Rat) / 93) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 93) [(0, 1), (2, 1), (13, 2), (14, 1), (16, 1)],
  term ((418 : Rat) / 93) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 2), (12, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((316 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((316 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1864 : Rat) / 93) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-206 : Rat) / 93) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((932 : Rat) / 93) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((103 : Rat) / 93) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-206 : Rat) / 93) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-587 : Rat) / 31) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((932 : Rat) / 93) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (3, 2), (12, 2), (16, 1)],
  term ((980 : Rat) / 93) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((-58 : Rat) / 3) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((490 : Rat) / 31) [(0, 1), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((29 : Rat) / 3) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((490 : Rat) / 31) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58 : Rat) / 3) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((29 : Rat) / 3) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-144 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((166 : Rat) / 93) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-83 : Rat) / 93) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((166 : Rat) / 93) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-83 : Rat) / 93) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((2080 : Rat) / 93) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1040 : Rat) / 93) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((2080 : Rat) / 93) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1040 : Rat) / 93) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-416 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((400 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2464 : Rat) / 93) [(0, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-80 : Rat) / 3) [(0, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-200 : Rat) / 31) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((208 : Rat) / 31) [(0, 1), (10, 1), (12, 3), (16, 1)],
  term ((2464 : Rat) / 93) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((400 : Rat) / 31) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1232 : Rat) / 93) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-200 : Rat) / 31) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(0, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((452 : Rat) / 93) [(0, 1), (10, 2), (12, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((452 : Rat) / 93) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((368 : Rat) / 93) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-323 : Rat) / 93) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((323 : Rat) / 186) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-323 : Rat) / 93) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((353 : Rat) / 62) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-152 : Rat) / 93) [(0, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 93) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-152 : Rat) / 93) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 93) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((239 : Rat) / 93) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1673 : Rat) / 93) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-268 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1673 : Rat) / 186) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-267 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-985 : Rat) / 186) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-229 : Rat) / 186) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 1), (12, 1), (14, 3), (16, 1)],
  term ((-69 : Rat) / 62) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((2307 : Rat) / 124) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((767 : Rat) / 93) [(0, 1), (12, 2), (14, 2), (16, 1)],
  term ((267 : Rat) / 62) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((985 : Rat) / 372) [(0, 1), (12, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 1), (12, 3), (14, 1), (16, 1)],
  term ((-1673 : Rat) / 186) [(0, 1), (12, 3), (16, 1)],
  term ((-229 : Rat) / 186) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-985 : Rat) / 186) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-267 : Rat) / 31) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((229 : Rat) / 372) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((405 : Rat) / 62) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((985 : Rat) / 372) [(0, 1), (13, 2), (16, 1)],
  term ((-237 : Rat) / 62) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 1), (13, 4), (16, 1)],
  term ((42 : Rat) / 31) [(0, 2), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 2), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-142 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-292 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (1, 1), (4, 1), (9, 1), (16, 1)],
  term ((72 : Rat) / 31) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((652 : Rat) / 93) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (1, 1), (9, 1), (12, 1), (16, 1)],
  term ((487 : Rat) / 31) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-376 : Rat) / 93) [(0, 2), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((1277 : Rat) / 62) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-808 : Rat) / 93) [(0, 2), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-174 : Rat) / 31) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 31) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((347 : Rat) / 62) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-328 : Rat) / 93) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-99 : Rat) / 62) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1475 : Rat) / 124) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-312 : Rat) / 31) [(0, 2), (1, 2), (10, 1), (16, 1)],
  term ((42 : Rat) / 31) [(0, 2), (1, 2), (12, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (1, 2), (14, 1), (16, 1)],
  term ((73 : Rat) / 31) [(0, 2), (1, 2), (16, 1)],
  term ((32 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-178 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1906 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-596 : Rat) / 93) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-335 : Rat) / 31) [(0, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((1247 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((667 : Rat) / 93) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(0, 2), (2, 1), (5, 2), (16, 1)],
  term ((-148 : Rat) / 93) [(0, 2), (2, 1), (8, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 2), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(0, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1418 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((332 : Rat) / 93) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((980 : Rat) / 93) [(0, 2), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((836 : Rat) / 93) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 2), (2, 1), (14, 2), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 2), (2, 2), (14, 1), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1864 : Rat) / 93) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((206 : Rat) / 93) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-980 : Rat) / 93) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((58 : Rat) / 3) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 2), (4, 1), (14, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 31) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-166 : Rat) / 93) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2080 : Rat) / 93) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 31) [(0, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 2), (10, 1), (12, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-400 : Rat) / 31) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-2464 : Rat) / 93) [(0, 2), (10, 1), (14, 2), (16, 1)],
  term ((904 : Rat) / 93) [(0, 2), (10, 2), (14, 1), (16, 1)],
  term ((-368 : Rat) / 93) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((323 : Rat) / 93) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 93) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-1454 : Rat) / 93) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 2), (12, 1), (14, 2), (16, 1)],
  term ((-73 : Rat) / 62) [(0, 2), (12, 2), (16, 1)],
  term ((-69 : Rat) / 31) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((73 : Rat) / 31) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-73 : Rat) / 62) [(0, 2), (13, 2), (16, 1)],
  term ((267 : Rat) / 31) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((985 : Rat) / 186) [(0, 2), (14, 1), (16, 1)],
  term ((229 : Rat) / 186) [(0, 2), (14, 2), (16, 1)],
  term ((490 : Rat) / 31) [(0, 2), (14, 3), (16, 1)],
  term ((104 : Rat) / 31) [(0, 3), (1, 1), (11, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 3), (1, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 3), (2, 1), (4, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 3), (2, 1), (12, 1), (16, 1)],
  term ((-245 : Rat) / 93) [(0, 3), (2, 1), (14, 1), (16, 1)],
  term ((-418 : Rat) / 93) [(0, 3), (2, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 3), (2, 2), (16, 1)],
  term ((490 : Rat) / 93) [(0, 3), (3, 1), (5, 1), (16, 1)],
  term ((158 : Rat) / 93) [(0, 3), (3, 1), (11, 1), (16, 1)],
  term ((-932 : Rat) / 93) [(0, 3), (3, 1), (13, 1), (16, 1)],
  term ((-103 : Rat) / 93) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 3), (3, 2), (16, 1)],
  term ((245 : Rat) / 31) [(0, 3), (4, 1), (14, 1), (16, 1)],
  term ((-29 : Rat) / 3) [(0, 3), (4, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 3), (5, 1), (9, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((83 : Rat) / 93) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((1040 : Rat) / 93) [(0, 3), (8, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 3), (9, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 3), (10, 1), (12, 1), (16, 1)],
  term ((1856 : Rat) / 93) [(0, 3), (10, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 31) [(0, 3), (10, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(0, 3), (10, 2), (16, 1)],
  term ((184 : Rat) / 93) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((-323 : Rat) / 186) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-76 : Rat) / 93) [(0, 3), (11, 2), (16, 1)],
  term ((16 : Rat) / 93) [(0, 3), (12, 1), (14, 1), (16, 1)],
  term ((1673 : Rat) / 186) [(0, 3), (12, 1), (16, 1)],
  term ((69 : Rat) / 62) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 3), (13, 2), (16, 1)],
  term ((-1105 : Rat) / 372) [(0, 3), (14, 1), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 3), (14, 2), (16, 1)],
  term ((-267 : Rat) / 62) [(0, 3), (15, 2), (16, 1)],
  term ((-985 : Rat) / 372) [(0, 3), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 4), (10, 1), (16, 1)],
  term ((73 : Rat) / 62) [(0, 4), (16, 1)],
  term ((-64 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((788 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((728 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4556 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((356 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((3812 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((1192 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (15, 3), (16, 1)],
  term ((380 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((670 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (12, 2), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2242 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (13, 2), (16, 1)],
  term ((-394 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1334 : Rat) / 93) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((296 : Rat) / 93) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-728 : Rat) / 93) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4556 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2278 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2836 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-664 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (12, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (13, 2), (16, 1)],
  term ((-316 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((158 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)],
  term ((-316 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((158 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((-584 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((-284 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((342 : Rat) / 31) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((292 : Rat) / 93) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((-284 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-584 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((142 : Rat) / 93) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((292 : Rat) / 93) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (12, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((974 : Rat) / 31) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-487 : Rat) / 31) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (12, 3), (16, 1)],
  term ((974 : Rat) / 31) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-487 : Rat) / 31) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-752 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((376 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-752 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((376 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((861 : Rat) / 31) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-861 : Rat) / 62) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((861 : Rat) / 31) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-861 : Rat) / 62) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1616 : Rat) / 93) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((808 : Rat) / 93) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((400 : Rat) / 31) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((68 : Rat) / 31) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1718 : Rat) / 93) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-200 : Rat) / 31) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((808 : Rat) / 93) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((68 : Rat) / 31) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((400 : Rat) / 31) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34 : Rat) / 31) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-200 : Rat) / 31) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-656 : Rat) / 93) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1216 : Rat) / 93) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((347 : Rat) / 31) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-179 : Rat) / 62) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((-1183 : Rat) / 62) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-223 : Rat) / 31) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((860 : Rat) / 93) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((328 : Rat) / 93) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((917 : Rat) / 62) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1183 : Rat) / 124) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (12, 3), (13, 1), (16, 1)],
  term ((-347 : Rat) / 62) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-223 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1183 : Rat) / 62) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1763 : Rat) / 186) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((925 : Rat) / 372) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((608 : Rat) / 93) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((328 : Rat) / 93) [(1, 1), (13, 3), (16, 1)],
  term ((32 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-178 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1906 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-596 : Rat) / 93) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-335 : Rat) / 31) [(1, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((1247 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((415 : Rat) / 93) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 2), (2, 1), (5, 2), (16, 1)],
  term ((-148 : Rat) / 93) [(1, 2), (2, 1), (8, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 2), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1418 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((332 : Rat) / 93) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((284 : Rat) / 93) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((584 : Rat) / 93) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-974 : Rat) / 31) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((752 : Rat) / 93) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-416 : Rat) / 31) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 31) [(1, 2), (10, 1), (12, 2), (16, 1)],
  term ((-416 : Rat) / 31) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 31) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-861 : Rat) / 31) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((1616 : Rat) / 93) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-68 : Rat) / 31) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-400 : Rat) / 31) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((73 : Rat) / 31) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((-347 : Rat) / 31) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((53 : Rat) / 31) [(1, 2), (12, 2), (14, 1), (16, 1)],
  term ((-73 : Rat) / 62) [(1, 2), (12, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 2), (12, 3), (16, 1)],
  term ((1402 : Rat) / 93) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((875 : Rat) / 93) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-73 : Rat) / 62) [(1, 2), (13, 2), (16, 1)],
  term ((223 : Rat) / 31) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((1183 : Rat) / 62) [(1, 2), (15, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 3), (2, 1), (5, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 3), (3, 1), (4, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(1, 3), (3, 1), (10, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 3), (3, 1), (12, 1), (16, 1)],
  term ((-142 : Rat) / 93) [(1, 3), (3, 1), (14, 1), (16, 1)],
  term ((-292 : Rat) / 93) [(1, 3), (3, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 3), (4, 1), (9, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 3), (4, 1), (11, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 3), (4, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 3), (9, 1), (12, 1), (16, 1)],
  term ((487 : Rat) / 31) [(1, 3), (9, 1), (16, 1)],
  term ((-376 : Rat) / 93) [(1, 3), (10, 1), (11, 1), (16, 1)],
  term ((1693 : Rat) / 62) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((-808 : Rat) / 93) [(1, 3), (11, 1), (12, 1), (16, 1)],
  term ((34 : Rat) / 31) [(1, 3), (11, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 31) [(1, 3), (11, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 3), (12, 1), (13, 1), (16, 1)],
  term ((179 : Rat) / 62) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-608 : Rat) / 93) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((-328 : Rat) / 93) [(1, 3), (13, 1), (16, 1)],
  term ((-347 : Rat) / 62) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1475 : Rat) / 124) [(1, 3), (15, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(1, 4), (10, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 4), (12, 1), (16, 1)],
  term (1 : Rat) [(1, 4), (14, 1), (16, 1)],
  term ((73 : Rat) / 62) [(1, 4), (16, 1)],
  term ((64 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((788 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((788 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-110 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 3), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 93) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((221 : Rat) / 93) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-788 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((110 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-728 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-728 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (12, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((4556 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((178 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1578 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-3812 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1906 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3812 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1906 : Rat) / 93) [(2, 1), (4, 1), (11, 2), (13, 2), (16, 1)],
  term ((-64 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1192 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (4, 1), (12, 2), (15, 2), (16, 1)],
  term ((596 : Rat) / 93) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((-1192 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((596 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((190 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-380 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((190 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-670 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((335 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-670 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((335 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((2494 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((788 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-110 : Rat) / 31) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((1334 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(2, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(2, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((197 : Rat) / 31) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (5, 1), (12, 3), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(2, 1), (5, 1), (12, 3), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1334 : Rat) / 93) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-55 : Rat) / 31) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609 : Rat) / 31) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(2, 1), (5, 1), (13, 3), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 1), (5, 2), (12, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((-296 : Rat) / 93) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((148 : Rat) / 93) [(2, 1), (8, 1), (12, 2), (16, 1)],
  term ((-296 : Rat) / 93) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((148 : Rat) / 93) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((728 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((8 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((182 : Rat) / 31) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (12, 3), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 1), (9, 1), (13, 3), (16, 1)],
  term ((-884 : Rat) / 93) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-221 : Rat) / 31) [(2, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (10, 1), (12, 3), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 93) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2836 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1480 : Rat) / 31) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((664 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1418 : Rat) / 93) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-332 : Rat) / 93) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(2, 1), (11, 1), (12, 3), (13, 1), (16, 1)],
  term ((116 : Rat) / 93) [(2, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((664 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-740 : Rat) / 31) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1056 : Rat) / 31) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((1418 : Rat) / 93) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNNY_block_30_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_30_0000_0099
      rs_R009_ueqv_R009NNNNY_block_30_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
