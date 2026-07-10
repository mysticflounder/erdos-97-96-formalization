/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 8:0-1

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_08_0000_0001 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010NYY_coefficient_08_0000 : Poly :=
[
  term ((110434938465393 : Rat) / 121748482566784) [(10, 1), (16, 1)]
]

/-- Partial product 0 for generator 8. -/
def rs_R010_ueqv_R010NYY_partial_08_0000 : Poly :=
[
  term ((110434938465393 : Rat) / 60874241283392) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 60874241283392) [(0, 1), (10, 1), (16, 1)],
  term ((110434938465393 : Rat) / 60874241283392) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 121748482566784) [(4, 2), (10, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 121748482566784) [(5, 2), (10, 1), (16, 1)],
  term ((110434938465393 : Rat) / 121748482566784) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 8. -/
theorem rs_R010_ueqv_R010NYY_partial_08_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_08_0000
        rs_R010_ueqv_R010NYY_generator_08_0000_0001 =
      rs_R010_ueqv_R010NYY_partial_08_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010NYY_coefficient_08_0001 : Poly :=
[
  term ((-133262836908581 : Rat) / 852239377967488) [(16, 1)]
]

/-- Partial product 1 for generator 8. -/
def rs_R010_ueqv_R010NYY_partial_08_0001 : Poly :=
[
  term ((-133262836908581 : Rat) / 426119688983744) [(0, 1), (4, 1), (16, 1)],
  term ((133262836908581 : Rat) / 426119688983744) [(0, 1), (16, 1)],
  term ((-133262836908581 : Rat) / 426119688983744) [(1, 1), (5, 1), (16, 1)],
  term ((133262836908581 : Rat) / 852239377967488) [(4, 2), (16, 1)],
  term ((133262836908581 : Rat) / 852239377967488) [(5, 2), (16, 1)],
  term ((-133262836908581 : Rat) / 852239377967488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 8. -/
theorem rs_R010_ueqv_R010NYY_partial_08_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_08_0001
        rs_R010_ueqv_R010NYY_generator_08_0000_0001 =
      rs_R010_ueqv_R010NYY_partial_08_0001 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_08_0000_0001 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_08_0000,
  rs_R010_ueqv_R010NYY_partial_08_0001
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_08_0000_0001 : Poly :=
[
  term ((110434938465393 : Rat) / 60874241283392) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-133262836908581 : Rat) / 426119688983744) [(0, 1), (4, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 60874241283392) [(0, 1), (10, 1), (16, 1)],
  term ((133262836908581 : Rat) / 426119688983744) [(0, 1), (16, 1)],
  term ((110434938465393 : Rat) / 60874241283392) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-133262836908581 : Rat) / 426119688983744) [(1, 1), (5, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 121748482566784) [(4, 2), (10, 1), (16, 1)],
  term ((133262836908581 : Rat) / 852239377967488) [(4, 2), (16, 1)],
  term ((-110434938465393 : Rat) / 121748482566784) [(5, 2), (10, 1), (16, 1)],
  term ((133262836908581 : Rat) / 852239377967488) [(5, 2), (16, 1)],
  term ((110434938465393 : Rat) / 121748482566784) [(10, 1), (16, 1)],
  term ((-133262836908581 : Rat) / 852239377967488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 0 through 1. -/
theorem rs_R010_ueqv_R010NYY_block_08_0000_0001_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_08_0000_0001
      rs_R010_ueqv_R010NYY_block_08_0000_0001 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
