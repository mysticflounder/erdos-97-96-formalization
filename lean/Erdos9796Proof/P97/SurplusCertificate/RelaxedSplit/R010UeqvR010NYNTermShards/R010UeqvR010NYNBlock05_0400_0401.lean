/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 5:400-401

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_05_0400_0401 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0400 : Poly :=
[
  term ((-102688 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 400 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0400 : Poly :=
[
  term ((205376 : Rat) / 2995) [(6, 1), (15, 2)],
  term ((-102688 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((-102688 : Rat) / 2995) [(7, 2), (15, 2)],
  term ((-205376 : Rat) / 2995) [(14, 1), (15, 2)],
  term ((102688 : Rat) / 2995) [(14, 2), (15, 2)],
  term ((102688 : Rat) / 2995) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0400_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0400
        rs_R010_ueqv_R010NYN_generator_05_0400_0401 =
      rs_R010_ueqv_R010NYN_partial_05_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0401 : Poly :=
[
  term ((33 : Rat) / 10) [(15, 2), (16, 1)]
]

/-- Partial product 401 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0401 : Poly :=
[
  term ((-33 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((33 : Rat) / 10) [(6, 2), (15, 2), (16, 1)],
  term ((33 : Rat) / 10) [(7, 2), (15, 2), (16, 1)],
  term ((33 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((-33 : Rat) / 10) [(14, 2), (15, 2), (16, 1)],
  term ((-33 : Rat) / 10) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0401_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0401
        rs_R010_ueqv_R010NYN_generator_05_0400_0401 =
      rs_R010_ueqv_R010NYN_partial_05_0401 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_05_0400_0401 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_05_0400,
  rs_R010_ueqv_R010NYN_partial_05_0401
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_05_0400_0401 : Poly :=
[
  term ((205376 : Rat) / 2995) [(6, 1), (15, 2)],
  term ((-33 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((-102688 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((33 : Rat) / 10) [(6, 2), (15, 2), (16, 1)],
  term ((-102688 : Rat) / 2995) [(7, 2), (15, 2)],
  term ((33 : Rat) / 10) [(7, 2), (15, 2), (16, 1)],
  term ((-205376 : Rat) / 2995) [(14, 1), (15, 2)],
  term ((33 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((102688 : Rat) / 2995) [(14, 2), (15, 2)],
  term ((-33 : Rat) / 10) [(14, 2), (15, 2), (16, 1)],
  term ((102688 : Rat) / 2995) [(15, 4)],
  term ((-33 : Rat) / 10) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 400 through 401. -/
theorem rs_R010_ueqv_R010NYN_block_05_0400_0401_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_05_0400_0401
      rs_R010_ueqv_R010NYN_block_05_0400_0401 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
