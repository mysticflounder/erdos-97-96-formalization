/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 16:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0300 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 300 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0300 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0300
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0301 : Poly :=
[
  term ((205665656 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 301 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0301 : Poly :=
[
  term ((411331312 : Rat) / 12247399) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-205665656 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0301
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0302 : Poly :=
[
  term ((-11425649722 : Rat) / 330679773) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 302 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0302 : Poly :=
[
  term ((-22851299444 : Rat) / 330679773) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((11425649722 : Rat) / 330679773) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0302
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0303 : Poly :=
[
  term ((-936290959597 : Rat) / 69810174300) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 303 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0303 : Poly :=
[
  term ((-936290959597 : Rat) / 34905087150) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((936290959597 : Rat) / 69810174300) [(4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0303
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0304 : Poly :=
[
  term ((83371498 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 304 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0304 : Poly :=
[
  term ((166742996 : Rat) / 12247399) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-83371498 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0304
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0305 : Poly :=
[
  term ((-40664000 : Rat) / 110226591) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 305 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0305 : Poly :=
[
  term ((-81328000 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((40664000 : Rat) / 110226591) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0305_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0305
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0306 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 306 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0306 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0306_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0306
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0307 : Poly :=
[
  term ((-4634047772 : Rat) / 330679773) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 307 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0307 : Poly :=
[
  term ((-9268095544 : Rat) / 330679773) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((4634047772 : Rat) / 330679773) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0307_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0307
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0308 : Poly :=
[
  term ((28193212110967 : Rat) / 942437353050) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 308 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0308 : Poly :=
[
  term ((28193212110967 : Rat) / 471218676525) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-28193212110967 : Rat) / 942437353050) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0308_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0308
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0309 : Poly :=
[
  term ((68130560 : Rat) / 110226591) [(4, 1), (7, 1), (15, 3)]
]

/-- Partial product 309 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0309 : Poly :=
[
  term ((136261120 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (15, 3)],
  term ((-68130560 : Rat) / 110226591) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0309_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0309
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0310 : Poly :=
[
  term ((-36044848896 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 310 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0310 : Poly :=
[
  term ((-72089697792 : Rat) / 1163502905) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((36044848896 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0310_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0310
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0311 : Poly :=
[
  term ((-15206420628 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 311 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0311 : Poly :=
[
  term ((-30412841256 : Rat) / 1163502905) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((15206420628 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0311_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0311
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0312 : Poly :=
[
  term ((32504729808 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 312 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0312 : Poly :=
[
  term ((65009459616 : Rat) / 1163502905) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-32504729808 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0312_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0312
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0313 : Poly :=
[
  term ((-243247686274 : Rat) / 6282915687) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 313 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0313 : Poly :=
[
  term ((-486495372548 : Rat) / 6282915687) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((243247686274 : Rat) / 6282915687) [(4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0313_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0313
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0314 : Poly :=
[
  term ((7395016832 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 314 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0314 : Poly :=
[
  term ((14790033664 : Rat) / 330679773) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-7395016832 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0314_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0314
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0315 : Poly :=
[
  term ((-72808960 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 315 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0315 : Poly :=
[
  term ((-145617920 : Rat) / 110226591) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((72808960 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0315_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0315
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0316 : Poly :=
[
  term ((18586171520 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 316 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0316 : Poly :=
[
  term ((37172343040 : Rat) / 330679773) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-18586171520 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0316_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0316
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0317 : Poly :=
[
  term ((103342925728 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 317 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0317 : Poly :=
[
  term ((206685851456 : Rat) / 24800982975) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-103342925728 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0317_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0317
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0318 : Poly :=
[
  term ((-34641920 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 318 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0318 : Poly :=
[
  term ((-69283840 : Rat) / 36742197) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((34641920 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0318_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0318
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0319 : Poly :=
[
  term ((-2320 : Rat) / 201) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0319 : Poly :=
[
  term ((-4640 : Rat) / 201) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2320 : Rat) / 201) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0319_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0319
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0320 : Poly :=
[
  term ((-202546857628 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 320 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0320 : Poly :=
[
  term ((-405093715256 : Rat) / 24800982975) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0320_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0320
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0321 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 321 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0321 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0321_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0321
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0322 : Poly :=
[
  term ((115547138 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 322 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0322 : Poly :=
[
  term ((231094276 : Rat) / 12247399) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-115547138 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0322_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0322
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0323 : Poly :=
[
  term ((-7290595930 : Rat) / 330679773) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 323 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0323 : Poly :=
[
  term ((-14581191860 : Rat) / 330679773) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((7290595930 : Rat) / 330679773) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0323_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0323
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0324 : Poly :=
[
  term ((63 : Rat) / 67) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0324 : Poly :=
[
  term ((126 : Rat) / 67) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 67) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0324_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0324
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0325 : Poly :=
[
  term ((-16238411149 : Rat) / 930802324) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 325 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0325 : Poly :=
[
  term ((-16238411149 : Rat) / 465401162) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((16238411149 : Rat) / 930802324) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0325_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0325
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0326 : Poly :=
[
  term ((290408930 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 326 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0326 : Poly :=
[
  term ((580817860 : Rat) / 12247399) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-290408930 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0326_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0326
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0327 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 327 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0327 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0327_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0327
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0328 : Poly :=
[
  term ((66319040 : Rat) / 110226591) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 328 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0328 : Poly :=
[
  term ((132638080 : Rat) / 110226591) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-66319040 : Rat) / 110226591) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0328_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0328
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0329 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 329 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0329 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0329_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0329
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0330 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(4, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 330 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0330 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(4, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0330_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0330
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0331 : Poly :=
[
  term ((-16760743960 : Rat) / 330679773) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 331 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0331 : Poly :=
[
  term ((-33521487920 : Rat) / 330679773) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((16760743960 : Rat) / 330679773) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0331_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0331
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0332 : Poly :=
[
  term ((-20641044794 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0332 : Poly :=
[
  term ((-41282089588 : Rat) / 24800982975) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20641044794 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0332_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0332
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0333 : Poly :=
[
  term ((463704461119 : Rat) / 12565831374) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 333 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0333 : Poly :=
[
  term ((463704461119 : Rat) / 6282915687) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-463704461119 : Rat) / 12565831374) [(4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0333_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0333
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0334 : Poly :=
[
  term ((-30318188881 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0334 : Poly :=
[
  term ((-60636377762 : Rat) / 24800982975) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0334_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0334
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0335 : Poly :=
[
  term ((15384320 : Rat) / 36742197) [(4, 1), (9, 1), (15, 3)]
]

/-- Partial product 335 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0335 : Poly :=
[
  term ((30768640 : Rat) / 36742197) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((-15384320 : Rat) / 36742197) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0335_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0335
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0336 : Poly :=
[
  term ((-551 : Rat) / 67) [(4, 1), (9, 2)]
]

/-- Partial product 336 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0336 : Poly :=
[
  term ((-1102 : Rat) / 67) [(4, 1), (6, 1), (9, 2)],
  term ((551 : Rat) / 67) [(4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0336_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0336
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0337 : Poly :=
[
  term ((22051204672 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0337 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0337_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0337
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0338 : Poly :=
[
  term ((344550073 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0338 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(4, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0338_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0338
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0339 : Poly :=
[
  term ((-38452883834 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 339 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0339 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0339_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0339
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0340 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 340 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0340 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0340_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0340
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0341 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 341 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0341 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0341_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0341
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0342 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 342 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0342 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0342_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0342
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0343 : Poly :=
[
  term ((90576640 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 343 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0343 : Poly :=
[
  term ((181153280 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-90576640 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0343_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0343
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0344 : Poly :=
[
  term ((1530558860 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 344 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0344 : Poly :=
[
  term ((3061117720 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1530558860 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0344_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0344
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0345 : Poly :=
[
  term ((-738133760 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 345 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0345 : Poly :=
[
  term ((-1476267520 : Rat) / 330679773) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((738133760 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0345_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0345
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0346 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 346 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0346 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((17582080 : Rat) / 36742197) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0346_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0346
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0347 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 347 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0347 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0347_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0347
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0348 : Poly :=
[
  term ((-3131968000 : Rat) / 110226591) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 348 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0348 : Poly :=
[
  term ((-6263936000 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((3131968000 : Rat) / 110226591) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0348_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0348
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0349 : Poly :=
[
  term ((-611589874094 : Rat) / 18848747061) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 349 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0349 : Poly :=
[
  term ((-1223179748188 : Rat) / 18848747061) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((611589874094 : Rat) / 18848747061) [(4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0349_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0349
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0350 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(4, 1), (11, 1), (15, 3)]
]

/-- Partial product 350 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0350 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(4, 1), (6, 1), (11, 1), (15, 3)],
  term ((9748480 : Rat) / 36742197) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0350_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0350
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0351 : Poly :=
[
  term ((6365488640 : Rat) / 330679773) [(4, 1), (11, 2)]
]

/-- Partial product 351 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0351 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(4, 1), (6, 1), (11, 2)],
  term ((-6365488640 : Rat) / 330679773) [(4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0351_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0351
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0352 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 352 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0352 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0352_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0352
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0353 : Poly :=
[
  term ((4245780 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 353 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0353 : Poly :=
[
  term ((8491560 : Rat) / 12247399) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4245780 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0353_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0353
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0354 : Poly :=
[
  term ((-81680720 : Rat) / 110226591) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 354 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0354 : Poly :=
[
  term ((-163361440 : Rat) / 110226591) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((81680720 : Rat) / 110226591) [(4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0354_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0354
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0355 : Poly :=
[
  term ((-3653615888 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 355 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0355 : Poly :=
[
  term ((-7307231776 : Rat) / 330679773) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((3653615888 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0355_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0355
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0356 : Poly :=
[
  term ((-37069979471 : Rat) / 4188610458) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 356 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0356 : Poly :=
[
  term ((-37069979471 : Rat) / 2094305229) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((37069979471 : Rat) / 4188610458) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0356_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0356
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0357 : Poly :=
[
  term ((-1370880 : Rat) / 12247399) [(4, 1), (13, 1), (15, 3)]
]

/-- Partial product 357 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0357 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((1370880 : Rat) / 12247399) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0357_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0357
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0358 : Poly :=
[
  term ((27008709 : Rat) / 12247399) [(4, 1), (13, 2)]
]

/-- Partial product 358 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0358 : Poly :=
[
  term ((54017418 : Rat) / 12247399) [(4, 1), (6, 1), (13, 2)],
  term ((-27008709 : Rat) / 12247399) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0358_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0358
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0359 : Poly :=
[
  term ((-11533340 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)]
]

/-- Partial product 359 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0359 : Poly :=
[
  term ((-23066680 : Rat) / 12247399) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((11533340 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0359_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0359
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0360 : Poly :=
[
  term ((-49 : Rat) / 67) [(4, 1), (14, 1)]
]

/-- Partial product 360 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0360 : Poly :=
[
  term ((-98 : Rat) / 67) [(4, 1), (6, 1), (14, 1)],
  term ((49 : Rat) / 67) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0360_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0360
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0361 : Poly :=
[
  term ((2824364000 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 361 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0361 : Poly :=
[
  term ((5648728000 : Rat) / 110226591) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-2824364000 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0361_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0361
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0362 : Poly :=
[
  term ((2671111129 : Rat) / 281324583) [(4, 1), (15, 2)]
]

/-- Partial product 362 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0362 : Poly :=
[
  term ((5342222258 : Rat) / 281324583) [(4, 1), (6, 1), (15, 2)],
  term ((-2671111129 : Rat) / 281324583) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0362_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0362
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0363 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(4, 1), (15, 4)]
]

/-- Partial product 363 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0363 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(4, 1), (6, 1), (15, 4)],
  term ((-8791040 : Rat) / 36742197) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0363_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0363
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0364 : Poly :=
[
  term ((317542400 : Rat) / 110226591) [(4, 2), (9, 1), (11, 1)]
]

/-- Partial product 364 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0364 : Poly :=
[
  term ((635084800 : Rat) / 110226591) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((-317542400 : Rat) / 110226591) [(4, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0364_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0364
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0365 : Poly :=
[
  term ((14884800 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 365 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0365 : Poly :=
[
  term ((29769600 : Rat) / 12247399) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-14884800 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0365_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0365
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0366 : Poly :=
[
  term ((-286355200 : Rat) / 110226591) [(4, 2), (9, 1), (15, 1)]
]

/-- Partial product 366 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0366 : Poly :=
[
  term ((-572710400 : Rat) / 110226591) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0366_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0366
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0367 : Poly :=
[
  term ((-243 : Rat) / 134) [(5, 1), (6, 1), (9, 1)]
]

/-- Partial product 367 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0367 : Poly :=
[
  term ((243 : Rat) / 134) [(5, 1), (6, 1), (9, 1)],
  term ((-243 : Rat) / 67) [(5, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0367_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0367
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0368 : Poly :=
[
  term ((641398435328 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (11, 1)]
]

/-- Partial product 368 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0368 : Poly :=
[
  term ((-641398435328 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((1282796870656 : Rat) / 31414578435) [(5, 1), (6, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0368_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0368
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0369 : Poly :=
[
  term ((10021850552 : Rat) / 1163502905) [(5, 1), (6, 1), (10, 1), (13, 1)]
]

/-- Partial product 369 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0369 : Poly :=
[
  term ((-10021850552 : Rat) / 1163502905) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((20043701104 : Rat) / 1163502905) [(5, 1), (6, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0369_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0369
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0370 : Poly :=
[
  term ((-578403946144 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 370 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0370 : Poly :=
[
  term ((578403946144 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-1156807892288 : Rat) / 31414578435) [(5, 1), (6, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0370_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0370
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0371 : Poly :=
[
  term ((2372003202584 : Rat) / 94243735305) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 371 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0371 : Poly :=
[
  term ((-2372003202584 : Rat) / 94243735305) [(5, 1), (6, 1), (11, 1)],
  term ((4744006405168 : Rat) / 94243735305) [(5, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0371_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0371
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0372 : Poly :=
[
  term ((-13162601984 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 372 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0372 : Poly :=
[
  term ((13162601984 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-26325203968 : Rat) / 330679773) [(5, 1), (6, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0372_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0372
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0373 : Poly :=
[
  term ((6702080 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 373 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0373 : Poly :=
[
  term ((-6702080 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((13404160 : Rat) / 110226591) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0373_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0373
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0374 : Poly :=
[
  term ((-5335775872 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 374 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0374 : Poly :=
[
  term ((5335775872 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-10671551744 : Rat) / 330679773) [(5, 1), (6, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0374_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0374
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0375 : Poly :=
[
  term ((40386560 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 375 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0375 : Poly :=
[
  term ((-40386560 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((80773120 : Rat) / 110226591) [(5, 1), (6, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0375_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0375
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0376 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 376 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0376 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(5, 1), (6, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0376_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0376
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0377 : Poly :=
[
  term ((-205665656 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 377 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0377 : Poly :=
[
  term ((205665656 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-411331312 : Rat) / 12247399) [(5, 1), (6, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0377_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0377
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0378 : Poly :=
[
  term ((11425649722 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 378 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0378 : Poly :=
[
  term ((-11425649722 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((22851299444 : Rat) / 330679773) [(5, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0378_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0378
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0379 : Poly :=
[
  term ((146140265789 : Rat) / 13962034860) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 379 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0379 : Poly :=
[
  term ((-146140265789 : Rat) / 13962034860) [(5, 1), (6, 1), (13, 1)],
  term ((146140265789 : Rat) / 6981017430) [(5, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0379_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0379
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0380 : Poly :=
[
  term ((-83371498 : Rat) / 12247399) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 380 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0380 : Poly :=
[
  term ((83371498 : Rat) / 12247399) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-166742996 : Rat) / 12247399) [(5, 1), (6, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0380_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0380
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0381 : Poly :=
[
  term ((40664000 : Rat) / 110226591) [(5, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 381 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0381 : Poly :=
[
  term ((-40664000 : Rat) / 110226591) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((81328000 : Rat) / 110226591) [(5, 1), (6, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0381_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0381
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0382 : Poly :=
[
  term ((-456960 : Rat) / 12247399) [(5, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 382 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0382 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (6, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0382_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0382
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0383 : Poly :=
[
  term ((4634047772 : Rat) / 330679773) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 383 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0383 : Poly :=
[
  term ((-4634047772 : Rat) / 330679773) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((9268095544 : Rat) / 330679773) [(5, 1), (6, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0383_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0383
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0384 : Poly :=
[
  term ((-4201717674989 : Rat) / 188487470610) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 384 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0384 : Poly :=
[
  term ((4201717674989 : Rat) / 188487470610) [(5, 1), (6, 1), (15, 1)],
  term ((-4201717674989 : Rat) / 94243735305) [(5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0384_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0384
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0385 : Poly :=
[
  term ((-68130560 : Rat) / 110226591) [(5, 1), (6, 1), (15, 3)]
]

/-- Partial product 385 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0385 : Poly :=
[
  term ((68130560 : Rat) / 110226591) [(5, 1), (6, 1), (15, 3)],
  term ((-136261120 : Rat) / 110226591) [(5, 1), (6, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0385_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0385
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0386 : Poly :=
[
  term ((-632 : Rat) / 67) [(5, 1), (7, 1)]
]

/-- Partial product 386 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0386 : Poly :=
[
  term ((-1264 : Rat) / 67) [(5, 1), (6, 1), (7, 1)],
  term ((632 : Rat) / 67) [(5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0386_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0386
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0387 : Poly :=
[
  term ((10419582388096 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 387 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0387 : Poly :=
[
  term ((20839164776192 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-10419582388096 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0387_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0387
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0388 : Poly :=
[
  term ((162805974814 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 388 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0388 : Poly :=
[
  term ((325611949628 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-162805974814 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0388_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0388
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0389 : Poly :=
[
  term ((-11738257699883 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 389 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0389 : Poly :=
[
  term ((-23476515399766 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((11738257699883 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0389_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0389
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0390 : Poly :=
[
  term ((198921520 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 390 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0390 : Poly :=
[
  term ((397843040 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0390_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0390
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0391 : Poly :=
[
  term ((-16876615721876 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 391 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0391 : Poly :=
[
  term ((-33753231443752 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0391_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0391
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0392 : Poly :=
[
  term ((2192956060288 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0392 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0392_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0392
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0393 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)]
]

/-- Partial product 393 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0393 : Poly :=
[
  term ((25461954560 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0393_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0393
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0394 : Poly :=
[
  term ((-161932318884 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 394 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0394 : Poly :=
[
  term ((-323864637768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((161932318884 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0394_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0394
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0395 : Poly :=
[
  term ((34264938442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0395 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0395_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0395
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0396 : Poly :=
[
  term ((196 : Rat) / 67) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 396 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0396 : Poly :=
[
  term ((392 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0396_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0396
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0397 : Poly :=
[
  term ((1047453296072 : Rat) / 17452543575) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 397 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0397 : Poly :=
[
  term ((2094906592144 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (15, 2)],
  term ((-1047453296072 : Rat) / 17452543575) [(5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0397_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0397
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0398 : Poly :=
[
  term ((-2394874578674 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 398 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0398 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0398_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0398
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0399 : Poly :=
[
  term ((-2192956060288 : Rat) / 157072892175) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 399 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0399 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (11, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0399_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0399
        rs_R009_ueqv_R009NNNYN_generator_16_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_16_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_16_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_16_0300,
  rs_R009_ueqv_R009NNNYN_partial_16_0301,
  rs_R009_ueqv_R009NNNYN_partial_16_0302,
  rs_R009_ueqv_R009NNNYN_partial_16_0303,
  rs_R009_ueqv_R009NNNYN_partial_16_0304,
  rs_R009_ueqv_R009NNNYN_partial_16_0305,
  rs_R009_ueqv_R009NNNYN_partial_16_0306,
  rs_R009_ueqv_R009NNNYN_partial_16_0307,
  rs_R009_ueqv_R009NNNYN_partial_16_0308,
  rs_R009_ueqv_R009NNNYN_partial_16_0309,
  rs_R009_ueqv_R009NNNYN_partial_16_0310,
  rs_R009_ueqv_R009NNNYN_partial_16_0311,
  rs_R009_ueqv_R009NNNYN_partial_16_0312,
  rs_R009_ueqv_R009NNNYN_partial_16_0313,
  rs_R009_ueqv_R009NNNYN_partial_16_0314,
  rs_R009_ueqv_R009NNNYN_partial_16_0315,
  rs_R009_ueqv_R009NNNYN_partial_16_0316,
  rs_R009_ueqv_R009NNNYN_partial_16_0317,
  rs_R009_ueqv_R009NNNYN_partial_16_0318,
  rs_R009_ueqv_R009NNNYN_partial_16_0319,
  rs_R009_ueqv_R009NNNYN_partial_16_0320,
  rs_R009_ueqv_R009NNNYN_partial_16_0321,
  rs_R009_ueqv_R009NNNYN_partial_16_0322,
  rs_R009_ueqv_R009NNNYN_partial_16_0323,
  rs_R009_ueqv_R009NNNYN_partial_16_0324,
  rs_R009_ueqv_R009NNNYN_partial_16_0325,
  rs_R009_ueqv_R009NNNYN_partial_16_0326,
  rs_R009_ueqv_R009NNNYN_partial_16_0327,
  rs_R009_ueqv_R009NNNYN_partial_16_0328,
  rs_R009_ueqv_R009NNNYN_partial_16_0329,
  rs_R009_ueqv_R009NNNYN_partial_16_0330,
  rs_R009_ueqv_R009NNNYN_partial_16_0331,
  rs_R009_ueqv_R009NNNYN_partial_16_0332,
  rs_R009_ueqv_R009NNNYN_partial_16_0333,
  rs_R009_ueqv_R009NNNYN_partial_16_0334,
  rs_R009_ueqv_R009NNNYN_partial_16_0335,
  rs_R009_ueqv_R009NNNYN_partial_16_0336,
  rs_R009_ueqv_R009NNNYN_partial_16_0337,
  rs_R009_ueqv_R009NNNYN_partial_16_0338,
  rs_R009_ueqv_R009NNNYN_partial_16_0339,
  rs_R009_ueqv_R009NNNYN_partial_16_0340,
  rs_R009_ueqv_R009NNNYN_partial_16_0341,
  rs_R009_ueqv_R009NNNYN_partial_16_0342,
  rs_R009_ueqv_R009NNNYN_partial_16_0343,
  rs_R009_ueqv_R009NNNYN_partial_16_0344,
  rs_R009_ueqv_R009NNNYN_partial_16_0345,
  rs_R009_ueqv_R009NNNYN_partial_16_0346,
  rs_R009_ueqv_R009NNNYN_partial_16_0347,
  rs_R009_ueqv_R009NNNYN_partial_16_0348,
  rs_R009_ueqv_R009NNNYN_partial_16_0349,
  rs_R009_ueqv_R009NNNYN_partial_16_0350,
  rs_R009_ueqv_R009NNNYN_partial_16_0351,
  rs_R009_ueqv_R009NNNYN_partial_16_0352,
  rs_R009_ueqv_R009NNNYN_partial_16_0353,
  rs_R009_ueqv_R009NNNYN_partial_16_0354,
  rs_R009_ueqv_R009NNNYN_partial_16_0355,
  rs_R009_ueqv_R009NNNYN_partial_16_0356,
  rs_R009_ueqv_R009NNNYN_partial_16_0357,
  rs_R009_ueqv_R009NNNYN_partial_16_0358,
  rs_R009_ueqv_R009NNNYN_partial_16_0359,
  rs_R009_ueqv_R009NNNYN_partial_16_0360,
  rs_R009_ueqv_R009NNNYN_partial_16_0361,
  rs_R009_ueqv_R009NNNYN_partial_16_0362,
  rs_R009_ueqv_R009NNNYN_partial_16_0363,
  rs_R009_ueqv_R009NNNYN_partial_16_0364,
  rs_R009_ueqv_R009NNNYN_partial_16_0365,
  rs_R009_ueqv_R009NNNYN_partial_16_0366,
  rs_R009_ueqv_R009NNNYN_partial_16_0367,
  rs_R009_ueqv_R009NNNYN_partial_16_0368,
  rs_R009_ueqv_R009NNNYN_partial_16_0369,
  rs_R009_ueqv_R009NNNYN_partial_16_0370,
  rs_R009_ueqv_R009NNNYN_partial_16_0371,
  rs_R009_ueqv_R009NNNYN_partial_16_0372,
  rs_R009_ueqv_R009NNNYN_partial_16_0373,
  rs_R009_ueqv_R009NNNYN_partial_16_0374,
  rs_R009_ueqv_R009NNNYN_partial_16_0375,
  rs_R009_ueqv_R009NNNYN_partial_16_0376,
  rs_R009_ueqv_R009NNNYN_partial_16_0377,
  rs_R009_ueqv_R009NNNYN_partial_16_0378,
  rs_R009_ueqv_R009NNNYN_partial_16_0379,
  rs_R009_ueqv_R009NNNYN_partial_16_0380,
  rs_R009_ueqv_R009NNNYN_partial_16_0381,
  rs_R009_ueqv_R009NNNYN_partial_16_0382,
  rs_R009_ueqv_R009NNNYN_partial_16_0383,
  rs_R009_ueqv_R009NNNYN_partial_16_0384,
  rs_R009_ueqv_R009NNNYN_partial_16_0385,
  rs_R009_ueqv_R009NNNYN_partial_16_0386,
  rs_R009_ueqv_R009NNNYN_partial_16_0387,
  rs_R009_ueqv_R009NNNYN_partial_16_0388,
  rs_R009_ueqv_R009NNNYN_partial_16_0389,
  rs_R009_ueqv_R009NNNYN_partial_16_0390,
  rs_R009_ueqv_R009NNNYN_partial_16_0391,
  rs_R009_ueqv_R009NNNYN_partial_16_0392,
  rs_R009_ueqv_R009NNNYN_partial_16_0393,
  rs_R009_ueqv_R009NNNYN_partial_16_0394,
  rs_R009_ueqv_R009NNNYN_partial_16_0395,
  rs_R009_ueqv_R009NNNYN_partial_16_0396,
  rs_R009_ueqv_R009NNNYN_partial_16_0397,
  rs_R009_ueqv_R009NNNYN_partial_16_0398,
  rs_R009_ueqv_R009NNNYN_partial_16_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_16_0300_0399 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((411331312 : Rat) / 12247399) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-22851299444 : Rat) / 330679773) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-936290959597 : Rat) / 34905087150) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((166742996 : Rat) / 12247399) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-81328000 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-9268095544 : Rat) / 330679773) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((28193212110967 : Rat) / 471218676525) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((136261120 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (15, 3)],
  term ((-72089697792 : Rat) / 1163502905) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-30412841256 : Rat) / 1163502905) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((65009459616 : Rat) / 1163502905) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-486495372548 : Rat) / 6282915687) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((14790033664 : Rat) / 330679773) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-145617920 : Rat) / 110226591) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((37172343040 : Rat) / 330679773) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((206685851456 : Rat) / 24800982975) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-69283840 : Rat) / 36742197) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((38993920 : Rat) / 36742197) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((231094276 : Rat) / 12247399) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-14581191860 : Rat) / 330679773) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16238411149 : Rat) / 465401162) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((580817860 : Rat) / 12247399) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((3229466429 : Rat) / 918554925) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((132638080 : Rat) / 110226591) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-33521487920 : Rat) / 330679773) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((463704461119 : Rat) / 6282915687) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((30768640 : Rat) / 36742197) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((-1102 : Rat) / 67) [(4, 1), (6, 1), (9, 2)],
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(4, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((181153280 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((3061117720 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1476267520 : Rat) / 330679773) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-35164160 : Rat) / 36742197) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-6263936000 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1223179748188 : Rat) / 18848747061) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (6, 1), (11, 1), (15, 3)],
  term ((12730977280 : Rat) / 330679773) [(4, 1), (6, 1), (11, 2)],
  term ((38993920 : Rat) / 36742197) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((8491560 : Rat) / 12247399) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-163361440 : Rat) / 110226591) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-7307231776 : Rat) / 330679773) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-37069979471 : Rat) / 2094305229) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((54017418 : Rat) / 12247399) [(4, 1), (6, 1), (13, 2)],
  term ((-23066680 : Rat) / 12247399) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(4, 1), (6, 1), (14, 1)],
  term ((5648728000 : Rat) / 110226591) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((5342222258 : Rat) / 281324583) [(4, 1), (6, 1), (15, 2)],
  term ((17582080 : Rat) / 36742197) [(4, 1), (6, 1), (15, 4)],
  term ((38993920 : Rat) / 110226591) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-205665656 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((11425649722 : Rat) / 330679773) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((936290959597 : Rat) / 69810174300) [(4, 1), (7, 1), (13, 1)],
  term ((-83371498 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((40664000 : Rat) / 110226591) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((4634047772 : Rat) / 330679773) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-28193212110967 : Rat) / 942437353050) [(4, 1), (7, 1), (15, 1)],
  term ((-68130560 : Rat) / 110226591) [(4, 1), (7, 1), (15, 3)],
  term ((36044848896 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((15206420628 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-32504729808 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((243247686274 : Rat) / 6282915687) [(4, 1), (9, 1), (11, 1)],
  term ((-7395016832 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((72808960 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-18586171520 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-103342925728 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((34641920 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((2320 : Rat) / 201) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-115547138 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((7290595930 : Rat) / 330679773) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-63 : Rat) / 67) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((16238411149 : Rat) / 930802324) [(4, 1), (9, 1), (13, 1)],
  term ((-290408930 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-66319040 : Rat) / 110226591) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((16760743960 : Rat) / 330679773) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((20641044794 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-463704461119 : Rat) / 12565831374) [(4, 1), (9, 1), (15, 1)],
  term ((30318188881 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-15384320 : Rat) / 36742197) [(4, 1), (9, 1), (15, 3)],
  term ((551 : Rat) / 67) [(4, 1), (9, 2)],
  term ((-22051204672 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((19496960 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 2)],
  term ((-90576640 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1530558860 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1)],
  term ((738133760 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((17582080 : Rat) / 36742197) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((3131968000 : Rat) / 110226591) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((611589874094 : Rat) / 18848747061) [(4, 1), (11, 1), (15, 1)],
  term ((9748480 : Rat) / 36742197) [(4, 1), (11, 1), (15, 3)],
  term ((-6365488640 : Rat) / 330679773) [(4, 1), (11, 2)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4245780 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((81680720 : Rat) / 110226591) [(4, 1), (12, 1), (15, 2)],
  term ((3653615888 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((37069979471 : Rat) / 4188610458) [(4, 1), (13, 1), (15, 1)],
  term ((1370880 : Rat) / 12247399) [(4, 1), (13, 1), (15, 3)],
  term ((-27008709 : Rat) / 12247399) [(4, 1), (13, 2)],
  term ((11533340 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((49 : Rat) / 67) [(4, 1), (14, 1)],
  term ((-2824364000 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)],
  term ((-2671111129 : Rat) / 281324583) [(4, 1), (15, 2)],
  term ((-8791040 : Rat) / 36742197) [(4, 1), (15, 4)],
  term ((635084800 : Rat) / 110226591) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((29769600 : Rat) / 12247399) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-572710400 : Rat) / 110226591) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-317542400 : Rat) / 110226591) [(4, 2), (9, 1), (11, 1)],
  term ((-14884800 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 2), (9, 1), (15, 1)],
  term ((-1264 : Rat) / 67) [(5, 1), (6, 1), (7, 1)],
  term ((20839164776192 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((325611949628 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-23476515399766 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((397843040 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (11, 2)],
  term ((-323864637768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (11, 1)],
  term ((243 : Rat) / 134) [(5, 1), (6, 1), (9, 1)],
  term ((-641398435328 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((-10021850552 : Rat) / 1163502905) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((578403946144 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-2372003202584 : Rat) / 94243735305) [(5, 1), (6, 1), (11, 1)],
  term ((13162601984 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-6702080 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((5335775872 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-40386560 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((205665656 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-11425649722 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-146140265789 : Rat) / 13962034860) [(5, 1), (6, 1), (13, 1)],
  term ((83371498 : Rat) / 12247399) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-40664000 : Rat) / 110226591) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((456960 : Rat) / 12247399) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-4634047772 : Rat) / 330679773) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((4201717674989 : Rat) / 188487470610) [(5, 1), (6, 1), (15, 1)],
  term ((68130560 : Rat) / 110226591) [(5, 1), (6, 1), (15, 3)],
  term ((-243 : Rat) / 67) [(5, 1), (6, 2), (9, 1)],
  term ((1282796870656 : Rat) / 31414578435) [(5, 1), (6, 2), (10, 1), (11, 1)],
  term ((20043701104 : Rat) / 1163502905) [(5, 1), (6, 2), (10, 1), (13, 1)],
  term ((-1156807892288 : Rat) / 31414578435) [(5, 1), (6, 2), (10, 1), (15, 1)],
  term ((4744006405168 : Rat) / 94243735305) [(5, 1), (6, 2), (11, 1)],
  term ((-26325203968 : Rat) / 330679773) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((13404160 : Rat) / 110226591) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((-10671551744 : Rat) / 330679773) [(5, 1), (6, 2), (11, 1), (14, 1)],
  term ((80773120 : Rat) / 110226591) [(5, 1), (6, 2), (11, 1), (15, 2)],
  term ((77987840 : Rat) / 110226591) [(5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-411331312 : Rat) / 12247399) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((22851299444 : Rat) / 330679773) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((146140265789 : Rat) / 6981017430) [(5, 1), (6, 2), (13, 1)],
  term ((-166742996 : Rat) / 12247399) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((81328000 : Rat) / 110226591) [(5, 1), (6, 2), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (6, 2), (13, 2), (15, 1)],
  term ((9268095544 : Rat) / 330679773) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((-4201717674989 : Rat) / 94243735305) [(5, 1), (6, 2), (15, 1)],
  term ((-136261120 : Rat) / 110226591) [(5, 1), (6, 2), (15, 3)],
  term ((632 : Rat) / 67) [(5, 1), (7, 1)],
  term ((-10419582388096 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-162805974814 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((11738257699883 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-198921520 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)],
  term ((161932318884 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (7, 1), (14, 1)],
  term ((-1047453296072 : Rat) / 17452543575) [(5, 1), (7, 1), (15, 2)],
  term ((2394874578674 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NNNYN_block_16_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_16_0300_0399
      rs_R009_ueqv_R009NNNYN_block_16_0300_0399 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
