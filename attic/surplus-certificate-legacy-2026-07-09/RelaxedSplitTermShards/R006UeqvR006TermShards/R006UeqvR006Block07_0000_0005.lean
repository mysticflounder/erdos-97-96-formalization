/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 7:0-5

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_07_0000_0005 : Poly :=
[
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R006_ueqv_R006_coefficient_07_0000 : Poly :=
[
  term ((6 : Rat) / 5) []
]

/-- Partial product 0 for generator 7. -/
def rs_R006_ueqv_R006_partial_07_0000 : Poly :=
[
  term ((12 : Rat) / 5) [(0, 1), (4, 1)],
  term ((12 : Rat) / 5) [(1, 1), (5, 1)],
  term ((-6 : Rat) / 5) [(4, 2)],
  term ((-6 : Rat) / 5) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R006_ueqv_R006_partial_07_0000_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_07_0000
        rs_R006_ueqv_R006_generator_07_0000_0005 =
      rs_R006_ueqv_R006_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R006_ueqv_R006_coefficient_07_0001 : Poly :=
[
  term ((-12 : Rat) / 5) [(2, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R006_ueqv_R006_partial_07_0001 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (2, 1), (4, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (2, 1), (5, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 2)],
  term ((12 : Rat) / 5) [(2, 1), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R006_ueqv_R006_partial_07_0001_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_07_0001
        rs_R006_ueqv_R006_generator_07_0000_0005 =
      rs_R006_ueqv_R006_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R006_ueqv_R006_coefficient_07_0002 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (14, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R006_ueqv_R006_partial_07_0002 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (4, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R006_ueqv_R006_partial_07_0002_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_07_0002
        rs_R006_ueqv_R006_generator_07_0000_0005 =
      rs_R006_ueqv_R006_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R006_ueqv_R006_coefficient_07_0003 : Poly :=
[
  term ((72 : Rat) / 35) [(9, 1), (13, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R006_ueqv_R006_partial_07_0003 : Poly :=
[
  term ((144 : Rat) / 35) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(4, 2), (9, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R006_ueqv_R006_partial_07_0003_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_07_0003
        rs_R006_ueqv_R006_generator_07_0000_0005 =
      rs_R006_ueqv_R006_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R006_ueqv_R006_coefficient_07_0004 : Poly :=
[
  term ((-72 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R006_ueqv_R006_partial_07_0004 : Poly :=
[
  term ((-144 : Rat) / 35) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((72 : Rat) / 35) [(4, 2), (11, 1), (13, 1)],
  term ((72 : Rat) / 35) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R006_ueqv_R006_partial_07_0004_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_07_0004
        rs_R006_ueqv_R006_generator_07_0000_0005 =
      rs_R006_ueqv_R006_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R006_ueqv_R006_coefficient_07_0005 : Poly :=
[
  term ((-12 : Rat) / 5) [(14, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R006_ueqv_R006_partial_07_0005 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (4, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (5, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 2), (14, 1)],
  term ((12 : Rat) / 5) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R006_ueqv_R006_partial_07_0005_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_07_0005
        rs_R006_ueqv_R006_generator_07_0000_0005 =
      rs_R006_ueqv_R006_partial_07_0005 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_07_0000_0005 : List Poly :=
[
  rs_R006_ueqv_R006_partial_07_0000,
  rs_R006_ueqv_R006_partial_07_0001,
  rs_R006_ueqv_R006_partial_07_0002,
  rs_R006_ueqv_R006_partial_07_0003,
  rs_R006_ueqv_R006_partial_07_0004,
  rs_R006_ueqv_R006_partial_07_0005
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_07_0000_0005 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (2, 1), (4, 1)],
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (4, 1), (14, 1)],
  term ((12 : Rat) / 5) [(0, 1), (4, 1)],
  term ((144 : Rat) / 35) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (4, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (2, 1), (5, 1)],
  term ((48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((12 : Rat) / 5) [(1, 1), (5, 1)],
  term ((144 : Rat) / 35) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (5, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 2)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 2), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (5, 2)],
  term ((-24 : Rat) / 5) [(2, 1), (5, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(4, 2)],
  term ((-72 : Rat) / 35) [(4, 2), (9, 1), (13, 1)],
  term ((72 : Rat) / 35) [(4, 2), (11, 1), (13, 1)],
  term ((12 : Rat) / 5) [(4, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(5, 2)],
  term ((-72 : Rat) / 35) [(5, 2), (9, 1), (13, 1)],
  term ((72 : Rat) / 35) [(5, 2), (11, 1), (13, 1)],
  term ((12 : Rat) / 5) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 5. -/
theorem rs_R006_ueqv_R006_block_07_0000_0005_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_07_0000_0005
      rs_R006_ueqv_R006_block_07_0000_0005 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
