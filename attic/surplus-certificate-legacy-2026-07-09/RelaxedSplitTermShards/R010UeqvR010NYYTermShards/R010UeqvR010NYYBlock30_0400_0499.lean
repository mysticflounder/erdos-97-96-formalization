/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 30:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_30_0400_0499 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0400 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 400 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0400 : Poly :=
[
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0400_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0400
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0401 : Poly :=
[
  term ((-3004167812192307 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 401 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0401 : Poly :=
[
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 1704478755934976) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((3004167812192307 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0401_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0401
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0402 : Poly :=
[
  term ((56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0402 : Poly :=
[
  term ((56706756499841811 : Rat) / 745709455721552) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((56706756499841811 : Rat) / 745709455721552) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0402_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0402
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0403 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 403 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0403 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0403_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0403
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0404 : Poly :=
[
  term ((141104706952223 : Rat) / 25631259487744) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0404 : Poly :=
[
  term ((141104706952223 : Rat) / 12815629743872) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-141104706952223 : Rat) / 25631259487744) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((141104706952223 : Rat) / 12815629743872) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-141104706952223 : Rat) / 25631259487744) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0404_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0404
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0405 : Poly :=
[
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 405 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0405 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0405_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0405
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0406 : Poly :=
[
  term ((-121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0406 : Poly :=
[
  term ((-121178165322538353 : Rat) / 4065412167871936) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 4065412167871936) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0406_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0406
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0407 : Poly :=
[
  term ((-129262291401399354391 : Rat) / 886687790719015936) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0407 : Poly :=
[
  term ((-129262291401399354391 : Rat) / 443343895359507968) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((129262291401399354391 : Rat) / 886687790719015936) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-129262291401399354391 : Rat) / 443343895359507968) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((129262291401399354391 : Rat) / 886687790719015936) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0407_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0407
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0408 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 408 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0408 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0408_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0408
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0409 : Poly :=
[
  term ((-107122057213534710813 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 409 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0409 : Poly :=
[
  term ((-107122057213534710813 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((107122057213534710813 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-107122057213534710813 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((107122057213534710813 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0409_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0409
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0410 : Poly :=
[
  term ((6266387262529002907783 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 410 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0410 : Poly :=
[
  term ((6266387262529002907783 : Rat) / 25270602035491954176) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6266387262529002907783 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((6266387262529002907783 : Rat) / 25270602035491954176) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6266387262529002907783 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0410_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0410
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0411 : Poly :=
[
  term ((-22602990980736309003661 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 411 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0411 : Poly :=
[
  term ((-22602990980736309003661 : Rat) / 151623612212951725056) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((22602990980736309003661 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-22602990980736309003661 : Rat) / 151623612212951725056) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((22602990980736309003661 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0411_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0411
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0412 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 412 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0412 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (12, 2), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0412_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0412
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0413 : Poly :=
[
  term ((-867824197745273585175 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 413 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0413 : Poly :=
[
  term ((-867824197745273585175 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((867824197745273585175 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-867824197745273585175 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((867824197745273585175 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0413_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0413
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0414 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 414 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0414 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0414_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0414
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0415 : Poly :=
[
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0415 : Poly :=
[
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0415_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0415
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0416 : Poly :=
[
  term ((8940613902879914185535 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 416 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0416 : Poly :=
[
  term ((8940613902879914185535 : Rat) / 25270602035491954176) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8940613902879914185535 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((8940613902879914185535 : Rat) / 25270602035491954176) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8940613902879914185535 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0416_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0416
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0417 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 417 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0417 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (12, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (13, 1), (15, 4), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0417_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0417
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0418 : Poly :=
[
  term ((111265474525641 : Rat) / 92133986807296) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 418 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0418 : Poly :=
[
  term ((111265474525641 : Rat) / 46066993403648) [(3, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 92133986807296) [(3, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 46066993403648) [(3, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 92133986807296) [(3, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0418_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0418
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0419 : Poly :=
[
  term ((-1900890661863230775 : Rat) / 47725405166179328) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 419 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0419 : Poly :=
[
  term ((-1900890661863230775 : Rat) / 23862702583089664) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1900890661863230775 : Rat) / 47725405166179328) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1900890661863230775 : Rat) / 23862702583089664) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((1900890661863230775 : Rat) / 47725405166179328) [(3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0419_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0419
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0420 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 420 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0420 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (12, 2), (13, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (13, 2), (15, 5), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0420_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0420
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0421 : Poly :=
[
  term ((9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 421 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0421 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0421_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0421
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0422 : Poly :=
[
  term ((26727219515815272005 : Rat) / 859057292991227904) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0422 : Poly :=
[
  term ((26727219515815272005 : Rat) / 429528646495613952) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26727219515815272005 : Rat) / 859057292991227904) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((26727219515815272005 : Rat) / 429528646495613952) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26727219515815272005 : Rat) / 859057292991227904) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0422_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0422
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0423 : Poly :=
[
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 423 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0423 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (13, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0423_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0423
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0424 : Poly :=
[
  term ((-1416780663586939843 : Rat) / 45213541736380416) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0424 : Poly :=
[
  term ((-1416780663586939843 : Rat) / 22606770868190208) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1416780663586939843 : Rat) / 45213541736380416) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1416780663586939843 : Rat) / 22606770868190208) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1416780663586939843 : Rat) / 45213541736380416) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0424_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0424
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0425 : Poly :=
[
  term ((-699636241352728891 : Rat) / 23862702583089664) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 425 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0425 : Poly :=
[
  term ((-699636241352728891 : Rat) / 11931351291544832) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((699636241352728891 : Rat) / 23862702583089664) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-699636241352728891 : Rat) / 11931351291544832) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((699636241352728891 : Rat) / 23862702583089664) [(3, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0425_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0425
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0426 : Poly :=
[
  term ((-3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 426 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0426 : Poly :=
[
  term ((-3641703605988597 : Rat) / 37605062552815408) [(3, 2), (5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0426_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0426
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0427 : Poly :=
[
  term ((-62366602054958716023 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 427 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0427 : Poly :=
[
  term ((-62366602054958716023 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((62366602054958716023 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-62366602054958716023 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((62366602054958716023 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0427_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0427
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0428 : Poly :=
[
  term ((-98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0428 : Poly :=
[
  term ((-98325997361692119 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0428_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0428
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0429 : Poly :=
[
  term ((32775332453897373 : Rat) / 21488607173037376) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 429 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0429 : Poly :=
[
  term ((32775332453897373 : Rat) / 10744303586518688) [(3, 2), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 21488607173037376) [(3, 2), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 10744303586518688) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 21488607173037376) [(3, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0429_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0429
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0430 : Poly :=
[
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 430 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0430 : Poly :=
[
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0430_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0430
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0431 : Poly :=
[
  term ((149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0431 : Poly :=
[
  term ((149309847845532477 : Rat) / 150420250211261632) [(3, 2), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((149309847845532477 : Rat) / 150420250211261632) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0431_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0431
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0432 : Poly :=
[
  term ((-466406832001434655887 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0432 : Poly :=
[
  term ((-466406832001434655887 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((466406832001434655887 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-466406832001434655887 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((466406832001434655887 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0432_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0432
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0433 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 433 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0433 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (12, 2), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0433_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0433
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0434 : Poly :=
[
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 434 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0434 : Poly :=
[
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0434_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0434
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0435 : Poly :=
[
  term ((9246174302148902379 : Rat) / 886687790719015936) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 435 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0435 : Poly :=
[
  term ((9246174302148902379 : Rat) / 443343895359507968) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9246174302148902379 : Rat) / 886687790719015936) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((9246174302148902379 : Rat) / 443343895359507968) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9246174302148902379 : Rat) / 886687790719015936) [(3, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0435_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0435
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0436 : Poly :=
[
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0436 : Poly :=
[
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0436_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0436
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0437 : Poly :=
[
  term ((119074863481574811 : Rat) / 23862702583089664) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 437 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0437 : Poly :=
[
  term ((119074863481574811 : Rat) / 11931351291544832) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119074863481574811 : Rat) / 23862702583089664) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((119074863481574811 : Rat) / 11931351291544832) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-119074863481574811 : Rat) / 23862702583089664) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0437_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0437
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0438 : Poly :=
[
  term ((3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0438 : Poly :=
[
  term ((3271810463708535531 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0438_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0438
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0439 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 21488607173037376) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0439 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 10744303586518688) [(3, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 21488607173037376) [(3, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 10744303586518688) [(3, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 21488607173037376) [(3, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0439_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0439
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0440 : Poly :=
[
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 440 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0440 : Poly :=
[
  term ((-3004167812192307 : Rat) / 426119688983744) [(3, 2), (10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3004167812192307 : Rat) / 426119688983744) [(3, 2), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0440_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0440
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0441 : Poly :=
[
  term ((1001389270730769 : Rat) / 243496965133568) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 441 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0441 : Poly :=
[
  term ((1001389270730769 : Rat) / 121748482566784) [(3, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 243496965133568) [(3, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 121748482566784) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 243496965133568) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0441_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0441
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0442 : Poly :=
[
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 442 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0442 : Poly :=
[
  term ((-4968304778224072473 : Rat) / 150420250211261632) [(3, 2), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4968304778224072473 : Rat) / 150420250211261632) [(3, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0442_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0442
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0443 : Poly :=
[
  term ((3115886674024448674909 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0443 : Poly :=
[
  term ((3115886674024448674909 : Rat) / 8423534011830651392) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3115886674024448674909 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3115886674024448674909 : Rat) / 8423534011830651392) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3115886674024448674909 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0443_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0443
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0444 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 444 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0444 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0444_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0444
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0445 : Poly :=
[
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (16, 1)]
]

/-- Partial product 445 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0445 : Poly :=
[
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (12, 2), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0445_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0445
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0446 : Poly :=
[
  term ((4561884455551281 : Rat) / 3408957511869952) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 446 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0446 : Poly :=
[
  term ((4561884455551281 : Rat) / 1704478755934976) [(3, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(3, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4561884455551281 : Rat) / 1704478755934976) [(3, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(3, 2), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0446_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0446
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0447 : Poly :=
[
  term ((1763811597247641063 : Rat) / 47725405166179328) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 447 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0447 : Poly :=
[
  term ((1763811597247641063 : Rat) / 23862702583089664) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1763811597247641063 : Rat) / 47725405166179328) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((1763811597247641063 : Rat) / 23862702583089664) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1763811597247641063 : Rat) / 47725405166179328) [(3, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0447_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0447
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0448 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 2), (15, 4), (16, 1)]
]

/-- Partial product 448 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0448 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 2), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (12, 2), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 2), (13, 1), (15, 5), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0448_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0448
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0449 : Poly :=
[
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 2), (16, 1)]
]

/-- Partial product 449 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0449 : Poly :=
[
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (12, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0449_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0449
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0450 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 450 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0450 : Poly :=
[
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0450_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0450
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0451 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 451 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0451 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0451_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0451
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0452 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 452 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0452 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0452_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0452
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0453 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 453 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0453 : Poly :=
[
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0453_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0453
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0454 : Poly :=
[
  term ((-4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 454 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0454 : Poly :=
[
  term ((-4140617000009034789 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4140617000009034789 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0454_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0454
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0455 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 455 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0455 : Poly :=
[
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0455_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0455
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0456 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 456 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0456 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0456_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0456
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0457 : Poly :=
[
  term ((349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 457 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0457 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0457_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0457
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0458 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 458 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0458 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0458_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0458
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0459 : Poly :=
[
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 459 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0459 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0459_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0459
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0460 : Poly :=
[
  term ((19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 460 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0460 : Poly :=
[
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0460_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0460
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0461 : Poly :=
[
  term ((-14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 461 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0461 : Poly :=
[
  term ((-14849754300339743 : Rat) / 852239377967488) [(4, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 852239377967488) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0461_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0461
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0462 : Poly :=
[
  term ((-5087188770349899 : Rat) / 3408957511869952) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 462 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0462 : Poly :=
[
  term ((-5087188770349899 : Rat) / 1704478755934976) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((5087188770349899 : Rat) / 3408957511869952) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-5087188770349899 : Rat) / 1704478755934976) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5087188770349899 : Rat) / 3408957511869952) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0462_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0462
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0463 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (16, 1)]
]

/-- Partial product 463 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0463 : Poly :=
[
  term ((3249908850494927 : Rat) / 426119688983744) [(4, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (12, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 426119688983744) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0463_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0463
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0464 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 464 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0464 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0464_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0464
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0465 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 465 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0465 : Poly :=
[
  term ((19399593724902554291 : Rat) / 601681000845046528) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (12, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 601681000845046528) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0465_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0465
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0466 : Poly :=
[
  term ((1107235993498623 : Rat) / 426119688983744) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 466 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0466 : Poly :=
[
  term ((1107235993498623 : Rat) / 213059844491872) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1107235993498623 : Rat) / 426119688983744) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((1107235993498623 : Rat) / 213059844491872) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1107235993498623 : Rat) / 426119688983744) [(4, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0466_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0466
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0467 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 2), (16, 1)]
]

/-- Partial product 467 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0467 : Poly :=
[
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (12, 1), (14, 3), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (12, 2), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0467_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0467
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0468 : Poly :=
[
  term ((-687416978686223 : Rat) / 852239377967488) [(4, 1), (16, 1)]
]

/-- Partial product 468 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0468 : Poly :=
[
  term ((-687416978686223 : Rat) / 426119688983744) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((687416978686223 : Rat) / 852239377967488) [(4, 1), (12, 2), (16, 1)],
  term ((-687416978686223 : Rat) / 426119688983744) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((687416978686223 : Rat) / 852239377967488) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0468_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0468
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0469 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 469 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0469 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0469_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0469
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0470 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 470 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0470 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0470_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0470
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0471 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0471 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0471_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0471
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0472 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 472 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0472 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0472_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0472
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0473 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0473 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0473_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0473
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0474 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 474 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0474 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0474_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0474
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0475 : Poly :=
[
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 475 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0475 : Poly :=
[
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0475_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0475
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0476 : Poly :=
[
  term ((-115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 476 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0476 : Poly :=
[
  term ((-115606068534436071705 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-115606068534436071705 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0476_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0476
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0477 : Poly :=
[
  term ((3917332115659042304505 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 477 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0477 : Poly :=
[
  term ((3917332115659042304505 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3917332115659042304505 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((3917332115659042304505 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3917332115659042304505 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0477_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0477
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0478 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 478 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0478 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0478_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0478
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0479 : Poly :=
[
  term ((-954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0479 : Poly :=
[
  term ((-954422357427762169755 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-954422357427762169755 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0479_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0479
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0480 : Poly :=
[
  term ((-24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 480 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0480 : Poly :=
[
  term ((-24082546774204629297 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-24082546774204629297 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0480_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0480
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0481 : Poly :=
[
  term ((41274911405589439555 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 481 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0481 : Poly :=
[
  term ((41274911405589439555 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-41274911405589439555 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((41274911405589439555 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41274911405589439555 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0481_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0481
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0482 : Poly :=
[
  term ((-61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 482 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0482 : Poly :=
[
  term ((-61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0482_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0482
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0483 : Poly :=
[
  term ((62878278574636826841 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 483 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0483 : Poly :=
[
  term ((62878278574636826841 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-62878278574636826841 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((62878278574636826841 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-62878278574636826841 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0483_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0483
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0484 : Poly :=
[
  term ((-244285757317600134939 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0484 : Poly :=
[
  term ((-244285757317600134939 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((244285757317600134939 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-244285757317600134939 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((244285757317600134939 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0484_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0484
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0485 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 485 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0485 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0485_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0485
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0486 : Poly :=
[
  term ((-11472922015301244555 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 486 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0486 : Poly :=
[
  term ((-11472922015301244555 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((11472922015301244555 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-11472922015301244555 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11472922015301244555 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0486_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0486
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0487 : Poly :=
[
  term ((-27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 487 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0487 : Poly :=
[
  term ((-27980600721736322115 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-27980600721736322115 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0487_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0487
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0488 : Poly :=
[
  term ((6315844299704019261 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 488 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0488 : Poly :=
[
  term ((6315844299704019261 : Rat) / 1052941751478831424) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6315844299704019261 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((6315844299704019261 : Rat) / 1052941751478831424) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6315844299704019261 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0488_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0488
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0489 : Poly :=
[
  term ((-1311705348845972786679 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 489 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0489 : Poly :=
[
  term ((-1311705348845972786679 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1311705348845972786679 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1311705348845972786679 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1311705348845972786679 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0489_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0489
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0490 : Poly :=
[
  term ((-13060248988231269529 : Rat) / 1579412627218247136) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 490 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0490 : Poly :=
[
  term ((-13060248988231269529 : Rat) / 789706313609123568) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((13060248988231269529 : Rat) / 1579412627218247136) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-13060248988231269529 : Rat) / 789706313609123568) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((13060248988231269529 : Rat) / 1579412627218247136) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0490_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0490
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0491 : Poly :=
[
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0491 : Poly :=
[
  term ((9846260672265067047 : Rat) / 1773375581438031872) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9846260672265067047 : Rat) / 1773375581438031872) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0491_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0491
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0492 : Poly :=
[
  term ((42633921779645049009 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 492 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0492 : Poly :=
[
  term ((42633921779645049009 : Rat) / 9626896013520744448) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42633921779645049009 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((42633921779645049009 : Rat) / 9626896013520744448) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-42633921779645049009 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0492_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0492
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0493 : Poly :=
[
  term ((-935212362578381577441 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 493 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0493 : Poly :=
[
  term ((-935212362578381577441 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((935212362578381577441 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-935212362578381577441 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((935212362578381577441 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0493_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0493
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0494 : Poly :=
[
  term ((9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 494 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0494 : Poly :=
[
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0494_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0494
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0495 : Poly :=
[
  term ((-5697585872683295618243 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 495 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0495 : Poly :=
[
  term ((-5697585872683295618243 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((5697585872683295618243 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-5697585872683295618243 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5697585872683295618243 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0495_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0495
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0496 : Poly :=
[
  term ((31583034079743668805 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 496 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0496 : Poly :=
[
  term ((31583034079743668805 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-31583034079743668805 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((31583034079743668805 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31583034079743668805 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0496_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0496
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0497 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 497 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0497 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0497_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0497
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0498 : Poly :=
[
  term ((140850170368820966169 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 498 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0498 : Poly :=
[
  term ((140850170368820966169 : Rat) / 8423534011830651392) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-140850170368820966169 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((140850170368820966169 : Rat) / 8423534011830651392) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-140850170368820966169 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0498_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0498
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0499 : Poly :=
[
  term ((-32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0499 : Poly :=
[
  term ((-32898310098832139433 : Rat) / 1203362001690093056) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-32898310098832139433 : Rat) / 1203362001690093056) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0499_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0499
        rs_R010_ueqv_R010NYY_generator_30_0400_0499 =
      rs_R010_ueqv_R010NYY_partial_30_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_30_0400_0499 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_30_0400,
  rs_R010_ueqv_R010NYY_partial_30_0401,
  rs_R010_ueqv_R010NYY_partial_30_0402,
  rs_R010_ueqv_R010NYY_partial_30_0403,
  rs_R010_ueqv_R010NYY_partial_30_0404,
  rs_R010_ueqv_R010NYY_partial_30_0405,
  rs_R010_ueqv_R010NYY_partial_30_0406,
  rs_R010_ueqv_R010NYY_partial_30_0407,
  rs_R010_ueqv_R010NYY_partial_30_0408,
  rs_R010_ueqv_R010NYY_partial_30_0409,
  rs_R010_ueqv_R010NYY_partial_30_0410,
  rs_R010_ueqv_R010NYY_partial_30_0411,
  rs_R010_ueqv_R010NYY_partial_30_0412,
  rs_R010_ueqv_R010NYY_partial_30_0413,
  rs_R010_ueqv_R010NYY_partial_30_0414,
  rs_R010_ueqv_R010NYY_partial_30_0415,
  rs_R010_ueqv_R010NYY_partial_30_0416,
  rs_R010_ueqv_R010NYY_partial_30_0417,
  rs_R010_ueqv_R010NYY_partial_30_0418,
  rs_R010_ueqv_R010NYY_partial_30_0419,
  rs_R010_ueqv_R010NYY_partial_30_0420,
  rs_R010_ueqv_R010NYY_partial_30_0421,
  rs_R010_ueqv_R010NYY_partial_30_0422,
  rs_R010_ueqv_R010NYY_partial_30_0423,
  rs_R010_ueqv_R010NYY_partial_30_0424,
  rs_R010_ueqv_R010NYY_partial_30_0425,
  rs_R010_ueqv_R010NYY_partial_30_0426,
  rs_R010_ueqv_R010NYY_partial_30_0427,
  rs_R010_ueqv_R010NYY_partial_30_0428,
  rs_R010_ueqv_R010NYY_partial_30_0429,
  rs_R010_ueqv_R010NYY_partial_30_0430,
  rs_R010_ueqv_R010NYY_partial_30_0431,
  rs_R010_ueqv_R010NYY_partial_30_0432,
  rs_R010_ueqv_R010NYY_partial_30_0433,
  rs_R010_ueqv_R010NYY_partial_30_0434,
  rs_R010_ueqv_R010NYY_partial_30_0435,
  rs_R010_ueqv_R010NYY_partial_30_0436,
  rs_R010_ueqv_R010NYY_partial_30_0437,
  rs_R010_ueqv_R010NYY_partial_30_0438,
  rs_R010_ueqv_R010NYY_partial_30_0439,
  rs_R010_ueqv_R010NYY_partial_30_0440,
  rs_R010_ueqv_R010NYY_partial_30_0441,
  rs_R010_ueqv_R010NYY_partial_30_0442,
  rs_R010_ueqv_R010NYY_partial_30_0443,
  rs_R010_ueqv_R010NYY_partial_30_0444,
  rs_R010_ueqv_R010NYY_partial_30_0445,
  rs_R010_ueqv_R010NYY_partial_30_0446,
  rs_R010_ueqv_R010NYY_partial_30_0447,
  rs_R010_ueqv_R010NYY_partial_30_0448,
  rs_R010_ueqv_R010NYY_partial_30_0449,
  rs_R010_ueqv_R010NYY_partial_30_0450,
  rs_R010_ueqv_R010NYY_partial_30_0451,
  rs_R010_ueqv_R010NYY_partial_30_0452,
  rs_R010_ueqv_R010NYY_partial_30_0453,
  rs_R010_ueqv_R010NYY_partial_30_0454,
  rs_R010_ueqv_R010NYY_partial_30_0455,
  rs_R010_ueqv_R010NYY_partial_30_0456,
  rs_R010_ueqv_R010NYY_partial_30_0457,
  rs_R010_ueqv_R010NYY_partial_30_0458,
  rs_R010_ueqv_R010NYY_partial_30_0459,
  rs_R010_ueqv_R010NYY_partial_30_0460,
  rs_R010_ueqv_R010NYY_partial_30_0461,
  rs_R010_ueqv_R010NYY_partial_30_0462,
  rs_R010_ueqv_R010NYY_partial_30_0463,
  rs_R010_ueqv_R010NYY_partial_30_0464,
  rs_R010_ueqv_R010NYY_partial_30_0465,
  rs_R010_ueqv_R010NYY_partial_30_0466,
  rs_R010_ueqv_R010NYY_partial_30_0467,
  rs_R010_ueqv_R010NYY_partial_30_0468,
  rs_R010_ueqv_R010NYY_partial_30_0469,
  rs_R010_ueqv_R010NYY_partial_30_0470,
  rs_R010_ueqv_R010NYY_partial_30_0471,
  rs_R010_ueqv_R010NYY_partial_30_0472,
  rs_R010_ueqv_R010NYY_partial_30_0473,
  rs_R010_ueqv_R010NYY_partial_30_0474,
  rs_R010_ueqv_R010NYY_partial_30_0475,
  rs_R010_ueqv_R010NYY_partial_30_0476,
  rs_R010_ueqv_R010NYY_partial_30_0477,
  rs_R010_ueqv_R010NYY_partial_30_0478,
  rs_R010_ueqv_R010NYY_partial_30_0479,
  rs_R010_ueqv_R010NYY_partial_30_0480,
  rs_R010_ueqv_R010NYY_partial_30_0481,
  rs_R010_ueqv_R010NYY_partial_30_0482,
  rs_R010_ueqv_R010NYY_partial_30_0483,
  rs_R010_ueqv_R010NYY_partial_30_0484,
  rs_R010_ueqv_R010NYY_partial_30_0485,
  rs_R010_ueqv_R010NYY_partial_30_0486,
  rs_R010_ueqv_R010NYY_partial_30_0487,
  rs_R010_ueqv_R010NYY_partial_30_0488,
  rs_R010_ueqv_R010NYY_partial_30_0489,
  rs_R010_ueqv_R010NYY_partial_30_0490,
  rs_R010_ueqv_R010NYY_partial_30_0491,
  rs_R010_ueqv_R010NYY_partial_30_0492,
  rs_R010_ueqv_R010NYY_partial_30_0493,
  rs_R010_ueqv_R010NYY_partial_30_0494,
  rs_R010_ueqv_R010NYY_partial_30_0495,
  rs_R010_ueqv_R010NYY_partial_30_0496,
  rs_R010_ueqv_R010NYY_partial_30_0497,
  rs_R010_ueqv_R010NYY_partial_30_0498,
  rs_R010_ueqv_R010NYY_partial_30_0499
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_30_0400_0499 : Poly :=
[
  term ((-3004167812192307 : Rat) / 852239377967488) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((141104706952223 : Rat) / 12815629743872) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((56706756499841811 : Rat) / 745709455721552) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 1704478755934976) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((-141104706952223 : Rat) / 25631259487744) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 1), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((56706756499841811 : Rat) / 745709455721552) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((141104706952223 : Rat) / 12815629743872) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-56706756499841811 : Rat) / 1491418911443104) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-141104706952223 : Rat) / 25631259487744) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 243496965133568) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 1704478755934976) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-129262291401399354391 : Rat) / 443343895359507968) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 4065412167871936) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-22602990980736309003661 : Rat) / 151623612212951725056) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-867824197745273585175 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-107122057213534710813 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((6266387262529002907783 : Rat) / 25270602035491954176) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((129262291401399354391 : Rat) / 886687790719015936) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((107122057213534710813 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-6266387262529002907783 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((22602990980736309003661 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (12, 2), (15, 4), (16, 1)],
  term ((867824197745273585175 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((6266387262529002907783 : Rat) / 25270602035491954176) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107122057213534710813 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-867824197745273585175 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22602990980736309003661 : Rat) / 151623612212951725056) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-18418522060615022895 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-6266387262529002907783 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-65812416337820849399783 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2790445830218266653 : Rat) / 37605062552815408) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((867824197745273585175 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 8130824335743872) [(3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((129262291401399354391 : Rat) / 886687790719015936) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((8940613902879914185535 : Rat) / 25270602035491954176) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8940613902879914185535 : Rat) / 50541204070983908352) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (12, 2), (15, 3), (16, 1)],
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8940613902879914185535 : Rat) / 25270602035491954176) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (13, 1), (15, 4), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-551510121091709231993 : Rat) / 2660063372157047808) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 3), (16, 1)],
  term ((-1900890661863230775 : Rat) / 23862702583089664) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((111265474525641 : Rat) / 46066993403648) [(3, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1416780663586939843 : Rat) / 22606770868190208) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-699636241352728891 : Rat) / 11931351291544832) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((26727219515815272005 : Rat) / 429528646495613952) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 92133986807296) [(3, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1900890661863230775 : Rat) / 47725405166179328) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (12, 2), (13, 1), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-26727219515815272005 : Rat) / 859057292991227904) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((1416780663586939843 : Rat) / 45213541736380416) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((699636241352728891 : Rat) / 23862702583089664) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((26727219515815272005 : Rat) / 429528646495613952) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1416780663586939843 : Rat) / 22606770868190208) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-699636241352728891 : Rat) / 11931351291544832) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-26727219515815272005 : Rat) / 859057292991227904) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1446451168833333 : Rat) / 1704478755934976) [(3, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((27437280008252271865 : Rat) / 859057292991227904) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-300313605127625471 : Rat) / 5965675645772416) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (13, 2), (15, 5), (16, 1)],
  term ((-111265474525641 : Rat) / 92133986807296) [(3, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((1900890661863230775 : Rat) / 47725405166179328) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 3), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 3), (16, 1)],
  term ((-62366602054958716023 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(3, 2), (5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((62366602054958716023 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62366602054958716023 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((62366602054958716023 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 10744303586518688) [(3, 2), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 21488607173037376) [(3, 2), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 10744303586518688) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 21488607173037376) [(3, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-466406832001434655887 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((149309847845532477 : Rat) / 150420250211261632) [(3, 2), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((466406832001434655887 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (12, 2), (15, 3), (16, 1)],
  term ((149309847845532477 : Rat) / 150420250211261632) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-466406832001434655887 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(3, 2), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((466406832001434655887 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((9246174302148902379 : Rat) / 443343895359507968) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-9246174302148902379 : Rat) / 886687790719015936) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9246174302148902379 : Rat) / 443343895359507968) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9246174302148902379 : Rat) / 886687790719015936) [(3, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((119074863481574811 : Rat) / 11931351291544832) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-119074863481574811 : Rat) / 23862702583089664) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((119074863481574811 : Rat) / 11931351291544832) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 2), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-119074863481574811 : Rat) / 23862702583089664) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 10744303586518688) [(3, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 21488607173037376) [(3, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 10744303586518688) [(3, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 21488607173037376) [(3, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 121748482566784) [(3, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3004167812192307 : Rat) / 426119688983744) [(3, 2), (10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 243496965133568) [(3, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3004167812192307 : Rat) / 426119688983744) [(3, 2), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1001389270730769 : Rat) / 121748482566784) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(3, 2), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 243496965133568) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3115886674024448674909 : Rat) / 8423534011830651392) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4968304778224072473 : Rat) / 150420250211261632) [(3, 2), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3115886674024448674909 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-4968304778224072473 : Rat) / 150420250211261632) [(3, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3115886674024448674909 : Rat) / 8423534011830651392) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(3, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3115886674024448674909 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (12, 2), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (13, 2), (16, 1)],
  term ((1763811597247641063 : Rat) / 23862702583089664) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 2), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((4561884455551281 : Rat) / 1704478755934976) [(3, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(3, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1763811597247641063 : Rat) / 47725405166179328) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (12, 2), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (12, 2), (16, 1)],
  term ((4561884455551281 : Rat) / 1704478755934976) [(3, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1763811597247641063 : Rat) / 23862702583089664) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 2), (13, 1), (15, 5), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(3, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1763811597247641063 : Rat) / 47725405166179328) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (13, 2), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (13, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-4140617000009034789 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4140617000009034789 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5087188770349899 : Rat) / 1704478755934976) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 852239377967488) [(4, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((5087188770349899 : Rat) / 3408957511869952) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-14849754300339743 : Rat) / 852239377967488) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5087188770349899 : Rat) / 1704478755934976) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5087188770349899 : Rat) / 3408957511869952) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 426119688983744) [(4, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (12, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 426119688983744) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (13, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 601681000845046528) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (12, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 601681000845046528) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (13, 2), (16, 1)],
  term ((-687416978686223 : Rat) / 426119688983744) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((1107235993498623 : Rat) / 213059844491872) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (12, 1), (14, 3), (16, 1)],
  term ((-1107235993498623 : Rat) / 426119688983744) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (12, 2), (14, 2), (16, 1)],
  term ((687416978686223 : Rat) / 852239377967488) [(4, 1), (12, 2), (16, 1)],
  term ((1107235993498623 : Rat) / 213059844491872) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-687416978686223 : Rat) / 426119688983744) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1107235993498623 : Rat) / 426119688983744) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((687416978686223 : Rat) / 852239377967488) [(4, 1), (13, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((3917332115659042304505 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-115606068534436071705 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3917332115659042304505 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-115606068534436071705 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3917332115659042304505 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((115606068534436071705 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3917332115659042304505 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-954422357427762169755 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-954422357427762169755 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((41274911405589439555 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24082546774204629297 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-41274911405589439555 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-24082546774204629297 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((41274911405589439555 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-41274911405589439555 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((62878278574636826841 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-244285757317600134939 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-62878278574636826841 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((244285757317600134939 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-244285757317600134939 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((551449793209837096719 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((-62878278574636826841 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (13, 3), (16, 1)],
  term ((-11472922015301244555 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((11472922015301244555 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11472922015301244555 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((11472922015301244555 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((6315844299704019261 : Rat) / 1052941751478831424) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27980600721736322115 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1311705348845972786679 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-6315844299704019261 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1311705348845972786679 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1311705348845972786679 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27980600721736322115 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((245131340575290002769 : Rat) / 9626896013520744448) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-6315844299704019261 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-13060248988231269529 : Rat) / 789706313609123568) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((13060248988231269529 : Rat) / 1579412627218247136) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-13060248988231269529 : Rat) / 789706313609123568) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((13060248988231269529 : Rat) / 1579412627218247136) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((42633921779645049009 : Rat) / 9626896013520744448) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9846260672265067047 : Rat) / 1773375581438031872) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5697585872683295618243 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-935212362578381577441 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42633921779645049009 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((935212362578381577441 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((5697585872683295618243 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-935212362578381577441 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5697585872683295618243 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((9846260672265067047 : Rat) / 1773375581438031872) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((935212362578381577441 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((409795952141994412233 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((5697585872683295618243 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-42633921779645049009 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((31583034079743668805 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-31583034079743668805 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((31583034079743668805 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31583034079743668805 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((140850170368820966169 : Rat) / 8423534011830651392) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-32898310098832139433 : Rat) / 1203362001690093056) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-140850170368820966169 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-32898310098832139433 : Rat) / 1203362001690093056) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((511988511429466908369 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (13, 3), (14, 1), (16, 1)],
  term ((-140850170368820966169 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 400 through 499. -/
theorem rs_R010_ueqv_R010NYY_block_30_0400_0499_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_30_0400_0499
      rs_R010_ueqv_R010NYY_block_30_0400_0499 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
