/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 11:0-3

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_11_0000_0003 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(2, 1), (10, 1)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (2 : Rat) [(3, 1), (11, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NN_coefficient_11_0000 : Poly :=
[
  term ((-1714 : Rat) / 134037) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R003_ueqv_R003NN_partial_11_0000 : Poly :=
[
  term ((3428 : Rat) / 134037) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 134037) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 134037) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 134037) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 134037) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R003_ueqv_R003NN_partial_11_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_11_0000
        rs_R003_ueqv_R003NN_generator_11_0000_0003 =
      rs_R003_ueqv_R003NN_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NN_coefficient_11_0001 : Poly :=
[
  term ((199667 : Rat) / 268074) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R003_ueqv_R003NN_partial_11_0001 : Poly :=
[
  term ((-199667 : Rat) / 134037) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R003_ueqv_R003NN_partial_11_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_11_0001
        rs_R003_ueqv_R003NN_generator_11_0000_0003 =
      rs_R003_ueqv_R003NN_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NN_coefficient_11_0002 : Poly :=
[
  term ((-1714 : Rat) / 44679) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R003_ueqv_R003NN_partial_11_0002 : Poly :=
[
  term ((3428 : Rat) / 44679) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R003_ueqv_R003NN_partial_11_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_11_0002
        rs_R003_ueqv_R003NN_generator_11_0000_0003 =
      rs_R003_ueqv_R003NN_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NN_coefficient_11_0003 : Poly :=
[
  term ((-17801 : Rat) / 89358) [(15, 2), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R003_ueqv_R003NN_partial_11_0003 : Poly :=
[
  term ((17801 : Rat) / 44679) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-17801 : Rat) / 44679) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((17801 : Rat) / 44679) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-17801 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17801 : Rat) / 89358) [(4, 2), (15, 2), (16, 1)],
  term ((-17801 : Rat) / 89358) [(5, 2), (15, 2), (16, 1)],
  term ((17801 : Rat) / 89358) [(10, 2), (15, 2), (16, 1)],
  term ((17801 : Rat) / 89358) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R003_ueqv_R003NN_partial_11_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_11_0003
        rs_R003_ueqv_R003NN_generator_11_0000_0003 =
      rs_R003_ueqv_R003NN_partial_11_0003 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_11_0000_0003 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_11_0000,
  rs_R003_ueqv_R003NN_partial_11_0001,
  rs_R003_ueqv_R003NN_partial_11_0002,
  rs_R003_ueqv_R003NN_partial_11_0003
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_11_0000_0003 : Poly :=
[
  term ((3428 : Rat) / 134037) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 134037) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 134037) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 134037) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 134037) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((17801 : Rat) / 44679) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17801 : Rat) / 44679) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((17801 : Rat) / 44679) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17801 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((199667 : Rat) / 268074) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-17801 : Rat) / 89358) [(4, 2), (15, 2), (16, 1)],
  term ((-199667 : Rat) / 268074) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-17801 : Rat) / 89358) [(5, 2), (15, 2), (16, 1)],
  term ((199667 : Rat) / 268074) [(5, 3), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((17801 : Rat) / 89358) [(10, 2), (15, 2), (16, 1)],
  term ((17801 : Rat) / 89358) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 3. -/
theorem rs_R003_ueqv_R003NN_block_11_0000_0003_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_11_0000_0003
      rs_R003_ueqv_R003NN_block_11_0000_0003 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
