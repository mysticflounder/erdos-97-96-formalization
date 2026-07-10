/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 7:0-7

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_07_0000_0007 : Poly :=
[
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003YY_coefficient_07_0000 : Poly :=
[
  term ((6 : Rat) / 5) []
]

/-- Partial product 0 for generator 7. -/
def rs_R003_ueqv_R003YY_partial_07_0000 : Poly :=
[
  term ((12 : Rat) / 5) [(0, 1), (4, 1)],
  term ((12 : Rat) / 5) [(1, 1), (5, 1)],
  term ((-6 : Rat) / 5) [(4, 2)],
  term ((-6 : Rat) / 5) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R003_ueqv_R003YY_partial_07_0000_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_07_0000
        rs_R003_ueqv_R003YY_generator_07_0000_0007 =
      rs_R003_ueqv_R003YY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003YY_coefficient_07_0001 : Poly :=
[
  term ((-12 : Rat) / 5) [(2, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R003_ueqv_R003YY_partial_07_0001 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (2, 1), (4, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (2, 1), (5, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 2)],
  term ((12 : Rat) / 5) [(2, 1), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R003_ueqv_R003YY_partial_07_0001_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_07_0001
        rs_R003_ueqv_R003YY_generator_07_0000_0007 =
      rs_R003_ueqv_R003YY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003YY_coefficient_07_0002 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (14, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R003_ueqv_R003YY_partial_07_0002 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (4, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R003_ueqv_R003YY_partial_07_0002_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_07_0002
        rs_R003_ueqv_R003YY_generator_07_0000_0007 =
      rs_R003_ueqv_R003YY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003YY_coefficient_07_0003 : Poly :=
[
  term ((-36864 : Rat) / 7625) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R003_ueqv_R003YY_partial_07_0003 : Poly :=
[
  term ((-73728 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R003_ueqv_R003YY_partial_07_0003_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_07_0003
        rs_R003_ueqv_R003YY_generator_07_0000_0007 =
      rs_R003_ueqv_R003YY_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003YY_coefficient_07_0004 : Poly :=
[
  term ((36864 : Rat) / 7625) [(4, 1), (13, 2)]
]

/-- Partial product 4 for generator 7. -/
def rs_R003_ueqv_R003YY_partial_07_0004 : Poly :=
[
  term ((73728 : Rat) / 7625) [(0, 1), (4, 2), (13, 2)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (13, 2)],
  term ((-36864 : Rat) / 7625) [(4, 1), (5, 2), (13, 2)],
  term ((-36864 : Rat) / 7625) [(4, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R003_ueqv_R003YY_partial_07_0004_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_07_0004
        rs_R003_ueqv_R003YY_generator_07_0000_0007 =
      rs_R003_ueqv_R003YY_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003YY_coefficient_07_0005 : Poly :=
[
  term ((27264 : Rat) / 7625) [(9, 1), (13, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R003_ueqv_R003YY_partial_07_0005 : Poly :=
[
  term ((54528 : Rat) / 7625) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R003_ueqv_R003YY_partial_07_0005_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_07_0005
        rs_R003_ueqv_R003YY_generator_07_0000_0007 =
      rs_R003_ueqv_R003YY_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003YY_coefficient_07_0006 : Poly :=
[
  term ((-27264 : Rat) / 7625) [(13, 2)]
]

/-- Partial product 6 for generator 7. -/
def rs_R003_ueqv_R003YY_partial_07_0006 : Poly :=
[
  term ((-54528 : Rat) / 7625) [(0, 1), (4, 1), (13, 2)],
  term ((-54528 : Rat) / 7625) [(1, 1), (5, 1), (13, 2)],
  term ((27264 : Rat) / 7625) [(4, 2), (13, 2)],
  term ((27264 : Rat) / 7625) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R003_ueqv_R003YY_partial_07_0006_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_07_0006
        rs_R003_ueqv_R003YY_generator_07_0000_0007 =
      rs_R003_ueqv_R003YY_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003YY_coefficient_07_0007 : Poly :=
[
  term ((-12 : Rat) / 5) [(14, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R003_ueqv_R003YY_partial_07_0007 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (4, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (5, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 2), (14, 1)],
  term ((12 : Rat) / 5) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R003_ueqv_R003YY_partial_07_0007_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_07_0007
        rs_R003_ueqv_R003YY_generator_07_0000_0007 =
      rs_R003_ueqv_R003YY_partial_07_0007 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_07_0000_0007 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_07_0000,
  rs_R003_ueqv_R003YY_partial_07_0001,
  rs_R003_ueqv_R003YY_partial_07_0002,
  rs_R003_ueqv_R003YY_partial_07_0003,
  rs_R003_ueqv_R003YY_partial_07_0004,
  rs_R003_ueqv_R003YY_partial_07_0005,
  rs_R003_ueqv_R003YY_partial_07_0006,
  rs_R003_ueqv_R003YY_partial_07_0007
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_07_0000_0007 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (2, 1), (4, 1)],
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (4, 1), (14, 1)],
  term ((12 : Rat) / 5) [(0, 1), (4, 1)],
  term ((54528 : Rat) / 7625) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((-54528 : Rat) / 7625) [(0, 1), (4, 1), (13, 2)],
  term ((-24 : Rat) / 5) [(0, 1), (4, 1), (14, 1)],
  term ((-73728 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(0, 1), (4, 2), (13, 2)],
  term ((-24 : Rat) / 5) [(1, 1), (2, 1), (5, 1)],
  term ((48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((73728 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (13, 2)],
  term ((12 : Rat) / 5) [(1, 1), (5, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-54528 : Rat) / 7625) [(1, 1), (5, 1), (13, 2)],
  term ((-24 : Rat) / 5) [(1, 1), (5, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 2)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 2), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (5, 2)],
  term ((-24 : Rat) / 5) [(2, 1), (5, 2), (14, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 1), (5, 2), (13, 2)],
  term ((-6 : Rat) / 5) [(4, 2)],
  term ((-27264 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)],
  term ((27264 : Rat) / 7625) [(4, 2), (13, 2)],
  term ((12 : Rat) / 5) [(4, 2), (14, 1)],
  term ((36864 : Rat) / 7625) [(4, 3), (9, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(4, 3), (13, 2)],
  term ((-6 : Rat) / 5) [(5, 2)],
  term ((-27264 : Rat) / 7625) [(5, 2), (9, 1), (13, 1)],
  term ((27264 : Rat) / 7625) [(5, 2), (13, 2)],
  term ((12 : Rat) / 5) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 7. -/
theorem rs_R003_ueqv_R003YY_block_07_0000_0007_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_07_0000_0007
      rs_R003_ueqv_R003YY_block_07_0000_0007 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
