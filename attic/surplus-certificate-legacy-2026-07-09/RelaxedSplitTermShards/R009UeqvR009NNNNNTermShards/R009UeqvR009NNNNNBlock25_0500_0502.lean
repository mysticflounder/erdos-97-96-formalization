/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 25:500-502

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_25_0500_0502 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNN_coefficient_25_0500 : Poly :=
[
  term ((-17270 : Rat) / 589) [(14, 2), (16, 1)]
]

/-- Partial product 500 for generator 25. -/
def rs_R009_ueqv_R009NNNNN_partial_25_0500 : Poly :=
[
  term ((34540 : Rat) / 589) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-17270 : Rat) / 589) [(0, 2), (14, 2), (16, 1)],
  term ((34540 : Rat) / 589) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17270 : Rat) / 589) [(1, 2), (14, 2), (16, 1)],
  term ((-34540 : Rat) / 589) [(12, 1), (14, 2), (16, 1)],
  term ((17270 : Rat) / 589) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNN_partial_25_0500_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_25_0500
        rs_R009_ueqv_R009NNNNN_generator_25_0500_0502 =
      rs_R009_ueqv_R009NNNNN_partial_25_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNN_coefficient_25_0501 : Poly :=
[
  term ((-88234 : Rat) / 1767) [(15, 2), (16, 1)]
]

/-- Partial product 501 for generator 25. -/
def rs_R009_ueqv_R009NNNNN_partial_25_0501 : Poly :=
[
  term ((176468 : Rat) / 1767) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-88234 : Rat) / 1767) [(0, 2), (15, 2), (16, 1)],
  term ((176468 : Rat) / 1767) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88234 : Rat) / 1767) [(1, 2), (15, 2), (16, 1)],
  term ((-176468 : Rat) / 1767) [(12, 1), (15, 2), (16, 1)],
  term ((88234 : Rat) / 1767) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNN_partial_25_0501_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_25_0501
        rs_R009_ueqv_R009NNNNN_generator_25_0500_0502 =
      rs_R009_ueqv_R009NNNNN_partial_25_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNN_coefficient_25_0502 : Poly :=
[
  term ((117927 : Rat) / 2356) [(15, 4), (16, 1)]
]

/-- Partial product 502 for generator 25. -/
def rs_R009_ueqv_R009NNNNN_partial_25_0502 : Poly :=
[
  term ((-117927 : Rat) / 1178) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((117927 : Rat) / 2356) [(0, 2), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 1178) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((117927 : Rat) / 2356) [(1, 2), (15, 4), (16, 1)],
  term ((117927 : Rat) / 1178) [(12, 1), (15, 4), (16, 1)],
  term ((-117927 : Rat) / 2356) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNN_partial_25_0502_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_25_0502
        rs_R009_ueqv_R009NNNNN_generator_25_0500_0502 =
      rs_R009_ueqv_R009NNNNN_partial_25_0502 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_25_0500_0502 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_25_0500,
  rs_R009_ueqv_R009NNNNN_partial_25_0501,
  rs_R009_ueqv_R009NNNNN_partial_25_0502
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_25_0500_0502 : Poly :=
[
  term ((34540 : Rat) / 589) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((176468 : Rat) / 1767) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 1178) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((-17270 : Rat) / 589) [(0, 2), (14, 2), (16, 1)],
  term ((-88234 : Rat) / 1767) [(0, 2), (15, 2), (16, 1)],
  term ((117927 : Rat) / 2356) [(0, 2), (15, 4), (16, 1)],
  term ((34540 : Rat) / 589) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((176468 : Rat) / 1767) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-117927 : Rat) / 1178) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((-17270 : Rat) / 589) [(1, 2), (14, 2), (16, 1)],
  term ((-88234 : Rat) / 1767) [(1, 2), (15, 2), (16, 1)],
  term ((117927 : Rat) / 2356) [(1, 2), (15, 4), (16, 1)],
  term ((-34540 : Rat) / 589) [(12, 1), (14, 2), (16, 1)],
  term ((-176468 : Rat) / 1767) [(12, 1), (15, 2), (16, 1)],
  term ((117927 : Rat) / 1178) [(12, 1), (15, 4), (16, 1)],
  term ((17270 : Rat) / 589) [(14, 2), (16, 1)],
  term ((88234 : Rat) / 1767) [(15, 2), (16, 1)],
  term ((-117927 : Rat) / 2356) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 500 through 502. -/
theorem rs_R009_ueqv_R009NNNNN_block_25_0500_0502_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_25_0500_0502
      rs_R009_ueqv_R009NNNNN_block_25_0500_0502 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
