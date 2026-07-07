/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 6:0-3

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 6 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_06_0000_0003 : Poly :=
[
  term (-1 : Rat) [],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 6. -/
def rs_R014_ueqv_R014YY_coefficient_06_0000 : Poly :=
[
  term (4 : Rat) [(7, 1), (11, 1)]
]

/-- Partial product 0 for generator 6. -/
def rs_R014_ueqv_R014YY_partial_06_0000 : Poly :=
[
  term (4 : Rat) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 6. -/
theorem rs_R014_ueqv_R014YY_partial_06_0000_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_06_0000
        rs_R014_ueqv_R014YY_generator_06_0000_0003 =
      rs_R014_ueqv_R014YY_partial_06_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 6. -/
def rs_R014_ueqv_R014YY_coefficient_06_0001 : Poly :=
[
  term (-4 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 1 for generator 6. -/
def rs_R014_ueqv_R014YY_partial_06_0001 : Poly :=
[
  term (-4 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 6. -/
theorem rs_R014_ueqv_R014YY_partial_06_0001_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_06_0001
        rs_R014_ueqv_R014YY_generator_06_0000_0003 =
      rs_R014_ueqv_R014YY_partial_06_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 6. -/
def rs_R014_ueqv_R014YY_coefficient_06_0002 : Poly :=
[
  term (8 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 2 for generator 6. -/
def rs_R014_ueqv_R014YY_partial_06_0002 : Poly :=
[
  term (8 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 6. -/
theorem rs_R014_ueqv_R014YY_partial_06_0002_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_06_0002
        rs_R014_ueqv_R014YY_generator_06_0000_0003 =
      rs_R014_ueqv_R014YY_partial_06_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 6. -/
def rs_R014_ueqv_R014YY_coefficient_06_0003 : Poly :=
[
  term (-4 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 3 for generator 6. -/
def rs_R014_ueqv_R014YY_partial_06_0003 : Poly :=
[
  term (-4 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 6. -/
theorem rs_R014_ueqv_R014YY_partial_06_0003_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_06_0003
        rs_R014_ueqv_R014YY_generator_06_0000_0003 =
      rs_R014_ueqv_R014YY_partial_06_0003 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_06_0000_0003 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_06_0000,
  rs_R014_ueqv_R014YY_partial_06_0001,
  rs_R014_ueqv_R014YY_partial_06_0002,
  rs_R014_ueqv_R014YY_partial_06_0003
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_06_0000_0003 : Poly :=
[
  term (4 : Rat) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (11, 1)],
  term (4 : Rat) [(7, 1), (15, 1)],
  term (-8 : Rat) [(11, 1), (15, 1)],
  term (4 : Rat) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 0 through 3. -/
theorem rs_R014_ueqv_R014YY_block_06_0000_0003_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_06_0000_0003
      rs_R014_ueqv_R014YY_block_06_0000_0003 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
