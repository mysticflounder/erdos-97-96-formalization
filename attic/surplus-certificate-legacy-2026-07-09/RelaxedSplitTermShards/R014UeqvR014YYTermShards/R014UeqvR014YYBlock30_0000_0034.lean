/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 30:0-34

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_30_0000_0034 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0000 : Poly :=
[
  term ((514487 : Rat) / 36960) []
]

/-- Partial product 0 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0000 : Poly :=
[
  term ((-514487 : Rat) / 18480) [(0, 1), (14, 1)],
  term ((514487 : Rat) / 36960) [(0, 2)],
  term ((-514487 : Rat) / 18480) [(1, 1), (15, 1)],
  term ((514487 : Rat) / 36960) [(1, 2)],
  term ((514487 : Rat) / 18480) [(12, 1), (14, 1)],
  term ((-514487 : Rat) / 36960) [(12, 2)],
  term ((514487 : Rat) / 18480) [(13, 1), (15, 1)],
  term ((-514487 : Rat) / 36960) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0000_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0000
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0001 : Poly :=
[
  term ((519 : Rat) / 1232) [(0, 1)]
]

/-- Partial product 1 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0001 : Poly :=
[
  term ((-519 : Rat) / 616) [(0, 1), (1, 1), (15, 1)],
  term ((519 : Rat) / 1232) [(0, 1), (1, 2)],
  term ((519 : Rat) / 616) [(0, 1), (12, 1), (14, 1)],
  term ((-519 : Rat) / 1232) [(0, 1), (12, 2)],
  term ((519 : Rat) / 616) [(0, 1), (13, 1), (15, 1)],
  term ((-519 : Rat) / 1232) [(0, 1), (13, 2)],
  term ((-519 : Rat) / 616) [(0, 2), (14, 1)],
  term ((519 : Rat) / 1232) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0001_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0001
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0002 : Poly :=
[
  term (-1 : Rat) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 2 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0002 : Poly :=
[
  term (2 : Rat) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term (-2 : Rat) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term (-2 : Rat) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term (1 : Rat) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term (2 : Rat) [(1, 2), (8, 1), (15, 2)],
  term (-1 : Rat) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0002_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0002
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0003 : Poly :=
[
  term ((-519 : Rat) / 1232) [(2, 1)]
]

/-- Partial product 3 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0003 : Poly :=
[
  term ((519 : Rat) / 616) [(0, 1), (2, 1), (14, 1)],
  term ((-519 : Rat) / 1232) [(0, 2), (2, 1)],
  term ((519 : Rat) / 616) [(1, 1), (2, 1), (15, 1)],
  term ((-519 : Rat) / 1232) [(1, 2), (2, 1)],
  term ((-519 : Rat) / 616) [(2, 1), (12, 1), (14, 1)],
  term ((519 : Rat) / 1232) [(2, 1), (12, 2)],
  term ((-519 : Rat) / 616) [(2, 1), (13, 1), (15, 1)],
  term ((519 : Rat) / 1232) [(2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0003_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0003
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0004 : Poly :=
[
  term ((-41 : Rat) / 4) [(3, 1), (7, 1)]
]

/-- Partial product 4 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0004 : Poly :=
[
  term ((41 : Rat) / 2) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term ((-41 : Rat) / 4) [(0, 2), (3, 1), (7, 1)],
  term ((41 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-41 : Rat) / 4) [(1, 2), (3, 1), (7, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((41 : Rat) / 4) [(3, 1), (7, 1), (12, 2)],
  term ((-41 : Rat) / 2) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((41 : Rat) / 4) [(3, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0004_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0004
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0005 : Poly :=
[
  term ((41 : Rat) / 2) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 5 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0005 : Poly :=
[
  term (-41 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((41 : Rat) / 2) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term (-41 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((41 : Rat) / 2) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term (41 : Rat) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (7, 1), (10, 1), (12, 2)],
  term (41 : Rat) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (7, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0005_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0005
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0006 : Poly :=
[
  term (-6 : Rat) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 6 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0006 : Poly :=
[
  term (12 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term (-12 : Rat) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0006_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0006
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0007 : Poly :=
[
  term (3 : Rat) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 7 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0007 : Poly :=
[
  term (-6 : Rat) [(0, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term (6 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0007_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0007
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0008 : Poly :=
[
  term (1 : Rat) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 8 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0008 : Poly :=
[
  term (-2 : Rat) [(0, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term (1 : Rat) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term (2 : Rat) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term (2 : Rat) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term (-1 : Rat) [(3, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0008_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0008
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0009 : Poly :=
[
  term ((1 : Rat) / 2) [(3, 1), (9, 1)]
]

/-- Partial product 9 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0009 : Poly :=
[
  term (-1 : Rat) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((1 : Rat) / 2) [(0, 2), (3, 1), (9, 1)],
  term (-1 : Rat) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((1 : Rat) / 2) [(1, 2), (3, 1), (9, 1)],
  term (1 : Rat) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (9, 1), (12, 2)],
  term (1 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0009_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0009
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0010 : Poly :=
[
  term (-1 : Rat) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 10 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0010 : Poly :=
[
  term (2 : Rat) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (-1 : Rat) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term (-1 : Rat) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term (-2 : Rat) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term (1 : Rat) [(3, 1), (9, 1), (10, 1), (12, 2)],
  term (-2 : Rat) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term (1 : Rat) [(3, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0010_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0010
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0011 : Poly :=
[
  term ((16867 : Rat) / 770) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 11 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0011 : Poly :=
[
  term ((-16867 : Rat) / 385) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((16867 : Rat) / 770) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-16867 : Rat) / 385) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((16867 : Rat) / 770) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((16867 : Rat) / 385) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((16867 : Rat) / 385) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-16867 : Rat) / 770) [(3, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0011_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0011
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0012 : Poly :=
[
  term (-30 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0012 : Poly :=
[
  term (60 : Rat) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-30 : Rat) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term (60 : Rat) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term (-30 : Rat) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term (-60 : Rat) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term (-60 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term (30 : Rat) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0012_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0012
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0013 : Poly :=
[
  term ((-16867 : Rat) / 1540) [(3, 1), (15, 1)]
]

/-- Partial product 13 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0013 : Poly :=
[
  term ((16867 : Rat) / 770) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-16867 : Rat) / 1540) [(0, 2), (3, 1), (15, 1)],
  term ((16867 : Rat) / 770) [(1, 1), (3, 1), (15, 2)],
  term ((-16867 : Rat) / 1540) [(1, 2), (3, 1), (15, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((16867 : Rat) / 1540) [(3, 1), (12, 2), (15, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (13, 1), (15, 2)],
  term ((16867 : Rat) / 1540) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0013_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0013
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0014 : Poly :=
[
  term (15 : Rat) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0014 : Poly :=
[
  term (-30 : Rat) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (-30 : Rat) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term (15 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term (30 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term (-15 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0014_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0014
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0015 : Poly :=
[
  term (-7 : Rat) [(5, 1), (13, 1)]
]

/-- Partial product 15 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0015 : Poly :=
[
  term (14 : Rat) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term (-7 : Rat) [(0, 2), (5, 1), (13, 1)],
  term (14 : Rat) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term (-7 : Rat) [(1, 2), (5, 1), (13, 1)],
  term (-14 : Rat) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term (7 : Rat) [(5, 1), (12, 2), (13, 1)],
  term (-14 : Rat) [(5, 1), (13, 2), (15, 1)],
  term (7 : Rat) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0015_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0015
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0016 : Poly :=
[
  term ((7 : Rat) / 4) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 16 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0016 : Poly :=
[
  term ((-7 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((7 : Rat) / 4) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-7 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((7 : Rat) / 4) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((7 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-7 : Rat) / 4) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((7 : Rat) / 2) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-7 : Rat) / 4) [(7, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0016_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0016
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0017 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 17 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0017 : Poly :=
[
  term ((7 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 4) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((7 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((-7 : Rat) / 4) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((7 : Rat) / 4) [(7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0017_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0017
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0018 : Poly :=
[
  term ((5 : Rat) / 8) [(7, 1), (11, 1)]
]

/-- Partial product 18 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0018 : Poly :=
[
  term ((-5 : Rat) / 4) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((5 : Rat) / 8) [(0, 2), (7, 1), (11, 1)],
  term ((-5 : Rat) / 4) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((5 : Rat) / 8) [(1, 2), (7, 1), (11, 1)],
  term ((5 : Rat) / 4) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5 : Rat) / 8) [(7, 1), (11, 1), (12, 2)],
  term ((5 : Rat) / 4) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5 : Rat) / 8) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0018_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0018
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0019 : Poly :=
[
  term ((17 : Rat) / 4) [(7, 1), (13, 1)]
]

/-- Partial product 19 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0019 : Poly :=
[
  term ((-17 : Rat) / 2) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((17 : Rat) / 4) [(0, 2), (7, 1), (13, 1)],
  term ((-17 : Rat) / 2) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((17 : Rat) / 4) [(1, 2), (7, 1), (13, 1)],
  term ((17 : Rat) / 2) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-17 : Rat) / 4) [(7, 1), (12, 2), (13, 1)],
  term ((17 : Rat) / 2) [(7, 1), (13, 2), (15, 1)],
  term ((-17 : Rat) / 4) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0019_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0019
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0020 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 20 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0020 : Poly :=
[
  term ((7 : Rat) / 2) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-7 : Rat) / 4) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((7 : Rat) / 2) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 4) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((7 : Rat) / 4) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0020_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0020
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0021 : Poly :=
[
  term ((1 : Rat) / 6) [(8, 1)]
]

/-- Partial product 21 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0021 : Poly :=
[
  term ((-1 : Rat) / 3) [(0, 1), (8, 1), (14, 1)],
  term ((1 : Rat) / 6) [(0, 2), (8, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (8, 1), (15, 1)],
  term ((1 : Rat) / 6) [(1, 2), (8, 1)],
  term ((1 : Rat) / 3) [(8, 1), (12, 1), (14, 1)],
  term ((-1 : Rat) / 6) [(8, 1), (12, 2)],
  term ((1 : Rat) / 3) [(8, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0021_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0021
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0022 : Poly :=
[
  term ((-1 : Rat) / 4) [(8, 1), (14, 1)]
]

/-- Partial product 22 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0022 : Poly :=
[
  term ((1 : Rat) / 2) [(0, 1), (8, 1), (14, 2)],
  term ((-1 : Rat) / 4) [(0, 2), (8, 1), (14, 1)],
  term ((1 : Rat) / 2) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 4) [(1, 2), (8, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (12, 1), (14, 2)],
  term ((1 : Rat) / 4) [(8, 1), (12, 2), (14, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 4) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0022_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0022
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0023 : Poly :=
[
  term ((-13 : Rat) / 12) [(9, 1), (11, 1)]
]

/-- Partial product 23 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0023 : Poly :=
[
  term ((13 : Rat) / 6) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-13 : Rat) / 12) [(0, 2), (9, 1), (11, 1)],
  term ((13 : Rat) / 6) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-13 : Rat) / 12) [(1, 2), (9, 1), (11, 1)],
  term ((-13 : Rat) / 6) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((13 : Rat) / 12) [(9, 1), (11, 1), (12, 2)],
  term ((-13 : Rat) / 6) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((13 : Rat) / 12) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0023_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0023
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0024 : Poly :=
[
  term ((11 : Rat) / 12) [(9, 1), (13, 1)]
]

/-- Partial product 24 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0024 : Poly :=
[
  term ((-11 : Rat) / 6) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((11 : Rat) / 12) [(0, 2), (9, 1), (13, 1)],
  term ((-11 : Rat) / 6) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((11 : Rat) / 12) [(1, 2), (9, 1), (13, 1)],
  term ((11 : Rat) / 6) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11 : Rat) / 12) [(9, 1), (12, 2), (13, 1)],
  term ((11 : Rat) / 6) [(9, 1), (13, 2), (15, 1)],
  term ((-11 : Rat) / 12) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0024_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0024
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0025 : Poly :=
[
  term ((1 : Rat) / 4) [(9, 1), (15, 1)]
]

/-- Partial product 25 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0025 : Poly :=
[
  term ((-1 : Rat) / 2) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 4) [(0, 2), (9, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (9, 1), (15, 2)],
  term ((1 : Rat) / 4) [(1, 2), (9, 1), (15, 1)],
  term ((1 : Rat) / 2) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 4) [(9, 1), (12, 2), (15, 1)],
  term ((1 : Rat) / 2) [(9, 1), (13, 1), (15, 2)],
  term ((-1 : Rat) / 4) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0025_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0025
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0026 : Poly :=
[
  term ((-13 : Rat) / 6) [(10, 1)]
]

/-- Partial product 26 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0026 : Poly :=
[
  term ((13 : Rat) / 3) [(0, 1), (10, 1), (14, 1)],
  term ((-13 : Rat) / 6) [(0, 2), (10, 1)],
  term ((13 : Rat) / 3) [(1, 1), (10, 1), (15, 1)],
  term ((-13 : Rat) / 6) [(1, 2), (10, 1)],
  term ((-13 : Rat) / 3) [(10, 1), (12, 1), (14, 1)],
  term ((13 : Rat) / 6) [(10, 1), (12, 2)],
  term ((-13 : Rat) / 3) [(10, 1), (13, 1), (15, 1)],
  term ((13 : Rat) / 6) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0026_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0026
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0027 : Poly :=
[
  term (-3 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0027 : Poly :=
[
  term (6 : Rat) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0027_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0027
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0028 : Poly :=
[
  term (3 : Rat) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 28 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0028 : Poly :=
[
  term (-6 : Rat) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term (3 : Rat) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term (-3 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0028_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0028
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0029 : Poly :=
[
  term ((3644 : Rat) / 77) [(11, 1), (15, 1)]
]

/-- Partial product 29 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0029 : Poly :=
[
  term ((-7288 : Rat) / 77) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((3644 : Rat) / 77) [(0, 2), (11, 1), (15, 1)],
  term ((-7288 : Rat) / 77) [(1, 1), (11, 1), (15, 2)],
  term ((3644 : Rat) / 77) [(1, 2), (11, 1), (15, 1)],
  term ((7288 : Rat) / 77) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3644 : Rat) / 77) [(11, 1), (12, 2), (15, 1)],
  term ((7288 : Rat) / 77) [(11, 1), (13, 1), (15, 2)],
  term ((-3644 : Rat) / 77) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0029_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0029
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0030 : Poly :=
[
  term ((9 : Rat) / 2) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0030 : Poly :=
[
  term (-9 : Rat) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0030_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0030
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0031 : Poly :=
[
  term (3 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0031 : Poly :=
[
  term (-6 : Rat) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0031_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0031
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0032 : Poly :=
[
  term ((-17733 : Rat) / 880) [(13, 1), (15, 1)]
]

/-- Partial product 32 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0032 : Poly :=
[
  term ((17733 : Rat) / 440) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-17733 : Rat) / 880) [(0, 2), (13, 1), (15, 1)],
  term ((17733 : Rat) / 440) [(1, 1), (13, 1), (15, 2)],
  term ((-17733 : Rat) / 880) [(1, 2), (13, 1), (15, 1)],
  term ((-17733 : Rat) / 440) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((17733 : Rat) / 880) [(12, 2), (13, 1), (15, 1)],
  term ((-17733 : Rat) / 440) [(13, 2), (15, 2)],
  term ((17733 : Rat) / 880) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0032_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0032
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0033 : Poly :=
[
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0033 : Poly :=
[
  term (12 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(13, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0033_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0033
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 30. -/
def rs_R014_ueqv_R014YY_coefficient_30_0034 : Poly :=
[
  term ((-167389 : Rat) / 12320) [(14, 1)]
]

/-- Partial product 34 for generator 30. -/
def rs_R014_ueqv_R014YY_partial_30_0034 : Poly :=
[
  term ((167389 : Rat) / 6160) [(0, 1), (14, 2)],
  term ((-167389 : Rat) / 12320) [(0, 2), (14, 1)],
  term ((167389 : Rat) / 6160) [(1, 1), (14, 1), (15, 1)],
  term ((-167389 : Rat) / 12320) [(1, 2), (14, 1)],
  term ((-167389 : Rat) / 6160) [(12, 1), (14, 2)],
  term ((167389 : Rat) / 12320) [(12, 2), (14, 1)],
  term ((-167389 : Rat) / 6160) [(13, 1), (14, 1), (15, 1)],
  term ((167389 : Rat) / 12320) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 30. -/
theorem rs_R014_ueqv_R014YY_partial_30_0034_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_30_0034
        rs_R014_ueqv_R014YY_generator_30_0000_0034 =
      rs_R014_ueqv_R014YY_partial_30_0034 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_30_0000_0034 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_30_0000,
  rs_R014_ueqv_R014YY_partial_30_0001,
  rs_R014_ueqv_R014YY_partial_30_0002,
  rs_R014_ueqv_R014YY_partial_30_0003,
  rs_R014_ueqv_R014YY_partial_30_0004,
  rs_R014_ueqv_R014YY_partial_30_0005,
  rs_R014_ueqv_R014YY_partial_30_0006,
  rs_R014_ueqv_R014YY_partial_30_0007,
  rs_R014_ueqv_R014YY_partial_30_0008,
  rs_R014_ueqv_R014YY_partial_30_0009,
  rs_R014_ueqv_R014YY_partial_30_0010,
  rs_R014_ueqv_R014YY_partial_30_0011,
  rs_R014_ueqv_R014YY_partial_30_0012,
  rs_R014_ueqv_R014YY_partial_30_0013,
  rs_R014_ueqv_R014YY_partial_30_0014,
  rs_R014_ueqv_R014YY_partial_30_0015,
  rs_R014_ueqv_R014YY_partial_30_0016,
  rs_R014_ueqv_R014YY_partial_30_0017,
  rs_R014_ueqv_R014YY_partial_30_0018,
  rs_R014_ueqv_R014YY_partial_30_0019,
  rs_R014_ueqv_R014YY_partial_30_0020,
  rs_R014_ueqv_R014YY_partial_30_0021,
  rs_R014_ueqv_R014YY_partial_30_0022,
  rs_R014_ueqv_R014YY_partial_30_0023,
  rs_R014_ueqv_R014YY_partial_30_0024,
  rs_R014_ueqv_R014YY_partial_30_0025,
  rs_R014_ueqv_R014YY_partial_30_0026,
  rs_R014_ueqv_R014YY_partial_30_0027,
  rs_R014_ueqv_R014YY_partial_30_0028,
  rs_R014_ueqv_R014YY_partial_30_0029,
  rs_R014_ueqv_R014YY_partial_30_0030,
  rs_R014_ueqv_R014YY_partial_30_0031,
  rs_R014_ueqv_R014YY_partial_30_0032,
  rs_R014_ueqv_R014YY_partial_30_0033,
  rs_R014_ueqv_R014YY_partial_30_0034
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_30_0000_0034 : Poly :=
[
  term (2 : Rat) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-519 : Rat) / 616) [(0, 1), (1, 1), (15, 1)],
  term ((519 : Rat) / 1232) [(0, 1), (1, 2)],
  term ((519 : Rat) / 616) [(0, 1), (2, 1), (14, 1)],
  term (-41 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term (12 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((41 : Rat) / 2) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term (-6 : Rat) [(0, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (-1 : Rat) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((-16867 : Rat) / 385) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term (60 : Rat) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((16867 : Rat) / 770) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term (-30 : Rat) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((-7 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((7 : Rat) / 2) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5 : Rat) / 4) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-17 : Rat) / 2) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((7 : Rat) / 2) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-1 : Rat) / 3) [(0, 1), (8, 1), (14, 1)],
  term ((1 : Rat) / 2) [(0, 1), (8, 1), (14, 2)],
  term ((13 : Rat) / 6) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-11 : Rat) / 6) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 3) [(0, 1), (10, 1), (14, 1)],
  term (-6 : Rat) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7288 : Rat) / 77) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term (-9 : Rat) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((519 : Rat) / 616) [(0, 1), (12, 1), (14, 1)],
  term ((-519 : Rat) / 1232) [(0, 1), (12, 2)],
  term ((17733 : Rat) / 440) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term (12 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((519 : Rat) / 616) [(0, 1), (13, 1), (15, 1)],
  term ((-519 : Rat) / 1232) [(0, 1), (13, 2)],
  term ((-514487 : Rat) / 18480) [(0, 1), (14, 1)],
  term ((167389 : Rat) / 6160) [(0, 1), (14, 2)],
  term ((514487 : Rat) / 36960) [(0, 2)],
  term (-1 : Rat) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-519 : Rat) / 1232) [(0, 2), (2, 1)],
  term ((-41 : Rat) / 4) [(0, 2), (3, 1), (7, 1)],
  term ((41 : Rat) / 2) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term (-6 : Rat) [(0, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((1 : Rat) / 2) [(0, 2), (3, 1), (9, 1)],
  term (-1 : Rat) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((16867 : Rat) / 770) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term (-30 : Rat) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16867 : Rat) / 1540) [(0, 2), (3, 1), (15, 1)],
  term (15 : Rat) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(0, 2), (5, 1), (13, 1)],
  term ((7 : Rat) / 4) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-7 : Rat) / 4) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((5 : Rat) / 8) [(0, 2), (7, 1), (11, 1)],
  term ((17 : Rat) / 4) [(0, 2), (7, 1), (13, 1)],
  term ((-7 : Rat) / 4) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 6) [(0, 2), (8, 1)],
  term ((-1 : Rat) / 4) [(0, 2), (8, 1), (14, 1)],
  term ((-13 : Rat) / 12) [(0, 2), (9, 1), (11, 1)],
  term ((11 : Rat) / 12) [(0, 2), (9, 1), (13, 1)],
  term ((1 : Rat) / 4) [(0, 2), (9, 1), (15, 1)],
  term ((-13 : Rat) / 6) [(0, 2), (10, 1)],
  term (-3 : Rat) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((3644 : Rat) / 77) [(0, 2), (11, 1), (15, 1)],
  term ((9 : Rat) / 2) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17733 : Rat) / 880) [(0, 2), (13, 1), (15, 1)],
  term (-6 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-177769 : Rat) / 12320) [(0, 2), (14, 1)],
  term ((519 : Rat) / 1232) [(0, 3)],
  term ((519 : Rat) / 616) [(1, 1), (2, 1), (15, 1)],
  term (-41 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term (2 : Rat) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term (-1 : Rat) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-16867 : Rat) / 385) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term (60 : Rat) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((16867 : Rat) / 770) [(1, 1), (3, 1), (15, 2)],
  term (-30 : Rat) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term (14 : Rat) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-7 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((7 : Rat) / 2) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((-5 : Rat) / 4) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((7 : Rat) / 2) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-17 : Rat) / 2) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (-2 : Rat) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term (-2 : Rat) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term (1 : Rat) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((1 : Rat) / 2) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (8, 1), (15, 1)],
  term ((13 : Rat) / 6) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-11 : Rat) / 6) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (9, 1), (15, 2)],
  term (6 : Rat) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((13 : Rat) / 3) [(1, 1), (10, 1), (15, 1)],
  term (-6 : Rat) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-7288 : Rat) / 77) [(1, 1), (11, 1), (15, 2)],
  term (-9 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((17733 : Rat) / 440) [(1, 1), (13, 1), (15, 2)],
  term (12 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((167389 : Rat) / 6160) [(1, 1), (14, 1), (15, 1)],
  term ((-514487 : Rat) / 18480) [(1, 1), (15, 1)],
  term ((514487 : Rat) / 36960) [(1, 2)],
  term ((-519 : Rat) / 1232) [(1, 2), (2, 1)],
  term ((-41 : Rat) / 4) [(1, 2), (3, 1), (7, 1)],
  term ((41 : Rat) / 2) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term (-6 : Rat) [(1, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((1 : Rat) / 2) [(1, 2), (3, 1), (9, 1)],
  term (-1 : Rat) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((16867 : Rat) / 770) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term (-30 : Rat) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16867 : Rat) / 1540) [(1, 2), (3, 1), (15, 1)],
  term (15 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(1, 2), (5, 1), (13, 1)],
  term ((7 : Rat) / 4) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-7 : Rat) / 4) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((5 : Rat) / 8) [(1, 2), (7, 1), (11, 1)],
  term ((17 : Rat) / 4) [(1, 2), (7, 1), (13, 1)],
  term ((-7 : Rat) / 4) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 6) [(1, 2), (8, 1)],
  term ((-1 : Rat) / 4) [(1, 2), (8, 1), (14, 1)],
  term (2 : Rat) [(1, 2), (8, 1), (15, 2)],
  term ((-13 : Rat) / 12) [(1, 2), (9, 1), (11, 1)],
  term ((11 : Rat) / 12) [(1, 2), (9, 1), (13, 1)],
  term ((1 : Rat) / 4) [(1, 2), (9, 1), (15, 1)],
  term ((-13 : Rat) / 6) [(1, 2), (10, 1)],
  term (-3 : Rat) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((3644 : Rat) / 77) [(1, 2), (11, 1), (15, 1)],
  term ((9 : Rat) / 2) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17733 : Rat) / 880) [(1, 2), (13, 1), (15, 1)],
  term (-6 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-167389 : Rat) / 12320) [(1, 2), (14, 1)],
  term (-1 : Rat) [(1, 3), (8, 1), (15, 1)],
  term ((-519 : Rat) / 616) [(2, 1), (12, 1), (14, 1)],
  term ((519 : Rat) / 1232) [(2, 1), (12, 2)],
  term ((-519 : Rat) / 616) [(2, 1), (13, 1), (15, 1)],
  term ((519 : Rat) / 1232) [(2, 1), (13, 2)],
  term (41 : Rat) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term (-12 : Rat) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (7, 1), (10, 1), (12, 2)],
  term (6 : Rat) [(3, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term (41 : Rat) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term (-12 : Rat) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (7, 1), (10, 1), (13, 2)],
  term (6 : Rat) [(3, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term (6 : Rat) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((41 : Rat) / 4) [(3, 1), (7, 1), (12, 2)],
  term (-3 : Rat) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 4) [(3, 1), (7, 1), (13, 2)],
  term (-3 : Rat) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term (2 : Rat) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term (-1 : Rat) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term (-2 : Rat) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term (1 : Rat) [(3, 1), (9, 1), (10, 1), (12, 2)],
  term (-2 : Rat) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term (1 : Rat) [(3, 1), (9, 1), (10, 1), (13, 2)],
  term (1 : Rat) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (9, 1), (12, 2)],
  term (1 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(3, 1), (9, 1), (13, 2)],
  term ((16867 : Rat) / 385) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (-60 : Rat) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term (30 : Rat) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((16867 : Rat) / 385) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term (-60 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (10, 1), (13, 2), (15, 1)],
  term (30 : Rat) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term (30 : Rat) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16867 : Rat) / 1540) [(3, 1), (12, 2), (15, 1)],
  term (-15 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (13, 1), (15, 2)],
  term (30 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((16867 : Rat) / 1540) [(3, 1), (13, 2), (15, 1)],
  term (-15 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (-14 : Rat) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term (7 : Rat) [(5, 1), (12, 2), (13, 1)],
  term (-14 : Rat) [(5, 1), (13, 2), (15, 1)],
  term (7 : Rat) [(5, 1), (13, 3)],
  term ((7 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 4) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((7 : Rat) / 4) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((21 : Rat) / 4) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-7 : Rat) / 4) [(7, 1), (10, 1), (13, 3)],
  term ((5 : Rat) / 4) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5 : Rat) / 8) [(7, 1), (11, 1), (12, 2)],
  term ((5 : Rat) / 4) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5 : Rat) / 8) [(7, 1), (11, 1), (13, 2)],
  term ((17 : Rat) / 2) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-17 : Rat) / 4) [(7, 1), (12, 2), (13, 1)],
  term ((7 : Rat) / 4) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((17 : Rat) / 2) [(7, 1), (13, 2), (15, 1)],
  term ((-17 : Rat) / 4) [(7, 1), (13, 3)],
  term ((7 : Rat) / 4) [(7, 1), (13, 3), (14, 1)],
  term ((1 : Rat) / 3) [(8, 1), (12, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (12, 1), (14, 2)],
  term ((-1 : Rat) / 6) [(8, 1), (12, 2)],
  term ((1 : Rat) / 4) [(8, 1), (12, 2), (14, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(8, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(8, 1), (13, 2)],
  term ((1 : Rat) / 4) [(8, 1), (13, 2), (14, 1)],
  term ((-13 : Rat) / 6) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((13 : Rat) / 12) [(9, 1), (11, 1), (12, 2)],
  term ((-13 : Rat) / 6) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((13 : Rat) / 12) [(9, 1), (11, 1), (13, 2)],
  term ((11 : Rat) / 6) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 2) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 12) [(9, 1), (12, 2), (13, 1)],
  term ((-1 : Rat) / 4) [(9, 1), (12, 2), (15, 1)],
  term ((1 : Rat) / 2) [(9, 1), (13, 1), (15, 2)],
  term ((19 : Rat) / 12) [(9, 1), (13, 2), (15, 1)],
  term ((-11 : Rat) / 12) [(9, 1), (13, 3)],
  term (-6 : Rat) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 3) [(10, 1), (12, 1), (14, 1)],
  term (6 : Rat) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((13 : Rat) / 6) [(10, 1), (12, 2)],
  term (3 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-13 : Rat) / 3) [(10, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((13 : Rat) / 6) [(10, 1), (13, 2)],
  term (-9 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((7288 : Rat) / 77) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term (9 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3644 : Rat) / 77) [(11, 1), (12, 2), (15, 1)],
  term ((-9 : Rat) / 2) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7288 : Rat) / 77) [(11, 1), (13, 1), (15, 2)],
  term (9 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3644 : Rat) / 77) [(11, 1), (13, 2), (15, 1)],
  term ((-9 : Rat) / 2) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17733 : Rat) / 440) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((514487 : Rat) / 18480) [(12, 1), (14, 1)],
  term ((-167389 : Rat) / 6160) [(12, 1), (14, 2)],
  term ((-514487 : Rat) / 36960) [(12, 2)],
  term (-3 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17733 : Rat) / 880) [(12, 2), (13, 1), (15, 1)],
  term (6 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((167389 : Rat) / 12320) [(12, 2), (14, 1)],
  term ((-167389 : Rat) / 6160) [(13, 1), (14, 1), (15, 1)],
  term ((514487 : Rat) / 18480) [(13, 1), (15, 1)],
  term ((-514487 : Rat) / 36960) [(13, 2)],
  term ((167389 : Rat) / 12320) [(13, 2), (14, 1)],
  term (6 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17733 : Rat) / 440) [(13, 2), (15, 2)],
  term (-12 : Rat) [(13, 2), (15, 2), (16, 1)],
  term (-3 : Rat) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((17733 : Rat) / 880) [(13, 3), (15, 1)],
  term (6 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 34. -/
theorem rs_R014_ueqv_R014YY_block_30_0000_0034_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_30_0000_0034
      rs_R014_ueqv_R014YY_block_30_0000_0034 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
