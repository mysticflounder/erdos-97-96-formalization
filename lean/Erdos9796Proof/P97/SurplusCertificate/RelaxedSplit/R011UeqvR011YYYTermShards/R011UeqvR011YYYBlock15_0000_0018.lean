/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 15:0-18

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_15_0000_0018 : Poly :=
[
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0000 : Poly :=
[
  term ((-51601 : Rat) / 3405) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0000 : Poly :=
[
  term ((-103202 : Rat) / 3405) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-103202 : Rat) / 3405) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((51601 : Rat) / 3405) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((51601 : Rat) / 3405) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0000
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0001 : Poly :=
[
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0001 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0001
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0002 : Poly :=
[
  term ((148874 : Rat) / 3405) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0002 : Poly :=
[
  term ((297748 : Rat) / 3405) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((297748 : Rat) / 3405) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-148874 : Rat) / 3405) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-148874 : Rat) / 3405) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0002
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0003 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0003 : Poly :=
[
  term ((15384 : Rat) / 1135) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0003
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0004 : Poly :=
[
  term ((-10656 : Rat) / 1135) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0004 : Poly :=
[
  term ((-21312 : Rat) / 1135) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21312 : Rat) / 1135) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((10656 : Rat) / 1135) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((10656 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0004
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0005 : Poly :=
[
  term ((-108571 : Rat) / 3405) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0005 : Poly :=
[
  term ((-217142 : Rat) / 3405) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-217142 : Rat) / 3405) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((108571 : Rat) / 3405) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((108571 : Rat) / 3405) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0005
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0006 : Poly :=
[
  term ((3686 : Rat) / 1135) [(1, 2), (16, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0006 : Poly :=
[
  term ((7372 : Rat) / 1135) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 2), (14, 2), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0006_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0006
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0007 : Poly :=
[
  term ((-64 : Rat) / 681) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0007 : Poly :=
[
  term ((-128 : Rat) / 681) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 681) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((64 : Rat) / 681) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0007_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0007
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0008 : Poly :=
[
  term (9 : Rat) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0008 : Poly :=
[
  term (18 : Rat) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term (-9 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0008_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0008
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0009 : Poly :=
[
  term ((220 : Rat) / 227) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0009 : Poly :=
[
  term ((440 : Rat) / 227) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-220 : Rat) / 227) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0009_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0009
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0010 : Poly :=
[
  term (4 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0010 : Poly :=
[
  term (8 : Rat) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0010_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0010
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0011 : Poly :=
[
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0011 : Poly :=
[
  term (4 : Rat) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0011_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0011
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0012 : Poly :=
[
  term (-26 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0012 : Poly :=
[
  term (-52 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term (-52 : Rat) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (26 : Rat) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term (26 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0012_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0012
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0013 : Poly :=
[
  term ((-208 : Rat) / 681) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0013 : Poly :=
[
  term ((-416 : Rat) / 681) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416 : Rat) / 681) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 681) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((208 : Rat) / 681) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0013_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0013
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0014 : Poly :=
[
  term ((320 : Rat) / 681) [(11, 2), (16, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0014 : Poly :=
[
  term ((640 : Rat) / 681) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((640 : Rat) / 681) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-320 : Rat) / 681) [(11, 2), (14, 2), (16, 1)],
  term ((-320 : Rat) / 681) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0014_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0014
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0015 : Poly :=
[
  term (-4 : Rat) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0015 : Poly :=
[
  term (-8 : Rat) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0015_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0015
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0016 : Poly :=
[
  term (19 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0016 : Poly :=
[
  term (38 : Rat) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (38 : Rat) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term (-19 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-19 : Rat) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0016_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0016
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0017 : Poly :=
[
  term (2 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 17 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0017 : Poly :=
[
  term (4 : Rat) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0017_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0017
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R011_ueqv_R011YYY_coefficient_15_0018 : Poly :=
[
  term ((55 : Rat) / 227) [(16, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R011_ueqv_R011YYY_partial_15_0018 : Poly :=
[
  term ((110 : Rat) / 227) [(4, 1), (14, 1), (16, 1)],
  term ((110 : Rat) / 227) [(5, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 227) [(14, 2), (16, 1)],
  term ((-55 : Rat) / 227) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R011_ueqv_R011YYY_partial_15_0018_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_15_0018
        rs_R011_ueqv_R011YYY_generator_15_0000_0018 =
      rs_R011_ueqv_R011YYY_partial_15_0018 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_15_0000_0018 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_15_0000,
  rs_R011_ueqv_R011YYY_partial_15_0001,
  rs_R011_ueqv_R011YYY_partial_15_0002,
  rs_R011_ueqv_R011YYY_partial_15_0003,
  rs_R011_ueqv_R011YYY_partial_15_0004,
  rs_R011_ueqv_R011YYY_partial_15_0005,
  rs_R011_ueqv_R011YYY_partial_15_0006,
  rs_R011_ueqv_R011YYY_partial_15_0007,
  rs_R011_ueqv_R011YYY_partial_15_0008,
  rs_R011_ueqv_R011YYY_partial_15_0009,
  rs_R011_ueqv_R011YYY_partial_15_0010,
  rs_R011_ueqv_R011YYY_partial_15_0011,
  rs_R011_ueqv_R011YYY_partial_15_0012,
  rs_R011_ueqv_R011YYY_partial_15_0013,
  rs_R011_ueqv_R011YYY_partial_15_0014,
  rs_R011_ueqv_R011YYY_partial_15_0015,
  rs_R011_ueqv_R011YYY_partial_15_0016,
  rs_R011_ueqv_R011YYY_partial_15_0017,
  rs_R011_ueqv_R011YYY_partial_15_0018
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_15_0000_0018 : Poly :=
[
  term ((-103202 : Rat) / 3405) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-103202 : Rat) / 3405) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((51601 : Rat) / 3405) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((51601 : Rat) / 3405) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((297748 : Rat) / 3405) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21312 : Rat) / 1135) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-217142 : Rat) / 3405) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((297748 : Rat) / 3405) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21312 : Rat) / 1135) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-217142 : Rat) / 3405) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-148874 : Rat) / 3405) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-148874 : Rat) / 3405) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10656 : Rat) / 1135) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((10656 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((108571 : Rat) / 3405) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((108571 : Rat) / 3405) [(1, 1), (15, 3), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 2), (14, 2), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 2), (15, 2), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 681) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((64 : Rat) / 681) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term (-9 : Rat) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term (-9 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-220 : Rat) / 227) [(3, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (-52 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 681) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((640 : Rat) / 681) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (38 : Rat) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((110 : Rat) / 227) [(4, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term (-52 : Rat) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-416 : Rat) / 681) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((640 : Rat) / 681) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (38 : Rat) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((110 : Rat) / 227) [(5, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term (-2 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 3), (16, 1)],
  term (26 : Rat) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term (26 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 681) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((208 : Rat) / 681) [(11, 1), (15, 3), (16, 1)],
  term ((-320 : Rat) / 681) [(11, 2), (14, 2), (16, 1)],
  term ((-320 : Rat) / 681) [(11, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term (-19 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-19 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (-2 : Rat) [(13, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(13, 2), (15, 2), (16, 1)],
  term ((-55 : Rat) / 227) [(14, 2), (16, 1)],
  term ((-55 : Rat) / 227) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 18. -/
theorem rs_R011_ueqv_R011YYY_block_15_0000_0018_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_15_0000_0018
      rs_R011_ueqv_R011YYY_block_15_0000_0018 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
