/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 9:0-23

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 : Poly :=
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
def rs_R009_ueqv_R009NNNNY_coefficient_09_0000 : Poly :=
[
  term ((-28 : Rat) / 93) [(0, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0000 : Poly :=
[
  term ((56 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((-56 : Rat) / 93) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 93) [(0, 1), (2, 2), (16, 1)],
  term ((-28 : Rat) / 93) [(0, 1), (3, 2), (16, 1)],
  term ((28 : Rat) / 93) [(0, 1), (12, 2), (16, 1)],
  term ((28 : Rat) / 93) [(0, 1), (13, 2), (16, 1)],
  term ((56 : Rat) / 93) [(0, 2), (2, 1), (16, 1)],
  term ((-56 : Rat) / 93) [(0, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0000
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0001 : Poly :=
[
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0001 : Poly :=
[
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 3), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0001
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0002 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0002 : Poly :=
[
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (13, 3), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0002
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0003 : Poly :=
[
  term ((-130 : Rat) / 93) [(2, 1), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0003 : Poly :=
[
  term ((-260 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((260 : Rat) / 93) [(0, 1), (2, 2), (16, 1)],
  term ((260 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-260 : Rat) / 93) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-130 : Rat) / 93) [(2, 1), (3, 2), (16, 1)],
  term ((130 : Rat) / 93) [(2, 1), (12, 2), (16, 1)],
  term ((130 : Rat) / 93) [(2, 1), (13, 2), (16, 1)],
  term ((-130 : Rat) / 93) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0003
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0004 : Poly :=
[
  term ((-158 : Rat) / 93) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0004 : Poly :=
[
  term ((316 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((158 : Rat) / 93) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((158 : Rat) / 93) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-158 : Rat) / 93) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0004
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0005 : Poly :=
[
  term ((458 : Rat) / 93) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0005 : Poly :=
[
  term ((-916 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((916 : Rat) / 93) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((916 : Rat) / 93) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-916 : Rat) / 93) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((458 : Rat) / 93) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-458 : Rat) / 93) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-458 : Rat) / 93) [(3, 1), (13, 3), (16, 1)],
  term ((458 : Rat) / 93) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0005
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0006 : Poly :=
[
  term ((197 : Rat) / 93) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0006 : Poly :=
[
  term ((-394 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0006
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0007 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 2), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0007 : Poly :=
[
  term ((884 : Rat) / 93) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 3), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 2), (3, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (12, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (13, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0007
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0008 : Poly :=
[
  term ((-245 : Rat) / 93) [(4, 1), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0008 : Poly :=
[
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((490 : Rat) / 93) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-245 : Rat) / 93) [(2, 2), (4, 1), (16, 1)],
  term ((-245 : Rat) / 93) [(3, 2), (4, 1), (16, 1)],
  term ((245 : Rat) / 93) [(4, 1), (12, 2), (16, 1)],
  term ((245 : Rat) / 93) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0008
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0009 : Poly :=
[
  term ((-16 : Rat) / 93) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0009 : Poly :=
[
  term ((32 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0009
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0010 : Poly :=
[
  term ((-197 : Rat) / 93) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0010 : Poly :=
[
  term ((394 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0010
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0011 : Poly :=
[
  term ((245 : Rat) / 93) [(8, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0011 : Poly :=
[
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((490 : Rat) / 93) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((245 : Rat) / 93) [(2, 2), (8, 1), (16, 1)],
  term ((245 : Rat) / 93) [(3, 2), (8, 1), (16, 1)],
  term ((-245 : Rat) / 93) [(8, 1), (12, 2), (16, 1)],
  term ((-245 : Rat) / 93) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0011
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0012 : Poly :=
[
  term ((-364 : Rat) / 93) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0012 : Poly :=
[
  term ((728 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-728 : Rat) / 93) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((728 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-728 : Rat) / 93) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((364 : Rat) / 93) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0012
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0013 : Poly :=
[
  term ((182 : Rat) / 93) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0013 : Poly :=
[
  term ((-364 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((182 : Rat) / 93) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((182 : Rat) / 93) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0013
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0014 : Poly :=
[
  term ((16 : Rat) / 93) [(10, 1), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0014 : Poly :=
[
  term ((-32 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 2), (10, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 2), (10, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(10, 1), (12, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0014
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0015 : Poly :=
[
  term ((955 : Rat) / 93) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0015 : Poly :=
[
  term ((-1910 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((1910 : Rat) / 93) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1910 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((1910 : Rat) / 93) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((955 : Rat) / 93) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((955 : Rat) / 93) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-955 : Rat) / 93) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-955 : Rat) / 93) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0015
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0016 : Poly :=
[
  term ((565 : Rat) / 93) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0016 : Poly :=
[
  term ((-1130 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1130 : Rat) / 93) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1130 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((1130 : Rat) / 93) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((565 : Rat) / 93) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((565 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-565 : Rat) / 93) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-565 : Rat) / 93) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0016
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0017 : Poly :=
[
  term ((-425 : Rat) / 93) [(11, 2), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0017 : Poly :=
[
  term ((850 : Rat) / 93) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-850 : Rat) / 93) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((850 : Rat) / 93) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-850 : Rat) / 93) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-425 : Rat) / 93) [(2, 2), (11, 2), (16, 1)],
  term ((-425 : Rat) / 93) [(3, 2), (11, 2), (16, 1)],
  term ((425 : Rat) / 93) [(11, 2), (12, 2), (16, 1)],
  term ((425 : Rat) / 93) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0017
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0018 : Poly :=
[
  term ((8 : Rat) / 93) [(12, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0018 : Poly :=
[
  term ((-16 : Rat) / 93) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(0, 1), (12, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(12, 1), (13, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0018
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0019 : Poly :=
[
  term ((-668 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0019 : Poly :=
[
  term ((1336 : Rat) / 93) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1336 : Rat) / 93) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1336 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1336 : Rat) / 93) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-668 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-668 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((668 : Rat) / 93) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((668 : Rat) / 93) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0019
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0020 : Poly :=
[
  term ((42 : Rat) / 31) [(13, 2), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0020 : Poly :=
[
  term ((-84 : Rat) / 31) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (13, 3), (16, 1)],
  term ((42 : Rat) / 31) [(2, 2), (13, 2), (16, 1)],
  term ((42 : Rat) / 31) [(3, 2), (13, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(12, 2), (13, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0020
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0021 : Poly :=
[
  term ((318 : Rat) / 31) [(14, 1), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0021 : Poly :=
[
  term ((-636 : Rat) / 31) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((636 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-636 : Rat) / 31) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((636 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((318 : Rat) / 31) [(2, 2), (14, 1), (16, 1)],
  term ((318 : Rat) / 31) [(3, 2), (14, 1), (16, 1)],
  term ((-318 : Rat) / 31) [(12, 2), (14, 1), (16, 1)],
  term ((-318 : Rat) / 31) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0021
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0022 : Poly :=
[
  term ((8 : Rat) / 93) [(15, 2), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0022 : Poly :=
[
  term ((-16 : Rat) / 93) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 93) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(12, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0022
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNNY_coefficient_09_0023 : Poly :=
[
  term ((-895 : Rat) / 186) [(16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R009_ueqv_R009NNNNY_partial_09_0023 : Poly :=
[
  term ((895 : Rat) / 93) [(0, 1), (2, 1), (16, 1)],
  term ((-895 : Rat) / 93) [(0, 1), (12, 1), (16, 1)],
  term ((895 : Rat) / 93) [(1, 1), (3, 1), (16, 1)],
  term ((-895 : Rat) / 93) [(1, 1), (13, 1), (16, 1)],
  term ((-895 : Rat) / 186) [(2, 2), (16, 1)],
  term ((-895 : Rat) / 186) [(3, 2), (16, 1)],
  term ((895 : Rat) / 186) [(12, 2), (16, 1)],
  term ((895 : Rat) / 186) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R009_ueqv_R009NNNNY_partial_09_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_09_0023
        rs_R009_ueqv_R009NNNNY_generator_09_0000_0023 =
      rs_R009_ueqv_R009NNNNY_partial_09_0023 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_09_0000_0023 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_09_0000,
  rs_R009_ueqv_R009NNNNY_partial_09_0001,
  rs_R009_ueqv_R009NNNNY_partial_09_0002,
  rs_R009_ueqv_R009NNNNY_partial_09_0003,
  rs_R009_ueqv_R009NNNNY_partial_09_0004,
  rs_R009_ueqv_R009NNNNY_partial_09_0005,
  rs_R009_ueqv_R009NNNNY_partial_09_0006,
  rs_R009_ueqv_R009NNNNY_partial_09_0007,
  rs_R009_ueqv_R009NNNNY_partial_09_0008,
  rs_R009_ueqv_R009NNNNY_partial_09_0009,
  rs_R009_ueqv_R009NNNNY_partial_09_0010,
  rs_R009_ueqv_R009NNNNY_partial_09_0011,
  rs_R009_ueqv_R009NNNNY_partial_09_0012,
  rs_R009_ueqv_R009NNNNY_partial_09_0013,
  rs_R009_ueqv_R009NNNNY_partial_09_0014,
  rs_R009_ueqv_R009NNNNY_partial_09_0015,
  rs_R009_ueqv_R009NNNNY_partial_09_0016,
  rs_R009_ueqv_R009NNNNY_partial_09_0017,
  rs_R009_ueqv_R009NNNNY_partial_09_0018,
  rs_R009_ueqv_R009NNNNY_partial_09_0019,
  rs_R009_ueqv_R009NNNNY_partial_09_0020,
  rs_R009_ueqv_R009NNNNY_partial_09_0021,
  rs_R009_ueqv_R009NNNNY_partial_09_0022,
  rs_R009_ueqv_R009NNNNY_partial_09_0023
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_09_0000_0023 : Poly :=
[
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((56 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-56 : Rat) / 93) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((316 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-916 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((728 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-1910 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1130 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((850 : Rat) / 93) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-92 : Rat) / 31) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((1336 : Rat) / 93) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-636 : Rat) / 31) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((895 : Rat) / 93) [(0, 1), (2, 1), (16, 1)],
  term ((232 : Rat) / 93) [(0, 1), (2, 2), (16, 1)],
  term ((-316 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((916 : Rat) / 93) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-28 : Rat) / 93) [(0, 1), (3, 2), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-728 : Rat) / 93) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((1910 : Rat) / 93) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1130 : Rat) / 93) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850 : Rat) / 93) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1336 : Rat) / 93) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((636 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 93) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-895 : Rat) / 93) [(0, 1), (12, 1), (16, 1)],
  term ((44 : Rat) / 93) [(0, 1), (12, 2), (16, 1)],
  term ((28 : Rat) / 93) [(0, 1), (13, 2), (16, 1)],
  term ((56 : Rat) / 93) [(0, 2), (2, 1), (16, 1)],
  term ((-56 : Rat) / 93) [(0, 2), (12, 1), (16, 1)],
  term ((260 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-260 : Rat) / 93) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((490 : Rat) / 93) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((728 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-742 : Rat) / 31) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1130 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((850 : Rat) / 93) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((1730 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((790 : Rat) / 93) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-636 : Rat) / 31) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((895 : Rat) / 93) [(1, 1), (3, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((758 : Rat) / 93) [(1, 1), (3, 3), (16, 1)],
  term ((-490 : Rat) / 93) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((490 : Rat) / 93) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-728 : Rat) / 93) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((1130 : Rat) / 93) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1910 : Rat) / 93) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-850 : Rat) / 93) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((636 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-895 : Rat) / 93) [(1, 1), (13, 1), (16, 1)],
  term ((-1336 : Rat) / 93) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (13, 3), (16, 1)],
  term ((-168 : Rat) / 31) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (3, 2), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (13, 2), (16, 1)],
  term ((-130 : Rat) / 93) [(2, 1), (3, 2), (16, 1)],
  term ((130 : Rat) / 93) [(2, 1), (12, 2), (16, 1)],
  term ((130 : Rat) / 93) [(2, 1), (13, 2), (16, 1)],
  term ((-158 : Rat) / 93) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((458 : Rat) / 93) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 2), (3, 2), (16, 1)],
  term ((-245 : Rat) / 93) [(2, 2), (4, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 93) [(2, 2), (8, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 2), (10, 1), (16, 1)],
  term ((955 : Rat) / 93) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((565 : Rat) / 93) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-425 : Rat) / 93) [(2, 2), (11, 2), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (12, 1), (16, 1)],
  term ((-668 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(2, 2), (13, 2), (16, 1)],
  term ((318 : Rat) / 31) [(2, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (15, 2), (16, 1)],
  term ((-895 : Rat) / 186) [(2, 2), (16, 1)],
  term ((-130 : Rat) / 93) [(2, 3), (16, 1)],
  term ((158 : Rat) / 93) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((158 : Rat) / 93) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-458 : Rat) / 93) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-458 : Rat) / 93) [(3, 1), (13, 3), (16, 1)],
  term ((-245 : Rat) / 93) [(3, 2), (4, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 93) [(3, 2), (8, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 2), (10, 1), (16, 1)],
  term ((955 : Rat) / 93) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((565 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-425 : Rat) / 93) [(3, 2), (11, 2), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (12, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (12, 2), (16, 1)],
  term ((-668 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((568 : Rat) / 93) [(3, 2), (13, 2), (16, 1)],
  term ((318 : Rat) / 31) [(3, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (15, 2), (16, 1)],
  term ((-895 : Rat) / 186) [(3, 2), (16, 1)],
  term ((-158 : Rat) / 93) [(3, 3), (11, 1), (16, 1)],
  term ((458 : Rat) / 93) [(3, 3), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(3, 3), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 4), (16, 1)],
  term ((245 : Rat) / 93) [(4, 1), (12, 2), (16, 1)],
  term ((245 : Rat) / 93) [(4, 1), (13, 2), (16, 1)],
  term ((16 : Rat) / 93) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 1), (13, 3), (16, 1)],
  term ((-245 : Rat) / 93) [(8, 1), (12, 2), (16, 1)],
  term ((-245 : Rat) / 93) [(8, 1), (13, 2), (16, 1)],
  term ((364 : Rat) / 93) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((364 : Rat) / 93) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(9, 1), (13, 3), (16, 1)],
  term ((-16 : Rat) / 93) [(10, 1), (12, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(10, 1), (13, 2), (16, 1)],
  term ((-955 : Rat) / 93) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-565 : Rat) / 93) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-565 : Rat) / 93) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-955 : Rat) / 93) [(11, 1), (13, 3), (16, 1)],
  term ((425 : Rat) / 93) [(11, 2), (12, 2), (16, 1)],
  term ((425 : Rat) / 93) [(11, 2), (13, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(12, 1), (13, 2), (16, 1)],
  term ((668 : Rat) / 93) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(12, 2), (13, 2), (16, 1)],
  term ((-318 : Rat) / 31) [(12, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(12, 2), (15, 2), (16, 1)],
  term ((895 : Rat) / 186) [(12, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(12, 3), (16, 1)],
  term ((-318 : Rat) / 31) [(13, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(13, 2), (15, 2), (16, 1)],
  term ((895 : Rat) / 186) [(13, 2), (16, 1)],
  term ((668 : Rat) / 93) [(13, 3), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 23. -/
theorem rs_R009_ueqv_R009NNNNY_block_09_0000_0023_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_09_0000_0023
      rs_R009_ueqv_R009NNNNY_block_09_0000_0023 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
