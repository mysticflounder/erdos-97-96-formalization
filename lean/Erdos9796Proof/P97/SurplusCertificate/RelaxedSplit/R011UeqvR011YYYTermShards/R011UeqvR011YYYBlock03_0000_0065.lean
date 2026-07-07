/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 3:0-65

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_03_0000_0065 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(10, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0000 : Poly :=
[
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0000 : Poly :=
[
  term ((-635888 : Rat) / 3405) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (4, 2), (7, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (5, 2), (7, 1), (16, 1)],
  term ((635888 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0000
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0001 : Poly :=
[
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0001 : Poly :=
[
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (4, 2), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (5, 2), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0001
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0002 : Poly :=
[
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0002 : Poly :=
[
  term ((136408 : Rat) / 681) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-136408 : Rat) / 681) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((68204 : Rat) / 681) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((68204 : Rat) / 681) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0002
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0003 : Poly :=
[
  term ((1024 : Rat) / 681) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0003 : Poly :=
[
  term ((-2048 : Rat) / 681) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0003
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0004 : Poly :=
[
  term (-56 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0004 : Poly :=
[
  term (112 : Rat) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (4, 2), (7, 1), (13, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term (-112 : Rat) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0004
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0005 : Poly :=
[
  term ((-7532 : Rat) / 1135) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 5 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0005 : Poly :=
[
  term ((15064 : Rat) / 1135) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-15064 : Rat) / 1135) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((7532 : Rat) / 1135) [(0, 1), (8, 1), (10, 2), (16, 1)],
  term ((7532 : Rat) / 1135) [(0, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0005
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0006 : Poly :=
[
  term ((-32 : Rat) / 227) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 6 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0006 : Poly :=
[
  term ((64 : Rat) / 227) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-64 : Rat) / 227) [(0, 1), (10, 2), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0006_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0006
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0007 : Poly :=
[
  term ((-1024 : Rat) / 681) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0007 : Poly :=
[
  term ((2048 : Rat) / 681) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0007_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0007
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0008 : Poly :=
[
  term ((-876 : Rat) / 227) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 8 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0008 : Poly :=
[
  term ((1752 : Rat) / 227) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-876 : Rat) / 227) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((-876 : Rat) / 227) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((-1752 : Rat) / 227) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((876 : Rat) / 227) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((876 : Rat) / 227) [(0, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0008_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0008
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0009 : Poly :=
[
  term (60 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0009 : Poly :=
[
  term (-120 : Rat) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term (60 : Rat) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term (60 : Rat) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term (120 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-60 : Rat) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term (-60 : Rat) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0009_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0009
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0010 : Poly :=
[
  term (-8 : Rat) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 10 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0010 : Poly :=
[
  term (16 : Rat) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(0, 1), (4, 2), (13, 2), (16, 1)],
  term (-8 : Rat) [(0, 1), (5, 2), (13, 2), (16, 1)],
  term (-16 : Rat) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0010_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0010
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0011 : Poly :=
[
  term ((-5889 : Rat) / 1135) [(0, 1), (16, 1)]
]

/-- Partial product 11 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0011 : Poly :=
[
  term ((11778 : Rat) / 1135) [(0, 1), (4, 1), (16, 1)],
  term ((-5889 : Rat) / 1135) [(0, 1), (4, 2), (16, 1)],
  term ((-5889 : Rat) / 1135) [(0, 1), (5, 2), (16, 1)],
  term ((-11778 : Rat) / 1135) [(0, 1), (10, 1), (16, 1)],
  term ((5889 : Rat) / 1135) [(0, 1), (10, 2), (16, 1)],
  term ((5889 : Rat) / 1135) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0011_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0011
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0012 : Poly :=
[
  term ((104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 12 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0012 : Poly :=
[
  term ((-208964 : Rat) / 3405) [(1, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((104482 : Rat) / 3405) [(1, 1), (3, 1), (4, 2), (10, 1), (16, 1)],
  term ((104482 : Rat) / 3405) [(1, 1), (3, 1), (5, 2), (10, 1), (16, 1)],
  term ((-104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (11, 2), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((-104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0012_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0012
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0013 : Poly :=
[
  term ((-3846 : Rat) / 1135) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 13 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0013 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (3, 1), (4, 2), (12, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (3, 1), (10, 2), (12, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (3, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0013_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0013
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0014 : Poly :=
[
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 1), (13, 2), (16, 1)]
]

/-- Partial product 14 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0014 : Poly :=
[
  term ((61536 : Rat) / 1135) [(1, 1), (3, 1), (4, 1), (13, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 1), (4, 2), (13, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 1), (5, 2), (13, 2), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (10, 2), (13, 2), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0014_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0014
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0015 : Poly :=
[
  term ((10538 : Rat) / 3405) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 15 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0015 : Poly :=
[
  term ((-21076 : Rat) / 3405) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((10538 : Rat) / 3405) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((10538 : Rat) / 3405) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((21076 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-10538 : Rat) / 3405) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((-10538 : Rat) / 3405) [(1, 1), (3, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0015_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0015
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0016 : Poly :=
[
  term ((-3846 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0016 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (5, 2), (6, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (6, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0016_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0016
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0017 : Poly :=
[
  term (-8 : Rat) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 17 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0017 : Poly :=
[
  term (16 : Rat) [(1, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (4, 2), (7, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0017_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0017
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0018 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0018 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0018_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0018
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0019 : Poly :=
[
  term ((-131732 : Rat) / 3405) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 19 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0019 : Poly :=
[
  term ((263464 : Rat) / 3405) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-131732 : Rat) / 3405) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((-131732 : Rat) / 3405) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-263464 : Rat) / 3405) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((131732 : Rat) / 3405) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((131732 : Rat) / 3405) [(1, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0019_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0019
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0020 : Poly :=
[
  term ((-7532 : Rat) / 1135) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 20 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0020 : Poly :=
[
  term ((15064 : Rat) / 1135) [(1, 1), (4, 1), (9, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-15064 : Rat) / 1135) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((7532 : Rat) / 1135) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((7532 : Rat) / 1135) [(1, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0020_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0020
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0021 : Poly :=
[
  term ((-208964 : Rat) / 3405) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0021 : Poly :=
[
  term ((417928 : Rat) / 3405) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-417928 : Rat) / 3405) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0021_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0021
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0022 : Poly :=
[
  term ((51761 : Rat) / 3405) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0022 : Poly :=
[
  term ((-103522 : Rat) / 3405) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((51761 : Rat) / 3405) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((51761 : Rat) / 3405) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((103522 : Rat) / 3405) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-51761 : Rat) / 3405) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-51761 : Rat) / 3405) [(1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0022_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0022
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0023 : Poly :=
[
  term ((2776 : Rat) / 1135) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0023 : Poly :=
[
  term ((-5552 : Rat) / 1135) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((2776 : Rat) / 1135) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((2776 : Rat) / 1135) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((5552 : Rat) / 1135) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2776 : Rat) / 1135) [(1, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2776 : Rat) / 1135) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0023_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0023
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0024 : Poly :=
[
  term ((30768 : Rat) / 1135) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0024 : Poly :=
[
  term ((-61536 : Rat) / 1135) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0024_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0024
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0025 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 25 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0025 : Poly :=
[
  term ((30768 : Rat) / 1135) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0025_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0025
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0026 : Poly :=
[
  term ((-2161 : Rat) / 1135) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0026 : Poly :=
[
  term ((4322 : Rat) / 1135) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-2161 : Rat) / 1135) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-2161 : Rat) / 1135) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((-4322 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((2161 : Rat) / 1135) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((2161 : Rat) / 1135) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0026_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0026
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0027 : Poly :=
[
  term ((61536 : Rat) / 1135) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0027 : Poly :=
[
  term ((-123072 : Rat) / 1135) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (4, 2), (13, 2), (15, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((123072 : Rat) / 1135) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0027_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0027
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0028 : Poly :=
[
  term ((26054 : Rat) / 1135) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0028 : Poly :=
[
  term ((-52108 : Rat) / 1135) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((26054 : Rat) / 1135) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((26054 : Rat) / 1135) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((52108 : Rat) / 1135) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26054 : Rat) / 1135) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-26054 : Rat) / 1135) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0028_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0028
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0029 : Poly :=
[
  term ((-3846 : Rat) / 1135) [(1, 2), (16, 1)]
]

/-- Partial product 29 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0029 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 2), (4, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 2), (4, 2), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 2), (5, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 2), (10, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 2), (10, 2), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0029_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0029
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0030 : Poly :=
[
  term ((-128 : Rat) / 681) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0030 : Poly :=
[
  term ((256 : Rat) / 681) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (10, 1), (11, 3), (16, 1)],
  term ((-256 : Rat) / 681) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0030_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0030
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0031 : Poly :=
[
  term (-18 : Rat) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0031 : Poly :=
[
  term (36 : Rat) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term (-18 : Rat) [(3, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term (-18 : Rat) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0031_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0031
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0032 : Poly :=
[
  term ((-1320 : Rat) / 227) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0032 : Poly :=
[
  term ((2640 : Rat) / 227) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 227) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 227) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((1320 : Rat) / 227) [(3, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0032_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0032
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0033 : Poly :=
[
  term ((22552 : Rat) / 3405) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 33 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0033 : Poly :=
[
  term ((-45104 : Rat) / 3405) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((22552 : Rat) / 3405) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((22552 : Rat) / 3405) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((45104 : Rat) / 3405) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-22552 : Rat) / 3405) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-22552 : Rat) / 3405) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0033_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0033
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0034 : Poly :=
[
  term (2 : Rat) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0034 : Poly :=
[
  term (-4 : Rat) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0034_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0034
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0035 : Poly :=
[
  term ((1250 : Rat) / 227) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0035 : Poly :=
[
  term ((-2500 : Rat) / 227) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((1250 : Rat) / 227) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((1250 : Rat) / 227) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((2500 : Rat) / 227) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1250 : Rat) / 227) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1250 : Rat) / 227) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0035_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0035
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0036 : Poly :=
[
  term (16 : Rat) [(3, 1), (13, 3), (16, 1)]
]

/-- Partial product 36 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0036 : Poly :=
[
  term (-32 : Rat) [(3, 1), (4, 1), (13, 3), (16, 1)],
  term (16 : Rat) [(3, 1), (4, 2), (13, 3), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 2), (13, 3), (16, 1)],
  term (32 : Rat) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term (-16 : Rat) [(3, 1), (10, 2), (13, 3), (16, 1)],
  term (-16 : Rat) [(3, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0036_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0036
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0037 : Poly :=
[
  term ((-4984 : Rat) / 1135) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0037 : Poly :=
[
  term ((9968 : Rat) / 1135) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-4984 : Rat) / 1135) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-4984 : Rat) / 1135) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-9968 : Rat) / 1135) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((4984 : Rat) / 1135) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((4984 : Rat) / 1135) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0037_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0037
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0038 : Poly :=
[
  term (4 : Rat) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 38 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0038 : Poly :=
[
  term (-8 : Rat) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (6, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0038_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0038
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0039 : Poly :=
[
  term (2 : Rat) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 39 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0039 : Poly :=
[
  term (-4 : Rat) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(4, 2), (6, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(5, 2), (6, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0039_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0039
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0040 : Poly :=
[
  term (-3 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 40 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0040 : Poly :=
[
  term (6 : Rat) [(4, 1), (6, 1), (16, 1)],
  term (-3 : Rat) [(4, 2), (6, 1), (16, 1)],
  term (-3 : Rat) [(5, 2), (6, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (3 : Rat) [(6, 1), (10, 2), (16, 1)],
  term (3 : Rat) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0040_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0040
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0041 : Poly :=
[
  term ((-512 : Rat) / 681) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 41 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0041 : Poly :=
[
  term ((1024 : Rat) / 681) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((512 : Rat) / 681) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((512 : Rat) / 681) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0041_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0041
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0042 : Poly :=
[
  term (28 : Rat) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 42 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0042 : Poly :=
[
  term (-56 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (28 : Rat) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term (28 : Rat) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term (56 : Rat) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0042_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0042
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0043 : Poly :=
[
  term (-4 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0043 : Poly :=
[
  term (8 : Rat) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0043_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0043
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0044 : Poly :=
[
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0044 : Poly :=
[
  term (4 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0044_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0044
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0045 : Poly :=
[
  term ((6116 : Rat) / 1135) [(8, 2), (16, 1)]
]

/-- Partial product 45 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0045 : Poly :=
[
  term ((-12232 : Rat) / 1135) [(4, 1), (8, 2), (16, 1)],
  term ((6116 : Rat) / 1135) [(4, 2), (8, 2), (16, 1)],
  term ((6116 : Rat) / 1135) [(5, 2), (8, 2), (16, 1)],
  term ((12232 : Rat) / 1135) [(8, 2), (10, 1), (16, 1)],
  term ((-6116 : Rat) / 1135) [(8, 2), (10, 2), (16, 1)],
  term ((-6116 : Rat) / 1135) [(8, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0045_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0045
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0046 : Poly :=
[
  term ((6116 : Rat) / 1135) [(9, 2), (16, 1)]
]

/-- Partial product 46 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0046 : Poly :=
[
  term ((-12232 : Rat) / 1135) [(4, 1), (9, 2), (16, 1)],
  term ((6116 : Rat) / 1135) [(4, 2), (9, 2), (16, 1)],
  term ((6116 : Rat) / 1135) [(5, 2), (9, 2), (16, 1)],
  term ((12232 : Rat) / 1135) [(9, 2), (10, 1), (16, 1)],
  term ((-6116 : Rat) / 1135) [(9, 2), (10, 2), (16, 1)],
  term ((-6116 : Rat) / 1135) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0046_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0046
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0047 : Poly :=
[
  term ((256 : Rat) / 681) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0047 : Poly :=
[
  term ((-512 : Rat) / 681) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 681) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 681) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0047_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0047
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0048 : Poly :=
[
  term (36 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0048 : Poly :=
[
  term (-72 : Rat) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0048_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0048
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0049 : Poly :=
[
  term ((2640 : Rat) / 227) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0049 : Poly :=
[
  term ((-5280 : Rat) / 227) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((2640 : Rat) / 227) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((2640 : Rat) / 227) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2640 : Rat) / 227) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((5280 : Rat) / 227) [(10, 2), (15, 2), (16, 1)],
  term ((-2640 : Rat) / 227) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0049_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0049
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0050 : Poly :=
[
  term ((-3792 : Rat) / 1135) [(10, 1), (16, 1)]
]

/-- Partial product 50 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0050 : Poly :=
[
  term ((7584 : Rat) / 1135) [(4, 1), (10, 1), (16, 1)],
  term ((-3792 : Rat) / 1135) [(4, 2), (10, 1), (16, 1)],
  term ((-3792 : Rat) / 1135) [(5, 2), (10, 1), (16, 1)],
  term ((3792 : Rat) / 1135) [(10, 1), (11, 2), (16, 1)],
  term ((-7584 : Rat) / 1135) [(10, 2), (16, 1)],
  term ((3792 : Rat) / 1135) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0050_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0050
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0051 : Poly :=
[
  term (-9 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 51 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0051 : Poly :=
[
  term (18 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term (-18 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0051_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0051
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0052 : Poly :=
[
  term ((-17548 : Rat) / 1135) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0052 : Poly :=
[
  term ((35096 : Rat) / 1135) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17548 : Rat) / 1135) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17548 : Rat) / 1135) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-35096 : Rat) / 1135) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((17548 : Rat) / 1135) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((17548 : Rat) / 1135) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0052_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0052
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0053 : Poly :=
[
  term ((-64 : Rat) / 681) [(11, 2), (16, 1)]
]

/-- Partial product 53 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0053 : Poly :=
[
  term ((128 : Rat) / 681) [(4, 1), (11, 2), (16, 1)],
  term ((-64 : Rat) / 681) [(4, 2), (11, 2), (16, 1)],
  term ((-64 : Rat) / 681) [(5, 2), (11, 2), (16, 1)],
  term ((-128 : Rat) / 681) [(10, 1), (11, 2), (16, 1)],
  term ((64 : Rat) / 681) [(10, 2), (11, 2), (16, 1)],
  term ((64 : Rat) / 681) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0053_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0053
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0054 : Poly :=
[
  term (-16 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0054 : Poly :=
[
  term (32 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0054_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0054
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0055 : Poly :=
[
  term (8 : Rat) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 55 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0055 : Poly :=
[
  term (-16 : Rat) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term (16 : Rat) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0055_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0055
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0056 : Poly :=
[
  term ((844 : Rat) / 227) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 56 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0056 : Poly :=
[
  term ((-1688 : Rat) / 227) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((844 : Rat) / 227) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((844 : Rat) / 227) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((1688 : Rat) / 227) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-844 : Rat) / 227) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-844 : Rat) / 227) [(11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0056_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0056
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0057 : Poly :=
[
  term ((26212 : Rat) / 1135) [(12, 1), (16, 1)]
]

/-- Partial product 57 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0057 : Poly :=
[
  term ((-52424 : Rat) / 1135) [(4, 1), (12, 1), (16, 1)],
  term ((26212 : Rat) / 1135) [(4, 2), (12, 1), (16, 1)],
  term ((26212 : Rat) / 1135) [(5, 2), (12, 1), (16, 1)],
  term ((52424 : Rat) / 1135) [(10, 1), (12, 1), (16, 1)],
  term ((-26212 : Rat) / 1135) [(10, 2), (12, 1), (16, 1)],
  term ((-26212 : Rat) / 1135) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0057_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0057
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0058 : Poly :=
[
  term (-12 : Rat) [(12, 2), (16, 1)]
]

/-- Partial product 58 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0058 : Poly :=
[
  term (24 : Rat) [(4, 1), (12, 2), (16, 1)],
  term (-12 : Rat) [(4, 2), (12, 2), (16, 1)],
  term (-12 : Rat) [(5, 2), (12, 2), (16, 1)],
  term (-24 : Rat) [(10, 1), (12, 2), (16, 1)],
  term (12 : Rat) [(10, 2), (12, 2), (16, 1)],
  term (12 : Rat) [(11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0058_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0058
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0059 : Poly :=
[
  term ((-5224 : Rat) / 227) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0059 : Poly :=
[
  term ((10448 : Rat) / 227) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5224 : Rat) / 227) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5224 : Rat) / 227) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10448 : Rat) / 227) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5224 : Rat) / 227) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((5224 : Rat) / 227) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0059_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0059
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0060 : Poly :=
[
  term (8 : Rat) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 60 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0060 : Poly :=
[
  term (-16 : Rat) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0060_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0060
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0061 : Poly :=
[
  term (-15 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 61 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0061 : Poly :=
[
  term (30 : Rat) [(4, 1), (13, 2), (16, 1)],
  term (-15 : Rat) [(4, 2), (13, 2), (16, 1)],
  term (-15 : Rat) [(5, 2), (13, 2), (16, 1)],
  term (-30 : Rat) [(10, 1), (13, 2), (16, 1)],
  term (15 : Rat) [(10, 2), (13, 2), (16, 1)],
  term (15 : Rat) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0061_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0061
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0062 : Poly :=
[
  term (-32 : Rat) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0062 : Poly :=
[
  term (64 : Rat) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term (-32 : Rat) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term (-32 : Rat) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term (-64 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term (32 : Rat) [(10, 2), (13, 3), (15, 1), (16, 1)],
  term (32 : Rat) [(11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0062_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0062
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0063 : Poly :=
[
  term ((-12552 : Rat) / 1135) [(14, 1), (16, 1)]
]

/-- Partial product 63 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0063 : Poly :=
[
  term ((25104 : Rat) / 1135) [(4, 1), (14, 1), (16, 1)],
  term ((-12552 : Rat) / 1135) [(4, 2), (14, 1), (16, 1)],
  term ((-12552 : Rat) / 1135) [(5, 2), (14, 1), (16, 1)],
  term ((-25104 : Rat) / 1135) [(10, 1), (14, 1), (16, 1)],
  term ((12552 : Rat) / 1135) [(10, 2), (14, 1), (16, 1)],
  term ((12552 : Rat) / 1135) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0063_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0063
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0064 : Poly :=
[
  term ((14943 : Rat) / 1135) [(15, 2), (16, 1)]
]

/-- Partial product 64 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0064 : Poly :=
[
  term ((-29886 : Rat) / 1135) [(4, 1), (15, 2), (16, 1)],
  term ((14943 : Rat) / 1135) [(4, 2), (15, 2), (16, 1)],
  term ((14943 : Rat) / 1135) [(5, 2), (15, 2), (16, 1)],
  term ((29886 : Rat) / 1135) [(10, 1), (15, 2), (16, 1)],
  term ((-14943 : Rat) / 1135) [(10, 2), (15, 2), (16, 1)],
  term ((-14943 : Rat) / 1135) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0064_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0064
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 3. -/
def rs_R011_ueqv_R011YYY_coefficient_03_0065 : Poly :=
[
  term ((-11941 : Rat) / 4540) [(16, 1)]
]

/-- Partial product 65 for generator 3. -/
def rs_R011_ueqv_R011YYY_partial_03_0065 : Poly :=
[
  term ((11941 : Rat) / 2270) [(4, 1), (16, 1)],
  term ((-11941 : Rat) / 4540) [(4, 2), (16, 1)],
  term ((-11941 : Rat) / 4540) [(5, 2), (16, 1)],
  term ((-11941 : Rat) / 2270) [(10, 1), (16, 1)],
  term ((11941 : Rat) / 4540) [(10, 2), (16, 1)],
  term ((11941 : Rat) / 4540) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 3. -/
theorem rs_R011_ueqv_R011YYY_partial_03_0065_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_03_0065
        rs_R011_ueqv_R011YYY_generator_03_0000_0065 =
      rs_R011_ueqv_R011YYY_partial_03_0065 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_03_0000_0065 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_03_0000,
  rs_R011_ueqv_R011YYY_partial_03_0001,
  rs_R011_ueqv_R011YYY_partial_03_0002,
  rs_R011_ueqv_R011YYY_partial_03_0003,
  rs_R011_ueqv_R011YYY_partial_03_0004,
  rs_R011_ueqv_R011YYY_partial_03_0005,
  rs_R011_ueqv_R011YYY_partial_03_0006,
  rs_R011_ueqv_R011YYY_partial_03_0007,
  rs_R011_ueqv_R011YYY_partial_03_0008,
  rs_R011_ueqv_R011YYY_partial_03_0009,
  rs_R011_ueqv_R011YYY_partial_03_0010,
  rs_R011_ueqv_R011YYY_partial_03_0011,
  rs_R011_ueqv_R011YYY_partial_03_0012,
  rs_R011_ueqv_R011YYY_partial_03_0013,
  rs_R011_ueqv_R011YYY_partial_03_0014,
  rs_R011_ueqv_R011YYY_partial_03_0015,
  rs_R011_ueqv_R011YYY_partial_03_0016,
  rs_R011_ueqv_R011YYY_partial_03_0017,
  rs_R011_ueqv_R011YYY_partial_03_0018,
  rs_R011_ueqv_R011YYY_partial_03_0019,
  rs_R011_ueqv_R011YYY_partial_03_0020,
  rs_R011_ueqv_R011YYY_partial_03_0021,
  rs_R011_ueqv_R011YYY_partial_03_0022,
  rs_R011_ueqv_R011YYY_partial_03_0023,
  rs_R011_ueqv_R011YYY_partial_03_0024,
  rs_R011_ueqv_R011YYY_partial_03_0025,
  rs_R011_ueqv_R011YYY_partial_03_0026,
  rs_R011_ueqv_R011YYY_partial_03_0027,
  rs_R011_ueqv_R011YYY_partial_03_0028,
  rs_R011_ueqv_R011YYY_partial_03_0029,
  rs_R011_ueqv_R011YYY_partial_03_0030,
  rs_R011_ueqv_R011YYY_partial_03_0031,
  rs_R011_ueqv_R011YYY_partial_03_0032,
  rs_R011_ueqv_R011YYY_partial_03_0033,
  rs_R011_ueqv_R011YYY_partial_03_0034,
  rs_R011_ueqv_R011YYY_partial_03_0035,
  rs_R011_ueqv_R011YYY_partial_03_0036,
  rs_R011_ueqv_R011YYY_partial_03_0037,
  rs_R011_ueqv_R011YYY_partial_03_0038,
  rs_R011_ueqv_R011YYY_partial_03_0039,
  rs_R011_ueqv_R011YYY_partial_03_0040,
  rs_R011_ueqv_R011YYY_partial_03_0041,
  rs_R011_ueqv_R011YYY_partial_03_0042,
  rs_R011_ueqv_R011YYY_partial_03_0043,
  rs_R011_ueqv_R011YYY_partial_03_0044,
  rs_R011_ueqv_R011YYY_partial_03_0045,
  rs_R011_ueqv_R011YYY_partial_03_0046,
  rs_R011_ueqv_R011YYY_partial_03_0047,
  rs_R011_ueqv_R011YYY_partial_03_0048,
  rs_R011_ueqv_R011YYY_partial_03_0049,
  rs_R011_ueqv_R011YYY_partial_03_0050,
  rs_R011_ueqv_R011YYY_partial_03_0051,
  rs_R011_ueqv_R011YYY_partial_03_0052,
  rs_R011_ueqv_R011YYY_partial_03_0053,
  rs_R011_ueqv_R011YYY_partial_03_0054,
  rs_R011_ueqv_R011YYY_partial_03_0055,
  rs_R011_ueqv_R011YYY_partial_03_0056,
  rs_R011_ueqv_R011YYY_partial_03_0057,
  rs_R011_ueqv_R011YYY_partial_03_0058,
  rs_R011_ueqv_R011YYY_partial_03_0059,
  rs_R011_ueqv_R011YYY_partial_03_0060,
  rs_R011_ueqv_R011YYY_partial_03_0061,
  rs_R011_ueqv_R011YYY_partial_03_0062,
  rs_R011_ueqv_R011YYY_partial_03_0063,
  rs_R011_ueqv_R011YYY_partial_03_0064,
  rs_R011_ueqv_R011YYY_partial_03_0065
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_03_0000_0065 : Poly :=
[
  term ((-635888 : Rat) / 3405) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((136408 : Rat) / 681) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (4, 2), (7, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (4, 2), (15, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (5, 2), (7, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (5, 2), (13, 1), (16, 1)],
  term ((-68204 : Rat) / 681) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((635888 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (7, 1), (11, 2), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-136408 : Rat) / 681) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((68204 : Rat) / 681) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((68204 : Rat) / 681) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term (112 : Rat) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((15064 : Rat) / 1135) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((64 : Rat) / 227) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1752 : Rat) / 227) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term (-120 : Rat) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((11778 : Rat) / 1135) [(0, 1), (4, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-876 : Rat) / 227) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term (60 : Rat) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (4, 2), (13, 2), (16, 1)],
  term ((-5889 : Rat) / 1135) [(0, 1), (4, 2), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-32 : Rat) / 227) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-876 : Rat) / 227) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term (60 : Rat) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (5, 2), (13, 2), (16, 1)],
  term ((-5889 : Rat) / 1135) [(0, 1), (5, 2), (16, 1)],
  term ((2048 : Rat) / 681) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term (-112 : Rat) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (7, 1), (11, 3), (16, 1)],
  term ((-15064 : Rat) / 1135) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((7532 : Rat) / 1135) [(0, 1), (8, 1), (10, 2), (16, 1)],
  term ((7532 : Rat) / 1135) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((-2048 : Rat) / 681) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-1752 : Rat) / 227) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term (120 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-11778 : Rat) / 1135) [(0, 1), (10, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((876 : Rat) / 227) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term (-60 : Rat) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((5569 : Rat) / 1135) [(0, 1), (10, 2), (16, 1)],
  term ((32 : Rat) / 227) [(0, 1), (10, 3), (16, 1)],
  term ((876 : Rat) / 227) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term (-60 : Rat) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((5889 : Rat) / 1135) [(0, 1), (11, 2), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (3, 1), (4, 1), (13, 2), (16, 1)],
  term ((-21076 : Rat) / 3405) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((104482 : Rat) / 3405) [(1, 1), (3, 1), (4, 2), (10, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (3, 1), (4, 2), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 1), (4, 2), (13, 2), (16, 1)],
  term ((10538 : Rat) / 3405) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((104482 : Rat) / 3405) [(1, 1), (3, 1), (5, 2), (10, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (3, 1), (5, 2), (13, 2), (16, 1)],
  term ((10538 : Rat) / 3405) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (11, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((21076 : Rat) / 3405) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (3, 1), (10, 2), (12, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (10, 2), (13, 2), (16, 1)],
  term ((66142 : Rat) / 1135) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((-104482 : Rat) / 3405) [(1, 1), (3, 1), (10, 3), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (3, 1), (11, 2), (12, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (3, 1), (11, 2), (13, 2), (16, 1)],
  term ((-10538 : Rat) / 3405) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((263464 : Rat) / 3405) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((15064 : Rat) / 1135) [(1, 1), (4, 1), (9, 1), (16, 1)],
  term ((417928 : Rat) / 3405) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-103522 : Rat) / 3405) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-5552 : Rat) / 1135) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((4322 : Rat) / 1135) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-123072 : Rat) / 1135) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-52108 : Rat) / 1135) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (4, 2), (7, 1), (12, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131732 : Rat) / 3405) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((51761 : Rat) / 3405) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((2776 : Rat) / 1135) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2161 : Rat) / 1135) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (4, 2), (13, 2), (15, 1), (16, 1)],
  term ((26054 : Rat) / 1135) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 1), (5, 2), (6, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131732 : Rat) / 3405) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-7532 : Rat) / 1135) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-208964 : Rat) / 3405) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((51761 : Rat) / 3405) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((2776 : Rat) / 1135) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2161 : Rat) / 1135) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((26054 : Rat) / 1135) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-263464 : Rat) / 3405) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((131732 : Rat) / 3405) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((131732 : Rat) / 3405) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-15064 : Rat) / 1135) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((7532 : Rat) / 1135) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((7532 : Rat) / 1135) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((103522 : Rat) / 3405) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((5552 : Rat) / 1135) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4322 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((123072 : Rat) / 1135) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((52108 : Rat) / 1135) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-51761 : Rat) / 3405) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2776 : Rat) / 1135) [(1, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((2161 : Rat) / 1135) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-99218 : Rat) / 681) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((208964 : Rat) / 3405) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((-2776 : Rat) / 1135) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2161 : Rat) / 1135) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-26054 : Rat) / 1135) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-51761 : Rat) / 3405) [(1, 1), (11, 3), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 2), (4, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 2), (4, 2), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 2), (5, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 2), (10, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 2), (10, 2), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 2), (11, 2), (16, 1)],
  term ((256 : Rat) / 681) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((2640 : Rat) / 227) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-45104 : Rat) / 3405) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2500 : Rat) / 227) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term (-32 : Rat) [(3, 1), (4, 1), (13, 3), (16, 1)],
  term ((9968 : Rat) / 1135) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term (-18 : Rat) [(3, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((22552 : Rat) / 3405) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((1250 : Rat) / 227) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (4, 2), (13, 3), (16, 1)],
  term ((-4984 : Rat) / 1135) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term (-18 : Rat) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((22552 : Rat) / 3405) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((1250 : Rat) / 227) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 2), (13, 3), (16, 1)],
  term ((-4984 : Rat) / 1135) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((45104 : Rat) / 3405) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1320 : Rat) / 227) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (10, 1), (11, 3), (16, 1)],
  term (4 : Rat) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((2500 : Rat) / 227) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term (32 : Rat) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term ((-9968 : Rat) / 1135) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7944 : Rat) / 1135) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-9422 : Rat) / 227) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (10, 2), (13, 3), (16, 1)],
  term ((-8216 : Rat) / 1135) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 681) [(3, 1), (10, 3), (11, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 3), (13, 1), (16, 1)],
  term ((1320 : Rat) / 227) [(3, 1), (10, 3), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1250 : Rat) / 227) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (11, 2), (13, 3), (16, 1)],
  term ((4984 : Rat) / 1135) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-22552 : Rat) / 3405) [(3, 1), (11, 3), (16, 1)],
  term (-8 : Rat) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term (6 : Rat) [(4, 1), (6, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term (-56 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12232 : Rat) / 1135) [(4, 1), (8, 2), (16, 1)],
  term ((-12232 : Rat) / 1135) [(4, 1), (9, 2), (16, 1)],
  term ((-512 : Rat) / 681) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5280 : Rat) / 227) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((7584 : Rat) / 1135) [(4, 1), (10, 1), (16, 1)],
  term (18 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((35096 : Rat) / 1135) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 681) [(4, 1), (11, 2), (16, 1)],
  term (32 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1688 : Rat) / 227) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-52424 : Rat) / 1135) [(4, 1), (12, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (12, 2), (16, 1)],
  term ((10448 : Rat) / 227) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term (30 : Rat) [(4, 1), (13, 2), (16, 1)],
  term (64 : Rat) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((25104 : Rat) / 1135) [(4, 1), (14, 1), (16, 1)],
  term ((-29886 : Rat) / 1135) [(4, 1), (15, 2), (16, 1)],
  term ((11941 : Rat) / 2270) [(4, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term (2 : Rat) [(4, 2), (6, 1), (13, 2), (16, 1)],
  term (-3 : Rat) [(4, 2), (6, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((6116 : Rat) / 1135) [(4, 2), (8, 2), (16, 1)],
  term ((6116 : Rat) / 1135) [(4, 2), (9, 2), (16, 1)],
  term ((256 : Rat) / 681) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 227) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3792 : Rat) / 1135) [(4, 2), (10, 1), (16, 1)],
  term (-9 : Rat) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-17548 : Rat) / 1135) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 681) [(4, 2), (11, 2), (16, 1)],
  term (-16 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((844 : Rat) / 227) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((26212 : Rat) / 1135) [(4, 2), (12, 1), (16, 1)],
  term (-12 : Rat) [(4, 2), (12, 2), (16, 1)],
  term ((-5224 : Rat) / 227) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term (-15 : Rat) [(4, 2), (13, 2), (16, 1)],
  term (-32 : Rat) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term ((-12552 : Rat) / 1135) [(4, 2), (14, 1), (16, 1)],
  term ((14943 : Rat) / 1135) [(4, 2), (15, 2), (16, 1)],
  term ((-11941 : Rat) / 4540) [(4, 2), (16, 1)],
  term (4 : Rat) [(5, 2), (6, 1), (12, 1), (16, 1)],
  term (2 : Rat) [(5, 2), (6, 1), (13, 2), (16, 1)],
  term (-3 : Rat) [(5, 2), (6, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term (28 : Rat) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((6116 : Rat) / 1135) [(5, 2), (8, 2), (16, 1)],
  term ((6116 : Rat) / 1135) [(5, 2), (9, 2), (16, 1)],
  term ((256 : Rat) / 681) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 227) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3792 : Rat) / 1135) [(5, 2), (10, 1), (16, 1)],
  term (-9 : Rat) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-17548 : Rat) / 1135) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 681) [(5, 2), (11, 2), (16, 1)],
  term (-16 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((844 : Rat) / 227) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((26212 : Rat) / 1135) [(5, 2), (12, 1), (16, 1)],
  term (-12 : Rat) [(5, 2), (12, 2), (16, 1)],
  term ((-5224 : Rat) / 227) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term (-15 : Rat) [(5, 2), (13, 2), (16, 1)],
  term (-32 : Rat) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((-12552 : Rat) / 1135) [(5, 2), (14, 1), (16, 1)],
  term ((14943 : Rat) / 1135) [(5, 2), (15, 2), (16, 1)],
  term ((-11941 : Rat) / 4540) [(5, 2), (16, 1)],
  term (8 : Rat) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term (-6 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term (3 : Rat) [(6, 1), (10, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term (3 : Rat) [(6, 1), (11, 2), (16, 1)],
  term ((-1024 : Rat) / 681) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term (56 : Rat) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term (-28 : Rat) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(7, 1), (11, 3), (16, 1)],
  term ((12232 : Rat) / 1135) [(8, 2), (10, 1), (16, 1)],
  term ((-6116 : Rat) / 1135) [(8, 2), (10, 2), (16, 1)],
  term ((-6116 : Rat) / 1135) [(8, 2), (11, 2), (16, 1)],
  term ((12232 : Rat) / 1135) [(9, 2), (10, 1), (16, 1)],
  term ((-6116 : Rat) / 1135) [(9, 2), (10, 2), (16, 1)],
  term ((-6116 : Rat) / 1135) [(9, 2), (11, 2), (16, 1)],
  term (-18 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-35096 : Rat) / 1135) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 227) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((10736 : Rat) / 3405) [(10, 1), (11, 2), (16, 1)],
  term ((-256 : Rat) / 681) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((1688 : Rat) / 227) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((52424 : Rat) / 1135) [(10, 1), (12, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (12, 2), (16, 1)],
  term ((-10448 : Rat) / 227) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term (-30 : Rat) [(10, 1), (13, 2), (16, 1)],
  term (-64 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-25104 : Rat) / 1135) [(10, 1), (14, 1), (16, 1)],
  term ((29886 : Rat) / 1135) [(10, 1), (15, 2), (16, 1)],
  term ((-11941 : Rat) / 2270) [(10, 1), (16, 1)],
  term (9 : Rat) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((55204 : Rat) / 3405) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 681) [(10, 2), (11, 2), (16, 1)],
  term (16 : Rat) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((-844 : Rat) / 227) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-26212 : Rat) / 1135) [(10, 2), (12, 1), (16, 1)],
  term (12 : Rat) [(10, 2), (12, 2), (16, 1)],
  term ((21568 : Rat) / 227) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term (15 : Rat) [(10, 2), (13, 2), (16, 1)],
  term (32 : Rat) [(10, 2), (13, 3), (15, 1), (16, 1)],
  term ((12552 : Rat) / 1135) [(10, 2), (14, 1), (16, 1)],
  term ((11457 : Rat) / 1135) [(10, 2), (15, 2), (16, 1)],
  term ((-3679 : Rat) / 908) [(10, 2), (16, 1)],
  term ((-256 : Rat) / 681) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 227) [(10, 3), (15, 2), (16, 1)],
  term ((3792 : Rat) / 1135) [(10, 3), (16, 1)],
  term (16 : Rat) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-844 : Rat) / 227) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-26212 : Rat) / 1135) [(11, 2), (12, 1), (16, 1)],
  term (12 : Rat) [(11, 2), (12, 2), (16, 1)],
  term ((5224 : Rat) / 227) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term (15 : Rat) [(11, 2), (13, 2), (16, 1)],
  term (32 : Rat) [(11, 2), (13, 3), (15, 1), (16, 1)],
  term ((12552 : Rat) / 1135) [(11, 2), (14, 1), (16, 1)],
  term ((-14943 : Rat) / 1135) [(11, 2), (15, 2), (16, 1)],
  term ((11941 : Rat) / 4540) [(11, 2), (16, 1)],
  term (9 : Rat) [(11, 3), (13, 1), (16, 1)],
  term ((17548 : Rat) / 1135) [(11, 3), (15, 1), (16, 1)],
  term ((64 : Rat) / 681) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 0 through 65. -/
theorem rs_R011_ueqv_R011YYY_block_03_0000_0065_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_03_0000_0065
      rs_R011_ueqv_R011YYY_block_03_0000_0065 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
