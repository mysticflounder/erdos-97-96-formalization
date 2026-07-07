/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 15:0-42

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0000 : Poly :=
[
  term ((-245 : Rat) / 31) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0000 : Poly :=
[
  term ((490 : Rat) / 31) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((490 : Rat) / 31) [(0, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0000
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0001 : Poly :=
[
  term ((83 : Rat) / 186) [(0, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0001 : Poly :=
[
  term ((-83 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((83 : Rat) / 186) [(0, 1), (2, 2), (16, 1)],
  term ((-83 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((83 : Rat) / 186) [(0, 1), (3, 2), (16, 1)],
  term ((83 : Rat) / 93) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((83 : Rat) / 93) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-83 : Rat) / 186) [(0, 1), (14, 2), (16, 1)],
  term ((-83 : Rat) / 186) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0001
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0002 : Poly :=
[
  term ((42 : Rat) / 31) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0002 : Poly :=
[
  term ((-84 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0002
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0003 : Poly :=
[
  term ((182 : Rat) / 93) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0003 : Poly :=
[
  term ((-364 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (9, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0003
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0004 : Poly :=
[
  term ((-72 : Rat) / 31) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0004 : Poly :=
[
  term ((144 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0004
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0005 : Poly :=
[
  term ((-652 : Rat) / 93) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0005 : Poly :=
[
  term ((1304 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0005
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0006 : Poly :=
[
  term ((221 : Rat) / 62) [(2, 1), (16, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0006 : Poly :=
[
  term ((-221 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((221 : Rat) / 62) [(2, 1), (3, 2), (16, 1)],
  term ((221 : Rat) / 31) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((221 : Rat) / 31) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 62) [(2, 1), (14, 2), (16, 1)],
  term ((-221 : Rat) / 62) [(2, 1), (15, 2), (16, 1)],
  term ((-221 : Rat) / 31) [(2, 2), (4, 1), (16, 1)],
  term ((221 : Rat) / 62) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0006
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0007 : Poly :=
[
  term ((-8 : Rat) / 93) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0007 : Poly :=
[
  term ((16 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 93) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 2), (5, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0007
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0008 : Poly :=
[
  term ((221 : Rat) / 93) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0008 : Poly :=
[
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((221 : Rat) / 93) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((221 : Rat) / 93) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0008
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0009 : Poly :=
[
  term ((-190 : Rat) / 93) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0009 : Poly :=
[
  term ((380 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((190 : Rat) / 93) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((190 : Rat) / 93) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((380 : Rat) / 93) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0009
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0010 : Poly :=
[
  term ((-207 : Rat) / 31) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0010 : Poly :=
[
  term ((414 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-207 : Rat) / 31) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-414 : Rat) / 31) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-414 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((207 : Rat) / 31) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((207 : Rat) / 31) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((414 : Rat) / 31) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-207 : Rat) / 31) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0010
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0011 : Poly :=
[
  term ((371 : Rat) / 93) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0011 : Poly :=
[
  term ((-742 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((371 : Rat) / 93) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((742 : Rat) / 93) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((742 : Rat) / 93) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-371 : Rat) / 93) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-371 : Rat) / 93) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-742 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((371 : Rat) / 93) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0011
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0012 : Poly :=
[
  term ((880 : Rat) / 93) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0012 : Poly :=
[
  term ((-1760 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((880 : Rat) / 93) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((1760 : Rat) / 93) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1760 : Rat) / 93) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-880 : Rat) / 93) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-880 : Rat) / 93) [(3, 1), (15, 3), (16, 1)],
  term ((-1760 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((880 : Rat) / 93) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0012
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0013 : Poly :=
[
  term ((442 : Rat) / 93) [(3, 2), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0013 : Poly :=
[
  term ((-884 : Rat) / 93) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 2), (3, 2), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (14, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (15, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 3), (5, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0013
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0014 : Poly :=
[
  term ((112 : Rat) / 31) [(4, 1), (16, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0014 : Poly :=
[
  term ((-224 : Rat) / 31) [(2, 1), (4, 2), (16, 1)],
  term ((112 : Rat) / 31) [(2, 2), (4, 1), (16, 1)],
  term ((-224 : Rat) / 31) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((112 : Rat) / 31) [(3, 2), (4, 1), (16, 1)],
  term ((224 : Rat) / 31) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-112 : Rat) / 31) [(4, 1), (14, 2), (16, 1)],
  term ((-112 : Rat) / 31) [(4, 1), (15, 2), (16, 1)],
  term ((224 : Rat) / 31) [(4, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0014
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0015 : Poly :=
[
  term ((-58 : Rat) / 93) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0015 : Poly :=
[
  term ((116 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((116 : Rat) / 93) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((58 : Rat) / 93) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((58 : Rat) / 93) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0015
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0016 : Poly :=
[
  term ((16 : Rat) / 31) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0016 : Poly :=
[
  term ((-32 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 31) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 31) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((32 : Rat) / 31) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0016
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0017 : Poly :=
[
  term ((-8 : Rat) / 93) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0017 : Poly :=
[
  term ((16 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0017
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0018 : Poly :=
[
  term ((197 : Rat) / 31) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0018 : Poly :=
[
  term ((-394 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 31) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 31) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 31) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 31) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-197 : Rat) / 31) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-197 : Rat) / 31) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((394 : Rat) / 31) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0018
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0019 : Poly :=
[
  term ((-607 : Rat) / 186) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0019 : Poly :=
[
  term ((607 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-607 : Rat) / 186) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((607 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-607 : Rat) / 186) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-607 : Rat) / 93) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((607 : Rat) / 186) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((607 : Rat) / 186) [(5, 1), (15, 3), (16, 1)],
  term ((-607 : Rat) / 93) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0019
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0020 : Poly :=
[
  term ((5 : Rat) / 93) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0020 : Poly :=
[
  term ((-10 : Rat) / 93) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((5 : Rat) / 93) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-10 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((5 : Rat) / 93) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((10 : Rat) / 93) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((10 : Rat) / 93) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 93) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 93) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0020
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0021 : Poly :=
[
  term ((-158 : Rat) / 93) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0021 : Poly :=
[
  term ((316 : Rat) / 93) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((316 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((158 : Rat) / 93) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((158 : Rat) / 93) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0021
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0022 : Poly :=
[
  term ((38 : Rat) / 31) [(8, 1), (16, 1)]
]

/-- Partial product 22 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0022 : Poly :=
[
  term ((-76 : Rat) / 31) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((38 : Rat) / 31) [(2, 2), (8, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((38 : Rat) / 31) [(3, 2), (8, 1), (16, 1)],
  term ((76 : Rat) / 31) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 31) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 31) [(8, 1), (14, 2), (16, 1)],
  term ((-38 : Rat) / 31) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0022
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0023 : Poly :=
[
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 23 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0023 : Poly :=
[
  term ((-364 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 31) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 31) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((364 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 31) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0023
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0024 : Poly :=
[
  term ((-11 : Rat) / 31) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0024 : Poly :=
[
  term ((22 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-11 : Rat) / 31) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((22 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-11 : Rat) / 31) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-22 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 31) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((11 : Rat) / 31) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0024
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0025 : Poly :=
[
  term ((-182 : Rat) / 93) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0025 : Poly :=
[
  term ((364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((182 : Rat) / 93) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0025
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0026 : Poly :=
[
  term ((-221 : Rat) / 31) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0026 : Poly :=
[
  term ((442 : Rat) / 31) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-221 : Rat) / 31) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 31) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-221 : Rat) / 31) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 31) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-442 : Rat) / 31) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 31) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((221 : Rat) / 31) [(10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0026
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0027 : Poly :=
[
  term ((-175 : Rat) / 93) [(10, 1), (16, 1)]
]

/-- Partial product 27 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0027 : Poly :=
[
  term ((350 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-175 : Rat) / 93) [(2, 2), (10, 1), (16, 1)],
  term ((350 : Rat) / 93) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-175 : Rat) / 93) [(3, 2), (10, 1), (16, 1)],
  term ((-350 : Rat) / 93) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-350 : Rat) / 93) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((175 : Rat) / 93) [(10, 1), (14, 2), (16, 1)],
  term ((175 : Rat) / 93) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0027
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0028 : Poly :=
[
  term ((-1139 : Rat) / 31) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 28 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0028 : Poly :=
[
  term ((2278 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2278 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1139 : Rat) / 31) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0028
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0029 : Poly :=
[
  term ((415 : Rat) / 62) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0029 : Poly :=
[
  term ((-415 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((415 : Rat) / 62) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-415 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((415 : Rat) / 62) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((415 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((415 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-415 : Rat) / 62) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-415 : Rat) / 62) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0029
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0030 : Poly :=
[
  term ((-58 : Rat) / 31) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0030 : Poly :=
[
  term ((116 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 31) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((58 : Rat) / 31) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0030
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0031 : Poly :=
[
  term ((-282 : Rat) / 31) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0031 : Poly :=
[
  term ((564 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-282 : Rat) / 31) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((564 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-282 : Rat) / 31) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-564 : Rat) / 31) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-564 : Rat) / 31) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((282 : Rat) / 31) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((282 : Rat) / 31) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0031
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0032 : Poly :=
[
  term (27 : Rat) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 32 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0032 : Poly :=
[
  term (-54 : Rat) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term (27 : Rat) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term (-54 : Rat) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term (27 : Rat) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term (54 : Rat) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term (54 : Rat) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term (-27 : Rat) [(11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0032
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0033 : Poly :=
[
  term ((-85 : Rat) / 6) [(11, 2), (16, 1)]
]

/-- Partial product 33 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0033 : Poly :=
[
  term ((85 : Rat) / 3) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-85 : Rat) / 6) [(2, 2), (11, 2), (16, 1)],
  term ((85 : Rat) / 3) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-85 : Rat) / 6) [(3, 2), (11, 2), (16, 1)],
  term ((-85 : Rat) / 3) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-85 : Rat) / 3) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((85 : Rat) / 6) [(11, 2), (14, 2), (16, 1)],
  term ((85 : Rat) / 6) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0033
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0034 : Poly :=
[
  term ((4 : Rat) / 31) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 34 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0034 : Poly :=
[
  term ((-8 : Rat) / 31) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 31) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 31) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 31) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 31) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 31) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0034
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0035 : Poly :=
[
  term ((121 : Rat) / 62) [(12, 1), (16, 1)]
]

/-- Partial product 35 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0035 : Poly :=
[
  term ((-121 : Rat) / 31) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((121 : Rat) / 62) [(2, 2), (12, 1), (16, 1)],
  term ((-121 : Rat) / 31) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((121 : Rat) / 62) [(3, 2), (12, 1), (16, 1)],
  term ((121 : Rat) / 31) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((121 : Rat) / 31) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-121 : Rat) / 62) [(12, 1), (14, 2), (16, 1)],
  term ((-121 : Rat) / 62) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0035
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0036 : Poly :=
[
  term ((8 : Rat) / 31) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0036 : Poly :=
[
  term ((-16 : Rat) / 31) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 31) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 31) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8 : Rat) / 31) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0036
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0037 : Poly :=
[
  term ((239 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0037 : Poly :=
[
  term ((-478 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((239 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-478 : Rat) / 93) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((239 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((478 : Rat) / 93) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((478 : Rat) / 93) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-239 : Rat) / 93) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-239 : Rat) / 93) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0037
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0038 : Poly :=
[
  term ((74 : Rat) / 93) [(13, 2), (16, 1)]
]

/-- Partial product 38 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0038 : Poly :=
[
  term ((-148 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((74 : Rat) / 93) [(2, 2), (13, 2), (16, 1)],
  term ((-148 : Rat) / 93) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((74 : Rat) / 93) [(3, 2), (13, 2), (16, 1)],
  term ((148 : Rat) / 93) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((148 : Rat) / 93) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-74 : Rat) / 93) [(13, 2), (14, 2), (16, 1)],
  term ((-74 : Rat) / 93) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0038
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0039 : Poly :=
[
  term ((-4 : Rat) / 31) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0039 : Poly :=
[
  term ((8 : Rat) / 31) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((4 : Rat) / 31) [(14, 1), (15, 4), (16, 1)],
  term ((4 : Rat) / 31) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0039
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0040 : Poly :=
[
  term ((595 : Rat) / 124) [(14, 1), (16, 1)]
]

/-- Partial product 40 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0040 : Poly :=
[
  term ((-595 : Rat) / 62) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((595 : Rat) / 124) [(2, 2), (14, 1), (16, 1)],
  term ((-595 : Rat) / 62) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((595 : Rat) / 124) [(3, 2), (14, 1), (16, 1)],
  term ((595 : Rat) / 62) [(4, 1), (14, 2), (16, 1)],
  term ((595 : Rat) / 62) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-595 : Rat) / 124) [(14, 1), (15, 2), (16, 1)],
  term ((-595 : Rat) / 124) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0040
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0041 : Poly :=
[
  term ((1381 : Rat) / 186) [(15, 2), (16, 1)]
]

/-- Partial product 41 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0041 : Poly :=
[
  term ((-1381 : Rat) / 93) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((1381 : Rat) / 186) [(2, 2), (15, 2), (16, 1)],
  term ((-1381 : Rat) / 93) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((1381 : Rat) / 186) [(3, 2), (15, 2), (16, 1)],
  term ((1381 : Rat) / 93) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((1381 : Rat) / 93) [(5, 1), (15, 3), (16, 1)],
  term ((-1381 : Rat) / 186) [(14, 2), (15, 2), (16, 1)],
  term ((-1381 : Rat) / 186) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0041
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNNY_coefficient_15_0042 : Poly :=
[
  term ((-925 : Rat) / 186) [(16, 1)]
]

/-- Partial product 42 for generator 15. -/
def rs_R009_ueqv_R009NNNNY_partial_15_0042 : Poly :=
[
  term ((925 : Rat) / 93) [(2, 1), (4, 1), (16, 1)],
  term ((-925 : Rat) / 186) [(2, 2), (16, 1)],
  term ((925 : Rat) / 93) [(3, 1), (5, 1), (16, 1)],
  term ((-925 : Rat) / 186) [(3, 2), (16, 1)],
  term ((-925 : Rat) / 93) [(4, 1), (14, 1), (16, 1)],
  term ((-925 : Rat) / 93) [(5, 1), (15, 1), (16, 1)],
  term ((925 : Rat) / 186) [(14, 2), (16, 1)],
  term ((925 : Rat) / 186) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 15. -/
theorem rs_R009_ueqv_R009NNNNY_partial_15_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_15_0042
        rs_R009_ueqv_R009NNNNY_generator_15_0000_0042 =
      rs_R009_ueqv_R009NNNNY_partial_15_0042 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_15_0000_0042 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_15_0000,
  rs_R009_ueqv_R009NNNNY_partial_15_0001,
  rs_R009_ueqv_R009NNNNY_partial_15_0002,
  rs_R009_ueqv_R009NNNNY_partial_15_0003,
  rs_R009_ueqv_R009NNNNY_partial_15_0004,
  rs_R009_ueqv_R009NNNNY_partial_15_0005,
  rs_R009_ueqv_R009NNNNY_partial_15_0006,
  rs_R009_ueqv_R009NNNNY_partial_15_0007,
  rs_R009_ueqv_R009NNNNY_partial_15_0008,
  rs_R009_ueqv_R009NNNNY_partial_15_0009,
  rs_R009_ueqv_R009NNNNY_partial_15_0010,
  rs_R009_ueqv_R009NNNNY_partial_15_0011,
  rs_R009_ueqv_R009NNNNY_partial_15_0012,
  rs_R009_ueqv_R009NNNNY_partial_15_0013,
  rs_R009_ueqv_R009NNNNY_partial_15_0014,
  rs_R009_ueqv_R009NNNNY_partial_15_0015,
  rs_R009_ueqv_R009NNNNY_partial_15_0016,
  rs_R009_ueqv_R009NNNNY_partial_15_0017,
  rs_R009_ueqv_R009NNNNY_partial_15_0018,
  rs_R009_ueqv_R009NNNNY_partial_15_0019,
  rs_R009_ueqv_R009NNNNY_partial_15_0020,
  rs_R009_ueqv_R009NNNNY_partial_15_0021,
  rs_R009_ueqv_R009NNNNY_partial_15_0022,
  rs_R009_ueqv_R009NNNNY_partial_15_0023,
  rs_R009_ueqv_R009NNNNY_partial_15_0024,
  rs_R009_ueqv_R009NNNNY_partial_15_0025,
  rs_R009_ueqv_R009NNNNY_partial_15_0026,
  rs_R009_ueqv_R009NNNNY_partial_15_0027,
  rs_R009_ueqv_R009NNNNY_partial_15_0028,
  rs_R009_ueqv_R009NNNNY_partial_15_0029,
  rs_R009_ueqv_R009NNNNY_partial_15_0030,
  rs_R009_ueqv_R009NNNNY_partial_15_0031,
  rs_R009_ueqv_R009NNNNY_partial_15_0032,
  rs_R009_ueqv_R009NNNNY_partial_15_0033,
  rs_R009_ueqv_R009NNNNY_partial_15_0034,
  rs_R009_ueqv_R009NNNNY_partial_15_0035,
  rs_R009_ueqv_R009NNNNY_partial_15_0036,
  rs_R009_ueqv_R009NNNNY_partial_15_0037,
  rs_R009_ueqv_R009NNNNY_partial_15_0038,
  rs_R009_ueqv_R009NNNNY_partial_15_0039,
  rs_R009_ueqv_R009NNNNY_partial_15_0040,
  rs_R009_ueqv_R009NNNNY_partial_15_0041,
  rs_R009_ueqv_R009NNNNY_partial_15_0042
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_15_0000_0042 : Poly :=
[
  term ((490 : Rat) / 31) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-83 : Rat) / 93) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((83 : Rat) / 186) [(0, 1), (2, 2), (16, 1)],
  term ((490 : Rat) / 31) [(0, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-83 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-245 : Rat) / 31) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((83 : Rat) / 186) [(0, 1), (3, 2), (16, 1)],
  term ((83 : Rat) / 93) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((-490 : Rat) / 31) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((83 : Rat) / 93) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-83 : Rat) / 186) [(0, 1), (14, 2), (16, 1)],
  term ((245 : Rat) / 31) [(0, 1), (14, 3), (16, 1)],
  term ((-83 : Rat) / 186) [(0, 1), (15, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((1304 : Rat) / 93) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((1556 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-652 : Rat) / 93) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 3), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1304 : Rat) / 93) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((72 : Rat) / 31) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((652 : Rat) / 93) [(1, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((380 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((414 : Rat) / 31) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-742 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-1760 : Rat) / 93) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 31) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((221 : Rat) / 62) [(2, 1), (3, 2), (16, 1)],
  term ((116 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-32 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-394 : Rat) / 31) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((607 : Rat) / 93) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 93) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((316 : Rat) / 93) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-364 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((22 : Rat) / 31) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((442 : Rat) / 31) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((350 : Rat) / 93) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((2278 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-415 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((116 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((564 : Rat) / 31) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term (-54 : Rat) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((85 : Rat) / 3) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-121 : Rat) / 31) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-478 : Rat) / 93) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((8 : Rat) / 31) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-153 : Rat) / 62) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-1381 : Rat) / 93) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((925 : Rat) / 93) [(2, 1), (4, 1), (16, 1)],
  term ((-224 : Rat) / 31) [(2, 1), (4, 2), (16, 1)],
  term ((221 : Rat) / 31) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 62) [(2, 1), (14, 2), (16, 1)],
  term ((-221 : Rat) / 62) [(2, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((221 : Rat) / 93) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-207 : Rat) / 31) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((371 : Rat) / 93) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((880 : Rat) / 93) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 2), (3, 2), (16, 1)],
  term ((-109 : Rat) / 31) [(2, 2), (4, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((16 : Rat) / 31) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((197 : Rat) / 31) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-607 : Rat) / 186) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 93) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((38 : Rat) / 31) [(2, 2), (8, 1), (16, 1)],
  term ((182 : Rat) / 31) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 31) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-221 : Rat) / 31) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 93) [(2, 2), (10, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((415 : Rat) / 62) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-282 : Rat) / 31) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((-85 : Rat) / 6) [(2, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 31) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((121 : Rat) / 62) [(2, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 31) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((239 : Rat) / 93) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((74 : Rat) / 93) [(2, 2), (13, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((595 : Rat) / 124) [(2, 2), (14, 1), (16, 1)],
  term ((1381 : Rat) / 186) [(2, 2), (15, 2), (16, 1)],
  term ((-925 : Rat) / 186) [(2, 2), (16, 1)],
  term ((221 : Rat) / 62) [(2, 3), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-224 : Rat) / 31) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-414 : Rat) / 31) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((742 : Rat) / 93) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((1760 : Rat) / 93) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((316 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-364 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((22 : Rat) / 31) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 31) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((350 : Rat) / 93) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((2278 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-415 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((116 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((150 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term (-54 : Rat) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((85 : Rat) / 3) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-121 : Rat) / 31) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((8 : Rat) / 31) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-595 : Rat) / 62) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((129 : Rat) / 31) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((925 : Rat) / 93) [(3, 1), (5, 1), (16, 1)],
  term ((116 : Rat) / 93) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-32 : Rat) / 31) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-394 : Rat) / 31) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 31) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((190 : Rat) / 93) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((190 : Rat) / 93) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((207 : Rat) / 31) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((207 : Rat) / 31) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-371 : Rat) / 93) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-371 : Rat) / 93) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-880 : Rat) / 93) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-880 : Rat) / 93) [(3, 1), (15, 3), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((112 : Rat) / 31) [(3, 2), (4, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((380 : Rat) / 93) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((1184 : Rat) / 93) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((16 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-250 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((197 : Rat) / 31) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359 : Rat) / 186) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 2), (5, 2), (16, 1)],
  term ((5 : Rat) / 93) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((38 : Rat) / 31) [(3, 2), (8, 1), (16, 1)],
  term ((182 : Rat) / 31) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 31) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-221 : Rat) / 31) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 93) [(3, 2), (10, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((415 : Rat) / 62) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-282 : Rat) / 31) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((-85 : Rat) / 6) [(3, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 31) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((121 : Rat) / 62) [(3, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 31) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((239 : Rat) / 93) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((74 : Rat) / 93) [(3, 2), (13, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((595 : Rat) / 124) [(3, 2), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (14, 2), (16, 1)],
  term ((497 : Rat) / 186) [(3, 2), (15, 2), (16, 1)],
  term ((-925 : Rat) / 186) [(3, 2), (16, 1)],
  term ((-892 : Rat) / 93) [(3, 3), (5, 1), (16, 1)],
  term ((221 : Rat) / 93) [(3, 3), (7, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(3, 3), (9, 1), (16, 1)],
  term ((-207 : Rat) / 31) [(3, 3), (11, 1), (16, 1)],
  term ((371 : Rat) / 93) [(3, 3), (13, 1), (16, 1)],
  term ((880 : Rat) / 93) [(3, 3), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 4), (16, 1)],
  term ((-116 : Rat) / 93) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-607 : Rat) / 93) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 31) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((224 : Rat) / 31) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 93) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 31) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-22 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-350 : Rat) / 93) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 31) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((415 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-564 : Rat) / 31) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-85 : Rat) / 3) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term (54 : Rat) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((121 : Rat) / 31) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 31) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((478 : Rat) / 93) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((148 : Rat) / 93) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((1381 : Rat) / 93) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-925 : Rat) / 93) [(4, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((371 : Rat) / 62) [(4, 1), (14, 2), (16, 1)],
  term ((-112 : Rat) / 31) [(4, 1), (15, 2), (16, 1)],
  term ((224 : Rat) / 31) [(4, 2), (14, 1), (16, 1)],
  term ((10 : Rat) / 93) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-316 : Rat) / 93) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 31) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 31) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-350 : Rat) / 93) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((415 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 93) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1634 : Rat) / 93) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term (54 : Rat) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 3) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 31) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((121 : Rat) / 31) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((162 : Rat) / 31) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((148 : Rat) / 93) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((595 : Rat) / 62) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 31) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((607 : Rat) / 186) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-197 : Rat) / 31) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((-925 : Rat) / 93) [(5, 1), (15, 1), (16, 1)],
  term ((1123 : Rat) / 62) [(5, 1), (15, 3), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 31) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 31) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-607 : Rat) / 93) [(5, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 93) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 93) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((158 : Rat) / 93) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((158 : Rat) / 93) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38 : Rat) / 31) [(8, 1), (14, 2), (16, 1)],
  term ((-38 : Rat) / 31) [(8, 1), (15, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 31) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(9, 1), (11, 1), (14, 3), (16, 1)],
  term ((11 : Rat) / 31) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((182 : Rat) / 93) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((182 : Rat) / 93) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((221 : Rat) / 31) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((175 : Rat) / 93) [(10, 1), (14, 2), (16, 1)],
  term ((221 : Rat) / 31) [(10, 1), (14, 3), (16, 1)],
  term ((175 : Rat) / 93) [(10, 1), (15, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-415 : Rat) / 62) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-415 : Rat) / 62) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 31) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((282 : Rat) / 31) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((58 : Rat) / 31) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((282 : Rat) / 31) [(11, 1), (15, 3), (16, 1)],
  term (-27 : Rat) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((85 : Rat) / 6) [(11, 2), (14, 2), (16, 1)],
  term (-27 : Rat) [(11, 2), (14, 3), (16, 1)],
  term ((85 : Rat) / 6) [(11, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-121 : Rat) / 62) [(12, 1), (14, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(12, 1), (14, 3), (16, 1)],
  term ((-121 : Rat) / 62) [(12, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-239 : Rat) / 93) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-239 : Rat) / 93) [(13, 1), (15, 3), (16, 1)],
  term ((-74 : Rat) / 93) [(13, 2), (14, 2), (16, 1)],
  term ((-74 : Rat) / 93) [(13, 2), (15, 2), (16, 1)],
  term ((-595 : Rat) / 124) [(14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 31) [(14, 1), (15, 4), (16, 1)],
  term ((-1381 : Rat) / 186) [(14, 2), (15, 2), (16, 1)],
  term ((925 : Rat) / 186) [(14, 2), (16, 1)],
  term ((4 : Rat) / 31) [(14, 3), (15, 2), (16, 1)],
  term ((-595 : Rat) / 124) [(14, 3), (16, 1)],
  term ((925 : Rat) / 186) [(15, 2), (16, 1)],
  term ((-1381 : Rat) / 186) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 42. -/
theorem rs_R009_ueqv_R009NNNNY_block_15_0000_0042_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_15_0000_0042
      rs_R009_ueqv_R009NNNNY_block_15_0000_0042 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
