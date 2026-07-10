/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 19:0-0

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_19_0000_0000 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (8, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def rs_R006_ueqv_R006_coefficient_19_0000 : Poly :=
[
  term ((-36 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 0 for generator 19. -/
def rs_R006_ueqv_R006_partial_19_0000 : Poly :=
[
  term ((72 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-36 : Rat) / 35) [(0, 2), (11, 1), (13, 1)],
  term ((72 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-36 : Rat) / 35) [(1, 2), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 35) [(2, 2), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 35) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem rs_R006_ueqv_R006_partial_19_0000_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_19_0000
        rs_R006_ueqv_R006_generator_19_0000_0000 =
      rs_R006_ueqv_R006_partial_19_0000 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_19_0000_0000 : List Poly :=
[
  rs_R006_ueqv_R006_partial_19_0000
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_19_0000_0000 : Poly :=
[
  term ((72 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-36 : Rat) / 35) [(0, 2), (11, 1), (13, 1)],
  term ((72 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-36 : Rat) / 35) [(1, 2), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 35) [(2, 2), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 35) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 0. -/
theorem rs_R006_ueqv_R006_block_19_0000_0000_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_19_0000_0000
      rs_R006_ueqv_R006_block_19_0000_0000 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
