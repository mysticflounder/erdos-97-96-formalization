/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 9:0-6

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_09_0000_0006 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (14, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NYYNY_coefficient_09_0000 : Poly :=
[
  term (-2 : Rat) []
]

/-- Partial product 0 for generator 9. -/
def rs_R009_ueqv_R009NYYNY_partial_09_0000 : Poly :=
[
  term (4 : Rat) [(0, 1), (2, 1)],
  term (-4 : Rat) [(0, 1), (14, 1)],
  term (4 : Rat) [(1, 1), (3, 1)],
  term (-4 : Rat) [(1, 1), (15, 1)],
  term (-2 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 2)],
  term (2 : Rat) [(14, 2)],
  term (2 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R009_ueqv_R009NYYNY_partial_09_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_09_0000
        rs_R009_ueqv_R009NYYNY_generator_09_0000_0006 =
      rs_R009_ueqv_R009NYYNY_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NYYNY_coefficient_09_0001 : Poly :=
[
  term ((-3 : Rat) / 2) [(2, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R009_ueqv_R009NYYNY_partial_09_0001 : Poly :=
[
  term (-3 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (3 : Rat) [(0, 1), (2, 2)],
  term (3 : Rat) [(1, 1), (2, 1), (3, 1)],
  term (-3 : Rat) [(1, 1), (2, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (3, 2)],
  term ((3 : Rat) / 2) [(2, 1), (14, 2)],
  term ((3 : Rat) / 2) [(2, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R009_ueqv_R009NYYNY_partial_09_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_09_0001
        rs_R009_ueqv_R009NYYNY_generator_09_0000_0006 =
      rs_R009_ueqv_R009NYYNY_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NYYNY_coefficient_09_0002 : Poly :=
[
  term (-1 : Rat) [(3, 1), (7, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R009_ueqv_R009NYYNY_partial_09_0002 : Poly :=
[
  term (2 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term (-2 : Rat) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (2 : Rat) [(1, 1), (3, 2), (7, 1)],
  term (-1 : Rat) [(2, 2), (3, 1), (7, 1)],
  term (1 : Rat) [(3, 1), (7, 1), (14, 2)],
  term (1 : Rat) [(3, 1), (7, 1), (15, 2)],
  term (-1 : Rat) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R009_ueqv_R009NYYNY_partial_09_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_09_0002
        rs_R009_ueqv_R009NYYNY_generator_09_0000_0006 =
      rs_R009_ueqv_R009NYYNY_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NYYNY_coefficient_09_0003 : Poly :=
[
  term (2 : Rat) [(3, 1), (9, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R009_ueqv_R009NYYNY_partial_09_0003 : Poly :=
[
  term (-4 : Rat) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term (4 : Rat) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term (4 : Rat) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (3, 2), (9, 1)],
  term (2 : Rat) [(2, 2), (3, 1), (9, 1)],
  term (-2 : Rat) [(3, 1), (9, 1), (14, 2)],
  term (-2 : Rat) [(3, 1), (9, 1), (15, 2)],
  term (2 : Rat) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R009_ueqv_R009NYYNY_partial_09_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_09_0003
        rs_R009_ueqv_R009NYYNY_generator_09_0000_0006 =
      rs_R009_ueqv_R009NYYNY_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NYYNY_coefficient_09_0004 : Poly :=
[
  term (4 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R009_ueqv_R009NYYNY_partial_09_0004 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term (8 : Rat) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (4 : Rat) [(2, 2), (7, 1), (15, 1)],
  term (4 : Rat) [(3, 2), (7, 1), (15, 1)],
  term (-4 : Rat) [(7, 1), (14, 2), (15, 1)],
  term (-4 : Rat) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R009_ueqv_R009NYYNY_partial_09_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_09_0004
        rs_R009_ueqv_R009NYYNY_generator_09_0000_0006 =
      rs_R009_ueqv_R009NYYNY_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NYYNY_coefficient_09_0005 : Poly :=
[
  term (-8 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R009_ueqv_R009NYYNY_partial_09_0005 : Poly :=
[
  term (16 : Rat) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term (-16 : Rat) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term (-16 : Rat) [(1, 1), (9, 1), (15, 2)],
  term (-8 : Rat) [(2, 2), (9, 1), (15, 1)],
  term (-8 : Rat) [(3, 2), (9, 1), (15, 1)],
  term (8 : Rat) [(9, 1), (14, 2), (15, 1)],
  term (8 : Rat) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R009_ueqv_R009NYYNY_partial_09_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_09_0005
        rs_R009_ueqv_R009NYYNY_generator_09_0000_0006 =
      rs_R009_ueqv_R009NYYNY_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NYYNY_coefficient_09_0006 : Poly :=
[
  term (2 : Rat) [(14, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R009_ueqv_R009NYYNY_partial_09_0006 : Poly :=
[
  term (-4 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (4 : Rat) [(0, 1), (14, 2)],
  term (-4 : Rat) [(1, 1), (3, 1), (14, 1)],
  term (4 : Rat) [(1, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(2, 2), (14, 1)],
  term (2 : Rat) [(3, 2), (14, 1)],
  term (-2 : Rat) [(14, 1), (15, 2)],
  term (-2 : Rat) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R009_ueqv_R009NYYNY_partial_09_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_09_0006
        rs_R009_ueqv_R009NYYNY_generator_09_0000_0006 =
      rs_R009_ueqv_R009NYYNY_partial_09_0006 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_09_0000_0006 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_09_0000,
  rs_R009_ueqv_R009NYYNY_partial_09_0001,
  rs_R009_ueqv_R009NYYNY_partial_09_0002,
  rs_R009_ueqv_R009NYYNY_partial_09_0003,
  rs_R009_ueqv_R009NYYNY_partial_09_0004,
  rs_R009_ueqv_R009NYYNY_partial_09_0005,
  rs_R009_ueqv_R009NYYNY_partial_09_0006
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_09_0000_0006 : Poly :=
[
  term (4 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term (-4 : Rat) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term (-8 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term (16 : Rat) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term (-7 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (3 : Rat) [(0, 1), (2, 2)],
  term (-2 : Rat) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term (4 : Rat) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term (8 : Rat) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(0, 1), (14, 1)],
  term (4 : Rat) [(0, 1), (14, 2)],
  term (3 : Rat) [(1, 1), (2, 1), (3, 1)],
  term (-3 : Rat) [(1, 1), (2, 1), (15, 1)],
  term (4 : Rat) [(1, 1), (3, 1)],
  term (-10 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (20 : Rat) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (3, 1), (14, 1)],
  term (2 : Rat) [(1, 1), (3, 2), (7, 1)],
  term (-4 : Rat) [(1, 1), (3, 2), (9, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (-16 : Rat) [(1, 1), (9, 1), (15, 2)],
  term (4 : Rat) [(1, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (3, 2)],
  term ((3 : Rat) / 2) [(2, 1), (14, 2)],
  term ((3 : Rat) / 2) [(2, 1), (15, 2)],
  term (-2 : Rat) [(2, 2)],
  term (-1 : Rat) [(2, 2), (3, 1), (7, 1)],
  term (2 : Rat) [(2, 2), (3, 1), (9, 1)],
  term (4 : Rat) [(2, 2), (7, 1), (15, 1)],
  term (-8 : Rat) [(2, 2), (9, 1), (15, 1)],
  term (2 : Rat) [(2, 2), (14, 1)],
  term ((-3 : Rat) / 2) [(2, 3)],
  term (1 : Rat) [(3, 1), (7, 1), (14, 2)],
  term (1 : Rat) [(3, 1), (7, 1), (15, 2)],
  term (-2 : Rat) [(3, 1), (9, 1), (14, 2)],
  term (-2 : Rat) [(3, 1), (9, 1), (15, 2)],
  term (-2 : Rat) [(3, 2)],
  term (4 : Rat) [(3, 2), (7, 1), (15, 1)],
  term (-8 : Rat) [(3, 2), (9, 1), (15, 1)],
  term (2 : Rat) [(3, 2), (14, 1)],
  term (-1 : Rat) [(3, 3), (7, 1)],
  term (2 : Rat) [(3, 3), (9, 1)],
  term (-4 : Rat) [(7, 1), (14, 2), (15, 1)],
  term (-4 : Rat) [(7, 1), (15, 3)],
  term (8 : Rat) [(9, 1), (14, 2), (15, 1)],
  term (8 : Rat) [(9, 1), (15, 3)],
  term (-2 : Rat) [(14, 1), (15, 2)],
  term (2 : Rat) [(14, 2)],
  term (-2 : Rat) [(14, 3)],
  term (2 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 6. -/
theorem rs_R009_ueqv_R009NYYNY_block_09_0000_0006_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_09_0000_0006
      rs_R009_ueqv_R009NYYNY_block_09_0000_0006 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
