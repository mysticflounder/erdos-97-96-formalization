/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 26:0-5

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_26_0000_0005 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 26. -/
def rs_R011_ueqv_R011YYY_coefficient_26_0000 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 0 for generator 26. -/
def rs_R011_ueqv_R011YYY_partial_26_0000 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 2), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 3), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem rs_R011_ueqv_R011YYY_partial_26_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_26_0000
        rs_R011_ueqv_R011YYY_generator_26_0000_0005 =
      rs_R011_ueqv_R011YYY_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def rs_R011_ueqv_R011YYY_coefficient_26_0001 : Poly :=
[
  term ((-3846 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 26. -/
def rs_R011_ueqv_R011YYY_partial_26_0001 : Poly :=
[
  term ((7692 : Rat) / 1135) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (6, 1), (7, 2), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (6, 3), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem rs_R011_ueqv_R011YYY_partial_26_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_26_0001
        rs_R011_ueqv_R011YYY_generator_26_0000_0005 =
      rs_R011_ueqv_R011YYY_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def rs_R011_ueqv_R011YYY_coefficient_26_0002 : Poly :=
[
  term (-4 : Rat) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 2 for generator 26. -/
def rs_R011_ueqv_R011YYY_partial_26_0002 : Poly :=
[
  term (8 : Rat) [(0, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(0, 2), (4, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (4, 1), (13, 3), (16, 1)],
  term (-4 : Rat) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(4, 1), (6, 2), (13, 2), (16, 1)],
  term (-8 : Rat) [(4, 1), (7, 1), (13, 3), (16, 1)],
  term (4 : Rat) [(4, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem rs_R011_ueqv_R011YYY_partial_26_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_26_0002
        rs_R011_ueqv_R011YYY_generator_26_0000_0005 =
      rs_R011_ueqv_R011YYY_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def rs_R011_ueqv_R011YYY_coefficient_26_0003 : Poly :=
[
  term (-2 : Rat) [(4, 1), (16, 1)]
]

/-- Partial product 3 for generator 26. -/
def rs_R011_ueqv_R011YYY_partial_26_0003 : Poly :=
[
  term (4 : Rat) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (4, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (4, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (6, 2), (16, 1)],
  term (-4 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem rs_R011_ueqv_R011YYY_partial_26_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_26_0003
        rs_R011_ueqv_R011YYY_generator_26_0000_0005 =
      rs_R011_ueqv_R011YYY_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def rs_R011_ueqv_R011YYY_coefficient_26_0004 : Poly :=
[
  term (2 : Rat) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 4 for generator 26. -/
def rs_R011_ueqv_R011YYY_partial_26_0004 : Poly :=
[
  term (-4 : Rat) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term (2 : Rat) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(6, 1), (7, 1), (13, 3), (16, 1)],
  term (-2 : Rat) [(6, 1), (7, 2), (13, 2), (16, 1)],
  term (4 : Rat) [(6, 2), (12, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(6, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem rs_R011_ueqv_R011YYY_partial_26_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_26_0004
        rs_R011_ueqv_R011YYY_generator_26_0000_0005 =
      rs_R011_ueqv_R011YYY_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def rs_R011_ueqv_R011YYY_coefficient_26_0005 : Poly :=
[
  term (1 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 5 for generator 26. -/
def rs_R011_ueqv_R011YYY_partial_26_0005 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (6, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term (-1 : Rat) [(6, 1), (7, 2), (16, 1)],
  term (2 : Rat) [(6, 2), (12, 1), (16, 1)],
  term (-1 : Rat) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem rs_R011_ueqv_R011YYY_partial_26_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_26_0005
        rs_R011_ueqv_R011YYY_generator_26_0000_0005 =
      rs_R011_ueqv_R011YYY_partial_26_0005 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_26_0000_0005 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_26_0000,
  rs_R011_ueqv_R011YYY_partial_26_0001,
  rs_R011_ueqv_R011YYY_partial_26_0002,
  rs_R011_ueqv_R011YYY_partial_26_0003,
  rs_R011_ueqv_R011YYY_partial_26_0004,
  rs_R011_ueqv_R011YYY_partial_26_0005
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_26_0000_0005 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 2), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (4, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(0, 2), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term (1 : Rat) [(0, 2), (6, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (4, 1), (13, 3), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (6, 1), (7, 2), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((3846 : Rat) / 1135) [(1, 1), (6, 3), (13, 1), (16, 1)],
  term ((-19924 : Rat) / 1135) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (4, 1), (16, 1)],
  term ((9962 : Rat) / 1135) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (6, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 3), (4, 1), (13, 1), (16, 1)],
  term ((-3846 : Rat) / 1135) [(1, 3), (6, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (6, 2), (13, 2), (16, 1)],
  term (2 : Rat) [(4, 1), (6, 2), (16, 1)],
  term (-4 : Rat) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (7, 1), (13, 3), (16, 1)],
  term (4 : Rat) [(4, 1), (7, 2), (13, 2), (16, 1)],
  term (2 : Rat) [(4, 1), (7, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (7, 1), (13, 3), (16, 1)],
  term (-2 : Rat) [(6, 1), (7, 2), (13, 2), (16, 1)],
  term (-1 : Rat) [(6, 1), (7, 2), (16, 1)],
  term (4 : Rat) [(6, 2), (12, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(6, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(6, 3), (13, 2), (16, 1)],
  term (-1 : Rat) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 5. -/
theorem rs_R011_ueqv_R011YYY_block_26_0000_0005_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_26_0000_0005
      rs_R011_ueqv_R011YYY_block_26_0000_0005 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
