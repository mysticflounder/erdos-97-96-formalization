/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 17:0-25

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0000 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0000 : Poly :=
[
  term ((84 : Rat) / 31) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0000
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0001 : Poly :=
[
  term ((182 : Rat) / 93) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0001 : Poly :=
[
  term ((364 : Rat) / 93) [(1, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0001
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0002 : Poly :=
[
  term ((-72 : Rat) / 31) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0002 : Poly :=
[
  term ((-144 : Rat) / 31) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0002
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0003 : Poly :=
[
  term ((-652 : Rat) / 93) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0003 : Poly :=
[
  term ((-1304 : Rat) / 93) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0003
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0004 : Poly :=
[
  term ((29 : Rat) / 93) [(2, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0004 : Poly :=
[
  term ((58 : Rat) / 93) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-29 : Rat) / 93) [(2, 1), (4, 2), (16, 1)],
  term ((58 : Rat) / 93) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-29 : Rat) / 93) [(2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0004
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0005 : Poly :=
[
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0005 : Poly :=
[
  term ((884 : Rat) / 93) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((884 : Rat) / 93) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0005
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0006 : Poly :=
[
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0006 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (5, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0006
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0007 : Poly :=
[
  term ((1279 : Rat) / 93) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0007 : Poly :=
[
  term ((2558 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1279 : Rat) / 93) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((2558 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1279 : Rat) / 93) [(3, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0007
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0008 : Poly :=
[
  term ((-1123 : Rat) / 93) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0008 : Poly :=
[
  term ((-2246 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((1123 : Rat) / 93) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-2246 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((1123 : Rat) / 93) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0008
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0009 : Poly :=
[
  term ((14 : Rat) / 3) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0009 : Poly :=
[
  term ((28 : Rat) / 3) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0009
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0010 : Poly :=
[
  term ((8 : Rat) / 93) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 10 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0010 : Poly :=
[
  term ((16 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 2), (7, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0010
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0011 : Poly :=
[
  term ((-190 : Rat) / 93) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 11 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0011 : Poly :=
[
  term ((-380 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((190 : Rat) / 93) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((190 : Rat) / 93) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0011
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0012 : Poly :=
[
  term ((-947 : Rat) / 93) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0012 : Poly :=
[
  term ((-1894 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((947 : Rat) / 93) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1894 : Rat) / 93) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((947 : Rat) / 93) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0012
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0013 : Poly :=
[
  term ((1231 : Rat) / 93) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0013 : Poly :=
[
  term ((2462 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1231 : Rat) / 93) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((2462 : Rat) / 93) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1231 : Rat) / 93) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0013
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0014 : Poly :=
[
  term ((667 : Rat) / 93) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0014 : Poly :=
[
  term ((1334 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((1334 : Rat) / 93) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0014
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0015 : Poly :=
[
  term ((-8 : Rat) / 93) [(5, 2), (16, 1)]
]

/-- Partial product 15 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0015 : Poly :=
[
  term ((-16 : Rat) / 93) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (5, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 3), (7, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0015
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0016 : Poly :=
[
  term ((-371 : Rat) / 93) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0016 : Poly :=
[
  term ((-742 : Rat) / 93) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((371 : Rat) / 93) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-742 : Rat) / 93) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((371 : Rat) / 93) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0016
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0017 : Poly :=
[
  term ((-121 : Rat) / 93) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0017 : Poly :=
[
  term ((-242 : Rat) / 93) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((121 : Rat) / 93) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-242 : Rat) / 93) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((121 : Rat) / 93) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0017
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0018 : Poly :=
[
  term ((8 : Rat) / 93) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0018 : Poly :=
[
  term ((16 : Rat) / 93) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0018
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0019 : Poly :=
[
  term ((-271 : Rat) / 186) [(10, 1), (16, 1)]
]

/-- Partial product 19 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0019 : Poly :=
[
  term ((-271 : Rat) / 93) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((271 : Rat) / 186) [(4, 2), (10, 1), (16, 1)],
  term ((-271 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((271 : Rat) / 186) [(5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0019
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0020 : Poly :=
[
  term (-3 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0020 : Poly :=
[
  term (-6 : Rat) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0020
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0021 : Poly :=
[
  term ((-257 : Rat) / 93) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0021 : Poly :=
[
  term ((-514 : Rat) / 93) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((257 : Rat) / 93) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-514 : Rat) / 93) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((257 : Rat) / 93) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0021
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0022 : Poly :=
[
  term ((452 : Rat) / 93) [(11, 2), (16, 1)]
]

/-- Partial product 22 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0022 : Poly :=
[
  term ((904 : Rat) / 93) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-452 : Rat) / 93) [(4, 2), (11, 2), (16, 1)],
  term ((904 : Rat) / 93) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-452 : Rat) / 93) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0022
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0023 : Poly :=
[
  term ((121 : Rat) / 186) [(12, 1), (16, 1)]
]

/-- Partial product 23 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0023 : Poly :=
[
  term ((121 : Rat) / 93) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(4, 2), (12, 1), (16, 1)],
  term ((121 : Rat) / 93) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0023
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0024 : Poly :=
[
  term ((-512 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0024 : Poly :=
[
  term ((-1024 : Rat) / 93) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 93) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 93) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 93) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0024
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNNY_coefficient_17_0025 : Poly :=
[
  term ((23 : Rat) / 93) [(16, 1)]
]

/-- Partial product 25 for generator 17. -/
def rs_R009_ueqv_R009NNNNY_partial_17_0025 : Poly :=
[
  term ((46 : Rat) / 93) [(4, 1), (6, 1), (16, 1)],
  term ((-23 : Rat) / 93) [(4, 2), (16, 1)],
  term ((46 : Rat) / 93) [(5, 1), (7, 1), (16, 1)],
  term ((-23 : Rat) / 93) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem rs_R009_ueqv_R009NNNNY_partial_17_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_17_0025
        rs_R009_ueqv_R009NNNNY_generator_17_0000_0025 =
      rs_R009_ueqv_R009NNNNY_partial_17_0025 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_17_0000_0025 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_17_0000,
  rs_R009_ueqv_R009NNNNY_partial_17_0001,
  rs_R009_ueqv_R009NNNNY_partial_17_0002,
  rs_R009_ueqv_R009NNNNY_partial_17_0003,
  rs_R009_ueqv_R009NNNNY_partial_17_0004,
  rs_R009_ueqv_R009NNNNY_partial_17_0005,
  rs_R009_ueqv_R009NNNNY_partial_17_0006,
  rs_R009_ueqv_R009NNNNY_partial_17_0007,
  rs_R009_ueqv_R009NNNNY_partial_17_0008,
  rs_R009_ueqv_R009NNNNY_partial_17_0009,
  rs_R009_ueqv_R009NNNNY_partial_17_0010,
  rs_R009_ueqv_R009NNNNY_partial_17_0011,
  rs_R009_ueqv_R009NNNNY_partial_17_0012,
  rs_R009_ueqv_R009NNNNY_partial_17_0013,
  rs_R009_ueqv_R009NNNNY_partial_17_0014,
  rs_R009_ueqv_R009NNNNY_partial_17_0015,
  rs_R009_ueqv_R009NNNNY_partial_17_0016,
  rs_R009_ueqv_R009NNNNY_partial_17_0017,
  rs_R009_ueqv_R009NNNNY_partial_17_0018,
  rs_R009_ueqv_R009NNNNY_partial_17_0019,
  rs_R009_ueqv_R009NNNNY_partial_17_0020,
  rs_R009_ueqv_R009NNNNY_partial_17_0021,
  rs_R009_ueqv_R009NNNNY_partial_17_0022,
  rs_R009_ueqv_R009NNNNY_partial_17_0023,
  rs_R009_ueqv_R009NNNNY_partial_17_0024,
  rs_R009_ueqv_R009NNNNY_partial_17_0025
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_17_0000_0025 : Poly :=
[
  term ((84 : Rat) / 31) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (5, 3), (16, 1)],
  term ((58 : Rat) / 93) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-29 : Rat) / 93) [(2, 1), (4, 2), (16, 1)],
  term ((58 : Rat) / 93) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-29 : Rat) / 93) [(2, 1), (5, 2), (16, 1)],
  term ((884 : Rat) / 93) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((2558 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-2246 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 3) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-1279 : Rat) / 93) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((1123 : Rat) / 93) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((2558 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2246 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 3) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((1105 : Rat) / 93) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-1279 : Rat) / 93) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((1123 : Rat) / 93) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 3), (16, 1)],
  term ((16 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1894 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((2462 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((1334 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-742 : Rat) / 93) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-242 : Rat) / 93) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-271 : Rat) / 93) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-514 : Rat) / 93) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((904 : Rat) / 93) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((121 : Rat) / 93) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-1024 : Rat) / 93) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 93) [(4, 1), (6, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((190 : Rat) / 93) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((947 : Rat) / 93) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1231 : Rat) / 93) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (5, 2), (16, 1)],
  term ((371 : Rat) / 93) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((121 : Rat) / 93) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((271 : Rat) / 186) [(4, 2), (10, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((257 : Rat) / 93) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(4, 2), (11, 2), (16, 1)],
  term ((-121 : Rat) / 186) [(4, 2), (12, 1), (16, 1)],
  term ((512 : Rat) / 93) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23 : Rat) / 93) [(4, 2), (16, 1)],
  term ((16 : Rat) / 93) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-271 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-514 : Rat) / 93) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((904 : Rat) / 93) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((121 : Rat) / 93) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1024 : Rat) / 93) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 93) [(5, 1), (7, 1), (16, 1)],
  term ((-742 : Rat) / 93) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-242 : Rat) / 93) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1523 : Rat) / 93) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((861 : Rat) / 31) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((1334 : Rat) / 93) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 2), (7, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((271 : Rat) / 186) [(5, 2), (10, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((257 : Rat) / 93) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(5, 2), (11, 2), (16, 1)],
  term ((-121 : Rat) / 186) [(5, 2), (12, 1), (16, 1)],
  term ((512 : Rat) / 93) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23 : Rat) / 93) [(5, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(5, 3), (7, 1), (16, 1)],
  term ((190 : Rat) / 93) [(5, 3), (9, 1), (16, 1)],
  term ((947 : Rat) / 93) [(5, 3), (11, 1), (16, 1)],
  term ((-1231 : Rat) / 93) [(5, 3), (13, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(5, 3), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 25. -/
theorem rs_R009_ueqv_R009NNNNY_block_17_0000_0025_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_17_0000_0025
      rs_R009_ueqv_R009NNNNY_block_17_0000_0025 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
