/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 21:0-43

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_21_0000_0043 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0000 : Poly :=
[
  term ((5792 : Rat) / 5) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0000 : Poly :=
[
  term ((11584 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5792 : Rat) / 5) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5792 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((11584 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0000
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0001 : Poly :=
[
  term ((34348 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0001 : Poly :=
[
  term ((68696 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((68696 : Rat) / 25) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-34348 : Rat) / 25) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-34348 : Rat) / 25) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0001
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0002 : Poly :=
[
  term ((-24092 : Rat) / 25) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0002 : Poly :=
[
  term ((-48184 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-48184 : Rat) / 25) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((24092 : Rat) / 25) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((24092 : Rat) / 25) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0002
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0003 : Poly :=
[
  term ((-4208 : Rat) / 25) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0003 : Poly :=
[
  term ((-8416 : Rat) / 25) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0003
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0004 : Poly :=
[
  term ((-54336 : Rat) / 25) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0004 : Poly :=
[
  term ((-108672 : Rat) / 25) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0004
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0005 : Poly :=
[
  term ((8512 : Rat) / 25) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0005 : Poly :=
[
  term ((17024 : Rat) / 25) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((17024 : Rat) / 25) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8512 : Rat) / 25) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8512 : Rat) / 25) [(1, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0005
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0006 : Poly :=
[
  term ((-46296 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0006 : Poly :=
[
  term ((-92592 : Rat) / 25) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0006
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0007 : Poly :=
[
  term ((85496 : Rat) / 25) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 7 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0007 : Poly :=
[
  term ((170992 : Rat) / 25) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((170992 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-85496 : Rat) / 25) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-85496 : Rat) / 25) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0007
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0008 : Poly :=
[
  term ((11596 : Rat) / 25) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0008 : Poly :=
[
  term ((23192 : Rat) / 25) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((23192 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11596 : Rat) / 25) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11596 : Rat) / 25) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0008_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0008
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0009 : Poly :=
[
  term ((40638 : Rat) / 25) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0009 : Poly :=
[
  term ((81276 : Rat) / 25) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((81276 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-40638 : Rat) / 25) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-40638 : Rat) / 25) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0009_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0009
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0010 : Poly :=
[
  term ((-4152 : Rat) / 25) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0010 : Poly :=
[
  term ((-8304 : Rat) / 25) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8304 : Rat) / 25) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4152 : Rat) / 25) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((4152 : Rat) / 25) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0010_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0010
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0011 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0011 : Poly :=
[
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0011_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0011
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0012 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0012 : Poly :=
[
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0012_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0012
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0013 : Poly :=
[
  term (2 : Rat) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 13 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0013 : Poly :=
[
  term (4 : Rat) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0013_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0013
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0014 : Poly :=
[
  term ((5072 : Rat) / 25) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0014 : Poly :=
[
  term ((10144 : Rat) / 25) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0014_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0014
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0015 : Poly :=
[
  term ((-1264 : Rat) / 5) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0015 : Poly :=
[
  term ((-2528 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2528 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1264 : Rat) / 5) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1264 : Rat) / 5) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0015_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0015
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0016 : Poly :=
[
  term ((1992 : Rat) / 25) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0016 : Poly :=
[
  term ((3984 : Rat) / 25) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3984 : Rat) / 25) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1992 : Rat) / 25) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1992 : Rat) / 25) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0016_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0016
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0017 : Poly :=
[
  term ((-2416 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0017 : Poly :=
[
  term ((-4832 : Rat) / 25) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2416 : Rat) / 25) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((2416 : Rat) / 25) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4832 : Rat) / 25) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0017_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0017
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0018 : Poly :=
[
  term ((-6128 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0018 : Poly :=
[
  term ((-12256 : Rat) / 25) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12256 : Rat) / 25) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((6128 : Rat) / 25) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((6128 : Rat) / 25) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0018_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0018
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0019 : Poly :=
[
  term ((14904 : Rat) / 25) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 19 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0019 : Poly :=
[
  term ((29808 : Rat) / 25) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((29808 : Rat) / 25) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-14904 : Rat) / 25) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-14904 : Rat) / 25) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0019_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0019
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0020 : Poly :=
[
  term (-1 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 20 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0020 : Poly :=
[
  term (-2 : Rat) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term (1 : Rat) [(6, 1), (10, 2), (16, 1)],
  term (1 : Rat) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0020_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0020
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0021 : Poly :=
[
  term ((3312 : Rat) / 25) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0021 : Poly :=
[
  term ((6624 : Rat) / 25) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3312 : Rat) / 25) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3312 : Rat) / 25) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((6624 : Rat) / 25) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0021_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0021
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0022 : Poly :=
[
  term ((1792 : Rat) / 25) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0022 : Poly :=
[
  term ((3584 : Rat) / 25) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0022_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0022
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0023 : Poly :=
[
  term ((-10696 : Rat) / 25) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0023 : Poly :=
[
  term ((-21392 : Rat) / 25) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21392 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10696 : Rat) / 25) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((10696 : Rat) / 25) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0023_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0023
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0024 : Poly :=
[
  term ((1348 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0024 : Poly :=
[
  term ((2696 : Rat) / 25) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2696 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1348 : Rat) / 25) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1348 : Rat) / 25) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0024_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0024
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0025 : Poly :=
[
  term ((896 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0025 : Poly :=
[
  term ((1792 : Rat) / 25) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0025_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0025
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0026 : Poly :=
[
  term ((-11392 : Rat) / 25) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0026 : Poly :=
[
  term ((-22784 : Rat) / 25) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11392 : Rat) / 25) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((11392 : Rat) / 25) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-22784 : Rat) / 25) [(8, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0026_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0026
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0027 : Poly :=
[
  term ((-1792 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0027 : Poly :=
[
  term ((-3584 : Rat) / 25) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0027_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0027
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0028 : Poly :=
[
  term ((11584 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 28 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0028 : Poly :=
[
  term ((23168 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((23168 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0028_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0028
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0029 : Poly :=
[
  term ((-13984 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0029 : Poly :=
[
  term ((-27968 : Rat) / 25) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13984 : Rat) / 25) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((13984 : Rat) / 25) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-27968 : Rat) / 25) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0029_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0029
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0030 : Poly :=
[
  term (-408 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0030 : Poly :=
[
  term (-816 : Rat) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (408 : Rat) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term (408 : Rat) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term (-816 : Rat) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0030_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0030
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0031 : Poly :=
[
  term ((5256 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0031 : Poly :=
[
  term ((10512 : Rat) / 25) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((10512 : Rat) / 25) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5256 : Rat) / 25) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5256 : Rat) / 25) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0031_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0031
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0032 : Poly :=
[
  term ((-4056 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 32 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0032 : Poly :=
[
  term ((-8112 : Rat) / 25) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-8112 : Rat) / 25) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((4056 : Rat) / 25) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((4056 : Rat) / 25) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0032_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0032
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0033 : Poly :=
[
  term ((9976 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 33 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0033 : Poly :=
[
  term ((19952 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((19952 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9976 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9976 : Rat) / 5) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0033_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0033
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0034 : Poly :=
[
  term ((-4724 : Rat) / 5) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0034 : Poly :=
[
  term ((-9448 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9448 : Rat) / 5) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4724 : Rat) / 5) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4724 : Rat) / 5) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0034_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0034
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0035 : Poly :=
[
  term ((-9044 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0035 : Poly :=
[
  term ((-18088 : Rat) / 25) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18088 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((9044 : Rat) / 25) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((9044 : Rat) / 25) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0035_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0035
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0036 : Poly :=
[
  term ((896 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0036 : Poly :=
[
  term ((1792 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 5) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0036_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0036
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0037 : Poly :=
[
  term ((-12772 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0037 : Poly :=
[
  term ((-25544 : Rat) / 25) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25544 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12772 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((12772 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0037_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0037
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0038 : Poly :=
[
  term ((-85496 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 38 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0038 : Poly :=
[
  term ((-170992 : Rat) / 25) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-170992 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((85496 : Rat) / 25) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((85496 : Rat) / 25) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0038_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0038
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0039 : Poly :=
[
  term ((9952 : Rat) / 25) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0039 : Poly :=
[
  term ((19904 : Rat) / 25) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((19904 : Rat) / 25) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9952 : Rat) / 25) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9952 : Rat) / 25) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0039_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0039
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0040 : Poly :=
[
  term (-10 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 40 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0040 : Poly :=
[
  term (-20 : Rat) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term (-20 : Rat) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term (10 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (10 : Rat) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0040_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0040
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0041 : Poly :=
[
  term (8 : Rat) [(14, 2), (16, 1)]
]

/-- Partial product 41 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0041 : Poly :=
[
  term (16 : Rat) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term (16 : Rat) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term (-8 : Rat) [(10, 2), (14, 2), (16, 1)],
  term (-8 : Rat) [(11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0041_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0041
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0042 : Poly :=
[
  term ((-5614 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 42 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0042 : Poly :=
[
  term ((-11228 : Rat) / 5) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-11228 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((5614 : Rat) / 5) [(10, 2), (15, 2), (16, 1)],
  term ((5614 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0042_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0042
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YY_coefficient_21_0043 : Poly :=
[
  term (2 : Rat) [(16, 1)]
]

/-- Partial product 43 for generator 21. -/
def rs_R010_ueqv_R010YY_partial_21_0043 : Poly :=
[
  term (4 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(10, 2), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 21. -/
theorem rs_R010_ueqv_R010YY_partial_21_0043_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_21_0043
        rs_R010_ueqv_R010YY_generator_21_0000_0043 =
      rs_R010_ueqv_R010YY_partial_21_0043 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_21_0000_0043 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_21_0000,
  rs_R010_ueqv_R010YY_partial_21_0001,
  rs_R010_ueqv_R010YY_partial_21_0002,
  rs_R010_ueqv_R010YY_partial_21_0003,
  rs_R010_ueqv_R010YY_partial_21_0004,
  rs_R010_ueqv_R010YY_partial_21_0005,
  rs_R010_ueqv_R010YY_partial_21_0006,
  rs_R010_ueqv_R010YY_partial_21_0007,
  rs_R010_ueqv_R010YY_partial_21_0008,
  rs_R010_ueqv_R010YY_partial_21_0009,
  rs_R010_ueqv_R010YY_partial_21_0010,
  rs_R010_ueqv_R010YY_partial_21_0011,
  rs_R010_ueqv_R010YY_partial_21_0012,
  rs_R010_ueqv_R010YY_partial_21_0013,
  rs_R010_ueqv_R010YY_partial_21_0014,
  rs_R010_ueqv_R010YY_partial_21_0015,
  rs_R010_ueqv_R010YY_partial_21_0016,
  rs_R010_ueqv_R010YY_partial_21_0017,
  rs_R010_ueqv_R010YY_partial_21_0018,
  rs_R010_ueqv_R010YY_partial_21_0019,
  rs_R010_ueqv_R010YY_partial_21_0020,
  rs_R010_ueqv_R010YY_partial_21_0021,
  rs_R010_ueqv_R010YY_partial_21_0022,
  rs_R010_ueqv_R010YY_partial_21_0023,
  rs_R010_ueqv_R010YY_partial_21_0024,
  rs_R010_ueqv_R010YY_partial_21_0025,
  rs_R010_ueqv_R010YY_partial_21_0026,
  rs_R010_ueqv_R010YY_partial_21_0027,
  rs_R010_ueqv_R010YY_partial_21_0028,
  rs_R010_ueqv_R010YY_partial_21_0029,
  rs_R010_ueqv_R010YY_partial_21_0030,
  rs_R010_ueqv_R010YY_partial_21_0031,
  rs_R010_ueqv_R010YY_partial_21_0032,
  rs_R010_ueqv_R010YY_partial_21_0033,
  rs_R010_ueqv_R010YY_partial_21_0034,
  rs_R010_ueqv_R010YY_partial_21_0035,
  rs_R010_ueqv_R010YY_partial_21_0036,
  rs_R010_ueqv_R010YY_partial_21_0037,
  rs_R010_ueqv_R010YY_partial_21_0038,
  rs_R010_ueqv_R010YY_partial_21_0039,
  rs_R010_ueqv_R010YY_partial_21_0040,
  rs_R010_ueqv_R010YY_partial_21_0041,
  rs_R010_ueqv_R010YY_partial_21_0042,
  rs_R010_ueqv_R010YY_partial_21_0043
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_21_0000_0043 : Poly :=
[
  term ((11584 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((68696 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48184 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5792 : Rat) / 5) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-48184 : Rat) / 25) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((39736 : Rat) / 25) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((11584 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-34348 : Rat) / 25) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((24092 : Rat) / 25) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((24092 : Rat) / 25) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-34348 : Rat) / 25) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((170992 : Rat) / 25) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((23192 : Rat) / 25) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((81276 : Rat) / 25) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((17024 : Rat) / 25) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((17024 : Rat) / 25) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((170992 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23192 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((81276 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-38256 : Rat) / 25) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8512 : Rat) / 25) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85496 : Rat) / 25) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11596 : Rat) / 25) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-40638 : Rat) / 25) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-8512 : Rat) / 25) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((-85496 : Rat) / 25) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11596 : Rat) / 25) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-40638 : Rat) / 25) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-8304 : Rat) / 25) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8304 : Rat) / 25) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4152 : Rat) / 25) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((4152 : Rat) / 25) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2528 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3984 : Rat) / 25) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2528 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3984 : Rat) / 25) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1264 : Rat) / 5) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1992 : Rat) / 25) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((1264 : Rat) / 5) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1992 : Rat) / 25) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4832 : Rat) / 25) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12256 : Rat) / 25) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((29808 : Rat) / 25) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((2416 : Rat) / 25) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((29808 : Rat) / 25) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1968 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4832 : Rat) / 25) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((6128 : Rat) / 25) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-14904 : Rat) / 25) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(6, 1), (10, 2), (16, 1)],
  term ((-14904 : Rat) / 25) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(6, 1), (11, 2), (16, 1)],
  term ((6128 : Rat) / 25) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((6624 : Rat) / 25) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21392 : Rat) / 25) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2696 : Rat) / 25) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((272 : Rat) / 25) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3312 : Rat) / 25) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((6624 : Rat) / 25) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21392 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2696 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((10696 : Rat) / 25) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1348 : Rat) / 25) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((10696 : Rat) / 25) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1348 : Rat) / 25) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((23168 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27968 : Rat) / 25) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-816 : Rat) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-22784 : Rat) / 25) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((19952 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9448 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18088 : Rat) / 25) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25544 : Rat) / 25) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-170992 : Rat) / 25) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((19904 : Rat) / 25) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-11228 : Rat) / 5) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(8, 1), (10, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((10512 : Rat) / 25) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((656 : Rat) / 5) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((11392 : Rat) / 25) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-896 : Rat) / 25) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22784 : Rat) / 25) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((10512 : Rat) / 25) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8112 : Rat) / 25) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((13984 : Rat) / 25) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term (408 : Rat) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((1792 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25544 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-170992 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((19904 : Rat) / 25) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-11228 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term ((8368 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-33256 : Rat) / 25) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7888 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((23168 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27968 : Rat) / 25) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-816 : Rat) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5256 : Rat) / 25) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((4056 : Rat) / 25) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-9976 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4724 : Rat) / 5) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9044 : Rat) / 25) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 5) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12772 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((85496 : Rat) / 25) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-9952 : Rat) / 25) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term (10 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(10, 2), (14, 2), (16, 1)],
  term ((5614 : Rat) / 5) [(10, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(10, 2), (16, 1)],
  term ((-5256 : Rat) / 25) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((4056 : Rat) / 25) [(10, 3), (15, 2), (16, 1)],
  term ((-896 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12772 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((85496 : Rat) / 25) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-9952 : Rat) / 25) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term (10 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(11, 2), (14, 2), (16, 1)],
  term ((5614 : Rat) / 5) [(11, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 2), (16, 1)],
  term ((-9976 : Rat) / 5) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((4724 : Rat) / 5) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((9044 : Rat) / 25) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 43. -/
theorem rs_R010_ueqv_R010YY_block_21_0000_0043_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_21_0000_0043
      rs_R010_ueqv_R010YY_block_21_0000_0043 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
