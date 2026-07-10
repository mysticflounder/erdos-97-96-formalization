/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 23:0-16

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 23 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_23_0000_0016 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0000 : Poly :=
[
  term ((-3 : Rat) / 4) []
]

/-- Partial product 0 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0000 : Poly :=
[
  term ((3 : Rat) / 2) [(0, 1), (10, 1)],
  term ((-3 : Rat) / 4) [(0, 2)],
  term ((3 : Rat) / 2) [(1, 1), (11, 1)],
  term ((-3 : Rat) / 4) [(1, 2)],
  term ((-3 : Rat) / 2) [(8, 1), (10, 1)],
  term ((3 : Rat) / 4) [(8, 2)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1)],
  term ((3 : Rat) / 4) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0000_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0000
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0001 : Poly :=
[
  term ((3 : Rat) / 2) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 1 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0001 : Poly :=
[
  term (-3 : Rat) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term (3 : Rat) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term (-3 : Rat) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0001_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0001
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0002 : Poly :=
[
  term ((-1 : Rat) / 6) [(1, 1), (15, 1)]
]

/-- Partial product 2 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0002 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (1, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((1 : Rat) / 6) [(1, 1), (8, 2), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((1 : Rat) / 6) [(1, 1), (9, 2), (15, 1)],
  term ((1 : Rat) / 3) [(1, 2), (11, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0002_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0002
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0003 : Poly :=
[
  term ((29 : Rat) / 12) [(2, 1)]
]

/-- Partial product 3 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0003 : Poly :=
[
  term ((-29 : Rat) / 6) [(0, 1), (2, 1), (10, 1)],
  term ((29 : Rat) / 12) [(0, 2), (2, 1)],
  term ((-29 : Rat) / 6) [(1, 1), (2, 1), (11, 1)],
  term ((29 : Rat) / 12) [(1, 2), (2, 1)],
  term ((29 : Rat) / 6) [(2, 1), (8, 1), (10, 1)],
  term ((-29 : Rat) / 12) [(2, 1), (8, 2)],
  term ((29 : Rat) / 6) [(2, 1), (9, 1), (11, 1)],
  term ((-29 : Rat) / 12) [(2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0003_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0003
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0004 : Poly :=
[
  term ((-25 : Rat) / 3) [(3, 1), (15, 1)]
]

/-- Partial product 4 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0004 : Poly :=
[
  term ((50 : Rat) / 3) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(0, 2), (3, 1), (15, 1)],
  term ((50 : Rat) / 3) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(1, 2), (3, 1), (15, 1)],
  term ((-50 : Rat) / 3) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((25 : Rat) / 3) [(3, 1), (8, 2), (15, 1)],
  term ((-50 : Rat) / 3) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 3) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0004_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0004
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0005 : Poly :=
[
  term ((-2 : Rat) / 3) [(5, 1), (7, 1)]
]

/-- Partial product 5 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0005 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 1), (5, 1), (7, 1), (10, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (5, 1), (7, 1)],
  term ((4 : Rat) / 3) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (5, 1), (7, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 1), (8, 1), (10, 1)],
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (8, 2)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0005_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0005
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0006 : Poly :=
[
  term ((-3 : Rat) / 2) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 6 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0006 : Poly :=
[
  term (3 : Rat) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term (-3 : Rat) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0006_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0006
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0007 : Poly :=
[
  term ((17 : Rat) / 12) [(5, 1), (15, 1)]
]

/-- Partial product 7 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0007 : Poly :=
[
  term ((-17 : Rat) / 6) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((17 : Rat) / 12) [(0, 2), (5, 1), (15, 1)],
  term ((-17 : Rat) / 6) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((17 : Rat) / 12) [(1, 2), (5, 1), (15, 1)],
  term ((17 : Rat) / 6) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(5, 1), (8, 2), (15, 1)],
  term ((17 : Rat) / 6) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0007_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0007
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0008 : Poly :=
[
  term ((-2 : Rat) / 3) [(7, 1), (13, 1)]
]

/-- Partial product 8 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0008 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (7, 1), (13, 1)],
  term ((4 : Rat) / 3) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (7, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((2 : Rat) / 3) [(7, 1), (8, 2), (13, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((2 : Rat) / 3) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0008_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0008
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0009 : Poly :=
[
  term ((2 : Rat) / 3) [(7, 1), (15, 1)]
]

/-- Partial product 9 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0009 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((2 : Rat) / 3) [(0, 2), (7, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((2 : Rat) / 3) [(1, 2), (7, 1), (15, 1)],
  term ((4 : Rat) / 3) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (8, 2), (15, 1)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0009_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0009
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0010 : Poly :=
[
  term ((7 : Rat) / 6) [(10, 1)]
]

/-- Partial product 10 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0010 : Poly :=
[
  term ((-7 : Rat) / 3) [(0, 1), (10, 2)],
  term ((7 : Rat) / 6) [(0, 2), (10, 1)],
  term ((-7 : Rat) / 3) [(1, 1), (10, 1), (11, 1)],
  term ((7 : Rat) / 6) [(1, 2), (10, 1)],
  term ((7 : Rat) / 3) [(8, 1), (10, 2)],
  term ((-7 : Rat) / 6) [(8, 2), (10, 1)],
  term ((7 : Rat) / 3) [(9, 1), (10, 1), (11, 1)],
  term ((-7 : Rat) / 6) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0010_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0010
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0011 : Poly :=
[
  term ((-25 : Rat) / 6) [(11, 1), (15, 1)]
]

/-- Partial product 11 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0011 : Poly :=
[
  term ((25 : Rat) / 3) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-25 : Rat) / 6) [(0, 2), (11, 1), (15, 1)],
  term ((25 : Rat) / 3) [(1, 1), (11, 2), (15, 1)],
  term ((-25 : Rat) / 6) [(1, 2), (11, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 6) [(8, 2), (11, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(9, 1), (11, 2), (15, 1)],
  term ((25 : Rat) / 6) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0011_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0011
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0012 : Poly :=
[
  term ((-1 : Rat) / 2) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 12 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0012 : Poly :=
[
  term (1 : Rat) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 2) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 2) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0012_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0012
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0013 : Poly :=
[
  term (6 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 13 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0013 : Poly :=
[
  term (-12 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (-12 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (12 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(8, 2), (13, 1), (15, 1)],
  term (12 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0013_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0013
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0014 : Poly :=
[
  term ((-4 : Rat) / 3) [(13, 2)]
]

/-- Partial product 14 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0014 : Poly :=
[
  term ((8 : Rat) / 3) [(0, 1), (10, 1), (13, 2)],
  term ((-4 : Rat) / 3) [(0, 2), (13, 2)],
  term ((8 : Rat) / 3) [(1, 1), (11, 1), (13, 2)],
  term ((-4 : Rat) / 3) [(1, 2), (13, 2)],
  term ((-8 : Rat) / 3) [(8, 1), (10, 1), (13, 2)],
  term ((4 : Rat) / 3) [(8, 2), (13, 2)],
  term ((-8 : Rat) / 3) [(9, 1), (11, 1), (13, 2)],
  term ((4 : Rat) / 3) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0014_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0014
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0015 : Poly :=
[
  term ((1 : Rat) / 12) [(14, 1)]
]

/-- Partial product 15 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0015 : Poly :=
[
  term ((-1 : Rat) / 6) [(0, 1), (10, 1), (14, 1)],
  term ((1 : Rat) / 12) [(0, 2), (14, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (11, 1), (14, 1)],
  term ((1 : Rat) / 12) [(1, 2), (14, 1)],
  term ((1 : Rat) / 6) [(8, 1), (10, 1), (14, 1)],
  term ((-1 : Rat) / 12) [(8, 2), (14, 1)],
  term ((1 : Rat) / 6) [(9, 1), (11, 1), (14, 1)],
  term ((-1 : Rat) / 12) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0015_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0015
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 23. -/
def rs_R014_ueqv_R014YY_coefficient_23_0016 : Poly :=
[
  term ((-3 : Rat) / 4) [(15, 2)]
]

/-- Partial product 16 for generator 23. -/
def rs_R014_ueqv_R014YY_partial_23_0016 : Poly :=
[
  term ((3 : Rat) / 2) [(0, 1), (10, 1), (15, 2)],
  term ((-3 : Rat) / 4) [(0, 2), (15, 2)],
  term ((3 : Rat) / 2) [(1, 1), (11, 1), (15, 2)],
  term ((-3 : Rat) / 4) [(1, 2), (15, 2)],
  term ((-3 : Rat) / 2) [(8, 1), (10, 1), (15, 2)],
  term ((3 : Rat) / 4) [(8, 2), (15, 2)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1), (15, 2)],
  term ((3 : Rat) / 4) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 23. -/
theorem rs_R014_ueqv_R014YY_partial_23_0016_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_23_0016
        rs_R014_ueqv_R014YY_generator_23_0000_0016 =
      rs_R014_ueqv_R014YY_partial_23_0016 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_23_0000_0016 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_23_0000,
  rs_R014_ueqv_R014YY_partial_23_0001,
  rs_R014_ueqv_R014YY_partial_23_0002,
  rs_R014_ueqv_R014YY_partial_23_0003,
  rs_R014_ueqv_R014YY_partial_23_0004,
  rs_R014_ueqv_R014YY_partial_23_0005,
  rs_R014_ueqv_R014YY_partial_23_0006,
  rs_R014_ueqv_R014YY_partial_23_0007,
  rs_R014_ueqv_R014YY_partial_23_0008,
  rs_R014_ueqv_R014YY_partial_23_0009,
  rs_R014_ueqv_R014YY_partial_23_0010,
  rs_R014_ueqv_R014YY_partial_23_0011,
  rs_R014_ueqv_R014YY_partial_23_0012,
  rs_R014_ueqv_R014YY_partial_23_0013,
  rs_R014_ueqv_R014YY_partial_23_0014,
  rs_R014_ueqv_R014YY_partial_23_0015,
  rs_R014_ueqv_R014YY_partial_23_0016
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_23_0000_0016 : Poly :=
[
  term (-3 : Rat) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-29 : Rat) / 6) [(0, 1), (2, 1), (10, 1)],
  term ((50 : Rat) / 3) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((4 : Rat) / 3) [(0, 1), (5, 1), (7, 1), (10, 1)],
  term (3 : Rat) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17 : Rat) / 6) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((4 : Rat) / 3) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((3 : Rat) / 2) [(0, 1), (10, 1)],
  term ((25 : Rat) / 3) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term (1 : Rat) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(0, 1), (10, 1), (13, 2)],
  term ((-1 : Rat) / 6) [(0, 1), (10, 1), (14, 1)],
  term ((3 : Rat) / 2) [(0, 1), (10, 1), (15, 2)],
  term ((-7 : Rat) / 3) [(0, 1), (10, 2)],
  term ((-3 : Rat) / 4) [(0, 2)],
  term ((3 : Rat) / 2) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (1, 1), (15, 1)],
  term ((29 : Rat) / 12) [(0, 2), (2, 1)],
  term ((-25 : Rat) / 3) [(0, 2), (3, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (5, 1), (7, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((17 : Rat) / 12) [(0, 2), (5, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (7, 1), (13, 1)],
  term ((2 : Rat) / 3) [(0, 2), (7, 1), (15, 1)],
  term ((7 : Rat) / 6) [(0, 2), (10, 1)],
  term ((-25 : Rat) / 6) [(0, 2), (11, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(0, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (13, 2)],
  term ((1 : Rat) / 12) [(0, 2), (14, 1)],
  term ((-3 : Rat) / 4) [(0, 2), (15, 2)],
  term ((-29 : Rat) / 6) [(1, 1), (2, 1), (11, 1)],
  term ((50 : Rat) / 3) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((4 : Rat) / 3) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term (3 : Rat) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-17 : Rat) / 6) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((4 : Rat) / 3) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (3 : Rat) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((1 : Rat) / 6) [(1, 1), (8, 2), (15, 1)],
  term (3 : Rat) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((1 : Rat) / 6) [(1, 1), (9, 2), (15, 1)],
  term ((-7 : Rat) / 3) [(1, 1), (10, 1), (11, 1)],
  term ((3 : Rat) / 2) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(1, 1), (11, 1), (13, 2)],
  term ((-1 : Rat) / 6) [(1, 1), (11, 1), (14, 1)],
  term ((3 : Rat) / 2) [(1, 1), (11, 1), (15, 2)],
  term ((25 : Rat) / 3) [(1, 1), (11, 2), (15, 1)],
  term ((-3 : Rat) / 4) [(1, 2)],
  term ((29 : Rat) / 12) [(1, 2), (2, 1)],
  term ((-25 : Rat) / 3) [(1, 2), (3, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (5, 1), (7, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((17 : Rat) / 12) [(1, 2), (5, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (7, 1), (13, 1)],
  term ((2 : Rat) / 3) [(1, 2), (7, 1), (15, 1)],
  term ((7 : Rat) / 6) [(1, 2), (10, 1)],
  term (-3 : Rat) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-23 : Rat) / 6) [(1, 2), (11, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(1, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (13, 2)],
  term ((1 : Rat) / 12) [(1, 2), (14, 1)],
  term ((-3 : Rat) / 4) [(1, 2), (15, 2)],
  term ((3 : Rat) / 2) [(1, 3), (14, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(1, 3), (15, 1)],
  term ((29 : Rat) / 6) [(2, 1), (8, 1), (10, 1)],
  term ((-29 : Rat) / 12) [(2, 1), (8, 2)],
  term ((29 : Rat) / 6) [(2, 1), (9, 1), (11, 1)],
  term ((-29 : Rat) / 12) [(2, 1), (9, 2)],
  term ((-50 : Rat) / 3) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((25 : Rat) / 3) [(3, 1), (8, 2), (15, 1)],
  term ((-50 : Rat) / 3) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 3) [(3, 1), (9, 2), (15, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 1), (8, 1), (10, 1)],
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (8, 2)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (9, 2)],
  term (-3 : Rat) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((17 : Rat) / 6) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(5, 1), (8, 2), (15, 1)],
  term (-3 : Rat) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((17 : Rat) / 6) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(5, 1), (9, 2), (15, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((4 : Rat) / 3) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((2 : Rat) / 3) [(7, 1), (8, 2), (13, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (8, 2), (15, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((2 : Rat) / 3) [(7, 1), (9, 2), (13, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (9, 2), (15, 1)],
  term ((-3 : Rat) / 2) [(8, 1), (10, 1)],
  term ((-25 : Rat) / 3) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term (-1 : Rat) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (12 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(8, 1), (10, 1), (13, 2)],
  term ((1 : Rat) / 6) [(8, 1), (10, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(8, 1), (10, 1), (15, 2)],
  term ((7 : Rat) / 3) [(8, 1), (10, 2)],
  term ((3 : Rat) / 4) [(8, 2)],
  term ((-7 : Rat) / 6) [(8, 2), (10, 1)],
  term ((25 : Rat) / 6) [(8, 2), (11, 1), (15, 1)],
  term ((1 : Rat) / 2) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(8, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(8, 2), (13, 2)],
  term ((-1 : Rat) / 12) [(8, 2), (14, 1)],
  term ((3 : Rat) / 4) [(8, 2), (15, 2)],
  term ((7 : Rat) / 3) [(9, 1), (10, 1), (11, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (12 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (11, 1), (13, 2)],
  term ((1 : Rat) / 6) [(9, 1), (11, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(9, 1), (11, 1), (15, 2)],
  term ((-25 : Rat) / 3) [(9, 1), (11, 2), (15, 1)],
  term ((3 : Rat) / 4) [(9, 2)],
  term ((-7 : Rat) / 6) [(9, 2), (10, 1)],
  term ((25 : Rat) / 6) [(9, 2), (11, 1), (15, 1)],
  term ((1 : Rat) / 2) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(9, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(9, 2), (13, 2)],
  term ((-1 : Rat) / 12) [(9, 2), (14, 1)],
  term ((3 : Rat) / 4) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 16. -/
theorem rs_R014_ueqv_R014YY_block_23_0000_0016_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_23_0000_0016
      rs_R014_ueqv_R014YY_block_23_0000_0016 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
