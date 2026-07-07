/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 5:400-449

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0400 : Poly :=
[
  term ((-59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 400 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0400 : Poly :=
[
  term ((119808 : Rat) / 553) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-119808 : Rat) / 553) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0400_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0400
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0401 : Poly :=
[
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 401 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0401 : Poly :=
[
  term ((-38020291217764 : Rat) / 133212455901) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0401_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0401
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0402 : Poly :=
[
  term ((-167049257192861 : Rat) / 473644287648) [(11, 1), (13, 1)]
]

/-- Partial product 402 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0402 : Poly :=
[
  term ((167049257192861 : Rat) / 236822143824) [(4, 1), (11, 1), (13, 1)],
  term ((-167049257192861 : Rat) / 473644287648) [(4, 2), (11, 1), (13, 1)],
  term ((-167049257192861 : Rat) / 473644287648) [(5, 2), (11, 1), (13, 1)],
  term ((-167049257192861 : Rat) / 236822143824) [(11, 1), (13, 1), (14, 1)],
  term ((167049257192861 : Rat) / 473644287648) [(11, 1), (13, 1), (14, 2)],
  term ((167049257192861 : Rat) / 473644287648) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0402_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0402
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0403 : Poly :=
[
  term ((-450932145663390745 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 403 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0403 : Poly :=
[
  term ((450932145663390745 : Rat) / 313315696279152) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-450932145663390745 : Rat) / 626631392558304) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-450932145663390745 : Rat) / 626631392558304) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((450932145663390745 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-450932145663390745 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 2)],
  term ((450932145663390745 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0403_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0403
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0404 : Poly :=
[
  term ((27565 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 404 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0404 : Poly :=
[
  term ((-27565 : Rat) / 504) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27565 : Rat) / 1008) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27565 : Rat) / 1008) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27565 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((27565 : Rat) / 504) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-27565 : Rat) / 1008) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0404_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0404
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0405 : Poly :=
[
  term ((59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 405 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0405 : Poly :=
[
  term ((-119808 : Rat) / 553) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(5, 2), (11, 1), (13, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((119808 : Rat) / 553) [(11, 1), (13, 1), (14, 3)],
  term ((-59904 : Rat) / 553) [(11, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0405_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0405
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0406 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 406 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0406 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0406_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0406
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0407 : Poly :=
[
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 407 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0407 : Poly :=
[
  term ((305 : Rat) / 14) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0407_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0407
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0408 : Poly :=
[
  term ((1345 : Rat) / 336) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 408 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0408 : Poly :=
[
  term ((-1345 : Rat) / 168) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((1345 : Rat) / 336) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((1345 : Rat) / 336) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((1345 : Rat) / 168) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1345 : Rat) / 336) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1345 : Rat) / 336) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0408_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0408
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0409 : Poly :=
[
  term ((-11907993869618039 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 409 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0409 : Poly :=
[
  term ((11907993869618039 : Rat) / 13054820678298) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-11907993869618039 : Rat) / 26109641356596) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-11907993869618039 : Rat) / 26109641356596) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((11907993869618039 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 3)],
  term ((-11907993869618039 : Rat) / 13054820678298) [(11, 1), (14, 2), (15, 1)],
  term ((11907993869618039 : Rat) / 26109641356596) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0409_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0409
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0410 : Poly :=
[
  term ((-5881 : Rat) / 252) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0410 : Poly :=
[
  term ((5881 : Rat) / 126) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5881 : Rat) / 252) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5881 : Rat) / 252) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5881 : Rat) / 252) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5881 : Rat) / 126) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5881 : Rat) / 252) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0410_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0410
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0411 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 411 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0411 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 3)],
  term ((-6128799131236 : Rat) / 26861770943) [(11, 1), (14, 3), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0411_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0411
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0412 : Poly :=
[
  term ((-310492297389721549 : Rat) / 208877130852768) [(11, 1), (15, 1)]
]

/-- Partial product 412 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0412 : Poly :=
[
  term ((310492297389721549 : Rat) / 104438565426384) [(4, 1), (11, 1), (15, 1)],
  term ((-310492297389721549 : Rat) / 208877130852768) [(4, 2), (11, 1), (15, 1)],
  term ((-310492297389721549 : Rat) / 208877130852768) [(5, 2), (11, 1), (15, 1)],
  term ((-310492297389721549 : Rat) / 104438565426384) [(11, 1), (14, 1), (15, 1)],
  term ((310492297389721549 : Rat) / 208877130852768) [(11, 1), (14, 2), (15, 1)],
  term ((310492297389721549 : Rat) / 208877130852768) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0412_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0412
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0413 : Poly :=
[
  term ((-247 : Rat) / 84) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0413 : Poly :=
[
  term ((247 : Rat) / 42) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 84) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 84) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 42) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 84) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((247 : Rat) / 84) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0413_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0413
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0414 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (15, 3)]
]

/-- Partial product 414 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0414 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(4, 1), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 2), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(5, 2), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (14, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (14, 2), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0414_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0414
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0415 : Poly :=
[
  term ((65 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 415 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0415 : Poly :=
[
  term ((-130 : Rat) / 7) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0415_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0415
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0416 : Poly :=
[
  term ((-1343102595349 : Rat) / 44404151967) [(11, 2)]
]

/-- Partial product 416 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0416 : Poly :=
[
  term ((2686205190698 : Rat) / 44404151967) [(4, 1), (11, 2)],
  term ((-1343102595349 : Rat) / 44404151967) [(4, 2), (11, 2)],
  term ((-1343102595349 : Rat) / 44404151967) [(5, 2), (11, 2)],
  term ((-2686205190698 : Rat) / 44404151967) [(11, 2), (14, 1)],
  term ((1343102595349 : Rat) / 44404151967) [(11, 2), (14, 2)],
  term ((1343102595349 : Rat) / 44404151967) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0416_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0416
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0417 : Poly :=
[
  term ((35738639876249203 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 417 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0417 : Poly :=
[
  term ((-35738639876249203 : Rat) / 13054820678298) [(4, 1), (11, 2), (14, 1)],
  term ((35738639876249203 : Rat) / 26109641356596) [(4, 2), (11, 2), (14, 1)],
  term ((35738639876249203 : Rat) / 26109641356596) [(5, 2), (11, 2), (14, 1)],
  term ((-35738639876249203 : Rat) / 26109641356596) [(11, 2), (14, 1), (15, 2)],
  term ((35738639876249203 : Rat) / 13054820678298) [(11, 2), (14, 2)],
  term ((-35738639876249203 : Rat) / 26109641356596) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0417_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0417
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0418 : Poly :=
[
  term ((-119808 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 418 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0418 : Poly :=
[
  term ((239616 : Rat) / 553) [(4, 1), (11, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(4, 2), (11, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(5, 2), (11, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(11, 2), (14, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(11, 2), (14, 2), (15, 2)],
  term ((119808 : Rat) / 553) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0418_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0418
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0419 : Poly :=
[
  term ((-2444668745291 : Rat) / 266424911802) [(12, 1)]
]

/-- Partial product 419 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0419 : Poly :=
[
  term ((2444668745291 : Rat) / 133212455901) [(4, 1), (12, 1)],
  term ((-2444668745291 : Rat) / 266424911802) [(4, 2), (12, 1)],
  term ((-2444668745291 : Rat) / 266424911802) [(5, 2), (12, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(12, 1), (14, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(12, 1), (14, 2)],
  term ((2444668745291 : Rat) / 266424911802) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0419_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0419
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0420 : Poly :=
[
  term ((-2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 420 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0420 : Poly :=
[
  term ((2629582380889 : Rat) / 118411071912) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2629582380889 : Rat) / 118411071912) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0420_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0420
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0421 : Poly :=
[
  term ((-345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0421 : Poly :=
[
  term ((345 : Rat) / 28) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-345 : Rat) / 28) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0421_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0421
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0422 : Poly :=
[
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 422 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0422 : Poly :=
[
  term ((-389178307824539 : Rat) / 2131399294416) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0422_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0422
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0423 : Poly :=
[
  term ((-45 : Rat) / 112) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 423 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0423 : Poly :=
[
  term ((45 : Rat) / 56) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0423_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0423
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0424 : Poly :=
[
  term ((2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1)]
]

/-- Partial product 424 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0424 : Poly :=
[
  term ((-5983066912384 : Rat) / 133212455901) [(4, 1), (12, 1), (14, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(4, 2), (12, 1), (14, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(5, 2), (12, 1), (14, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1), (15, 2)],
  term ((5983066912384 : Rat) / 133212455901) [(12, 1), (14, 2)],
  term ((-2991533456192 : Rat) / 133212455901) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0424_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0424
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0425 : Poly :=
[
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 425 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0425 : Poly :=
[
  term ((-2187255370987 : Rat) / 9867589326) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 4)],
  term ((2187255370987 : Rat) / 9867589326) [(12, 1), (14, 2), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0425_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0425
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0426 : Poly :=
[
  term ((73 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 426 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0426 : Poly :=
[
  term ((-73 : Rat) / 7) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((73 : Rat) / 7) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(12, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0426_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0426
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0427 : Poly :=
[
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

/-- Partial product 427 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0427 : Poly :=
[
  term ((2001591001496153 : Rat) / 4351606892766) [(4, 1), (12, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(4, 2), (12, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(5, 2), (12, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(12, 1), (14, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 1), (14, 2), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0427_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0427
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0428 : Poly :=
[
  term ((155 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 428 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0428 : Poly :=
[
  term ((-155 : Rat) / 42) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 42) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 84) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-155 : Rat) / 84) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0428_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0428
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0429 : Poly :=
[
  term ((20237468146973335 : Rat) / 26109641356596) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 429 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0429 : Poly :=
[
  term ((-20237468146973335 : Rat) / 13054820678298) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((20237468146973335 : Rat) / 26109641356596) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((20237468146973335 : Rat) / 26109641356596) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-20237468146973335 : Rat) / 26109641356596) [(13, 1), (14, 1), (15, 3)],
  term ((20237468146973335 : Rat) / 13054820678298) [(13, 1), (14, 2), (15, 1)],
  term ((-20237468146973335 : Rat) / 26109641356596) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0429_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0429
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0430 : Poly :=
[
  term ((-319 : Rat) / 252) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0430 : Poly :=
[
  term ((319 : Rat) / 126) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-319 : Rat) / 252) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-319 : Rat) / 252) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((319 : Rat) / 252) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-319 : Rat) / 126) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((319 : Rat) / 252) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0430_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0430
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0431 : Poly :=
[
  term ((-162334705359487 : Rat) / 967023753948) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 431 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0431 : Poly :=
[
  term ((162334705359487 : Rat) / 483511876974) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((162334705359487 : Rat) / 967023753948) [(13, 1), (14, 2), (15, 3)],
  term ((-162334705359487 : Rat) / 483511876974) [(13, 1), (14, 3), (15, 1)],
  term ((162334705359487 : Rat) / 967023753948) [(13, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0431_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0431
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0432 : Poly :=
[
  term ((-73 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0432 : Poly :=
[
  term ((73 : Rat) / 7) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 14) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-73 : Rat) / 7) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((73 : Rat) / 14) [(13, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0432_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0432
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0433 : Poly :=
[
  term ((-17724613352883659 : Rat) / 156657848139576) [(13, 1), (15, 1)]
]

/-- Partial product 433 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0433 : Poly :=
[
  term ((17724613352883659 : Rat) / 78328924069788) [(4, 1), (13, 1), (15, 1)],
  term ((-17724613352883659 : Rat) / 156657848139576) [(4, 2), (13, 1), (15, 1)],
  term ((-17724613352883659 : Rat) / 156657848139576) [(5, 2), (13, 1), (15, 1)],
  term ((-17724613352883659 : Rat) / 78328924069788) [(13, 1), (14, 1), (15, 1)],
  term ((17724613352883659 : Rat) / 156657848139576) [(13, 1), (14, 2), (15, 1)],
  term ((17724613352883659 : Rat) / 156657848139576) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0433_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0433
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0434 : Poly :=
[
  term ((319 : Rat) / 72) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0434 : Poly :=
[
  term ((-319 : Rat) / 36) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((319 : Rat) / 72) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((319 : Rat) / 72) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((319 : Rat) / 36) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-319 : Rat) / 72) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-319 : Rat) / 72) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0434_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0434
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0435 : Poly :=
[
  term ((32520554367487 : Rat) / 608971226976) [(13, 2)]
]

/-- Partial product 435 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0435 : Poly :=
[
  term ((-32520554367487 : Rat) / 304485613488) [(4, 1), (13, 2)],
  term ((32520554367487 : Rat) / 608971226976) [(4, 2), (13, 2)],
  term ((32520554367487 : Rat) / 608971226976) [(5, 2), (13, 2)],
  term ((32520554367487 : Rat) / 304485613488) [(13, 2), (14, 1)],
  term ((-32520554367487 : Rat) / 608971226976) [(13, 2), (14, 2)],
  term ((-32520554367487 : Rat) / 608971226976) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0435_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0435
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0436 : Poly :=
[
  term ((-129233879591821 : Rat) / 161878427424) [(13, 2), (14, 1)]
]

/-- Partial product 436 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0436 : Poly :=
[
  term ((129233879591821 : Rat) / 80939213712) [(4, 1), (13, 2), (14, 1)],
  term ((-129233879591821 : Rat) / 161878427424) [(4, 2), (13, 2), (14, 1)],
  term ((-129233879591821 : Rat) / 161878427424) [(5, 2), (13, 2), (14, 1)],
  term ((129233879591821 : Rat) / 161878427424) [(13, 2), (14, 1), (15, 2)],
  term ((-129233879591821 : Rat) / 80939213712) [(13, 2), (14, 2)],
  term ((129233879591821 : Rat) / 161878427424) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0436_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0436
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0437 : Poly :=
[
  term ((25 : Rat) / 144) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 437 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0437 : Poly :=
[
  term ((-25 : Rat) / 72) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((25 : Rat) / 144) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((25 : Rat) / 144) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-25 : Rat) / 144) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((25 : Rat) / 72) [(13, 2), (14, 2), (16, 1)],
  term ((-25 : Rat) / 144) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0437_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0437
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0438 : Poly :=
[
  term ((2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2)]
]

/-- Partial product 438 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0438 : Poly :=
[
  term ((-2629582380889 : Rat) / 118411071912) [(4, 1), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(4, 2), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(5, 2), (13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2), (15, 2)],
  term ((2629582380889 : Rat) / 118411071912) [(13, 2), (14, 3)],
  term ((-2629582380889 : Rat) / 236822143824) [(13, 2), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0438_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0438
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0439 : Poly :=
[
  term ((345 : Rat) / 56) [(13, 2), (14, 2), (16, 1)]
]

/-- Partial product 439 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0439 : Poly :=
[
  term ((-345 : Rat) / 28) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 56) [(4, 2), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 56) [(5, 2), (13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 56) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((345 : Rat) / 28) [(13, 2), (14, 3), (16, 1)],
  term ((-345 : Rat) / 56) [(13, 2), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0439_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0439
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0440 : Poly :=
[
  term ((-3125 : Rat) / 336) [(13, 2), (16, 1)]
]

/-- Partial product 440 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0440 : Poly :=
[
  term ((3125 : Rat) / 168) [(4, 1), (13, 2), (16, 1)],
  term ((-3125 : Rat) / 336) [(4, 2), (13, 2), (16, 1)],
  term ((-3125 : Rat) / 336) [(5, 2), (13, 2), (16, 1)],
  term ((-3125 : Rat) / 168) [(13, 2), (14, 1), (16, 1)],
  term ((3125 : Rat) / 336) [(13, 2), (14, 2), (16, 1)],
  term ((3125 : Rat) / 336) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0440_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0440
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0441 : Poly :=
[
  term ((-15035464526341615 : Rat) / 69625710284256) [(14, 1)]
]

/-- Partial product 441 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0441 : Poly :=
[
  term ((15035464526341615 : Rat) / 34812855142128) [(4, 1), (14, 1)],
  term ((-15035464526341615 : Rat) / 69625710284256) [(4, 2), (14, 1)],
  term ((-15035464526341615 : Rat) / 69625710284256) [(5, 2), (14, 1)],
  term ((15035464526341615 : Rat) / 69625710284256) [(14, 1), (15, 2)],
  term ((-15035464526341615 : Rat) / 34812855142128) [(14, 2)],
  term ((15035464526341615 : Rat) / 69625710284256) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0441_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0441
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0442 : Poly :=
[
  term ((-9954757113931841 : Rat) / 208877130852768) [(14, 1), (15, 2)]
]

/-- Partial product 442 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0442 : Poly :=
[
  term ((9954757113931841 : Rat) / 104438565426384) [(4, 1), (14, 1), (15, 2)],
  term ((-9954757113931841 : Rat) / 208877130852768) [(4, 2), (14, 1), (15, 2)],
  term ((-9954757113931841 : Rat) / 208877130852768) [(5, 2), (14, 1), (15, 2)],
  term ((9954757113931841 : Rat) / 208877130852768) [(14, 1), (15, 4)],
  term ((-9954757113931841 : Rat) / 104438565426384) [(14, 2), (15, 2)],
  term ((9954757113931841 : Rat) / 208877130852768) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0442_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0442
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0443 : Poly :=
[
  term ((4 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 443 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0443 : Poly :=
[
  term ((-8 : Rat) / 7) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 7) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 7) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(14, 1), (15, 4), (16, 1)],
  term ((8 : Rat) / 7) [(14, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0443_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0443
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0444 : Poly :=
[
  term ((32 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 444 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0444 : Poly :=
[
  term ((-64 : Rat) / 21) [(4, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 21) [(4, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 21) [(5, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(14, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 21) [(14, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0444_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0444
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0445 : Poly :=
[
  term ((77812387650549133 : Rat) / 139251420568512) [(14, 2)]
]

/-- Partial product 445 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0445 : Poly :=
[
  term ((-77812387650549133 : Rat) / 69625710284256) [(4, 1), (14, 2)],
  term ((77812387650549133 : Rat) / 139251420568512) [(4, 2), (14, 2)],
  term ((77812387650549133 : Rat) / 139251420568512) [(5, 2), (14, 2)],
  term ((-77812387650549133 : Rat) / 139251420568512) [(14, 2), (15, 2)],
  term ((77812387650549133 : Rat) / 69625710284256) [(14, 3)],
  term ((-77812387650549133 : Rat) / 139251420568512) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0445_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0445
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0446 : Poly :=
[
  term ((-16 : Rat) / 21) [(14, 2), (16, 1)]
]

/-- Partial product 446 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0446 : Poly :=
[
  term ((32 : Rat) / 21) [(4, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(4, 2), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(5, 2), (14, 2), (16, 1)],
  term ((16 : Rat) / 21) [(14, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(14, 3), (16, 1)],
  term ((16 : Rat) / 21) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0446_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0446
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0447 : Poly :=
[
  term ((-8979241671985367 : Rat) / 29839590121824) [(14, 3)]
]

/-- Partial product 447 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0447 : Poly :=
[
  term ((8979241671985367 : Rat) / 14919795060912) [(4, 1), (14, 3)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(4, 2), (14, 3)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(5, 2), (14, 3)],
  term ((8979241671985367 : Rat) / 29839590121824) [(14, 3), (15, 2)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(14, 4)],
  term ((8979241671985367 : Rat) / 29839590121824) [(14, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0447_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0447
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0448 : Poly :=
[
  term ((499245136005861815 : Rat) / 417754261705536) [(15, 2)]
]

/-- Partial product 448 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0448 : Poly :=
[
  term ((-499245136005861815 : Rat) / 208877130852768) [(4, 1), (15, 2)],
  term ((499245136005861815 : Rat) / 417754261705536) [(4, 2), (15, 2)],
  term ((499245136005861815 : Rat) / 417754261705536) [(5, 2), (15, 2)],
  term ((499245136005861815 : Rat) / 208877130852768) [(14, 1), (15, 2)],
  term ((-499245136005861815 : Rat) / 417754261705536) [(14, 2), (15, 2)],
  term ((-499245136005861815 : Rat) / 417754261705536) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0448_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0448
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0449 : Poly :=
[
  term ((5 : Rat) / 18) [(15, 2), (16, 1)]
]

/-- Partial product 449 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0449 : Poly :=
[
  term ((-5 : Rat) / 9) [(4, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 18) [(4, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 18) [(5, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 9) [(14, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 18) [(14, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 18) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0449_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0449
        rs_R009_ueqv_R009YNNNN_generator_05_0400_0449 =
      rs_R009_ueqv_R009YNNNN_partial_05_0449 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_05_0400_0449 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_05_0400,
  rs_R009_ueqv_R009YNNNN_partial_05_0401,
  rs_R009_ueqv_R009YNNNN_partial_05_0402,
  rs_R009_ueqv_R009YNNNN_partial_05_0403,
  rs_R009_ueqv_R009YNNNN_partial_05_0404,
  rs_R009_ueqv_R009YNNNN_partial_05_0405,
  rs_R009_ueqv_R009YNNNN_partial_05_0406,
  rs_R009_ueqv_R009YNNNN_partial_05_0407,
  rs_R009_ueqv_R009YNNNN_partial_05_0408,
  rs_R009_ueqv_R009YNNNN_partial_05_0409,
  rs_R009_ueqv_R009YNNNN_partial_05_0410,
  rs_R009_ueqv_R009YNNNN_partial_05_0411,
  rs_R009_ueqv_R009YNNNN_partial_05_0412,
  rs_R009_ueqv_R009YNNNN_partial_05_0413,
  rs_R009_ueqv_R009YNNNN_partial_05_0414,
  rs_R009_ueqv_R009YNNNN_partial_05_0415,
  rs_R009_ueqv_R009YNNNN_partial_05_0416,
  rs_R009_ueqv_R009YNNNN_partial_05_0417,
  rs_R009_ueqv_R009YNNNN_partial_05_0418,
  rs_R009_ueqv_R009YNNNN_partial_05_0419,
  rs_R009_ueqv_R009YNNNN_partial_05_0420,
  rs_R009_ueqv_R009YNNNN_partial_05_0421,
  rs_R009_ueqv_R009YNNNN_partial_05_0422,
  rs_R009_ueqv_R009YNNNN_partial_05_0423,
  rs_R009_ueqv_R009YNNNN_partial_05_0424,
  rs_R009_ueqv_R009YNNNN_partial_05_0425,
  rs_R009_ueqv_R009YNNNN_partial_05_0426,
  rs_R009_ueqv_R009YNNNN_partial_05_0427,
  rs_R009_ueqv_R009YNNNN_partial_05_0428,
  rs_R009_ueqv_R009YNNNN_partial_05_0429,
  rs_R009_ueqv_R009YNNNN_partial_05_0430,
  rs_R009_ueqv_R009YNNNN_partial_05_0431,
  rs_R009_ueqv_R009YNNNN_partial_05_0432,
  rs_R009_ueqv_R009YNNNN_partial_05_0433,
  rs_R009_ueqv_R009YNNNN_partial_05_0434,
  rs_R009_ueqv_R009YNNNN_partial_05_0435,
  rs_R009_ueqv_R009YNNNN_partial_05_0436,
  rs_R009_ueqv_R009YNNNN_partial_05_0437,
  rs_R009_ueqv_R009YNNNN_partial_05_0438,
  rs_R009_ueqv_R009YNNNN_partial_05_0439,
  rs_R009_ueqv_R009YNNNN_partial_05_0440,
  rs_R009_ueqv_R009YNNNN_partial_05_0441,
  rs_R009_ueqv_R009YNNNN_partial_05_0442,
  rs_R009_ueqv_R009YNNNN_partial_05_0443,
  rs_R009_ueqv_R009YNNNN_partial_05_0444,
  rs_R009_ueqv_R009YNNNN_partial_05_0445,
  rs_R009_ueqv_R009YNNNN_partial_05_0446,
  rs_R009_ueqv_R009YNNNN_partial_05_0447,
  rs_R009_ueqv_R009YNNNN_partial_05_0448,
  rs_R009_ueqv_R009YNNNN_partial_05_0449
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_05_0400_0449 : Poly :=
[
  term ((119808 : Rat) / 553) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-38020291217764 : Rat) / 133212455901) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((167049257192861 : Rat) / 236822143824) [(4, 1), (11, 1), (13, 1)],
  term ((450932145663390745 : Rat) / 313315696279152) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-27565 : Rat) / 504) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 14) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1345 : Rat) / 168) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((11907993869618039 : Rat) / 13054820678298) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((5881 : Rat) / 126) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((310492297389721549 : Rat) / 104438565426384) [(4, 1), (11, 1), (15, 1)],
  term ((247 : Rat) / 42) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(4, 1), (11, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((2686205190698 : Rat) / 44404151967) [(4, 1), (11, 2)],
  term ((-35738639876249203 : Rat) / 13054820678298) [(4, 1), (11, 2), (14, 1)],
  term ((239616 : Rat) / 553) [(4, 1), (11, 2), (15, 2)],
  term ((2444668745291 : Rat) / 133212455901) [(4, 1), (12, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 28) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 56) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(4, 1), (12, 1), (14, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 7) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 4351606892766) [(4, 1), (12, 1), (15, 2)],
  term ((-155 : Rat) / 42) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20237468146973335 : Rat) / 13054820678298) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((319 : Rat) / 126) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((162334705359487 : Rat) / 483511876974) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 7) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17724613352883659 : Rat) / 78328924069788) [(4, 1), (13, 1), (15, 1)],
  term ((-319 : Rat) / 36) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32520554367487 : Rat) / 304485613488) [(4, 1), (13, 2)],
  term ((129233879591821 : Rat) / 80939213712) [(4, 1), (13, 2), (14, 1)],
  term ((-25 : Rat) / 72) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(4, 1), (13, 2), (14, 2)],
  term ((-345 : Rat) / 28) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((3125 : Rat) / 168) [(4, 1), (13, 2), (16, 1)],
  term ((15035464526341615 : Rat) / 34812855142128) [(4, 1), (14, 1)],
  term ((9954757113931841 : Rat) / 104438565426384) [(4, 1), (14, 1), (15, 2)],
  term ((-8 : Rat) / 7) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 21) [(4, 1), (14, 1), (16, 1)],
  term ((-77812387650549133 : Rat) / 69625710284256) [(4, 1), (14, 2)],
  term ((32 : Rat) / 21) [(4, 1), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 14919795060912) [(4, 1), (14, 3)],
  term ((-499245136005861815 : Rat) / 208877130852768) [(4, 1), (15, 2)],
  term ((-5 : Rat) / 9) [(4, 1), (15, 2), (16, 1)],
  term ((-59904 : Rat) / 553) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-167049257192861 : Rat) / 473644287648) [(4, 2), (11, 1), (13, 1)],
  term ((-450932145663390745 : Rat) / 626631392558304) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((27565 : Rat) / 1008) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1345 : Rat) / 336) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11907993869618039 : Rat) / 26109641356596) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-5881 : Rat) / 252) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((-310492297389721549 : Rat) / 208877130852768) [(4, 2), (11, 1), (15, 1)],
  term ((-247 : Rat) / 84) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 2), (11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1343102595349 : Rat) / 44404151967) [(4, 2), (11, 2)],
  term ((35738639876249203 : Rat) / 26109641356596) [(4, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(4, 2), (11, 2), (15, 2)],
  term ((-2444668745291 : Rat) / 266424911802) [(4, 2), (12, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 56) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-45 : Rat) / 112) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(4, 2), (12, 1), (14, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(4, 2), (12, 1), (15, 2)],
  term ((155 : Rat) / 84) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((20237468146973335 : Rat) / 26109641356596) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-319 : Rat) / 252) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 14) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17724613352883659 : Rat) / 156657848139576) [(4, 2), (13, 1), (15, 1)],
  term ((319 : Rat) / 72) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((32520554367487 : Rat) / 608971226976) [(4, 2), (13, 2)],
  term ((-129233879591821 : Rat) / 161878427424) [(4, 2), (13, 2), (14, 1)],
  term ((25 : Rat) / 144) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(4, 2), (13, 2), (14, 2)],
  term ((345 : Rat) / 56) [(4, 2), (13, 2), (14, 2), (16, 1)],
  term ((-3125 : Rat) / 336) [(4, 2), (13, 2), (16, 1)],
  term ((-15035464526341615 : Rat) / 69625710284256) [(4, 2), (14, 1)],
  term ((-9954757113931841 : Rat) / 208877130852768) [(4, 2), (14, 1), (15, 2)],
  term ((4 : Rat) / 7) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(4, 2), (14, 1), (16, 1)],
  term ((77812387650549133 : Rat) / 139251420568512) [(4, 2), (14, 2)],
  term ((-16 : Rat) / 21) [(4, 2), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(4, 2), (14, 3)],
  term ((499245136005861815 : Rat) / 417754261705536) [(4, 2), (15, 2)],
  term ((5 : Rat) / 18) [(4, 2), (15, 2), (16, 1)],
  term ((-59904 : Rat) / 553) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-167049257192861 : Rat) / 473644287648) [(5, 2), (11, 1), (13, 1)],
  term ((-450932145663390745 : Rat) / 626631392558304) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((27565 : Rat) / 1008) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(5, 2), (11, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1345 : Rat) / 336) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11907993869618039 : Rat) / 26109641356596) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-5881 : Rat) / 252) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((-310492297389721549 : Rat) / 208877130852768) [(5, 2), (11, 1), (15, 1)],
  term ((-247 : Rat) / 84) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(5, 2), (11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1343102595349 : Rat) / 44404151967) [(5, 2), (11, 2)],
  term ((35738639876249203 : Rat) / 26109641356596) [(5, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(5, 2), (11, 2), (15, 2)],
  term ((-2444668745291 : Rat) / 266424911802) [(5, 2), (12, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 56) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-45 : Rat) / 112) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(5, 2), (12, 1), (14, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(5, 2), (12, 1), (15, 2)],
  term ((155 : Rat) / 84) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((20237468146973335 : Rat) / 26109641356596) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-319 : Rat) / 252) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 14) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17724613352883659 : Rat) / 156657848139576) [(5, 2), (13, 1), (15, 1)],
  term ((319 : Rat) / 72) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((32520554367487 : Rat) / 608971226976) [(5, 2), (13, 2)],
  term ((-129233879591821 : Rat) / 161878427424) [(5, 2), (13, 2), (14, 1)],
  term ((25 : Rat) / 144) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(5, 2), (13, 2), (14, 2)],
  term ((345 : Rat) / 56) [(5, 2), (13, 2), (14, 2), (16, 1)],
  term ((-3125 : Rat) / 336) [(5, 2), (13, 2), (16, 1)],
  term ((-15035464526341615 : Rat) / 69625710284256) [(5, 2), (14, 1)],
  term ((-9954757113931841 : Rat) / 208877130852768) [(5, 2), (14, 1), (15, 2)],
  term ((4 : Rat) / 7) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(5, 2), (14, 1), (16, 1)],
  term ((77812387650549133 : Rat) / 139251420568512) [(5, 2), (14, 2)],
  term ((-16 : Rat) / 21) [(5, 2), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(5, 2), (14, 3)],
  term ((499245136005861815 : Rat) / 417754261705536) [(5, 2), (15, 2)],
  term ((5 : Rat) / 18) [(5, 2), (15, 2), (16, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-47870756669618 : Rat) / 133212455901) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 3)],
  term ((-167049257192861 : Rat) / 236822143824) [(11, 1), (13, 1), (14, 1)],
  term ((544729092953770561 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7075 : Rat) / 144) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1345 : Rat) / 168) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-680858124060626387 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 2)],
  term ((-7229694561605 : Rat) / 39470357304) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((305 : Rat) / 28) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((51095 : Rat) / 1008) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((586692460093092889 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 3)],
  term ((-27565 : Rat) / 1008) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (13, 1), (14, 4)],
  term ((167049257192861 : Rat) / 473644287648) [(11, 1), (13, 1), (15, 2)],
  term ((-1345 : Rat) / 336) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 4)],
  term ((305 : Rat) / 28) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-310492297389721549 : Rat) / 104438565426384) [(11, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 42) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5968771131240467 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 3)],
  term ((10561 : Rat) / 252) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((119964395475832925 : Rat) / 208877130852768) [(11, 1), (14, 2), (15, 1)],
  term ((-11021 : Rat) / 252) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((330455985942749 : Rat) / 1450535630922) [(11, 1), (14, 2), (15, 3)],
  term ((-65 : Rat) / 7) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((5950801114056647 : Rat) / 26109641356596) [(11, 1), (14, 3), (15, 1)],
  term ((5881 : Rat) / 252) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 4), (15, 1)],
  term ((310492297389721549 : Rat) / 208877130852768) [(11, 1), (15, 3)],
  term ((247 : Rat) / 84) [(11, 1), (15, 3), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (15, 5)],
  term ((-65 : Rat) / 7) [(11, 1), (15, 5), (16, 1)],
  term ((-2686205190698 : Rat) / 44404151967) [(11, 2), (14, 1)],
  term ((-47051999412057715 : Rat) / 26109641356596) [(11, 2), (14, 1), (15, 2)],
  term ((36133512039281809 : Rat) / 13054820678298) [(11, 2), (14, 2)],
  term ((119808 : Rat) / 553) [(11, 2), (14, 2), (15, 2)],
  term ((-35738639876249203 : Rat) / 26109641356596) [(11, 2), (14, 3)],
  term ((1343102595349 : Rat) / 44404151967) [(11, 2), (15, 2)],
  term ((119808 : Rat) / 553) [(11, 2), (15, 4)],
  term ((389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-45 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-483843273536543 : Rat) / 4262798588832) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1335 : Rat) / 112) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((345 : Rat) / 56) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 3)],
  term ((45 : Rat) / 112) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(12, 1), (14, 1)],
  term ((-6297943283195275 : Rat) / 13054820678298) [(12, 1), (14, 1), (15, 2)],
  term ((155 : Rat) / 42) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 4)],
  term ((-73 : Rat) / 14) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((2058686081437 : Rat) / 38060701686) [(12, 1), (14, 2)],
  term ((3930750238706687 : Rat) / 8703213785532) [(12, 1), (14, 2), (15, 2)],
  term ((103 : Rat) / 12) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(12, 1), (14, 3)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 1), (14, 3), (15, 2)],
  term ((-73 : Rat) / 14) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(12, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 4)],
  term ((-155 : Rat) / 84) [(12, 1), (15, 4), (16, 1)],
  term ((-17724613352883659 : Rat) / 78328924069788) [(13, 1), (14, 1), (15, 1)],
  term ((319 : Rat) / 36) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20237468146973335 : Rat) / 26109641356596) [(13, 1), (14, 1), (15, 3)],
  term ((319 : Rat) / 252) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((37224890159509097 : Rat) / 22379692591368) [(13, 1), (14, 2), (15, 1)],
  term ((-3509 : Rat) / 504) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((162334705359487 : Rat) / 967023753948) [(13, 1), (14, 2), (15, 3)],
  term ((73 : Rat) / 14) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-4143363176626519 : Rat) / 3729948765228) [(13, 1), (14, 3), (15, 1)],
  term ((-2309 : Rat) / 252) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((162334705359487 : Rat) / 967023753948) [(13, 1), (14, 4), (15, 1)],
  term ((73 : Rat) / 14) [(13, 1), (14, 4), (15, 1), (16, 1)],
  term ((17724613352883659 : Rat) / 156657848139576) [(13, 1), (15, 3)],
  term ((-319 : Rat) / 72) [(13, 1), (15, 3), (16, 1)],
  term ((32520554367487 : Rat) / 304485613488) [(13, 2), (14, 1)],
  term ((129233879591821 : Rat) / 161878427424) [(13, 2), (14, 1), (15, 2)],
  term ((-25 : Rat) / 144) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3125 : Rat) / 168) [(13, 2), (14, 1), (16, 1)],
  term ((-21101884617224945 : Rat) / 12788395766496) [(13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2), (15, 2)],
  term ((-345 : Rat) / 56) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((9725 : Rat) / 1008) [(13, 2), (14, 2), (16, 1)],
  term ((1499067340698553 : Rat) / 1826913680928) [(13, 2), (14, 3)],
  term ((12245 : Rat) / 1008) [(13, 2), (14, 3), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(13, 2), (14, 4)],
  term ((-345 : Rat) / 56) [(13, 2), (14, 4), (16, 1)],
  term ((-32520554367487 : Rat) / 608971226976) [(13, 2), (15, 2)],
  term ((3125 : Rat) / 336) [(13, 2), (15, 2), (16, 1)],
  term ((19441126056603095 : Rat) / 7459897530456) [(14, 1), (15, 2)],
  term ((-61 : Rat) / 63) [(14, 1), (15, 2), (16, 1)],
  term ((9954757113931841 : Rat) / 208877130852768) [(14, 1), (15, 4)],
  term ((-4 : Rat) / 7) [(14, 1), (15, 4), (16, 1)],
  term ((-15035464526341615 : Rat) / 34812855142128) [(14, 2)],
  term ((-386250663706618289 : Rat) / 208877130852768) [(14, 2), (15, 2)],
  term ((205 : Rat) / 126) [(14, 2), (15, 2), (16, 1)],
  term ((64 : Rat) / 21) [(14, 2), (16, 1)],
  term ((3315994720603241 : Rat) / 2486632510152) [(14, 3)],
  term ((36404724408914705 : Rat) / 104438565426384) [(14, 3), (15, 2)],
  term ((-4 : Rat) / 7) [(14, 3), (15, 2), (16, 1)],
  term ((-64 : Rat) / 21) [(14, 3), (16, 1)],
  term ((-484855929767237675 : Rat) / 417754261705536) [(14, 4)],
  term ((16 : Rat) / 21) [(14, 4), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(14, 5)],
  term ((-499245136005861815 : Rat) / 417754261705536) [(15, 4)],
  term ((-5 : Rat) / 18) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 400 through 449. -/
theorem rs_R009_ueqv_R009YNNNN_block_05_0400_0449_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_05_0400_0449
      rs_R009_ueqv_R009YNNNN_block_05_0400_0449 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
