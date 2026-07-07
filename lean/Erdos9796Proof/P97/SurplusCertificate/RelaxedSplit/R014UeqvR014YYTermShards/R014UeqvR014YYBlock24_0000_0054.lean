/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 24:0-54

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_24_0000_0054 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0000 : Poly :=
[
  term ((5 : Rat) / 4) []
]

/-- Partial product 0 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0000 : Poly :=
[
  term ((-5 : Rat) / 2) [(0, 1), (10, 1)],
  term ((5 : Rat) / 4) [(0, 2)],
  term ((-5 : Rat) / 2) [(1, 1), (11, 1)],
  term ((5 : Rat) / 4) [(1, 2)],
  term ((5 : Rat) / 2) [(10, 1), (14, 1)],
  term ((5 : Rat) / 2) [(11, 1), (15, 1)],
  term ((-5 : Rat) / 4) [(14, 2)],
  term ((-5 : Rat) / 4) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0000_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0000
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0001 : Poly :=
[
  term ((-3 : Rat) / 2) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0001 : Poly :=
[
  term (3 : Rat) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term (-3 : Rat) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((3 : Rat) / 2) [(1, 1), (14, 1), (15, 3)],
  term ((3 : Rat) / 2) [(1, 1), (14, 3), (15, 1)],
  term (3 : Rat) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0001_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0001
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0002 : Poly :=
[
  term ((1 : Rat) / 6) [(1, 1), (15, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0002 : Poly :=
[
  term ((-1 : Rat) / 3) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((1 : Rat) / 6) [(0, 2), (1, 1), (15, 1)],
  term ((1 : Rat) / 3) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(1, 1), (11, 1), (15, 2)],
  term ((-1 : Rat) / 6) [(1, 1), (14, 2), (15, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (15, 3)],
  term ((-1 : Rat) / 3) [(1, 2), (11, 1), (15, 1)],
  term ((1 : Rat) / 6) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0002_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0002
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0003 : Poly :=
[
  term ((-17 : Rat) / 12) [(2, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0003 : Poly :=
[
  term ((17 : Rat) / 6) [(0, 1), (2, 1), (10, 1)],
  term ((-17 : Rat) / 12) [(0, 2), (2, 1)],
  term ((17 : Rat) / 6) [(1, 1), (2, 1), (11, 1)],
  term ((-17 : Rat) / 12) [(1, 2), (2, 1)],
  term ((-17 : Rat) / 6) [(2, 1), (10, 1), (14, 1)],
  term ((-17 : Rat) / 6) [(2, 1), (11, 1), (15, 1)],
  term ((17 : Rat) / 12) [(2, 1), (14, 2)],
  term ((17 : Rat) / 12) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0003_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0003
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0004 : Poly :=
[
  term ((-41 : Rat) / 2) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0004 : Poly :=
[
  term (41 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-41 : Rat) / 2) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term (41 : Rat) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-41 : Rat) / 2) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term (-41 : Rat) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term (-41 : Rat) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((41 : Rat) / 2) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((41 : Rat) / 2) [(2, 1), (3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0004_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0004
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0005 : Poly :=
[
  term (6 : Rat) [(2, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0005 : Poly :=
[
  term (-12 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (7, 1), (14, 2), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0005_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0005
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0006 : Poly :=
[
  term (1 : Rat) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0006 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term (1 : Rat) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term (-2 : Rat) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term (1 : Rat) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term (2 : Rat) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (2 : Rat) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term (-1 : Rat) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term (-1 : Rat) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0006_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0006
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0007 : Poly :=
[
  term ((-16867 : Rat) / 770) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 7 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0007 : Poly :=
[
  term ((16867 : Rat) / 385) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-16867 : Rat) / 770) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((16867 : Rat) / 385) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-16867 : Rat) / 770) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-16867 : Rat) / 385) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-16867 : Rat) / 385) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((16867 : Rat) / 770) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((16867 : Rat) / 770) [(2, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0007_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0007
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0008 : Poly :=
[
  term (30 : Rat) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0008 : Poly :=
[
  term (-60 : Rat) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term (-60 : Rat) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term (60 : Rat) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (60 : Rat) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term (-30 : Rat) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term (-30 : Rat) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0008_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0008
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0009 : Poly :=
[
  term ((7 : Rat) / 8) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0009 : Poly :=
[
  term ((-7 : Rat) / 4) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((7 : Rat) / 8) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-7 : Rat) / 4) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((7 : Rat) / 8) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((7 : Rat) / 4) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((7 : Rat) / 4) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7 : Rat) / 8) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-7 : Rat) / 8) [(2, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0009_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0009
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0010 : Poly :=
[
  term ((-3 : Rat) / 2) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0010 : Poly :=
[
  term (3 : Rat) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0010_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0010
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0011 : Poly :=
[
  term ((-111 : Rat) / 16) [(3, 1), (7, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0011 : Poly :=
[
  term ((111 : Rat) / 8) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-111 : Rat) / 16) [(0, 2), (3, 1), (7, 1)],
  term ((111 : Rat) / 8) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-111 : Rat) / 16) [(1, 2), (3, 1), (7, 1)],
  term ((-111 : Rat) / 8) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-111 : Rat) / 8) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((111 : Rat) / 16) [(3, 1), (7, 1), (14, 2)],
  term ((111 : Rat) / 16) [(3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0011_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0011
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0012 : Poly :=
[
  term (13 : Rat) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0012 : Poly :=
[
  term (-26 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term (13 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term (-26 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term (13 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term (26 : Rat) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term (26 : Rat) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term (-13 : Rat) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term (-13 : Rat) [(3, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0012_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0012
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0013 : Poly :=
[
  term (-3 : Rat) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0013 : Poly :=
[
  term (6 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term (-6 : Rat) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(3, 1), (7, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0013_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0013
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0014 : Poly :=
[
  term (2 : Rat) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0014 : Poly :=
[
  term (-4 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0014_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0014
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0015 : Poly :=
[
  term (1 : Rat) [(3, 1), (9, 1)]
]

/-- Partial product 15 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0015 : Poly :=
[
  term (-2 : Rat) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term (1 : Rat) [(0, 2), (3, 1), (9, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term (1 : Rat) [(1, 2), (3, 1), (9, 1)],
  term (2 : Rat) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term (-1 : Rat) [(3, 1), (9, 1), (14, 2)],
  term (-1 : Rat) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0015_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0015
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0016 : Poly :=
[
  term (-2 : Rat) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0016 : Poly :=
[
  term (4 : Rat) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (-2 : Rat) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term (4 : Rat) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term (-2 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term (-4 : Rat) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term (-4 : Rat) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term (2 : Rat) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0016_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0016
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0017 : Poly :=
[
  term (7 : Rat) [(3, 1), (13, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0017 : Poly :=
[
  term (-14 : Rat) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term (7 : Rat) [(0, 2), (3, 1), (13, 1)],
  term (-14 : Rat) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term (7 : Rat) [(1, 2), (3, 1), (13, 1)],
  term (14 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term (14 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term (-7 : Rat) [(3, 1), (13, 1), (14, 2)],
  term (-7 : Rat) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0017_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0017
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0018 : Poly :=
[
  term ((-2381 : Rat) / 770) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0018 : Poly :=
[
  term ((2381 : Rat) / 385) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2381 : Rat) / 770) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((2381 : Rat) / 385) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2381 : Rat) / 770) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-2381 : Rat) / 385) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2381 : Rat) / 385) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((2381 : Rat) / 770) [(3, 1), (14, 1), (15, 3)],
  term ((2381 : Rat) / 770) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0018_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0018
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0019 : Poly :=
[
  term (-12 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0019 : Poly :=
[
  term (24 : Rat) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0019_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0019
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0020 : Poly :=
[
  term ((229 : Rat) / 385) [(3, 1), (15, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0020 : Poly :=
[
  term ((-458 : Rat) / 385) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((229 : Rat) / 385) [(0, 2), (3, 1), (15, 1)],
  term ((-458 : Rat) / 385) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((229 : Rat) / 385) [(1, 2), (3, 1), (15, 1)],
  term ((458 : Rat) / 385) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((458 : Rat) / 385) [(3, 1), (11, 1), (15, 2)],
  term ((-229 : Rat) / 385) [(3, 1), (14, 2), (15, 1)],
  term ((-229 : Rat) / 385) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0020_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0020
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0021 : Poly :=
[
  term ((27 : Rat) / 4) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0021 : Poly :=
[
  term ((-27 : Rat) / 2) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 4) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 4) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 2) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 2) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-27 : Rat) / 4) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27 : Rat) / 4) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0021_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0021
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0022 : Poly :=
[
  term ((2 : Rat) / 3) [(5, 1), (7, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0022 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (5, 1), (7, 1), (10, 1)],
  term ((2 : Rat) / 3) [(0, 2), (5, 1), (7, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((2 : Rat) / 3) [(1, 2), (5, 1), (7, 1)],
  term ((4 : Rat) / 3) [(5, 1), (7, 1), (10, 1), (14, 1)],
  term ((4 : Rat) / 3) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (7, 1), (14, 2)],
  term ((-2 : Rat) / 3) [(5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0022_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0022
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0023 : Poly :=
[
  term ((3 : Rat) / 2) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0023 : Poly :=
[
  term (-3 : Rat) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term (3 : Rat) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 1), (15, 3)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0023_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0023
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0024 : Poly :=
[
  term ((-17 : Rat) / 12) [(5, 1), (15, 1)]
]

/-- Partial product 24 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0024 : Poly :=
[
  term ((17 : Rat) / 6) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(0, 2), (5, 1), (15, 1)],
  term ((17 : Rat) / 6) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(1, 2), (5, 1), (15, 1)],
  term ((-17 : Rat) / 6) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17 : Rat) / 6) [(5, 1), (11, 1), (15, 2)],
  term ((17 : Rat) / 12) [(5, 1), (14, 2), (15, 1)],
  term ((17 : Rat) / 12) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0024_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0024
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0025 : Poly :=
[
  term ((-2 : Rat) / 3) [(7, 1), (9, 1)]
]

/-- Partial product 25 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0025 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (7, 1), (9, 1)],
  term ((4 : Rat) / 3) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (7, 1), (9, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((2 : Rat) / 3) [(7, 1), (9, 1), (14, 2)],
  term ((2 : Rat) / 3) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0025_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0025
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0026 : Poly :=
[
  term ((-89 : Rat) / 240) [(7, 1), (11, 1)]
]

/-- Partial product 26 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0026 : Poly :=
[
  term ((89 : Rat) / 120) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-89 : Rat) / 240) [(0, 2), (7, 1), (11, 1)],
  term ((89 : Rat) / 120) [(1, 1), (7, 1), (11, 2)],
  term ((-89 : Rat) / 240) [(1, 2), (7, 1), (11, 1)],
  term ((-89 : Rat) / 120) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((89 : Rat) / 240) [(7, 1), (11, 1), (14, 2)],
  term ((89 : Rat) / 240) [(7, 1), (11, 1), (15, 2)],
  term ((-89 : Rat) / 120) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0026_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0026
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0027 : Poly :=
[
  term ((49 : Rat) / 30) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 27 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0027 : Poly :=
[
  term ((-49 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((49 : Rat) / 30) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-49 : Rat) / 15) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((49 : Rat) / 30) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((49 : Rat) / 15) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((-49 : Rat) / 30) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-49 : Rat) / 30) [(7, 1), (11, 1), (14, 3)],
  term ((49 : Rat) / 15) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0027_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0027
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0028 : Poly :=
[
  term ((-1 : Rat) / 2) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0028 : Poly :=
[
  term (1 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0028_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0028
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0029 : Poly :=
[
  term ((953 : Rat) / 240) [(7, 1), (13, 1)]
]

/-- Partial product 29 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0029 : Poly :=
[
  term ((-953 : Rat) / 120) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((953 : Rat) / 240) [(0, 2), (7, 1), (13, 1)],
  term ((-953 : Rat) / 120) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((953 : Rat) / 240) [(1, 2), (7, 1), (13, 1)],
  term ((953 : Rat) / 120) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((953 : Rat) / 120) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-953 : Rat) / 240) [(7, 1), (13, 1), (14, 2)],
  term ((-953 : Rat) / 240) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0029_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0029
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0030 : Poly :=
[
  term ((-49 : Rat) / 60) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 30 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0030 : Poly :=
[
  term ((49 : Rat) / 30) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-49 : Rat) / 60) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((49 : Rat) / 30) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-49 : Rat) / 60) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-49 : Rat) / 30) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-49 : Rat) / 30) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((49 : Rat) / 60) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((49 : Rat) / 60) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0030_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0030
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0031 : Poly :=
[
  term ((-3 : Rat) / 2) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0031 : Poly :=
[
  term (3 : Rat) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0031_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0031
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0032 : Poly :=
[
  term ((749 : Rat) / 120) [(7, 1), (15, 1)]
]

/-- Partial product 32 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0032 : Poly :=
[
  term ((-749 : Rat) / 60) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((749 : Rat) / 120) [(0, 2), (7, 1), (15, 1)],
  term ((-749 : Rat) / 60) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((749 : Rat) / 120) [(1, 2), (7, 1), (15, 1)],
  term ((749 : Rat) / 60) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((749 : Rat) / 60) [(7, 1), (11, 1), (15, 2)],
  term ((-749 : Rat) / 120) [(7, 1), (14, 2), (15, 1)],
  term ((-749 : Rat) / 120) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0032_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0032
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0033 : Poly :=
[
  term ((-3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0033 : Poly :=
[
  term (3 : Rat) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0033_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0033
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0034 : Poly :=
[
  term ((-1 : Rat) / 3) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 34 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0034 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((2 : Rat) / 3) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(8, 1), (11, 1), (15, 3)],
  term ((-2 : Rat) / 3) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0034_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0034
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0035 : Poly :=
[
  term ((-1 : Rat) / 3) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 35 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0035 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((2 : Rat) / 3) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 3) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0035_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0035
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0036 : Poly :=
[
  term ((3 : Rat) / 2) [(9, 1), (11, 1)]
]

/-- Partial product 36 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0036 : Poly :=
[
  term (-3 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((3 : Rat) / 2) [(0, 2), (9, 1), (11, 1)],
  term (-3 : Rat) [(1, 1), (9, 1), (11, 2)],
  term ((3 : Rat) / 2) [(1, 2), (9, 1), (11, 1)],
  term (3 : Rat) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1), (14, 2)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1), (15, 2)],
  term (3 : Rat) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0036_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0036
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0037 : Poly :=
[
  term (-1 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 37 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0037 : Poly :=
[
  term (2 : Rat) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term (-1 : Rat) [(0, 2), (9, 1), (13, 1)],
  term (2 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term (-1 : Rat) [(1, 2), (9, 1), (13, 1)],
  term (-2 : Rat) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term (-2 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (14, 2)],
  term (1 : Rat) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0037_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0037
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0038 : Poly :=
[
  term (-1 : Rat) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 38 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0038 : Poly :=
[
  term (2 : Rat) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term (-2 : Rat) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term (1 : Rat) [(9, 1), (14, 1), (15, 3)],
  term (1 : Rat) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0038_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0038
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0039 : Poly :=
[
  term ((5 : Rat) / 12) [(9, 1), (15, 1)]
]

/-- Partial product 39 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0039 : Poly :=
[
  term ((-5 : Rat) / 6) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((5 : Rat) / 12) [(0, 2), (9, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((5 : Rat) / 12) [(1, 2), (9, 1), (15, 1)],
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((5 : Rat) / 6) [(9, 1), (11, 1), (15, 2)],
  term ((-5 : Rat) / 12) [(9, 1), (14, 2), (15, 1)],
  term ((-5 : Rat) / 12) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0039_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0039
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0040 : Poly :=
[
  term ((-7 : Rat) / 6) [(10, 1)]
]

/-- Partial product 40 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0040 : Poly :=
[
  term ((7 : Rat) / 3) [(0, 1), (10, 2)],
  term ((-7 : Rat) / 6) [(0, 2), (10, 1)],
  term ((7 : Rat) / 3) [(1, 1), (10, 1), (11, 1)],
  term ((-7 : Rat) / 6) [(1, 2), (10, 1)],
  term ((-7 : Rat) / 3) [(10, 1), (11, 1), (15, 1)],
  term ((7 : Rat) / 6) [(10, 1), (14, 2)],
  term ((7 : Rat) / 6) [(10, 1), (15, 2)],
  term ((-7 : Rat) / 3) [(10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0040_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0040
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0041 : Poly :=
[
  term (14 : Rat) [(11, 1), (13, 1)]
]

/-- Partial product 41 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0041 : Poly :=
[
  term (-28 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term (14 : Rat) [(0, 2), (11, 1), (13, 1)],
  term (-28 : Rat) [(1, 1), (11, 2), (13, 1)],
  term (14 : Rat) [(1, 2), (11, 1), (13, 1)],
  term (28 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term (-14 : Rat) [(11, 1), (13, 1), (14, 2)],
  term (-14 : Rat) [(11, 1), (13, 1), (15, 2)],
  term (28 : Rat) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0041_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0041
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0042 : Poly :=
[
  term ((-5 : Rat) / 12) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 42 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0042 : Poly :=
[
  term ((5 : Rat) / 6) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5 : Rat) / 12) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((5 : Rat) / 6) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-5 : Rat) / 12) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((5 : Rat) / 12) [(11, 1), (14, 1), (15, 3)],
  term ((5 : Rat) / 12) [(11, 1), (14, 3), (15, 1)],
  term ((-5 : Rat) / 6) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0042_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0042
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0043 : Poly :=
[
  term ((-14 : Rat) / 5) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0043 : Poly :=
[
  term ((28 : Rat) / 5) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 5) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 5) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 5) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((14 : Rat) / 5) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((14 : Rat) / 5) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0043_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0043
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0044 : Poly :=
[
  term ((-150437 : Rat) / 2640) [(11, 1), (15, 1)]
]

/-- Partial product 44 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0044 : Poly :=
[
  term ((150437 : Rat) / 1320) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-150437 : Rat) / 2640) [(0, 2), (11, 1), (15, 1)],
  term ((150437 : Rat) / 1320) [(1, 1), (11, 2), (15, 1)],
  term ((-150437 : Rat) / 2640) [(1, 2), (11, 1), (15, 1)],
  term ((-150437 : Rat) / 1320) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((150437 : Rat) / 2640) [(11, 1), (14, 2), (15, 1)],
  term ((150437 : Rat) / 2640) [(11, 1), (15, 3)],
  term ((-150437 : Rat) / 1320) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0044_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0044
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0045 : Poly :=
[
  term ((-153 : Rat) / 20) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0045 : Poly :=
[
  term ((153 : Rat) / 10) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-153 : Rat) / 20) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((153 : Rat) / 10) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-153 : Rat) / 20) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-153 : Rat) / 10) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((153 : Rat) / 20) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((153 : Rat) / 20) [(11, 1), (15, 3), (16, 1)],
  term ((-153 : Rat) / 10) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0045_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0045
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0046 : Poly :=
[
  term ((13 : Rat) / 12) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 46 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0046 : Poly :=
[
  term ((-13 : Rat) / 6) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((13 : Rat) / 12) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-13 : Rat) / 6) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((13 : Rat) / 12) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((13 : Rat) / 6) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((13 : Rat) / 6) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-13 : Rat) / 12) [(13, 1), (14, 1), (15, 3)],
  term ((-13 : Rat) / 12) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0046_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0046
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0047 : Poly :=
[
  term ((7 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0047 : Poly :=
[
  term ((-14 : Rat) / 5) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 5) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 5) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 5) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((14 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7 : Rat) / 5) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0047_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0047
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0048 : Poly :=
[
  term ((-1127659 : Rat) / 6160) [(13, 1), (15, 1)]
]

/-- Partial product 48 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0048 : Poly :=
[
  term ((1127659 : Rat) / 3080) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1127659 : Rat) / 6160) [(0, 2), (13, 1), (15, 1)],
  term ((1127659 : Rat) / 3080) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1127659 : Rat) / 6160) [(1, 2), (13, 1), (15, 1)],
  term ((-1127659 : Rat) / 3080) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1127659 : Rat) / 3080) [(11, 1), (13, 1), (15, 2)],
  term ((1127659 : Rat) / 6160) [(13, 1), (14, 2), (15, 1)],
  term ((1127659 : Rat) / 6160) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0048_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0048
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0049 : Poly :=
[
  term ((1 : Rat) / 20) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0049 : Poly :=
[
  term ((-1 : Rat) / 10) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 20) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 10) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 20) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 10) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 10) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 20) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1 : Rat) / 20) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0049_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0049
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0050 : Poly :=
[
  term (7 : Rat) [(13, 2)]
]

/-- Partial product 50 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0050 : Poly :=
[
  term (-14 : Rat) [(0, 1), (10, 1), (13, 2)],
  term (7 : Rat) [(0, 2), (13, 2)],
  term (-14 : Rat) [(1, 1), (11, 1), (13, 2)],
  term (7 : Rat) [(1, 2), (13, 2)],
  term (14 : Rat) [(10, 1), (13, 2), (14, 1)],
  term (14 : Rat) [(11, 1), (13, 2), (15, 1)],
  term (-7 : Rat) [(13, 2), (14, 2)],
  term (-7 : Rat) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0050_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0050
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0051 : Poly :=
[
  term ((-228257 : Rat) / 9240) [(14, 1)]
]

/-- Partial product 51 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0051 : Poly :=
[
  term ((228257 : Rat) / 4620) [(0, 1), (10, 1), (14, 1)],
  term ((-228257 : Rat) / 9240) [(0, 2), (14, 1)],
  term ((228257 : Rat) / 4620) [(1, 1), (11, 1), (14, 1)],
  term ((-228257 : Rat) / 9240) [(1, 2), (14, 1)],
  term ((-228257 : Rat) / 4620) [(10, 1), (14, 2)],
  term ((-228257 : Rat) / 4620) [(11, 1), (14, 1), (15, 1)],
  term ((228257 : Rat) / 9240) [(14, 1), (15, 2)],
  term ((228257 : Rat) / 9240) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0051_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0051
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0052 : Poly :=
[
  term ((231337 : Rat) / 9240) [(14, 2)]
]

/-- Partial product 52 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0052 : Poly :=
[
  term ((-231337 : Rat) / 4620) [(0, 1), (10, 1), (14, 2)],
  term ((231337 : Rat) / 9240) [(0, 2), (14, 2)],
  term ((-231337 : Rat) / 4620) [(1, 1), (11, 1), (14, 2)],
  term ((231337 : Rat) / 9240) [(1, 2), (14, 2)],
  term ((231337 : Rat) / 4620) [(10, 1), (14, 3)],
  term ((231337 : Rat) / 4620) [(11, 1), (14, 2), (15, 1)],
  term ((-231337 : Rat) / 9240) [(14, 2), (15, 2)],
  term ((-231337 : Rat) / 9240) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0052_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0052
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0053 : Poly :=
[
  term ((72607 : Rat) / 3080) [(15, 2)]
]

/-- Partial product 53 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0053 : Poly :=
[
  term ((-72607 : Rat) / 1540) [(0, 1), (10, 1), (15, 2)],
  term ((72607 : Rat) / 3080) [(0, 2), (15, 2)],
  term ((-72607 : Rat) / 1540) [(1, 1), (11, 1), (15, 2)],
  term ((72607 : Rat) / 3080) [(1, 2), (15, 2)],
  term ((72607 : Rat) / 1540) [(10, 1), (14, 1), (15, 2)],
  term ((72607 : Rat) / 1540) [(11, 1), (15, 3)],
  term ((-72607 : Rat) / 3080) [(14, 2), (15, 2)],
  term ((-72607 : Rat) / 3080) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0053_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0053
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 24. -/
def rs_R014_ueqv_R014YY_coefficient_24_0054 : Poly :=
[
  term ((-67 : Rat) / 10) [(15, 2), (16, 1)]
]

/-- Partial product 54 for generator 24. -/
def rs_R014_ueqv_R014YY_partial_24_0054 : Poly :=
[
  term ((67 : Rat) / 5) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-67 : Rat) / 10) [(0, 2), (15, 2), (16, 1)],
  term ((67 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-67 : Rat) / 10) [(1, 2), (15, 2), (16, 1)],
  term ((-67 : Rat) / 5) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-67 : Rat) / 5) [(11, 1), (15, 3), (16, 1)],
  term ((67 : Rat) / 10) [(14, 2), (15, 2), (16, 1)],
  term ((67 : Rat) / 10) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 24. -/
theorem rs_R014_ueqv_R014YY_partial_24_0054_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_24_0054
        rs_R014_ueqv_R014YY_generator_24_0000_0054 =
      rs_R014_ueqv_R014YY_partial_24_0054 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_24_0000_0054 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_24_0000,
  rs_R014_ueqv_R014YY_partial_24_0001,
  rs_R014_ueqv_R014YY_partial_24_0002,
  rs_R014_ueqv_R014YY_partial_24_0003,
  rs_R014_ueqv_R014YY_partial_24_0004,
  rs_R014_ueqv_R014YY_partial_24_0005,
  rs_R014_ueqv_R014YY_partial_24_0006,
  rs_R014_ueqv_R014YY_partial_24_0007,
  rs_R014_ueqv_R014YY_partial_24_0008,
  rs_R014_ueqv_R014YY_partial_24_0009,
  rs_R014_ueqv_R014YY_partial_24_0010,
  rs_R014_ueqv_R014YY_partial_24_0011,
  rs_R014_ueqv_R014YY_partial_24_0012,
  rs_R014_ueqv_R014YY_partial_24_0013,
  rs_R014_ueqv_R014YY_partial_24_0014,
  rs_R014_ueqv_R014YY_partial_24_0015,
  rs_R014_ueqv_R014YY_partial_24_0016,
  rs_R014_ueqv_R014YY_partial_24_0017,
  rs_R014_ueqv_R014YY_partial_24_0018,
  rs_R014_ueqv_R014YY_partial_24_0019,
  rs_R014_ueqv_R014YY_partial_24_0020,
  rs_R014_ueqv_R014YY_partial_24_0021,
  rs_R014_ueqv_R014YY_partial_24_0022,
  rs_R014_ueqv_R014YY_partial_24_0023,
  rs_R014_ueqv_R014YY_partial_24_0024,
  rs_R014_ueqv_R014YY_partial_24_0025,
  rs_R014_ueqv_R014YY_partial_24_0026,
  rs_R014_ueqv_R014YY_partial_24_0027,
  rs_R014_ueqv_R014YY_partial_24_0028,
  rs_R014_ueqv_R014YY_partial_24_0029,
  rs_R014_ueqv_R014YY_partial_24_0030,
  rs_R014_ueqv_R014YY_partial_24_0031,
  rs_R014_ueqv_R014YY_partial_24_0032,
  rs_R014_ueqv_R014YY_partial_24_0033,
  rs_R014_ueqv_R014YY_partial_24_0034,
  rs_R014_ueqv_R014YY_partial_24_0035,
  rs_R014_ueqv_R014YY_partial_24_0036,
  rs_R014_ueqv_R014YY_partial_24_0037,
  rs_R014_ueqv_R014YY_partial_24_0038,
  rs_R014_ueqv_R014YY_partial_24_0039,
  rs_R014_ueqv_R014YY_partial_24_0040,
  rs_R014_ueqv_R014YY_partial_24_0041,
  rs_R014_ueqv_R014YY_partial_24_0042,
  rs_R014_ueqv_R014YY_partial_24_0043,
  rs_R014_ueqv_R014YY_partial_24_0044,
  rs_R014_ueqv_R014YY_partial_24_0045,
  rs_R014_ueqv_R014YY_partial_24_0046,
  rs_R014_ueqv_R014YY_partial_24_0047,
  rs_R014_ueqv_R014YY_partial_24_0048,
  rs_R014_ueqv_R014YY_partial_24_0049,
  rs_R014_ueqv_R014YY_partial_24_0050,
  rs_R014_ueqv_R014YY_partial_24_0051,
  rs_R014_ueqv_R014YY_partial_24_0052,
  rs_R014_ueqv_R014YY_partial_24_0053,
  rs_R014_ueqv_R014YY_partial_24_0054
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_24_0000_0054 : Poly :=
[
  term (3 : Rat) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term (41 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term (-12 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((16867 : Rat) / 385) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term (-60 : Rat) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((17 : Rat) / 6) [(0, 1), (2, 1), (10, 1)],
  term (3 : Rat) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((111 : Rat) / 8) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term (-26 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term (6 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term (4 : Rat) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (-14 : Rat) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((2381 : Rat) / 385) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-458 : Rat) / 385) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (5, 1), (7, 1), (10, 1)],
  term (-3 : Rat) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((17 : Rat) / 6) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((4 : Rat) / 3) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((89 : Rat) / 120) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-49 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (1 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-953 : Rat) / 120) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((49 : Rat) / 30) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term (3 : Rat) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-749 : Rat) / 60) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term (3 : Rat) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((2 : Rat) / 3) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term (-3 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term (2 : Rat) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term (2 : Rat) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1)],
  term (-28 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((5 : Rat) / 6) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((28 : Rat) / 5) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((150437 : Rat) / 1320) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((153 : Rat) / 10) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 6) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14 : Rat) / 5) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1127659 : Rat) / 3080) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 10) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(0, 1), (10, 1), (13, 2)],
  term ((228257 : Rat) / 4620) [(0, 1), (10, 1), (14, 1)],
  term ((-231337 : Rat) / 4620) [(0, 1), (10, 1), (14, 2)],
  term ((-72607 : Rat) / 1540) [(0, 1), (10, 1), (15, 2)],
  term ((67 : Rat) / 5) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 3) [(0, 1), (10, 2)],
  term ((5 : Rat) / 4) [(0, 2)],
  term ((-3 : Rat) / 2) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 6) [(0, 2), (1, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(0, 2), (2, 1)],
  term ((-41 : Rat) / 2) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term (6 : Rat) [(0, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((-16867 : Rat) / 770) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term (30 : Rat) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 8) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111 : Rat) / 16) [(0, 2), (3, 1), (7, 1)],
  term (13 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term (-3 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (3, 1), (9, 1)],
  term (-2 : Rat) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term (7 : Rat) [(0, 2), (3, 1), (13, 1)],
  term ((-2381 : Rat) / 770) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((229 : Rat) / 385) [(0, 2), (3, 1), (15, 1)],
  term ((27 : Rat) / 4) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (5, 1), (7, 1)],
  term ((3 : Rat) / 2) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(0, 2), (5, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (7, 1), (9, 1)],
  term ((-89 : Rat) / 240) [(0, 2), (7, 1), (11, 1)],
  term ((49 : Rat) / 30) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((953 : Rat) / 240) [(0, 2), (7, 1), (13, 1)],
  term ((-49 : Rat) / 60) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((749 : Rat) / 120) [(0, 2), (7, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((3 : Rat) / 2) [(0, 2), (9, 1), (11, 1)],
  term (-1 : Rat) [(0, 2), (9, 1), (13, 1)],
  term (-1 : Rat) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((5 : Rat) / 12) [(0, 2), (9, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(0, 2), (10, 1)],
  term (14 : Rat) [(0, 2), (11, 1), (13, 1)],
  term ((-5 : Rat) / 12) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-14 : Rat) / 5) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-150437 : Rat) / 2640) [(0, 2), (11, 1), (15, 1)],
  term ((-153 : Rat) / 20) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 12) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 5) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1127659 : Rat) / 6160) [(0, 2), (13, 1), (15, 1)],
  term ((1 : Rat) / 20) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(0, 2), (13, 2)],
  term ((-228257 : Rat) / 9240) [(0, 2), (14, 1)],
  term ((231337 : Rat) / 9240) [(0, 2), (14, 2)],
  term ((72607 : Rat) / 3080) [(0, 2), (15, 2)],
  term ((-67 : Rat) / 10) [(0, 2), (15, 2), (16, 1)],
  term (41 : Rat) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term (-12 : Rat) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((16867 : Rat) / 385) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term (-60 : Rat) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((17 : Rat) / 6) [(1, 1), (2, 1), (11, 1)],
  term (3 : Rat) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((111 : Rat) / 8) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term (-26 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term (6 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term (4 : Rat) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term (-14 : Rat) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((2381 : Rat) / 385) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-458 : Rat) / 385) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term (-3 : Rat) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((17 : Rat) / 6) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((4 : Rat) / 3) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-953 : Rat) / 120) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((49 : Rat) / 30) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-749 : Rat) / 60) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 120) [(1, 1), (7, 1), (11, 2)],
  term ((-49 : Rat) / 15) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2 : Rat) / 3) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term (2 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term (2 : Rat) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term (-3 : Rat) [(1, 1), (9, 1), (11, 2)],
  term ((7 : Rat) / 3) [(1, 1), (10, 1), (11, 1)],
  term ((1 : Rat) / 3) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-5 : Rat) / 2) [(1, 1), (11, 1)],
  term ((-13 : Rat) / 6) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1127659 : Rat) / 3080) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 10) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(1, 1), (11, 1), (13, 2)],
  term ((228257 : Rat) / 4620) [(1, 1), (11, 1), (14, 1)],
  term (-3 : Rat) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-231337 : Rat) / 4620) [(1, 1), (11, 1), (14, 2)],
  term ((-216281 : Rat) / 4620) [(1, 1), (11, 1), (15, 2)],
  term ((67 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (-28 : Rat) [(1, 1), (11, 2), (13, 1)],
  term ((5 : Rat) / 6) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((28 : Rat) / 5) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((150437 : Rat) / 1320) [(1, 1), (11, 2), (15, 1)],
  term ((153 : Rat) / 10) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (14, 1), (15, 3)],
  term ((-1 : Rat) / 6) [(1, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(1, 1), (14, 3), (15, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (15, 3)],
  term ((5 : Rat) / 4) [(1, 2)],
  term ((-17 : Rat) / 12) [(1, 2), (2, 1)],
  term ((-41 : Rat) / 2) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term (6 : Rat) [(1, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-16867 : Rat) / 770) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term (30 : Rat) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 8) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111 : Rat) / 16) [(1, 2), (3, 1), (7, 1)],
  term (13 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term (-3 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (3, 1), (9, 1)],
  term (-2 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term (7 : Rat) [(1, 2), (3, 1), (13, 1)],
  term ((-2381 : Rat) / 770) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((229 : Rat) / 385) [(1, 2), (3, 1), (15, 1)],
  term ((27 : Rat) / 4) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (5, 1), (7, 1)],
  term ((3 : Rat) / 2) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(1, 2), (5, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (7, 1), (9, 1)],
  term ((-89 : Rat) / 240) [(1, 2), (7, 1), (11, 1)],
  term ((49 : Rat) / 30) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((953 : Rat) / 240) [(1, 2), (7, 1), (13, 1)],
  term ((-49 : Rat) / 60) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((749 : Rat) / 120) [(1, 2), (7, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((3 : Rat) / 2) [(1, 2), (9, 1), (11, 1)],
  term (-1 : Rat) [(1, 2), (9, 1), (13, 1)],
  term (-1 : Rat) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((5 : Rat) / 12) [(1, 2), (9, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(1, 2), (10, 1)],
  term (14 : Rat) [(1, 2), (11, 1), (13, 1)],
  term ((31 : Rat) / 12) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-14 : Rat) / 5) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50439 : Rat) / 880) [(1, 2), (11, 1), (15, 1)],
  term ((-153 : Rat) / 20) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 12) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 5) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1127659 : Rat) / 6160) [(1, 2), (13, 1), (15, 1)],
  term ((1 : Rat) / 20) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(1, 2), (13, 2)],
  term ((-228257 : Rat) / 9240) [(1, 2), (14, 1)],
  term ((231337 : Rat) / 9240) [(1, 2), (14, 2)],
  term ((72607 : Rat) / 3080) [(1, 2), (15, 2)],
  term ((-67 : Rat) / 10) [(1, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 3), (14, 1), (15, 1)],
  term ((1 : Rat) / 6) [(1, 3), (15, 1)],
  term (-41 : Rat) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (-41 : Rat) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 2) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term (-6 : Rat) [(2, 1), (3, 1), (7, 1), (14, 2), (16, 1)],
  term ((41 : Rat) / 2) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term (-6 : Rat) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (2 : Rat) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term (-1 : Rat) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term (-1 : Rat) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-16867 : Rat) / 385) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term (60 : Rat) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16867 : Rat) / 385) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term (60 : Rat) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((16867 : Rat) / 770) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term (-30 : Rat) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((16867 : Rat) / 770) [(2, 1), (3, 1), (15, 3)],
  term (-30 : Rat) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((7 : Rat) / 4) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((7 : Rat) / 4) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7 : Rat) / 8) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-7 : Rat) / 8) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term (-3 : Rat) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 6) [(2, 1), (10, 1), (14, 1)],
  term (-3 : Rat) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17 : Rat) / 6) [(2, 1), (11, 1), (15, 1)],
  term ((3 : Rat) / 2) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((17 : Rat) / 12) [(2, 1), (14, 2)],
  term ((17 : Rat) / 12) [(2, 1), (15, 2)],
  term ((-111 : Rat) / 8) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (26 : Rat) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term (-6 : Rat) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term (26 : Rat) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-111 : Rat) / 8) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-13 : Rat) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term (3 : Rat) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((111 : Rat) / 16) [(3, 1), (7, 1), (14, 2)],
  term (-2 : Rat) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term (-13 : Rat) [(3, 1), (7, 1), (14, 3)],
  term (3 : Rat) [(3, 1), (7, 1), (14, 3), (16, 1)],
  term ((111 : Rat) / 16) [(3, 1), (7, 1), (15, 2)],
  term (-2 : Rat) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term (-4 : Rat) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term (-4 : Rat) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term (2 : Rat) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term (-1 : Rat) [(3, 1), (9, 1), (14, 2)],
  term (2 : Rat) [(3, 1), (9, 1), (14, 3)],
  term (-1 : Rat) [(3, 1), (9, 1), (15, 2)],
  term (14 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((458 : Rat) / 385) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((27 : Rat) / 2) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2381 : Rat) / 385) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term (-24 : Rat) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (14 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2381 : Rat) / 385) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term (-24 : Rat) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((458 : Rat) / 385) [(3, 1), (11, 1), (15, 2)],
  term ((27 : Rat) / 2) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term (-7 : Rat) [(3, 1), (13, 1), (14, 2)],
  term (-7 : Rat) [(3, 1), (13, 1), (15, 2)],
  term ((2381 : Rat) / 770) [(3, 1), (14, 1), (15, 3)],
  term (12 : Rat) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-229 : Rat) / 385) [(3, 1), (14, 2), (15, 1)],
  term ((-27 : Rat) / 4) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((2381 : Rat) / 770) [(3, 1), (14, 3), (15, 1)],
  term (12 : Rat) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-229 : Rat) / 385) [(3, 1), (15, 3)],
  term ((-27 : Rat) / 4) [(3, 1), (15, 3), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (7, 1), (10, 1), (14, 1)],
  term ((4 : Rat) / 3) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (7, 1), (14, 2)],
  term ((-2 : Rat) / 3) [(5, 1), (7, 1), (15, 2)],
  term ((-17 : Rat) / 6) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term (3 : Rat) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-17 : Rat) / 6) [(5, 1), (11, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 1), (15, 3)],
  term ((17 : Rat) / 12) [(5, 1), (14, 2), (15, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 3), (15, 1)],
  term ((17 : Rat) / 12) [(5, 1), (15, 3)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((2 : Rat) / 3) [(7, 1), (9, 1), (14, 2)],
  term ((2 : Rat) / 3) [(7, 1), (9, 1), (15, 2)],
  term ((-89 : Rat) / 120) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term (-1 : Rat) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((49 : Rat) / 15) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((953 : Rat) / 120) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-49 : Rat) / 30) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((749 : Rat) / 60) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49 : Rat) / 30) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((953 : Rat) / 120) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49 : Rat) / 30) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((89 : Rat) / 240) [(7, 1), (11, 1), (14, 2)],
  term ((1 : Rat) / 2) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-49 : Rat) / 30) [(7, 1), (11, 1), (14, 3)],
  term ((617 : Rat) / 48) [(7, 1), (11, 1), (15, 2)],
  term ((-5 : Rat) / 2) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((49 : Rat) / 15) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-89 : Rat) / 120) [(7, 1), (11, 2), (15, 1)],
  term (-1 : Rat) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((49 : Rat) / 60) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-953 : Rat) / 240) [(7, 1), (13, 1), (14, 2)],
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((49 : Rat) / 60) [(7, 1), (13, 1), (14, 3)],
  term ((-953 : Rat) / 240) [(7, 1), (13, 1), (15, 2)],
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-749 : Rat) / 120) [(7, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-749 : Rat) / 120) [(7, 1), (15, 3)],
  term ((3 : Rat) / 2) [(7, 1), (15, 3), (16, 1)],
  term ((-2 : Rat) / 3) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 3) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(8, 1), (11, 1), (15, 3)],
  term ((-2 : Rat) / 3) [(8, 1), (11, 2), (15, 2)],
  term ((1 : Rat) / 3) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(8, 1), (13, 1), (15, 3)],
  term (3 : Rat) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term (-2 : Rat) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term (-2 : Rat) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (-2 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1), (14, 2)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 1), (15, 2)],
  term (3 : Rat) [(9, 1), (11, 2), (15, 1)],
  term (1 : Rat) [(9, 1), (13, 1), (14, 2)],
  term (1 : Rat) [(9, 1), (13, 1), (15, 2)],
  term (1 : Rat) [(9, 1), (14, 1), (15, 3)],
  term ((-5 : Rat) / 12) [(9, 1), (14, 2), (15, 1)],
  term (1 : Rat) [(9, 1), (14, 3), (15, 1)],
  term ((-5 : Rat) / 12) [(9, 1), (15, 3)],
  term (28 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-150437 : Rat) / 1320) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-153 : Rat) / 10) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-28 : Rat) / 5) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7 : Rat) / 3) [(10, 1), (11, 1), (15, 1)],
  term ((-1127659 : Rat) / 3080) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 10) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 6) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((14 : Rat) / 5) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (14 : Rat) [(10, 1), (13, 2), (14, 1)],
  term ((5 : Rat) / 2) [(10, 1), (14, 1)],
  term ((72607 : Rat) / 1540) [(10, 1), (14, 1), (15, 2)],
  term ((-67 : Rat) / 5) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-74289 : Rat) / 1540) [(10, 1), (14, 2)],
  term ((231337 : Rat) / 4620) [(10, 1), (14, 3)],
  term ((7 : Rat) / 6) [(10, 1), (15, 2)],
  term ((-7 : Rat) / 3) [(10, 2), (14, 1)],
  term ((13 : Rat) / 6) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((14 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-14 : Rat) [(11, 1), (13, 1), (14, 2)],
  term ((-1170779 : Rat) / 3080) [(11, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 10) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term (14 : Rat) [(11, 1), (13, 2), (15, 1)],
  term ((-228257 : Rat) / 4620) [(11, 1), (14, 1), (15, 1)],
  term ((5 : Rat) / 12) [(11, 1), (14, 1), (15, 3)],
  term ((14 : Rat) / 5) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((659469 : Rat) / 6160) [(11, 1), (14, 2), (15, 1)],
  term ((153 : Rat) / 20) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5 : Rat) / 12) [(11, 1), (14, 3), (15, 1)],
  term ((14 : Rat) / 5) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(11, 1), (15, 1)],
  term ((1924343 : Rat) / 18480) [(11, 1), (15, 3)],
  term ((-23 : Rat) / 4) [(11, 1), (15, 3), (16, 1)],
  term (28 : Rat) [(11, 2), (13, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(11, 2), (14, 1), (15, 2)],
  term ((-28 : Rat) / 5) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-150437 : Rat) / 1320) [(11, 2), (15, 2)],
  term ((-153 : Rat) / 10) [(11, 2), (15, 2), (16, 1)],
  term ((-13 : Rat) / 12) [(13, 1), (14, 1), (15, 3)],
  term ((-7 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1127659 : Rat) / 6160) [(13, 1), (14, 2), (15, 1)],
  term ((-1 : Rat) / 20) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13 : Rat) / 12) [(13, 1), (14, 3), (15, 1)],
  term ((-7 : Rat) / 5) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1127659 : Rat) / 6160) [(13, 1), (15, 3)],
  term ((-1 : Rat) / 20) [(13, 1), (15, 3), (16, 1)],
  term (-7 : Rat) [(13, 2), (14, 2)],
  term (-7 : Rat) [(13, 2), (15, 2)],
  term ((228257 : Rat) / 9240) [(14, 1), (15, 2)],
  term ((-5 : Rat) / 4) [(14, 2)],
  term ((-224579 : Rat) / 4620) [(14, 2), (15, 2)],
  term ((67 : Rat) / 10) [(14, 2), (15, 2), (16, 1)],
  term ((228257 : Rat) / 9240) [(14, 3)],
  term ((-231337 : Rat) / 9240) [(14, 4)],
  term ((-5 : Rat) / 4) [(15, 2)],
  term ((-72607 : Rat) / 3080) [(15, 4)],
  term ((67 : Rat) / 10) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 54. -/
theorem rs_R014_ueqv_R014YY_block_24_0000_0054_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_24_0000_0054
      rs_R014_ueqv_R014YY_block_24_0000_0054 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
