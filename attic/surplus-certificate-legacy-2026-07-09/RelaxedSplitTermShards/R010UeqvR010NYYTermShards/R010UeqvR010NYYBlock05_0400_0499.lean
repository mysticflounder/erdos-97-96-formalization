/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 5:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_05_0400_0499 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0400 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 400 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0400 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0400_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0400
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0401 : Poly :=
[
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 401 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0401 : Poly :=
[
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(3, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(3, 1), (6, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(3, 1), (7, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0401_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0401
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0402 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 402 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0402 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0402_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0402
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0403 : Poly :=
[
  term ((2389324849160611452179 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 403 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0403 : Poly :=
[
  term ((-2389324849160611452179 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((2389324849160611452179 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((2389324849160611452179 : Rat) / 16847068023661302784) [(3, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((2389324849160611452179 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2389324849160611452179 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-2389324849160611452179 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0403_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0403
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0404 : Poly :=
[
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0404 : Poly :=
[
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0404_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0404
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0405 : Poly :=
[
  term ((189099744644419281 : Rat) / 47725405166179328) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0405 : Poly :=
[
  term ((-189099744644419281 : Rat) / 23862702583089664) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((189099744644419281 : Rat) / 47725405166179328) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((189099744644419281 : Rat) / 47725405166179328) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((189099744644419281 : Rat) / 23862702583089664) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189099744644419281 : Rat) / 47725405166179328) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-189099744644419281 : Rat) / 47725405166179328) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0405_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0405
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0406 : Poly :=
[
  term ((549299257489439991 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 406 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0406 : Poly :=
[
  term ((-549299257489439991 : Rat) / 23862702583089664) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(3, 1), (6, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((549299257489439991 : Rat) / 23862702583089664) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0406_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0406
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0407 : Poly :=
[
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 407 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0407 : Poly :=
[
  term ((546492365945773 : Rat) / 182622723850176) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 182622723850176) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0407_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0407
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0408 : Poly :=
[
  term ((534733629761855081 : Rat) / 95450810332358656) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 408 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0408 : Poly :=
[
  term ((-534733629761855081 : Rat) / 47725405166179328) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((534733629761855081 : Rat) / 95450810332358656) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((534733629761855081 : Rat) / 95450810332358656) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((534733629761855081 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-534733629761855081 : Rat) / 95450810332358656) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-534733629761855081 : Rat) / 95450810332358656) [(3, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0408_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0408
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0409 : Poly :=
[
  term ((-546492365945773 : Rat) / 730490895400704) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 409 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0409 : Poly :=
[
  term ((546492365945773 : Rat) / 365245447700352) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-546492365945773 : Rat) / 730490895400704) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-546492365945773 : Rat) / 730490895400704) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((546492365945773 : Rat) / 730490895400704) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((546492365945773 : Rat) / 730490895400704) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0409_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0409
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0410 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 410 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0410 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(3, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (6, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (7, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(3, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (9, 2), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0410_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0410
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0411 : Poly :=
[
  term ((2301633344300590327 : Rat) / 221671947679753984) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 411 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0411 : Poly :=
[
  term ((-2301633344300590327 : Rat) / 110835973839876992) [(3, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((2301633344300590327 : Rat) / 221671947679753984) [(3, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((2301633344300590327 : Rat) / 221671947679753984) [(3, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((2301633344300590327 : Rat) / 110835973839876992) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2301633344300590327 : Rat) / 221671947679753984) [(3, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-2301633344300590327 : Rat) / 221671947679753984) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0411_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0411
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0412 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 412 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0412 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(3, 1), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(3, 1), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0412_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0412
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0413 : Poly :=
[
  term ((5707104705546903 : Rat) / 1491418911443104) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0413 : Poly :=
[
  term ((-5707104705546903 : Rat) / 745709455721552) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((5707104705546903 : Rat) / 1491418911443104) [(3, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((5707104705546903 : Rat) / 1491418911443104) [(3, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((5707104705546903 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5707104705546903 : Rat) / 1491418911443104) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-5707104705546903 : Rat) / 1491418911443104) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0413_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0413
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0414 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0414 : Poly :=
[
  term ((1090603487902845177 : Rat) / 37605062552815408) [(3, 1), (6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (6, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (7, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0414_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0414
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0415 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0415 : Poly :=
[
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (6, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (7, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0415_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0415
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0416 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 416 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0416 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0416_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0416
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0417 : Poly :=
[
  term ((2586646749792967006921 : Rat) / 16847068023661302784) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 417 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0417 : Poly :=
[
  term ((-2586646749792967006921 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2586646749792967006921 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2586646749792967006921 : Rat) / 16847068023661302784) [(3, 1), (7, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2586646749792967006921 : Rat) / 16847068023661302784) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2586646749792967006921 : Rat) / 8423534011830651392) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2586646749792967006921 : Rat) / 16847068023661302784) [(3, 1), (10, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0417_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0417
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0418 : Poly :=
[
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 418 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0418 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (6, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (7, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0418_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0418
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0419 : Poly :=
[
  term ((978285603302727941883 : Rat) / 8423534011830651392) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 419 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0419 : Poly :=
[
  term ((-978285603302727941883 : Rat) / 4211767005915325696) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((978285603302727941883 : Rat) / 8423534011830651392) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((978285603302727941883 : Rat) / 8423534011830651392) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((978285603302727941883 : Rat) / 4211767005915325696) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-978285603302727941883 : Rat) / 8423534011830651392) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-978285603302727941883 : Rat) / 8423534011830651392) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0419_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0419
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0420 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 420 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0420 : Poly :=
[
  term ((-1001389270730769 : Rat) / 426119688983744) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (6, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0420_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0420
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0421 : Poly :=
[
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 421 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0421 : Poly :=
[
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (6, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0421_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0421
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0422 : Poly :=
[
  term ((56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0422 : Poly :=
[
  term ((-56706756499841811 : Rat) / 745709455721552) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((56706756499841811 : Rat) / 1491418911443104) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((56706756499841811 : Rat) / 1491418911443104) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((56706756499841811 : Rat) / 745709455721552) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0422_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0422
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0423 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 423 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0423 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (14, 1), (15, 5), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (14, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (14, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0423_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0423
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0424 : Poly :=
[
  term ((19191549556233499 : Rat) / 745709455721552) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0424 : Poly :=
[
  term ((-19191549556233499 : Rat) / 372854727860776) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((19191549556233499 : Rat) / 745709455721552) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((19191549556233499 : Rat) / 745709455721552) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((19191549556233499 : Rat) / 372854727860776) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19191549556233499 : Rat) / 745709455721552) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19191549556233499 : Rat) / 745709455721552) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0424_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0424
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0425 : Poly :=
[
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 425 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0425 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (6, 2), (10, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (7, 2), (10, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (14, 2), (15, 3), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0425_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0425
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0426 : Poly :=
[
  term ((-121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0426 : Poly :=
[
  term ((121178165322538353 : Rat) / 4065412167871936) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 8130824335743872) [(3, 1), (6, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 8130824335743872) [(3, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 4065412167871936) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0426_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0426
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0427 : Poly :=
[
  term ((-2588376395056165472821 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0427 : Poly :=
[
  term ((2588376395056165472821 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2588376395056165472821 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2588376395056165472821 : Rat) / 16847068023661302784) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2588376395056165472821 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2588376395056165472821 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2588376395056165472821 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0427_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0427
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0428 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 428 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0428 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0428_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0428
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0429 : Poly :=
[
  term ((55741396979956835619 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 429 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0429 : Poly :=
[
  term ((-55741396979956835619 : Rat) / 2105883502957662848) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((55741396979956835619 : Rat) / 4211767005915325696) [(3, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((55741396979956835619 : Rat) / 4211767005915325696) [(3, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-55741396979956835619 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((55741396979956835619 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-55741396979956835619 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0429_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0429
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0430 : Poly :=
[
  term ((-419193593204394025679 : Rat) / 12635301017745977088) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 430 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0430 : Poly :=
[
  term ((419193593204394025679 : Rat) / 6317650508872988544) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-419193593204394025679 : Rat) / 12635301017745977088) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-419193593204394025679 : Rat) / 12635301017745977088) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((419193593204394025679 : Rat) / 12635301017745977088) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-419193593204394025679 : Rat) / 6317650508872988544) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((419193593204394025679 : Rat) / 12635301017745977088) [(3, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0430_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0430
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0431 : Poly :=
[
  term ((-24317143221073791373813 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 431 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0431 : Poly :=
[
  term ((24317143221073791373813 : Rat) / 151623612212951725056) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-24317143221073791373813 : Rat) / 303247224425903450112) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-24317143221073791373813 : Rat) / 303247224425903450112) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-24317143221073791373813 : Rat) / 151623612212951725056) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((24317143221073791373813 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((24317143221073791373813 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0431_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0431
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0432 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 432 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0432 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (11, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (11, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (11, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0432_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0432
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0433 : Poly :=
[
  term ((-1111731199553203237117 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 433 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0433 : Poly :=
[
  term ((1111731199553203237117 : Rat) / 25270602035491954176) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1111731199553203237117 : Rat) / 50541204070983908352) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1111731199553203237117 : Rat) / 50541204070983908352) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1111731199553203237117 : Rat) / 25270602035491954176) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1111731199553203237117 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((1111731199553203237117 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0433_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0433
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0434 : Poly :=
[
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 434 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0434 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (6, 2), (11, 2), (13, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (7, 2), (11, 2), (13, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0434_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0434
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0435 : Poly :=
[
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0435 : Poly :=
[
  term ((210735806759522018859 : Rat) / 4211767005915325696) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (6, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (7, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0435_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0435
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0436 : Poly :=
[
  term ((9323021292936897126521 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0436 : Poly :=
[
  term ((-9323021292936897126521 : Rat) / 25270602035491954176) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((9323021292936897126521 : Rat) / 50541204070983908352) [(3, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((9323021292936897126521 : Rat) / 50541204070983908352) [(3, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((9323021292936897126521 : Rat) / 25270602035491954176) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9323021292936897126521 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-9323021292936897126521 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0436_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0436
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0437 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 437 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0437 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (11, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (11, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (11, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (14, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0437_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0437
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0438 : Poly :=
[
  term ((111265474525641 : Rat) / 92133986807296) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 438 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0438 : Poly :=
[
  term ((-111265474525641 : Rat) / 46066993403648) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 92133986807296) [(3, 1), (6, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 92133986807296) [(3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 92133986807296) [(3, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((111265474525641 : Rat) / 46066993403648) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 92133986807296) [(3, 1), (13, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0438_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0438
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0439 : Poly :=
[
  term ((-1841697429415589763 : Rat) / 47725405166179328) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 439 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0439 : Poly :=
[
  term ((1841697429415589763 : Rat) / 23862702583089664) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1841697429415589763 : Rat) / 47725405166179328) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1841697429415589763 : Rat) / 47725405166179328) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1841697429415589763 : Rat) / 23862702583089664) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1841697429415589763 : Rat) / 47725405166179328) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1841697429415589763 : Rat) / 47725405166179328) [(3, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0439_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0439
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0440 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 440 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0440 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (13, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0440_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0440
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0441 : Poly :=
[
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 441 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0441 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0441_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0441
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0442 : Poly :=
[
  term ((-6437353663455574495 : Rat) / 859057292991227904) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 442 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0442 : Poly :=
[
  term ((6437353663455574495 : Rat) / 429528646495613952) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6437353663455574495 : Rat) / 859057292991227904) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6437353663455574495 : Rat) / 859057292991227904) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((6437353663455574495 : Rat) / 859057292991227904) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6437353663455574495 : Rat) / 429528646495613952) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((6437353663455574495 : Rat) / 859057292991227904) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0442_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0442
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0443 : Poly :=
[
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 443 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0443 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (6, 2), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (14, 1), (15, 5), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (14, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0443_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0443
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0444 : Poly :=
[
  term ((-1965848046243182251 : Rat) / 214764323247806976) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 444 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0444 : Poly :=
[
  term ((1965848046243182251 : Rat) / 107382161623903488) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1965848046243182251 : Rat) / 214764323247806976) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1965848046243182251 : Rat) / 214764323247806976) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1965848046243182251 : Rat) / 107382161623903488) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965848046243182251 : Rat) / 214764323247806976) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((1965848046243182251 : Rat) / 214764323247806976) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0444_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0444
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0445 : Poly :=
[
  term ((-345534399907127267 : Rat) / 11931351291544832) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 445 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0445 : Poly :=
[
  term ((345534399907127267 : Rat) / 5965675645772416) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-345534399907127267 : Rat) / 11931351291544832) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-345534399907127267 : Rat) / 11931351291544832) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-345534399907127267 : Rat) / 5965675645772416) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((345534399907127267 : Rat) / 11931351291544832) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((345534399907127267 : Rat) / 11931351291544832) [(3, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0445_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0445
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0446 : Poly :=
[
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 446 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0446 : Poly :=
[
  term ((3641703605988597 : Rat) / 37605062552815408) [(3, 2), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(3, 2), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0446_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0446
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0447 : Poly :=
[
  term ((63998085270441607479 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 447 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0447 : Poly :=
[
  term ((-63998085270441607479 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((63998085270441607479 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((63998085270441607479 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((63998085270441607479 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-63998085270441607479 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-63998085270441607479 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0447_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0447
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0448 : Poly :=
[
  term ((-98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0448 : Poly :=
[
  term ((98325997361692119 : Rat) / 37605062552815408) [(3, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-98325997361692119 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0448_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0448
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0449 : Poly :=
[
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0449 : Poly :=
[
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0449_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0449
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0450 : Poly :=
[
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 450 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0450 : Poly :=
[
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0450_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0450
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0451 : Poly :=
[
  term ((149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0451 : Poly :=
[
  term ((-149309847845532477 : Rat) / 150420250211261632) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((149309847845532477 : Rat) / 150420250211261632) [(3, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0451_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0451
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0452 : Poly :=
[
  term ((-441934583769191284047 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 452 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0452 : Poly :=
[
  term ((441934583769191284047 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-441934583769191284047 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-441934583769191284047 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-441934583769191284047 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((441934583769191284047 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((441934583769191284047 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0452_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0452
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0453 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 453 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0453 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (6, 2), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (14, 2), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0453_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0453
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0454 : Poly :=
[
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 454 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0454 : Poly :=
[
  term ((-121178165322538353 : Rat) / 37605062552815408) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0454_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0454
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0455 : Poly :=
[
  term ((-202821220773077736273 : Rat) / 16847068023661302784) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 455 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0455 : Poly :=
[
  term ((202821220773077736273 : Rat) / 8423534011830651392) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-202821220773077736273 : Rat) / 16847068023661302784) [(3, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-202821220773077736273 : Rat) / 16847068023661302784) [(3, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-202821220773077736273 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((202821220773077736273 : Rat) / 16847068023661302784) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((202821220773077736273 : Rat) / 16847068023661302784) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0455_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0455
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0456 : Poly :=
[
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0456 : Poly :=
[
  term ((111265474525641 : Rat) / 426119688983744) [(3, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0456_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0456
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0457 : Poly :=
[
  term ((-115959430194856863 : Rat) / 23862702583089664) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 457 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0457 : Poly :=
[
  term ((115959430194856863 : Rat) / 11931351291544832) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-115959430194856863 : Rat) / 23862702583089664) [(3, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-115959430194856863 : Rat) / 23862702583089664) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-115959430194856863 : Rat) / 11931351291544832) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((115959430194856863 : Rat) / 23862702583089664) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((115959430194856863 : Rat) / 23862702583089664) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0457_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0457
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0458 : Poly :=
[
  term ((3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0458 : Poly :=
[
  term ((-3271810463708535531 : Rat) / 37605062552815408) [(3, 2), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (6, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((3271810463708535531 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0458_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0458
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0459 : Poly :=
[
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0459 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0459_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0459
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0460 : Poly :=
[
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 460 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0460 : Poly :=
[
  term ((3004167812192307 : Rat) / 426119688983744) [(3, 2), (6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 2), (6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 2), (7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-3004167812192307 : Rat) / 426119688983744) [(3, 2), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0460_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0460
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0461 : Poly :=
[
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 461 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0461 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 2), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 2), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 2), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 2), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0461_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0461
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0462 : Poly :=
[
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0462 : Poly :=
[
  term ((4968304778224072473 : Rat) / 150420250211261632) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4968304778224072473 : Rat) / 150420250211261632) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0462_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0462
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0463 : Poly :=
[
  term ((2457779483787152057245 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0463 : Poly :=
[
  term ((-2457779483787152057245 : Rat) / 8423534011830651392) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2457779483787152057245 : Rat) / 16847068023661302784) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((2457779483787152057245 : Rat) / 16847068023661302784) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((2457779483787152057245 : Rat) / 8423534011830651392) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2457779483787152057245 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2457779483787152057245 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0463_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0463
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0464 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 464 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0464 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 2), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 2), (6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 2), (7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0464_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0464
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0465 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (16, 1)]
]

/-- Partial product 465 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0465 : Poly :=
[
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (6, 2), (11, 2), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (7, 2), (11, 2), (16, 1)],
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (14, 2), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0465_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0465
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0466 : Poly :=
[
  term ((4561884455551281 : Rat) / 3408957511869952) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 466 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0466 : Poly :=
[
  term ((-4561884455551281 : Rat) / 1704478755934976) [(3, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((4561884455551281 : Rat) / 3408957511869952) [(3, 2), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((4561884455551281 : Rat) / 3408957511869952) [(3, 2), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(3, 2), (14, 1), (15, 4), (16, 1)],
  term ((4561884455551281 : Rat) / 1704478755934976) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(3, 2), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0466_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0466
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0467 : Poly :=
[
  term ((1857274595849179503 : Rat) / 47725405166179328) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 467 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0467 : Poly :=
[
  term ((-1857274595849179503 : Rat) / 23862702583089664) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((1857274595849179503 : Rat) / 47725405166179328) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((1857274595849179503 : Rat) / 47725405166179328) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((1857274595849179503 : Rat) / 23862702583089664) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1857274595849179503 : Rat) / 47725405166179328) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1857274595849179503 : Rat) / 47725405166179328) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0467_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0467
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0468 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 2), (15, 4), (16, 1)]
]

/-- Partial product 468 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0468 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 2), (6, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 2), (6, 2), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 2), (7, 2), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 2), (14, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (14, 2), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0468_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0468
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0469 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (16, 1)]
]

/-- Partial product 469 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0469 : Poly :=
[
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (6, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (6, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (7, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(3, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 2), (14, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0469_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0469
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0470 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 470 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0470 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0470_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0470
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0471 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 471 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0471 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0471_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0471
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0472 : Poly :=
[
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 472 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0472 : Poly :=
[
  term ((6901028333348391315 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0472_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0472
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0473 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 473 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0473 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0473_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0473
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0474 : Poly :=
[
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 474 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0474 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0474_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0474
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0475 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 475 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0475 : Poly :=
[
  term ((349947488033723 : Rat) / 213059844491872) [(4, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (6, 2), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0475_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0475
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0476 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 476 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0476 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (6, 2), (8, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0476_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0476
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0477 : Poly :=
[
  term ((1749737440168615 : Rat) / 1704478755934976) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 477 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0477 : Poly :=
[
  term ((-1749737440168615 : Rat) / 852239377967488) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((1749737440168615 : Rat) / 1704478755934976) [(4, 1), (6, 2), (8, 1), (16, 1)],
  term ((1749737440168615 : Rat) / 1704478755934976) [(4, 1), (7, 2), (8, 1), (16, 1)],
  term ((1749737440168615 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-1749737440168615 : Rat) / 1704478755934976) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((-1749737440168615 : Rat) / 1704478755934976) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0477_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0477
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0478 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 478 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0478 : Poly :=
[
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0478_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0478
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0479 : Poly :=
[
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 479 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0479 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0479_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0479
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0480 : Poly :=
[
  term ((96997968624512771455 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 480 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0480 : Poly :=
[
  term ((-96997968624512771455 : Rat) / 3610086005070279168) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((96997968624512771455 : Rat) / 7220172010140558336) [(4, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((96997968624512771455 : Rat) / 7220172010140558336) [(4, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((96997968624512771455 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-96997968624512771455 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-96997968624512771455 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0480_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0480
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0481 : Poly :=
[
  term ((-14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 481 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0481 : Poly :=
[
  term ((14849754300339743 : Rat) / 852239377967488) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 1704478755934976) [(4, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 1704478755934976) [(4, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14849754300339743 : Rat) / 852239377967488) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0481_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0481
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0482 : Poly :=
[
  term ((-18086824172329607 : Rat) / 3408957511869952) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 482 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0482 : Poly :=
[
  term ((18086824172329607 : Rat) / 1704478755934976) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((-18086824172329607 : Rat) / 3408957511869952) [(4, 1), (6, 2), (10, 1), (16, 1)],
  term ((-18086824172329607 : Rat) / 3408957511869952) [(4, 1), (7, 2), (10, 1), (16, 1)],
  term ((-18086824172329607 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((18086824172329607 : Rat) / 3408957511869952) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((18086824172329607 : Rat) / 3408957511869952) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0482_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0482
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0483 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (16, 1)]
]

/-- Partial product 483 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0483 : Poly :=
[
  term ((-3249908850494927 : Rat) / 426119688983744) [(4, 1), (6, 1), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (6, 2), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (7, 2), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 426119688983744) [(4, 1), (10, 2), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (14, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0483_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0483
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0484 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 484 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0484 : Poly :=
[
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0484_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0484
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0485 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 485 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0485 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0485_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0485
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0486 : Poly :=
[
  term ((4007197355959827 : Rat) / 426119688983744) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 486 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0486 : Poly :=
[
  term ((-4007197355959827 : Rat) / 213059844491872) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((4007197355959827 : Rat) / 426119688983744) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((4007197355959827 : Rat) / 426119688983744) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-4007197355959827 : Rat) / 426119688983744) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((4007197355959827 : Rat) / 213059844491872) [(4, 1), (14, 2), (16, 1)],
  term ((-4007197355959827 : Rat) / 426119688983744) [(4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0486_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0486
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0487 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 2), (16, 1)]
]

/-- Partial product 487 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0487 : Poly :=
[
  term ((-724990340615301 : Rat) / 106529922245936) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(4, 1), (6, 2), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(4, 1), (7, 2), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (14, 3), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0487_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0487
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0488 : Poly :=
[
  term ((120223661835295 : Rat) / 121748482566784) [(4, 1), (16, 1)]
]

/-- Partial product 488 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0488 : Poly :=
[
  term ((-120223661835295 : Rat) / 60874241283392) [(4, 1), (6, 1), (16, 1)],
  term ((120223661835295 : Rat) / 121748482566784) [(4, 1), (6, 2), (16, 1)],
  term ((120223661835295 : Rat) / 121748482566784) [(4, 1), (7, 2), (16, 1)],
  term ((120223661835295 : Rat) / 60874241283392) [(4, 1), (14, 1), (16, 1)],
  term ((-120223661835295 : Rat) / 121748482566784) [(4, 1), (14, 2), (16, 1)],
  term ((-120223661835295 : Rat) / 121748482566784) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0488_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0488
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0489 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 489 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0489 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0489_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0489
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0490 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 490 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0490 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0490_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0490
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0491 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0491 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0491_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0491
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0492 : Poly :=
[
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 492 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0492 : Poly :=
[
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0492_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0492
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0493 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 493 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0493 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0493_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0493
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0494 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0494 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0494_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0494
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0495 : Poly :=
[
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 495 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0495 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0495_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0495
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0496 : Poly :=
[
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 496 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0496 : Poly :=
[
  term ((-38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0496_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0496
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0497 : Poly :=
[
  term ((-115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 497 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0497 : Poly :=
[
  term ((115606068534436071705 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-115606068534436071705 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0497_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0497
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0498 : Poly :=
[
  term ((-1397498630813848353639 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 498 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0498 : Poly :=
[
  term ((1397498630813848353639 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1397498630813848353639 : Rat) / 134776544189290422272) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-1397498630813848353639 : Rat) / 134776544189290422272) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-1397498630813848353639 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((1397498630813848353639 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((1397498630813848353639 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0498_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0498
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0499 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 499 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0499 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0499_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0499
        rs_R010_ueqv_R010NYY_generator_05_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_05_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_05_0400_0499 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_05_0400,
  rs_R010_ueqv_R010NYY_partial_05_0401,
  rs_R010_ueqv_R010NYY_partial_05_0402,
  rs_R010_ueqv_R010NYY_partial_05_0403,
  rs_R010_ueqv_R010NYY_partial_05_0404,
  rs_R010_ueqv_R010NYY_partial_05_0405,
  rs_R010_ueqv_R010NYY_partial_05_0406,
  rs_R010_ueqv_R010NYY_partial_05_0407,
  rs_R010_ueqv_R010NYY_partial_05_0408,
  rs_R010_ueqv_R010NYY_partial_05_0409,
  rs_R010_ueqv_R010NYY_partial_05_0410,
  rs_R010_ueqv_R010NYY_partial_05_0411,
  rs_R010_ueqv_R010NYY_partial_05_0412,
  rs_R010_ueqv_R010NYY_partial_05_0413,
  rs_R010_ueqv_R010NYY_partial_05_0414,
  rs_R010_ueqv_R010NYY_partial_05_0415,
  rs_R010_ueqv_R010NYY_partial_05_0416,
  rs_R010_ueqv_R010NYY_partial_05_0417,
  rs_R010_ueqv_R010NYY_partial_05_0418,
  rs_R010_ueqv_R010NYY_partial_05_0419,
  rs_R010_ueqv_R010NYY_partial_05_0420,
  rs_R010_ueqv_R010NYY_partial_05_0421,
  rs_R010_ueqv_R010NYY_partial_05_0422,
  rs_R010_ueqv_R010NYY_partial_05_0423,
  rs_R010_ueqv_R010NYY_partial_05_0424,
  rs_R010_ueqv_R010NYY_partial_05_0425,
  rs_R010_ueqv_R010NYY_partial_05_0426,
  rs_R010_ueqv_R010NYY_partial_05_0427,
  rs_R010_ueqv_R010NYY_partial_05_0428,
  rs_R010_ueqv_R010NYY_partial_05_0429,
  rs_R010_ueqv_R010NYY_partial_05_0430,
  rs_R010_ueqv_R010NYY_partial_05_0431,
  rs_R010_ueqv_R010NYY_partial_05_0432,
  rs_R010_ueqv_R010NYY_partial_05_0433,
  rs_R010_ueqv_R010NYY_partial_05_0434,
  rs_R010_ueqv_R010NYY_partial_05_0435,
  rs_R010_ueqv_R010NYY_partial_05_0436,
  rs_R010_ueqv_R010NYY_partial_05_0437,
  rs_R010_ueqv_R010NYY_partial_05_0438,
  rs_R010_ueqv_R010NYY_partial_05_0439,
  rs_R010_ueqv_R010NYY_partial_05_0440,
  rs_R010_ueqv_R010NYY_partial_05_0441,
  rs_R010_ueqv_R010NYY_partial_05_0442,
  rs_R010_ueqv_R010NYY_partial_05_0443,
  rs_R010_ueqv_R010NYY_partial_05_0444,
  rs_R010_ueqv_R010NYY_partial_05_0445,
  rs_R010_ueqv_R010NYY_partial_05_0446,
  rs_R010_ueqv_R010NYY_partial_05_0447,
  rs_R010_ueqv_R010NYY_partial_05_0448,
  rs_R010_ueqv_R010NYY_partial_05_0449,
  rs_R010_ueqv_R010NYY_partial_05_0450,
  rs_R010_ueqv_R010NYY_partial_05_0451,
  rs_R010_ueqv_R010NYY_partial_05_0452,
  rs_R010_ueqv_R010NYY_partial_05_0453,
  rs_R010_ueqv_R010NYY_partial_05_0454,
  rs_R010_ueqv_R010NYY_partial_05_0455,
  rs_R010_ueqv_R010NYY_partial_05_0456,
  rs_R010_ueqv_R010NYY_partial_05_0457,
  rs_R010_ueqv_R010NYY_partial_05_0458,
  rs_R010_ueqv_R010NYY_partial_05_0459,
  rs_R010_ueqv_R010NYY_partial_05_0460,
  rs_R010_ueqv_R010NYY_partial_05_0461,
  rs_R010_ueqv_R010NYY_partial_05_0462,
  rs_R010_ueqv_R010NYY_partial_05_0463,
  rs_R010_ueqv_R010NYY_partial_05_0464,
  rs_R010_ueqv_R010NYY_partial_05_0465,
  rs_R010_ueqv_R010NYY_partial_05_0466,
  rs_R010_ueqv_R010NYY_partial_05_0467,
  rs_R010_ueqv_R010NYY_partial_05_0468,
  rs_R010_ueqv_R010NYY_partial_05_0469,
  rs_R010_ueqv_R010NYY_partial_05_0470,
  rs_R010_ueqv_R010NYY_partial_05_0471,
  rs_R010_ueqv_R010NYY_partial_05_0472,
  rs_R010_ueqv_R010NYY_partial_05_0473,
  rs_R010_ueqv_R010NYY_partial_05_0474,
  rs_R010_ueqv_R010NYY_partial_05_0475,
  rs_R010_ueqv_R010NYY_partial_05_0476,
  rs_R010_ueqv_R010NYY_partial_05_0477,
  rs_R010_ueqv_R010NYY_partial_05_0478,
  rs_R010_ueqv_R010NYY_partial_05_0479,
  rs_R010_ueqv_R010NYY_partial_05_0480,
  rs_R010_ueqv_R010NYY_partial_05_0481,
  rs_R010_ueqv_R010NYY_partial_05_0482,
  rs_R010_ueqv_R010NYY_partial_05_0483,
  rs_R010_ueqv_R010NYY_partial_05_0484,
  rs_R010_ueqv_R010NYY_partial_05_0485,
  rs_R010_ueqv_R010NYY_partial_05_0486,
  rs_R010_ueqv_R010NYY_partial_05_0487,
  rs_R010_ueqv_R010NYY_partial_05_0488,
  rs_R010_ueqv_R010NYY_partial_05_0489,
  rs_R010_ueqv_R010NYY_partial_05_0490,
  rs_R010_ueqv_R010NYY_partial_05_0491,
  rs_R010_ueqv_R010NYY_partial_05_0492,
  rs_R010_ueqv_R010NYY_partial_05_0493,
  rs_R010_ueqv_R010NYY_partial_05_0494,
  rs_R010_ueqv_R010NYY_partial_05_0495,
  rs_R010_ueqv_R010NYY_partial_05_0496,
  rs_R010_ueqv_R010NYY_partial_05_0497,
  rs_R010_ueqv_R010NYY_partial_05_0498,
  rs_R010_ueqv_R010NYY_partial_05_0499
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_05_0400_0499 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(3, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2389324849160611452179 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189099744644419281 : Rat) / 23862702583089664) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 23862702583089664) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 182622723850176) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-534733629761855081 : Rat) / 47725405166179328) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(3, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2301633344300590327 : Rat) / 110835973839876992) [(3, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5707104705546903 : Rat) / 745709455721552) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 37605062552815408) [(3, 1), (6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2586646749792967006921 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-978285603302727941883 : Rat) / 4211767005915325696) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 426119688983744) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56706756499841811 : Rat) / 745709455721552) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-19191549556233499 : Rat) / 372854727860776) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((121178165322538353 : Rat) / 4065412167871936) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2588376395056165472821 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-55741396979956835619 : Rat) / 2105883502957662848) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((419193593204394025679 : Rat) / 6317650508872988544) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((24317143221073791373813 : Rat) / 151623612212951725056) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (11, 1), (15, 4), (16, 1)],
  term ((1111731199553203237117 : Rat) / 25270602035491954176) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 4211767005915325696) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9323021292936897126521 : Rat) / 25270602035491954176) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (11, 2), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 46066993403648) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1841697429415589763 : Rat) / 23862702583089664) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((6437353663455574495 : Rat) / 429528646495613952) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((1965848046243182251 : Rat) / 107382161623903488) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((345534399907127267 : Rat) / 5965675645772416) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(3, 1), (6, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((2389324849160611452179 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((189099744644419281 : Rat) / 47725405166179328) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(3, 1), (6, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((534733629761855081 : Rat) / 95450810332358656) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 730490895400704) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (6, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((2301633344300590327 : Rat) / 221671947679753984) [(3, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(3, 1), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((5707104705546903 : Rat) / 1491418911443104) [(3, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (6, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (6, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2586646749792967006921 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (6, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((978285603302727941883 : Rat) / 8423534011830651392) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (6, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (6, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((56706756499841811 : Rat) / 1491418911443104) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((19191549556233499 : Rat) / 745709455721552) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (6, 2), (10, 1), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 8130824335743872) [(3, 1), (6, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2588376395056165472821 : Rat) / 16847068023661302784) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((55741396979956835619 : Rat) / 4211767005915325696) [(3, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-419193593204394025679 : Rat) / 12635301017745977088) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-24317143221073791373813 : Rat) / 303247224425903450112) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (11, 1), (15, 4), (16, 1)],
  term ((-1111731199553203237117 : Rat) / 50541204070983908352) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (6, 2), (11, 2), (13, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (6, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((9323021292936897126521 : Rat) / 50541204070983908352) [(3, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 2), (11, 2), (15, 3), (16, 1)],
  term ((111265474525641 : Rat) / 92133986807296) [(3, 1), (6, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1841697429415589763 : Rat) / 47725405166179328) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 2), (13, 1), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-6437353663455574495 : Rat) / 859057292991227904) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (6, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1965848046243182251 : Rat) / 214764323247806976) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-345534399907127267 : Rat) / 11931351291544832) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(3, 1), (7, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((2389324849160611452179 : Rat) / 16847068023661302784) [(3, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((189099744644419281 : Rat) / 47725405166179328) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((534733629761855081 : Rat) / 95450810332358656) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 730490895400704) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (7, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((2301633344300590327 : Rat) / 221671947679753984) [(3, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(3, 1), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((5707104705546903 : Rat) / 1491418911443104) [(3, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (7, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (7, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2586646749792967006921 : Rat) / 16847068023661302784) [(3, 1), (7, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (7, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((978285603302727941883 : Rat) / 8423534011830651392) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (7, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((56706756499841811 : Rat) / 1491418911443104) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((19191549556233499 : Rat) / 745709455721552) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (7, 2), (10, 1), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 8130824335743872) [(3, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2588376395056165472821 : Rat) / 16847068023661302784) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((55741396979956835619 : Rat) / 4211767005915325696) [(3, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-419193593204394025679 : Rat) / 12635301017745977088) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-24317143221073791373813 : Rat) / 303247224425903450112) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (11, 1), (15, 4), (16, 1)],
  term ((-1111731199553203237117 : Rat) / 50541204070983908352) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (7, 2), (11, 2), (13, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (7, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((9323021292936897126521 : Rat) / 50541204070983908352) [(3, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 2), (11, 2), (15, 3), (16, 1)],
  term ((111265474525641 : Rat) / 92133986807296) [(3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1841697429415589763 : Rat) / 47725405166179328) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-6437353663455574495 : Rat) / 859057292991227904) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1965848046243182251 : Rat) / 214764323247806976) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-345534399907127267 : Rat) / 11931351291544832) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 5), (16, 1)],
  term ((-452714770033442357057 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((2389324849160611452179 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1373421955988937338635 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (14, 3), (16, 1)],
  term ((-2389324849160611452179 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 4), (16, 1)],
  term ((189099744644419281 : Rat) / 23862702583089664) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-176638011497547489 : Rat) / 47725405166179328) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-189099744644419281 : Rat) / 47725405166179328) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1818425896736308259 : Rat) / 143176215498537984) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((1662463400195904883 : Rat) / 95450810332358656) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 243496965133568) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 3), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((546492365945773 : Rat) / 730490895400704) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-534733629761855081 : Rat) / 95450810332358656) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2301633344300590327 : Rat) / 110835973839876992) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-707235691499425887525 : Rat) / 4211767005915325696) [(3, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(3, 1), (9, 2), (11, 1), (14, 3), (16, 1)],
  term ((-2301633344300590327 : Rat) / 221671947679753984) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((5707104705546903 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-98059257756536667 : Rat) / 1491418911443104) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 3), (15, 1), (16, 1)],
  term ((-5707104705546903 : Rat) / 1491418911443104) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3271810463708535531 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2342351568502729687273 : Rat) / 16847068023661302784) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((978285603302727941883 : Rat) / 4211767005915325696) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1817672479838075295 : Rat) / 21488607173037376) [(3, 1), (10, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((804180573245119532519 : Rat) / 4211767005915325696) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (14, 3), (15, 2), (16, 1)],
  term ((-2586646749792967006921 : Rat) / 16847068023661302784) [(3, 1), (10, 1), (11, 1), (14, 3), (16, 1)],
  term ((-978285603302727941883 : Rat) / 8423534011830651392) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (15, 4), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((3004167812192307 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 3), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((19191549556233499 : Rat) / 372854727860776) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-233836750894482627 : Rat) / 5965675645772416) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (14, 1), (15, 5), (16, 1)],
  term ((4689400867951039 : Rat) / 93213681965194) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1668982117884615 : Rat) / 243496965133568) [(3, 1), (10, 1), (14, 2), (15, 3), (16, 1)],
  term ((-56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (14, 3), (15, 3), (16, 1)],
  term ((-19191549556233499 : Rat) / 745709455721552) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (15, 5), (16, 1)],
  term ((-2588376395056165472821 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27749799858861282837 : Rat) / 300840500422523264) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2086214077959566537989 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((2588376395056165472821 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-19286820102621063065665 : Rat) / 151623612212951725056) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1544602430256967377 : Rat) / 221671947679753984) [(3, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1111731199553203237117 : Rat) / 25270602035491954176) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((32343904386187575702949 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term ((-106753216480092808015 : Rat) / 2406724003380186112) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-55741396979956835619 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (14, 3), (15, 2), (16, 1)],
  term ((419193593204394025679 : Rat) / 12635301017745977088) [(3, 1), (11, 1), (14, 3), (16, 1)],
  term ((1111731199553203237117 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((24317143221073791373813 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (15, 6), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((9323021292936897126521 : Rat) / 25270602035491954176) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-440718010014444166869 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((-11851850974051161352829 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (14, 2), (15, 3), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (14, 3), (15, 1), (16, 1)],
  term ((-9323021292936897126521 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (15, 5), (16, 1)],
  term ((-1841697429415589763 : Rat) / 23862702583089664) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25479793666371789 : Rat) / 3408957511869952) [(3, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1956968461024153839 : Rat) / 47725405166179328) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 92133986807296) [(3, 1), (13, 1), (14, 3), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1841697429415589763 : Rat) / 47725405166179328) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (15, 6), (16, 1)],
  term ((-1965848046243182251 : Rat) / 107382161623903488) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43319599923170751953 : Rat) / 859057292991227904) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (14, 1), (15, 5), (16, 1)],
  term ((-357951081567029999 : Rat) / 61361235213659136) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((308149200466511891 : Rat) / 11931351291544832) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((6437353663455574495 : Rat) / 859057292991227904) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (14, 3), (15, 3), (16, 1)],
  term ((1965848046243182251 : Rat) / 214764323247806976) [(3, 1), (15, 3), (16, 1)],
  term ((345534399907127267 : Rat) / 11931351291544832) [(3, 1), (15, 5), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(3, 2), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-63998085270441607479 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 37605062552815408) [(3, 2), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-149309847845532477 : Rat) / 150420250211261632) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((441934583769191284047 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((63998085270441607479 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-441934583769191284047 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (6, 2), (15, 3), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((63998085270441607479 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-441934583769191284047 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((63998085270441607479 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-67261051701407390391 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (14, 3), (16, 1)],
  term ((-63998085270441607479 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-360528656992871103 : Rat) / 150420250211261632) [(3, 2), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (10, 1), (15, 3), (16, 1)],
  term ((3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-441934583769191284047 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((549897244504278147 : Rat) / 300840500422523264) [(3, 2), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((475379989686590558895 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (14, 2), (15, 3), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (14, 3), (15, 1), (16, 1)],
  term ((441934583769191284047 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (15, 5), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((202821220773077736273 : Rat) / 8423534011830651392) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(3, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((115959430194856863 : Rat) / 11931351291544832) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 37605062552815408) [(3, 2), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3004167812192307 : Rat) / 426119688983744) [(3, 2), (6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 2), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((4968304778224072473 : Rat) / 150420250211261632) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2457779483787152057245 : Rat) / 8423534011830651392) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 2), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((-4561884455551281 : Rat) / 1704478755934976) [(3, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1857274595849179503 : Rat) / 23862702583089664) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 2), (6, 1), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (6, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-202821220773077736273 : Rat) / 16847068023661302784) [(3, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-115959430194856863 : Rat) / 23862702583089664) [(3, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (6, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 2), (6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 2), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2457779483787152057245 : Rat) / 16847068023661302784) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 2), (6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (6, 2), (11, 2), (16, 1)],
  term ((4561884455551281 : Rat) / 3408957511869952) [(3, 2), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((1857274595849179503 : Rat) / 47725405166179328) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 2), (6, 2), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (6, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-202821220773077736273 : Rat) / 16847068023661302784) [(3, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-115959430194856863 : Rat) / 23862702583089664) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 2), (7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 2), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2457779483787152057245 : Rat) / 16847068023661302784) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 2), (7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (7, 2), (11, 2), (16, 1)],
  term ((4561884455551281 : Rat) / 3408957511869952) [(3, 2), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((1857274595849179503 : Rat) / 47725405166179328) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 2), (7, 2), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (7, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-202821220773077736273 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((257109038837574918417 : Rat) / 16847068023661302784) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((202821220773077736273 : Rat) / 16847068023661302784) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-115959430194856863 : Rat) / 11931351291544832) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((109728563621420967 : Rat) / 23862702583089664) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((115959430194856863 : Rat) / 23862702583089664) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((11996638366931296947 : Rat) / 150420250211261632) [(3, 2), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-11015281978038459 : Rat) / 1704478755934976) [(3, 2), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 3), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 2), (10, 1), (15, 4), (16, 1)],
  term ((2457779483787152057245 : Rat) / 8423534011830651392) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18297902963703291303 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3014229618948248174221 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2457779483787152057245 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (15, 5), (16, 1)],
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (14, 2), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((1857274595849179503 : Rat) / 23862702583089664) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((16801086653371791 : Rat) / 3408957511869952) [(3, 2), (14, 1), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(3, 2), (14, 1), (16, 1)],
  term ((-1729541831093743635 : Rat) / 47725405166179328) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (14, 2), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 2), (14, 2), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(3, 2), (14, 3), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 2), (15, 2), (16, 1)],
  term ((-1857274595849179503 : Rat) / 47725405166179328) [(3, 2), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (15, 6), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((6901028333348391315 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6901028333348391315 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 3), (16, 1)],
  term ((6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 3), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(4, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-1749737440168615 : Rat) / 852239377967488) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-96997968624512771455 : Rat) / 3610086005070279168) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 852239377967488) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((18086824172329607 : Rat) / 1704478755934976) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 426119688983744) [(4, 1), (6, 1), (10, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-4007197355959827 : Rat) / 213059844491872) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-120223661835295 : Rat) / 60874241283392) [(4, 1), (6, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (6, 2), (8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (6, 2), (8, 1), (14, 1), (16, 1)],
  term ((1749737440168615 : Rat) / 1704478755934976) [(4, 1), (6, 2), (8, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((96997968624512771455 : Rat) / 7220172010140558336) [(4, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 1704478755934976) [(4, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-18086824172329607 : Rat) / 3408957511869952) [(4, 1), (6, 2), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (6, 2), (10, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((4007197355959827 : Rat) / 426119688983744) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(4, 1), (6, 2), (14, 2), (16, 1)],
  term ((120223661835295 : Rat) / 121748482566784) [(4, 1), (6, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((1749737440168615 : Rat) / 1704478755934976) [(4, 1), (7, 2), (8, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((96997968624512771455 : Rat) / 7220172010140558336) [(4, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 1704478755934976) [(4, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-18086824172329607 : Rat) / 3408957511869952) [(4, 1), (7, 2), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (7, 2), (10, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((4007197355959827 : Rat) / 426119688983744) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(4, 1), (7, 2), (14, 2), (16, 1)],
  term ((120223661835295 : Rat) / 121748482566784) [(4, 1), (7, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1749737440168615 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 3), (16, 1)],
  term ((-1749737440168615 : Rat) / 1704478755934976) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((96997968624512771455 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((-96997968624512771455 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18086824172329607 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-41312193029029365 : Rat) / 3408957511869952) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 3), (16, 1)],
  term ((18086824172329607 : Rat) / 3408957511869952) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 426119688983744) [(4, 1), (10, 2), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (14, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 3), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4007197355959827 : Rat) / 426119688983744) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((120223661835295 : Rat) / 60874241283392) [(4, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((15187223790992243 : Rat) / 852239377967488) [(4, 1), (14, 2), (16, 1)],
  term ((-1107235993498623 : Rat) / 426119688983744) [(4, 1), (14, 3), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 4), (16, 1)],
  term ((-120223661835295 : Rat) / 121748482566784) [(4, 1), (15, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-265830822761617562871 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((1397498630813848353639 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((128248934370366184665 : Rat) / 134776544189290422272) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 3), (8, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 3), (8, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 3), (8, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 3), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1397498630813848353639 : Rat) / 134776544189290422272) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 3), (9, 2), (16, 1)],
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1397498630813848353639 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((935074356676104066819 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 3), (16, 1)],
  term ((1397498630813848353639 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 400 through 499. -/
theorem rs_R010_ueqv_R010NYY_block_05_0400_0499_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_05_0400_0499
      rs_R010_ueqv_R010NYY_block_05_0400_0499 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
