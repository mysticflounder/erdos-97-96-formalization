/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 8:100-104

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_08_0100_0104 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 8. -/
def rs_R007_ueqv_R007NY_coefficient_08_0100 : Poly :=
[
  term ((853184930683210785371 : Rat) / 209954048239920928846) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 8. -/
def rs_R007_ueqv_R007NY_partial_08_0100 : Poly :=
[
  term ((853184930683210785371 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((853184930683210785371 : Rat) / 104977024119960464423) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-853184930683210785371 : Rat) / 209954048239920928846) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-853184930683210785371 : Rat) / 209954048239920928846) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 8. -/
theorem rs_R007_ueqv_R007NY_partial_08_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_08_0100
        rs_R007_ueqv_R007NY_generator_08_0100_0104 =
      rs_R007_ueqv_R007NY_partial_08_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 8. -/
def rs_R007_ueqv_R007NY_coefficient_08_0101 : Poly :=
[
  term ((31331820499635555574387 : Rat) / 629862144719762786538) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 8. -/
def rs_R007_ueqv_R007NY_partial_08_0101 : Poly :=
[
  term ((31331820499635555574387 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((31331820499635555574387 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31331820499635555574387 : Rat) / 629862144719762786538) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-31331820499635555574387 : Rat) / 629862144719762786538) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 8. -/
theorem rs_R007_ueqv_R007NY_partial_08_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_08_0101
        rs_R007_ueqv_R007NY_generator_08_0100_0104 =
      rs_R007_ueqv_R007NY_partial_08_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 8. -/
def rs_R007_ueqv_R007NY_coefficient_08_0102 : Poly :=
[
  term ((-3765799809908842777799059 : Rat) / 2519448578879051146152) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 8. -/
def rs_R007_ueqv_R007NY_partial_08_0102 : Poly :=
[
  term ((-3765799809908842777799059 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3765799809908842777799059 : Rat) / 1259724289439525573076) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((3765799809908842777799059 : Rat) / 2519448578879051146152) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((3765799809908842777799059 : Rat) / 2519448578879051146152) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 8. -/
theorem rs_R007_ueqv_R007NY_partial_08_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_08_0102
        rs_R007_ueqv_R007NY_generator_08_0100_0104 =
      rs_R007_ueqv_R007NY_partial_08_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 8. -/
def rs_R007_ueqv_R007NY_coefficient_08_0103 : Poly :=
[
  term (1 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 103 for generator 8. -/
def rs_R007_ueqv_R007NY_partial_08_0103 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 8. -/
theorem rs_R007_ueqv_R007NY_partial_08_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_08_0103
        rs_R007_ueqv_R007NY_generator_08_0100_0104 =
      rs_R007_ueqv_R007NY_partial_08_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 8. -/
def rs_R007_ueqv_R007NY_coefficient_08_0104 : Poly :=
[
  term ((40462269399955078468915 : Rat) / 629862144719762786538) [(15, 2), (16, 1)]
]

/-- Partial product 104 for generator 8. -/
def rs_R007_ueqv_R007NY_partial_08_0104 : Poly :=
[
  term ((40462269399955078468915 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((40462269399955078468915 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-40462269399955078468915 : Rat) / 629862144719762786538) [(6, 2), (15, 2), (16, 1)],
  term ((-40462269399955078468915 : Rat) / 629862144719762786538) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 8. -/
theorem rs_R007_ueqv_R007NY_partial_08_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_08_0104
        rs_R007_ueqv_R007NY_generator_08_0100_0104 =
      rs_R007_ueqv_R007NY_partial_08_0104 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_08_0100_0104 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_08_0100,
  rs_R007_ueqv_R007NY_partial_08_0101,
  rs_R007_ueqv_R007NY_partial_08_0102,
  rs_R007_ueqv_R007NY_partial_08_0103,
  rs_R007_ueqv_R007NY_partial_08_0104
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_08_0100_0104 : Poly :=
[
  term ((853184930683210785371 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31331820499635555574387 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3765799809908842777799059 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((40462269399955078468915 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((853184930683210785371 : Rat) / 104977024119960464423) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31331820499635555574387 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3765799809908842777799059 : Rat) / 1259724289439525573076) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((40462269399955078468915 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-853184930683210785371 : Rat) / 209954048239920928846) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31331820499635555574387 : Rat) / 629862144719762786538) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((3765799809908842777799059 : Rat) / 2519448578879051146152) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(6, 2), (14, 1), (16, 1)],
  term ((-40462269399955078468915 : Rat) / 629862144719762786538) [(6, 2), (15, 2), (16, 1)],
  term ((-853184930683210785371 : Rat) / 209954048239920928846) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31331820499635555574387 : Rat) / 629862144719762786538) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3765799809908842777799059 : Rat) / 2519448578879051146152) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((-40462269399955078468915 : Rat) / 629862144719762786538) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 100 through 104. -/
theorem rs_R007_ueqv_R007NY_block_08_0100_0104_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_08_0100_0104
      rs_R007_ueqv_R007NY_block_08_0100_0104 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
