/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 5:400-450

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_05_0400_0450 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0400 : Poly :=
[
  term ((14408 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 400 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0400 : Poly :=
[
  term ((-28816 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((14408 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((14408 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-14408 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((28816 : Rat) / 35) [(9, 1), (13, 1), (14, 2)],
  term ((-14408 : Rat) / 35) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0400
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0401 : Poly :=
[
  term ((256 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 401 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0401 : Poly :=
[
  term ((-512 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((512 : Rat) / 35) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-256 : Rat) / 35) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0401
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0402 : Poly :=
[
  term ((-334 : Rat) / 35) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 402 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0402 : Poly :=
[
  term ((668 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-334 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-334 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-668 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((334 : Rat) / 35) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((334 : Rat) / 35) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0402
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0403 : Poly :=
[
  term ((-6857 : Rat) / 2100) [(9, 1), (15, 1)]
]

/-- Partial product 403 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0403 : Poly :=
[
  term ((6857 : Rat) / 1050) [(4, 1), (9, 1), (15, 1)],
  term ((-6857 : Rat) / 2100) [(4, 2), (9, 1), (15, 1)],
  term ((-6857 : Rat) / 2100) [(5, 2), (9, 1), (15, 1)],
  term ((-6857 : Rat) / 1050) [(9, 1), (14, 1), (15, 1)],
  term ((6857 : Rat) / 2100) [(9, 1), (14, 2), (15, 1)],
  term ((6857 : Rat) / 2100) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0403
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0404 : Poly :=
[
  term ((703 : Rat) / 140) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0404 : Poly :=
[
  term ((-703 : Rat) / 70) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((703 : Rat) / 140) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((703 : Rat) / 140) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((703 : Rat) / 70) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-703 : Rat) / 140) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-703 : Rat) / 140) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0404
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0405 : Poly :=
[
  term ((1732 : Rat) / 5) [(9, 2)]
]

/-- Partial product 405 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0405 : Poly :=
[
  term ((-3464 : Rat) / 5) [(4, 1), (9, 2)],
  term ((1732 : Rat) / 5) [(4, 2), (9, 2)],
  term ((1732 : Rat) / 5) [(5, 2), (9, 2)],
  term ((3464 : Rat) / 5) [(9, 2), (14, 1)],
  term ((-1732 : Rat) / 5) [(9, 2), (14, 2)],
  term ((-1732 : Rat) / 5) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0405
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0406 : Poly :=
[
  term ((45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 406 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0406 : Poly :=
[
  term ((-91722048 : Rat) / 53375) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((45861024 : Rat) / 53375) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((45861024 : Rat) / 53375) [(5, 2), (9, 2), (11, 1), (13, 1)],
  term ((91722048 : Rat) / 53375) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0406
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0407 : Poly :=
[
  term ((-36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 407 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0407 : Poly :=
[
  term ((73728 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-73728 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0407
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0408 : Poly :=
[
  term ((12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 408 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0408 : Poly :=
[
  term ((-24576 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24576 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0408
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0409 : Poly :=
[
  term ((-9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 409 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0409 : Poly :=
[
  term ((19968 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0409_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0409
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0410 : Poly :=
[
  term ((2096 : Rat) / 7) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 410 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0410 : Poly :=
[
  term ((-4192 : Rat) / 7) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(4, 2), (9, 2), (11, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((4192 : Rat) / 7) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0410_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0410
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0411 : Poly :=
[
  term ((-1392 : Rat) / 35) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0411 : Poly :=
[
  term ((2784 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 35) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0411_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0411
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0412 : Poly :=
[
  term ((-1568 : Rat) / 5) [(9, 2), (14, 1)]
]

/-- Partial product 412 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0412 : Poly :=
[
  term ((3136 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((-1568 : Rat) / 5) [(4, 2), (9, 2), (14, 1)],
  term ((-1568 : Rat) / 5) [(5, 2), (9, 2), (14, 1)],
  term ((1568 : Rat) / 5) [(9, 2), (14, 1), (15, 2)],
  term ((-3136 : Rat) / 5) [(9, 2), (14, 2)],
  term ((1568 : Rat) / 5) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0412_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0412
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0413 : Poly :=
[
  term ((2 : Rat) / 5) [(9, 2), (16, 1)]
]

/-- Partial product 413 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0413 : Poly :=
[
  term ((-4 : Rat) / 5) [(4, 1), (9, 2), (16, 1)],
  term ((2 : Rat) / 5) [(4, 2), (9, 2), (16, 1)],
  term ((2 : Rat) / 5) [(5, 2), (9, 2), (16, 1)],
  term ((4 : Rat) / 5) [(9, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(9, 2), (14, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0413_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0413
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0414 : Poly :=
[
  term ((-616 : Rat) / 5) [(10, 1)]
]

/-- Partial product 414 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0414 : Poly :=
[
  term ((1232 : Rat) / 5) [(4, 1), (10, 1)],
  term ((-616 : Rat) / 5) [(4, 2), (10, 1)],
  term ((-616 : Rat) / 5) [(5, 2), (10, 1)],
  term ((-1232 : Rat) / 5) [(10, 1), (14, 1)],
  term ((616 : Rat) / 5) [(10, 1), (14, 2)],
  term ((616 : Rat) / 5) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0414_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0414
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0415 : Poly :=
[
  term ((-188112 : Rat) / 875) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 415 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0415 : Poly :=
[
  term ((376224 : Rat) / 875) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-188112 : Rat) / 875) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-188112 : Rat) / 875) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-376224 : Rat) / 875) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((188112 : Rat) / 875) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((188112 : Rat) / 875) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0415_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0415
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0416 : Poly :=
[
  term ((9216 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 416 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0416 : Poly :=
[
  term ((-18432 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((9216 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((9216 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-9216 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((18432 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-9216 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0416_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0416
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0417 : Poly :=
[
  term ((-3072 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 417 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0417 : Poly :=
[
  term ((6144 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3072 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3072 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3072 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6144 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3072 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0417_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0417
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0418 : Poly :=
[
  term ((2496 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 418 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0418 : Poly :=
[
  term ((-4992 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4992 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2496 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2496 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0418_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0418
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0419 : Poly :=
[
  term ((-9209 : Rat) / 70) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 419 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0419 : Poly :=
[
  term ((9209 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9209 : Rat) / 70) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-9209 : Rat) / 70) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-9209 : Rat) / 35) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9209 : Rat) / 70) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((9209 : Rat) / 70) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0419_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0419
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0420 : Poly :=
[
  term ((1137 : Rat) / 70) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0420 : Poly :=
[
  term ((-1137 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1137 : Rat) / 70) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1137 : Rat) / 70) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1137 : Rat) / 35) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 70) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 70) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0420_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0420
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0421 : Poly :=
[
  term ((81 : Rat) / 5) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 421 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0421 : Poly :=
[
  term ((-162 : Rat) / 5) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((81 : Rat) / 5) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((81 : Rat) / 5) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((162 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-81 : Rat) / 5) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-81 : Rat) / 5) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0421_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0421
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0422 : Poly :=
[
  term ((-9 : Rat) / 5) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0422 : Poly :=
[
  term ((18 : Rat) / 5) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0422_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0422
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0423 : Poly :=
[
  term ((10944 : Rat) / 7625) [(10, 1), (13, 2)]
]

/-- Partial product 423 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0423 : Poly :=
[
  term ((-21888 : Rat) / 7625) [(4, 1), (10, 1), (13, 2)],
  term ((10944 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)],
  term ((10944 : Rat) / 7625) [(5, 2), (10, 1), (13, 2)],
  term ((21888 : Rat) / 7625) [(10, 1), (13, 2), (14, 1)],
  term ((-10944 : Rat) / 7625) [(10, 1), (13, 2), (14, 2)],
  term ((-10944 : Rat) / 7625) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0423_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0423
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0424 : Poly :=
[
  term ((576 : Rat) / 5) [(10, 1), (14, 1)]
]

/-- Partial product 424 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0424 : Poly :=
[
  term ((-1152 : Rat) / 5) [(4, 1), (10, 1), (14, 1)],
  term ((576 : Rat) / 5) [(4, 2), (10, 1), (14, 1)],
  term ((576 : Rat) / 5) [(5, 2), (10, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(10, 1), (14, 1), (15, 2)],
  term ((1152 : Rat) / 5) [(10, 1), (14, 2)],
  term ((-576 : Rat) / 5) [(10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0424_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0424
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0425 : Poly :=
[
  term ((16203344 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 425 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0425 : Poly :=
[
  term ((-32406688 : Rat) / 53375) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((16203344 : Rat) / 53375) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((16203344 : Rat) / 53375) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((32406688 : Rat) / 53375) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16203344 : Rat) / 53375) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-16203344 : Rat) / 53375) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0425_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0425
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0426 : Poly :=
[
  term ((-13056 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 426 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0426 : Poly :=
[
  term ((26112 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13056 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13056 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((13056 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-26112 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((13056 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0426_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0426
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0427 : Poly :=
[
  term ((4352 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 427 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0427 : Poly :=
[
  term ((-8704 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4352 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4352 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4352 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8704 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4352 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0427_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0427
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0428 : Poly :=
[
  term ((-3536 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 428 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0428 : Poly :=
[
  term ((7072 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7072 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3536 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3536 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0428_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0428
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0429 : Poly :=
[
  term ((3361 : Rat) / 21) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 429 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0429 : Poly :=
[
  term ((-6722 : Rat) / 21) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((3361 : Rat) / 21) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((3361 : Rat) / 21) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((6722 : Rat) / 21) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3361 : Rat) / 21) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3361 : Rat) / 21) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0429_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0429
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0430 : Poly :=
[
  term ((-703 : Rat) / 35) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0430 : Poly :=
[
  term ((1406 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-703 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-703 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1406 : Rat) / 35) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((703 : Rat) / 35) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((703 : Rat) / 35) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0430_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0430
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0431 : Poly :=
[
  term ((-15280624 : Rat) / 53375) [(11, 1), (13, 1)]
]

/-- Partial product 431 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0431 : Poly :=
[
  term ((30561248 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)],
  term ((-15280624 : Rat) / 53375) [(4, 2), (11, 1), (13, 1)],
  term ((-15280624 : Rat) / 53375) [(5, 2), (11, 1), (13, 1)],
  term ((-30561248 : Rat) / 53375) [(11, 1), (13, 1), (14, 1)],
  term ((15280624 : Rat) / 53375) [(11, 1), (13, 1), (14, 2)],
  term ((15280624 : Rat) / 53375) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0431_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0431
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0432 : Poly :=
[
  term ((12288 : Rat) / 35) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 432 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0432 : Poly :=
[
  term ((-24576 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((24576 : Rat) / 35) [(11, 1), (13, 1), (14, 2)],
  term ((-12288 : Rat) / 35) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0432_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0432
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0433 : Poly :=
[
  term ((-4096 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 433 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0433 : Poly :=
[
  term ((8192 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4096 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4096 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4096 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8192 : Rat) / 35) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((4096 : Rat) / 35) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0433_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0433
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0434 : Poly :=
[
  term ((3328 : Rat) / 35) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 434 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0434 : Poly :=
[
  term ((-6656 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((3328 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((3328 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((6656 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3328 : Rat) / 35) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3328 : Rat) / 35) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0434_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0434
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0435 : Poly :=
[
  term ((-8951 : Rat) / 84) [(11, 1), (15, 1)]
]

/-- Partial product 435 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0435 : Poly :=
[
  term ((8951 : Rat) / 42) [(4, 1), (11, 1), (15, 1)],
  term ((-8951 : Rat) / 84) [(4, 2), (11, 1), (15, 1)],
  term ((-8951 : Rat) / 84) [(5, 2), (11, 1), (15, 1)],
  term ((-8951 : Rat) / 42) [(11, 1), (14, 1), (15, 1)],
  term ((8951 : Rat) / 84) [(11, 1), (14, 2), (15, 1)],
  term ((8951 : Rat) / 84) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0435_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0435
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0436 : Poly :=
[
  term ((1961 : Rat) / 140) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0436 : Poly :=
[
  term ((-1961 : Rat) / 70) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1961 : Rat) / 140) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((1961 : Rat) / 140) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((1961 : Rat) / 70) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1961 : Rat) / 140) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1961 : Rat) / 140) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0436_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0436
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0437 : Poly :=
[
  term (-15 : Rat) [(12, 1)]
]

/-- Partial product 437 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0437 : Poly :=
[
  term (30 : Rat) [(4, 1), (12, 1)],
  term (-15 : Rat) [(4, 2), (12, 1)],
  term (-15 : Rat) [(5, 2), (12, 1)],
  term (-30 : Rat) [(12, 1), (14, 1)],
  term (15 : Rat) [(12, 1), (14, 2)],
  term (15 : Rat) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0437_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0437
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0438 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(12, 1), (13, 2)]
]

/-- Partial product 438 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0438 : Poly :=
[
  term ((82944 : Rat) / 7625) [(4, 1), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(5, 2), (12, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(12, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(12, 1), (13, 2), (14, 2)],
  term ((41472 : Rat) / 7625) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0438_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0438
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0439 : Poly :=
[
  term ((41472 : Rat) / 7625) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 439 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0439 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 1), (12, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (12, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(5, 2), (12, 1), (13, 2), (14, 1)],
  term ((-41472 : Rat) / 7625) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((82944 : Rat) / 7625) [(12, 1), (13, 2), (14, 2)],
  term ((-41472 : Rat) / 7625) [(12, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0439_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0439
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0440 : Poly :=
[
  term ((116 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 440 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0440 : Poly :=
[
  term ((-232 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((116 : Rat) / 5) [(4, 2), (12, 1), (14, 1)],
  term ((116 : Rat) / 5) [(5, 2), (12, 1), (14, 1)],
  term ((-116 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((232 : Rat) / 5) [(12, 1), (14, 2)],
  term ((-116 : Rat) / 5) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0440_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0440
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0441 : Poly :=
[
  term ((11 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 441 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0441 : Poly :=
[
  term ((-22 : Rat) / 5) [(4, 1), (12, 1), (16, 1)],
  term ((11 : Rat) / 5) [(4, 2), (12, 1), (16, 1)],
  term ((11 : Rat) / 5) [(5, 2), (12, 1), (16, 1)],
  term ((22 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 5) [(12, 1), (14, 2), (16, 1)],
  term ((-11 : Rat) / 5) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0441_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0441
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0442 : Poly :=
[
  term ((-24 : Rat) / 5) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 442 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0442 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(13, 1), (14, 1), (15, 3)],
  term ((-48 : Rat) / 5) [(13, 1), (14, 2), (15, 1)],
  term ((24 : Rat) / 5) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0442_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0442
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0443 : Poly :=
[
  term ((-15779 : Rat) / 2100) [(13, 1), (15, 1)]
]

/-- Partial product 443 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0443 : Poly :=
[
  term ((15779 : Rat) / 1050) [(4, 1), (13, 1), (15, 1)],
  term ((-15779 : Rat) / 2100) [(4, 2), (13, 1), (15, 1)],
  term ((-15779 : Rat) / 2100) [(5, 2), (13, 1), (15, 1)],
  term ((-15779 : Rat) / 1050) [(13, 1), (14, 1), (15, 1)],
  term ((15779 : Rat) / 2100) [(13, 1), (14, 2), (15, 1)],
  term ((15779 : Rat) / 2100) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0443_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0443
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0444 : Poly :=
[
  term ((-99 : Rat) / 140) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 444 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0444 : Poly :=
[
  term ((99 : Rat) / 70) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99 : Rat) / 140) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-99 : Rat) / 140) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-99 : Rat) / 70) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 140) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((99 : Rat) / 140) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0444_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0444
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0445 : Poly :=
[
  term ((1094596 : Rat) / 10675) [(13, 2)]
]

/-- Partial product 445 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0445 : Poly :=
[
  term ((-2189192 : Rat) / 10675) [(4, 1), (13, 2)],
  term ((1094596 : Rat) / 10675) [(4, 2), (13, 2)],
  term ((1094596 : Rat) / 10675) [(5, 2), (13, 2)],
  term ((2189192 : Rat) / 10675) [(13, 2), (14, 1)],
  term ((-1094596 : Rat) / 10675) [(13, 2), (14, 2)],
  term ((-1094596 : Rat) / 10675) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0445_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0445
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0446 : Poly :=
[
  term ((-6509808 : Rat) / 53375) [(13, 2), (14, 1)]
]

/-- Partial product 446 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0446 : Poly :=
[
  term ((13019616 : Rat) / 53375) [(4, 1), (13, 2), (14, 1)],
  term ((-6509808 : Rat) / 53375) [(4, 2), (13, 2), (14, 1)],
  term ((-6509808 : Rat) / 53375) [(5, 2), (13, 2), (14, 1)],
  term ((6509808 : Rat) / 53375) [(13, 2), (14, 1), (15, 2)],
  term ((-13019616 : Rat) / 53375) [(13, 2), (14, 2)],
  term ((6509808 : Rat) / 53375) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0446_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0446
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0447 : Poly :=
[
  term ((1408 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 447 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0447 : Poly :=
[
  term ((-2816 : Rat) / 35) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2816 : Rat) / 35) [(13, 2), (14, 2), (16, 1)],
  term ((-1408 : Rat) / 35) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0447_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0447
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0448 : Poly :=
[
  term ((-1144 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 448 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0448 : Poly :=
[
  term ((2288 : Rat) / 35) [(4, 1), (13, 2), (16, 1)],
  term ((-1144 : Rat) / 35) [(4, 2), (13, 2), (16, 1)],
  term ((-1144 : Rat) / 35) [(5, 2), (13, 2), (16, 1)],
  term ((-2288 : Rat) / 35) [(13, 2), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(13, 2), (14, 2), (16, 1)],
  term ((1144 : Rat) / 35) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0448_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0448
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0449 : Poly :=
[
  term ((-12 : Rat) / 5) [(14, 1)]
]

/-- Partial product 449 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0449 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (14, 1)],
  term ((12 : Rat) / 5) [(14, 1), (15, 2)],
  term ((-24 : Rat) / 5) [(14, 2)],
  term ((12 : Rat) / 5) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0449_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0449
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 5. -/
def rs_R003_ueqv_R003YY_coefficient_05_0450 : Poly :=
[
  term ((-9 : Rat) / 5) [(16, 1)]
]

/-- Partial product 450 for generator 5. -/
def rs_R003_ueqv_R003YY_partial_05_0450 : Poly :=
[
  term ((18 : Rat) / 5) [(4, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(4, 2), (16, 1)],
  term ((-9 : Rat) / 5) [(5, 2), (16, 1)],
  term ((-18 : Rat) / 5) [(14, 1), (16, 1)],
  term ((9 : Rat) / 5) [(14, 2), (16, 1)],
  term ((9 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 5. -/
theorem rs_R003_ueqv_R003YY_partial_05_0450_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_05_0450
        rs_R003_ueqv_R003YY_generator_05_0400_0450 =
      rs_R003_ueqv_R003YY_partial_05_0450 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_05_0400_0450 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_05_0400,
  rs_R003_ueqv_R003YY_partial_05_0401,
  rs_R003_ueqv_R003YY_partial_05_0402,
  rs_R003_ueqv_R003YY_partial_05_0403,
  rs_R003_ueqv_R003YY_partial_05_0404,
  rs_R003_ueqv_R003YY_partial_05_0405,
  rs_R003_ueqv_R003YY_partial_05_0406,
  rs_R003_ueqv_R003YY_partial_05_0407,
  rs_R003_ueqv_R003YY_partial_05_0408,
  rs_R003_ueqv_R003YY_partial_05_0409,
  rs_R003_ueqv_R003YY_partial_05_0410,
  rs_R003_ueqv_R003YY_partial_05_0411,
  rs_R003_ueqv_R003YY_partial_05_0412,
  rs_R003_ueqv_R003YY_partial_05_0413,
  rs_R003_ueqv_R003YY_partial_05_0414,
  rs_R003_ueqv_R003YY_partial_05_0415,
  rs_R003_ueqv_R003YY_partial_05_0416,
  rs_R003_ueqv_R003YY_partial_05_0417,
  rs_R003_ueqv_R003YY_partial_05_0418,
  rs_R003_ueqv_R003YY_partial_05_0419,
  rs_R003_ueqv_R003YY_partial_05_0420,
  rs_R003_ueqv_R003YY_partial_05_0421,
  rs_R003_ueqv_R003YY_partial_05_0422,
  rs_R003_ueqv_R003YY_partial_05_0423,
  rs_R003_ueqv_R003YY_partial_05_0424,
  rs_R003_ueqv_R003YY_partial_05_0425,
  rs_R003_ueqv_R003YY_partial_05_0426,
  rs_R003_ueqv_R003YY_partial_05_0427,
  rs_R003_ueqv_R003YY_partial_05_0428,
  rs_R003_ueqv_R003YY_partial_05_0429,
  rs_R003_ueqv_R003YY_partial_05_0430,
  rs_R003_ueqv_R003YY_partial_05_0431,
  rs_R003_ueqv_R003YY_partial_05_0432,
  rs_R003_ueqv_R003YY_partial_05_0433,
  rs_R003_ueqv_R003YY_partial_05_0434,
  rs_R003_ueqv_R003YY_partial_05_0435,
  rs_R003_ueqv_R003YY_partial_05_0436,
  rs_R003_ueqv_R003YY_partial_05_0437,
  rs_R003_ueqv_R003YY_partial_05_0438,
  rs_R003_ueqv_R003YY_partial_05_0439,
  rs_R003_ueqv_R003YY_partial_05_0440,
  rs_R003_ueqv_R003YY_partial_05_0441,
  rs_R003_ueqv_R003YY_partial_05_0442,
  rs_R003_ueqv_R003YY_partial_05_0443,
  rs_R003_ueqv_R003YY_partial_05_0444,
  rs_R003_ueqv_R003YY_partial_05_0445,
  rs_R003_ueqv_R003YY_partial_05_0446,
  rs_R003_ueqv_R003YY_partial_05_0447,
  rs_R003_ueqv_R003YY_partial_05_0448,
  rs_R003_ueqv_R003YY_partial_05_0449,
  rs_R003_ueqv_R003YY_partial_05_0450
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_05_0400_0450 : Poly :=
[
  term ((-28816 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((668 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((6857 : Rat) / 1050) [(4, 1), (9, 1), (15, 1)],
  term ((-703 : Rat) / 70) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3464 : Rat) / 5) [(4, 1), (9, 2)],
  term ((-91722048 : Rat) / 53375) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((73728 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-24576 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4192 : Rat) / 7) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((-4 : Rat) / 5) [(4, 1), (9, 2), (16, 1)],
  term ((1232 : Rat) / 5) [(4, 1), (10, 1)],
  term ((376224 : Rat) / 875) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-18432 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((6144 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4992 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((9209 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1137 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((18 : Rat) / 5) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21888 : Rat) / 7625) [(4, 1), (10, 1), (13, 2)],
  term ((-1152 : Rat) / 5) [(4, 1), (10, 1), (14, 1)],
  term ((-32406688 : Rat) / 53375) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((26112 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8704 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7072 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6722 : Rat) / 21) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((1406 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((30561248 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)],
  term ((-24576 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((8192 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6656 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((8951 : Rat) / 42) [(4, 1), (11, 1), (15, 1)],
  term ((-1961 : Rat) / 70) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(4, 1), (12, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (12, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 1), (12, 1), (13, 2), (14, 1)],
  term ((-232 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((-22 : Rat) / 5) [(4, 1), (12, 1), (16, 1)],
  term ((48 : Rat) / 5) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((15779 : Rat) / 1050) [(4, 1), (13, 1), (15, 1)],
  term ((99 : Rat) / 70) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2189192 : Rat) / 10675) [(4, 1), (13, 2)],
  term ((13019616 : Rat) / 53375) [(4, 1), (13, 2), (14, 1)],
  term ((-2816 : Rat) / 35) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(4, 1), (13, 2), (16, 1)],
  term ((24 : Rat) / 5) [(4, 1), (14, 1)],
  term ((18 : Rat) / 5) [(4, 1), (16, 1)],
  term ((14408 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-334 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-6857 : Rat) / 2100) [(4, 2), (9, 1), (15, 1)],
  term ((703 : Rat) / 140) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1732 : Rat) / 5) [(4, 2), (9, 2)],
  term ((45861024 : Rat) / 53375) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(4, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1392 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1568 : Rat) / 5) [(4, 2), (9, 2), (14, 1)],
  term ((2 : Rat) / 5) [(4, 2), (9, 2), (16, 1)],
  term ((-616 : Rat) / 5) [(4, 2), (10, 1)],
  term ((-188112 : Rat) / 875) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((9216 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 70) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((1137 : Rat) / 70) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 5) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-9 : Rat) / 5) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10944 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)],
  term ((576 : Rat) / 5) [(4, 2), (10, 1), (14, 1)],
  term ((16203344 : Rat) / 53375) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-13056 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4352 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3361 : Rat) / 21) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-703 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15280624 : Rat) / 53375) [(4, 2), (11, 1), (13, 1)],
  term ((12288 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4096 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3328 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-8951 : Rat) / 84) [(4, 2), (11, 1), (15, 1)],
  term ((1961 : Rat) / 140) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(4, 2), (12, 1)],
  term ((-41472 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 2), (12, 1), (13, 2), (14, 1)],
  term ((116 : Rat) / 5) [(4, 2), (12, 1), (14, 1)],
  term ((11 : Rat) / 5) [(4, 2), (12, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-15779 : Rat) / 2100) [(4, 2), (13, 1), (15, 1)],
  term ((-99 : Rat) / 140) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((1094596 : Rat) / 10675) [(4, 2), (13, 2)],
  term ((-6509808 : Rat) / 53375) [(4, 2), (13, 2), (14, 1)],
  term ((1408 : Rat) / 35) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(4, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (14, 1)],
  term ((-9 : Rat) / 5) [(4, 2), (16, 1)],
  term ((14408 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-334 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-6857 : Rat) / 2100) [(5, 2), (9, 1), (15, 1)],
  term ((703 : Rat) / 140) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1732 : Rat) / 5) [(5, 2), (9, 2)],
  term ((45861024 : Rat) / 53375) [(5, 2), (9, 2), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1392 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1568 : Rat) / 5) [(5, 2), (9, 2), (14, 1)],
  term ((2 : Rat) / 5) [(5, 2), (9, 2), (16, 1)],
  term ((-616 : Rat) / 5) [(5, 2), (10, 1)],
  term ((-188112 : Rat) / 875) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((9216 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 70) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((1137 : Rat) / 70) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 5) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-9 : Rat) / 5) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10944 : Rat) / 7625) [(5, 2), (10, 1), (13, 2)],
  term ((576 : Rat) / 5) [(5, 2), (10, 1), (14, 1)],
  term ((16203344 : Rat) / 53375) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-13056 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4352 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3361 : Rat) / 21) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-703 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15280624 : Rat) / 53375) [(5, 2), (11, 1), (13, 1)],
  term ((12288 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4096 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3328 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-8951 : Rat) / 84) [(5, 2), (11, 1), (15, 1)],
  term ((1961 : Rat) / 140) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(5, 2), (12, 1)],
  term ((-41472 : Rat) / 7625) [(5, 2), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(5, 2), (12, 1), (13, 2), (14, 1)],
  term ((116 : Rat) / 5) [(5, 2), (12, 1), (14, 1)],
  term ((11 : Rat) / 5) [(5, 2), (12, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-15779 : Rat) / 2100) [(5, 2), (13, 1), (15, 1)],
  term ((-99 : Rat) / 140) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((1094596 : Rat) / 10675) [(5, 2), (13, 2)],
  term ((-6509808 : Rat) / 53375) [(5, 2), (13, 2), (14, 1)],
  term ((1408 : Rat) / 35) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(5, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (14, 1)],
  term ((-9 : Rat) / 5) [(5, 2), (16, 1)],
  term ((-14408 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-256 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-668 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((28816 : Rat) / 35) [(9, 1), (13, 1), (14, 2)],
  term ((846 : Rat) / 35) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-14408 : Rat) / 35) [(9, 1), (13, 1), (14, 3)],
  term ((-256 : Rat) / 35) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((334 : Rat) / 35) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6857 : Rat) / 1050) [(9, 1), (14, 1), (15, 1)],
  term ((703 : Rat) / 70) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6857 : Rat) / 2100) [(9, 1), (14, 2), (15, 1)],
  term ((-703 : Rat) / 140) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((6857 : Rat) / 2100) [(9, 1), (15, 3)],
  term ((-703 : Rat) / 140) [(9, 1), (15, 3), (16, 1)],
  term ((91722048 : Rat) / 53375) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19968 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-158296224 : Rat) / 53375) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((6912 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 3)],
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4192 : Rat) / 7) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2784 : Rat) / 35) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (15, 3)],
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((3464 : Rat) / 5) [(9, 2), (14, 1)],
  term ((1568 : Rat) / 5) [(9, 2), (14, 1), (15, 2)],
  term ((4 : Rat) / 5) [(9, 2), (14, 1), (16, 1)],
  term ((-4868 : Rat) / 5) [(9, 2), (14, 2)],
  term ((-2 : Rat) / 5) [(9, 2), (14, 2), (16, 1)],
  term ((1568 : Rat) / 5) [(9, 2), (14, 3)],
  term ((-1732 : Rat) / 5) [(9, 2), (15, 2)],
  term ((-2 : Rat) / 5) [(9, 2), (15, 2), (16, 1)],
  term ((-376224 : Rat) / 875) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-9216 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3072 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4992 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((648912 : Rat) / 875) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1728 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-9216 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((3072 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((188112 : Rat) / 875) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2496 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9209 : Rat) / 35) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1137 : Rat) / 35) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9209 : Rat) / 70) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1137 : Rat) / 70) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((9209 : Rat) / 70) [(10, 1), (11, 1), (15, 3)],
  term ((-1137 : Rat) / 70) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((162 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 5) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((9 : Rat) / 5) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-81 : Rat) / 5) [(10, 1), (13, 1), (15, 3)],
  term ((9 : Rat) / 5) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((21888 : Rat) / 7625) [(10, 1), (13, 2), (14, 1)],
  term ((-10944 : Rat) / 7625) [(10, 1), (13, 2), (14, 2)],
  term ((-10944 : Rat) / 7625) [(10, 1), (13, 2), (15, 2)],
  term ((-1232 : Rat) / 5) [(10, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(10, 1), (14, 1), (15, 2)],
  term ((1768 : Rat) / 5) [(10, 1), (14, 2)],
  term ((-576 : Rat) / 5) [(10, 1), (14, 3)],
  term ((616 : Rat) / 5) [(10, 1), (15, 2)],
  term ((32406688 : Rat) / 53375) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((13056 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4352 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7072 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-56024144 : Rat) / 53375) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((2448 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((13056 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-4352 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-16203344 : Rat) / 53375) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3536 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6722 : Rat) / 21) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1406 : Rat) / 35) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3361 : Rat) / 21) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((703 : Rat) / 35) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3361 : Rat) / 21) [(11, 1), (12, 1), (15, 3)],
  term ((703 : Rat) / 35) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-30561248 : Rat) / 53375) [(11, 1), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((4096 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6656 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((52759024 : Rat) / 53375) [(11, 1), (13, 1), (14, 2)],
  term ((-2304 : Rat) / 7) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-12288 : Rat) / 35) [(11, 1), (13, 1), (14, 3)],
  term ((4096 : Rat) / 35) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((15280624 : Rat) / 53375) [(11, 1), (13, 1), (15, 2)],
  term ((-3328 : Rat) / 35) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8951 : Rat) / 42) [(11, 1), (14, 1), (15, 1)],
  term ((1961 : Rat) / 70) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8951 : Rat) / 84) [(11, 1), (14, 2), (15, 1)],
  term ((-1961 : Rat) / 140) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((8951 : Rat) / 84) [(11, 1), (15, 3)],
  term ((-1961 : Rat) / 140) [(11, 1), (15, 3), (16, 1)],
  term ((-82944 : Rat) / 7625) [(12, 1), (13, 2), (14, 1)],
  term ((-41472 : Rat) / 7625) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((124416 : Rat) / 7625) [(12, 1), (13, 2), (14, 2)],
  term ((-41472 : Rat) / 7625) [(12, 1), (13, 2), (14, 3)],
  term ((41472 : Rat) / 7625) [(12, 1), (13, 2), (15, 2)],
  term (-30 : Rat) [(12, 1), (14, 1)],
  term ((-116 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((22 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((307 : Rat) / 5) [(12, 1), (14, 2)],
  term ((-11 : Rat) / 5) [(12, 1), (14, 2), (16, 1)],
  term ((-116 : Rat) / 5) [(12, 1), (14, 3)],
  term (15 : Rat) [(12, 1), (15, 2)],
  term ((-11 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((-15779 : Rat) / 1050) [(13, 1), (14, 1), (15, 1)],
  term ((-99 : Rat) / 70) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(13, 1), (14, 1), (15, 3)],
  term ((-4381 : Rat) / 2100) [(13, 1), (14, 2), (15, 1)],
  term ((99 : Rat) / 140) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(13, 1), (14, 3), (15, 1)],
  term ((15779 : Rat) / 2100) [(13, 1), (15, 3)],
  term ((99 : Rat) / 140) [(13, 1), (15, 3), (16, 1)],
  term ((2189192 : Rat) / 10675) [(13, 2), (14, 1)],
  term ((6509808 : Rat) / 53375) [(13, 2), (14, 1), (15, 2)],
  term ((-1408 : Rat) / 35) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2288 : Rat) / 35) [(13, 2), (14, 1), (16, 1)],
  term ((-18492596 : Rat) / 53375) [(13, 2), (14, 2)],
  term ((792 : Rat) / 7) [(13, 2), (14, 2), (16, 1)],
  term ((6509808 : Rat) / 53375) [(13, 2), (14, 3)],
  term ((-1408 : Rat) / 35) [(13, 2), (14, 3), (16, 1)],
  term ((-1094596 : Rat) / 10675) [(13, 2), (15, 2)],
  term ((1144 : Rat) / 35) [(13, 2), (15, 2), (16, 1)],
  term ((12 : Rat) / 5) [(14, 1), (15, 2)],
  term ((-18 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(14, 2)],
  term ((9 : Rat) / 5) [(14, 2), (16, 1)],
  term ((12 : Rat) / 5) [(14, 3)],
  term ((9 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 400 through 450. -/
theorem rs_R003_ueqv_R003YY_block_05_0400_0450_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_05_0400_0450
      rs_R003_ueqv_R003YY_block_05_0400_0450 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
