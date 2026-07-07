/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 21:0-27

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_21_0000_0027 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0000 : Poly :=
[
  term ((3846 : Rat) / 227) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 0 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0000 : Poly :=
[
  term ((-7692 : Rat) / 227) [(0, 1), (1, 1), (3, 1), (8, 1), (12, 1), (16, 1)],
  term ((3846 : Rat) / 227) [(0, 2), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3846 : Rat) / 227) [(1, 1), (3, 1), (6, 2), (12, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (3, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3846 : Rat) / 227) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((-7692 : Rat) / 227) [(1, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((3846 : Rat) / 227) [(1, 3), (3, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0000
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0001 : Poly :=
[
  term ((-108931 : Rat) / 3405) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0001 : Poly :=
[
  term ((217862 : Rat) / 3405) [(0, 1), (1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-108931 : Rat) / 3405) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-217862 : Rat) / 3405) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term ((108931 : Rat) / 3405) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-217862 : Rat) / 3405) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((108931 : Rat) / 3405) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((217862 : Rat) / 3405) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-108931 : Rat) / 3405) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0001
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0002 : Poly :=
[
  term ((3846 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0002 : Poly :=
[
  term ((-7692 : Rat) / 1135) [(0, 1), (1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (6, 1), (7, 2), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (6, 3), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0002
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0003 : Poly :=
[
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0003 : Poly :=
[
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0003
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0004 : Poly :=
[
  term ((-3366 : Rat) / 1135) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0004 : Poly :=
[
  term ((6732 : Rat) / 1135) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3366 : Rat) / 1135) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-6732 : Rat) / 1135) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((3366 : Rat) / 1135) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-6732 : Rat) / 1135) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((3366 : Rat) / 1135) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((6732 : Rat) / 1135) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3366 : Rat) / 1135) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0004
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0005 : Poly :=
[
  term ((-7692 : Rat) / 227) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0005 : Poly :=
[
  term ((15384 : Rat) / 227) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 227) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 227) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0005
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0006 : Poly :=
[
  term ((-20271 : Rat) / 1135) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0006 : Poly :=
[
  term ((40542 : Rat) / 1135) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-20271 : Rat) / 1135) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-40542 : Rat) / 1135) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((20271 : Rat) / 1135) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-40542 : Rat) / 1135) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((20271 : Rat) / 1135) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((40542 : Rat) / 1135) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-20271 : Rat) / 1135) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0006_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0006
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0007 : Poly :=
[
  term ((165421 : Rat) / 3405) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0007 : Poly :=
[
  term ((-330842 : Rat) / 3405) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((165421 : Rat) / 3405) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((330842 : Rat) / 3405) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-165421 : Rat) / 3405) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((330842 : Rat) / 3405) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-165421 : Rat) / 3405) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-330842 : Rat) / 3405) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((165421 : Rat) / 3405) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0007_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0007
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0008 : Poly :=
[
  term ((3686 : Rat) / 1135) [(1, 2), (16, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0008 : Poly :=
[
  term ((-7372 : Rat) / 1135) [(0, 1), (1, 2), (8, 1), (16, 1)],
  term ((3686 : Rat) / 1135) [(0, 2), (1, 2), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 2), (6, 2), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 2), (7, 2), (16, 1)],
  term ((-7372 : Rat) / 1135) [(1, 3), (9, 1), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0008_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0008
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0009 : Poly :=
[
  term ((-136 : Rat) / 681) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0009 : Poly :=
[
  term ((272 : Rat) / 681) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-136 : Rat) / 681) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((272 : Rat) / 681) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-136 : Rat) / 681) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((136 : Rat) / 681) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((136 : Rat) / 681) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0009_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0009
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0010 : Poly :=
[
  term (-10 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0010 : Poly :=
[
  term (20 : Rat) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(3, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0010_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0010
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0011 : Poly :=
[
  term (19 : Rat) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0011 : Poly :=
[
  term (-38 : Rat) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term (19 : Rat) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term (-38 : Rat) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term (19 : Rat) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term (38 : Rat) [(3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term (-19 : Rat) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term (38 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (-19 : Rat) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0011_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0011
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0012 : Poly :=
[
  term ((220 : Rat) / 227) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0012 : Poly :=
[
  term ((-440 : Rat) / 227) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((220 : Rat) / 227) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-440 : Rat) / 227) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((220 : Rat) / 227) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-220 : Rat) / 227) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-220 : Rat) / 227) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0012_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0012
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0013 : Poly :=
[
  term (-2 : Rat) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 13 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0013 : Poly :=
[
  term (4 : Rat) [(0, 1), (6, 1), (8, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 2), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 2), (8, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(6, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0013_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0013
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0014 : Poly :=
[
  term (-1 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0014 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (6, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term (1 : Rat) [(6, 1), (7, 2), (16, 1)],
  term (-2 : Rat) [(6, 2), (8, 1), (16, 1)],
  term (1 : Rat) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0014_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0014
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0015 : Poly :=
[
  term (4 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0015 : Poly :=
[
  term (-8 : Rat) [(0, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0015_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0015
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0016 : Poly :=
[
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0016 : Poly :=
[
  term (-4 : Rat) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0016_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0016
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0017 : Poly :=
[
  term (-4 : Rat) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0017 : Poly :=
[
  term (8 : Rat) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(6, 2), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(7, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0017_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0017
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0018 : Poly :=
[
  term (4 : Rat) [(10, 1), (16, 1)]
]

/-- Partial product 18 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0018 : Poly :=
[
  term (-8 : Rat) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (10, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (10, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0018_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0018
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0019 : Poly :=
[
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0019 : Poly :=
[
  term (-4 : Rat) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0019_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0019
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0020 : Poly :=
[
  term ((376 : Rat) / 681) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0020 : Poly :=
[
  term ((-752 : Rat) / 681) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((376 : Rat) / 681) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-752 : Rat) / 681) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((376 : Rat) / 681) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((752 : Rat) / 681) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-376 : Rat) / 681) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((752 : Rat) / 681) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-376 : Rat) / 681) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0020_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0020
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0021 : Poly :=
[
  term ((-64 : Rat) / 227) [(11, 2), (16, 1)]
]

/-- Partial product 21 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0021 : Poly :=
[
  term ((128 : Rat) / 227) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((-64 : Rat) / 227) [(0, 2), (11, 2), (16, 1)],
  term ((128 : Rat) / 227) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-64 : Rat) / 227) [(1, 2), (11, 2), (16, 1)],
  term ((-128 : Rat) / 227) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((64 : Rat) / 227) [(6, 2), (11, 2), (16, 1)],
  term ((-128 : Rat) / 227) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((64 : Rat) / 227) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0021_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0021
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0022 : Poly :=
[
  term (20 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0022 : Poly :=
[
  term (-40 : Rat) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-40 : Rat) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-20 : Rat) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-20 : Rat) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0022_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0022
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0023 : Poly :=
[
  term (4 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0023 : Poly :=
[
  term (-8 : Rat) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (12, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0023_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0023
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0024 : Poly :=
[
  term (-29 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0024 : Poly :=
[
  term (58 : Rat) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (-29 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (58 : Rat) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (-29 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-58 : Rat) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (29 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (-58 : Rat) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (29 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0024_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0024
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0025 : Poly :=
[
  term (7 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0025 : Poly :=
[
  term (-14 : Rat) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term (7 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (-14 : Rat) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term (7 : Rat) [(1, 2), (13, 2), (16, 1)],
  term (14 : Rat) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term (-7 : Rat) [(6, 2), (13, 2), (16, 1)],
  term (14 : Rat) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term (-7 : Rat) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0025_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0025
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0026 : Poly :=
[
  term ((-110 : Rat) / 227) [(15, 2), (16, 1)]
]

/-- Partial product 26 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0026 : Poly :=
[
  term ((220 : Rat) / 227) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-110 : Rat) / 227) [(0, 2), (15, 2), (16, 1)],
  term ((220 : Rat) / 227) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-110 : Rat) / 227) [(1, 2), (15, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((110 : Rat) / 227) [(6, 2), (15, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((110 : Rat) / 227) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0026_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0026
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011YYY_coefficient_21_0027 : Poly :=
[
  term ((-853 : Rat) / 454) [(16, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R011_ueqv_R011YYY_partial_21_0027 : Poly :=
[
  term ((853 : Rat) / 227) [(0, 1), (8, 1), (16, 1)],
  term ((-853 : Rat) / 454) [(0, 2), (16, 1)],
  term ((853 : Rat) / 227) [(1, 1), (9, 1), (16, 1)],
  term ((-853 : Rat) / 454) [(1, 2), (16, 1)],
  term ((-853 : Rat) / 227) [(6, 1), (8, 1), (16, 1)],
  term ((853 : Rat) / 454) [(6, 2), (16, 1)],
  term ((-853 : Rat) / 227) [(7, 1), (9, 1), (16, 1)],
  term ((853 : Rat) / 454) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R011_ueqv_R011YYY_partial_21_0027_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_21_0027
        rs_R011_ueqv_R011YYY_generator_21_0000_0027 =
      rs_R011_ueqv_R011YYY_partial_21_0027 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_21_0000_0027 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_21_0000,
  rs_R011_ueqv_R011YYY_partial_21_0001,
  rs_R011_ueqv_R011YYY_partial_21_0002,
  rs_R011_ueqv_R011YYY_partial_21_0003,
  rs_R011_ueqv_R011YYY_partial_21_0004,
  rs_R011_ueqv_R011YYY_partial_21_0005,
  rs_R011_ueqv_R011YYY_partial_21_0006,
  rs_R011_ueqv_R011YYY_partial_21_0007,
  rs_R011_ueqv_R011YYY_partial_21_0008,
  rs_R011_ueqv_R011YYY_partial_21_0009,
  rs_R011_ueqv_R011YYY_partial_21_0010,
  rs_R011_ueqv_R011YYY_partial_21_0011,
  rs_R011_ueqv_R011YYY_partial_21_0012,
  rs_R011_ueqv_R011YYY_partial_21_0013,
  rs_R011_ueqv_R011YYY_partial_21_0014,
  rs_R011_ueqv_R011YYY_partial_21_0015,
  rs_R011_ueqv_R011YYY_partial_21_0016,
  rs_R011_ueqv_R011YYY_partial_21_0017,
  rs_R011_ueqv_R011YYY_partial_21_0018,
  rs_R011_ueqv_R011YYY_partial_21_0019,
  rs_R011_ueqv_R011YYY_partial_21_0020,
  rs_R011_ueqv_R011YYY_partial_21_0021,
  rs_R011_ueqv_R011YYY_partial_21_0022,
  rs_R011_ueqv_R011YYY_partial_21_0023,
  rs_R011_ueqv_R011YYY_partial_21_0024,
  rs_R011_ueqv_R011YYY_partial_21_0025,
  rs_R011_ueqv_R011YYY_partial_21_0026,
  rs_R011_ueqv_R011YYY_partial_21_0027
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_21_0000_0027 : Poly :=
[
  term ((-7692 : Rat) / 227) [(0, 1), (1, 1), (3, 1), (8, 1), (12, 1), (16, 1)],
  term ((217862 : Rat) / 3405) [(0, 1), (1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(0, 1), (1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((6732 : Rat) / 1135) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((15384 : Rat) / 227) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((40542 : Rat) / 1135) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-330842 : Rat) / 3405) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7372 : Rat) / 1135) [(0, 1), (1, 2), (8, 1), (16, 1)],
  term ((272 : Rat) / 681) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term (20 : Rat) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term (-38 : Rat) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-440 : Rat) / 227) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (6, 1), (8, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-752 : Rat) / 681) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 227) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term (-40 : Rat) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term (58 : Rat) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((220 : Rat) / 227) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((853 : Rat) / 227) [(0, 1), (8, 1), (16, 1)],
  term ((3846 : Rat) / 227) [(0, 2), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-108931 : Rat) / 3405) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3366 : Rat) / 1135) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-7692 : Rat) / 227) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20271 : Rat) / 1135) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((165421 : Rat) / 3405) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((3686 : Rat) / 1135) [(0, 2), (1, 2), (16, 1)],
  term ((-136 : Rat) / 681) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term (-10 : Rat) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (19 : Rat) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((220 : Rat) / 227) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term (-1 : Rat) [(0, 2), (6, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (10, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((376 : Rat) / 681) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 227) [(0, 2), (11, 2), (16, 1)],
  term (20 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (-29 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(0, 2), (13, 2), (16, 1)],
  term ((-110 : Rat) / 227) [(0, 2), (15, 2), (16, 1)],
  term ((-853 : Rat) / 454) [(0, 2), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-217862 : Rat) / 3405) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term ((-3846 : Rat) / 227) [(1, 1), (3, 1), (6, 2), (12, 1), (16, 1)],
  term ((108931 : Rat) / 3405) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (3, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-217862 : Rat) / 3405) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((-3846 : Rat) / 227) [(1, 1), (3, 1), (7, 2), (12, 1), (16, 1)],
  term ((108931 : Rat) / 3405) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((272 : Rat) / 681) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term (-38 : Rat) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-440 : Rat) / 227) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (6, 1), (7, 2), (13, 1), (16, 1)],
  term ((-6732 : Rat) / 1135) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40542 : Rat) / 1135) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((330842 : Rat) / 3405) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((3366 : Rat) / 1135) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((20271 : Rat) / 1135) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-165421 : Rat) / 3405) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (6, 3), (13, 1), (16, 1)],
  term ((-6732 : Rat) / 1135) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40542 : Rat) / 1135) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((317222 : Rat) / 3405) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3366 : Rat) / 1135) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((20271 : Rat) / 1135) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-165421 : Rat) / 3405) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-752 : Rat) / 681) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 227) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term (-40 : Rat) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term (58 : Rat) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((220 : Rat) / 227) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((853 : Rat) / 227) [(1, 1), (9, 1), (16, 1)],
  term ((-7692 : Rat) / 227) [(1, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((217862 : Rat) / 3405) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-136 : Rat) / 681) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term (-10 : Rat) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (19 : Rat) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((220 : Rat) / 227) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term (-1 : Rat) [(1, 2), (6, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 2), (6, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 2), (7, 2), (16, 1)],
  term ((6732 : Rat) / 1135) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((40542 : Rat) / 1135) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-330842 : Rat) / 3405) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((376 : Rat) / 681) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 227) [(1, 2), (11, 2), (16, 1)],
  term (20 : Rat) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-29 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(1, 2), (13, 2), (16, 1)],
  term ((-110 : Rat) / 227) [(1, 2), (15, 2), (16, 1)],
  term ((-853 : Rat) / 454) [(1, 2), (16, 1)],
  term ((3846 : Rat) / 227) [(1, 3), (3, 1), (12, 1), (16, 1)],
  term ((-108931 : Rat) / 3405) [(1, 3), (3, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 3), (6, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7372 : Rat) / 1135) [(1, 3), (9, 1), (16, 1)],
  term ((-3366 : Rat) / 1135) [(1, 3), (11, 1), (16, 1)],
  term ((-7692 : Rat) / 227) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-20271 : Rat) / 1135) [(1, 3), (13, 1), (16, 1)],
  term ((165421 : Rat) / 3405) [(1, 3), (15, 1), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 4), (16, 1)],
  term ((-272 : Rat) / 681) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term (38 : Rat) [(3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((136 : Rat) / 681) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term (10 : Rat) [(3, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term (-19 : Rat) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-220 : Rat) / 227) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term (38 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((136 : Rat) / 681) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term (10 : Rat) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term (-19 : Rat) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-220 : Rat) / 227) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 2), (13, 2), (16, 1)],
  term (1 : Rat) [(6, 1), (7, 2), (16, 1)],
  term (-8 : Rat) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((752 : Rat) / 681) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 227) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term (40 : Rat) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term (-58 : Rat) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-853 : Rat) / 227) [(6, 1), (8, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (8, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(6, 2), (8, 1), (16, 1)],
  term (4 : Rat) [(6, 2), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (10, 1), (16, 1)],
  term (-2 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-376 : Rat) / 681) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 227) [(6, 2), (11, 2), (16, 1)],
  term (-20 : Rat) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (12, 1), (16, 1)],
  term (29 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(6, 2), (13, 2), (16, 1)],
  term ((110 : Rat) / 227) [(6, 2), (15, 2), (16, 1)],
  term ((853 : Rat) / 454) [(6, 2), (16, 1)],
  term (2 : Rat) [(6, 3), (13, 2), (16, 1)],
  term (1 : Rat) [(6, 3), (16, 1)],
  term (-8 : Rat) [(7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((752 : Rat) / 681) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 227) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term (40 : Rat) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term (-58 : Rat) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-853 : Rat) / 227) [(7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 2), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (10, 1), (16, 1)],
  term (-2 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-376 : Rat) / 681) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 227) [(7, 2), (11, 2), (16, 1)],
  term (-20 : Rat) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (12, 1), (16, 1)],
  term (29 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(7, 2), (13, 2), (16, 1)],
  term ((110 : Rat) / 227) [(7, 2), (15, 2), (16, 1)],
  term ((853 : Rat) / 454) [(7, 2), (16, 1)],
  term (-4 : Rat) [(7, 3), (13, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 27. -/
theorem rs_R011_ueqv_R011YYY_block_21_0000_0027_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_21_0000_0027
      rs_R011_ueqv_R011YYY_block_21_0000_0027 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
