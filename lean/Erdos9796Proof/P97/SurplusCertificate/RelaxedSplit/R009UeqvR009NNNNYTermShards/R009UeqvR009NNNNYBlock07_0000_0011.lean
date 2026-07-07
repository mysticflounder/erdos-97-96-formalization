/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 7:0-11

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0000 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0000 : Poly :=
[
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (3, 1), (6, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 3), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0000
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0001 : Poly :=
[
  term ((-42 : Rat) / 31) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0001 : Poly :=
[
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0001
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0002 : Poly :=
[
  term ((158 : Rat) / 93) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0002 : Poly :=
[
  term ((-316 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((316 : Rat) / 93) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((158 : Rat) / 93) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((158 : Rat) / 93) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0002
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0003 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0003 : Poly :=
[
  term ((884 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0003
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0004 : Poly :=
[
  term ((442 : Rat) / 93) [(3, 2), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0004 : Poly :=
[
  term ((-884 : Rat) / 93) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 3), (16, 1)],
  term ((442 : Rat) / 93) [(2, 2), (3, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (6, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (7, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0004
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0005 : Poly :=
[
  term ((182 : Rat) / 93) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0005 : Poly :=
[
  term ((-364 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0005
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0006 : Poly :=
[
  term ((-182 : Rat) / 93) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0006 : Poly :=
[
  term ((364 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((182 : Rat) / 93) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((182 : Rat) / 93) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0006
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0007 : Poly :=
[
  term ((184 : Rat) / 93) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0007 : Poly :=
[
  term ((-368 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((368 : Rat) / 93) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-368 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((368 : Rat) / 93) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((184 : Rat) / 93) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((184 : Rat) / 93) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0007
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0008 : Poly :=
[
  term ((-218 : Rat) / 31) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0008 : Poly :=
[
  term ((436 : Rat) / 31) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-436 : Rat) / 31) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((436 : Rat) / 31) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-436 : Rat) / 31) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((218 : Rat) / 31) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((218 : Rat) / 31) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0008
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0009 : Poly :=
[
  term ((-176 : Rat) / 31) [(11, 2), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0009 : Poly :=
[
  term ((352 : Rat) / 31) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-352 : Rat) / 31) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((352 : Rat) / 31) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-352 : Rat) / 31) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-176 : Rat) / 31) [(2, 2), (11, 2), (16, 1)],
  term ((-176 : Rat) / 31) [(3, 2), (11, 2), (16, 1)],
  term ((176 : Rat) / 31) [(6, 2), (11, 2), (16, 1)],
  term ((176 : Rat) / 31) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0009
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0010 : Poly :=
[
  term ((652 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0010 : Poly :=
[
  term ((-1304 : Rat) / 93) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0010
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NNNNY_coefficient_07_0011 : Poly :=
[
  term ((-42 : Rat) / 31) [(13, 2), (16, 1)]
]

/-- Partial product 11 for generator 7. -/
def rs_R009_ueqv_R009NNNNY_partial_07_0011 : Poly :=
[
  term ((84 : Rat) / 31) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(2, 2), (13, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(3, 2), (13, 2), (16, 1)],
  term ((42 : Rat) / 31) [(6, 2), (13, 2), (16, 1)],
  term ((42 : Rat) / 31) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R009_ueqv_R009NNNNY_partial_07_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_07_0011
        rs_R009_ueqv_R009NNNNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NNNNY_partial_07_0011 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_07_0000_0011 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_07_0000,
  rs_R009_ueqv_R009NNNNY_partial_07_0001,
  rs_R009_ueqv_R009NNNNY_partial_07_0002,
  rs_R009_ueqv_R009NNNNY_partial_07_0003,
  rs_R009_ueqv_R009NNNNY_partial_07_0004,
  rs_R009_ueqv_R009NNNNY_partial_07_0005,
  rs_R009_ueqv_R009NNNNY_partial_07_0006,
  rs_R009_ueqv_R009NNNNY_partial_07_0007,
  rs_R009_ueqv_R009NNNNY_partial_07_0008,
  rs_R009_ueqv_R009NNNNY_partial_07_0009,
  rs_R009_ueqv_R009NNNNY_partial_07_0010,
  rs_R009_ueqv_R009NNNNY_partial_07_0011
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_07_0000_0011 : Poly :=
[
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (3, 1), (6, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-368 : Rat) / 93) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((436 : Rat) / 31) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 31) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-1304 : Rat) / 93) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((316 : Rat) / 93) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((368 : Rat) / 93) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-436 : Rat) / 31) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 31) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((1304 : Rat) / 93) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((316 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-368 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((436 : Rat) / 31) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 31) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((758 : Rat) / 93) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-758 : Rat) / 93) [(1, 1), (3, 3), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((368 : Rat) / 93) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-436 : Rat) / 31) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 31) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (3, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((158 : Rat) / 93) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 2), (3, 2), (16, 1)],
  term ((182 : Rat) / 93) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((184 : Rat) / 93) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 31) [(2, 2), (11, 2), (16, 1)],
  term ((652 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(2, 2), (13, 2), (16, 1)],
  term ((-158 : Rat) / 93) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (6, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (7, 2), (16, 1)],
  term ((182 : Rat) / 93) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((184 : Rat) / 93) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-218 : Rat) / 31) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 31) [(3, 2), (11, 2), (16, 1)],
  term ((652 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(3, 2), (13, 2), (16, 1)],
  term ((158 : Rat) / 93) [(3, 3), (11, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 3), (13, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 4), (16, 1)],
  term ((-182 : Rat) / 93) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((218 : Rat) / 31) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 31) [(6, 2), (11, 2), (16, 1)],
  term ((-652 : Rat) / 93) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(6, 2), (13, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((218 : Rat) / 31) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 31) [(7, 2), (11, 2), (16, 1)],
  term ((-652 : Rat) / 93) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 11. -/
theorem rs_R009_ueqv_R009NNNNY_block_07_0000_0011_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_07_0000_0011
      rs_R009_ueqv_R009NNNNY_block_07_0000_0011 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
