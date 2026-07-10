/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 4:200-208

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_04_0200_0208 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0200 : Poly :=
[
  term (-1 : Rat) [(12, 1)]
]

/-- Partial product 200 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0200 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (-1 : Rat) [(2, 2), (12, 1)],
  term (-1 : Rat) [(3, 2), (12, 1)],
  term (1 : Rat) [(12, 1), (13, 2)],
  term (-2 : Rat) [(12, 2)],
  term (1 : Rat) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0200_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0200
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0201 : Poly :=
[
  term (-4 : Rat) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 201 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0201 : Poly :=
[
  term (8 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(12, 1), (13, 3), (15, 1)],
  term (-8 : Rat) [(12, 2), (13, 1), (15, 1)],
  term (4 : Rat) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0201_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0201
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0202 : Poly :=
[
  term (4 : Rat) [(12, 1), (15, 2)]
]

/-- Partial product 202 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0202 : Poly :=
[
  term (-8 : Rat) [(2, 1), (12, 1), (15, 2)],
  term (4 : Rat) [(2, 2), (12, 1), (15, 2)],
  term (4 : Rat) [(3, 2), (12, 1), (15, 2)],
  term (-4 : Rat) [(12, 1), (13, 2), (15, 2)],
  term (8 : Rat) [(12, 2), (15, 2)],
  term (-4 : Rat) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0202_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0202
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0203 : Poly :=
[
  term ((7 : Rat) / 3) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0203 : Poly :=
[
  term ((-14 : Rat) / 3) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 3) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 3) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 3) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14 : Rat) / 3) [(12, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 3) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0203_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0203
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0204 : Poly :=
[
  term (-4 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 204 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0204 : Poly :=
[
  term (8 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(2, 2), (13, 1), (15, 1)],
  term (-4 : Rat) [(3, 2), (13, 1), (15, 1)],
  term (-8 : Rat) [(12, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(12, 2), (13, 1), (15, 1)],
  term (4 : Rat) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0204_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0204
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0205 : Poly :=
[
  term ((-7 : Rat) / 6) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0205 : Poly :=
[
  term ((7 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 3) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 6) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 6) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0205_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0205
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0206 : Poly :=
[
  term (2 : Rat) [(13, 2)]
]

/-- Partial product 206 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0206 : Poly :=
[
  term (-4 : Rat) [(2, 1), (13, 2)],
  term (2 : Rat) [(2, 2), (13, 2)],
  term (2 : Rat) [(3, 2), (13, 2)],
  term (4 : Rat) [(12, 1), (13, 2)],
  term (-2 : Rat) [(12, 2), (13, 2)],
  term (-2 : Rat) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0206_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0206
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0207 : Poly :=
[
  term (6 : Rat) [(15, 2)]
]

/-- Partial product 207 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0207 : Poly :=
[
  term (-12 : Rat) [(2, 1), (15, 2)],
  term (6 : Rat) [(2, 2), (15, 2)],
  term (6 : Rat) [(3, 2), (15, 2)],
  term (12 : Rat) [(12, 1), (15, 2)],
  term (-6 : Rat) [(12, 2), (15, 2)],
  term (-6 : Rat) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0207_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0207
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 4. -/
def rs_R002_ueqv_R002YNYN_coefficient_04_0208 : Poly :=
[
  term ((1 : Rat) / 3) [(15, 2), (16, 1)]
]

/-- Partial product 208 for generator 4. -/
def rs_R002_ueqv_R002YNYN_partial_04_0208 : Poly :=
[
  term ((-2 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(2, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(3, 2), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 4. -/
theorem rs_R002_ueqv_R002YNYN_partial_04_0208_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_04_0208
        rs_R002_ueqv_R002YNYN_generator_04_0200_0208 =
      rs_R002_ueqv_R002YNYN_partial_04_0208 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_04_0200_0208 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_04_0200,
  rs_R002_ueqv_R002YNYN_partial_04_0201,
  rs_R002_ueqv_R002YNYN_partial_04_0202,
  rs_R002_ueqv_R002YNYN_partial_04_0203,
  rs_R002_ueqv_R002YNYN_partial_04_0204,
  rs_R002_ueqv_R002YNYN_partial_04_0205,
  rs_R002_ueqv_R002YNYN_partial_04_0206,
  rs_R002_ueqv_R002YNYN_partial_04_0207,
  rs_R002_ueqv_R002YNYN_partial_04_0208
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_04_0200_0208 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (8 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(2, 1), (12, 1), (15, 2)],
  term ((-14 : Rat) / 3) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (13, 1), (15, 1)],
  term ((7 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (13, 2)],
  term (-12 : Rat) [(2, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(2, 2), (12, 1)],
  term (-4 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(2, 2), (12, 1), (15, 2)],
  term ((7 : Rat) / 3) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(2, 2), (13, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(2, 2), (13, 2)],
  term (6 : Rat) [(2, 2), (15, 2)],
  term ((1 : Rat) / 3) [(2, 2), (15, 2), (16, 1)],
  term (-1 : Rat) [(3, 2), (12, 1)],
  term (-4 : Rat) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(3, 2), (12, 1), (15, 2)],
  term ((7 : Rat) / 3) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(3, 2), (13, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 2), (13, 2)],
  term (6 : Rat) [(3, 2), (15, 2)],
  term ((1 : Rat) / 3) [(3, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(12, 1), (13, 1), (15, 1)],
  term ((-7 : Rat) / 3) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (5 : Rat) [(12, 1), (13, 2)],
  term (-4 : Rat) [(12, 1), (13, 2), (15, 2)],
  term ((-7 : Rat) / 3) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (13, 3), (15, 1)],
  term (12 : Rat) [(12, 1), (15, 2)],
  term ((2 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(12, 2)],
  term (-4 : Rat) [(12, 2), (13, 1), (15, 1)],
  term ((7 : Rat) / 6) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(12, 2), (13, 2)],
  term (2 : Rat) [(12, 2), (15, 2)],
  term ((13 : Rat) / 3) [(12, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(12, 3)],
  term (4 : Rat) [(12, 3), (13, 1), (15, 1)],
  term (-4 : Rat) [(12, 3), (15, 2)],
  term ((-7 : Rat) / 3) [(12, 3), (15, 2), (16, 1)],
  term (-6 : Rat) [(13, 2), (15, 2)],
  term ((-1 : Rat) / 3) [(13, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(13, 3), (15, 1)],
  term ((7 : Rat) / 6) [(13, 3), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 200 through 208. -/
theorem rs_R002_ueqv_R002YNYN_block_04_0200_0208_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_04_0200_0208
      rs_R002_ueqv_R002YNYN_block_04_0200_0208 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
