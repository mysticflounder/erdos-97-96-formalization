/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 17:0-47

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_17_0000_0047 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0000 : Poly :=
[
  term ((33647 : Rat) / 672) []
]

/-- Partial product 0 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0000 : Poly :=
[
  term ((33647 : Rat) / 336) [(4, 1), (6, 1)],
  term ((-33647 : Rat) / 672) [(4, 2)],
  term ((33647 : Rat) / 336) [(5, 1), (7, 1)],
  term ((-33647 : Rat) / 672) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0000_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0000
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0001 : Poly :=
[
  term ((519 : Rat) / 1232) [(0, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0001 : Poly :=
[
  term ((519 : Rat) / 616) [(0, 1), (4, 1), (6, 1)],
  term ((-519 : Rat) / 1232) [(0, 1), (4, 2)],
  term ((519 : Rat) / 616) [(0, 1), (5, 1), (7, 1)],
  term ((-519 : Rat) / 1232) [(0, 1), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0001_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0001
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0002 : Poly :=
[
  term ((-7 : Rat) / 2) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0002 : Poly :=
[
  term (-7 : Rat) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((7 : Rat) / 2) [(0, 1), (4, 2), (7, 1), (13, 1)],
  term (-7 : Rat) [(0, 1), (5, 1), (7, 2), (13, 1)],
  term ((7 : Rat) / 2) [(0, 1), (5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0002_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0002
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0003 : Poly :=
[
  term ((-301207 : Rat) / 770) [(0, 1), (8, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0003 : Poly :=
[
  term ((-301207 : Rat) / 385) [(0, 1), (4, 1), (6, 1), (8, 1)],
  term ((301207 : Rat) / 770) [(0, 1), (4, 2), (8, 1)],
  term ((-301207 : Rat) / 385) [(0, 1), (5, 1), (7, 1), (8, 1)],
  term ((301207 : Rat) / 770) [(0, 1), (5, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0003_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0003
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0004 : Poly :=
[
  term (6 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0004 : Poly :=
[
  term (12 : Rat) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0004_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0004
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0005 : Poly :=
[
  term ((7 : Rat) / 4) [(1, 1), (7, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0005 : Poly :=
[
  term ((7 : Rat) / 2) [(1, 1), (4, 1), (6, 1), (7, 1)],
  term ((-7 : Rat) / 4) [(1, 1), (4, 2), (7, 1)],
  term ((7 : Rat) / 2) [(1, 1), (5, 1), (7, 2)],
  term ((-7 : Rat) / 4) [(1, 1), (5, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0005_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0005
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0006 : Poly :=
[
  term (-1 : Rat) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0006 : Poly :=
[
  term (-2 : Rat) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (4, 2), (8, 1), (15, 1)],
  term (-2 : Rat) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (5, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0006_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0006
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0007 : Poly :=
[
  term ((-301207 : Rat) / 770) [(1, 1), (9, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0007 : Poly :=
[
  term ((-301207 : Rat) / 385) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((301207 : Rat) / 770) [(1, 1), (4, 2), (9, 1)],
  term ((-301207 : Rat) / 385) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((301207 : Rat) / 770) [(1, 1), (5, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0007_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0007
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0008 : Poly :=
[
  term (1 : Rat) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 8 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0008 : Poly :=
[
  term (2 : Rat) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(1, 1), (4, 2), (14, 1), (15, 1)],
  term (2 : Rat) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(1, 1), (5, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0008_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0008
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0009 : Poly :=
[
  term (-3 : Rat) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0009 : Poly :=
[
  term (-6 : Rat) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0009_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0009
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0010 : Poly :=
[
  term ((7 : Rat) / 4) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 10 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0010 : Poly :=
[
  term ((7 : Rat) / 2) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-7 : Rat) / 4) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((7 : Rat) / 2) [(2, 1), (5, 1), (7, 2), (13, 1)],
  term ((-7 : Rat) / 4) [(2, 1), (5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0010_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0010
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0011 : Poly :=
[
  term (-3 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0011 : Poly :=
[
  term (-6 : Rat) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0011_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0011
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0012 : Poly :=
[
  term ((-7 : Rat) / 8) [(3, 1), (7, 1)]
]

/-- Partial product 12 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0012 : Poly :=
[
  term ((-7 : Rat) / 4) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((7 : Rat) / 8) [(3, 1), (4, 2), (7, 1)],
  term ((-7 : Rat) / 4) [(3, 1), (5, 1), (7, 2)],
  term ((7 : Rat) / 8) [(3, 1), (5, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0012_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0012
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0013 : Poly :=
[
  term ((41 : Rat) / 2) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 13 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0013 : Poly :=
[
  term (41 : Rat) [(3, 1), (4, 1), (6, 1), (7, 1), (10, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (4, 2), (7, 1), (10, 1)],
  term (41 : Rat) [(3, 1), (5, 1), (7, 2), (10, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (5, 2), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0013_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0013
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0014 : Poly :=
[
  term (-6 : Rat) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 14 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0014 : Poly :=
[
  term (-12 : Rat) [(3, 1), (4, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (5, 2), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0014_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0014
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0015 : Poly :=
[
  term (-1 : Rat) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 15 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0015 : Poly :=
[
  term (-2 : Rat) [(3, 1), (4, 1), (6, 1), (9, 1), (10, 1)],
  term (1 : Rat) [(3, 1), (4, 2), (9, 1), (10, 1)],
  term (-2 : Rat) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1)],
  term (1 : Rat) [(3, 1), (5, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0015_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0015
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0016 : Poly :=
[
  term ((16867 : Rat) / 770) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 16 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0016 : Poly :=
[
  term ((16867 : Rat) / 385) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (4, 2), (10, 1), (15, 1)],
  term ((16867 : Rat) / 385) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (5, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0016_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0016
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0017 : Poly :=
[
  term (-30 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0017 : Poly :=
[
  term (-60 : Rat) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term (-60 : Rat) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0017_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0017
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0018 : Poly :=
[
  term (7 : Rat) [(3, 1), (13, 1)]
]

/-- Partial product 18 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0018 : Poly :=
[
  term (14 : Rat) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term (-7 : Rat) [(3, 1), (4, 2), (13, 1)],
  term (14 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term (-7 : Rat) [(3, 1), (5, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0018_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0018
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0019 : Poly :=
[
  term ((3 : Rat) / 2) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0019 : Poly :=
[
  term (3 : Rat) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0019_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0019
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0020 : Poly :=
[
  term (-7 : Rat) [(5, 1), (13, 1)]
]

/-- Partial product 20 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0020 : Poly :=
[
  term (-14 : Rat) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term (7 : Rat) [(4, 2), (5, 1), (13, 1)],
  term (-14 : Rat) [(5, 2), (7, 1), (13, 1)],
  term (7 : Rat) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0020_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0020
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0021 : Poly :=
[
  term ((-2 : Rat) / 3) [(7, 1), (9, 1)]
]

/-- Partial product 21 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0021 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((2 : Rat) / 3) [(4, 2), (7, 1), (9, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 2), (9, 1)],
  term ((2 : Rat) / 3) [(5, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0021_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0021
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0022 : Poly :=
[
  term ((7 : Rat) / 4) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 22 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0022 : Poly :=
[
  term ((7 : Rat) / 2) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-7 : Rat) / 4) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((7 : Rat) / 2) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((-7 : Rat) / 4) [(5, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0022_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0022
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0023 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 23 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0023 : Poly :=
[
  term ((-7 : Rat) / 2) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((7 : Rat) / 4) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-7 : Rat) / 2) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term ((7 : Rat) / 4) [(5, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0023_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0023
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0024 : Poly :=
[
  term (7 : Rat) [(7, 1), (11, 1)]
]

/-- Partial product 24 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0024 : Poly :=
[
  term (14 : Rat) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term (-7 : Rat) [(4, 2), (7, 1), (11, 1)],
  term (14 : Rat) [(5, 1), (7, 2), (11, 1)],
  term (-7 : Rat) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0024_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0024
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0025 : Poly :=
[
  term (-3 : Rat) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0025 : Poly :=
[
  term (-6 : Rat) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0025_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0025
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0026 : Poly :=
[
  term ((79 : Rat) / 24) [(7, 1), (13, 1)]
]

/-- Partial product 26 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0026 : Poly :=
[
  term ((79 : Rat) / 12) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-79 : Rat) / 24) [(4, 2), (7, 1), (13, 1)],
  term ((79 : Rat) / 12) [(5, 1), (7, 2), (13, 1)],
  term ((-79 : Rat) / 24) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0026_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0026
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0027 : Poly :=
[
  term ((-23 : Rat) / 8) [(7, 1), (15, 1)]
]

/-- Partial product 27 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0027 : Poly :=
[
  term ((-23 : Rat) / 4) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((23 : Rat) / 8) [(4, 2), (7, 1), (15, 1)],
  term ((-23 : Rat) / 4) [(5, 1), (7, 2), (15, 1)],
  term ((23 : Rat) / 8) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0027_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0027
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0028 : Poly :=
[
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0028 : Poly :=
[
  term (3 : Rat) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0028_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0028
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0029 : Poly :=
[
  term ((-1 : Rat) / 12) [(8, 1)]
]

/-- Partial product 29 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0029 : Poly :=
[
  term ((-1 : Rat) / 6) [(4, 1), (6, 1), (8, 1)],
  term ((1 : Rat) / 12) [(4, 2), (8, 1)],
  term ((-1 : Rat) / 6) [(5, 1), (7, 1), (8, 1)],
  term ((1 : Rat) / 12) [(5, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0029_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0029
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0030 : Poly :=
[
  term ((1 : Rat) / 12) [(9, 1), (11, 1)]
]

/-- Partial product 30 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0030 : Poly :=
[
  term ((1 : Rat) / 6) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-1 : Rat) / 12) [(4, 2), (9, 1), (11, 1)],
  term ((1 : Rat) / 6) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1 : Rat) / 12) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0030_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0030
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0031 : Poly :=
[
  term ((1 : Rat) / 12) [(9, 1), (13, 1)]
]

/-- Partial product 31 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0031 : Poly :=
[
  term ((1 : Rat) / 6) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-1 : Rat) / 12) [(4, 2), (9, 1), (13, 1)],
  term ((1 : Rat) / 6) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1 : Rat) / 12) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0031_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0031
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0032 : Poly :=
[
  term ((-3 : Rat) / 2) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 32 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0032 : Poly :=
[
  term (-3 : Rat) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(5, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0032_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0032
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0033 : Poly :=
[
  term ((17 : Rat) / 12) [(9, 1), (15, 1)]
]

/-- Partial product 33 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0033 : Poly :=
[
  term ((17 : Rat) / 6) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(4, 2), (9, 1), (15, 1)],
  term ((17 : Rat) / 6) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0033_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0033
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0034 : Poly :=
[
  term (-1 : Rat) [(10, 1)]
]

/-- Partial product 34 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0034 : Poly :=
[
  term (-2 : Rat) [(4, 1), (6, 1), (10, 1)],
  term (1 : Rat) [(4, 2), (10, 1)],
  term (-2 : Rat) [(5, 1), (7, 1), (10, 1)],
  term (1 : Rat) [(5, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0034_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0034
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0035 : Poly :=
[
  term (-3 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0035 : Poly :=
[
  term (-6 : Rat) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0035_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0035
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0036 : Poly :=
[
  term (3 : Rat) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0036 : Poly :=
[
  term (6 : Rat) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0036_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0036
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0037 : Poly :=
[
  term ((7 : Rat) / 2) [(11, 1), (13, 1)]
]

/-- Partial product 37 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0037 : Poly :=
[
  term (7 : Rat) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-7 : Rat) / 2) [(4, 2), (11, 1), (13, 1)],
  term (7 : Rat) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-7 : Rat) / 2) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0037_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0037
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0038 : Poly :=
[
  term ((-3 : Rat) / 4) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 38 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0038 : Poly :=
[
  term ((-3 : Rat) / 2) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 4) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 4) [(5, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0038_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0038
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0039 : Poly :=
[
  term ((2609 : Rat) / 120) [(11, 1), (15, 1)]
]

/-- Partial product 39 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0039 : Poly :=
[
  term ((2609 : Rat) / 60) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2609 : Rat) / 120) [(4, 2), (11, 1), (15, 1)],
  term ((2609 : Rat) / 60) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2609 : Rat) / 120) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0039_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0039
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0040 : Poly :=
[
  term (-13 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0040 : Poly :=
[
  term (-26 : Rat) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (13 : Rat) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term (-26 : Rat) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (13 : Rat) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0040_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0040
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0041 : Poly :=
[
  term ((3 : Rat) / 4) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 41 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0041 : Poly :=
[
  term ((3 : Rat) / 2) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(5, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0041_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0041
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0042 : Poly :=
[
  term ((-232508 : Rat) / 1155) [(13, 1), (15, 1)]
]

/-- Partial product 42 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0042 : Poly :=
[
  term ((-465016 : Rat) / 1155) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((232508 : Rat) / 1155) [(4, 2), (13, 1), (15, 1)],
  term ((-465016 : Rat) / 1155) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((232508 : Rat) / 1155) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0042_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0042
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0043 : Poly :=
[
  term ((1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0043 : Poly :=
[
  term (1 : Rat) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0043_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0043
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0044 : Poly :=
[
  term ((17 : Rat) / 3) [(13, 2)]
]

/-- Partial product 44 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0044 : Poly :=
[
  term ((34 : Rat) / 3) [(4, 1), (6, 1), (13, 2)],
  term ((-17 : Rat) / 3) [(4, 2), (13, 2)],
  term ((34 : Rat) / 3) [(5, 1), (7, 1), (13, 2)],
  term ((-17 : Rat) / 3) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0044_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0044
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0045 : Poly :=
[
  term ((-53 : Rat) / 60) [(14, 1)]
]

/-- Partial product 45 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0045 : Poly :=
[
  term ((-53 : Rat) / 30) [(4, 1), (6, 1), (14, 1)],
  term ((53 : Rat) / 60) [(4, 2), (14, 1)],
  term ((-53 : Rat) / 30) [(5, 1), (7, 1), (14, 1)],
  term ((53 : Rat) / 60) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0045_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0045
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0046 : Poly :=
[
  term ((140017 : Rat) / 770) [(15, 2)]
]

/-- Partial product 46 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0046 : Poly :=
[
  term ((140017 : Rat) / 385) [(4, 1), (6, 1), (15, 2)],
  term ((-140017 : Rat) / 770) [(4, 2), (15, 2)],
  term ((140017 : Rat) / 385) [(5, 1), (7, 1), (15, 2)],
  term ((-140017 : Rat) / 770) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0046_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0046
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 17. -/
def rs_R014_ueqv_R014YY_coefficient_17_0047 : Poly :=
[
  term ((15 : Rat) / 2) [(15, 2), (16, 1)]
]

/-- Partial product 47 for generator 17. -/
def rs_R014_ueqv_R014YY_partial_17_0047 : Poly :=
[
  term (15 : Rat) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-15 : Rat) / 2) [(4, 2), (15, 2), (16, 1)],
  term (15 : Rat) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-15 : Rat) / 2) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 17. -/
theorem rs_R014_ueqv_R014YY_partial_17_0047_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_17_0047
        rs_R014_ueqv_R014YY_generator_17_0000_0047 =
      rs_R014_ueqv_R014YY_partial_17_0047 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_17_0000_0047 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_17_0000,
  rs_R014_ueqv_R014YY_partial_17_0001,
  rs_R014_ueqv_R014YY_partial_17_0002,
  rs_R014_ueqv_R014YY_partial_17_0003,
  rs_R014_ueqv_R014YY_partial_17_0004,
  rs_R014_ueqv_R014YY_partial_17_0005,
  rs_R014_ueqv_R014YY_partial_17_0006,
  rs_R014_ueqv_R014YY_partial_17_0007,
  rs_R014_ueqv_R014YY_partial_17_0008,
  rs_R014_ueqv_R014YY_partial_17_0009,
  rs_R014_ueqv_R014YY_partial_17_0010,
  rs_R014_ueqv_R014YY_partial_17_0011,
  rs_R014_ueqv_R014YY_partial_17_0012,
  rs_R014_ueqv_R014YY_partial_17_0013,
  rs_R014_ueqv_R014YY_partial_17_0014,
  rs_R014_ueqv_R014YY_partial_17_0015,
  rs_R014_ueqv_R014YY_partial_17_0016,
  rs_R014_ueqv_R014YY_partial_17_0017,
  rs_R014_ueqv_R014YY_partial_17_0018,
  rs_R014_ueqv_R014YY_partial_17_0019,
  rs_R014_ueqv_R014YY_partial_17_0020,
  rs_R014_ueqv_R014YY_partial_17_0021,
  rs_R014_ueqv_R014YY_partial_17_0022,
  rs_R014_ueqv_R014YY_partial_17_0023,
  rs_R014_ueqv_R014YY_partial_17_0024,
  rs_R014_ueqv_R014YY_partial_17_0025,
  rs_R014_ueqv_R014YY_partial_17_0026,
  rs_R014_ueqv_R014YY_partial_17_0027,
  rs_R014_ueqv_R014YY_partial_17_0028,
  rs_R014_ueqv_R014YY_partial_17_0029,
  rs_R014_ueqv_R014YY_partial_17_0030,
  rs_R014_ueqv_R014YY_partial_17_0031,
  rs_R014_ueqv_R014YY_partial_17_0032,
  rs_R014_ueqv_R014YY_partial_17_0033,
  rs_R014_ueqv_R014YY_partial_17_0034,
  rs_R014_ueqv_R014YY_partial_17_0035,
  rs_R014_ueqv_R014YY_partial_17_0036,
  rs_R014_ueqv_R014YY_partial_17_0037,
  rs_R014_ueqv_R014YY_partial_17_0038,
  rs_R014_ueqv_R014YY_partial_17_0039,
  rs_R014_ueqv_R014YY_partial_17_0040,
  rs_R014_ueqv_R014YY_partial_17_0041,
  rs_R014_ueqv_R014YY_partial_17_0042,
  rs_R014_ueqv_R014YY_partial_17_0043,
  rs_R014_ueqv_R014YY_partial_17_0044,
  rs_R014_ueqv_R014YY_partial_17_0045,
  rs_R014_ueqv_R014YY_partial_17_0046,
  rs_R014_ueqv_R014YY_partial_17_0047
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_17_0000_0047 : Poly :=
[
  term ((519 : Rat) / 616) [(0, 1), (4, 1), (6, 1)],
  term (-7 : Rat) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-301207 : Rat) / 385) [(0, 1), (4, 1), (6, 1), (8, 1)],
  term (12 : Rat) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-519 : Rat) / 1232) [(0, 1), (4, 2)],
  term ((7 : Rat) / 2) [(0, 1), (4, 2), (7, 1), (13, 1)],
  term ((301207 : Rat) / 770) [(0, 1), (4, 2), (8, 1)],
  term (-6 : Rat) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((519 : Rat) / 616) [(0, 1), (5, 1), (7, 1)],
  term ((-301207 : Rat) / 385) [(0, 1), (5, 1), (7, 1), (8, 1)],
  term (12 : Rat) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(0, 1), (5, 1), (7, 2), (13, 1)],
  term ((-519 : Rat) / 1232) [(0, 1), (5, 2)],
  term ((7 : Rat) / 2) [(0, 1), (5, 2), (7, 1), (13, 1)],
  term ((301207 : Rat) / 770) [(0, 1), (5, 2), (8, 1)],
  term (-6 : Rat) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(1, 1), (4, 1), (6, 1), (7, 1)],
  term (-2 : Rat) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((-301207 : Rat) / 385) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term (2 : Rat) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(1, 1), (4, 2), (7, 1)],
  term (1 : Rat) [(1, 1), (4, 2), (8, 1), (15, 1)],
  term ((301207 : Rat) / 770) [(1, 1), (4, 2), (9, 1)],
  term (-1 : Rat) [(1, 1), (4, 2), (14, 1), (15, 1)],
  term (3 : Rat) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((-301207 : Rat) / 385) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term (2 : Rat) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(1, 1), (5, 1), (7, 2)],
  term ((-7 : Rat) / 4) [(1, 1), (5, 2), (7, 1)],
  term (1 : Rat) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((301207 : Rat) / 770) [(1, 1), (5, 2), (9, 1)],
  term (-1 : Rat) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term (3 : Rat) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term (-6 : Rat) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term (3 : Rat) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(2, 1), (5, 1), (7, 2), (13, 1)],
  term ((-7 : Rat) / 4) [(2, 1), (5, 2), (7, 1), (13, 1)],
  term (3 : Rat) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term (41 : Rat) [(3, 1), (4, 1), (6, 1), (7, 1), (10, 1)],
  term (-12 : Rat) [(3, 1), (4, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (4, 1), (6, 1), (9, 1), (10, 1)],
  term ((16867 : Rat) / 385) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1)],
  term (-60 : Rat) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term (3 : Rat) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 8) [(3, 1), (4, 2), (7, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (4, 2), (7, 1), (10, 1)],
  term (6 : Rat) [(3, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (4, 2), (9, 1), (10, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (4, 2), (10, 1), (15, 1)],
  term (30 : Rat) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(3, 1), (4, 2), (13, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1)],
  term ((16867 : Rat) / 385) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term (-60 : Rat) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term (3 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(3, 1), (5, 1), (7, 2)],
  term (41 : Rat) [(3, 1), (5, 1), (7, 2), (10, 1)],
  term (-12 : Rat) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((7 : Rat) / 8) [(3, 1), (5, 2), (7, 1)],
  term ((-41 : Rat) / 2) [(3, 1), (5, 2), (7, 1), (10, 1)],
  term (6 : Rat) [(3, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(3, 1), (5, 2), (9, 1), (10, 1)],
  term ((-16867 : Rat) / 770) [(3, 1), (5, 2), (10, 1), (15, 1)],
  term (30 : Rat) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(3, 1), (5, 2), (13, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term (-14 : Rat) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((33647 : Rat) / 336) [(4, 1), (6, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((7 : Rat) / 2) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-7 : Rat) / 2) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term (14 : Rat) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term (-6 : Rat) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((79 : Rat) / 12) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-23 : Rat) / 4) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term (3 : Rat) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(4, 1), (6, 1), (8, 1)],
  term ((1 : Rat) / 6) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((1 : Rat) / 6) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term (-3 : Rat) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((17 : Rat) / 6) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term (-2 : Rat) [(4, 1), (6, 1), (10, 1)],
  term (-6 : Rat) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term (7 : Rat) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((2609 : Rat) / 60) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term (-26 : Rat) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-465016 : Rat) / 1155) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term (1 : Rat) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((34 : Rat) / 3) [(4, 1), (6, 1), (13, 2)],
  term ((-53 : Rat) / 30) [(4, 1), (6, 1), (14, 1)],
  term ((140017 : Rat) / 385) [(4, 1), (6, 1), (15, 2)],
  term (15 : Rat) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-33647 : Rat) / 672) [(4, 2)],
  term (7 : Rat) [(4, 2), (5, 1), (13, 1)],
  term ((2 : Rat) / 3) [(4, 2), (7, 1), (9, 1)],
  term ((-7 : Rat) / 4) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((7 : Rat) / 4) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term (-7 : Rat) [(4, 2), (7, 1), (11, 1)],
  term (3 : Rat) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-79 : Rat) / 24) [(4, 2), (7, 1), (13, 1)],
  term ((23 : Rat) / 8) [(4, 2), (7, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 12) [(4, 2), (8, 1)],
  term ((-1 : Rat) / 12) [(4, 2), (9, 1), (11, 1)],
  term ((-1 : Rat) / 12) [(4, 2), (9, 1), (13, 1)],
  term ((3 : Rat) / 2) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(4, 2), (9, 1), (15, 1)],
  term (1 : Rat) [(4, 2), (10, 1)],
  term (3 : Rat) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(4, 2), (11, 1), (13, 1)],
  term ((3 : Rat) / 4) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2609 : Rat) / 120) [(4, 2), (11, 1), (15, 1)],
  term (13 : Rat) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((232508 : Rat) / 1155) [(4, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 3) [(4, 2), (13, 2)],
  term ((53 : Rat) / 60) [(4, 2), (14, 1)],
  term ((-140017 : Rat) / 770) [(4, 2), (15, 2)],
  term ((-15 : Rat) / 2) [(4, 2), (15, 2), (16, 1)],
  term ((33647 : Rat) / 336) [(5, 1), (7, 1)],
  term ((-1 : Rat) / 6) [(5, 1), (7, 1), (8, 1)],
  term ((1 : Rat) / 6) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((1 : Rat) / 6) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term (-3 : Rat) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((17 : Rat) / 6) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term (-2 : Rat) [(5, 1), (7, 1), (10, 1)],
  term (-6 : Rat) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term (7 : Rat) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((2609 : Rat) / 60) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term (-26 : Rat) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-465016 : Rat) / 1155) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term (1 : Rat) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((34 : Rat) / 3) [(5, 1), (7, 1), (13, 2)],
  term ((-53 : Rat) / 30) [(5, 1), (7, 1), (14, 1)],
  term ((140017 : Rat) / 385) [(5, 1), (7, 1), (15, 2)],
  term (15 : Rat) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 2), (9, 1)],
  term ((7 : Rat) / 2) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((-7 : Rat) / 2) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term (14 : Rat) [(5, 1), (7, 2), (11, 1)],
  term (-6 : Rat) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((79 : Rat) / 12) [(5, 1), (7, 2), (13, 1)],
  term ((-23 : Rat) / 4) [(5, 1), (7, 2), (15, 1)],
  term (3 : Rat) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-33647 : Rat) / 672) [(5, 2)],
  term ((2 : Rat) / 3) [(5, 2), (7, 1), (9, 1)],
  term ((-7 : Rat) / 4) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((7 : Rat) / 4) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term (-7 : Rat) [(5, 2), (7, 1), (11, 1)],
  term (3 : Rat) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-415 : Rat) / 24) [(5, 2), (7, 1), (13, 1)],
  term ((23 : Rat) / 8) [(5, 2), (7, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 12) [(5, 2), (8, 1)],
  term ((-1 : Rat) / 12) [(5, 2), (9, 1), (11, 1)],
  term ((-1 : Rat) / 12) [(5, 2), (9, 1), (13, 1)],
  term ((3 : Rat) / 2) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-17 : Rat) / 12) [(5, 2), (9, 1), (15, 1)],
  term (1 : Rat) [(5, 2), (10, 1)],
  term (3 : Rat) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(5, 2), (11, 1), (13, 1)],
  term ((3 : Rat) / 4) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2609 : Rat) / 120) [(5, 2), (11, 1), (15, 1)],
  term (13 : Rat) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((232508 : Rat) / 1155) [(5, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 3) [(5, 2), (13, 2)],
  term ((53 : Rat) / 60) [(5, 2), (14, 1)],
  term ((-140017 : Rat) / 770) [(5, 2), (15, 2)],
  term ((-15 : Rat) / 2) [(5, 2), (15, 2), (16, 1)],
  term (7 : Rat) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 47. -/
theorem rs_R014_ueqv_R014YY_block_17_0000_0047_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_17_0000_0047
      rs_R014_ueqv_R014YY_block_17_0000_0047 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
