/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 13:0-0

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_13_0000_0000 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(4, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010NYY_coefficient_13_0000 : Poly :=
[
  term ((-9184513182051 : Rat) / 26632480561484) [(16, 1)]
]

/-- Partial product 0 for generator 13. -/
def rs_R010_ueqv_R010NYY_partial_13_0000 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(3, 1), (5, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(3, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(4, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem rs_R010_ueqv_R010NYY_partial_13_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_13_0000
        rs_R010_ueqv_R010NYY_generator_13_0000_0000 =
      rs_R010_ueqv_R010NYY_partial_13_0000 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_13_0000_0000 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_13_0000
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_13_0000_0000 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(3, 1), (5, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(3, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(4, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 0. -/
theorem rs_R010_ueqv_R010NYY_block_13_0000_0000_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_13_0000_0000
      rs_R010_ueqv_R010NYY_block_13_0000_0000 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
