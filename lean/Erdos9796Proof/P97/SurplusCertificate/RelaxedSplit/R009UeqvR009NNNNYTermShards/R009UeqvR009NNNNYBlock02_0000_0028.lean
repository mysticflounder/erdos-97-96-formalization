/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 2:0-28

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0000 : Poly :=
[
  term ((904 : Rat) / 93) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 0 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0000 : Poly :=
[
  term ((904 : Rat) / 93) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((904 : Rat) / 93) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0000
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0001 : Poly :=
[
  term ((-344 : Rat) / 93) [(0, 1), (16, 1)]
]

/-- Partial product 1 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0001 : Poly :=
[
  term ((-344 : Rat) / 93) [(0, 1), (1, 2), (16, 1)],
  term ((344 : Rat) / 93) [(0, 1), (10, 2), (16, 1)],
  term ((344 : Rat) / 93) [(0, 1), (11, 2), (16, 1)],
  term ((-344 : Rat) / 93) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0001
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0002 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 2 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0002 : Poly :=
[
  term ((42 : Rat) / 31) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0002
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0003 : Poly :=
[
  term ((182 : Rat) / 93) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 3 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0003 : Poly :=
[
  term ((182 : Rat) / 93) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((182 : Rat) / 93) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0003
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0004 : Poly :=
[
  term ((-176 : Rat) / 31) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0004 : Poly :=
[
  term ((-176 : Rat) / 31) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((176 : Rat) / 31) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((176 : Rat) / 31) [(1, 1), (11, 3), (16, 1)],
  term ((-176 : Rat) / 31) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0004
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0005 : Poly :=
[
  term ((904 : Rat) / 93) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0005 : Poly :=
[
  term ((904 : Rat) / 93) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((904 : Rat) / 93) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0005
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0006 : Poly :=
[
  term ((-218 : Rat) / 31) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0006 : Poly :=
[
  term ((-218 : Rat) / 31) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((218 : Rat) / 31) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((218 : Rat) / 31) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0006
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0007 : Poly :=
[
  term ((64 : Rat) / 31) [(2, 1), (16, 1)]
]

/-- Partial product 7 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0007 : Poly :=
[
  term ((64 : Rat) / 31) [(0, 2), (2, 1), (16, 1)],
  term ((64 : Rat) / 31) [(1, 2), (2, 1), (16, 1)],
  term ((-64 : Rat) / 31) [(2, 1), (10, 2), (16, 1)],
  term ((-64 : Rat) / 31) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0007
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0008 : Poly :=
[
  term ((-221 : Rat) / 186) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 8 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0008 : Poly :=
[
  term ((-221 : Rat) / 186) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0008
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0009 : Poly :=
[
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0009 : Poly :=
[
  term ((-182 : Rat) / 93) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((182 : Rat) / 93) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((182 : Rat) / 93) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0009
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0010 : Poly :=
[
  term ((25 : Rat) / 62) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0010 : Poly :=
[
  term ((25 : Rat) / 62) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((25 : Rat) / 62) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-25 : Rat) / 62) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-25 : Rat) / 62) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0010
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0011 : Poly :=
[
  term ((442 : Rat) / 93) [(3, 2), (16, 1)]
]

/-- Partial product 11 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0011 : Poly :=
[
  term ((442 : Rat) / 93) [(0, 2), (3, 2), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (3, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (10, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0011
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0012 : Poly :=
[
  term ((413 : Rat) / 93) [(4, 1), (16, 1)]
]

/-- Partial product 12 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0012 : Poly :=
[
  term ((413 : Rat) / 93) [(0, 2), (4, 1), (16, 1)],
  term ((413 : Rat) / 93) [(1, 2), (4, 1), (16, 1)],
  term ((-413 : Rat) / 93) [(4, 1), (10, 2), (16, 1)],
  term ((-413 : Rat) / 93) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0012
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0013 : Poly :=
[
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 13 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0013 : Poly :=
[
  term ((4 : Rat) / 93) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 93) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0013
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0014 : Poly :=
[
  term ((-182 : Rat) / 93) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 14 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0014 : Poly :=
[
  term ((-182 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0014
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0015 : Poly :=
[
  term ((398 : Rat) / 93) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0015 : Poly :=
[
  term ((398 : Rat) / 93) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((398 : Rat) / 93) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-398 : Rat) / 93) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-398 : Rat) / 93) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0015
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0016 : Poly :=
[
  term ((66 : Rat) / 31) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0016 : Poly :=
[
  term ((66 : Rat) / 31) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((66 : Rat) / 31) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-66 : Rat) / 31) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-66 : Rat) / 31) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0016
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0017 : Poly :=
[
  term ((-371 : Rat) / 186) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0017 : Poly :=
[
  term ((-371 : Rat) / 186) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((371 : Rat) / 186) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((371 : Rat) / 186) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0017
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0018 : Poly :=
[
  term ((-121 : Rat) / 186) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0018 : Poly :=
[
  term ((-121 : Rat) / 186) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0018
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0019 : Poly :=
[
  term ((182 : Rat) / 93) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 19 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0019 : Poly :=
[
  term ((182 : Rat) / 93) [(0, 2), (8, 1), (10, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(8, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0019
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0020 : Poly :=
[
  term ((-836 : Rat) / 93) [(8, 1), (16, 1)]
]

/-- Partial product 20 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0020 : Poly :=
[
  term ((-836 : Rat) / 93) [(0, 2), (8, 1), (16, 1)],
  term ((-836 : Rat) / 93) [(1, 2), (8, 1), (16, 1)],
  term ((836 : Rat) / 93) [(8, 1), (10, 2), (16, 1)],
  term ((836 : Rat) / 93) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0020
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0021 : Poly :=
[
  term ((182 : Rat) / 93) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0021 : Poly :=
[
  term ((182 : Rat) / 93) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0021
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0022 : Poly :=
[
  term ((5 : Rat) / 31) [(10, 1), (16, 1)]
]

/-- Partial product 22 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0022 : Poly :=
[
  term ((5 : Rat) / 31) [(0, 2), (10, 1), (16, 1)],
  term ((5 : Rat) / 31) [(1, 2), (10, 1), (16, 1)],
  term ((-5 : Rat) / 31) [(10, 1), (11, 2), (16, 1)],
  term ((-5 : Rat) / 31) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0022
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0023 : Poly :=
[
  term ((593 : Rat) / 186) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0023 : Poly :=
[
  term ((593 : Rat) / 186) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((593 : Rat) / 186) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-593 : Rat) / 186) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-593 : Rat) / 186) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0023
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0024 : Poly :=
[
  term ((-599 : Rat) / 62) [(12, 1), (16, 1)]
]

/-- Partial product 24 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0024 : Poly :=
[
  term ((-599 : Rat) / 62) [(0, 2), (12, 1), (16, 1)],
  term ((-599 : Rat) / 62) [(1, 2), (12, 1), (16, 1)],
  term ((599 : Rat) / 62) [(10, 2), (12, 1), (16, 1)],
  term ((599 : Rat) / 62) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0024
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0025 : Poly :=
[
  term ((33 : Rat) / 62) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0025 : Poly :=
[
  term ((33 : Rat) / 62) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 62) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 62) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 62) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0025
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0026 : Poly :=
[
  term ((-362 : Rat) / 93) [(14, 1), (16, 1)]
]

/-- Partial product 26 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0026 : Poly :=
[
  term ((-362 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((-362 : Rat) / 93) [(1, 2), (14, 1), (16, 1)],
  term ((362 : Rat) / 93) [(10, 2), (14, 1), (16, 1)],
  term ((362 : Rat) / 93) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0026
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0027 : Poly :=
[
  term ((-535 : Rat) / 93) [(15, 2), (16, 1)]
]

/-- Partial product 27 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0027 : Poly :=
[
  term ((-535 : Rat) / 93) [(0, 2), (15, 2), (16, 1)],
  term ((-535 : Rat) / 93) [(1, 2), (15, 2), (16, 1)],
  term ((535 : Rat) / 93) [(10, 2), (15, 2), (16, 1)],
  term ((535 : Rat) / 93) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0027
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNNY_coefficient_02_0028 : Poly :=
[
  term ((1103 : Rat) / 124) [(16, 1)]
]

/-- Partial product 28 for generator 2. -/
def rs_R009_ueqv_R009NNNNY_partial_02_0028 : Poly :=
[
  term ((1103 : Rat) / 124) [(0, 2), (16, 1)],
  term ((1103 : Rat) / 124) [(1, 2), (16, 1)],
  term ((-1103 : Rat) / 124) [(10, 2), (16, 1)],
  term ((-1103 : Rat) / 124) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 2. -/
theorem rs_R009_ueqv_R009NNNNY_partial_02_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_02_0028
        rs_R009_ueqv_R009NNNNY_generator_02_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_02_0028 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_02_0000_0028 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_02_0000,
  rs_R009_ueqv_R009NNNNY_partial_02_0001,
  rs_R009_ueqv_R009NNNNY_partial_02_0002,
  rs_R009_ueqv_R009NNNNY_partial_02_0003,
  rs_R009_ueqv_R009NNNNY_partial_02_0004,
  rs_R009_ueqv_R009NNNNY_partial_02_0005,
  rs_R009_ueqv_R009NNNNY_partial_02_0006,
  rs_R009_ueqv_R009NNNNY_partial_02_0007,
  rs_R009_ueqv_R009NNNNY_partial_02_0008,
  rs_R009_ueqv_R009NNNNY_partial_02_0009,
  rs_R009_ueqv_R009NNNNY_partial_02_0010,
  rs_R009_ueqv_R009NNNNY_partial_02_0011,
  rs_R009_ueqv_R009NNNNY_partial_02_0012,
  rs_R009_ueqv_R009NNNNY_partial_02_0013,
  rs_R009_ueqv_R009NNNNY_partial_02_0014,
  rs_R009_ueqv_R009NNNNY_partial_02_0015,
  rs_R009_ueqv_R009NNNNY_partial_02_0016,
  rs_R009_ueqv_R009NNNNY_partial_02_0017,
  rs_R009_ueqv_R009NNNNY_partial_02_0018,
  rs_R009_ueqv_R009NNNNY_partial_02_0019,
  rs_R009_ueqv_R009NNNNY_partial_02_0020,
  rs_R009_ueqv_R009NNNNY_partial_02_0021,
  rs_R009_ueqv_R009NNNNY_partial_02_0022,
  rs_R009_ueqv_R009NNNNY_partial_02_0023,
  rs_R009_ueqv_R009NNNNY_partial_02_0024,
  rs_R009_ueqv_R009NNNNY_partial_02_0025,
  rs_R009_ueqv_R009NNNNY_partial_02_0026,
  rs_R009_ueqv_R009NNNNY_partial_02_0027,
  rs_R009_ueqv_R009NNNNY_partial_02_0028
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_02_0000_0028 : Poly :=
[
  term ((904 : Rat) / 93) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-344 : Rat) / 93) [(0, 1), (1, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((344 : Rat) / 93) [(0, 1), (10, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((344 : Rat) / 93) [(0, 1), (11, 2), (16, 1)],
  term ((42 : Rat) / 31) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-176 : Rat) / 31) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((904 : Rat) / 93) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 31) [(0, 2), (2, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((25 : Rat) / 62) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (3, 2), (16, 1)],
  term ((413 : Rat) / 93) [(0, 2), (4, 1), (16, 1)],
  term ((4 : Rat) / 93) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((398 : Rat) / 93) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((66 : Rat) / 31) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (8, 1), (10, 1), (16, 1)],
  term ((-836 : Rat) / 93) [(0, 2), (8, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((5 : Rat) / 31) [(0, 2), (10, 1), (16, 1)],
  term ((593 : Rat) / 186) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-599 : Rat) / 62) [(0, 2), (12, 1), (16, 1)],
  term ((33 : Rat) / 62) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-362 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((-535 : Rat) / 93) [(0, 2), (15, 2), (16, 1)],
  term ((1103 : Rat) / 124) [(0, 2), (16, 1)],
  term ((904 : Rat) / 93) [(0, 3), (12, 1), (16, 1)],
  term ((-344 : Rat) / 93) [(0, 3), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((176 : Rat) / 31) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((218 : Rat) / 31) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((218 : Rat) / 31) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((176 : Rat) / 31) [(1, 1), (11, 3), (16, 1)],
  term ((64 : Rat) / 31) [(1, 2), (2, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((25 : Rat) / 62) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (3, 2), (16, 1)],
  term ((413 : Rat) / 93) [(1, 2), (4, 1), (16, 1)],
  term ((4 : Rat) / 93) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((398 : Rat) / 93) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((66 : Rat) / 31) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((-836 : Rat) / 93) [(1, 2), (8, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((5 : Rat) / 31) [(1, 2), (10, 1), (16, 1)],
  term ((593 : Rat) / 186) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-599 : Rat) / 62) [(1, 2), (12, 1), (16, 1)],
  term ((33 : Rat) / 62) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-362 : Rat) / 93) [(1, 2), (14, 1), (16, 1)],
  term ((-535 : Rat) / 93) [(1, 2), (15, 2), (16, 1)],
  term ((1103 : Rat) / 124) [(1, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 3), (3, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 3), (9, 1), (16, 1)],
  term ((-176 : Rat) / 31) [(1, 3), (11, 1), (16, 1)],
  term ((904 : Rat) / 93) [(1, 3), (13, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(1, 3), (15, 1), (16, 1)],
  term ((-64 : Rat) / 31) [(2, 1), (10, 2), (16, 1)],
  term ((-64 : Rat) / 31) [(2, 1), (11, 2), (16, 1)],
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((182 : Rat) / 93) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((182 : Rat) / 93) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-25 : Rat) / 62) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-25 : Rat) / 62) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (10, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (11, 2), (16, 1)],
  term ((-413 : Rat) / 93) [(4, 1), (10, 2), (16, 1)],
  term ((-413 : Rat) / 93) [(4, 1), (11, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-398 : Rat) / 93) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-66 : Rat) / 31) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-66 : Rat) / 31) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-398 : Rat) / 93) [(5, 1), (11, 3), (16, 1)],
  term ((371 : Rat) / 186) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((371 : Rat) / 186) [(7, 1), (11, 3), (16, 1)],
  term ((-182 : Rat) / 93) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((836 : Rat) / 93) [(8, 1), (10, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(8, 1), (10, 3), (16, 1)],
  term ((836 : Rat) / 93) [(8, 1), (11, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(9, 1), (11, 3), (16, 1)],
  term ((-5 : Rat) / 31) [(10, 1), (11, 2), (16, 1)],
  term ((-593 : Rat) / 186) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((599 : Rat) / 62) [(10, 2), (12, 1), (16, 1)],
  term ((-33 : Rat) / 62) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((362 : Rat) / 93) [(10, 2), (14, 1), (16, 1)],
  term ((535 : Rat) / 93) [(10, 2), (15, 2), (16, 1)],
  term ((-1103 : Rat) / 124) [(10, 2), (16, 1)],
  term ((-5 : Rat) / 31) [(10, 3), (16, 1)],
  term ((599 : Rat) / 62) [(11, 2), (12, 1), (16, 1)],
  term ((-33 : Rat) / 62) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((362 : Rat) / 93) [(11, 2), (14, 1), (16, 1)],
  term ((535 : Rat) / 93) [(11, 2), (15, 2), (16, 1)],
  term ((-1103 : Rat) / 124) [(11, 2), (16, 1)],
  term ((-593 : Rat) / 186) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 0 through 28. -/
theorem rs_R009_ueqv_R009NNNNY_block_02_0000_0028_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_02_0000_0028
      rs_R009_ueqv_R009NNNNY_block_02_0000_0028 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
