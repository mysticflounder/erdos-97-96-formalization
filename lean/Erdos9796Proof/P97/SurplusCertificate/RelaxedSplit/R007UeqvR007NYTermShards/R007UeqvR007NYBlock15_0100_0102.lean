/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 15:100-102

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_15_0100_0102 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 15. -/
def rs_R007_ueqv_R007NY_coefficient_15_0100 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 15. -/
def rs_R007_ueqv_R007NY_partial_15_0100 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 3), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (14, 2), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(14, 2), (15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(14, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 15. -/
theorem rs_R007_ueqv_R007NY_partial_15_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_15_0100
        rs_R007_ueqv_R007NY_generator_15_0100_0102 =
      rs_R007_ueqv_R007NY_partial_15_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 15. -/
def rs_R007_ueqv_R007NY_coefficient_15_0101 : Poly :=
[
  term ((410580813842907734705065 : Rat) / 1259724289439525573076) [(15, 2), (16, 1)]
]

/-- Partial product 101 for generator 15. -/
def rs_R007_ueqv_R007NY_partial_15_0101 : Poly :=
[
  term ((-410580813842907734705065 : Rat) / 629862144719762786538) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((410580813842907734705065 : Rat) / 1259724289439525573076) [(2, 2), (15, 2), (16, 1)],
  term ((-410580813842907734705065 : Rat) / 629862144719762786538) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((410580813842907734705065 : Rat) / 1259724289439525573076) [(3, 2), (15, 2), (16, 1)],
  term ((410580813842907734705065 : Rat) / 629862144719762786538) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((410580813842907734705065 : Rat) / 629862144719762786538) [(5, 1), (15, 3), (16, 1)],
  term ((-410580813842907734705065 : Rat) / 1259724289439525573076) [(14, 2), (15, 2), (16, 1)],
  term ((-410580813842907734705065 : Rat) / 1259724289439525573076) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 15. -/
theorem rs_R007_ueqv_R007NY_partial_15_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_15_0101
        rs_R007_ueqv_R007NY_generator_15_0100_0102 =
      rs_R007_ueqv_R007NY_partial_15_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 15. -/
def rs_R007_ueqv_R007NY_coefficient_15_0102 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(15, 4), (16, 1)]
]

/-- Partial product 102 for generator 15. -/
def rs_R007_ueqv_R007NY_partial_15_0102 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 2), (15, 4), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 2), (15, 4), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 4), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (15, 5), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(14, 2), (15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 15. -/
theorem rs_R007_ueqv_R007NY_partial_15_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_15_0102
        rs_R007_ueqv_R007NY_generator_15_0100_0102 =
      rs_R007_ueqv_R007NY_partial_15_0102 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_15_0100_0102 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_15_0100,
  rs_R007_ueqv_R007NY_partial_15_0101,
  rs_R007_ueqv_R007NY_partial_15_0102
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_15_0100_0102 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-410580813842907734705065 : Rat) / 629862144719762786538) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((410580813842907734705065 : Rat) / 1259724289439525573076) [(2, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 2), (15, 4), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-410580813842907734705065 : Rat) / 629862144719762786538) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((410580813842907734705065 : Rat) / 1259724289439525573076) [(3, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 2), (15, 4), (16, 1)],
  term ((410580813842907734705065 : Rat) / 629862144719762786538) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 4), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 3), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (14, 2), (15, 3), (16, 1)],
  term ((410580813842907734705065 : Rat) / 629862144719762786538) [(5, 1), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (15, 5), (16, 1)],
  term ((-410580813842907734705065 : Rat) / 1259724289439525573076) [(14, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(14, 2), (15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(14, 4), (15, 2), (16, 1)],
  term ((-410580813842907734705065 : Rat) / 1259724289439525573076) [(15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 100 through 102. -/
theorem rs_R007_ueqv_R007NY_block_15_0100_0102_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_15_0100_0102
      rs_R007_ueqv_R007NY_block_15_0100_0102 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
