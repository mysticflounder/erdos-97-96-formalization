/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 14:0-5

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_14_0000_0005 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003YY_coefficient_14_0000 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 0 for generator 14. -/
def rs_R003_ueqv_R003YY_partial_14_0000 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 1), (7, 1), (11, 2), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R003_ueqv_R003YY_partial_14_0000_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_14_0000
        rs_R003_ueqv_R003YY_generator_14_0000_0005 =
      rs_R003_ueqv_R003YY_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003YY_coefficient_14_0001 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R003_ueqv_R003YY_partial_14_0001 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R003_ueqv_R003YY_partial_14_0001_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_14_0001
        rs_R003_ueqv_R003YY_generator_14_0000_0005 =
      rs_R003_ueqv_R003YY_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003YY_coefficient_14_0002 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 1), (13, 2)]
]

/-- Partial product 2 for generator 14. -/
def rs_R003_ueqv_R003YY_partial_14_0002 : Poly :=
[
  term ((82944 : Rat) / 7625) [(2, 1), (4, 2), (13, 2)],
  term ((-41472 : Rat) / 7625) [(2, 2), (4, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(3, 2), (4, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (11, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 1), (10, 2), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 1), (11, 2), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R003_ueqv_R003YY_partial_14_0002_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_14_0002
        rs_R003_ueqv_R003YY_generator_14_0000_0005 =
      rs_R003_ueqv_R003YY_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003YY_coefficient_14_0003 : Poly :=
[
  term ((-2736 : Rat) / 7625) [(7, 1), (13, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R003_ueqv_R003YY_partial_14_0003 : Poly :=
[
  term ((5472 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-2736 : Rat) / 7625) [(2, 2), (7, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-2736 : Rat) / 7625) [(3, 2), (7, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((2736 : Rat) / 7625) [(7, 1), (10, 2), (13, 1)],
  term ((2736 : Rat) / 7625) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R003_ueqv_R003YY_partial_14_0003_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_14_0003
        rs_R003_ueqv_R003YY_generator_14_0000_0005 =
      rs_R003_ueqv_R003YY_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003YY_coefficient_14_0004 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(9, 1), (13, 1)]
]

/-- Partial product 4 for generator 14. -/
def rs_R003_ueqv_R003YY_partial_14_0004 : Poly :=
[
  term ((10944 : Rat) / 7625) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(2, 2), (9, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(3, 2), (9, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(9, 1), (10, 2), (13, 1)],
  term ((5472 : Rat) / 7625) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R003_ueqv_R003YY_partial_14_0004_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_14_0004
        rs_R003_ueqv_R003YY_generator_14_0000_0005 =
      rs_R003_ueqv_R003YY_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003YY_coefficient_14_0005 : Poly :=
[
  term ((8208 : Rat) / 7625) [(13, 2)]
]

/-- Partial product 5 for generator 14. -/
def rs_R003_ueqv_R003YY_partial_14_0005 : Poly :=
[
  term ((-16416 : Rat) / 7625) [(2, 1), (4, 1), (13, 2)],
  term ((8208 : Rat) / 7625) [(2, 2), (13, 2)],
  term ((-16416 : Rat) / 7625) [(3, 1), (5, 1), (13, 2)],
  term ((8208 : Rat) / 7625) [(3, 2), (13, 2)],
  term ((16416 : Rat) / 7625) [(4, 1), (10, 1), (13, 2)],
  term ((16416 : Rat) / 7625) [(5, 1), (11, 1), (13, 2)],
  term ((-8208 : Rat) / 7625) [(10, 2), (13, 2)],
  term ((-8208 : Rat) / 7625) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R003_ueqv_R003YY_partial_14_0005_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_14_0005
        rs_R003_ueqv_R003YY_generator_14_0000_0005 =
      rs_R003_ueqv_R003YY_partial_14_0005 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_14_0000_0005 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_14_0000,
  rs_R003_ueqv_R003YY_partial_14_0001,
  rs_R003_ueqv_R003YY_partial_14_0002,
  rs_R003_ueqv_R003YY_partial_14_0003,
  rs_R003_ueqv_R003YY_partial_14_0004,
  rs_R003_ueqv_R003YY_partial_14_0005
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_14_0000_0005 : Poly :=
[
  term ((5472 : Rat) / 7625) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-16416 : Rat) / 7625) [(2, 1), (4, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(2, 1), (4, 2), (13, 2)],
  term ((13824 : Rat) / 7625) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(2, 2), (4, 1), (13, 2)],
  term ((-2736 : Rat) / 7625) [(2, 2), (7, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(2, 2), (9, 1), (13, 1)],
  term ((8208 : Rat) / 7625) [(2, 2), (13, 2)],
  term ((-27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((5472 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-16416 : Rat) / 7625) [(3, 1), (5, 1), (13, 2)],
  term ((13824 : Rat) / 7625) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(3, 2), (4, 1), (13, 2)],
  term ((-2736 : Rat) / 7625) [(3, 2), (7, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(3, 2), (9, 1), (13, 1)],
  term ((8208 : Rat) / 7625) [(3, 2), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (11, 1), (13, 2)],
  term ((-5472 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 1), (7, 1), (11, 2), (13, 1)],
  term ((-10944 : Rat) / 7625) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((16416 : Rat) / 7625) [(4, 1), (10, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 1), (10, 2), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 1), (11, 2), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)],
  term ((-5472 : Rat) / 7625) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((16416 : Rat) / 7625) [(5, 1), (11, 1), (13, 2)],
  term ((2736 : Rat) / 7625) [(7, 1), (10, 2), (13, 1)],
  term ((2736 : Rat) / 7625) [(7, 1), (11, 2), (13, 1)],
  term ((5472 : Rat) / 7625) [(9, 1), (10, 2), (13, 1)],
  term ((5472 : Rat) / 7625) [(9, 1), (11, 2), (13, 1)],
  term ((-8208 : Rat) / 7625) [(10, 2), (13, 2)],
  term ((-8208 : Rat) / 7625) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 5. -/
theorem rs_R003_ueqv_R003YY_block_14_0000_0005_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_14_0000_0005
      rs_R003_ueqv_R003YY_block_14_0000_0005 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
