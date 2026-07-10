/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 13:0-29

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0000 : Poly :=
[
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0000 : Poly :=
[
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0000
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0001 : Poly :=
[
  term ((-42 : Rat) / 31) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 1 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0001 : Poly :=
[
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (5, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0001
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0002 : Poly :=
[
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0002 : Poly :=
[
  term ((364 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (9, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0002
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0003 : Poly :=
[
  term ((72 : Rat) / 31) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0003 : Poly :=
[
  term ((-144 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0003
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0004 : Poly :=
[
  term ((652 : Rat) / 93) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0004 : Poly :=
[
  term ((-1304 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0004
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0005 : Poly :=
[
  term ((-29 : Rat) / 93) [(2, 1), (16, 1)]
]

/-- Partial product 5 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0005 : Poly :=
[
  term ((58 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-29 : Rat) / 93) [(2, 1), (3, 2), (16, 1)],
  term ((-58 : Rat) / 93) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((29 : Rat) / 93) [(2, 1), (6, 2), (16, 1)],
  term ((29 : Rat) / 93) [(2, 1), (7, 2), (16, 1)],
  term ((58 : Rat) / 93) [(2, 2), (4, 1), (16, 1)],
  term ((-29 : Rat) / 93) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0005
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0006 : Poly :=
[
  term ((-14 : Rat) / 3) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 6 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0006 : Poly :=
[
  term ((28 : Rat) / 3) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((14 : Rat) / 3) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((14 : Rat) / 3) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-28 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((28 : Rat) / 3) [(3, 2), (5, 2), (16, 1)],
  term ((-14 : Rat) / 3) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0006
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0007 : Poly :=
[
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 7 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0007 : Poly :=
[
  term ((442 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (7, 3), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0007
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0008 : Poly :=
[
  term ((8 : Rat) / 93) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 8 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0008 : Poly :=
[
  term ((-16 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0008
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0009 : Poly :=
[
  term ((-658 : Rat) / 93) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0009 : Poly :=
[
  term ((1316 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-658 : Rat) / 93) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-1316 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1316 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((658 : Rat) / 93) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((658 : Rat) / 93) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((1316 : Rat) / 93) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-658 : Rat) / 93) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0009
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0010 : Poly :=
[
  term ((256 : Rat) / 31) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0010 : Poly :=
[
  term ((-512 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((256 : Rat) / 31) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((512 : Rat) / 31) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((512 : Rat) / 31) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-256 : Rat) / 31) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-256 : Rat) / 31) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-512 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((256 : Rat) / 31) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0010
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0011 : Poly :=
[
  term ((-659 : Rat) / 93) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0011 : Poly :=
[
  term ((1318 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-659 : Rat) / 93) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((659 : Rat) / 93) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((659 : Rat) / 93) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((1318 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-659 : Rat) / 93) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0011
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0012 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 2), (16, 1)]
]

/-- Partial product 12 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0012 : Poly :=
[
  term ((884 : Rat) / 93) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 2), (3, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (6, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (7, 2), (16, 1)],
  term ((884 : Rat) / 93) [(3, 3), (5, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0012
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0013 : Poly :=
[
  term ((190 : Rat) / 93) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 13 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0013 : Poly :=
[
  term ((-380 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((190 : Rat) / 93) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((190 : Rat) / 93) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((380 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((380 : Rat) / 93) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0013
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0014 : Poly :=
[
  term ((947 : Rat) / 93) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0014 : Poly :=
[
  term ((-1894 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((947 : Rat) / 93) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1894 : Rat) / 93) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((947 : Rat) / 93) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((1894 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-947 : Rat) / 93) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-947 : Rat) / 93) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((1894 : Rat) / 93) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0014
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0015 : Poly :=
[
  term ((-1247 : Rat) / 93) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0015 : Poly :=
[
  term ((2494 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((2494 : Rat) / 93) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-2494 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((1247 : Rat) / 93) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((1247 : Rat) / 93) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-2494 : Rat) / 93) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0015
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0016 : Poly :=
[
  term ((-667 : Rat) / 93) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0016 : Poly :=
[
  term ((1334 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((1334 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1334 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((667 : Rat) / 93) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((667 : Rat) / 93) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1334 : Rat) / 93) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0016
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0017 : Poly :=
[
  term ((8 : Rat) / 93) [(5, 2), (16, 1)]
]

/-- Partial product 17 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0017 : Poly :=
[
  term ((-16 : Rat) / 93) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (5, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (5, 3), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (5, 2), (16, 1)],
  term ((16 : Rat) / 93) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 2), (6, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 2), (7, 2), (16, 1)],
  term ((16 : Rat) / 93) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0017
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0018 : Poly :=
[
  term ((-5 : Rat) / 93) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0018 : Poly :=
[
  term ((10 : Rat) / 93) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-5 : Rat) / 93) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((10 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-5 : Rat) / 93) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-10 : Rat) / 93) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-10 : Rat) / 93) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((5 : Rat) / 93) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((5 : Rat) / 93) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0018
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0019 : Poly :=
[
  term ((158 : Rat) / 93) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0019 : Poly :=
[
  term ((-316 : Rat) / 93) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((158 : Rat) / 93) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((158 : Rat) / 93) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((316 : Rat) / 93) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((316 : Rat) / 93) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0019
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0020 : Poly :=
[
  term ((-182 : Rat) / 93) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0020 : Poly :=
[
  term ((364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0020
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0021 : Poly :=
[
  term ((58 : Rat) / 31) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0021 : Poly :=
[
  term ((-116 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((58 : Rat) / 31) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((58 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((116 : Rat) / 31) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((116 : Rat) / 31) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0021
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0022 : Poly :=
[
  term ((3 : Rat) / 2) [(10, 1), (16, 1)]
]

/-- Partial product 22 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0022 : Poly :=
[
  term (-3 : Rat) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((3 : Rat) / 2) [(2, 2), (10, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((3 : Rat) / 2) [(3, 2), (10, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(6, 2), (10, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0022
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0023 : Poly :=
[
  term ((455 : Rat) / 31) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0023 : Poly :=
[
  term ((-910 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((455 : Rat) / 31) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-910 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((455 : Rat) / 31) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((910 : Rat) / 31) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((910 : Rat) / 31) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-455 : Rat) / 31) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-455 : Rat) / 31) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0023
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0024 : Poly :=
[
  term ((659 : Rat) / 93) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0024 : Poly :=
[
  term ((-1318 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((659 : Rat) / 93) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((659 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1318 : Rat) / 93) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1318 : Rat) / 93) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-659 : Rat) / 93) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-659 : Rat) / 93) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0024
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0025 : Poly :=
[
  term ((2 : Rat) / 3) [(11, 2), (16, 1)]
]

/-- Partial product 25 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0025 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (11, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 3) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 2), (11, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0025
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0026 : Poly :=
[
  term ((-121 : Rat) / 186) [(12, 1), (16, 1)]
]

/-- Partial product 26 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0026 : Poly :=
[
  term ((121 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(2, 2), (12, 1), (16, 1)],
  term ((121 : Rat) / 93) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(3, 2), (12, 1), (16, 1)],
  term ((-121 : Rat) / 93) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-121 : Rat) / 93) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((121 : Rat) / 186) [(6, 2), (12, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0026
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0027 : Poly :=
[
  term ((7 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0027 : Poly :=
[
  term ((-14 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 93) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 93) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 93) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 93) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 93) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0027
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0028 : Poly :=
[
  term ((-74 : Rat) / 93) [(13, 2), (16, 1)]
]

/-- Partial product 28 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0028 : Poly :=
[
  term ((148 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-74 : Rat) / 93) [(2, 2), (13, 2), (16, 1)],
  term ((148 : Rat) / 93) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-74 : Rat) / 93) [(3, 2), (13, 2), (16, 1)],
  term ((-148 : Rat) / 93) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-148 : Rat) / 93) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((74 : Rat) / 93) [(6, 2), (13, 2), (16, 1)],
  term ((74 : Rat) / 93) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0028
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNNY_coefficient_13_0029 : Poly :=
[
  term ((-25 : Rat) / 93) [(16, 1)]
]

/-- Partial product 29 for generator 13. -/
def rs_R009_ueqv_R009NNNNY_partial_13_0029 : Poly :=
[
  term ((50 : Rat) / 93) [(2, 1), (4, 1), (16, 1)],
  term ((-25 : Rat) / 93) [(2, 2), (16, 1)],
  term ((50 : Rat) / 93) [(3, 1), (5, 1), (16, 1)],
  term ((-25 : Rat) / 93) [(3, 2), (16, 1)],
  term ((-50 : Rat) / 93) [(4, 1), (6, 1), (16, 1)],
  term ((-50 : Rat) / 93) [(5, 1), (7, 1), (16, 1)],
  term ((25 : Rat) / 93) [(6, 2), (16, 1)],
  term ((25 : Rat) / 93) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem rs_R009_ueqv_R009NNNNY_partial_13_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_13_0029
        rs_R009_ueqv_R009NNNNY_generator_13_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_13_0029 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_13_0000_0029 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_13_0000,
  rs_R009_ueqv_R009NNNNY_partial_13_0001,
  rs_R009_ueqv_R009NNNNY_partial_13_0002,
  rs_R009_ueqv_R009NNNNY_partial_13_0003,
  rs_R009_ueqv_R009NNNNY_partial_13_0004,
  rs_R009_ueqv_R009NNNNY_partial_13_0005,
  rs_R009_ueqv_R009NNNNY_partial_13_0006,
  rs_R009_ueqv_R009NNNNY_partial_13_0007,
  rs_R009_ueqv_R009NNNNY_partial_13_0008,
  rs_R009_ueqv_R009NNNNY_partial_13_0009,
  rs_R009_ueqv_R009NNNNY_partial_13_0010,
  rs_R009_ueqv_R009NNNNY_partial_13_0011,
  rs_R009_ueqv_R009NNNNY_partial_13_0012,
  rs_R009_ueqv_R009NNNNY_partial_13_0013,
  rs_R009_ueqv_R009NNNNY_partial_13_0014,
  rs_R009_ueqv_R009NNNNY_partial_13_0015,
  rs_R009_ueqv_R009NNNNY_partial_13_0016,
  rs_R009_ueqv_R009NNNNY_partial_13_0017,
  rs_R009_ueqv_R009NNNNY_partial_13_0018,
  rs_R009_ueqv_R009NNNNY_partial_13_0019,
  rs_R009_ueqv_R009NNNNY_partial_13_0020,
  rs_R009_ueqv_R009NNNNY_partial_13_0021,
  rs_R009_ueqv_R009NNNNY_partial_13_0022,
  rs_R009_ueqv_R009NNNNY_partial_13_0023,
  rs_R009_ueqv_R009NNNNY_partial_13_0024,
  rs_R009_ueqv_R009NNNNY_partial_13_0025,
  rs_R009_ueqv_R009NNNNY_partial_13_0026,
  rs_R009_ueqv_R009NNNNY_partial_13_0027,
  rs_R009_ueqv_R009NNNNY_partial_13_0028,
  rs_R009_ueqv_R009NNNNY_partial_13_0029
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_13_0000_0029 : Poly :=
[
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 3), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((1316 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-512 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((1318 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((884 : Rat) / 93) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-29 : Rat) / 93) [(2, 1), (3, 2), (16, 1)],
  term ((-380 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-1894 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((2494 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((1334 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((-58 : Rat) / 93) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((10 : Rat) / 93) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-910 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((121 : Rat) / 93) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-14 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((148 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((50 : Rat) / 93) [(2, 1), (4, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((29 : Rat) / 93) [(2, 1), (6, 2), (16, 1)],
  term ((29 : Rat) / 93) [(2, 1), (7, 2), (16, 1)],
  term ((-14 : Rat) / 3) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-658 : Rat) / 93) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((256 : Rat) / 31) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-659 : Rat) / 93) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 2), (3, 2), (16, 1)],
  term ((58 : Rat) / 93) [(2, 2), (4, 1), (16, 1)],
  term ((190 : Rat) / 93) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((947 : Rat) / 93) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1247 : Rat) / 93) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-667 : Rat) / 93) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (5, 2), (16, 1)],
  term ((-5 : Rat) / 93) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((158 : Rat) / 93) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((58 : Rat) / 31) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 2) [(2, 2), (10, 1), (16, 1)],
  term ((455 : Rat) / 31) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((659 : Rat) / 93) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (11, 2), (16, 1)],
  term ((-121 : Rat) / 186) [(2, 2), (12, 1), (16, 1)],
  term ((7 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-74 : Rat) / 93) [(2, 2), (13, 2), (16, 1)],
  term ((-25 : Rat) / 93) [(2, 2), (16, 1)],
  term ((-29 : Rat) / 93) [(2, 3), (16, 1)],
  term ((-28 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1316 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((512 : Rat) / 31) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 3) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-1306 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((1220 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-910 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1318 : Rat) / 93) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((121 : Rat) / 93) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-14 : Rat) / 93) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((148 : Rat) / 93) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((50 : Rat) / 93) [(3, 1), (5, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-1894 : Rat) / 93) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((2494 : Rat) / 93) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((1334 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (5, 3), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((658 : Rat) / 93) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-256 : Rat) / 31) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((659 : Rat) / 93) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((658 : Rat) / 93) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-256 : Rat) / 31) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((659 : Rat) / 93) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((221 : Rat) / 93) [(3, 1), (7, 3), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((58 : Rat) / 31) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((73 : Rat) / 3) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-2783 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term (7 : Rat) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((292 : Rat) / 31) [(3, 2), (5, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (6, 2), (16, 1)],
  term ((-5 : Rat) / 93) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((158 : Rat) / 93) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (7, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((58 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 2) [(3, 2), (10, 1), (16, 1)],
  term ((455 : Rat) / 31) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((659 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (11, 2), (16, 1)],
  term ((-121 : Rat) / 186) [(3, 2), (12, 1), (16, 1)],
  term ((7 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-74 : Rat) / 93) [(3, 2), (13, 2), (16, 1)],
  term ((-25 : Rat) / 93) [(3, 2), (16, 1)],
  term ((150 : Rat) / 31) [(3, 3), (5, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 3), (7, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 3), (9, 1), (16, 1)],
  term ((-658 : Rat) / 93) [(3, 3), (11, 1), (16, 1)],
  term ((256 : Rat) / 31) [(3, 3), (13, 1), (16, 1)],
  term ((-659 : Rat) / 93) [(3, 3), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 4), (16, 1)],
  term ((380 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((1894 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-2494 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1334 : Rat) / 93) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-10 : Rat) / 93) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((316 : Rat) / 93) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((116 : Rat) / 31) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((910 : Rat) / 31) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1318 : Rat) / 93) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-121 : Rat) / 93) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((14 : Rat) / 93) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-50 : Rat) / 93) [(4, 1), (6, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-947 : Rat) / 93) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((1247 : Rat) / 93) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((667 : Rat) / 93) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((116 : Rat) / 31) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((910 : Rat) / 31) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((1318 : Rat) / 93) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-121 : Rat) / 93) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((14 : Rat) / 93) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-50 : Rat) / 93) [(5, 1), (7, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-319 : Rat) / 31) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((521 : Rat) / 31) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((667 : Rat) / 93) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 2), (6, 2), (16, 1)],
  term ((380 : Rat) / 93) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((1894 : Rat) / 93) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-2494 : Rat) / 93) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1334 : Rat) / 93) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 2), (7, 2), (16, 1)],
  term ((16 : Rat) / 93) [(5, 3), (7, 1), (16, 1)],
  term ((5 : Rat) / 93) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((182 : Rat) / 93) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(6, 2), (10, 1), (16, 1)],
  term ((-455 : Rat) / 31) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-659 : Rat) / 93) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 2), (11, 2), (16, 1)],
  term ((121 : Rat) / 186) [(6, 2), (12, 1), (16, 1)],
  term ((-7 : Rat) / 93) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((74 : Rat) / 93) [(6, 2), (13, 2), (16, 1)],
  term ((25 : Rat) / 93) [(6, 2), (16, 1)],
  term ((182 : Rat) / 93) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 2), (10, 1), (16, 1)],
  term ((-455 : Rat) / 31) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-659 : Rat) / 93) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (11, 2), (16, 1)],
  term ((121 : Rat) / 186) [(7, 2), (12, 1), (16, 1)],
  term ((-7 : Rat) / 93) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((74 : Rat) / 93) [(7, 2), (13, 2), (16, 1)],
  term ((25 : Rat) / 93) [(7, 2), (16, 1)],
  term ((5 : Rat) / 93) [(7, 3), (11, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 29. -/
theorem rs_R009_ueqv_R009NNNNY_block_13_0000_0029_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_13_0000_0029
      rs_R009_ueqv_R009NNNNY_block_13_0000_0029 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
