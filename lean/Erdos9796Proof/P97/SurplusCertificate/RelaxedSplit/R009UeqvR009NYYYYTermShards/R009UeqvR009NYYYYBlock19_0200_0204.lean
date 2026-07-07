/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 19:200-204

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_19_0200_0204 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYYY_coefficient_19_0200 : Poly :=
[
  term ((17241566 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 200 for generator 19. -/
def rs_R009_ueqv_R009NYYYY_partial_19_0200 : Poly :=
[
  term ((34483132 : Rat) / 32699) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((34483132 : Rat) / 32699) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 19. -/
theorem rs_R009_ueqv_R009NYYYY_partial_19_0200_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_19_0200
        rs_R009_ueqv_R009NYYYY_generator_19_0200_0204 =
      rs_R009_ueqv_R009NYYYY_partial_19_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYYY_coefficient_19_0201 : Poly :=
[
  term ((131440316141 : Rat) / 159309528) [(15, 2)]
]

/-- Partial product 201 for generator 19. -/
def rs_R009_ueqv_R009NYYYY_partial_19_0201 : Poly :=
[
  term ((131440316141 : Rat) / 79654764) [(4, 1), (8, 1), (15, 2)],
  term ((-131440316141 : Rat) / 159309528) [(4, 2), (15, 2)],
  term ((131440316141 : Rat) / 79654764) [(5, 1), (9, 1), (15, 2)],
  term ((-131440316141 : Rat) / 159309528) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 19. -/
theorem rs_R009_ueqv_R009NYYYY_partial_19_0201_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_19_0201
        rs_R009_ueqv_R009NYYYY_generator_19_0200_0204 =
      rs_R009_ueqv_R009NYYYY_partial_19_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYYY_coefficient_19_0202 : Poly :=
[
  term ((-14871608 : Rat) / 98097) [(15, 2), (16, 1)]
]

/-- Partial product 202 for generator 19. -/
def rs_R009_ueqv_R009NYYYY_partial_19_0202 : Poly :=
[
  term ((-29743216 : Rat) / 98097) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((14871608 : Rat) / 98097) [(4, 2), (15, 2), (16, 1)],
  term ((-29743216 : Rat) / 98097) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((14871608 : Rat) / 98097) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 19. -/
theorem rs_R009_ueqv_R009NYYYY_partial_19_0202_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_19_0202
        rs_R009_ueqv_R009NYYYY_generator_19_0200_0204 =
      rs_R009_ueqv_R009NYYYY_partial_19_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYYY_coefficient_19_0203 : Poly :=
[
  term ((-713886046843 : Rat) / 796547640) [(15, 4)]
]

/-- Partial product 203 for generator 19. -/
def rs_R009_ueqv_R009NYYYY_partial_19_0203 : Poly :=
[
  term ((-713886046843 : Rat) / 398273820) [(4, 1), (8, 1), (15, 4)],
  term ((713886046843 : Rat) / 796547640) [(4, 2), (15, 4)],
  term ((-713886046843 : Rat) / 398273820) [(5, 1), (9, 1), (15, 4)],
  term ((713886046843 : Rat) / 796547640) [(5, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 19. -/
theorem rs_R009_ueqv_R009NYYYY_partial_19_0203_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_19_0203
        rs_R009_ueqv_R009NYYYY_generator_19_0200_0204 =
      rs_R009_ueqv_R009NYYYY_partial_19_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYYY_coefficient_19_0204 : Poly :=
[
  term ((17064581 : Rat) / 98097) [(15, 4), (16, 1)]
]

/-- Partial product 204 for generator 19. -/
def rs_R009_ueqv_R009NYYYY_partial_19_0204 : Poly :=
[
  term ((34129162 : Rat) / 98097) [(4, 1), (8, 1), (15, 4), (16, 1)],
  term ((-17064581 : Rat) / 98097) [(4, 2), (15, 4), (16, 1)],
  term ((34129162 : Rat) / 98097) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-17064581 : Rat) / 98097) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 19. -/
theorem rs_R009_ueqv_R009NYYYY_partial_19_0204_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_19_0204
        rs_R009_ueqv_R009NYYYY_generator_19_0200_0204 =
      rs_R009_ueqv_R009NYYYY_partial_19_0204 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_19_0200_0204 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_19_0200,
  rs_R009_ueqv_R009NYYYY_partial_19_0201,
  rs_R009_ueqv_R009NYYYY_partial_19_0202,
  rs_R009_ueqv_R009NYYYY_partial_19_0203,
  rs_R009_ueqv_R009NYYYY_partial_19_0204
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_19_0200_0204 : Poly :=
[
  term ((34483132 : Rat) / 32699) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((131440316141 : Rat) / 79654764) [(4, 1), (8, 1), (15, 2)],
  term ((-29743216 : Rat) / 98097) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 398273820) [(4, 1), (8, 1), (15, 4)],
  term ((34129162 : Rat) / 98097) [(4, 1), (8, 1), (15, 4), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-131440316141 : Rat) / 159309528) [(4, 2), (15, 2)],
  term ((14871608 : Rat) / 98097) [(4, 2), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 796547640) [(4, 2), (15, 4)],
  term ((-17064581 : Rat) / 98097) [(4, 2), (15, 4), (16, 1)],
  term ((34483132 : Rat) / 32699) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((131440316141 : Rat) / 79654764) [(5, 1), (9, 1), (15, 2)],
  term ((-29743216 : Rat) / 98097) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 398273820) [(5, 1), (9, 1), (15, 4)],
  term ((34129162 : Rat) / 98097) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-131440316141 : Rat) / 159309528) [(5, 2), (15, 2)],
  term ((14871608 : Rat) / 98097) [(5, 2), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 796547640) [(5, 2), (15, 4)],
  term ((-17064581 : Rat) / 98097) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 200 through 204. -/
theorem rs_R009_ueqv_R009NYYYY_block_19_0200_0204_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_19_0200_0204
      rs_R009_ueqv_R009NYYYY_block_19_0200_0204 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
