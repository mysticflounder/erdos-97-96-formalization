/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 25:400-402

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_25_0400_0402 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0400 : Poly :=
[
  term ((1026212231157919703 : Rat) / 417754261705536) [(15, 2)]
]

/-- Partial product 400 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0400 : Poly :=
[
  term ((-1026212231157919703 : Rat) / 208877130852768) [(0, 1), (12, 1), (15, 2)],
  term ((1026212231157919703 : Rat) / 417754261705536) [(0, 2), (15, 2)],
  term ((-1026212231157919703 : Rat) / 208877130852768) [(1, 1), (13, 1), (15, 2)],
  term ((1026212231157919703 : Rat) / 417754261705536) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0400_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0400
        rs_R009_ueqv_R009YNNNN_generator_25_0400_0402 =
      rs_R009_ueqv_R009YNNNN_partial_25_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0401 : Poly :=
[
  term ((-197 : Rat) / 84) [(15, 2), (16, 1)]
]

/-- Partial product 401 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0401 : Poly :=
[
  term ((197 : Rat) / 42) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-197 : Rat) / 84) [(0, 2), (15, 2), (16, 1)],
  term ((197 : Rat) / 42) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-197 : Rat) / 84) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0401_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0401
        rs_R009_ueqv_R009YNNNN_generator_25_0400_0402 =
      rs_R009_ueqv_R009YNNNN_partial_25_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0402 : Poly :=
[
  term ((-16 : Rat) / 21) [(16, 1)]
]

/-- Partial product 402 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0402 : Poly :=
[
  term ((32 : Rat) / 21) [(0, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (16, 1)],
  term ((32 : Rat) / 21) [(1, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0402_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0402
        rs_R009_ueqv_R009YNNNN_generator_25_0400_0402 =
      rs_R009_ueqv_R009YNNNN_partial_25_0402 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_25_0400_0402 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_25_0400,
  rs_R009_ueqv_R009YNNNN_partial_25_0401,
  rs_R009_ueqv_R009YNNNN_partial_25_0402
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_25_0400_0402 : Poly :=
[
  term ((-1026212231157919703 : Rat) / 208877130852768) [(0, 1), (12, 1), (15, 2)],
  term ((197 : Rat) / 42) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(0, 1), (12, 1), (16, 1)],
  term ((1026212231157919703 : Rat) / 417754261705536) [(0, 2), (15, 2)],
  term ((-197 : Rat) / 84) [(0, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (16, 1)],
  term ((-1026212231157919703 : Rat) / 208877130852768) [(1, 1), (13, 1), (15, 2)],
  term ((197 : Rat) / 42) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(1, 1), (13, 1), (16, 1)],
  term ((1026212231157919703 : Rat) / 417754261705536) [(1, 2), (15, 2)],
  term ((-197 : Rat) / 84) [(1, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 400 through 402. -/
theorem rs_R009_ueqv_R009YNNNN_block_25_0400_0402_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_25_0400_0402
      rs_R009_ueqv_R009YNNNN_block_25_0400_0402 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
