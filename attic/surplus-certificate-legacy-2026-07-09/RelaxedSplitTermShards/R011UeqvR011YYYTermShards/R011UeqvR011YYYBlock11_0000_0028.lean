/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 11:0-28

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_11_0000_0028 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0000 : Poly :=
[
  term ((-7692 : Rat) / 227) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0000 : Poly :=
[
  term ((-15384 : Rat) / 227) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (3, 1), (4, 2), (12, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0000
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0001 : Poly :=
[
  term ((166261 : Rat) / 3405) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0001 : Poly :=
[
  term ((332522 : Rat) / 3405) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((-166261 : Rat) / 3405) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((-166261 : Rat) / 3405) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((332522 : Rat) / 3405) [(1, 1), (3, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0001
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0002 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0002 : Poly :=
[
  term ((15384 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0002
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0003 : Poly :=
[
  term ((15384 : Rat) / 1135) [(1, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0003 : Poly :=
[
  term ((30768 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (4, 2), (7, 1), (13, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (5, 2), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0003
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0004 : Poly :=
[
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 2), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0004 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (4, 2), (7, 2), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (5, 2), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0004
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0005 : Poly :=
[
  term ((-148874 : Rat) / 3405) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0005 : Poly :=
[
  term ((-297748 : Rat) / 3405) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-297748 : Rat) / 3405) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((148874 : Rat) / 3405) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((148874 : Rat) / 3405) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0005
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0006 : Poly :=
[
  term ((-7692 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0006 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0006_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0006
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0007 : Poly :=
[
  term ((15384 : Rat) / 227) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0007 : Poly :=
[
  term ((30768 : Rat) / 227) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 227) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0007_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0007
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0008 : Poly :=
[
  term ((29886 : Rat) / 1135) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0008 : Poly :=
[
  term ((59772 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((59772 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-29886 : Rat) / 1135) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-29886 : Rat) / 1135) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0008_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0008
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0009 : Poly :=
[
  term ((-121469 : Rat) / 3405) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0009 : Poly :=
[
  term ((-242938 : Rat) / 3405) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-242938 : Rat) / 3405) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((121469 : Rat) / 3405) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((121469 : Rat) / 3405) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0009_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0009
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0010 : Poly :=
[
  term ((-3686 : Rat) / 1135) [(1, 2), (16, 1)]
]

/-- Partial product 10 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0010 : Poly :=
[
  term ((-7372 : Rat) / 1135) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-7372 : Rat) / 1135) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 2), (4, 2), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0010_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0010
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0011 : Poly :=
[
  term ((208 : Rat) / 681) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0011 : Poly :=
[
  term ((416 : Rat) / 681) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-208 : Rat) / 681) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-208 : Rat) / 681) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((416 : Rat) / 681) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0011_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0011
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0012 : Poly :=
[
  term (20 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0012 : Poly :=
[
  term (40 : Rat) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term (40 : Rat) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0012_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0012
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0013 : Poly :=
[
  term (-29 : Rat) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0013 : Poly :=
[
  term (-58 : Rat) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term (29 : Rat) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term (29 : Rat) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term (-58 : Rat) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0013_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0013
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0014 : Poly :=
[
  term ((-220 : Rat) / 227) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0014 : Poly :=
[
  term ((-440 : Rat) / 227) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((220 : Rat) / 227) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((220 : Rat) / 227) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-440 : Rat) / 227) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0014_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0014
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0015 : Poly :=
[
  term (-4 : Rat) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0015 : Poly :=
[
  term (-8 : Rat) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0015_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0015
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0016 : Poly :=
[
  term (-4 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0016 : Poly :=
[
  term (-8 : Rat) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0016_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0016
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0017 : Poly :=
[
  term (-8 : Rat) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0017 : Poly :=
[
  term (-16 : Rat) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term (-16 : Rat) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term (8 : Rat) [(4, 2), (7, 1), (13, 3), (16, 1)],
  term (8 : Rat) [(5, 2), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0017_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0017
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0018 : Poly :=
[
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0018 : Poly :=
[
  term (-4 : Rat) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0018_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0018
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0019 : Poly :=
[
  term (4 : Rat) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 19 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0019 : Poly :=
[
  term (8 : Rat) [(2, 1), (4, 1), (7, 2), (13, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (7, 2), (13, 2), (16, 1)],
  term (-4 : Rat) [(4, 2), (7, 2), (13, 2), (16, 1)],
  term (-4 : Rat) [(5, 2), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0019_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0019
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0020 : Poly :=
[
  term (2 : Rat) [(7, 2), (16, 1)]
]

/-- Partial product 20 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0020 : Poly :=
[
  term (4 : Rat) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term (-2 : Rat) [(4, 2), (7, 2), (16, 1)],
  term (-2 : Rat) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0020_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0020
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0021 : Poly :=
[
  term (26 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0021 : Poly :=
[
  term (52 : Rat) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term (52 : Rat) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term (-26 : Rat) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term (-26 : Rat) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0021_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0021
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0022 : Poly :=
[
  term ((64 : Rat) / 681) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0022 : Poly :=
[
  term ((128 : Rat) / 681) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 681) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 681) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0022_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0022
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0023 : Poly :=
[
  term ((-320 : Rat) / 681) [(11, 2), (16, 1)]
]

/-- Partial product 23 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0023 : Poly :=
[
  term ((-640 : Rat) / 681) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-640 : Rat) / 681) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((320 : Rat) / 681) [(4, 2), (11, 2), (16, 1)],
  term ((320 : Rat) / 681) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0023_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0023
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0024 : Poly :=
[
  term (-40 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0024 : Poly :=
[
  term (-80 : Rat) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0024_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0024
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0025 : Poly :=
[
  term (4 : Rat) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 25 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0025 : Poly :=
[
  term (8 : Rat) [(2, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0025_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0025
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0026 : Poly :=
[
  term (21 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0026 : Poly :=
[
  term (42 : Rat) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0026_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0026
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0027 : Poly :=
[
  term (-12 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 27 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0027 : Poly :=
[
  term (-24 : Rat) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term (-24 : Rat) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term (12 : Rat) [(4, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0027_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0027
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 11. -/
def rs_R011_ueqv_R011YYY_coefficient_11_0028 : Poly :=
[
  term ((220 : Rat) / 227) [(15, 2), (16, 1)]
]

/-- Partial product 28 for generator 11. -/
def rs_R011_ueqv_R011YYY_partial_11_0028 : Poly :=
[
  term ((440 : Rat) / 227) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(4, 2), (15, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 11. -/
theorem rs_R011_ueqv_R011YYY_partial_11_0028_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_11_0028
        rs_R011_ueqv_R011YYY_generator_11_0000_0028 =
      rs_R011_ueqv_R011YYY_partial_11_0028 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_11_0000_0028 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_11_0000,
  rs_R011_ueqv_R011YYY_partial_11_0001,
  rs_R011_ueqv_R011YYY_partial_11_0002,
  rs_R011_ueqv_R011YYY_partial_11_0003,
  rs_R011_ueqv_R011YYY_partial_11_0004,
  rs_R011_ueqv_R011YYY_partial_11_0005,
  rs_R011_ueqv_R011YYY_partial_11_0006,
  rs_R011_ueqv_R011YYY_partial_11_0007,
  rs_R011_ueqv_R011YYY_partial_11_0008,
  rs_R011_ueqv_R011YYY_partial_11_0009,
  rs_R011_ueqv_R011YYY_partial_11_0010,
  rs_R011_ueqv_R011YYY_partial_11_0011,
  rs_R011_ueqv_R011YYY_partial_11_0012,
  rs_R011_ueqv_R011YYY_partial_11_0013,
  rs_R011_ueqv_R011YYY_partial_11_0014,
  rs_R011_ueqv_R011YYY_partial_11_0015,
  rs_R011_ueqv_R011YYY_partial_11_0016,
  rs_R011_ueqv_R011YYY_partial_11_0017,
  rs_R011_ueqv_R011YYY_partial_11_0018,
  rs_R011_ueqv_R011YYY_partial_11_0019,
  rs_R011_ueqv_R011YYY_partial_11_0020,
  rs_R011_ueqv_R011YYY_partial_11_0021,
  rs_R011_ueqv_R011YYY_partial_11_0022,
  rs_R011_ueqv_R011YYY_partial_11_0023,
  rs_R011_ueqv_R011YYY_partial_11_0024,
  rs_R011_ueqv_R011YYY_partial_11_0025,
  rs_R011_ueqv_R011YYY_partial_11_0026,
  rs_R011_ueqv_R011YYY_partial_11_0027,
  rs_R011_ueqv_R011YYY_partial_11_0028
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_11_0000_0028 : Poly :=
[
  term ((-15384 : Rat) / 227) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((332522 : Rat) / 3405) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((-297748 : Rat) / 3405) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 227) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((59772 : Rat) / 1135) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-242938 : Rat) / 3405) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (3, 1), (4, 2), (12, 1), (16, 1)],
  term ((-166261 : Rat) / 3405) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-297748 : Rat) / 3405) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 227) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((59772 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-242938 : Rat) / 3405) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 227) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-166261 : Rat) / 3405) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((332522 : Rat) / 3405) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (4, 2), (7, 1), (13, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (4, 2), (7, 2), (13, 1), (16, 1)],
  term ((148874 : Rat) / 3405) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-29886 : Rat) / 1135) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((121469 : Rat) / 3405) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term ((148874 : Rat) / 3405) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-29886 : Rat) / 1135) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((121469 : Rat) / 3405) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-7372 : Rat) / 1135) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-7372 : Rat) / 1135) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 2), (4, 2), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 2), (5, 2), (16, 1)],
  term ((416 : Rat) / 681) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term (40 : Rat) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term (-58 : Rat) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-440 : Rat) / 227) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term (-4 : Rat) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (4, 1), (7, 2), (13, 2), (16, 1)],
  term (4 : Rat) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term (52 : Rat) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((128 : Rat) / 681) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-640 : Rat) / 681) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term (-80 : Rat) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term (42 : Rat) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((440 : Rat) / 227) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-208 : Rat) / 681) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term (29 : Rat) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((220 : Rat) / 227) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term (-4 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (7, 2), (13, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term (52 : Rat) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-640 : Rat) / 681) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term (-80 : Rat) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term (42 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((440 : Rat) / 227) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-208 : Rat) / 681) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term (-20 : Rat) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term (29 : Rat) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((220 : Rat) / 227) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((416 : Rat) / 681) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term (40 : Rat) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (-58 : Rat) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-440 : Rat) / 227) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 2), (7, 1), (13, 3), (16, 1)],
  term (2 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 2), (7, 2), (13, 2), (16, 1)],
  term (-2 : Rat) [(4, 2), (7, 2), (16, 1)],
  term (-26 : Rat) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 681) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((320 : Rat) / 681) [(4, 2), (11, 2), (16, 1)],
  term (40 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term (-21 : Rat) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 2), (13, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(4, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 2), (7, 1), (13, 3), (16, 1)],
  term (2 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 2), (7, 2), (13, 2), (16, 1)],
  term (-2 : Rat) [(5, 2), (7, 2), (16, 1)],
  term (-26 : Rat) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 681) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((320 : Rat) / 681) [(5, 2), (11, 2), (16, 1)],
  term (40 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term (-21 : Rat) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 2), (13, 2), (16, 1)],
  term ((-220 : Rat) / 227) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 28. -/
theorem rs_R011_ueqv_R011YYY_block_11_0000_0028_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_11_0000_0028
      rs_R011_ueqv_R011YYY_block_11_0000_0028 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
