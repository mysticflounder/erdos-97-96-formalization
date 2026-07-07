/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 10:200-205

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_10_0200_0205 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 10. -/
def rs_R002_ueqv_R002YNYN_coefficient_10_0200 : Poly :=
[
  term ((8 : Rat) / 3) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 10. -/
def rs_R002_ueqv_R002YNYN_partial_10_0200 : Poly :=
[
  term ((16 : Rat) / 3) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 10. -/
theorem rs_R002_ueqv_R002YNYN_partial_10_0200_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_10_0200
        rs_R002_ueqv_R002YNYN_generator_10_0200_0205 =
      rs_R002_ueqv_R002YNYN_partial_10_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 10. -/
def rs_R002_ueqv_R002YNYN_coefficient_10_0201 : Poly :=
[
  term (-36 : Rat) [(11, 2)]
]

/-- Partial product 201 for generator 10. -/
def rs_R002_ueqv_R002YNYN_partial_10_0201 : Poly :=
[
  term (-72 : Rat) [(2, 1), (11, 2)],
  term (36 : Rat) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 10. -/
theorem rs_R002_ueqv_R002YNYN_partial_10_0201_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_10_0201
        rs_R002_ueqv_R002YNYN_generator_10_0200_0205 =
      rs_R002_ueqv_R002YNYN_partial_10_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 10. -/
def rs_R002_ueqv_R002YNYN_coefficient_10_0202 : Poly :=
[
  term (-16 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 202 for generator 10. -/
def rs_R002_ueqv_R002YNYN_partial_10_0202 : Poly :=
[
  term (-32 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (16 : Rat) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 10. -/
theorem rs_R002_ueqv_R002YNYN_partial_10_0202_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_10_0202
        rs_R002_ueqv_R002YNYN_generator_10_0200_0205 =
      rs_R002_ueqv_R002YNYN_partial_10_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 10. -/
def rs_R002_ueqv_R002YNYN_coefficient_10_0203 : Poly :=
[
  term (1 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 10. -/
def rs_R002_ueqv_R002YNYN_partial_10_0203 : Poly :=
[
  term (2 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 10. -/
theorem rs_R002_ueqv_R002YNYN_partial_10_0203_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_10_0203
        rs_R002_ueqv_R002YNYN_generator_10_0200_0205 =
      rs_R002_ueqv_R002YNYN_partial_10_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 10. -/
def rs_R002_ueqv_R002YNYN_coefficient_10_0204 : Poly :=
[
  term (-26 : Rat) [(15, 2)]
]

/-- Partial product 204 for generator 10. -/
def rs_R002_ueqv_R002YNYN_partial_10_0204 : Poly :=
[
  term (-52 : Rat) [(2, 1), (15, 2)],
  term (26 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 10. -/
theorem rs_R002_ueqv_R002YNYN_partial_10_0204_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_10_0204
        rs_R002_ueqv_R002YNYN_generator_10_0200_0205 =
      rs_R002_ueqv_R002YNYN_partial_10_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 10. -/
def rs_R002_ueqv_R002YNYN_coefficient_10_0205 : Poly :=
[
  term ((5 : Rat) / 3) [(15, 2), (16, 1)]
]

/-- Partial product 205 for generator 10. -/
def rs_R002_ueqv_R002YNYN_partial_10_0205 : Poly :=
[
  term ((10 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 10. -/
theorem rs_R002_ueqv_R002YNYN_partial_10_0205_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_10_0205
        rs_R002_ueqv_R002YNYN_generator_10_0200_0205 =
      rs_R002_ueqv_R002YNYN_partial_10_0205 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_10_0200_0205 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_10_0200,
  rs_R002_ueqv_R002YNYN_partial_10_0201,
  rs_R002_ueqv_R002YNYN_partial_10_0202,
  rs_R002_ueqv_R002YNYN_partial_10_0203,
  rs_R002_ueqv_R002YNYN_partial_10_0204,
  rs_R002_ueqv_R002YNYN_partial_10_0205
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_10_0200_0205 : Poly :=
[
  term ((16 : Rat) / 3) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(2, 1), (11, 2)],
  term (-32 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (2 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-52 : Rat) [(2, 1), (15, 2)],
  term ((10 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(11, 2)],
  term (16 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (26 : Rat) [(15, 2)],
  term ((-5 : Rat) / 3) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 200 through 205. -/
theorem rs_R002_ueqv_R002YNYN_block_10_0200_0205_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_10_0200_0205
      rs_R002_ueqv_R002YNYN_block_10_0200_0205 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
