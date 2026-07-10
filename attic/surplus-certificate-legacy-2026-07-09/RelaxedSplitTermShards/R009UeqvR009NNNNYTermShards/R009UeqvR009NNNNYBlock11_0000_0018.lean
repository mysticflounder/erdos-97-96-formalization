/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 11:0-18

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0000 : Poly :=
[
  term ((-442 : Rat) / 93) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0000 : Poly :=
[
  term ((-884 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (6, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((442 : Rat) / 93) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0000
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0001 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0001 : Poly :=
[
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0001
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0002 : Poly :=
[
  term ((-32 : Rat) / 93) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0002 : Poly :=
[
  term ((-64 : Rat) / 93) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0002
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0003 : Poly :=
[
  term ((-42 : Rat) / 31) [(1, 2), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0003 : Poly :=
[
  term ((-84 : Rat) / 31) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 2), (6, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0003
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0004 : Poly :=
[
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0004 : Poly :=
[
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0004
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0005 : Poly :=
[
  term ((442 : Rat) / 93) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0005 : Poly :=
[
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0005
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0006 : Poly :=
[
  term ((-8 : Rat) / 93) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0006 : Poly :=
[
  term ((-16 : Rat) / 93) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0006
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0007 : Poly :=
[
  term ((-207 : Rat) / 31) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0007 : Poly :=
[
  term ((-414 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-414 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((207 : Rat) / 31) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((207 : Rat) / 31) [(5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0007
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0008 : Poly :=
[
  term ((1247 : Rat) / 93) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0008 : Poly :=
[
  term ((2494 : Rat) / 93) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((2494 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(5, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0008
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0009 : Poly :=
[
  term ((4 : Rat) / 93) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0009 : Poly :=
[
  term ((8 : Rat) / 93) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0009
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0010 : Poly :=
[
  term ((-8 : Rat) / 93) [(5, 2), (16, 1)]
]

/-- Partial product 10 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0010 : Poly :=
[
  term ((-16 : Rat) / 93) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 2), (6, 2), (16, 1)],
  term ((8 : Rat) / 93) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0010
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0011 : Poly :=
[
  term ((-58 : Rat) / 93) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0011 : Poly :=
[
  term ((-116 : Rat) / 93) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((58 : Rat) / 93) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((58 : Rat) / 93) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0011
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0012 : Poly :=
[
  term ((8 : Rat) / 93) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0012 : Poly :=
[
  term ((16 : Rat) / 93) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0012
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0013 : Poly :=
[
  term ((-1418 : Rat) / 93) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0013 : Poly :=
[
  term ((-2836 : Rat) / 93) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2836 : Rat) / 93) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((1418 : Rat) / 93) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((1418 : Rat) / 93) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0013
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0014 : Poly :=
[
  term ((148 : Rat) / 93) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0014 : Poly :=
[
  term ((296 : Rat) / 93) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((296 : Rat) / 93) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0014
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0015 : Poly :=
[
  term (9 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0015 : Poly :=
[
  term (18 : Rat) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term (18 : Rat) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term (-9 : Rat) [(6, 2), (11, 2), (16, 1)],
  term (-9 : Rat) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0015
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0016 : Poly :=
[
  term ((221 : Rat) / 186) [(12, 1), (16, 1)]
]

/-- Partial product 16 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0016 : Poly :=
[
  term ((221 : Rat) / 93) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(6, 2), (12, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0016
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0017 : Poly :=
[
  term ((-659 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0017 : Poly :=
[
  term ((-1318 : Rat) / 93) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((659 : Rat) / 93) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((659 : Rat) / 93) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0017
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NNNNY_coefficient_11_0018 : Poly :=
[
  term ((-221 : Rat) / 372) [(16, 1)]
]

/-- Partial product 18 for generator 11. -/
def rs_R009_ueqv_R009NNNNY_partial_11_0018 : Poly :=
[
  term ((-221 : Rat) / 186) [(2, 1), (6, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(3, 1), (7, 1), (16, 1)],
  term ((221 : Rat) / 372) [(6, 2), (16, 1)],
  term ((221 : Rat) / 372) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem rs_R009_ueqv_R009NNNNY_partial_11_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_11_0018
        rs_R009_ueqv_R009NNNNY_generator_11_0000_0018 =
      rs_R009_ueqv_R009NNNNY_partial_11_0018 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_11_0000_0018 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_11_0000,
  rs_R009_ueqv_R009NNNNY_partial_11_0001,
  rs_R009_ueqv_R009NNNNY_partial_11_0002,
  rs_R009_ueqv_R009NNNNY_partial_11_0003,
  rs_R009_ueqv_R009NNNNY_partial_11_0004,
  rs_R009_ueqv_R009NNNNY_partial_11_0005,
  rs_R009_ueqv_R009NNNNY_partial_11_0006,
  rs_R009_ueqv_R009NNNNY_partial_11_0007,
  rs_R009_ueqv_R009NNNNY_partial_11_0008,
  rs_R009_ueqv_R009NNNNY_partial_11_0009,
  rs_R009_ueqv_R009NNNNY_partial_11_0010,
  rs_R009_ueqv_R009NNNNY_partial_11_0011,
  rs_R009_ueqv_R009NNNNY_partial_11_0012,
  rs_R009_ueqv_R009NNNNY_partial_11_0013,
  rs_R009_ueqv_R009NNNNY_partial_11_0014,
  rs_R009_ueqv_R009NNNNY_partial_11_0015,
  rs_R009_ueqv_R009NNNNY_partial_11_0016,
  rs_R009_ueqv_R009NNNNY_partial_11_0017,
  rs_R009_ueqv_R009NNNNY_partial_11_0018
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_11_0000_0018 : Poly :=
[
  term ((-884 : Rat) / 93) [(1, 1), (2, 1), (3, 1), (6, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-64 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 2), (6, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 2), (7, 2), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-414 : Rat) / 31) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((2494 : Rat) / 93) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2836 : Rat) / 93) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((296 : Rat) / 93) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((221 : Rat) / 93) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(2, 1), (6, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-414 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((2494 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2836 : Rat) / 93) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((296 : Rat) / 93) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(3, 1), (7, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((207 : Rat) / 31) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((207 : Rat) / 31) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 2), (6, 2), (16, 1)],
  term ((8 : Rat) / 93) [(5, 2), (7, 2), (16, 1)],
  term ((58 : Rat) / 93) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((1418 : Rat) / 93) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(6, 2), (11, 2), (16, 1)],
  term ((-221 : Rat) / 186) [(6, 2), (12, 1), (16, 1)],
  term ((659 : Rat) / 93) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 372) [(6, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((1418 : Rat) / 93) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(7, 2), (11, 2), (16, 1)],
  term ((-221 : Rat) / 186) [(7, 2), (12, 1), (16, 1)],
  term ((659 : Rat) / 93) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 372) [(7, 2), (16, 1)],
  term ((58 : Rat) / 93) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 18. -/
theorem rs_R009_ueqv_R009NNNNY_block_11_0000_0018_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_11_0000_0018
      rs_R009_ueqv_R009NNNNY_block_11_0000_0018 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
