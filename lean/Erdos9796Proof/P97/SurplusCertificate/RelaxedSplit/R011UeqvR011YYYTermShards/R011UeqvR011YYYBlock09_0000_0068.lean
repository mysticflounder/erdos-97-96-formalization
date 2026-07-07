/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 9:0-68

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_09_0000_0068 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0000 : Poly :=
[
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0000 : Poly :=
[
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-635888 : Rat) / 3405) [(0, 1), (1, 2), (3, 1), (7, 1), (16, 1)],
  term ((635888 : Rat) / 3405) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-635888 : Rat) / 3405) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((635888 : Rat) / 3405) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0000
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0001 : Poly :=
[
  term ((-107688 : Rat) / 1135) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0001 : Poly :=
[
  term ((-107688 : Rat) / 1135) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-107688 : Rat) / 1135) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((107688 : Rat) / 1135) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((107688 : Rat) / 1135) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((215376 : Rat) / 1135) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-215376 : Rat) / 1135) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((215376 : Rat) / 1135) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-215376 : Rat) / 1135) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0001
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0002 : Poly :=
[
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0002 : Poly :=
[
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((68204 : Rat) / 681) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((68204 : Rat) / 681) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((136408 : Rat) / 681) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-136408 : Rat) / 681) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((136408 : Rat) / 681) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-136408 : Rat) / 681) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0002
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0003 : Poly :=
[
  term ((1024 : Rat) / 681) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0003 : Poly :=
[
  term ((-2048 : Rat) / 681) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0003
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0004 : Poly :=
[
  term (-56 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0004 : Poly :=
[
  term (112 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term (-112 : Rat) [(0, 1), (1, 1), (7, 1), (13, 2), (16, 1)],
  term (-56 : Rat) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term (112 : Rat) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term (-112 : Rat) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0004
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0005 : Poly :=
[
  term ((-1024 : Rat) / 681) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0005 : Poly :=
[
  term ((2048 : Rat) / 681) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0005
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0006 : Poly :=
[
  term ((32 : Rat) / 227) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0006 : Poly :=
[
  term ((-64 : Rat) / 227) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((64 : Rat) / 227) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 1), (12, 3), (16, 1)],
  term ((-64 : Rat) / 227) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((64 : Rat) / 227) [(0, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0006_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0006
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0007 : Poly :=
[
  term (60 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0007 : Poly :=
[
  term (-120 : Rat) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (120 : Rat) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term (60 : Rat) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term (60 : Rat) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term (-60 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-60 : Rat) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term (-120 : Rat) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (120 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0007_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0007
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0008 : Poly :=
[
  term (56 : Rat) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0008 : Poly :=
[
  term (-112 : Rat) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term (112 : Rat) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term (56 : Rat) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term (56 : Rat) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term (-56 : Rat) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term (-56 : Rat) [(0, 1), (13, 4), (16, 1)],
  term (-112 : Rat) [(0, 2), (2, 1), (13, 2), (16, 1)],
  term (112 : Rat) [(0, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0008_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0008
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0009 : Poly :=
[
  term ((16 : Rat) / 227) [(0, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0009 : Poly :=
[
  term ((-32 : Rat) / 227) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 227) [(0, 1), (2, 2), (16, 1)],
  term ((16 : Rat) / 227) [(0, 1), (3, 2), (16, 1)],
  term ((-16 : Rat) / 227) [(0, 1), (12, 2), (16, 1)],
  term ((-16 : Rat) / 227) [(0, 1), (13, 2), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 2), (2, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0009_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0009
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0010 : Poly :=
[
  term ((104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0010 : Poly :=
[
  term ((-208964 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((104482 : Rat) / 3405) [(1, 1), (2, 2), (3, 1), (10, 1), (16, 1)],
  term ((-104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)],
  term ((-104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((104482 : Rat) / 3405) [(1, 1), (3, 3), (10, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 2), (3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0010_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0010
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0011 : Poly :=
[
  term ((-46152 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0011 : Poly :=
[
  term ((92304 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((-92304 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-46152 : Rat) / 1135) [(1, 1), (2, 2), (3, 1), (12, 1), (16, 1)],
  term ((46152 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((46152 : Rat) / 1135) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((-46152 : Rat) / 1135) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((-92304 : Rat) / 1135) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((92304 : Rat) / 1135) [(1, 2), (3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0011_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0011
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0012 : Poly :=
[
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 1), (13, 2), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0012 : Poly :=
[
  term ((61536 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((-61536 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (2, 2), (3, 1), (13, 2), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (12, 2), (13, 2), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (13, 4), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 3), (13, 2), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 2), (3, 1), (13, 3), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 2), (3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0012_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0012
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0013 : Poly :=
[
  term ((5161 : Rat) / 681) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0013 : Poly :=
[
  term ((-10322 : Rat) / 681) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((10322 : Rat) / 681) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((5161 : Rat) / 681) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-5161 : Rat) / 681) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-5161 : Rat) / 681) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((5161 : Rat) / 681) [(1, 1), (3, 3), (16, 1)],
  term ((10322 : Rat) / 681) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-10322 : Rat) / 681) [(1, 2), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0013_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0013
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0014 : Poly :=
[
  term ((-3686 : Rat) / 1135) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0014 : Poly :=
[
  term ((7372 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((-7372 : Rat) / 1135) [(0, 1), (1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-7372 : Rat) / 1135) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0014_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0014
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0015 : Poly :=
[
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0015 : Poly :=
[
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 2), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0015_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0015
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0016 : Poly :=
[
  term (-8 : Rat) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0016 : Poly :=
[
  term (16 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (1, 1), (7, 1), (12, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (12, 3), (16, 1)],
  term (16 : Rat) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term (-16 : Rat) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0016_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0016
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0017 : Poly :=
[
  term ((15384 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0017 : Poly :=
[
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0017_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0017
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0018 : Poly :=
[
  term ((-131732 : Rat) / 3405) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0018 : Poly :=
[
  term ((263464 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-263464 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-131732 : Rat) / 3405) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-131732 : Rat) / 3405) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((131732 : Rat) / 3405) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((131732 : Rat) / 3405) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((263464 : Rat) / 3405) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-263464 : Rat) / 3405) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0018_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0018
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0019 : Poly :=
[
  term ((-208964 : Rat) / 3405) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0019 : Poly :=
[
  term ((417928 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-417928 : Rat) / 3405) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((417928 : Rat) / 3405) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-417928 : Rat) / 3405) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0019_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0019
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0020 : Poly :=
[
  term ((15384 : Rat) / 227) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0020 : Poly :=
[
  term ((-30768 : Rat) / 227) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((30768 : Rat) / 227) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((-30768 : Rat) / 227) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((30768 : Rat) / 227) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0020_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0020
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0021 : Poly :=
[
  term ((-17019 : Rat) / 227) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0021 : Poly :=
[
  term ((34038 : Rat) / 227) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-34038 : Rat) / 227) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-17019 : Rat) / 227) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-17019 : Rat) / 227) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((17019 : Rat) / 227) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((17019 : Rat) / 227) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((34038 : Rat) / 227) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-34038 : Rat) / 227) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0021_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0021
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0022 : Poly :=
[
  term ((199992 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0022 : Poly :=
[
  term ((-399984 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((399984 : Rat) / 1135) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((199992 : Rat) / 1135) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((199992 : Rat) / 1135) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-199992 : Rat) / 1135) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((-199992 : Rat) / 1135) [(1, 1), (12, 3), (13, 1), (16, 1)],
  term ((-399984 : Rat) / 1135) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((399984 : Rat) / 1135) [(1, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0022_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0022
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0023 : Poly :=
[
  term ((23076 : Rat) / 1135) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0023 : Poly :=
[
  term ((-46152 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((46152 : Rat) / 1135) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((23076 : Rat) / 1135) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((23076 : Rat) / 1135) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-23076 : Rat) / 1135) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23076 : Rat) / 1135) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((46152 : Rat) / 1135) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0023_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0023
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0024 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0024 : Poly :=
[
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0024_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0024
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0025 : Poly :=
[
  term ((-6528 : Rat) / 227) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0025 : Poly :=
[
  term ((13056 : Rat) / 227) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-13056 : Rat) / 227) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6528 : Rat) / 227) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-6528 : Rat) / 227) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((6528 : Rat) / 227) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((6528 : Rat) / 227) [(1, 1), (13, 3), (16, 1)],
  term ((13056 : Rat) / 227) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-13056 : Rat) / 227) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0025_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0025
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0026 : Poly :=
[
  term ((61536 : Rat) / 1135) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0026 : Poly :=
[
  term ((-123072 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((123072 : Rat) / 1135) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((-123072 : Rat) / 1135) [(1, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((123072 : Rat) / 1135) [(1, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0026_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0026
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0027 : Poly :=
[
  term ((123847 : Rat) / 1135) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0027 : Poly :=
[
  term ((-247694 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((247694 : Rat) / 1135) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((123847 : Rat) / 1135) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((123847 : Rat) / 1135) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-123847 : Rat) / 1135) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-123847 : Rat) / 1135) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-247694 : Rat) / 1135) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((247694 : Rat) / 1135) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0027_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0027
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0028 : Poly :=
[
  term ((-7532 : Rat) / 1135) [(1, 2), (16, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0028 : Poly :=
[
  term ((15064 : Rat) / 1135) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-15064 : Rat) / 1135) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(1, 2), (2, 2), (16, 1)],
  term ((-7532 : Rat) / 1135) [(1, 2), (3, 2), (16, 1)],
  term ((7532 : Rat) / 1135) [(1, 2), (12, 2), (16, 1)],
  term ((7532 : Rat) / 1135) [(1, 2), (13, 2), (16, 1)],
  term ((15064 : Rat) / 1135) [(1, 3), (3, 1), (16, 1)],
  term ((-15064 : Rat) / 1135) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0028_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0028
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0029 : Poly :=
[
  term ((-128 : Rat) / 681) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 29 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0029 : Poly :=
[
  term ((256 : Rat) / 681) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((256 : Rat) / 681) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(2, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0029_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0029
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0030 : Poly :=
[
  term (-18 : Rat) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0030 : Poly :=
[
  term (36 : Rat) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term (-36 : Rat) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term (36 : Rat) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term (-18 : Rat) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term (-18 : Rat) [(3, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0030_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0030
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0031 : Poly :=
[
  term ((-1320 : Rat) / 227) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0031 : Poly :=
[
  term ((2640 : Rat) / 227) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 227) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 227) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 227) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 227) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1320 : Rat) / 227) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0031_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0031
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0032 : Poly :=
[
  term ((24592 : Rat) / 3405) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0032 : Poly :=
[
  term ((-49184 : Rat) / 3405) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((49184 : Rat) / 3405) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((49184 : Rat) / 3405) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-49184 : Rat) / 3405) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((24592 : Rat) / 3405) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-24592 : Rat) / 3405) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-24592 : Rat) / 3405) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((24592 : Rat) / 3405) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0032_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0032
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0033 : Poly :=
[
  term (24 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0033 : Poly :=
[
  term (-48 : Rat) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term (-48 : Rat) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term (-24 : Rat) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term (24 : Rat) [(3, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0033_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0033
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0034 : Poly :=
[
  term ((569 : Rat) / 227) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0034 : Poly :=
[
  term ((-1138 : Rat) / 227) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((1138 : Rat) / 227) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((1138 : Rat) / 227) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-1138 : Rat) / 227) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((569 : Rat) / 227) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-569 : Rat) / 227) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-569 : Rat) / 227) [(3, 1), (13, 3), (16, 1)],
  term ((569 : Rat) / 227) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0034_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0034
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0035 : Poly :=
[
  term (16 : Rat) [(3, 1), (13, 3), (16, 1)]
]

/-- Partial product 35 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0035 : Poly :=
[
  term (-32 : Rat) [(0, 1), (2, 1), (3, 1), (13, 3), (16, 1)],
  term (32 : Rat) [(0, 1), (3, 1), (12, 1), (13, 3), (16, 1)],
  term (32 : Rat) [(1, 1), (3, 1), (13, 4), (16, 1)],
  term (-32 : Rat) [(1, 1), (3, 2), (13, 3), (16, 1)],
  term (16 : Rat) [(2, 2), (3, 1), (13, 3), (16, 1)],
  term (-16 : Rat) [(3, 1), (12, 2), (13, 3), (16, 1)],
  term (-16 : Rat) [(3, 1), (13, 5), (16, 1)],
  term (16 : Rat) [(3, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0035_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0035
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0036 : Poly :=
[
  term ((516 : Rat) / 1135) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0036 : Poly :=
[
  term ((-1032 : Rat) / 1135) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((1032 : Rat) / 1135) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((1032 : Rat) / 1135) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1032 : Rat) / 1135) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((516 : Rat) / 1135) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-516 : Rat) / 1135) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-516 : Rat) / 1135) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((516 : Rat) / 1135) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0036_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0036
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0037 : Poly :=
[
  term ((-32 : Rat) / 227) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0037 : Poly :=
[
  term ((64 : Rat) / 227) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 227) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((64 : Rat) / 227) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 227) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 227) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-32 : Rat) / 227) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 227) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((32 : Rat) / 227) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0037_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0037
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0038 : Poly :=
[
  term (2 : Rat) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0038 : Poly :=
[
  term (-4 : Rat) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0038_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0038
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0039 : Poly :=
[
  term (4 : Rat) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 39 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0039 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (6, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0039_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0039
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0040 : Poly :=
[
  term (4 : Rat) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0040 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 1), (6, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term (4 : Rat) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(3, 2), (6, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0040_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0040
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0041 : Poly :=
[
  term (-2 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 41 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0041 : Poly :=
[
  term (4 : Rat) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(2, 2), (6, 1), (16, 1)],
  term (-2 : Rat) [(3, 2), (6, 1), (16, 1)],
  term (2 : Rat) [(6, 1), (12, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0041_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0041
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0042 : Poly :=
[
  term ((-512 : Rat) / 681) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0042 : Poly :=
[
  term ((1024 : Rat) / 681) [(0, 1), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((512 : Rat) / 681) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((512 : Rat) / 681) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0042_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0042
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0043 : Poly :=
[
  term (28 : Rat) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0043 : Poly :=
[
  term (-56 : Rat) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term (-56 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term (56 : Rat) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term (28 : Rat) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term (28 : Rat) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0043_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0043
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0044 : Poly :=
[
  term (-8 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0044 : Poly :=
[
  term (16 : Rat) [(0, 1), (2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0044_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0044
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0045 : Poly :=
[
  term (-4 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0045 : Poly :=
[
  term (8 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0045_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0045
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0046 : Poly :=
[
  term ((256 : Rat) / 681) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0046 : Poly :=
[
  term ((-512 : Rat) / 681) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 681) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 681) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0046_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0046
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0047 : Poly :=
[
  term (-4 : Rat) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 47 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0047 : Poly :=
[
  term (8 : Rat) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0047_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0047
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0048 : Poly :=
[
  term (36 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0048 : Poly :=
[
  term (-72 : Rat) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (36 : Rat) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0048_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0048
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0049 : Poly :=
[
  term ((2640 : Rat) / 227) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0049 : Poly :=
[
  term ((-5280 : Rat) / 227) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((5280 : Rat) / 227) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5280 : Rat) / 227) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((5280 : Rat) / 227) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2640 : Rat) / 227) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((2640 : Rat) / 227) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2640 : Rat) / 227) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2640 : Rat) / 227) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0049_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0049
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0050 : Poly :=
[
  term ((948 : Rat) / 1135) [(10, 1), (16, 1)]
]

/-- Partial product 50 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0050 : Poly :=
[
  term ((-1896 : Rat) / 1135) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((1896 : Rat) / 1135) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1896 : Rat) / 1135) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((1896 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((948 : Rat) / 1135) [(2, 2), (10, 1), (16, 1)],
  term ((948 : Rat) / 1135) [(3, 2), (10, 1), (16, 1)],
  term ((-948 : Rat) / 1135) [(10, 1), (12, 2), (16, 1)],
  term ((-948 : Rat) / 1135) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0050_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0050
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0051 : Poly :=
[
  term (-40 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 51 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0051 : Poly :=
[
  term (80 : Rat) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-80 : Rat) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term (80 : Rat) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-80 : Rat) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term (-40 : Rat) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-40 : Rat) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (40 : Rat) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term (40 : Rat) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0051_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0051
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0052 : Poly :=
[
  term (8 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0052 : Poly :=
[
  term (-16 : Rat) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0052_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0052
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0053 : Poly :=
[
  term ((9991 : Rat) / 227) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 53 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0053 : Poly :=
[
  term ((-19982 : Rat) / 227) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((19982 : Rat) / 227) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-19982 : Rat) / 227) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((19982 : Rat) / 227) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((9991 : Rat) / 227) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((9991 : Rat) / 227) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9991 : Rat) / 227) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-9991 : Rat) / 227) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0053_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0053
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0054 : Poly :=
[
  term ((-5136 : Rat) / 227) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0054 : Poly :=
[
  term ((10272 : Rat) / 227) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10272 : Rat) / 227) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10272 : Rat) / 227) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10272 : Rat) / 227) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5136 : Rat) / 227) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5136 : Rat) / 227) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((5136 : Rat) / 227) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5136 : Rat) / 227) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0054_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0054
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0055 : Poly :=
[
  term ((-352 : Rat) / 227) [(11, 2), (16, 1)]
]

/-- Partial product 55 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0055 : Poly :=
[
  term ((704 : Rat) / 227) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-704 : Rat) / 227) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((704 : Rat) / 227) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-704 : Rat) / 227) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-352 : Rat) / 227) [(2, 2), (11, 2), (16, 1)],
  term ((-352 : Rat) / 227) [(3, 2), (11, 2), (16, 1)],
  term ((352 : Rat) / 227) [(11, 2), (12, 2), (16, 1)],
  term ((352 : Rat) / 227) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0055_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0055
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0056 : Poly :=
[
  term (-12 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0056 : Poly :=
[
  term (24 : Rat) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (12 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0056_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0056
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0057 : Poly :=
[
  term (-104 : Rat) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 57 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0057 : Poly :=
[
  term (208 : Rat) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term (-208 : Rat) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term (208 : Rat) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term (-208 : Rat) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term (-104 : Rat) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term (-104 : Rat) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term (104 : Rat) [(12, 1), (13, 4), (16, 1)],
  term (104 : Rat) [(12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0057_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0057
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0058 : Poly :=
[
  term ((1752 : Rat) / 227) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 58 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0058 : Poly :=
[
  term ((-3504 : Rat) / 227) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((3504 : Rat) / 227) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3504 : Rat) / 227) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((3504 : Rat) / 227) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1752 : Rat) / 227) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((1752 : Rat) / 227) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1752 : Rat) / 227) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1752 : Rat) / 227) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0058_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0058
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0059 : Poly :=
[
  term (-4 : Rat) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0059 : Poly :=
[
  term (8 : Rat) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0059_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0059
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0060 : Poly :=
[
  term ((9187 : Rat) / 1135) [(12, 1), (16, 1)]
]

/-- Partial product 60 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0060 : Poly :=
[
  term ((-18374 : Rat) / 1135) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((18374 : Rat) / 1135) [(0, 1), (12, 2), (16, 1)],
  term ((-18374 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((18374 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((9187 : Rat) / 1135) [(2, 2), (12, 1), (16, 1)],
  term ((9187 : Rat) / 1135) [(3, 2), (12, 1), (16, 1)],
  term ((-9187 : Rat) / 1135) [(12, 1), (13, 2), (16, 1)],
  term ((-9187 : Rat) / 1135) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0060_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0060
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0061 : Poly :=
[
  term (-8 : Rat) [(12, 2), (16, 1)]
]

/-- Partial product 61 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0061 : Poly :=
[
  term (16 : Rat) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term (-16 : Rat) [(0, 1), (12, 3), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term (-16 : Rat) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term (-8 : Rat) [(2, 2), (12, 2), (16, 1)],
  term (-8 : Rat) [(3, 2), (12, 2), (16, 1)],
  term (8 : Rat) [(12, 2), (13, 2), (16, 1)],
  term (8 : Rat) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0061_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0061
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0062 : Poly :=
[
  term ((-20775 : Rat) / 227) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0062 : Poly :=
[
  term ((41550 : Rat) / 227) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41550 : Rat) / 227) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41550 : Rat) / 227) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41550 : Rat) / 227) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20775 : Rat) / 227) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20775 : Rat) / 227) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((20775 : Rat) / 227) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((20775 : Rat) / 227) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0062_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0062
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0063 : Poly :=
[
  term (8 : Rat) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 63 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0063 : Poly :=
[
  term (-16 : Rat) [(0, 1), (2, 1), (13, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0063_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0063
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0064 : Poly :=
[
  term (20 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 64 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0064 : Poly :=
[
  term (-40 : Rat) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term (40 : Rat) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term (-40 : Rat) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term (40 : Rat) [(1, 1), (13, 3), (16, 1)],
  term (20 : Rat) [(2, 2), (13, 2), (16, 1)],
  term (20 : Rat) [(3, 2), (13, 2), (16, 1)],
  term (-20 : Rat) [(12, 2), (13, 2), (16, 1)],
  term (-20 : Rat) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0064_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0064
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0065 : Poly :=
[
  term (-32 : Rat) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0065 : Poly :=
[
  term (64 : Rat) [(0, 1), (2, 1), (13, 3), (15, 1), (16, 1)],
  term (-64 : Rat) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term (64 : Rat) [(1, 1), (3, 1), (13, 3), (15, 1), (16, 1)],
  term (-64 : Rat) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term (-32 : Rat) [(2, 2), (13, 3), (15, 1), (16, 1)],
  term (-32 : Rat) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term (32 : Rat) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term (32 : Rat) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0065_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0065
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0066 : Poly :=
[
  term ((-17092 : Rat) / 1135) [(14, 1), (16, 1)]
]

/-- Partial product 66 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0066 : Poly :=
[
  term ((34184 : Rat) / 1135) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-34184 : Rat) / 1135) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((34184 : Rat) / 1135) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-34184 : Rat) / 1135) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17092 : Rat) / 1135) [(2, 2), (14, 1), (16, 1)],
  term ((-17092 : Rat) / 1135) [(3, 2), (14, 1), (16, 1)],
  term ((17092 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((17092 : Rat) / 1135) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0066_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0066
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0067 : Poly :=
[
  term ((5404 : Rat) / 1135) [(15, 2), (16, 1)]
]

/-- Partial product 67 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0067 : Poly :=
[
  term ((-10808 : Rat) / 1135) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((10808 : Rat) / 1135) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10808 : Rat) / 1135) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((10808 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((5404 : Rat) / 1135) [(2, 2), (15, 2), (16, 1)],
  term ((5404 : Rat) / 1135) [(3, 2), (15, 2), (16, 1)],
  term ((-5404 : Rat) / 1135) [(12, 2), (15, 2), (16, 1)],
  term ((-5404 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0067_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0067
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 9. -/
def rs_R011_ueqv_R011YYY_coefficient_09_0068 : Poly :=
[
  term ((770 : Rat) / 227) [(16, 1)]
]

/-- Partial product 68 for generator 9. -/
def rs_R011_ueqv_R011YYY_partial_09_0068 : Poly :=
[
  term ((-1540 : Rat) / 227) [(0, 1), (2, 1), (16, 1)],
  term ((1540 : Rat) / 227) [(0, 1), (12, 1), (16, 1)],
  term ((-1540 : Rat) / 227) [(1, 1), (3, 1), (16, 1)],
  term ((1540 : Rat) / 227) [(1, 1), (13, 1), (16, 1)],
  term ((770 : Rat) / 227) [(2, 2), (16, 1)],
  term ((770 : Rat) / 227) [(3, 2), (16, 1)],
  term ((-770 : Rat) / 227) [(12, 2), (16, 1)],
  term ((-770 : Rat) / 227) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 9. -/
theorem rs_R011_ueqv_R011YYY_partial_09_0068_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_09_0068
        rs_R011_ueqv_R011YYY_generator_09_0000_0068 =
      rs_R011_ueqv_R011YYY_partial_09_0068 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_09_0000_0068 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_09_0000,
  rs_R011_ueqv_R011YYY_partial_09_0001,
  rs_R011_ueqv_R011YYY_partial_09_0002,
  rs_R011_ueqv_R011YYY_partial_09_0003,
  rs_R011_ueqv_R011YYY_partial_09_0004,
  rs_R011_ueqv_R011YYY_partial_09_0005,
  rs_R011_ueqv_R011YYY_partial_09_0006,
  rs_R011_ueqv_R011YYY_partial_09_0007,
  rs_R011_ueqv_R011YYY_partial_09_0008,
  rs_R011_ueqv_R011YYY_partial_09_0009,
  rs_R011_ueqv_R011YYY_partial_09_0010,
  rs_R011_ueqv_R011YYY_partial_09_0011,
  rs_R011_ueqv_R011YYY_partial_09_0012,
  rs_R011_ueqv_R011YYY_partial_09_0013,
  rs_R011_ueqv_R011YYY_partial_09_0014,
  rs_R011_ueqv_R011YYY_partial_09_0015,
  rs_R011_ueqv_R011YYY_partial_09_0016,
  rs_R011_ueqv_R011YYY_partial_09_0017,
  rs_R011_ueqv_R011YYY_partial_09_0018,
  rs_R011_ueqv_R011YYY_partial_09_0019,
  rs_R011_ueqv_R011YYY_partial_09_0020,
  rs_R011_ueqv_R011YYY_partial_09_0021,
  rs_R011_ueqv_R011YYY_partial_09_0022,
  rs_R011_ueqv_R011YYY_partial_09_0023,
  rs_R011_ueqv_R011YYY_partial_09_0024,
  rs_R011_ueqv_R011YYY_partial_09_0025,
  rs_R011_ueqv_R011YYY_partial_09_0026,
  rs_R011_ueqv_R011YYY_partial_09_0027,
  rs_R011_ueqv_R011YYY_partial_09_0028,
  rs_R011_ueqv_R011YYY_partial_09_0029,
  rs_R011_ueqv_R011YYY_partial_09_0030,
  rs_R011_ueqv_R011YYY_partial_09_0031,
  rs_R011_ueqv_R011YYY_partial_09_0032,
  rs_R011_ueqv_R011YYY_partial_09_0033,
  rs_R011_ueqv_R011YYY_partial_09_0034,
  rs_R011_ueqv_R011YYY_partial_09_0035,
  rs_R011_ueqv_R011YYY_partial_09_0036,
  rs_R011_ueqv_R011YYY_partial_09_0037,
  rs_R011_ueqv_R011YYY_partial_09_0038,
  rs_R011_ueqv_R011YYY_partial_09_0039,
  rs_R011_ueqv_R011YYY_partial_09_0040,
  rs_R011_ueqv_R011YYY_partial_09_0041,
  rs_R011_ueqv_R011YYY_partial_09_0042,
  rs_R011_ueqv_R011YYY_partial_09_0043,
  rs_R011_ueqv_R011YYY_partial_09_0044,
  rs_R011_ueqv_R011YYY_partial_09_0045,
  rs_R011_ueqv_R011YYY_partial_09_0046,
  rs_R011_ueqv_R011YYY_partial_09_0047,
  rs_R011_ueqv_R011YYY_partial_09_0048,
  rs_R011_ueqv_R011YYY_partial_09_0049,
  rs_R011_ueqv_R011YYY_partial_09_0050,
  rs_R011_ueqv_R011YYY_partial_09_0051,
  rs_R011_ueqv_R011YYY_partial_09_0052,
  rs_R011_ueqv_R011YYY_partial_09_0053,
  rs_R011_ueqv_R011YYY_partial_09_0054,
  rs_R011_ueqv_R011YYY_partial_09_0055,
  rs_R011_ueqv_R011YYY_partial_09_0056,
  rs_R011_ueqv_R011YYY_partial_09_0057,
  rs_R011_ueqv_R011YYY_partial_09_0058,
  rs_R011_ueqv_R011YYY_partial_09_0059,
  rs_R011_ueqv_R011YYY_partial_09_0060,
  rs_R011_ueqv_R011YYY_partial_09_0061,
  rs_R011_ueqv_R011YYY_partial_09_0062,
  rs_R011_ueqv_R011YYY_partial_09_0063,
  rs_R011_ueqv_R011YYY_partial_09_0064,
  rs_R011_ueqv_R011YYY_partial_09_0065,
  rs_R011_ueqv_R011YYY_partial_09_0066,
  rs_R011_ueqv_R011YYY_partial_09_0067,
  rs_R011_ueqv_R011YYY_partial_09_0068
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_09_0000_0068 : Poly :=
[
  term ((-208964 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((92304 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((-10322 : Rat) / 681) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((7372 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((263464 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((417928 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 227) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((34038 : Rat) / 227) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-399984 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((13056 : Rat) / 227) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-123072 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-247694 : Rat) / 1135) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-107688 : Rat) / 1135) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term (112 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((10130 : Rat) / 681) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-92304 : Rat) / 1135) [(0, 1), (1, 1), (3, 1), (12, 2), (16, 1)],
  term (-120 : Rat) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (-112 : Rat) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-107688 : Rat) / 1135) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-7372 : Rat) / 1135) [(0, 1), (1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-263464 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-372424 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-699304 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-417928 : Rat) / 3405) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34038 : Rat) / 227) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((30768 : Rat) / 227) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12992 : Rat) / 227) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((123072 : Rat) / 1135) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((247694 : Rat) / 1135) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((507672 : Rat) / 1135) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((479476 : Rat) / 3405) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((149924 : Rat) / 681) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((234808 : Rat) / 1135) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((15064 : Rat) / 1135) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-635888 : Rat) / 3405) [(0, 1), (1, 2), (3, 1), (7, 1), (16, 1)],
  term ((215376 : Rat) / 1135) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((136408 : Rat) / 681) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((635888 : Rat) / 3405) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-15064 : Rat) / 1135) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-136408 : Rat) / 681) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-215376 : Rat) / 1135) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((256 : Rat) / 681) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term (36 : Rat) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((2640 : Rat) / 227) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-49184 : Rat) / 3405) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1138 : Rat) / 227) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term (-32 : Rat) [(0, 1), (2, 1), (3, 1), (13, 3), (16, 1)],
  term ((-1032 : Rat) / 1135) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 227) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (2, 1), (6, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (2, 1), (7, 1), (11, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5280 : Rat) / 227) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 1135) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term (80 : Rat) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19982 : Rat) / 227) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((10272 : Rat) / 227) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 227) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term (24 : Rat) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (208 : Rat) [(0, 1), (2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3504 : Rat) / 227) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18374 : Rat) / 1135) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((41550 : Rat) / 227) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (2, 1), (13, 2), (15, 2), (16, 1)],
  term (-40 : Rat) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term (64 : Rat) [(0, 1), (2, 1), (13, 3), (15, 1), (16, 1)],
  term ((34184 : Rat) / 1135) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-10808 : Rat) / 1135) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-1540 : Rat) / 227) [(0, 1), (2, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term (60 : Rat) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((16 : Rat) / 227) [(0, 1), (2, 2), (16, 1)],
  term ((-256 : Rat) / 681) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2640 : Rat) / 227) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((49184 : Rat) / 3405) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((1138 : Rat) / 227) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term (32 : Rat) [(0, 1), (3, 1), (12, 1), (13, 3), (16, 1)],
  term ((1032 : Rat) / 1135) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term (60 : Rat) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((16 : Rat) / 227) [(0, 1), (3, 2), (16, 1)],
  term ((-64 : Rat) / 227) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((512 : Rat) / 681) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5280 : Rat) / 227) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1896 : Rat) / 1135) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((19982 : Rat) / 227) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10272 : Rat) / 227) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((11920 : Rat) / 681) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-704 : Rat) / 227) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-41550 : Rat) / 227) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9048 : Rat) / 227) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term (-64 : Rat) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-34184 : Rat) / 1135) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((10808 : Rat) / 1135) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((1540 : Rat) / 227) [(0, 1), (12, 1), (16, 1)],
  term (-84 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-264 : Rat) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((3504 : Rat) / 227) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((18294 : Rat) / 1135) [(0, 1), (12, 2), (16, 1)],
  term ((-3664 : Rat) / 227) [(0, 1), (12, 3), (16, 1)],
  term ((-16 : Rat) / 227) [(0, 1), (13, 2), (16, 1)],
  term (-60 : Rat) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (13, 4), (16, 1)],
  term ((-635888 : Rat) / 3405) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((215376 : Rat) / 1135) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((136408 : Rat) / 681) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((635888 : Rat) / 3405) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-215376 : Rat) / 1135) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-136408 : Rat) / 681) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term (112 : Rat) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 227) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term (-120 : Rat) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (-112 : Rat) [(0, 2), (2, 1), (13, 2), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 2), (2, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term (-112 : Rat) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (120 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (112 : Rat) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((32 : Rat) / 227) [(0, 2), (12, 1), (16, 1)],
  term ((64 : Rat) / 227) [(0, 2), (12, 2), (16, 1)],
  term ((104482 : Rat) / 3405) [(1, 1), (2, 2), (3, 1), (10, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(1, 1), (2, 2), (3, 1), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (2, 2), (3, 1), (13, 2), (16, 1)],
  term ((5161 : Rat) / 681) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131732 : Rat) / 3405) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((-17019 : Rat) / 227) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((199992 : Rat) / 1135) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((23076 : Rat) / 1135) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6528 : Rat) / 227) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((123847 : Rat) / 1135) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 227) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (6, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term (-56 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((-104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)],
  term ((-18984 : Rat) / 227) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-227062 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((-5280 : Rat) / 227) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 1135) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (80 : Rat) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-250546 : Rat) / 3405) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((10272 : Rat) / 227) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 227) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((336712 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3504 : Rat) / 227) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18374 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (12, 2), (13, 2), (16, 1)],
  term ((5735 : Rat) / 681) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((46152 : Rat) / 1135) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((208782 : Rat) / 1135) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-28987 : Rat) / 681) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term (64 : Rat) [(1, 1), (3, 1), (13, 3), (15, 1), (16, 1)],
  term ((67088 : Rat) / 1135) [(1, 1), (3, 1), (13, 4), (16, 1)],
  term ((34184 : Rat) / 1135) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-10808 : Rat) / 1135) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-1540 : Rat) / 227) [(1, 1), (3, 1), (16, 1)],
  term ((-3686 : Rat) / 1135) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131732 : Rat) / 3405) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((256 : Rat) / 681) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term (36 : Rat) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-169364 : Rat) / 3405) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-304469 : Rat) / 3405) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((145512 : Rat) / 1135) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((23076 : Rat) / 1135) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7666 : Rat) / 227) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (3, 2), (13, 3), (16, 1)],
  term ((24563 : Rat) / 227) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((104482 : Rat) / 3405) [(1, 1), (3, 3), (10, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 3), (13, 2), (16, 1)],
  term ((5161 : Rat) / 681) [(1, 1), (3, 3), (16, 1)],
  term ((-64 : Rat) / 227) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((3686 : Rat) / 1135) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((8226 : Rat) / 1135) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((16772 : Rat) / 1135) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((-1024 : Rat) / 681) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((131732 : Rat) / 3405) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (12, 3), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((322412 : Rat) / 3405) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-33544 : Rat) / 1135) [(1, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((5280 : Rat) / 227) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1896 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((454124 : Rat) / 3405) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33544 : Rat) / 227) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((17019 : Rat) / 227) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((-10272 : Rat) / 227) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (163 : Rat) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-704 : Rat) / 227) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((3504 : Rat) / 227) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((18374 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-50316 : Rat) / 1135) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-436072 : Rat) / 1135) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2896 : Rat) / 227) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-123847 : Rat) / 1135) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-199992 : Rat) / 1135) [(1, 1), (12, 3), (13, 1), (16, 1)],
  term ((-23076 : Rat) / 1135) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-34184 : Rat) / 1135) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((10808 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1540 : Rat) / 227) [(1, 1), (13, 1), (16, 1)],
  term ((-331597 : Rat) / 1135) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((33544 : Rat) / 1135) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((15608 : Rat) / 227) [(1, 1), (13, 3), (16, 1)],
  term ((-134176 : Rat) / 1135) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(1, 2), (2, 2), (16, 1)],
  term ((7372 : Rat) / 1135) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((263464 : Rat) / 3405) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((417928 : Rat) / 3405) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 227) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((34038 : Rat) / 227) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-492288 : Rat) / 1135) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-46152 : Rat) / 1135) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((49490 : Rat) / 681) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-123072 : Rat) / 1135) [(1, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 2), (3, 1), (13, 3), (16, 1)],
  term ((-247694 : Rat) / 1135) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 2), (3, 2), (10, 1), (16, 1)],
  term ((92304 : Rat) / 1135) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 2), (3, 2), (13, 2), (16, 1)],
  term ((-74206 : Rat) / 3405) [(1, 2), (3, 2), (16, 1)],
  term ((-7372 : Rat) / 1135) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term (-16 : Rat) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-263464 : Rat) / 3405) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-417928 : Rat) / 3405) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 227) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-34038 : Rat) / 227) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((46152 : Rat) / 1135) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((399984 : Rat) / 1135) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((7532 : Rat) / 1135) [(1, 2), (12, 2), (16, 1)],
  term ((247694 : Rat) / 1135) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-57748 : Rat) / 1135) [(1, 2), (13, 2), (16, 1)],
  term ((123072 : Rat) / 1135) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((15064 : Rat) / 1135) [(1, 3), (3, 1), (16, 1)],
  term ((-15064 : Rat) / 1135) [(1, 3), (13, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(2, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term (-18 : Rat) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((24592 : Rat) / 3405) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((569 : Rat) / 227) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(2, 2), (3, 1), (13, 3), (16, 1)],
  term ((516 : Rat) / 1135) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 227) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(2, 2), (6, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 681) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term (36 : Rat) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 227) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 1135) [(2, 2), (10, 1), (16, 1)],
  term (-40 : Rat) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9991 : Rat) / 227) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-5136 : Rat) / 227) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 227) [(2, 2), (11, 2), (16, 1)],
  term (-12 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-104 : Rat) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((1752 : Rat) / 227) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((9187 : Rat) / 1135) [(2, 2), (12, 1), (16, 1)],
  term (-8 : Rat) [(2, 2), (12, 2), (16, 1)],
  term ((-20775 : Rat) / 227) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term (20 : Rat) [(2, 2), (13, 2), (16, 1)],
  term (-32 : Rat) [(2, 2), (13, 3), (15, 1), (16, 1)],
  term ((-17092 : Rat) / 1135) [(2, 2), (14, 1), (16, 1)],
  term ((5404 : Rat) / 1135) [(2, 2), (15, 2), (16, 1)],
  term ((770 : Rat) / 227) [(2, 2), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((1320 : Rat) / 227) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1320 : Rat) / 227) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term ((-24592 : Rat) / 3405) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-24592 : Rat) / 3405) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term (-24 : Rat) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term ((-569 : Rat) / 227) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (12, 2), (13, 3), (16, 1)],
  term ((-516 : Rat) / 1135) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term ((-516 : Rat) / 1135) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-569 : Rat) / 227) [(3, 1), (13, 3), (16, 1)],
  term (-16 : Rat) [(3, 1), (13, 5), (16, 1)],
  term ((-32 : Rat) / 227) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (6, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(3, 2), (6, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 681) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term (36 : Rat) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 227) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 1135) [(3, 2), (10, 1), (16, 1)],
  term (-40 : Rat) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9991 : Rat) / 227) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-5136 : Rat) / 227) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 227) [(3, 2), (11, 2), (16, 1)],
  term (-12 : Rat) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-104 : Rat) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((1752 : Rat) / 227) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((9187 : Rat) / 1135) [(3, 2), (12, 1), (16, 1)],
  term (-8 : Rat) [(3, 2), (12, 2), (16, 1)],
  term ((-20775 : Rat) / 227) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term (20 : Rat) [(3, 2), (13, 2), (16, 1)],
  term (-32 : Rat) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term ((-17092 : Rat) / 1135) [(3, 2), (14, 1), (16, 1)],
  term ((5404 : Rat) / 1135) [(3, 2), (15, 2), (16, 1)],
  term ((770 : Rat) / 227) [(3, 2), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 3), (10, 1), (11, 1), (16, 1)],
  term (-18 : Rat) [(3, 3), (10, 1), (13, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((24592 : Rat) / 3405) [(3, 3), (11, 1), (16, 1)],
  term (24 : Rat) [(3, 3), (12, 1), (13, 1), (16, 1)],
  term ((569 : Rat) / 227) [(3, 3), (13, 1), (16, 1)],
  term (16 : Rat) [(3, 3), (13, 3), (16, 1)],
  term ((516 : Rat) / 1135) [(3, 3), (15, 1), (16, 1)],
  term ((32 : Rat) / 227) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((32 : Rat) / 227) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term (-2 : Rat) [(5, 1), (13, 3), (16, 1)],
  term (-4 : Rat) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (12, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (12, 3), (16, 1)],
  term (2 : Rat) [(6, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (13, 4), (16, 1)],
  term ((512 : Rat) / 681) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((512 : Rat) / 681) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term (-28 : Rat) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (13, 3), (16, 1)],
  term (8 : Rat) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term (-36 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 227) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-948 : Rat) / 1135) [(10, 1), (12, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (12, 3), (16, 1)],
  term ((-2640 : Rat) / 227) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-948 : Rat) / 1135) [(10, 1), (13, 2), (16, 1)],
  term (-36 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (40 : Rat) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-9991 : Rat) / 227) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((5136 : Rat) / 227) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (40 : Rat) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((5136 : Rat) / 227) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9991 : Rat) / 227) [(11, 1), (13, 3), (16, 1)],
  term ((352 : Rat) / 227) [(11, 2), (12, 2), (16, 1)],
  term ((352 : Rat) / 227) [(11, 2), (13, 2), (16, 1)],
  term ((-1752 : Rat) / 227) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9187 : Rat) / 1135) [(12, 1), (13, 2), (16, 1)],
  term (12 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (104 : Rat) [(12, 1), (13, 4), (16, 1)],
  term ((20775 : Rat) / 227) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term (-12 : Rat) [(12, 2), (13, 2), (16, 1)],
  term (32 : Rat) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((17092 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((-5404 : Rat) / 1135) [(12, 2), (15, 2), (16, 1)],
  term ((-770 : Rat) / 227) [(12, 2), (16, 1)],
  term (12 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term (104 : Rat) [(12, 3), (13, 2), (16, 1)],
  term ((-1752 : Rat) / 227) [(12, 3), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 3), (15, 2), (16, 1)],
  term ((-9187 : Rat) / 1135) [(12, 3), (16, 1)],
  term (8 : Rat) [(12, 4), (16, 1)],
  term ((17092 : Rat) / 1135) [(13, 2), (14, 1), (16, 1)],
  term ((-5404 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)],
  term ((-770 : Rat) / 227) [(13, 2), (16, 1)],
  term ((20775 : Rat) / 227) [(13, 3), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 4), (15, 2), (16, 1)],
  term (-20 : Rat) [(13, 4), (16, 1)],
  term (32 : Rat) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 68. -/
theorem rs_R011_ueqv_R011YYY_block_09_0000_0068_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_09_0000_0068
      rs_R011_ueqv_R011YYY_block_09_0000_0068 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
