/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 12:0-47

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_12_0000_0047 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0000 : Poly :=
[
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0000 : Poly :=
[
  term ((61536 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((61536 : Rat) / 1135) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0000
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0001 : Poly :=
[
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0001 : Poly :=
[
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0001
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0002 : Poly :=
[
  term ((88024 : Rat) / 1135) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0002 : Poly :=
[
  term ((176048 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((176048 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-88024 : Rat) / 1135) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-88024 : Rat) / 1135) [(0, 1), (1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0002
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0003 : Poly :=
[
  term ((46152 : Rat) / 1135) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0003 : Poly :=
[
  term ((92304 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((92304 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0003
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0004 : Poly :=
[
  term ((-123072 : Rat) / 1135) [(0, 1), (1, 2), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0004 : Poly :=
[
  term ((-246144 : Rat) / 1135) [(0, 1), (1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-246144 : Rat) / 1135) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((123072 : Rat) / 1135) [(0, 1), (1, 2), (12, 2), (16, 1)],
  term ((123072 : Rat) / 1135) [(0, 1), (1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0004
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0005 : Poly :=
[
  term (-16 : Rat) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0005 : Poly :=
[
  term (-32 : Rat) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term (-32 : Rat) [(0, 1), (3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0005
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0006 : Poly :=
[
  term (-8 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0006 : Poly :=
[
  term (-16 : Rat) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0006_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0006
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0007 : Poly :=
[
  term (-24 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0007 : Poly :=
[
  term (-48 : Rat) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0007_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0007
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0008 : Poly :=
[
  term (-8 : Rat) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0008 : Poly :=
[
  term (-16 : Rat) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term (-16 : Rat) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term (8 : Rat) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0008_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0008
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0009 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0009 : Poly :=
[
  term ((-30768 : Rat) / 1135) [(1, 1), (2, 1), (3, 1), (12, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0009_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0009
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0010 : Poly :=
[
  term ((-3846 : Rat) / 227) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0010 : Poly :=
[
  term ((-7692 : Rat) / 227) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((3846 : Rat) / 227) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((3846 : Rat) / 227) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-7692 : Rat) / 227) [(1, 1), (3, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0010_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0010
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0011 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0011 : Poly :=
[
  term ((-30768 : Rat) / 1135) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0011_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0011
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0012 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 12 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0012 : Poly :=
[
  term ((15384 : Rat) / 1135) [(1, 1), (2, 1), (5, 1), (12, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (5, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0012_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0012
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0013 : Poly :=
[
  term ((-27616 : Rat) / 1135) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 13 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0013 : Poly :=
[
  term ((-55232 : Rat) / 1135) [(1, 1), (2, 1), (5, 1), (12, 1), (16, 1)],
  term ((-55232 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((27616 : Rat) / 1135) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((27616 : Rat) / 1135) [(1, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0013_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0013
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0014 : Poly :=
[
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0014 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0014_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0014
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0015 : Poly :=
[
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0015 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0015_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0015
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0016 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (7, 2), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0016 : Poly :=
[
  term ((15384 : Rat) / 1135) [(1, 1), (2, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (7, 2), (13, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 2), (12, 2), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0016_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0016
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0017 : Poly :=
[
  term ((15384 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0017 : Poly :=
[
  term ((30768 : Rat) / 1135) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0017_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0017
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0018 : Poly :=
[
  term ((2776 : Rat) / 1135) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0018 : Poly :=
[
  term ((5552 : Rat) / 1135) [(1, 1), (2, 1), (11, 1), (12, 2), (16, 1)],
  term ((5552 : Rat) / 1135) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2776 : Rat) / 1135) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2776 : Rat) / 1135) [(1, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0018_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0018
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0019 : Poly :=
[
  term ((9138 : Rat) / 1135) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0019 : Poly :=
[
  term ((18276 : Rat) / 1135) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((18276 : Rat) / 1135) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9138 : Rat) / 1135) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-9138 : Rat) / 1135) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0019_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0019
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0020 : Poly :=
[
  term (-104 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0020 : Poly :=
[
  term (-208 : Rat) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)],
  term (-208 : Rat) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term (104 : Rat) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term (104 : Rat) [(1, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0020_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0020
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0021 : Poly :=
[
  term ((-169224 : Rat) / 1135) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0021 : Poly :=
[
  term ((-338448 : Rat) / 1135) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-338448 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((169224 : Rat) / 1135) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((169224 : Rat) / 1135) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0021_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0021
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0022 : Poly :=
[
  term ((24782 : Rat) / 1135) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0022 : Poly :=
[
  term ((49564 : Rat) / 1135) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((49564 : Rat) / 1135) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-24782 : Rat) / 1135) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-24782 : Rat) / 1135) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0022_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0022
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0023 : Poly :=
[
  term ((69738 : Rat) / 1135) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0023 : Poly :=
[
  term ((139476 : Rat) / 1135) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((139476 : Rat) / 1135) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-69738 : Rat) / 1135) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-69738 : Rat) / 1135) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0023_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0023
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0024 : Poly :=
[
  term ((181832 : Rat) / 1135) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0024 : Poly :=
[
  term ((363664 : Rat) / 1135) [(1, 2), (2, 1), (12, 2), (16, 1)],
  term ((363664 : Rat) / 1135) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-181832 : Rat) / 1135) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-181832 : Rat) / 1135) [(1, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0024_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0024
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0025 : Poly :=
[
  term ((-43752 : Rat) / 1135) [(1, 2), (16, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0025 : Poly :=
[
  term ((-87504 : Rat) / 1135) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-87504 : Rat) / 1135) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((43752 : Rat) / 1135) [(1, 2), (12, 2), (16, 1)],
  term ((43752 : Rat) / 1135) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0025_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0025
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0026 : Poly :=
[
  term (8 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0026 : Poly :=
[
  term (16 : Rat) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term (-8 : Rat) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term (16 : Rat) [(3, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0026_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0026
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0027 : Poly :=
[
  term (10 : Rat) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 27 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0027 : Poly :=
[
  term (20 : Rat) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term (-10 : Rat) [(3, 1), (13, 3), (16, 1)],
  term (20 : Rat) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0027_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0027
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0028 : Poly :=
[
  term (8 : Rat) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0028 : Poly :=
[
  term (16 : Rat) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term (-8 : Rat) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term (-8 : Rat) [(5, 1), (7, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0028_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0028
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0029 : Poly :=
[
  term (4 : Rat) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0029 : Poly :=
[
  term (8 : Rat) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0029_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0029
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0030 : Poly :=
[
  term (-4 : Rat) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0030 : Poly :=
[
  term (-8 : Rat) [(2, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term (4 : Rat) [(5, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0030_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0030
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0031 : Poly :=
[
  term (12 : Rat) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0031 : Poly :=
[
  term (24 : Rat) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term (-12 : Rat) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0031_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0031
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0032 : Poly :=
[
  term (4 : Rat) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 32 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0032 : Poly :=
[
  term (8 : Rat) [(2, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (6, 1), (13, 3), (16, 1)],
  term (-4 : Rat) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0032_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0032
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0033 : Poly :=
[
  term (2 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 33 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0033 : Poly :=
[
  term (4 : Rat) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (12, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0033_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0033
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0034 : Poly :=
[
  term (4 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0034 : Poly :=
[
  term (8 : Rat) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0034_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0034
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0035 : Poly :=
[
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0035 : Poly :=
[
  term (4 : Rat) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0035_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0035
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0036 : Poly :=
[
  term (-4 : Rat) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0036 : Poly :=
[
  term (-8 : Rat) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(3, 1), (7, 2), (13, 3), (16, 1)],
  term (4 : Rat) [(7, 2), (12, 2), (13, 2), (16, 1)],
  term (4 : Rat) [(7, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0036_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0036
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0037 : Poly :=
[
  term (-2 : Rat) [(7, 2), (16, 1)]
]

/-- Partial product 37 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0037 : Poly :=
[
  term (-4 : Rat) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (12, 2), (16, 1)],
  term (2 : Rat) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0037_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0037
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0038 : Poly :=
[
  term (-8 : Rat) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 38 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0038 : Poly :=
[
  term (-16 : Rat) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term (-16 : Rat) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term (8 : Rat) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term (8 : Rat) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0038_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0038
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0039 : Poly :=
[
  term ((-852 : Rat) / 227) [(10, 1), (16, 1)]
]

/-- Partial product 39 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0039 : Poly :=
[
  term ((-1704 : Rat) / 227) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1704 : Rat) / 227) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((852 : Rat) / 227) [(10, 1), (12, 2), (16, 1)],
  term ((852 : Rat) / 227) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0039_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0039
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0040 : Poly :=
[
  term (8 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0040 : Poly :=
[
  term (16 : Rat) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0040_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0040
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0041 : Poly :=
[
  term (-14 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 41 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0041 : Poly :=
[
  term (-28 : Rat) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-28 : Rat) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term (14 : Rat) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term (14 : Rat) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0041_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0041
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0042 : Poly :=
[
  term ((1132 : Rat) / 227) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0042 : Poly :=
[
  term ((2264 : Rat) / 227) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2264 : Rat) / 227) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1132 : Rat) / 227) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1132 : Rat) / 227) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0042_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0042
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0043 : Poly :=
[
  term (88 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0043 : Poly :=
[
  term (176 : Rat) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (176 : Rat) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-88 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (-88 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0043_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0043
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0044 : Poly :=
[
  term (-46 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0044 : Poly :=
[
  term (-92 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-92 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (46 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (46 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0044_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0044
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0045 : Poly :=
[
  term (6 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 45 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0045 : Poly :=
[
  term (12 : Rat) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (13, 3), (16, 1)],
  term (-6 : Rat) [(12, 2), (13, 2), (16, 1)],
  term (-6 : Rat) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0045_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0045
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0046 : Poly :=
[
  term ((2612 : Rat) / 227) [(15, 2), (16, 1)]
]

/-- Partial product 46 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0046 : Poly :=
[
  term ((5224 : Rat) / 227) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((5224 : Rat) / 227) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2612 : Rat) / 227) [(12, 2), (15, 2), (16, 1)],
  term ((-2612 : Rat) / 227) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0046_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0046
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011YYY_coefficient_12_0047 : Poly :=
[
  term ((199 : Rat) / 227) [(16, 1)]
]

/-- Partial product 47 for generator 12. -/
def rs_R011_ueqv_R011YYY_partial_12_0047 : Poly :=
[
  term ((398 : Rat) / 227) [(2, 1), (12, 1), (16, 1)],
  term ((398 : Rat) / 227) [(3, 1), (13, 1), (16, 1)],
  term ((-199 : Rat) / 227) [(12, 2), (16, 1)],
  term ((-199 : Rat) / 227) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 12. -/
theorem rs_R011_ueqv_R011YYY_partial_12_0047_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_12_0047
        rs_R011_ueqv_R011YYY_generator_12_0000_0047 =
      rs_R011_ueqv_R011YYY_partial_12_0047 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_12_0000_0047 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_12_0000,
  rs_R011_ueqv_R011YYY_partial_12_0001,
  rs_R011_ueqv_R011YYY_partial_12_0002,
  rs_R011_ueqv_R011YYY_partial_12_0003,
  rs_R011_ueqv_R011YYY_partial_12_0004,
  rs_R011_ueqv_R011YYY_partial_12_0005,
  rs_R011_ueqv_R011YYY_partial_12_0006,
  rs_R011_ueqv_R011YYY_partial_12_0007,
  rs_R011_ueqv_R011YYY_partial_12_0008,
  rs_R011_ueqv_R011YYY_partial_12_0009,
  rs_R011_ueqv_R011YYY_partial_12_0010,
  rs_R011_ueqv_R011YYY_partial_12_0011,
  rs_R011_ueqv_R011YYY_partial_12_0012,
  rs_R011_ueqv_R011YYY_partial_12_0013,
  rs_R011_ueqv_R011YYY_partial_12_0014,
  rs_R011_ueqv_R011YYY_partial_12_0015,
  rs_R011_ueqv_R011YYY_partial_12_0016,
  rs_R011_ueqv_R011YYY_partial_12_0017,
  rs_R011_ueqv_R011YYY_partial_12_0018,
  rs_R011_ueqv_R011YYY_partial_12_0019,
  rs_R011_ueqv_R011YYY_partial_12_0020,
  rs_R011_ueqv_R011YYY_partial_12_0021,
  rs_R011_ueqv_R011YYY_partial_12_0022,
  rs_R011_ueqv_R011YYY_partial_12_0023,
  rs_R011_ueqv_R011YYY_partial_12_0024,
  rs_R011_ueqv_R011YYY_partial_12_0025,
  rs_R011_ueqv_R011YYY_partial_12_0026,
  rs_R011_ueqv_R011YYY_partial_12_0027,
  rs_R011_ueqv_R011YYY_partial_12_0028,
  rs_R011_ueqv_R011YYY_partial_12_0029,
  rs_R011_ueqv_R011YYY_partial_12_0030,
  rs_R011_ueqv_R011YYY_partial_12_0031,
  rs_R011_ueqv_R011YYY_partial_12_0032,
  rs_R011_ueqv_R011YYY_partial_12_0033,
  rs_R011_ueqv_R011YYY_partial_12_0034,
  rs_R011_ueqv_R011YYY_partial_12_0035,
  rs_R011_ueqv_R011YYY_partial_12_0036,
  rs_R011_ueqv_R011YYY_partial_12_0037,
  rs_R011_ueqv_R011YYY_partial_12_0038,
  rs_R011_ueqv_R011YYY_partial_12_0039,
  rs_R011_ueqv_R011YYY_partial_12_0040,
  rs_R011_ueqv_R011YYY_partial_12_0041,
  rs_R011_ueqv_R011YYY_partial_12_0042,
  rs_R011_ueqv_R011YYY_partial_12_0043,
  rs_R011_ueqv_R011YYY_partial_12_0044,
  rs_R011_ueqv_R011YYY_partial_12_0045,
  rs_R011_ueqv_R011YYY_partial_12_0046,
  rs_R011_ueqv_R011YYY_partial_12_0047
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_12_0000_0047 : Poly :=
[
  term ((61536 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((176048 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((92304 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (12, 2), (16, 1)],
  term ((92304 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (128 : Rat) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((61536 : Rat) / 1135) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-88024 : Rat) / 1135) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-88024 : Rat) / 1135) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((-246144 : Rat) / 1135) [(0, 1), (1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-246144 : Rat) / 1135) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((123072 : Rat) / 1135) [(0, 1), (1, 2), (12, 2), (16, 1)],
  term ((123072 : Rat) / 1135) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term (-32 : Rat) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term (-16 : Rat) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term (16 : Rat) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term (-32 : Rat) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term (24 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term (24 : Rat) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (13, 4), (16, 1)],
  term ((-7692 : Rat) / 227) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (2, 1), (3, 1), (12, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-55232 : Rat) / 1135) [(1, 1), (2, 1), (5, 1), (12, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (2, 1), (5, 1), (12, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (2, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((18276 : Rat) / 1135) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((5552 : Rat) / 1135) [(1, 1), (2, 1), (11, 1), (12, 2), (16, 1)],
  term ((49564 : Rat) / 1135) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((139476 : Rat) / 1135) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term (-208 : Rat) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)],
  term ((-338448 : Rat) / 1135) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-55232 : Rat) / 1135) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (7, 2), (13, 2), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((5552 : Rat) / 1135) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((18276 : Rat) / 1135) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-338448 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-220696 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((3846 : Rat) / 227) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((139476 : Rat) / 1135) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((68794 : Rat) / 1135) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 227) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((27616 : Rat) / 1135) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (5, 1), (12, 3), (16, 1)],
  term ((27616 : Rat) / 1135) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 2), (12, 2), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 2), (13, 3), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-2776 : Rat) / 1135) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-9138 : Rat) / 1135) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2776 : Rat) / 1135) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((-9138 : Rat) / 1135) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((169224 : Rat) / 1135) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (104 : Rat) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((-24782 : Rat) / 1135) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-69738 : Rat) / 1135) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term (104 : Rat) [(1, 1), (12, 3), (13, 1), (16, 1)],
  term ((169224 : Rat) / 1135) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-69738 : Rat) / 1135) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24782 : Rat) / 1135) [(1, 1), (13, 3), (16, 1)],
  term ((-87504 : Rat) / 1135) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((363664 : Rat) / 1135) [(1, 2), (2, 1), (12, 2), (16, 1)],
  term ((363664 : Rat) / 1135) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-87504 : Rat) / 1135) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-181832 : Rat) / 1135) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((43752 : Rat) / 1135) [(1, 2), (12, 2), (16, 1)],
  term ((-181832 : Rat) / 1135) [(1, 2), (12, 3), (16, 1)],
  term ((43752 : Rat) / 1135) [(1, 2), (13, 2), (16, 1)],
  term (20 : Rat) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1704 : Rat) / 227) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term (-28 : Rat) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2264 : Rat) / 227) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term (-92 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((5224 : Rat) / 227) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((398 : Rat) / 227) [(2, 1), (12, 1), (16, 1)],
  term (176 : Rat) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term (24 : Rat) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (6, 1), (13, 3), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (7, 2), (13, 3), (16, 1)],
  term ((-1704 : Rat) / 227) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term (16 : Rat) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2264 : Rat) / 227) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term (176 : Rat) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term (-10 : Rat) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term ((5224 : Rat) / 227) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((398 : Rat) / 227) [(3, 1), (13, 1), (16, 1)],
  term (-92 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (13, 3), (16, 1)],
  term (16 : Rat) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term (20 : Rat) [(3, 2), (13, 2), (16, 1)],
  term (-8 : Rat) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term (-4 : Rat) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(5, 1), (7, 1), (13, 4), (16, 1)],
  term (4 : Rat) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term (-12 : Rat) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (12, 3), (13, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (13, 3), (16, 1)],
  term (-4 : Rat) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (12, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (13, 4), (16, 1)],
  term (-4 : Rat) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 2), (12, 2), (13, 2), (16, 1)],
  term (2 : Rat) [(7, 2), (12, 2), (16, 1)],
  term (2 : Rat) [(7, 2), (13, 2), (16, 1)],
  term (4 : Rat) [(7, 2), (13, 4), (16, 1)],
  term (8 : Rat) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((852 : Rat) / 227) [(10, 1), (12, 2), (16, 1)],
  term ((852 : Rat) / 227) [(10, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(10, 1), (13, 4), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term (14 : Rat) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1132 : Rat) / 227) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-1132 : Rat) / 227) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term (14 : Rat) [(11, 1), (13, 3), (16, 1)],
  term (-88 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (46 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(12, 2), (13, 2), (16, 1)],
  term ((-2612 : Rat) / 227) [(12, 2), (15, 2), (16, 1)],
  term ((-199 : Rat) / 227) [(12, 2), (16, 1)],
  term (-88 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2612 : Rat) / 227) [(13, 2), (15, 2), (16, 1)],
  term ((-199 : Rat) / 227) [(13, 2), (16, 1)],
  term (46 : Rat) [(13, 3), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 47. -/
theorem rs_R011_ueqv_R011YYY_block_12_0000_0047_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_12_0000_0047
      rs_R011_ueqv_R011YYY_block_12_0000_0047 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
