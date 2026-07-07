/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 18:0-19

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 : Poly :=
[
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0000 : Poly :=
[
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0000 : Poly :=
[
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (6, 1), (10, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0000
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0001 : Poly :=
[
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 1 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0001 : Poly :=
[
  term ((-364 : Rat) / 93) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0001
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0002 : Poly :=
[
  term ((176 : Rat) / 31) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0002 : Poly :=
[
  term ((352 : Rat) / 31) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((352 : Rat) / 31) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-176 : Rat) / 31) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-176 : Rat) / 31) [(1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0002
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0003 : Poly :=
[
  term ((218 : Rat) / 31) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0003 : Poly :=
[
  term ((436 : Rat) / 31) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((436 : Rat) / 31) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0003
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0004 : Poly :=
[
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 4 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0004 : Poly :=
[
  term ((221 : Rat) / 93) [(3, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((-221 : Rat) / 186) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0004
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0005 : Poly :=
[
  term (-9 : Rat) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0005 : Poly :=
[
  term (-18 : Rat) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term (-18 : Rat) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term (9 : Rat) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term (9 : Rat) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0005
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0006 : Poly :=
[
  term ((1139 : Rat) / 93) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0006 : Poly :=
[
  term ((2278 : Rat) / 93) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0006
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0007 : Poly :=
[
  term ((-25 : Rat) / 62) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0007 : Poly :=
[
  term ((-25 : Rat) / 31) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-25 : Rat) / 31) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((25 : Rat) / 62) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((25 : Rat) / 62) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0007
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0008 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 2), (16, 1)]
]

/-- Partial product 8 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0008 : Poly :=
[
  term ((-884 : Rat) / 93) [(3, 2), (6, 1), (10, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (10, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0008
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0009 : Poly :=
[
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0009 : Poly :=
[
  term ((-8 : Rat) / 93) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0009
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0010 : Poly :=
[
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 10 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0010 : Poly :=
[
  term ((364 : Rat) / 93) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((364 : Rat) / 93) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0010
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0011 : Poly :=
[
  term ((-514 : Rat) / 93) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0011 : Poly :=
[
  term ((-1028 : Rat) / 93) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1028 : Rat) / 93) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((514 : Rat) / 93) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((514 : Rat) / 93) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0011
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0012 : Poly :=
[
  term ((-13 : Rat) / 3) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0012 : Poly :=
[
  term ((-26 : Rat) / 3) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26 : Rat) / 3) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 3) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((13 : Rat) / 3) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0012
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0013 : Poly :=
[
  term ((371 : Rat) / 186) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0013 : Poly :=
[
  term ((371 : Rat) / 93) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(7, 1), (11, 3), (16, 1)],
  term ((371 : Rat) / 93) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0013
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0014 : Poly :=
[
  term ((121 : Rat) / 186) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0014 : Poly :=
[
  term ((121 : Rat) / 93) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((121 : Rat) / 93) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0014
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0015 : Poly :=
[
  term ((-61 : Rat) / 31) [(10, 1), (16, 1)]
]

/-- Partial product 15 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0015 : Poly :=
[
  term ((-122 : Rat) / 31) [(6, 1), (10, 2), (16, 1)],
  term ((-122 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((61 : Rat) / 31) [(10, 1), (11, 2), (16, 1)],
  term ((61 : Rat) / 31) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0015
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0016 : Poly :=
[
  term ((-361 : Rat) / 186) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0016 : Poly :=
[
  term ((-361 : Rat) / 93) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((361 : Rat) / 186) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 186) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0016
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0017 : Poly :=
[
  term ((5 : Rat) / 186) [(12, 1), (16, 1)]
]

/-- Partial product 17 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0017 : Poly :=
[
  term ((5 : Rat) / 93) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((5 : Rat) / 93) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5 : Rat) / 186) [(10, 2), (12, 1), (16, 1)],
  term ((-5 : Rat) / 186) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0017
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0018 : Poly :=
[
  term ((-131 : Rat) / 186) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0018 : Poly :=
[
  term ((-131 : Rat) / 93) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131 : Rat) / 93) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((131 : Rat) / 186) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((131 : Rat) / 186) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0018
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNNY_coefficient_18_0019 : Poly :=
[
  term ((361 : Rat) / 372) [(16, 1)]
]

/-- Partial product 19 for generator 18. -/
def rs_R009_ueqv_R009NNNNY_partial_18_0019 : Poly :=
[
  term ((361 : Rat) / 186) [(6, 1), (10, 1), (16, 1)],
  term ((361 : Rat) / 186) [(7, 1), (11, 1), (16, 1)],
  term ((-361 : Rat) / 372) [(10, 2), (16, 1)],
  term ((-361 : Rat) / 372) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 18. -/
theorem rs_R009_ueqv_R009NNNNY_partial_18_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_18_0019
        rs_R009_ueqv_R009NNNNY_generator_18_0000_0019 =
      rs_R009_ueqv_R009NNNNY_partial_18_0019 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_18_0000_0019 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_18_0000,
  rs_R009_ueqv_R009NNNNY_partial_18_0001,
  rs_R009_ueqv_R009NNNNY_partial_18_0002,
  rs_R009_ueqv_R009NNNNY_partial_18_0003,
  rs_R009_ueqv_R009NNNNY_partial_18_0004,
  rs_R009_ueqv_R009NNNNY_partial_18_0005,
  rs_R009_ueqv_R009NNNNY_partial_18_0006,
  rs_R009_ueqv_R009NNNNY_partial_18_0007,
  rs_R009_ueqv_R009NNNNY_partial_18_0008,
  rs_R009_ueqv_R009NNNNY_partial_18_0009,
  rs_R009_ueqv_R009NNNNY_partial_18_0010,
  rs_R009_ueqv_R009NNNNY_partial_18_0011,
  rs_R009_ueqv_R009NNNNY_partial_18_0012,
  rs_R009_ueqv_R009NNNNY_partial_18_0013,
  rs_R009_ueqv_R009NNNNY_partial_18_0014,
  rs_R009_ueqv_R009NNNNY_partial_18_0015,
  rs_R009_ueqv_R009NNNNY_partial_18_0016,
  rs_R009_ueqv_R009NNNNY_partial_18_0017,
  rs_R009_ueqv_R009NNNNY_partial_18_0018,
  rs_R009_ueqv_R009NNNNY_partial_18_0019
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_18_0000_0019 : Poly :=
[
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (6, 1), (10, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((352 : Rat) / 31) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((436 : Rat) / 31) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((436 : Rat) / 31) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 31) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-176 : Rat) / 31) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-176 : Rat) / 31) [(1, 1), (11, 3), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term (-18 : Rat) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-25 : Rat) / 31) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((2278 : Rat) / 93) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-25 : Rat) / 31) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3569 : Rat) / 186) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term (9 : Rat) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((25 : Rat) / 62) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((25 : Rat) / 62) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(3, 1), (11, 3), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 2), (6, 1), (10, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (10, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (11, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((364 : Rat) / 93) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1028 : Rat) / 93) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-26 : Rat) / 3) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-26 : Rat) / 3) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 93) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((514 : Rat) / 93) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((13 : Rat) / 3) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((13 : Rat) / 3) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((514 : Rat) / 93) [(5, 1), (11, 3), (16, 1)],
  term ((371 : Rat) / 93) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((121 : Rat) / 93) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 93) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-131 : Rat) / 93) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 186) [(6, 1), (10, 1), (16, 1)],
  term ((-122 : Rat) / 31) [(6, 1), (10, 2), (16, 1)],
  term ((-122 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((5 : Rat) / 93) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-131 : Rat) / 93) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 186) [(7, 1), (11, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(7, 1), (11, 3), (16, 1)],
  term ((121 : Rat) / 93) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((371 : Rat) / 93) [(7, 2), (11, 2), (16, 1)],
  term ((61 : Rat) / 31) [(10, 1), (11, 2), (16, 1)],
  term ((361 : Rat) / 186) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 186) [(10, 2), (12, 1), (16, 1)],
  term ((131 : Rat) / 186) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 372) [(10, 2), (16, 1)],
  term ((61 : Rat) / 31) [(10, 3), (16, 1)],
  term ((-5 : Rat) / 186) [(11, 2), (12, 1), (16, 1)],
  term ((131 : Rat) / 186) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 372) [(11, 2), (16, 1)],
  term ((361 : Rat) / 186) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 19. -/
theorem rs_R009_ueqv_R009NNNNY_block_18_0000_0019_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_18_0000_0019
      rs_R009_ueqv_R009NNNNY_block_18_0000_0019 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
