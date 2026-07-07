/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 27:400-491

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0400 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0400 : Poly :=
[
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0400_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0400
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0401 : Poly :=
[
  term ((-930355518024375047 : Rat) / 1253262785116608) [(9, 1), (15, 1)]
]

/-- Partial product 401 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0401 : Poly :=
[
  term ((930355518024375047 : Rat) / 626631392558304) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-930355518024375047 : Rat) / 1253262785116608) [(0, 2), (9, 1), (15, 1)],
  term ((930355518024375047 : Rat) / 626631392558304) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-930355518024375047 : Rat) / 1253262785116608) [(1, 2), (9, 1), (15, 1)],
  term ((-930355518024375047 : Rat) / 626631392558304) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-930355518024375047 : Rat) / 626631392558304) [(9, 1), (13, 1), (15, 2)],
  term ((930355518024375047 : Rat) / 1253262785116608) [(9, 1), (14, 2), (15, 1)],
  term ((930355518024375047 : Rat) / 1253262785116608) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0401_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0401
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0402 : Poly :=
[
  term ((-241 : Rat) / 42) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0402 : Poly :=
[
  term ((241 : Rat) / 21) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-241 : Rat) / 42) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((241 : Rat) / 21) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-241 : Rat) / 42) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-241 : Rat) / 21) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-241 : Rat) / 21) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((241 : Rat) / 42) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((241 : Rat) / 42) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0402_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0402
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0403 : Poly :=
[
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (15, 3)]
]

/-- Partial product 403 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0403 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (13, 1), (15, 4)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0403_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0403
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0404 : Poly :=
[
  term ((65 : Rat) / 14) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 404 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0404 : Poly :=
[
  term ((-65 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-65 : Rat) / 14) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0404_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0404
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0405 : Poly :=
[
  term ((14142509592084785 : Rat) / 69625710284256) [(9, 2)]
]

/-- Partial product 405 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0405 : Poly :=
[
  term ((-14142509592084785 : Rat) / 34812855142128) [(0, 1), (9, 2), (12, 1)],
  term ((14142509592084785 : Rat) / 69625710284256) [(0, 2), (9, 2)],
  term ((-14142509592084785 : Rat) / 34812855142128) [(1, 1), (9, 2), (13, 1)],
  term ((14142509592084785 : Rat) / 69625710284256) [(1, 2), (9, 2)],
  term ((14142509592084785 : Rat) / 34812855142128) [(9, 2), (12, 1), (14, 1)],
  term ((14142509592084785 : Rat) / 34812855142128) [(9, 2), (13, 1), (15, 1)],
  term ((-14142509592084785 : Rat) / 69625710284256) [(9, 2), (14, 2)],
  term ((-14142509592084785 : Rat) / 69625710284256) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0405_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0405
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0406 : Poly :=
[
  term ((-1340248469261 : Rat) / 17986491936) [(9, 2), (10, 1)]
]

/-- Partial product 406 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0406 : Poly :=
[
  term ((1340248469261 : Rat) / 8993245968) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-1340248469261 : Rat) / 17986491936) [(0, 2), (9, 2), (10, 1)],
  term ((1340248469261 : Rat) / 8993245968) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((-1340248469261 : Rat) / 17986491936) [(1, 2), (9, 2), (10, 1)],
  term ((-1340248469261 : Rat) / 8993245968) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-1340248469261 : Rat) / 8993245968) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((1340248469261 : Rat) / 17986491936) [(9, 2), (10, 1), (14, 2)],
  term ((1340248469261 : Rat) / 17986491936) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0406_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0406
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0407 : Poly :=
[
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 407 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0407 : Poly :=
[
  term ((-67338253723 : Rat) / 2248311492) [(0, 1), (9, 2), (10, 1), (12, 2)],
  term ((67338253723 : Rat) / 4496622984) [(0, 2), (9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(1, 1), (9, 2), (10, 1), (12, 1), (13, 1)],
  term ((67338253723 : Rat) / 4496622984) [(1, 2), (9, 2), (10, 1), (12, 1)],
  term ((67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (14, 2)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (15, 2)],
  term ((67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0407_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0407
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0408 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 408 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0408 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(0, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-2172201733 : Rat) / 333083184) [(0, 2), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((-2172201733 : Rat) / 333083184) [(1, 2), (9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (12, 1), (14, 2)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0408_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0408
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0409 : Poly :=
[
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1)]
]

/-- Partial product 409 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0409 : Poly :=
[
  term ((997316410233 : Rat) / 4385595256) [(0, 1), (9, 2), (12, 2)],
  term ((-997316410233 : Rat) / 8771190512) [(0, 2), (9, 2), (12, 1)],
  term ((997316410233 : Rat) / 4385595256) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(1, 2), (9, 2), (12, 1)],
  term ((-997316410233 : Rat) / 4385595256) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (14, 2)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (15, 2)],
  term ((-997316410233 : Rat) / 4385595256) [(9, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0409_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0409
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0410 : Poly :=
[
  term ((-18706262231446519 : Rat) / 69625710284256) [(9, 2), (14, 1)]
]

/-- Partial product 410 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0410 : Poly :=
[
  term ((18706262231446519 : Rat) / 34812855142128) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((-18706262231446519 : Rat) / 69625710284256) [(0, 2), (9, 2), (14, 1)],
  term ((18706262231446519 : Rat) / 34812855142128) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((-18706262231446519 : Rat) / 69625710284256) [(1, 2), (9, 2), (14, 1)],
  term ((-18706262231446519 : Rat) / 34812855142128) [(9, 2), (12, 1), (14, 2)],
  term ((-18706262231446519 : Rat) / 34812855142128) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((18706262231446519 : Rat) / 69625710284256) [(9, 2), (14, 1), (15, 2)],
  term ((18706262231446519 : Rat) / 69625710284256) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0410_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0410
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0411 : Poly :=
[
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (14, 2)]
]

/-- Partial product 411 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0411 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 3)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 2), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0411_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0411
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0412 : Poly :=
[
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (15, 2)]
]

/-- Partial product 412 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0412 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (13, 1), (15, 3)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (14, 2), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0412_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0412
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0413 : Poly :=
[
  term ((-16808805423133 : Rat) / 725267815461) [(10, 1)]
]

/-- Partial product 413 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0413 : Poly :=
[
  term ((33617610846266 : Rat) / 725267815461) [(0, 1), (10, 1), (12, 1)],
  term ((-16808805423133 : Rat) / 725267815461) [(0, 2), (10, 1)],
  term ((33617610846266 : Rat) / 725267815461) [(1, 1), (10, 1), (13, 1)],
  term ((-16808805423133 : Rat) / 725267815461) [(1, 2), (10, 1)],
  term ((-33617610846266 : Rat) / 725267815461) [(10, 1), (12, 1), (14, 1)],
  term ((-33617610846266 : Rat) / 725267815461) [(10, 1), (13, 1), (15, 1)],
  term ((16808805423133 : Rat) / 725267815461) [(10, 1), (14, 2)],
  term ((16808805423133 : Rat) / 725267815461) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0413_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0413
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0414 : Poly :=
[
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 414 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0414 : Poly :=
[
  term ((-149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0414_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0414
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0415 : Poly :=
[
  term ((6607701279353 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 415 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0415 : Poly :=
[
  term ((-6607701279353 : Rat) / 9867589326) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((6607701279353 : Rat) / 19735178652) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-6607701279353 : Rat) / 9867589326) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((6607701279353 : Rat) / 19735178652) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((6607701279353 : Rat) / 9867589326) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6607701279353 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-6607701279353 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((6607701279353 : Rat) / 9867589326) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0415_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0415
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0416 : Poly :=
[
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 416 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0416 : Poly :=
[
  term ((149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0416_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0416
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0417 : Poly :=
[
  term ((5 : Rat) / 2) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 417 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0417 : Poly :=
[
  term (-5 : Rat) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (5 : Rat) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (5 : Rat) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0417_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0417
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0418 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 418 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0418 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0418_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0418
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0419 : Poly :=
[
  term ((-6647733659323165 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 419 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0419 : Poly :=
[
  term ((13295467318646330 : Rat) / 6527410339149) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6647733659323165 : Rat) / 6527410339149) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((13295467318646330 : Rat) / 6527410339149) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6647733659323165 : Rat) / 6527410339149) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-13295467318646330 : Rat) / 6527410339149) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13295467318646330 : Rat) / 6527410339149) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((6647733659323165 : Rat) / 6527410339149) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((6647733659323165 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0419_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0419
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0420 : Poly :=
[
  term ((-18 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0420 : Poly :=
[
  term ((36 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0420_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0420
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0421 : Poly :=
[
  term ((119808 : Rat) / 553) [(10, 1), (11, 2)]
]

/-- Partial product 421 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0421 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((-239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (14, 2)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0421_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0421
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0422 : Poly :=
[
  term ((40 : Rat) / 21) [(10, 1), (12, 1)]
]

/-- Partial product 422 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0422 : Poly :=
[
  term ((-80 : Rat) / 21) [(0, 1), (10, 1), (12, 2)],
  term ((40 : Rat) / 21) [(0, 2), (10, 1), (12, 1)],
  term ((-80 : Rat) / 21) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((40 : Rat) / 21) [(1, 2), (10, 1), (12, 1)],
  term ((80 : Rat) / 21) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-40 : Rat) / 21) [(10, 1), (12, 1), (14, 2)],
  term ((-40 : Rat) / 21) [(10, 1), (12, 1), (15, 2)],
  term ((80 : Rat) / 21) [(10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0422_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0422
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0423 : Poly :=
[
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 423 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0423 : Poly :=
[
  term ((-2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0423_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0423
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0424 : Poly :=
[
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0424 : Poly :=
[
  term ((-55 : Rat) / 7) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((55 : Rat) / 7) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0424_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0424
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0425 : Poly :=
[
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 425 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0425 : Poly :=
[
  term ((245335365526 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((245335365526 : Rat) / 44404151967) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((-245335365526 : Rat) / 44404151967) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 4)],
  term ((-245335365526 : Rat) / 44404151967) [(10, 1), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0425_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0425
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0426 : Poly :=
[
  term ((-24 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 426 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0426 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((-48 : Rat) / 7) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0426_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0426
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0427 : Poly :=
[
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 427 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0427 : Poly :=
[
  term ((-27567777768901 : Rat) / 177616607868) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0427_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0427
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0428 : Poly :=
[
  term ((-209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0428 : Poly :=
[
  term ((209 : Rat) / 14) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 28) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 14) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 28) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((209 : Rat) / 28) [(10, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-209 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0428_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0428
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0429 : Poly :=
[
  term ((2070303516940249 : Rat) / 3197098941624) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 429 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0429 : Poly :=
[
  term ((-2070303516940249 : Rat) / 1598549470812) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((2070303516940249 : Rat) / 3197098941624) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-2070303516940249 : Rat) / 1598549470812) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((2070303516940249 : Rat) / 3197098941624) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((2070303516940249 : Rat) / 1598549470812) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2070303516940249 : Rat) / 3197098941624) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2070303516940249 : Rat) / 3197098941624) [(10, 1), (13, 1), (15, 3)],
  term ((2070303516940249 : Rat) / 1598549470812) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0429_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0429
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0430 : Poly :=
[
  term ((-4945 : Rat) / 252) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0430 : Poly :=
[
  term ((4945 : Rat) / 126) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4945 : Rat) / 252) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4945 : Rat) / 126) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4945 : Rat) / 252) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4945 : Rat) / 126) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4945 : Rat) / 252) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4945 : Rat) / 252) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4945 : Rat) / 126) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0430_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0430
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0431 : Poly :=
[
  term ((-236617251229 : Rat) / 1065699647208) [(10, 1), (13, 2)]
]

/-- Partial product 431 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0431 : Poly :=
[
  term ((236617251229 : Rat) / 532849823604) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-236617251229 : Rat) / 1065699647208) [(0, 2), (10, 1), (13, 2)],
  term ((236617251229 : Rat) / 532849823604) [(1, 1), (10, 1), (13, 3)],
  term ((-236617251229 : Rat) / 1065699647208) [(1, 2), (10, 1), (13, 2)],
  term ((-236617251229 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((236617251229 : Rat) / 1065699647208) [(10, 1), (13, 2), (14, 2)],
  term ((236617251229 : Rat) / 1065699647208) [(10, 1), (13, 2), (15, 2)],
  term ((-236617251229 : Rat) / 532849823604) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0431_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0431
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0432 : Poly :=
[
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 432 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0432 : Poly :=
[
  term ((2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (13, 3), (14, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (14, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 3)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0432_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0432
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0433 : Poly :=
[
  term ((-55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 433 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0433 : Poly :=
[
  term ((55 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 7) [(1, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (13, 2), (14, 3), (16, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0433_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0433
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0434 : Poly :=
[
  term ((365 : Rat) / 84) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 434 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0434 : Poly :=
[
  term ((-365 : Rat) / 42) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((365 : Rat) / 84) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-365 : Rat) / 42) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((365 : Rat) / 84) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((365 : Rat) / 42) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-365 : Rat) / 84) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-365 : Rat) / 84) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((365 : Rat) / 42) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0434_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0434
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0435 : Poly :=
[
  term ((48535455874683739 : Rat) / 69625710284256) [(10, 1), (14, 1)]
]

/-- Partial product 435 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0435 : Poly :=
[
  term ((-48535455874683739 : Rat) / 34812855142128) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((48535455874683739 : Rat) / 69625710284256) [(0, 2), (10, 1), (14, 1)],
  term ((-48535455874683739 : Rat) / 34812855142128) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((48535455874683739 : Rat) / 69625710284256) [(1, 2), (10, 1), (14, 1)],
  term ((48535455874683739 : Rat) / 34812855142128) [(10, 1), (12, 1), (14, 2)],
  term ((48535455874683739 : Rat) / 34812855142128) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-48535455874683739 : Rat) / 69625710284256) [(10, 1), (14, 1), (15, 2)],
  term ((-48535455874683739 : Rat) / 69625710284256) [(10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0435_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0435
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0436 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 436 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0436 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 4)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0436_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0436
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0437 : Poly :=
[
  term ((65 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 437 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0437 : Poly :=
[
  term ((-130 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-130 : Rat) / 7) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((130 : Rat) / 7) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((130 : Rat) / 7) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-65 : Rat) / 7) [(10, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0437_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0437
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0438 : Poly :=
[
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2)]
]

/-- Partial product 438 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0438 : Poly :=
[
  term ((7183625070497 : Rat) / 36722421036) [(0, 1), (10, 1), (12, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 73444842072) [(0, 2), (10, 1), (14, 2)],
  term ((7183625070497 : Rat) / 36722421036) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 73444842072) [(1, 2), (10, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 36722421036) [(10, 1), (12, 1), (14, 3)],
  term ((-7183625070497 : Rat) / 36722421036) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2), (15, 2)],
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0438_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0438
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0439 : Poly :=
[
  term ((-2349465056156179 : Rat) / 3729948765228) [(10, 1), (15, 2)]
]

/-- Partial product 439 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0439 : Poly :=
[
  term ((2349465056156179 : Rat) / 1864974382614) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-2349465056156179 : Rat) / 3729948765228) [(0, 2), (10, 1), (15, 2)],
  term ((2349465056156179 : Rat) / 1864974382614) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2349465056156179 : Rat) / 3729948765228) [(1, 2), (10, 1), (15, 2)],
  term ((-2349465056156179 : Rat) / 1864974382614) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2349465056156179 : Rat) / 1864974382614) [(10, 1), (13, 1), (15, 3)],
  term ((2349465056156179 : Rat) / 3729948765228) [(10, 1), (14, 2), (15, 2)],
  term ((2349465056156179 : Rat) / 3729948765228) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0439_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0439
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0440 : Poly :=
[
  term ((778 : Rat) / 63) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 440 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0440 : Poly :=
[
  term ((-1556 : Rat) / 63) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((778 : Rat) / 63) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1556 : Rat) / 63) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((778 : Rat) / 63) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((1556 : Rat) / 63) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1556 : Rat) / 63) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-778 : Rat) / 63) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-778 : Rat) / 63) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0440_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0440
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0441 : Poly :=
[
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 441 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0441 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((119808 : Rat) / 553) [(11, 1), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0441_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0441
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0442 : Poly :=
[
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 442 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0442 : Poly :=
[
  term ((38020291217764 : Rat) / 133212455901) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-38020291217764 : Rat) / 133212455901) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 3)],
  term ((-38020291217764 : Rat) / 133212455901) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0442_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0442
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0443 : Poly :=
[
  term ((-31066060346620553 : Rat) / 626631392558304) [(11, 1), (13, 1)]
]

/-- Partial product 443 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0443 : Poly :=
[
  term ((31066060346620553 : Rat) / 313315696279152) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-31066060346620553 : Rat) / 626631392558304) [(0, 2), (11, 1), (13, 1)],
  term ((31066060346620553 : Rat) / 313315696279152) [(1, 1), (11, 1), (13, 2)],
  term ((-31066060346620553 : Rat) / 626631392558304) [(1, 2), (11, 1), (13, 1)],
  term ((-31066060346620553 : Rat) / 313315696279152) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((31066060346620553 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 2)],
  term ((31066060346620553 : Rat) / 626631392558304) [(11, 1), (13, 1), (15, 2)],
  term ((-31066060346620553 : Rat) / 313315696279152) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0443_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0443
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0444 : Poly :=
[
  term ((4650584221881799 : Rat) / 6394197883248) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 444 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0444 : Poly :=
[
  term ((-4650584221881799 : Rat) / 3197098941624) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4650584221881799 : Rat) / 6394197883248) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4650584221881799 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((4650584221881799 : Rat) / 6394197883248) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((4650584221881799 : Rat) / 3197098941624) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4650584221881799 : Rat) / 6394197883248) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4650584221881799 : Rat) / 6394197883248) [(11, 1), (13, 1), (14, 3)],
  term ((4650584221881799 : Rat) / 3197098941624) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0444_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0444
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0445 : Poly :=
[
  term ((-4075 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 445 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0445 : Poly :=
[
  term ((4075 : Rat) / 252) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4075 : Rat) / 504) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4075 : Rat) / 252) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4075 : Rat) / 504) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4075 : Rat) / 252) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((4075 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4075 : Rat) / 504) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-4075 : Rat) / 252) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0445_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0445
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0446 : Poly :=
[
  term ((-59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 446 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0446 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((59904 : Rat) / 553) [(11, 1), (13, 1), (14, 4)],
  term ((-119808 : Rat) / 553) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0446_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0446
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0447 : Poly :=
[
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 447 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0447 : Poly :=
[
  term ((2954048478533 : Rat) / 19735178652) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 4)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0447_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0447
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0448 : Poly :=
[
  term ((305 : Rat) / 28) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 448 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0448 : Poly :=
[
  term ((-305 : Rat) / 14) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((305 : Rat) / 14) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0448_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0448
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0449 : Poly :=
[
  term ((-715 : Rat) / 1008) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 449 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0449 : Poly :=
[
  term ((715 : Rat) / 504) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-715 : Rat) / 1008) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((715 : Rat) / 504) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-715 : Rat) / 1008) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-715 : Rat) / 504) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((715 : Rat) / 1008) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((715 : Rat) / 1008) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-715 : Rat) / 504) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0449_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0449
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0450 : Poly :=
[
  term ((49294245668257619 : Rat) / 17406427571064) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 450 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0450 : Poly :=
[
  term ((-49294245668257619 : Rat) / 8703213785532) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((49294245668257619 : Rat) / 17406427571064) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-49294245668257619 : Rat) / 8703213785532) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((49294245668257619 : Rat) / 17406427571064) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((49294245668257619 : Rat) / 8703213785532) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((49294245668257619 : Rat) / 8703213785532) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-49294245668257619 : Rat) / 17406427571064) [(11, 1), (14, 1), (15, 3)],
  term ((-49294245668257619 : Rat) / 17406427571064) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0450_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0450
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0451 : Poly :=
[
  term ((841 : Rat) / 126) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0451 : Poly :=
[
  term ((-841 : Rat) / 63) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((841 : Rat) / 126) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-841 : Rat) / 63) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((841 : Rat) / 126) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((841 : Rat) / 63) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((841 : Rat) / 63) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-841 : Rat) / 126) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-841 : Rat) / 126) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0451_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0451
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0452 : Poly :=
[
  term ((4596599348427 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 452 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0452 : Poly :=
[
  term ((-9193198696854 : Rat) / 26861770943) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 3)],
  term ((-4596599348427 : Rat) / 26861770943) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0452_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0452
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0453 : Poly :=
[
  term ((496408539315646361 : Rat) / 208877130852768) [(11, 1), (15, 1)]
]

/-- Partial product 453 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0453 : Poly :=
[
  term ((-496408539315646361 : Rat) / 104438565426384) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((496408539315646361 : Rat) / 208877130852768) [(0, 2), (11, 1), (15, 1)],
  term ((-496408539315646361 : Rat) / 104438565426384) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((496408539315646361 : Rat) / 208877130852768) [(1, 2), (11, 1), (15, 1)],
  term ((496408539315646361 : Rat) / 104438565426384) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((496408539315646361 : Rat) / 104438565426384) [(11, 1), (13, 1), (15, 2)],
  term ((-496408539315646361 : Rat) / 208877130852768) [(11, 1), (14, 2), (15, 1)],
  term ((-496408539315646361 : Rat) / 208877130852768) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0453_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0453
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0454 : Poly :=
[
  term ((37 : Rat) / 252) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0454 : Poly :=
[
  term ((-37 : Rat) / 126) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 252) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 126) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 252) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 126) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 126) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37 : Rat) / 252) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37 : Rat) / 252) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0454_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0454
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0455 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (15, 3)]
]

/-- Partial product 455 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0455 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (11, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(11, 1), (13, 1), (15, 4)],
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (14, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0455_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0455
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0456 : Poly :=
[
  term ((-65 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 456 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0456 : Poly :=
[
  term ((130 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((65 : Rat) / 7) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0456_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0456
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0457 : Poly :=
[
  term ((32928812332094725 : Rat) / 52219282713192) [(11, 2)]
]

/-- Partial product 457 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0457 : Poly :=
[
  term ((-32928812332094725 : Rat) / 26109641356596) [(0, 1), (11, 2), (12, 1)],
  term ((32928812332094725 : Rat) / 52219282713192) [(0, 2), (11, 2)],
  term ((-32928812332094725 : Rat) / 26109641356596) [(1, 1), (11, 2), (13, 1)],
  term ((32928812332094725 : Rat) / 52219282713192) [(1, 2), (11, 2)],
  term ((32928812332094725 : Rat) / 26109641356596) [(11, 2), (12, 1), (14, 1)],
  term ((32928812332094725 : Rat) / 26109641356596) [(11, 2), (13, 1), (15, 1)],
  term ((-32928812332094725 : Rat) / 52219282713192) [(11, 2), (14, 2)],
  term ((-32928812332094725 : Rat) / 52219282713192) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0457_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0457
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0458 : Poly :=
[
  term ((-23369978600860751 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 458 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0458 : Poly :=
[
  term ((23369978600860751 : Rat) / 13054820678298) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-23369978600860751 : Rat) / 26109641356596) [(0, 2), (11, 2), (14, 1)],
  term ((23369978600860751 : Rat) / 13054820678298) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-23369978600860751 : Rat) / 26109641356596) [(1, 2), (11, 2), (14, 1)],
  term ((-23369978600860751 : Rat) / 13054820678298) [(11, 2), (12, 1), (14, 2)],
  term ((-23369978600860751 : Rat) / 13054820678298) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((23369978600860751 : Rat) / 26109641356596) [(11, 2), (14, 1), (15, 2)],
  term ((23369978600860751 : Rat) / 26109641356596) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0458_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0458
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0459 : Poly :=
[
  term ((119808 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 459 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0459 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(0, 2), (11, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(1, 2), (11, 2), (15, 2)],
  term ((239616 : Rat) / 553) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(11, 2), (13, 1), (15, 3)],
  term ((-119808 : Rat) / 553) [(11, 2), (14, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0459_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0459
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0460 : Poly :=
[
  term ((2444668745291 : Rat) / 266424911802) [(12, 1)]
]

/-- Partial product 460 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0460 : Poly :=
[
  term ((-2444668745291 : Rat) / 133212455901) [(0, 1), (12, 2)],
  term ((2444668745291 : Rat) / 266424911802) [(0, 2), (12, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(1, 1), (12, 1), (13, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(1, 2), (12, 1)],
  term ((2444668745291 : Rat) / 133212455901) [(12, 1), (13, 1), (15, 1)],
  term ((-2444668745291 : Rat) / 266424911802) [(12, 1), (14, 2)],
  term ((-2444668745291 : Rat) / 266424911802) [(12, 1), (15, 2)],
  term ((2444668745291 : Rat) / 133212455901) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0460_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0460
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0461 : Poly :=
[
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 461 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0461 : Poly :=
[
  term ((-2629582380889 : Rat) / 118411071912) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0461_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0461
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0462 : Poly :=
[
  term ((345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0462 : Poly :=
[
  term ((-345 : Rat) / 28) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 28) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-345 : Rat) / 56) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((345 : Rat) / 28) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((345 : Rat) / 28) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0462_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0462
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0463 : Poly :=
[
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 463 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0463 : Poly :=
[
  term ((389178307824539 : Rat) / 2131399294416) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 3)],
  term ((-389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 2), (15, 2)],
  term ((-389178307824539 : Rat) / 2131399294416) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0463_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0463
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0464 : Poly :=
[
  term ((45 : Rat) / 112) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0464 : Poly :=
[
  term ((-45 : Rat) / 56) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 56) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((45 : Rat) / 56) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((45 : Rat) / 56) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0464_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0464
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0465 : Poly :=
[
  term ((-2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1)]
]

/-- Partial product 465 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0465 : Poly :=
[
  term ((5983066912384 : Rat) / 133212455901) [(0, 1), (12, 2), (14, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(0, 2), (12, 1), (14, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(1, 2), (12, 1), (14, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1), (15, 2)],
  term ((2991533456192 : Rat) / 133212455901) [(12, 1), (14, 3)],
  term ((-5983066912384 : Rat) / 133212455901) [(12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0465_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0465
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0466 : Poly :=
[
  term ((-2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 466 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0466 : Poly :=
[
  term ((2187255370987 : Rat) / 9867589326) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 9867589326) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 4)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (14, 3), (15, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(12, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0466_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0466
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0467 : Poly :=
[
  term ((-73 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 467 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0467 : Poly :=
[
  term ((73 : Rat) / 7) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 7) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 7) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((73 : Rat) / 14) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((73 : Rat) / 14) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((-73 : Rat) / 7) [(12, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0467_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0467
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0468 : Poly :=
[
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

/-- Partial product 468 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0468 : Poly :=
[
  term ((-2001591001496153 : Rat) / 4351606892766) [(0, 1), (12, 2), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(1, 2), (12, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 4351606892766) [(12, 1), (13, 1), (15, 3)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (14, 2), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 4)],
  term ((2001591001496153 : Rat) / 4351606892766) [(12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0468_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0468
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0469 : Poly :=
[
  term ((-155 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 469 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0469 : Poly :=
[
  term ((155 : Rat) / 42) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-155 : Rat) / 84) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 42) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 84) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 42) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((155 : Rat) / 84) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(12, 1), (15, 4), (16, 1)],
  term ((-155 : Rat) / 42) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0469_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0469
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0470 : Poly :=
[
  term ((1065223399439645 : Rat) / 2797461573921) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 470 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0470 : Poly :=
[
  term ((-2130446798879290 : Rat) / 2797461573921) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1065223399439645 : Rat) / 2797461573921) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2130446798879290 : Rat) / 2797461573921) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((1065223399439645 : Rat) / 2797461573921) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((2130446798879290 : Rat) / 2797461573921) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1065223399439645 : Rat) / 2797461573921) [(13, 1), (14, 1), (15, 3)],
  term ((-1065223399439645 : Rat) / 2797461573921) [(13, 1), (14, 3), (15, 1)],
  term ((2130446798879290 : Rat) / 2797461573921) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0470_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0470
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0471 : Poly :=
[
  term ((11 : Rat) / 252) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0471 : Poly :=
[
  term ((-11 : Rat) / 126) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 252) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 126) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 252) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 126) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11 : Rat) / 252) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11 : Rat) / 252) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((11 : Rat) / 126) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0471_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0471
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0472 : Poly :=
[
  term ((2187255370987 : Rat) / 19735178652) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 472 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0472 : Poly :=
[
  term ((-2187255370987 : Rat) / 9867589326) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(13, 1), (14, 2), (15, 3)],
  term ((-2187255370987 : Rat) / 19735178652) [(13, 1), (14, 4), (15, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0472_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0472
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0473 : Poly :=
[
  term ((73 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0473 : Poly :=
[
  term ((-73 : Rat) / 7) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 7) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 14) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 7) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-73 : Rat) / 14) [(13, 1), (14, 4), (15, 1), (16, 1)],
  term ((73 : Rat) / 7) [(13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0473_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0473
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0474 : Poly :=
[
  term ((939236607556670483 : Rat) / 626631392558304) [(13, 1), (15, 1)]
]

/-- Partial product 474 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0474 : Poly :=
[
  term ((-939236607556670483 : Rat) / 313315696279152) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((939236607556670483 : Rat) / 626631392558304) [(0, 2), (13, 1), (15, 1)],
  term ((-939236607556670483 : Rat) / 313315696279152) [(1, 1), (13, 2), (15, 1)],
  term ((939236607556670483 : Rat) / 626631392558304) [(1, 2), (13, 1), (15, 1)],
  term ((939236607556670483 : Rat) / 313315696279152) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-939236607556670483 : Rat) / 626631392558304) [(13, 1), (14, 2), (15, 1)],
  term ((-939236607556670483 : Rat) / 626631392558304) [(13, 1), (15, 3)],
  term ((939236607556670483 : Rat) / 313315696279152) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0474_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0474
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0475 : Poly :=
[
  term ((-56251 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 475 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0475 : Poly :=
[
  term ((56251 : Rat) / 504) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56251 : Rat) / 1008) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((56251 : Rat) / 504) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-56251 : Rat) / 1008) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56251 : Rat) / 504) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56251 : Rat) / 1008) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((56251 : Rat) / 1008) [(13, 1), (15, 3), (16, 1)],
  term ((-56251 : Rat) / 504) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0475_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0475
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0476 : Poly :=
[
  term ((-5772763704184289 : Rat) / 12788395766496) [(13, 2)]
]

/-- Partial product 476 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0476 : Poly :=
[
  term ((5772763704184289 : Rat) / 6394197883248) [(0, 1), (12, 1), (13, 2)],
  term ((-5772763704184289 : Rat) / 12788395766496) [(0, 2), (13, 2)],
  term ((5772763704184289 : Rat) / 6394197883248) [(1, 1), (13, 3)],
  term ((-5772763704184289 : Rat) / 12788395766496) [(1, 2), (13, 2)],
  term ((-5772763704184289 : Rat) / 6394197883248) [(12, 1), (13, 2), (14, 1)],
  term ((5772763704184289 : Rat) / 12788395766496) [(13, 2), (14, 2)],
  term ((5772763704184289 : Rat) / 12788395766496) [(13, 2), (15, 2)],
  term ((-5772763704184289 : Rat) / 6394197883248) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0476_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0476
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0477 : Poly :=
[
  term ((436510790680541 : Rat) / 4262798588832) [(13, 2), (14, 1)]
]

/-- Partial product 477 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0477 : Poly :=
[
  term ((-436510790680541 : Rat) / 2131399294416) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((436510790680541 : Rat) / 4262798588832) [(0, 2), (13, 2), (14, 1)],
  term ((-436510790680541 : Rat) / 2131399294416) [(1, 1), (13, 3), (14, 1)],
  term ((436510790680541 : Rat) / 4262798588832) [(1, 2), (13, 2), (14, 1)],
  term ((436510790680541 : Rat) / 2131399294416) [(12, 1), (13, 2), (14, 2)],
  term ((-436510790680541 : Rat) / 4262798588832) [(13, 2), (14, 1), (15, 2)],
  term ((-436510790680541 : Rat) / 4262798588832) [(13, 2), (14, 3)],
  term ((436510790680541 : Rat) / 2131399294416) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0477_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0477
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0478 : Poly :=
[
  term ((645 : Rat) / 112) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 478 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0478 : Poly :=
[
  term ((-645 : Rat) / 56) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((645 : Rat) / 112) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-645 : Rat) / 56) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((645 : Rat) / 112) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((645 : Rat) / 56) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-645 : Rat) / 112) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-645 : Rat) / 112) [(13, 2), (14, 3), (16, 1)],
  term ((645 : Rat) / 56) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0478_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0478
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0479 : Poly :=
[
  term ((-2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2)]
]

/-- Partial product 479 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0479 : Poly :=
[
  term ((2629582380889 : Rat) / 118411071912) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 236822143824) [(0, 2), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 118411071912) [(1, 1), (13, 3), (14, 2)],
  term ((-2629582380889 : Rat) / 236822143824) [(1, 2), (13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 3)],
  term ((2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2), (15, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(13, 2), (14, 4)],
  term ((-2629582380889 : Rat) / 118411071912) [(13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0479_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0479
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0480 : Poly :=
[
  term ((-345 : Rat) / 56) [(13, 2), (14, 2), (16, 1)]
]

/-- Partial product 480 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0480 : Poly :=
[
  term ((345 : Rat) / 28) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 56) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 28) [(1, 1), (13, 3), (14, 2), (16, 1)],
  term ((-345 : Rat) / 56) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 28) [(12, 1), (13, 2), (14, 3), (16, 1)],
  term ((345 : Rat) / 56) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((345 : Rat) / 56) [(13, 2), (14, 4), (16, 1)],
  term ((-345 : Rat) / 28) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0480_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0480
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0481 : Poly :=
[
  term ((12125 : Rat) / 1008) [(13, 2), (16, 1)]
]

/-- Partial product 481 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0481 : Poly :=
[
  term ((-12125 : Rat) / 504) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((12125 : Rat) / 1008) [(0, 2), (13, 2), (16, 1)],
  term ((-12125 : Rat) / 504) [(1, 1), (13, 3), (16, 1)],
  term ((12125 : Rat) / 1008) [(1, 2), (13, 2), (16, 1)],
  term ((12125 : Rat) / 504) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-12125 : Rat) / 1008) [(13, 2), (14, 2), (16, 1)],
  term ((-12125 : Rat) / 1008) [(13, 2), (15, 2), (16, 1)],
  term ((12125 : Rat) / 504) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0481_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0481
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0482 : Poly :=
[
  term ((-884959135454411 : Rat) / 2486632510152) [(14, 1)]
]

/-- Partial product 482 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0482 : Poly :=
[
  term ((884959135454411 : Rat) / 1243316255076) [(0, 1), (12, 1), (14, 1)],
  term ((-884959135454411 : Rat) / 2486632510152) [(0, 2), (14, 1)],
  term ((884959135454411 : Rat) / 1243316255076) [(1, 1), (13, 1), (14, 1)],
  term ((-884959135454411 : Rat) / 2486632510152) [(1, 2), (14, 1)],
  term ((-884959135454411 : Rat) / 1243316255076) [(12, 1), (14, 2)],
  term ((-884959135454411 : Rat) / 1243316255076) [(13, 1), (14, 1), (15, 1)],
  term ((884959135454411 : Rat) / 2486632510152) [(14, 1), (15, 2)],
  term ((884959135454411 : Rat) / 2486632510152) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0482_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0482
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0483 : Poly :=
[
  term ((-11899100091633005 : Rat) / 7736190031584) [(14, 1), (15, 2)]
]

/-- Partial product 483 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0483 : Poly :=
[
  term ((11899100091633005 : Rat) / 3868095015792) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11899100091633005 : Rat) / 7736190031584) [(0, 2), (14, 1), (15, 2)],
  term ((11899100091633005 : Rat) / 3868095015792) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11899100091633005 : Rat) / 7736190031584) [(1, 2), (14, 1), (15, 2)],
  term ((-11899100091633005 : Rat) / 3868095015792) [(12, 1), (14, 2), (15, 2)],
  term ((-11899100091633005 : Rat) / 3868095015792) [(13, 1), (14, 1), (15, 3)],
  term ((11899100091633005 : Rat) / 7736190031584) [(14, 1), (15, 4)],
  term ((11899100091633005 : Rat) / 7736190031584) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0483_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0483
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0484 : Poly :=
[
  term ((-260 : Rat) / 63) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 484 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0484 : Poly :=
[
  term ((520 : Rat) / 63) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-260 : Rat) / 63) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((520 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-260 : Rat) / 63) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-520 : Rat) / 63) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-520 : Rat) / 63) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((260 : Rat) / 63) [(14, 1), (15, 4), (16, 1)],
  term ((260 : Rat) / 63) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0484_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0484
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0485 : Poly :=
[
  term ((-32 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 485 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0485 : Poly :=
[
  term ((64 : Rat) / 21) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((64 : Rat) / 21) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((-64 : Rat) / 21) [(12, 1), (14, 2), (16, 1)],
  term ((-64 : Rat) / 21) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 21) [(14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0485_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0485
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0486 : Poly :=
[
  term ((-157933140662391043 : Rat) / 417754261705536) [(14, 2)]
]

/-- Partial product 486 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0486 : Poly :=
[
  term ((157933140662391043 : Rat) / 208877130852768) [(0, 1), (12, 1), (14, 2)],
  term ((-157933140662391043 : Rat) / 417754261705536) [(0, 2), (14, 2)],
  term ((157933140662391043 : Rat) / 208877130852768) [(1, 1), (13, 1), (14, 2)],
  term ((-157933140662391043 : Rat) / 417754261705536) [(1, 2), (14, 2)],
  term ((-157933140662391043 : Rat) / 208877130852768) [(12, 1), (14, 3)],
  term ((-157933140662391043 : Rat) / 208877130852768) [(13, 1), (14, 2), (15, 1)],
  term ((157933140662391043 : Rat) / 417754261705536) [(14, 2), (15, 2)],
  term ((157933140662391043 : Rat) / 417754261705536) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0486_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0486
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0487 : Poly :=
[
  term ((16 : Rat) / 21) [(14, 2), (16, 1)]
]

/-- Partial product 487 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0487 : Poly :=
[
  term ((-32 : Rat) / 21) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 21) [(0, 2), (14, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (14, 2), (16, 1)],
  term ((32 : Rat) / 21) [(12, 1), (14, 3), (16, 1)],
  term ((32 : Rat) / 21) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(14, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0487_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0487
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0488 : Poly :=
[
  term ((8979241671985367 : Rat) / 29839590121824) [(14, 3)]
]

/-- Partial product 488 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0488 : Poly :=
[
  term ((-8979241671985367 : Rat) / 14919795060912) [(0, 1), (12, 1), (14, 3)],
  term ((8979241671985367 : Rat) / 29839590121824) [(0, 2), (14, 3)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(1, 1), (13, 1), (14, 3)],
  term ((8979241671985367 : Rat) / 29839590121824) [(1, 2), (14, 3)],
  term ((8979241671985367 : Rat) / 14919795060912) [(12, 1), (14, 4)],
  term ((8979241671985367 : Rat) / 14919795060912) [(13, 1), (14, 3), (15, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(14, 3), (15, 2)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(14, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0488_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0488
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0489 : Poly :=
[
  term ((-196692205228550653 : Rat) / 59679180243648) [(15, 2)]
]

/-- Partial product 489 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0489 : Poly :=
[
  term ((196692205228550653 : Rat) / 29839590121824) [(0, 1), (12, 1), (15, 2)],
  term ((-196692205228550653 : Rat) / 59679180243648) [(0, 2), (15, 2)],
  term ((196692205228550653 : Rat) / 29839590121824) [(1, 1), (13, 1), (15, 2)],
  term ((-196692205228550653 : Rat) / 59679180243648) [(1, 2), (15, 2)],
  term ((-196692205228550653 : Rat) / 29839590121824) [(12, 1), (14, 1), (15, 2)],
  term ((-196692205228550653 : Rat) / 29839590121824) [(13, 1), (15, 3)],
  term ((196692205228550653 : Rat) / 59679180243648) [(14, 2), (15, 2)],
  term ((196692205228550653 : Rat) / 59679180243648) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0489_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0489
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0490 : Poly :=
[
  term ((9803 : Rat) / 252) [(15, 2), (16, 1)]
]

/-- Partial product 490 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0490 : Poly :=
[
  term ((-9803 : Rat) / 126) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((9803 : Rat) / 252) [(0, 2), (15, 2), (16, 1)],
  term ((-9803 : Rat) / 126) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((9803 : Rat) / 252) [(1, 2), (15, 2), (16, 1)],
  term ((9803 : Rat) / 126) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9803 : Rat) / 126) [(13, 1), (15, 3), (16, 1)],
  term ((-9803 : Rat) / 252) [(14, 2), (15, 2), (16, 1)],
  term ((-9803 : Rat) / 252) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0490_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0490
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0491 : Poly :=
[
  term ((16 : Rat) / 21) [(16, 1)]
]

/-- Partial product 491 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0491 : Poly :=
[
  term ((-32 : Rat) / 21) [(0, 1), (12, 1), (16, 1)],
  term ((16 : Rat) / 21) [(0, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (16, 1)],
  term ((32 : Rat) / 21) [(12, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 21) [(13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0491_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0491
        rs_R009_ueqv_R009YNNNN_generator_27_0400_0491 =
      rs_R009_ueqv_R009YNNNN_partial_27_0491 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_27_0400_0491 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_27_0400,
  rs_R009_ueqv_R009YNNNN_partial_27_0401,
  rs_R009_ueqv_R009YNNNN_partial_27_0402,
  rs_R009_ueqv_R009YNNNN_partial_27_0403,
  rs_R009_ueqv_R009YNNNN_partial_27_0404,
  rs_R009_ueqv_R009YNNNN_partial_27_0405,
  rs_R009_ueqv_R009YNNNN_partial_27_0406,
  rs_R009_ueqv_R009YNNNN_partial_27_0407,
  rs_R009_ueqv_R009YNNNN_partial_27_0408,
  rs_R009_ueqv_R009YNNNN_partial_27_0409,
  rs_R009_ueqv_R009YNNNN_partial_27_0410,
  rs_R009_ueqv_R009YNNNN_partial_27_0411,
  rs_R009_ueqv_R009YNNNN_partial_27_0412,
  rs_R009_ueqv_R009YNNNN_partial_27_0413,
  rs_R009_ueqv_R009YNNNN_partial_27_0414,
  rs_R009_ueqv_R009YNNNN_partial_27_0415,
  rs_R009_ueqv_R009YNNNN_partial_27_0416,
  rs_R009_ueqv_R009YNNNN_partial_27_0417,
  rs_R009_ueqv_R009YNNNN_partial_27_0418,
  rs_R009_ueqv_R009YNNNN_partial_27_0419,
  rs_R009_ueqv_R009YNNNN_partial_27_0420,
  rs_R009_ueqv_R009YNNNN_partial_27_0421,
  rs_R009_ueqv_R009YNNNN_partial_27_0422,
  rs_R009_ueqv_R009YNNNN_partial_27_0423,
  rs_R009_ueqv_R009YNNNN_partial_27_0424,
  rs_R009_ueqv_R009YNNNN_partial_27_0425,
  rs_R009_ueqv_R009YNNNN_partial_27_0426,
  rs_R009_ueqv_R009YNNNN_partial_27_0427,
  rs_R009_ueqv_R009YNNNN_partial_27_0428,
  rs_R009_ueqv_R009YNNNN_partial_27_0429,
  rs_R009_ueqv_R009YNNNN_partial_27_0430,
  rs_R009_ueqv_R009YNNNN_partial_27_0431,
  rs_R009_ueqv_R009YNNNN_partial_27_0432,
  rs_R009_ueqv_R009YNNNN_partial_27_0433,
  rs_R009_ueqv_R009YNNNN_partial_27_0434,
  rs_R009_ueqv_R009YNNNN_partial_27_0435,
  rs_R009_ueqv_R009YNNNN_partial_27_0436,
  rs_R009_ueqv_R009YNNNN_partial_27_0437,
  rs_R009_ueqv_R009YNNNN_partial_27_0438,
  rs_R009_ueqv_R009YNNNN_partial_27_0439,
  rs_R009_ueqv_R009YNNNN_partial_27_0440,
  rs_R009_ueqv_R009YNNNN_partial_27_0441,
  rs_R009_ueqv_R009YNNNN_partial_27_0442,
  rs_R009_ueqv_R009YNNNN_partial_27_0443,
  rs_R009_ueqv_R009YNNNN_partial_27_0444,
  rs_R009_ueqv_R009YNNNN_partial_27_0445,
  rs_R009_ueqv_R009YNNNN_partial_27_0446,
  rs_R009_ueqv_R009YNNNN_partial_27_0447,
  rs_R009_ueqv_R009YNNNN_partial_27_0448,
  rs_R009_ueqv_R009YNNNN_partial_27_0449,
  rs_R009_ueqv_R009YNNNN_partial_27_0450,
  rs_R009_ueqv_R009YNNNN_partial_27_0451,
  rs_R009_ueqv_R009YNNNN_partial_27_0452,
  rs_R009_ueqv_R009YNNNN_partial_27_0453,
  rs_R009_ueqv_R009YNNNN_partial_27_0454,
  rs_R009_ueqv_R009YNNNN_partial_27_0455,
  rs_R009_ueqv_R009YNNNN_partial_27_0456,
  rs_R009_ueqv_R009YNNNN_partial_27_0457,
  rs_R009_ueqv_R009YNNNN_partial_27_0458,
  rs_R009_ueqv_R009YNNNN_partial_27_0459,
  rs_R009_ueqv_R009YNNNN_partial_27_0460,
  rs_R009_ueqv_R009YNNNN_partial_27_0461,
  rs_R009_ueqv_R009YNNNN_partial_27_0462,
  rs_R009_ueqv_R009YNNNN_partial_27_0463,
  rs_R009_ueqv_R009YNNNN_partial_27_0464,
  rs_R009_ueqv_R009YNNNN_partial_27_0465,
  rs_R009_ueqv_R009YNNNN_partial_27_0466,
  rs_R009_ueqv_R009YNNNN_partial_27_0467,
  rs_R009_ueqv_R009YNNNN_partial_27_0468,
  rs_R009_ueqv_R009YNNNN_partial_27_0469,
  rs_R009_ueqv_R009YNNNN_partial_27_0470,
  rs_R009_ueqv_R009YNNNN_partial_27_0471,
  rs_R009_ueqv_R009YNNNN_partial_27_0472,
  rs_R009_ueqv_R009YNNNN_partial_27_0473,
  rs_R009_ueqv_R009YNNNN_partial_27_0474,
  rs_R009_ueqv_R009YNNNN_partial_27_0475,
  rs_R009_ueqv_R009YNNNN_partial_27_0476,
  rs_R009_ueqv_R009YNNNN_partial_27_0477,
  rs_R009_ueqv_R009YNNNN_partial_27_0478,
  rs_R009_ueqv_R009YNNNN_partial_27_0479,
  rs_R009_ueqv_R009YNNNN_partial_27_0480,
  rs_R009_ueqv_R009YNNNN_partial_27_0481,
  rs_R009_ueqv_R009YNNNN_partial_27_0482,
  rs_R009_ueqv_R009YNNNN_partial_27_0483,
  rs_R009_ueqv_R009YNNNN_partial_27_0484,
  rs_R009_ueqv_R009YNNNN_partial_27_0485,
  rs_R009_ueqv_R009YNNNN_partial_27_0486,
  rs_R009_ueqv_R009YNNNN_partial_27_0487,
  rs_R009_ueqv_R009YNNNN_partial_27_0488,
  rs_R009_ueqv_R009YNNNN_partial_27_0489,
  rs_R009_ueqv_R009YNNNN_partial_27_0490,
  rs_R009_ueqv_R009YNNNN_partial_27_0491
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_27_0400_0491 : Poly :=
[
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((930355518024375047 : Rat) / 626631392558304) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((241 : Rat) / 21) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1340248469261 : Rat) / 8993245968) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((2172201733 : Rat) / 166541592) [(0, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(0, 1), (9, 2), (10, 1), (12, 2)],
  term ((-14142509592084785 : Rat) / 34812855142128) [(0, 1), (9, 2), (12, 1)],
  term ((18706262231446519 : Rat) / 34812855142128) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((997316410233 : Rat) / 4385595256) [(0, 1), (9, 2), (12, 2)],
  term ((-6607701279353 : Rat) / 9867589326) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (-5 : Rat) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((13295467318646330 : Rat) / 6527410339149) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((36 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((33617610846266 : Rat) / 725267815461) [(0, 1), (10, 1), (12, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 14) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2070303516940249 : Rat) / 1598549470812) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4945 : Rat) / 126) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((236617251229 : Rat) / 532849823604) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-365 : Rat) / 42) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-48535455874683739 : Rat) / 34812855142128) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-130 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 36722421036) [(0, 1), (10, 1), (12, 1), (14, 2)],
  term ((2349465056156179 : Rat) / 1864974382614) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1556 : Rat) / 63) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 21) [(0, 1), (10, 1), (12, 2)],
  term ((-2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-55 : Rat) / 7) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((245335365526 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((48 : Rat) / 7) [(0, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((31066060346620553 : Rat) / 313315696279152) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4650584221881799 : Rat) / 3197098941624) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4075 : Rat) / 252) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 14) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((715 : Rat) / 504) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-49294245668257619 : Rat) / 8703213785532) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-841 : Rat) / 63) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-496408539315646361 : Rat) / 104438565426384) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-37 : Rat) / 126) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((130 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-32928812332094725 : Rat) / 26109641356596) [(0, 1), (11, 2), (12, 1)],
  term ((23369978600860751 : Rat) / 13054820678298) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-2130446798879290 : Rat) / 2797461573921) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 126) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 7) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-939236607556670483 : Rat) / 313315696279152) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((56251 : Rat) / 504) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5772763704184289 : Rat) / 6394197883248) [(0, 1), (12, 1), (13, 2)],
  term ((-436510790680541 : Rat) / 2131399294416) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-645 : Rat) / 56) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((345 : Rat) / 28) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-12125 : Rat) / 504) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((884959135454411 : Rat) / 1243316255076) [(0, 1), (12, 1), (14, 1)],
  term ((11899100091633005 : Rat) / 3868095015792) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((520 : Rat) / 63) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 21) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((157933140662391043 : Rat) / 208877130852768) [(0, 1), (12, 1), (14, 2)],
  term ((-32 : Rat) / 21) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(0, 1), (12, 1), (14, 3)],
  term ((196692205228550653 : Rat) / 29839590121824) [(0, 1), (12, 1), (15, 2)],
  term ((-9803 : Rat) / 126) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(0, 1), (12, 1), (16, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(0, 1), (12, 2)],
  term ((-2629582380889 : Rat) / 118411071912) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 28) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-45 : Rat) / 56) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(0, 1), (12, 2), (14, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((73 : Rat) / 7) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(0, 1), (12, 2), (15, 2)],
  term ((155 : Rat) / 42) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-930355518024375047 : Rat) / 1253262785116608) [(0, 2), (9, 1), (15, 1)],
  term ((-241 : Rat) / 42) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (15, 3)],
  term ((65 : Rat) / 14) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((14142509592084785 : Rat) / 69625710284256) [(0, 2), (9, 2)],
  term ((-1340248469261 : Rat) / 17986491936) [(0, 2), (9, 2), (10, 1)],
  term ((67338253723 : Rat) / 4496622984) [(0, 2), (9, 2), (10, 1), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(0, 2), (9, 2), (10, 1), (14, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(0, 2), (9, 2), (12, 1)],
  term ((-18706262231446519 : Rat) / 69625710284256) [(0, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (15, 2)],
  term ((-16808805423133 : Rat) / 725267815461) [(0, 2), (10, 1)],
  term ((74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((6607701279353 : Rat) / 19735178652) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6647733659323165 : Rat) / 6527410339149) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((40 : Rat) / 21) [(0, 2), (10, 1), (12, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 14) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-122667682763 : Rat) / 44404151967) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((-24 : Rat) / 7) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 28) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2070303516940249 : Rat) / 3197098941624) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4945 : Rat) / 252) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-236617251229 : Rat) / 1065699647208) [(0, 2), (10, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((365 : Rat) / 84) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((48535455874683739 : Rat) / 69625710284256) [(0, 2), (10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(0, 2), (10, 1), (14, 2)],
  term ((-2349465056156179 : Rat) / 3729948765228) [(0, 2), (10, 1), (15, 2)],
  term ((778 : Rat) / 63) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-31066060346620553 : Rat) / 626631392558304) [(0, 2), (11, 1), (13, 1)],
  term ((4650584221881799 : Rat) / 6394197883248) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4075 : Rat) / 504) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-715 : Rat) / 1008) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((49294245668257619 : Rat) / 17406427571064) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((841 : Rat) / 126) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((496408539315646361 : Rat) / 208877130852768) [(0, 2), (11, 1), (15, 1)],
  term ((37 : Rat) / 252) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (11, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((32928812332094725 : Rat) / 52219282713192) [(0, 2), (11, 2)],
  term ((-23369978600860751 : Rat) / 26109641356596) [(0, 2), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (11, 2), (15, 2)],
  term ((2444668745291 : Rat) / 266424911802) [(0, 2), (12, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 56) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 112) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(0, 2), (12, 1), (14, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((-155 : Rat) / 84) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((1065223399439645 : Rat) / 2797461573921) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 252) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((939236607556670483 : Rat) / 626631392558304) [(0, 2), (13, 1), (15, 1)],
  term ((-56251 : Rat) / 1008) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5772763704184289 : Rat) / 12788395766496) [(0, 2), (13, 2)],
  term ((436510790680541 : Rat) / 4262798588832) [(0, 2), (13, 2), (14, 1)],
  term ((645 : Rat) / 112) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(0, 2), (13, 2), (14, 2)],
  term ((-345 : Rat) / 56) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((12125 : Rat) / 1008) [(0, 2), (13, 2), (16, 1)],
  term ((-884959135454411 : Rat) / 2486632510152) [(0, 2), (14, 1)],
  term ((-11899100091633005 : Rat) / 7736190031584) [(0, 2), (14, 1), (15, 2)],
  term ((-260 : Rat) / 63) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((-157933140662391043 : Rat) / 417754261705536) [(0, 2), (14, 2)],
  term ((16 : Rat) / 21) [(0, 2), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(0, 2), (14, 3)],
  term ((-196692205228550653 : Rat) / 59679180243648) [(0, 2), (15, 2)],
  term ((9803 : Rat) / 252) [(0, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(0, 2), (16, 1)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((930355518024375047 : Rat) / 626631392558304) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((241 : Rat) / 21) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(1, 1), (9, 2), (10, 1), (12, 1), (13, 1)],
  term ((1340248469261 : Rat) / 8993245968) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((997316410233 : Rat) / 4385595256) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((-14142509592084785 : Rat) / 34812855142128) [(1, 1), (9, 2), (13, 1)],
  term ((18706262231446519 : Rat) / 34812855142128) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((13295467318646330 : Rat) / 6527410339149) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((36 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6607701279353 : Rat) / 9867589326) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term (-5 : Rat) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-80 : Rat) / 21) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((245335365526 : Rat) / 44404151967) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((48 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-55 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((33617610846266 : Rat) / 725267815461) [(1, 1), (10, 1), (13, 1)],
  term ((-48535455874683739 : Rat) / 34812855142128) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-130 : Rat) / 7) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 36722421036) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((2349465056156179 : Rat) / 1864974382614) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1556 : Rat) / 63) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((209 : Rat) / 14) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2070303516940249 : Rat) / 1598549470812) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((4945 : Rat) / 126) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((236617251229 : Rat) / 532849823604) [(1, 1), (10, 1), (13, 3)],
  term ((2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (13, 3), (14, 1)],
  term ((55 : Rat) / 7) [(1, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-365 : Rat) / 42) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-49294245668257619 : Rat) / 8703213785532) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-841 : Rat) / 63) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-496408539315646361 : Rat) / 104438565426384) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-37 : Rat) / 126) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((130 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((31066060346620553 : Rat) / 313315696279152) [(1, 1), (11, 1), (13, 2)],
  term ((-4650584221881799 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((4075 : Rat) / 252) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-305 : Rat) / 14) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((715 : Rat) / 504) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-32928812332094725 : Rat) / 26109641356596) [(1, 1), (11, 2), (13, 1)],
  term ((23369978600860751 : Rat) / 13054820678298) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2444668745291 : Rat) / 133212455901) [(1, 1), (12, 1), (13, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 7) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((155 : Rat) / 42) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-345 : Rat) / 28) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-45 : Rat) / 56) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((884959135454411 : Rat) / 1243316255076) [(1, 1), (13, 1), (14, 1)],
  term ((11899100091633005 : Rat) / 3868095015792) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((520 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 21) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((157933140662391043 : Rat) / 208877130852768) [(1, 1), (13, 1), (14, 2)],
  term ((-32 : Rat) / 21) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(1, 1), (13, 1), (14, 3)],
  term ((196692205228550653 : Rat) / 29839590121824) [(1, 1), (13, 1), (15, 2)],
  term ((-9803 : Rat) / 126) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (13, 1), (16, 1)],
  term ((-2130446798879290 : Rat) / 2797461573921) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-11 : Rat) / 126) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-73 : Rat) / 7) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-939236607556670483 : Rat) / 313315696279152) [(1, 1), (13, 2), (15, 1)],
  term ((56251 : Rat) / 504) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((5772763704184289 : Rat) / 6394197883248) [(1, 1), (13, 3)],
  term ((-436510790680541 : Rat) / 2131399294416) [(1, 1), (13, 3), (14, 1)],
  term ((-645 : Rat) / 56) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(1, 1), (13, 3), (14, 2)],
  term ((345 : Rat) / 28) [(1, 1), (13, 3), (14, 2), (16, 1)],
  term ((-12125 : Rat) / 504) [(1, 1), (13, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-930355518024375047 : Rat) / 1253262785116608) [(1, 2), (9, 1), (15, 1)],
  term ((-241 : Rat) / 42) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (15, 3)],
  term ((65 : Rat) / 14) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((14142509592084785 : Rat) / 69625710284256) [(1, 2), (9, 2)],
  term ((-1340248469261 : Rat) / 17986491936) [(1, 2), (9, 2), (10, 1)],
  term ((67338253723 : Rat) / 4496622984) [(1, 2), (9, 2), (10, 1), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(1, 2), (9, 2), (10, 1), (14, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(1, 2), (9, 2), (12, 1)],
  term ((-18706262231446519 : Rat) / 69625710284256) [(1, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (15, 2)],
  term ((-16808805423133 : Rat) / 725267815461) [(1, 2), (10, 1)],
  term ((74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((6607701279353 : Rat) / 19735178652) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6647733659323165 : Rat) / 6527410339149) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((40 : Rat) / 21) [(1, 2), (10, 1), (12, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 14) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-122667682763 : Rat) / 44404151967) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((-24 : Rat) / 7) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 28) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2070303516940249 : Rat) / 3197098941624) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4945 : Rat) / 252) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-236617251229 : Rat) / 1065699647208) [(1, 2), (10, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 14) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((365 : Rat) / 84) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((48535455874683739 : Rat) / 69625710284256) [(1, 2), (10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(1, 2), (10, 1), (14, 2)],
  term ((-2349465056156179 : Rat) / 3729948765228) [(1, 2), (10, 1), (15, 2)],
  term ((778 : Rat) / 63) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-31066060346620553 : Rat) / 626631392558304) [(1, 2), (11, 1), (13, 1)],
  term ((4650584221881799 : Rat) / 6394197883248) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4075 : Rat) / 504) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-715 : Rat) / 1008) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((49294245668257619 : Rat) / 17406427571064) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((841 : Rat) / 126) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((496408539315646361 : Rat) / 208877130852768) [(1, 2), (11, 1), (15, 1)],
  term ((37 : Rat) / 252) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (11, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((32928812332094725 : Rat) / 52219282713192) [(1, 2), (11, 2)],
  term ((-23369978600860751 : Rat) / 26109641356596) [(1, 2), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (11, 2), (15, 2)],
  term ((2444668745291 : Rat) / 266424911802) [(1, 2), (12, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 56) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 112) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(1, 2), (12, 1), (14, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 8703213785532) [(1, 2), (12, 1), (15, 2)],
  term ((-155 : Rat) / 84) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((1065223399439645 : Rat) / 2797461573921) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 252) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 14) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((939236607556670483 : Rat) / 626631392558304) [(1, 2), (13, 1), (15, 1)],
  term ((-56251 : Rat) / 1008) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5772763704184289 : Rat) / 12788395766496) [(1, 2), (13, 2)],
  term ((436510790680541 : Rat) / 4262798588832) [(1, 2), (13, 2), (14, 1)],
  term ((645 : Rat) / 112) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(1, 2), (13, 2), (14, 2)],
  term ((-345 : Rat) / 56) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((12125 : Rat) / 1008) [(1, 2), (13, 2), (16, 1)],
  term ((-884959135454411 : Rat) / 2486632510152) [(1, 2), (14, 1)],
  term ((-11899100091633005 : Rat) / 7736190031584) [(1, 2), (14, 1), (15, 2)],
  term ((-260 : Rat) / 63) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((-157933140662391043 : Rat) / 417754261705536) [(1, 2), (14, 2)],
  term ((16 : Rat) / 21) [(1, 2), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(1, 2), (14, 3)],
  term ((-196692205228550653 : Rat) / 59679180243648) [(1, 2), (15, 2)],
  term ((9803 : Rat) / 252) [(1, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (16, 1)],
  term ((-930355518024375047 : Rat) / 626631392558304) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-241 : Rat) / 21) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((65 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-930355518024375047 : Rat) / 626631392558304) [(9, 1), (13, 1), (15, 2)],
  term ((-241 : Rat) / 21) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (13, 1), (15, 4)],
  term ((65 : Rat) / 7) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((930355518024375047 : Rat) / 1253262785116608) [(9, 1), (14, 2), (15, 1)],
  term ((241 : Rat) / 42) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 3)],
  term ((65 : Rat) / 14) [(9, 1), (14, 4), (15, 1), (16, 1)],
  term ((930355518024375047 : Rat) / 1253262785116608) [(9, 1), (15, 3)],
  term ((241 : Rat) / 42) [(9, 1), (15, 3), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (15, 5)],
  term ((-65 : Rat) / 14) [(9, 1), (15, 5), (16, 1)],
  term ((67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1340248469261 : Rat) / 8993245968) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-62993850257 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (14, 2)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (15, 2)],
  term ((67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 2), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1340248469261 : Rat) / 8993245968) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term ((1340248469261 : Rat) / 17986491936) [(9, 2), (10, 1), (14, 2)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 3)],
  term ((1340248469261 : Rat) / 17986491936) [(9, 2), (10, 1), (15, 2)],
  term ((-997316410233 : Rat) / 4385595256) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((14142509592084785 : Rat) / 34812855142128) [(9, 2), (12, 1), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-7373956699615871 : Rat) / 17406427571064) [(9, 2), (12, 1), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 3)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (15, 2)],
  term ((-997316410233 : Rat) / 4385595256) [(9, 2), (12, 2), (14, 1)],
  term ((-18706262231446519 : Rat) / 34812855142128) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((14142509592084785 : Rat) / 34812855142128) [(9, 2), (13, 1), (15, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (13, 1), (15, 3)],
  term ((18706262231446519 : Rat) / 69625710284256) [(9, 2), (14, 1), (15, 2)],
  term ((-14142509592084785 : Rat) / 69625710284256) [(9, 2), (14, 2)],
  term ((18706262231446519 : Rat) / 69625710284256) [(9, 2), (14, 3)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 4)],
  term ((-14142509592084785 : Rat) / 69625710284256) [(9, 2), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (15, 4)],
  term ((6607701279353 : Rat) / 9867589326) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (5 : Rat) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13295467318646330 : Rat) / 6527410339149) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-36 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44928 : Rat) / 79) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-164736 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6607701279353 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-5 : Rat) / 2) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((-61923858067169339 : Rat) / 26109641356596) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-107 : Rat) / 14) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((6607701279353 : Rat) / 9867589326) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term (5 : Rat) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((6647733659323165 : Rat) / 6527410339149) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((6647733659323165 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 3)],
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (14, 2)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (15, 2)],
  term ((2070303516940249 : Rat) / 1598549470812) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4945 : Rat) / 126) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19944084442645 : Rat) / 133212455901) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-132 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((80 : Rat) / 21) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5871019922435 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-151 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-236617251229 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((365 : Rat) / 42) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (14, 2)],
  term ((-55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-33617610846266 : Rat) / 725267815461) [(10, 1), (12, 1), (14, 1)],
  term ((-2349465056156179 : Rat) / 1864974382614) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1556 : Rat) / 63) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((48469145674413019 : Rat) / 34812855142128) [(10, 1), (12, 1), (14, 2)],
  term ((-9978051260056 : Rat) / 44404151967) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term (22 : Rat) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 36722421036) [(10, 1), (12, 1), (14, 3)],
  term ((-40 : Rat) / 21) [(10, 1), (12, 1), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 4)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((55 : Rat) / 7) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 21) [(10, 1), (12, 2), (14, 1)],
  term ((-245335365526 : Rat) / 44404151967) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-48 : Rat) / 7) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((48535455874683739 : Rat) / 34812855142128) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15481932758779 : Rat) / 50747602248) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((729 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-132090216880812403 : Rat) / 156657848139576) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((4945 : Rat) / 252) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((209 : Rat) / 28) [(10, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-33617610846266 : Rat) / 725267815461) [(10, 1), (13, 1), (15, 1)],
  term ((-42685705292455891 : Rat) / 22379692591368) [(10, 1), (13, 1), (15, 3)],
  term ((1241 : Rat) / 28) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((42815164421413 : Rat) / 266424911802) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term (-11 : Rat) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((236617251229 : Rat) / 1065699647208) [(10, 1), (13, 2), (14, 2)],
  term ((-365 : Rat) / 84) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 3)],
  term ((55 : Rat) / 14) [(10, 1), (13, 2), (14, 3), (16, 1)],
  term ((4141316885634185 : Rat) / 3197098941624) [(10, 1), (13, 2), (15, 2)],
  term ((-10985 : Rat) / 252) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (13, 3), (14, 1), (15, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-236617251229 : Rat) / 532849823604) [(10, 1), (13, 3), (15, 1)],
  term ((365 : Rat) / 42) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-48535455874683739 : Rat) / 69625710284256) [(10, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 4)],
  term ((-65 : Rat) / 7) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((16808805423133 : Rat) / 725267815461) [(10, 1), (14, 2)],
  term ((38000068211309873 : Rat) / 52219282713192) [(10, 1), (14, 2), (15, 2)],
  term ((-778 : Rat) / 63) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-48535455874683739 : Rat) / 69625710284256) [(10, 1), (14, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (14, 3), (15, 2)],
  term ((-65 : Rat) / 7) [(10, 1), (14, 3), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (14, 4)],
  term ((16808805423133 : Rat) / 725267815461) [(10, 1), (15, 2)],
  term ((2349465056156179 : Rat) / 3729948765228) [(10, 1), (15, 4)],
  term ((-778 : Rat) / 63) [(10, 1), (15, 4), (16, 1)],
  term ((-31066060346620553 : Rat) / 313315696279152) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1321597604539 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-715 : Rat) / 504) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4650584221881799 : Rat) / 3197098941624) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4075 : Rat) / 252) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-119808 : Rat) / 553) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-38020291217764 : Rat) / 133212455901) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((496408539315646361 : Rat) / 104438565426384) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((37 : Rat) / 126) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1763539033121 : Rat) / 14801383989) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((151608725544113729 : Rat) / 26109641356596) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((841 : Rat) / 63) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6283384001430 : Rat) / 26861770943) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 3)],
  term ((-38020291217764 : Rat) / 133212455901) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((1546714217185066133 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3601 : Rat) / 168) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((31066060346620553 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 2)],
  term ((1016165339692133 : Rat) / 1934047507896) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((715 : Rat) / 1008) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4650584221881799 : Rat) / 6394197883248) [(11, 1), (13, 1), (14, 3)],
  term ((4075 : Rat) / 504) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (13, 1), (14, 4)],
  term ((3009517296240498719 : Rat) / 626631392558304) [(11, 1), (13, 1), (15, 2)],
  term ((337 : Rat) / 336) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((35797395949783 : Rat) / 118411071912) [(11, 1), (13, 1), (15, 4)],
  term ((-825 : Rat) / 28) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((4650584221881799 : Rat) / 3197098941624) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4075 : Rat) / 252) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-31066060346620553 : Rat) / 313315696279152) [(11, 1), (13, 2), (15, 1)],
  term ((-715 : Rat) / 504) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (13, 2), (15, 3)],
  term ((305 : Rat) / 14) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-49294245668257619 : Rat) / 17406427571064) [(11, 1), (14, 1), (15, 3)],
  term ((-841 : Rat) / 126) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-496408539315646361 : Rat) / 208877130852768) [(11, 1), (14, 2), (15, 1)],
  term ((-37 : Rat) / 252) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-413194774214435 : Rat) / 1450535630922) [(11, 1), (14, 2), (15, 3)],
  term ((65 : Rat) / 7) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-49294245668257619 : Rat) / 17406427571064) [(11, 1), (14, 3), (15, 1)],
  term ((-841 : Rat) / 126) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(11, 1), (14, 4), (15, 1)],
  term ((-496408539315646361 : Rat) / 208877130852768) [(11, 1), (15, 3)],
  term ((-37 : Rat) / 252) [(11, 1), (15, 3), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (15, 5)],
  term ((65 : Rat) / 7) [(11, 1), (15, 5), (16, 1)],
  term ((32928812332094725 : Rat) / 26109641356596) [(11, 2), (12, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-23369978600860751 : Rat) / 13054820678298) [(11, 2), (12, 1), (14, 2)],
  term ((-23369978600860751 : Rat) / 13054820678298) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((32928812332094725 : Rat) / 26109641356596) [(11, 2), (13, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(11, 2), (13, 1), (15, 3)],
  term ((23369978600860751 : Rat) / 26109641356596) [(11, 2), (14, 1), (15, 2)],
  term ((-32928812332094725 : Rat) / 52219282713192) [(11, 2), (14, 2)],
  term ((-119808 : Rat) / 553) [(11, 2), (14, 2), (15, 2)],
  term ((23369978600860751 : Rat) / 26109641356596) [(11, 2), (14, 3)],
  term ((-32928812332094725 : Rat) / 52219282713192) [(11, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(11, 2), (15, 4)],
  term ((925164434178743315 : Rat) / 313315696279152) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-56251 : Rat) / 504) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55123711284577 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-929 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((76347042028452599 : Rat) / 89518770365472) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-317 : Rat) / 1008) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((49864546522799 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((239 : Rat) / 56) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((2444668745291 : Rat) / 133212455901) [(12, 1), (13, 1), (15, 1)],
  term ((115146105155217755 : Rat) / 208877130852768) [(12, 1), (13, 1), (15, 3)],
  term ((-1375 : Rat) / 336) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5772763704184289 : Rat) / 6394197883248) [(12, 1), (13, 2), (14, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((345 : Rat) / 28) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((12125 : Rat) / 504) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((436510790680541 : Rat) / 2131399294416) [(12, 1), (13, 2), (14, 2)],
  term ((645 : Rat) / 56) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 3)],
  term ((-345 : Rat) / 28) [(12, 1), (13, 2), (14, 3), (16, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 2), (15, 2)],
  term ((45 : Rat) / 56) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21780233526040405 : Rat) / 3315510013536) [(12, 1), (14, 1), (15, 2)],
  term ((9803 : Rat) / 126) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 4)],
  term ((73 : Rat) / 14) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((32 : Rat) / 21) [(12, 1), (14, 1), (16, 1)],
  term ((-2689102768797307 : Rat) / 3729948765228) [(12, 1), (14, 2)],
  term ((-2348944180217993 : Rat) / 710466431472) [(12, 1), (14, 2), (15, 2)],
  term ((-1615 : Rat) / 252) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-64 : Rat) / 21) [(12, 1), (14, 2), (16, 1)],
  term ((-51080805401027329 : Rat) / 69625710284256) [(12, 1), (14, 3)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (14, 3), (15, 2)],
  term ((73 : Rat) / 14) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(12, 1), (14, 3), (16, 1)],
  term ((8979241671985367 : Rat) / 14919795060912) [(12, 1), (14, 4)],
  term ((-2444668745291 : Rat) / 266424911802) [(12, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 4)],
  term ((155 : Rat) / 84) [(12, 1), (15, 4), (16, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((45 : Rat) / 56) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((345 : Rat) / 28) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2444668745291 : Rat) / 133212455901) [(12, 2), (14, 1)],
  term ((2001591001496153 : Rat) / 4351606892766) [(12, 2), (14, 1), (15, 2)],
  term ((-155 : Rat) / 42) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(12, 2), (14, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(12, 2), (14, 2), (15, 2)],
  term ((-73 : Rat) / 7) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-884959135454411 : Rat) / 1243316255076) [(13, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 21) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1083132128159513645 : Rat) / 313315696279152) [(13, 1), (14, 1), (15, 3)],
  term ((-697 : Rat) / 84) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-353259007385960903 : Rat) / 156657848139576) [(13, 1), (14, 2), (15, 1)],
  term ((57787 : Rat) / 1008) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(13, 1), (14, 2), (15, 3)],
  term ((-73 : Rat) / 14) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((9894150624921781 : Rat) / 44759385182736) [(13, 1), (14, 3), (15, 1)],
  term ((-11 : Rat) / 252) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(13, 1), (14, 4), (15, 1)],
  term ((-73 : Rat) / 14) [(13, 1), (14, 4), (15, 1), (16, 1)],
  term ((32 : Rat) / 21) [(13, 1), (15, 1), (16, 1)],
  term ((-1267443229339058549 : Rat) / 156657848139576) [(13, 1), (15, 3)],
  term ((134675 : Rat) / 1008) [(13, 1), (15, 3), (16, 1)],
  term ((59007570959845919 : Rat) / 89518770365472) [(13, 2), (14, 1), (15, 2)],
  term ((-5717 : Rat) / 1008) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((5772763704184289 : Rat) / 12788395766496) [(13, 2), (14, 2)],
  term ((55123711284577 : Rat) / 236822143824) [(13, 2), (14, 2), (15, 2)],
  term ((929 : Rat) / 56) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-12125 : Rat) / 1008) [(13, 2), (14, 2), (16, 1)],
  term ((-436510790680541 : Rat) / 4262798588832) [(13, 2), (14, 3)],
  term ((-645 : Rat) / 112) [(13, 2), (14, 3), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(13, 2), (14, 4)],
  term ((345 : Rat) / 56) [(13, 2), (14, 4), (16, 1)],
  term ((720446212206123709 : Rat) / 208877130852768) [(13, 2), (15, 2)],
  term ((-124627 : Rat) / 1008) [(13, 2), (15, 2), (16, 1)],
  term ((436510790680541 : Rat) / 2131399294416) [(13, 3), (14, 1), (15, 1)],
  term ((645 : Rat) / 56) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(13, 3), (14, 2), (15, 1)],
  term ((-345 : Rat) / 28) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-5772763704184289 : Rat) / 6394197883248) [(13, 3), (15, 1)],
  term ((12125 : Rat) / 504) [(13, 3), (15, 1), (16, 1)],
  term ((884959135454411 : Rat) / 2486632510152) [(14, 1), (15, 2)],
  term ((32 : Rat) / 21) [(14, 1), (15, 2), (16, 1)],
  term ((11899100091633005 : Rat) / 7736190031584) [(14, 1), (15, 4)],
  term ((260 : Rat) / 63) [(14, 1), (15, 4), (16, 1)],
  term ((767389288631122807 : Rat) / 208877130852768) [(14, 2), (15, 2)],
  term ((-9995 : Rat) / 252) [(14, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(14, 2), (16, 1)],
  term ((884959135454411 : Rat) / 2486632510152) [(14, 3)],
  term ((129210505385096783 : Rat) / 104438565426384) [(14, 3), (15, 2)],
  term ((260 : Rat) / 63) [(14, 3), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(14, 3), (16, 1)],
  term ((157933140662391043 : Rat) / 417754261705536) [(14, 4)],
  term ((-16 : Rat) / 21) [(14, 4), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(14, 5)],
  term ((-16 : Rat) / 21) [(15, 2), (16, 1)],
  term ((196692205228550653 : Rat) / 59679180243648) [(15, 4)],
  term ((-9803 : Rat) / 252) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 400 through 491. -/
theorem rs_R009_ueqv_R009YNNNN_block_27_0400_0491_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_27_0400_0491
      rs_R009_ueqv_R009YNNNN_block_27_0400_0491 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
