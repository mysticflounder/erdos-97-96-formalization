/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 6:0-2

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 6 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_06_0000_0002 : Poly :=
[
  term (-1 : Rat) [],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYYY_coefficient_06_0000 : Poly :=
[
  term (-4 : Rat) [(3, 1), (15, 1)]
]

/-- Partial product 0 for generator 6. -/
def rs_R009_ueqv_R009NYYYY_partial_06_0000 : Poly :=
[
  term (-4 : Rat) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 6. -/
theorem rs_R009_ueqv_R009NYYYY_partial_06_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_06_0000
        rs_R009_ueqv_R009NYYYY_generator_06_0000_0002 =
      rs_R009_ueqv_R009NYYYY_partial_06_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYYY_coefficient_06_0001 : Poly :=
[
  term (16 : Rat) [(5, 1), (15, 1)]
]

/-- Partial product 1 for generator 6. -/
def rs_R009_ueqv_R009NYYYY_partial_06_0001 : Poly :=
[
  term (16 : Rat) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 6. -/
theorem rs_R009_ueqv_R009NYYYY_partial_06_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_06_0001
        rs_R009_ueqv_R009NYYYY_generator_06_0000_0002 =
      rs_R009_ueqv_R009NYYYY_partial_06_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYYY_coefficient_06_0002 : Poly :=
[
  term (-8 : Rat) [(15, 2)]
]

/-- Partial product 2 for generator 6. -/
def rs_R009_ueqv_R009NYYYY_partial_06_0002 : Poly :=
[
  term (-8 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 6. -/
theorem rs_R009_ueqv_R009NYYYY_partial_06_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_06_0002
        rs_R009_ueqv_R009NYYYY_generator_06_0000_0002 =
      rs_R009_ueqv_R009NYYYY_partial_06_0002 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_06_0000_0002 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_06_0000,
  rs_R009_ueqv_R009NYYYY_partial_06_0001,
  rs_R009_ueqv_R009NYYYY_partial_06_0002
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_06_0000_0002 : Poly :=
[
  term (-4 : Rat) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (15, 1)],
  term (-16 : Rat) [(5, 1), (15, 1)],
  term (8 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 0 through 2. -/
theorem rs_R009_ueqv_R009NYYYY_block_06_0000_0002_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_06_0000_0002
      rs_R009_ueqv_R009NYYYY_block_06_0000_0002 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
