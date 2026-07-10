/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 4:500-502

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_04_0500_0502 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNN_coefficient_04_0500 : Poly :=
[
  term ((14339 : Rat) / 2356) [(15, 2), (16, 1)]
]

/-- Partial product 500 for generator 4. -/
def rs_R009_ueqv_R009NNNNN_partial_04_0500 : Poly :=
[
  term ((-14339 : Rat) / 1178) [(4, 1), (15, 2), (16, 1)],
  term ((14339 : Rat) / 2356) [(4, 2), (15, 2), (16, 1)],
  term ((14339 : Rat) / 2356) [(5, 2), (15, 2), (16, 1)],
  term ((14339 : Rat) / 1178) [(12, 1), (15, 2), (16, 1)],
  term ((-14339 : Rat) / 2356) [(12, 2), (15, 2), (16, 1)],
  term ((-14339 : Rat) / 2356) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNN_partial_04_0500_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_04_0500
        rs_R009_ueqv_R009NNNNN_generator_04_0500_0502 =
      rs_R009_ueqv_R009NNNNN_partial_04_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNN_coefficient_04_0501 : Poly :=
[
  term ((-117927 : Rat) / 2356) [(15, 4), (16, 1)]
]

/-- Partial product 501 for generator 4. -/
def rs_R009_ueqv_R009NNNNN_partial_04_0501 : Poly :=
[
  term ((117927 : Rat) / 1178) [(4, 1), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 2356) [(4, 2), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 2356) [(5, 2), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 1178) [(12, 1), (15, 4), (16, 1)],
  term ((117927 : Rat) / 2356) [(12, 2), (15, 4), (16, 1)],
  term ((117927 : Rat) / 2356) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNN_partial_04_0501_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_04_0501
        rs_R009_ueqv_R009NNNNN_generator_04_0500_0502 =
      rs_R009_ueqv_R009NNNNN_partial_04_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNN_coefficient_04_0502 : Poly :=
[
  term ((2769 : Rat) / 589) [(16, 1)]
]

/-- Partial product 502 for generator 4. -/
def rs_R009_ueqv_R009NNNNN_partial_04_0502 : Poly :=
[
  term ((-5538 : Rat) / 589) [(4, 1), (16, 1)],
  term ((2769 : Rat) / 589) [(4, 2), (16, 1)],
  term ((2769 : Rat) / 589) [(5, 2), (16, 1)],
  term ((5538 : Rat) / 589) [(12, 1), (16, 1)],
  term ((-2769 : Rat) / 589) [(12, 2), (16, 1)],
  term ((-2769 : Rat) / 589) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNN_partial_04_0502_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_04_0502
        rs_R009_ueqv_R009NNNNN_generator_04_0500_0502 =
      rs_R009_ueqv_R009NNNNN_partial_04_0502 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_04_0500_0502 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_04_0500,
  rs_R009_ueqv_R009NNNNN_partial_04_0501,
  rs_R009_ueqv_R009NNNNN_partial_04_0502
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_04_0500_0502 : Poly :=
[
  term ((-14339 : Rat) / 1178) [(4, 1), (15, 2), (16, 1)],
  term ((117927 : Rat) / 1178) [(4, 1), (15, 4), (16, 1)],
  term ((-5538 : Rat) / 589) [(4, 1), (16, 1)],
  term ((14339 : Rat) / 2356) [(4, 2), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 2356) [(4, 2), (15, 4), (16, 1)],
  term ((2769 : Rat) / 589) [(4, 2), (16, 1)],
  term ((14339 : Rat) / 2356) [(5, 2), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 2356) [(5, 2), (15, 4), (16, 1)],
  term ((2769 : Rat) / 589) [(5, 2), (16, 1)],
  term ((14339 : Rat) / 1178) [(12, 1), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 1178) [(12, 1), (15, 4), (16, 1)],
  term ((5538 : Rat) / 589) [(12, 1), (16, 1)],
  term ((-14339 : Rat) / 2356) [(12, 2), (15, 2), (16, 1)],
  term ((117927 : Rat) / 2356) [(12, 2), (15, 4), (16, 1)],
  term ((-2769 : Rat) / 589) [(12, 2), (16, 1)],
  term ((-14339 : Rat) / 2356) [(13, 2), (15, 2), (16, 1)],
  term ((117927 : Rat) / 2356) [(13, 2), (15, 4), (16, 1)],
  term ((-2769 : Rat) / 589) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 500 through 502. -/
theorem rs_R009_ueqv_R009NNNNN_block_04_0500_0502_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_04_0500_0502
      rs_R009_ueqv_R009NNNNN_block_04_0500_0502 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
