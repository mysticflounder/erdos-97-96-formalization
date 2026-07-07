/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 16:0-15

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_16_0000_0015 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0000 : Poly :=
[
  term (-1 : Rat) []
]

/-- Partial product 0 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0000 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(1, 2)],
  term (-2 : Rat) [(6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0000_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0000
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0001 : Poly :=
[
  term (8 : Rat) [(3, 1), (13, 1)]
]

/-- Partial product 1 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0001 : Poly :=
[
  term (-16 : Rat) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term (8 : Rat) [(0, 2), (3, 1), (13, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term (8 : Rat) [(1, 2), (3, 1), (13, 1)],
  term (16 : Rat) [(3, 1), (6, 1), (13, 1)],
  term (-8 : Rat) [(3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0001_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0001
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0002 : Poly :=
[
  term ((-4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0002 : Poly :=
[
  term ((8 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0002_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0002
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0003 : Poly :=
[
  term (-8 : Rat) [(5, 1), (13, 1)]
]

/-- Partial product 3 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0003 : Poly :=
[
  term (16 : Rat) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term (-8 : Rat) [(0, 2), (5, 1), (13, 1)],
  term (16 : Rat) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term (-8 : Rat) [(1, 2), (5, 1), (13, 1)],
  term (-16 : Rat) [(5, 1), (6, 1), (13, 1)],
  term (8 : Rat) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0003_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0003
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0004 : Poly :=
[
  term (8 : Rat) [(5, 1), (15, 1)]
]

/-- Partial product 4 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0004 : Poly :=
[
  term (-16 : Rat) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term (8 : Rat) [(0, 2), (5, 1), (15, 1)],
  term (-16 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term (8 : Rat) [(1, 2), (5, 1), (15, 1)],
  term (16 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (-8 : Rat) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0004_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0004
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0005 : Poly :=
[
  term (6 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0005 : Poly :=
[
  term (-12 : Rat) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0005_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0005
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0006 : Poly :=
[
  term (24 : Rat) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0006 : Poly :=
[
  term (-48 : Rat) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0006_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0006
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0007 : Poly :=
[
  term (12 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0007 : Poly :=
[
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0007_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0007
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0008 : Poly :=
[
  term (12 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0008 : Poly :=
[
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0008_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0008
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0009 : Poly :=
[
  term ((-9 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0009 : Poly :=
[
  term (9 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0009_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0009
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0010 : Poly :=
[
  term (-18 : Rat) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 10 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0010 : Poly :=
[
  term (36 : Rat) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (-18 : Rat) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term (36 : Rat) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (-18 : Rat) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term (-36 : Rat) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term (18 : Rat) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0010_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0010
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0011 : Poly :=
[
  term (-8 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 11 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0011 : Poly :=
[
  term (16 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(0, 2), (9, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (-16 : Rat) [(6, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0011_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0011
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0012 : Poly :=
[
  term ((4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0012 : Poly :=
[
  term ((-8 : Rat) / 3) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0012_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0012
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0013 : Poly :=
[
  term ((1 : Rat) / 3) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0013 : Poly :=
[
  term ((-2 : Rat) / 3) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0013_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0013
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0014 : Poly :=
[
  term (-4 : Rat) [(15, 2)]
]

/-- Partial product 14 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0014 : Poly :=
[
  term (8 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (-4 : Rat) [(0, 2), (15, 2)],
  term (8 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (-4 : Rat) [(1, 2), (15, 2)],
  term (-8 : Rat) [(6, 1), (15, 2)],
  term (4 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0014_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0014
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 16. -/
def rs_R002_ueqv_R002YNYN_coefficient_16_0015 : Poly :=
[
  term ((-1 : Rat) / 3) [(15, 2), (16, 1)]
]

/-- Partial product 15 for generator 16. -/
def rs_R002_ueqv_R002YNYN_partial_16_0015 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 2), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 16. -/
theorem rs_R002_ueqv_R002YNYN_partial_16_0015_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_16_0015
        rs_R002_ueqv_R002YNYN_generator_16_0000_0015 =
      rs_R002_ueqv_R002YNYN_partial_16_0015 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_16_0000_0015 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_16_0000,
  rs_R002_ueqv_R002YNYN_partial_16_0001,
  rs_R002_ueqv_R002YNYN_partial_16_0002,
  rs_R002_ueqv_R002YNYN_partial_16_0003,
  rs_R002_ueqv_R002YNYN_partial_16_0004,
  rs_R002_ueqv_R002YNYN_partial_16_0005,
  rs_R002_ueqv_R002YNYN_partial_16_0006,
  rs_R002_ueqv_R002YNYN_partial_16_0007,
  rs_R002_ueqv_R002YNYN_partial_16_0008,
  rs_R002_ueqv_R002YNYN_partial_16_0009,
  rs_R002_ueqv_R002YNYN_partial_16_0010,
  rs_R002_ueqv_R002YNYN_partial_16_0011,
  rs_R002_ueqv_R002YNYN_partial_16_0012,
  rs_R002_ueqv_R002YNYN_partial_16_0013,
  rs_R002_ueqv_R002YNYN_partial_16_0014,
  rs_R002_ueqv_R002YNYN_partial_16_0015
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_16_0000_0015 : Poly :=
[
  term (1 : Rat) [],
  term (-16 : Rat) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((8 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term (-16 : Rat) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-48 : Rat) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (9 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (16 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (15, 2)],
  term ((2 : Rat) / 3) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 2)],
  term (8 : Rat) [(0, 2), (3, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 2), (5, 1), (13, 1)],
  term (8 : Rat) [(0, 2), (5, 1), (15, 1)],
  term (6 : Rat) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(0, 2), (9, 1), (15, 1)],
  term ((4 : Rat) / 3) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (15, 2)],
  term ((-1 : Rat) / 3) [(0, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((8 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term (-16 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term (-12 : Rat) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (16 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (15, 2)],
  term ((2 : Rat) / 3) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term (-48 : Rat) [(1, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term (9 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (36 : Rat) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (-1 : Rat) [(1, 2)],
  term (8 : Rat) [(1, 2), (3, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (5, 1), (13, 1)],
  term (8 : Rat) [(1, 2), (5, 1), (15, 1)],
  term (6 : Rat) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(1, 2), (9, 1), (15, 1)],
  term ((4 : Rat) / 3) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (15, 2)],
  term ((-1 : Rat) / 3) [(1, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (6, 1), (13, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (13, 1)],
  term ((4 : Rat) / 3) [(3, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (6, 1), (13, 1)],
  term (16 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (8 : Rat) [(5, 1), (13, 1)],
  term (-8 : Rat) [(5, 1), (15, 1)],
  term (-2 : Rat) [(6, 1)],
  term (48 : Rat) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-9 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term (-16 : Rat) [(6, 1), (9, 1), (15, 1)],
  term ((8 : Rat) / 3) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(6, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(6, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(7, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(15, 2)],
  term ((1 : Rat) / 3) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 15. -/
theorem rs_R002_ueqv_R002YNYN_block_16_0000_0015_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_16_0000_0015
      rs_R002_ueqv_R002YNYN_block_16_0000_0015 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
