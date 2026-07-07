/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 14:0-14

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 : Poly :=
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
def rs_R009_ueqv_R009NNNNY_coefficient_14_0000 : Poly :=
[
  term ((-36 : Rat) / 31) [(0, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0000 : Poly :=
[
  term ((72 : Rat) / 31) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-36 : Rat) / 31) [(0, 1), (2, 2), (16, 1)],
  term ((72 : Rat) / 31) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-36 : Rat) / 31) [(0, 1), (3, 2), (16, 1)],
  term ((-72 : Rat) / 31) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 31) [(0, 1), (10, 2), (16, 1)],
  term ((36 : Rat) / 31) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0000
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0001 : Poly :=
[
  term ((-64 : Rat) / 31) [(2, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0001 : Poly :=
[
  term ((128 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-64 : Rat) / 31) [(2, 1), (3, 2), (16, 1)],
  term ((-128 : Rat) / 31) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-128 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((64 : Rat) / 31) [(2, 1), (10, 2), (16, 1)],
  term ((64 : Rat) / 31) [(2, 1), (11, 2), (16, 1)],
  term ((128 : Rat) / 31) [(2, 2), (4, 1), (16, 1)],
  term ((-64 : Rat) / 31) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0001
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0002 : Poly :=
[
  term ((182 : Rat) / 93) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0002 : Poly :=
[
  term ((-364 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((182 : Rat) / 93) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((182 : Rat) / 93) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0002
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0003 : Poly :=
[
  term (9 : Rat) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0003 : Poly :=
[
  term (-18 : Rat) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term (9 : Rat) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term (-9 : Rat) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (11, 3), (16, 1)],
  term (-18 : Rat) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term (9 : Rat) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0003
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0004 : Poly :=
[
  term ((-1139 : Rat) / 93) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0004 : Poly :=
[
  term ((2278 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0004
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0005 : Poly :=
[
  term ((116 : Rat) / 93) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0005 : Poly :=
[
  term ((-232 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((116 : Rat) / 93) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((116 : Rat) / 93) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((232 : Rat) / 93) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 1), (11, 3), (16, 1)],
  term ((232 : Rat) / 93) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0005
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0006 : Poly :=
[
  term ((205 : Rat) / 93) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0006 : Poly :=
[
  term ((-410 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 93) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((205 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 93) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 93) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-205 : Rat) / 93) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((410 : Rat) / 93) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0006
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0007 : Poly :=
[
  term ((-211 : Rat) / 93) [(8, 1), (16, 1)]
]

/-- Partial product 7 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0007 : Poly :=
[
  term ((422 : Rat) / 93) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-211 : Rat) / 93) [(2, 2), (8, 1), (16, 1)],
  term ((422 : Rat) / 93) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-211 : Rat) / 93) [(3, 2), (8, 1), (16, 1)],
  term ((-422 : Rat) / 93) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-422 : Rat) / 93) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((211 : Rat) / 93) [(8, 1), (10, 2), (16, 1)],
  term ((211 : Rat) / 93) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0007
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0008 : Poly :=
[
  term ((56 : Rat) / 31) [(10, 1), (16, 1)]
]

/-- Partial product 8 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0008 : Poly :=
[
  term ((-112 : Rat) / 31) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((56 : Rat) / 31) [(2, 2), (10, 1), (16, 1)],
  term ((-112 : Rat) / 31) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((56 : Rat) / 31) [(3, 2), (10, 1), (16, 1)],
  term ((112 : Rat) / 31) [(4, 1), (10, 2), (16, 1)],
  term ((112 : Rat) / 31) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-56 : Rat) / 31) [(10, 1), (11, 2), (16, 1)],
  term ((-56 : Rat) / 31) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0008
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0009 : Poly :=
[
  term ((-116 : Rat) / 93) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0009 : Poly :=
[
  term ((232 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0009
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0010 : Poly :=
[
  term ((-8 : Rat) / 93) [(12, 1), (16, 1)]
]

/-- Partial product 10 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0010 : Poly :=
[
  term ((16 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 2), (12, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(10, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0010
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0011 : Poly :=
[
  term ((16 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0011 : Poly :=
[
  term ((-32 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0011
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0012 : Poly :=
[
  term ((362 : Rat) / 93) [(14, 1), (16, 1)]
]

/-- Partial product 12 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0012 : Poly :=
[
  term ((-724 : Rat) / 93) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((362 : Rat) / 93) [(2, 2), (14, 1), (16, 1)],
  term ((-724 : Rat) / 93) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((362 : Rat) / 93) [(3, 2), (14, 1), (16, 1)],
  term ((724 : Rat) / 93) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((724 : Rat) / 93) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-362 : Rat) / 93) [(10, 2), (14, 1), (16, 1)],
  term ((-362 : Rat) / 93) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0012
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0013 : Poly :=
[
  term ((-8 : Rat) / 93) [(15, 2), (16, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0013 : Poly :=
[
  term ((16 : Rat) / 93) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(10, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0013
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNNY_coefficient_14_0014 : Poly :=
[
  term ((-39 : Rat) / 124) [(16, 1)]
]

/-- Partial product 14 for generator 14. -/
def rs_R009_ueqv_R009NNNNY_partial_14_0014 : Poly :=
[
  term ((39 : Rat) / 62) [(2, 1), (4, 1), (16, 1)],
  term ((-39 : Rat) / 124) [(2, 2), (16, 1)],
  term ((39 : Rat) / 62) [(3, 1), (5, 1), (16, 1)],
  term ((-39 : Rat) / 124) [(3, 2), (16, 1)],
  term ((-39 : Rat) / 62) [(4, 1), (10, 1), (16, 1)],
  term ((-39 : Rat) / 62) [(5, 1), (11, 1), (16, 1)],
  term ((39 : Rat) / 124) [(10, 2), (16, 1)],
  term ((39 : Rat) / 124) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R009_ueqv_R009NNNNY_partial_14_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_14_0014
        rs_R009_ueqv_R009NNNNY_generator_14_0000_0014 =
      rs_R009_ueqv_R009NNNNY_partial_14_0014 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_14_0000_0014 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_14_0000,
  rs_R009_ueqv_R009NNNNY_partial_14_0001,
  rs_R009_ueqv_R009NNNNY_partial_14_0002,
  rs_R009_ueqv_R009NNNNY_partial_14_0003,
  rs_R009_ueqv_R009NNNNY_partial_14_0004,
  rs_R009_ueqv_R009NNNNY_partial_14_0005,
  rs_R009_ueqv_R009NNNNY_partial_14_0006,
  rs_R009_ueqv_R009NNNNY_partial_14_0007,
  rs_R009_ueqv_R009NNNNY_partial_14_0008,
  rs_R009_ueqv_R009NNNNY_partial_14_0009,
  rs_R009_ueqv_R009NNNNY_partial_14_0010,
  rs_R009_ueqv_R009NNNNY_partial_14_0011,
  rs_R009_ueqv_R009NNNNY_partial_14_0012,
  rs_R009_ueqv_R009NNNNY_partial_14_0013,
  rs_R009_ueqv_R009NNNNY_partial_14_0014
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_14_0000_0014 : Poly :=
[
  term ((72 : Rat) / 31) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-36 : Rat) / 31) [(0, 1), (2, 2), (16, 1)],
  term ((72 : Rat) / 31) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-36 : Rat) / 31) [(0, 1), (3, 2), (16, 1)],
  term ((-72 : Rat) / 31) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 31) [(0, 1), (10, 2), (16, 1)],
  term ((36 : Rat) / 31) [(0, 1), (11, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term (-18 : Rat) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((128 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-64 : Rat) / 31) [(2, 1), (3, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-410 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((422 : Rat) / 93) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-240 : Rat) / 31) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((232 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724 : Rat) / 93) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((39 : Rat) / 62) [(2, 1), (4, 1), (16, 1)],
  term ((-128 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((64 : Rat) / 31) [(2, 1), (10, 2), (16, 1)],
  term ((64 : Rat) / 31) [(2, 1), (11, 2), (16, 1)],
  term ((182 : Rat) / 93) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term (9 : Rat) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((128 : Rat) / 31) [(2, 2), (4, 1), (16, 1)],
  term ((116 : Rat) / 93) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((205 : Rat) / 93) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-211 : Rat) / 93) [(2, 2), (8, 1), (16, 1)],
  term ((56 : Rat) / 31) [(2, 2), (10, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((362 : Rat) / 93) [(2, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (15, 2), (16, 1)],
  term ((-39 : Rat) / 124) [(2, 2), (16, 1)],
  term ((-64 : Rat) / 31) [(2, 3), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((422 : Rat) / 93) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-112 : Rat) / 31) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((232 : Rat) / 93) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724 : Rat) / 93) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((39 : Rat) / 62) [(3, 1), (5, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-410 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term (-9 : Rat) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (11, 3), (16, 1)],
  term ((-364 : Rat) / 93) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-1558 : Rat) / 93) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((205 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-211 : Rat) / 93) [(3, 2), (8, 1), (16, 1)],
  term ((56 : Rat) / 31) [(3, 2), (10, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 2), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((362 : Rat) / 93) [(3, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 2), (15, 2), (16, 1)],
  term ((-39 : Rat) / 124) [(3, 2), (16, 1)],
  term ((182 : Rat) / 93) [(3, 3), (9, 1), (16, 1)],
  term (9 : Rat) [(3, 3), (11, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(3, 3), (13, 1), (16, 1)],
  term ((232 : Rat) / 93) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((410 : Rat) / 93) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-422 : Rat) / 93) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((32 : Rat) / 93) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((724 : Rat) / 93) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-39 : Rat) / 62) [(4, 1), (10, 1), (16, 1)],
  term ((112 : Rat) / 31) [(4, 1), (10, 2), (16, 1)],
  term ((-422 : Rat) / 93) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((112 : Rat) / 31) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-205 : Rat) / 93) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((32 : Rat) / 93) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((724 : Rat) / 93) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39 : Rat) / 62) [(5, 1), (11, 1), (16, 1)],
  term ((-437 : Rat) / 93) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 1), (11, 3), (16, 1)],
  term ((410 : Rat) / 93) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(5, 2), (11, 2), (16, 1)],
  term ((211 : Rat) / 93) [(8, 1), (10, 2), (16, 1)],
  term ((211 : Rat) / 93) [(8, 1), (11, 2), (16, 1)],
  term ((-56 : Rat) / 31) [(10, 1), (11, 2), (16, 1)],
  term ((116 : Rat) / 93) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(10, 2), (12, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-362 : Rat) / 93) [(10, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(10, 2), (15, 2), (16, 1)],
  term ((39 : Rat) / 124) [(10, 2), (16, 1)],
  term ((-56 : Rat) / 31) [(10, 3), (16, 1)],
  term ((8 : Rat) / 93) [(11, 2), (12, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-362 : Rat) / 93) [(11, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(11, 2), (15, 2), (16, 1)],
  term ((39 : Rat) / 124) [(11, 2), (16, 1)],
  term ((116 : Rat) / 93) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 14. -/
theorem rs_R009_ueqv_R009NNNNY_block_14_0000_0014_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_14_0000_0014
      rs_R009_ueqv_R009NNNNY_block_14_0000_0014 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
