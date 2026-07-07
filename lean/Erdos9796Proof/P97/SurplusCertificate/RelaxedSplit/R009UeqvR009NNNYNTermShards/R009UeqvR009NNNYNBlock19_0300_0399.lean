/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0300 : Poly :=
[
  term ((-671390720 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 300 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0300 : Poly :=
[
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1)],
  term ((671390720 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0300
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0301 : Poly :=
[
  term ((-1619537920 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 301 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0301 : Poly :=
[
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((1619537920 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0301
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0302 : Poly :=
[
  term ((-209592320 : Rat) / 110226591) [(2, 1), (5, 1), (11, 1), (15, 2)]
]

/-- Partial product 302 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0302 : Poly :=
[
  term ((-419184640 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((209592320 : Rat) / 110226591) [(2, 1), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0302
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0303 : Poly :=
[
  term ((-10490480 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 303 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0303 : Poly :=
[
  term ((-20980960 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((10490480 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0303
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0304 : Poly :=
[
  term ((605450560 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 304 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0304 : Poly :=
[
  term ((1210901120 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-605450560 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0304
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0305 : Poly :=
[
  term ((-35542220 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 305 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0305 : Poly :=
[
  term ((-71084440 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((35542220 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0305_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0305
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0306 : Poly :=
[
  term ((-25305280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 306 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0306 : Poly :=
[
  term ((-50610560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((25305280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0306_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0306
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0307 : Poly :=
[
  term ((-9824640 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 307 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0307 : Poly :=
[
  term ((-19649280 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((9824640 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0307_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0307
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0308 : Poly :=
[
  term ((1460476160 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 308 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0308 : Poly :=
[
  term ((2920952320 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1460476160 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0308_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0308
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0309 : Poly :=
[
  term ((2051293840 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 309 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0309 : Poly :=
[
  term ((4102587680 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((-2051293840 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0309_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0309
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0310 : Poly :=
[
  term ((189007360 : Rat) / 110226591) [(2, 1), (5, 1), (15, 3)]
]

/-- Partial product 310 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0310 : Poly :=
[
  term ((378014720 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (15, 3)],
  term ((-189007360 : Rat) / 110226591) [(2, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0310_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0310
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0311 : Poly :=
[
  term ((83722240 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 311 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0311 : Poly :=
[
  term ((167444480 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-83722240 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0311_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0311
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0312 : Poly :=
[
  term ((3924480 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 312 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0312 : Poly :=
[
  term ((7848960 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-3924480 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0312_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0312
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0313 : Poly :=
[
  term ((-75499520 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 313 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0313 : Poly :=
[
  term ((-150999040 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((75499520 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0313_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0313
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0314 : Poly :=
[
  term ((-1023357440 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 314 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0314 : Poly :=
[
  term ((-2046714880 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((1023357440 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0314_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0314
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0315 : Poly :=
[
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 315 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0315 : Poly :=
[
  term ((-2685562880 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((1342781440 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0315_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0315
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0316 : Poly :=
[
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 316 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0316 : Poly :=
[
  term ((-6478151680 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((3239075840 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0316_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0316
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0317 : Poly :=
[
  term ((-419184640 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 317 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0317 : Poly :=
[
  term ((-838369280 : Rat) / 110226591) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((419184640 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0317_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0317
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0318 : Poly :=
[
  term ((-20980960 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 318 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0318 : Poly :=
[
  term ((-41961920 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((20980960 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0318_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0318
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0319 : Poly :=
[
  term ((1210901120 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 319 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0319 : Poly :=
[
  term ((2421802240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1210901120 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0319_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0319
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0320 : Poly :=
[
  term ((-15989960 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 320 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0320 : Poly :=
[
  term ((-31979920 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((15989960 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0320_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0320
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0321 : Poly :=
[
  term ((-50610560 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 321 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0321 : Poly :=
[
  term ((-101221120 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((50610560 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0321_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0321
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0322 : Poly :=
[
  term ((-19649280 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 322 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0322 : Poly :=
[
  term ((-39298560 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((19649280 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0322_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0322
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0323 : Poly :=
[
  term ((2920952320 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 323 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0323 : Poly :=
[
  term ((5841904640 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0323_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0323
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0324 : Poly :=
[
  term ((922849120 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 324 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0324 : Poly :=
[
  term ((1845698240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-922849120 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0324_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0324
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0325 : Poly :=
[
  term ((378014720 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (15, 3)]
]

/-- Partial product 325 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0325 : Poly :=
[
  term ((756029440 : Rat) / 110226591) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 3)],
  term ((-378014720 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0325_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0325
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0326 : Poly :=
[
  term ((-604549120 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 326 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0326 : Poly :=
[
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0326_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0326
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0327 : Poly :=
[
  term ((545173760 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 327 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0327 : Poly :=
[
  term ((1090347520 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0327_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0327
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0328 : Poly :=
[
  term ((-9446080 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)]
]

/-- Partial product 328 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0328 : Poly :=
[
  term ((-18892160 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (13, 2)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0328_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0328
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0329 : Poly :=
[
  term ((1023357440 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 329 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0329 : Poly :=
[
  term ((-1023357440 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((2046714880 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0329_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0329
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0330 : Poly :=
[
  term ((1342781440 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 330 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0330 : Poly :=
[
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0330_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0330
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0331 : Poly :=
[
  term ((3239075840 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 331 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0331 : Poly :=
[
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0331_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0331
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0332 : Poly :=
[
  term ((419184640 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 332 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0332 : Poly :=
[
  term ((-419184640 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (7, 1), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0332_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0332
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0333 : Poly :=
[
  term ((20980960 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 333 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0333 : Poly :=
[
  term ((-20980960 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0333_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0333
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0334 : Poly :=
[
  term ((-1210901120 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 334 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0334 : Poly :=
[
  term ((1210901120 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0334_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0334
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0335 : Poly :=
[
  term ((15989960 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 335 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0335 : Poly :=
[
  term ((-15989960 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((31979920 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0335_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0335
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0336 : Poly :=
[
  term ((50610560 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 336 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0336 : Poly :=
[
  term ((-50610560 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0336_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0336
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0337 : Poly :=
[
  term ((19649280 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 337 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0337 : Poly :=
[
  term ((-19649280 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0337_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0337
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0338 : Poly :=
[
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 338 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0338 : Poly :=
[
  term ((2920952320 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0338_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0338
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0339 : Poly :=
[
  term ((-922849120 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 339 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0339 : Poly :=
[
  term ((922849120 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1845698240 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0339_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0339
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0340 : Poly :=
[
  term ((-378014720 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (15, 3)]
]

/-- Partial product 340 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0340 : Poly :=
[
  term ((378014720 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (15, 3)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (7, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0340_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0340
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0341 : Poly :=
[
  term ((-191968000 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 341 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0341 : Poly :=
[
  term ((-383936000 : Rat) / 36742197) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((191968000 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0341_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0341
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0342 : Poly :=
[
  term ((-671390720 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 342 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0342 : Poly :=
[
  term ((-1342781440 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((671390720 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0342_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0342
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0343 : Poly :=
[
  term ((-1619537920 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 343 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0343 : Poly :=
[
  term ((-3239075840 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((1619537920 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0343_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0343
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0344 : Poly :=
[
  term ((-209592320 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 344 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0344 : Poly :=
[
  term ((-419184640 : Rat) / 36742197) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((209592320 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0344_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0344
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0345 : Poly :=
[
  term ((-31471440 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 345 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0345 : Poly :=
[
  term ((-62942880 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((31471440 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0345_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0345
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0346 : Poly :=
[
  term ((605450560 : Rat) / 110226591) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 346 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0346 : Poly :=
[
  term ((1210901120 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-605450560 : Rat) / 110226591) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0346_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0346
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0347 : Poly :=
[
  term ((-26995500 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 347 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0347 : Poly :=
[
  term ((-53991000 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((26995500 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0347_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0347
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0348 : Poly :=
[
  term ((-75915840 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 348 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0348 : Poly :=
[
  term ((-151831680 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((75915840 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0348_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0348
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0349 : Poly :=
[
  term ((-29473920 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 349 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0349 : Poly :=
[
  term ((-58947840 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((29473920 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0349_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0349
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0350 : Poly :=
[
  term ((1460476160 : Rat) / 110226591) [(2, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 350 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0350 : Poly :=
[
  term ((2920952320 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1460476160 : Rat) / 110226591) [(2, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0350_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0350
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0351 : Poly :=
[
  term ((173114000 : Rat) / 36742197) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 351 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0351 : Poly :=
[
  term ((346228000 : Rat) / 36742197) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-173114000 : Rat) / 36742197) [(2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0351_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0351
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0352 : Poly :=
[
  term ((189007360 : Rat) / 36742197) [(2, 1), (7, 1), (15, 3)]
]

/-- Partial product 352 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0352 : Poly :=
[
  term ((378014720 : Rat) / 36742197) [(2, 1), (7, 1), (8, 1), (15, 3)],
  term ((-189007360 : Rat) / 36742197) [(2, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0352_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0352
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0353 : Poly :=
[
  term ((2086515200 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 353 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0353 : Poly :=
[
  term ((4173030400 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (11, 1)],
  term ((-2086515200 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0353_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0353
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0354 : Poly :=
[
  term ((1342781440 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 354 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0354 : Poly :=
[
  term ((2685562880 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0354_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0354
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0355 : Poly :=
[
  term ((3239075840 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 355 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0355 : Poly :=
[
  term ((6478151680 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0355_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0355
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0356 : Poly :=
[
  term ((419184640 : Rat) / 110226591) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 356 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0356 : Poly :=
[
  term ((838369280 : Rat) / 110226591) [(2, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0356_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0356
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0357 : Poly :=
[
  term ((20980960 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 357 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0357 : Poly :=
[
  term ((41961920 : Rat) / 12247399) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0357_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0357
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0358 : Poly :=
[
  term ((-1210901120 : Rat) / 330679773) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 358 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0358 : Poly :=
[
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0358_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0358
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0359 : Poly :=
[
  term ((32601800 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 359 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0359 : Poly :=
[
  term ((65203600 : Rat) / 12247399) [(2, 1), (8, 1), (9, 1), (13, 1)],
  term ((-32601800 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0359_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0359
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0360 : Poly :=
[
  term ((50610560 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 360 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0360 : Poly :=
[
  term ((101221120 : Rat) / 12247399) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0360_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0360
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0361 : Poly :=
[
  term ((19649280 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 361 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0361 : Poly :=
[
  term ((39298560 : Rat) / 12247399) [(2, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0361_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0361
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0362 : Poly :=
[
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 362 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0362 : Poly :=
[
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0362_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0362
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0363 : Poly :=
[
  term ((-1881589600 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 363 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0363 : Poly :=
[
  term ((-3763179200 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((1881589600 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0363_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0363
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0364 : Poly :=
[
  term ((-378014720 : Rat) / 110226591) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 364 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0364 : Poly :=
[
  term ((-756029440 : Rat) / 110226591) [(2, 1), (8, 1), (9, 1), (15, 3)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0364_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0364
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0365 : Poly :=
[
  term ((604549120 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 365 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0365 : Poly :=
[
  term ((1209098240 : Rat) / 330679773) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0365_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0365
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0366 : Poly :=
[
  term ((-545173760 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 366 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0366 : Poly :=
[
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0366_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0366
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0367 : Poly :=
[
  term ((9446080 : Rat) / 12247399) [(2, 1), (13, 2)]
]

/-- Partial product 367 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0367 : Poly :=
[
  term ((18892160 : Rat) / 12247399) [(2, 1), (8, 1), (13, 2)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0367_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0367
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0368 : Poly :=
[
  term ((19066880 : Rat) / 6239241) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 368 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0368 : Poly :=
[
  term ((38133760 : Rat) / 6239241) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-19066880 : Rat) / 6239241) [(3, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0368_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0368
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0369 : Poly :=
[
  term ((-604549120 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 369 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0369 : Poly :=
[
  term ((-1209098240 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((604549120 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0369_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0369
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0370 : Poly :=
[
  term ((-1165373440 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 370 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0370 : Poly :=
[
  term ((-2330746880 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((1165373440 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0370_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0370
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0371 : Poly :=
[
  term ((-9446080 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 371 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0371 : Poly :=
[
  term ((-18892160 : Rat) / 12247399) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((9446080 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0371_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0371
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0372 : Poly :=
[
  term ((545173760 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 372 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0372 : Poly :=
[
  term ((1090347520 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0372_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0372
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0373 : Poly :=
[
  term ((297920 : Rat) / 231083) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 373 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0373 : Poly :=
[
  term ((595840 : Rat) / 231083) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-297920 : Rat) / 231083) [(3, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0373_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0373
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0374 : Poly :=
[
  term ((-18208960 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 374 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0374 : Poly :=
[
  term ((-36417920 : Rat) / 12247399) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((18208960 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0374_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0374
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0375 : Poly :=
[
  term ((1050917120 : Rat) / 330679773) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 375 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0375 : Poly :=
[
  term ((2101834240 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1050917120 : Rat) / 330679773) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0375_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0375
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0376 : Poly :=
[
  term ((-17194240 : Rat) / 6239241) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 376 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0376 : Poly :=
[
  term ((-34388480 : Rat) / 6239241) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((17194240 : Rat) / 6239241) [(3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0376_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0376
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0377 : Poly :=
[
  term ((-19066880 : Rat) / 6239241) [(3, 1), (11, 1)]
]

/-- Partial product 377 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0377 : Poly :=
[
  term ((-38133760 : Rat) / 6239241) [(3, 1), (8, 1), (11, 1)],
  term ((19066880 : Rat) / 6239241) [(3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0377_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0377
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0378 : Poly :=
[
  term ((604549120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 378 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0378 : Poly :=
[
  term ((1209098240 : Rat) / 330679773) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((-604549120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0378_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0378
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0379 : Poly :=
[
  term ((1165373440 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 379 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0379 : Poly :=
[
  term ((2330746880 : Rat) / 330679773) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1165373440 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0379_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0379
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0380 : Poly :=
[
  term ((9446080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 380 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0380 : Poly :=
[
  term ((18892160 : Rat) / 12247399) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-9446080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0380_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0380
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0381 : Poly :=
[
  term ((-545173760 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 381 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0381 : Poly :=
[
  term ((-1090347520 : Rat) / 330679773) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0381_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0381
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0382 : Poly :=
[
  term ((-297920 : Rat) / 231083) [(3, 1), (13, 1)]
]

/-- Partial product 382 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0382 : Poly :=
[
  term ((-595840 : Rat) / 231083) [(3, 1), (8, 1), (13, 1)],
  term ((297920 : Rat) / 231083) [(3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0382_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0382
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0383 : Poly :=
[
  term ((18208960 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 383 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0383 : Poly :=
[
  term ((36417920 : Rat) / 12247399) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-18208960 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0383_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0383
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0384 : Poly :=
[
  term ((-1050917120 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 384 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0384 : Poly :=
[
  term ((-2101834240 : Rat) / 330679773) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((1050917120 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0384_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0384
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0385 : Poly :=
[
  term ((17194240 : Rat) / 6239241) [(3, 1), (15, 1)]
]

/-- Partial product 385 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0385 : Poly :=
[
  term ((34388480 : Rat) / 6239241) [(3, 1), (8, 1), (15, 1)],
  term ((-17194240 : Rat) / 6239241) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0385_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0385
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0386 : Poly :=
[
  term ((-18 : Rat) / 67) [(4, 1)]
]

/-- Partial product 386 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0386 : Poly :=
[
  term ((18 : Rat) / 67) [(4, 1)],
  term ((-36 : Rat) / 67) [(4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0386_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0386
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0387 : Poly :=
[
  term ((1721 : Rat) / 67) [(4, 1), (5, 1), (7, 1)]
]

/-- Partial product 387 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0387 : Poly :=
[
  term ((-1721 : Rat) / 67) [(4, 1), (5, 1), (7, 1)],
  term ((3442 : Rat) / 67) [(4, 1), (5, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0387_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0387
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0388 : Poly :=
[
  term ((-7681428414464 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 388 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0388 : Poly :=
[
  term ((-15362856828928 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((7681428414464 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0388_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0388
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0389 : Poly :=
[
  term ((-120022318976 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 389 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0389 : Poly :=
[
  term ((-240044637952 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((120022318976 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0389_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0389
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0390 : Poly :=
[
  term ((9107267927722 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 390 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0390 : Poly :=
[
  term ((18214535855444 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-9107267927722 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0390_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0390
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0391 : Poly :=
[
  term ((-1193529120 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 391 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0391 : Poly :=
[
  term ((-2387058240 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((1193529120 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0391_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0391
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0392 : Poly :=
[
  term ((5843604024 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 392 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0392 : Poly :=
[
  term ((11687208048 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-5843604024 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0392_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0392
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0393 : Poly :=
[
  term ((-25461954560 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (11, 2)]
]

/-- Partial product 393 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0393 : Poly :=
[
  term ((-50923909120 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 2)],
  term ((25461954560 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0393_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0393
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0394 : Poly :=
[
  term ((1179820320 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 394 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0394 : Poly :=
[
  term ((2359640640 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1179820320 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0394_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0394
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0395 : Poly :=
[
  term ((-19525602136 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (15, 2)]
]

/-- Partial product 395 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0395 : Poly :=
[
  term ((-39051204272 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (8, 1), (15, 2)],
  term ((19525602136 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0395_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0395
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0396 : Poly :=
[
  term ((4385912120576 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (11, 1)]
]

/-- Partial product 396 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0396 : Poly :=
[
  term ((8771824241152 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (8, 1), (11, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0396_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0396
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0397 : Poly :=
[
  term ((205589630652 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 2), (13, 1)]
]

/-- Partial product 397 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0397 : Poly :=
[
  term ((411179261304 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0397_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0397
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0398 : Poly :=
[
  term ((-4789749157348 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (15, 1)]
]

/-- Partial product 398 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0398 : Poly :=
[
  term ((-9579498314696 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (8, 1), (15, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0398_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0398
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0399 : Poly :=
[
  term ((-1721 : Rat) / 134) [(4, 1), (5, 1), (9, 1)]
]

/-- Partial product 399 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0399 : Poly :=
[
  term ((-1721 : Rat) / 67) [(4, 1), (5, 1), (8, 1), (9, 1)],
  term ((1721 : Rat) / 134) [(4, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0399_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0399
        rs_R009_ueqv_R009NNNYN_generator_19_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_19_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_0300,
  rs_R009_ueqv_R009NNNYN_partial_19_0301,
  rs_R009_ueqv_R009NNNYN_partial_19_0302,
  rs_R009_ueqv_R009NNNYN_partial_19_0303,
  rs_R009_ueqv_R009NNNYN_partial_19_0304,
  rs_R009_ueqv_R009NNNYN_partial_19_0305,
  rs_R009_ueqv_R009NNNYN_partial_19_0306,
  rs_R009_ueqv_R009NNNYN_partial_19_0307,
  rs_R009_ueqv_R009NNNYN_partial_19_0308,
  rs_R009_ueqv_R009NNNYN_partial_19_0309,
  rs_R009_ueqv_R009NNNYN_partial_19_0310,
  rs_R009_ueqv_R009NNNYN_partial_19_0311,
  rs_R009_ueqv_R009NNNYN_partial_19_0312,
  rs_R009_ueqv_R009NNNYN_partial_19_0313,
  rs_R009_ueqv_R009NNNYN_partial_19_0314,
  rs_R009_ueqv_R009NNNYN_partial_19_0315,
  rs_R009_ueqv_R009NNNYN_partial_19_0316,
  rs_R009_ueqv_R009NNNYN_partial_19_0317,
  rs_R009_ueqv_R009NNNYN_partial_19_0318,
  rs_R009_ueqv_R009NNNYN_partial_19_0319,
  rs_R009_ueqv_R009NNNYN_partial_19_0320,
  rs_R009_ueqv_R009NNNYN_partial_19_0321,
  rs_R009_ueqv_R009NNNYN_partial_19_0322,
  rs_R009_ueqv_R009NNNYN_partial_19_0323,
  rs_R009_ueqv_R009NNNYN_partial_19_0324,
  rs_R009_ueqv_R009NNNYN_partial_19_0325,
  rs_R009_ueqv_R009NNNYN_partial_19_0326,
  rs_R009_ueqv_R009NNNYN_partial_19_0327,
  rs_R009_ueqv_R009NNNYN_partial_19_0328,
  rs_R009_ueqv_R009NNNYN_partial_19_0329,
  rs_R009_ueqv_R009NNNYN_partial_19_0330,
  rs_R009_ueqv_R009NNNYN_partial_19_0331,
  rs_R009_ueqv_R009NNNYN_partial_19_0332,
  rs_R009_ueqv_R009NNNYN_partial_19_0333,
  rs_R009_ueqv_R009NNNYN_partial_19_0334,
  rs_R009_ueqv_R009NNNYN_partial_19_0335,
  rs_R009_ueqv_R009NNNYN_partial_19_0336,
  rs_R009_ueqv_R009NNNYN_partial_19_0337,
  rs_R009_ueqv_R009NNNYN_partial_19_0338,
  rs_R009_ueqv_R009NNNYN_partial_19_0339,
  rs_R009_ueqv_R009NNNYN_partial_19_0340,
  rs_R009_ueqv_R009NNNYN_partial_19_0341,
  rs_R009_ueqv_R009NNNYN_partial_19_0342,
  rs_R009_ueqv_R009NNNYN_partial_19_0343,
  rs_R009_ueqv_R009NNNYN_partial_19_0344,
  rs_R009_ueqv_R009NNNYN_partial_19_0345,
  rs_R009_ueqv_R009NNNYN_partial_19_0346,
  rs_R009_ueqv_R009NNNYN_partial_19_0347,
  rs_R009_ueqv_R009NNNYN_partial_19_0348,
  rs_R009_ueqv_R009NNNYN_partial_19_0349,
  rs_R009_ueqv_R009NNNYN_partial_19_0350,
  rs_R009_ueqv_R009NNNYN_partial_19_0351,
  rs_R009_ueqv_R009NNNYN_partial_19_0352,
  rs_R009_ueqv_R009NNNYN_partial_19_0353,
  rs_R009_ueqv_R009NNNYN_partial_19_0354,
  rs_R009_ueqv_R009NNNYN_partial_19_0355,
  rs_R009_ueqv_R009NNNYN_partial_19_0356,
  rs_R009_ueqv_R009NNNYN_partial_19_0357,
  rs_R009_ueqv_R009NNNYN_partial_19_0358,
  rs_R009_ueqv_R009NNNYN_partial_19_0359,
  rs_R009_ueqv_R009NNNYN_partial_19_0360,
  rs_R009_ueqv_R009NNNYN_partial_19_0361,
  rs_R009_ueqv_R009NNNYN_partial_19_0362,
  rs_R009_ueqv_R009NNNYN_partial_19_0363,
  rs_R009_ueqv_R009NNNYN_partial_19_0364,
  rs_R009_ueqv_R009NNNYN_partial_19_0365,
  rs_R009_ueqv_R009NNNYN_partial_19_0366,
  rs_R009_ueqv_R009NNNYN_partial_19_0367,
  rs_R009_ueqv_R009NNNYN_partial_19_0368,
  rs_R009_ueqv_R009NNNYN_partial_19_0369,
  rs_R009_ueqv_R009NNNYN_partial_19_0370,
  rs_R009_ueqv_R009NNNYN_partial_19_0371,
  rs_R009_ueqv_R009NNNYN_partial_19_0372,
  rs_R009_ueqv_R009NNNYN_partial_19_0373,
  rs_R009_ueqv_R009NNNYN_partial_19_0374,
  rs_R009_ueqv_R009NNNYN_partial_19_0375,
  rs_R009_ueqv_R009NNNYN_partial_19_0376,
  rs_R009_ueqv_R009NNNYN_partial_19_0377,
  rs_R009_ueqv_R009NNNYN_partial_19_0378,
  rs_R009_ueqv_R009NNNYN_partial_19_0379,
  rs_R009_ueqv_R009NNNYN_partial_19_0380,
  rs_R009_ueqv_R009NNNYN_partial_19_0381,
  rs_R009_ueqv_R009NNNYN_partial_19_0382,
  rs_R009_ueqv_R009NNNYN_partial_19_0383,
  rs_R009_ueqv_R009NNNYN_partial_19_0384,
  rs_R009_ueqv_R009NNNYN_partial_19_0385,
  rs_R009_ueqv_R009NNNYN_partial_19_0386,
  rs_R009_ueqv_R009NNNYN_partial_19_0387,
  rs_R009_ueqv_R009NNNYN_partial_19_0388,
  rs_R009_ueqv_R009NNNYN_partial_19_0389,
  rs_R009_ueqv_R009NNNYN_partial_19_0390,
  rs_R009_ueqv_R009NNNYN_partial_19_0391,
  rs_R009_ueqv_R009NNNYN_partial_19_0392,
  rs_R009_ueqv_R009NNNYN_partial_19_0393,
  rs_R009_ueqv_R009NNNYN_partial_19_0394,
  rs_R009_ueqv_R009NNNYN_partial_19_0395,
  rs_R009_ueqv_R009NNNYN_partial_19_0396,
  rs_R009_ueqv_R009NNNYN_partial_19_0397,
  rs_R009_ueqv_R009NNNYN_partial_19_0398,
  rs_R009_ueqv_R009NNNYN_partial_19_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_0300_0399 : Poly :=
[
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-71084440 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((4102587680 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (15, 3)],
  term ((671390720 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((1619537920 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((209592320 : Rat) / 110226591) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((10490480 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-605450560 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((35542220 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)],
  term ((25305280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((9824640 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-1460476160 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-2051293840 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)],
  term ((-189007360 : Rat) / 110226591) [(2, 1), (5, 1), (15, 3)],
  term ((167444480 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((7848960 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-150999040 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-83722240 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-3924480 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((75499520 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-2046714880 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-2685562880 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-6478151680 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-838369280 : Rat) / 110226591) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-41961920 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((2421802240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-31979920 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-101221120 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-39298560 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((5841904640 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1845698240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((756029440 : Rat) / 110226591) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 3)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (13, 2)],
  term ((1023357440 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((1342781440 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((3239075840 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((419184640 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((20980960 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1210901120 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((15989960 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((50610560 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((19649280 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-922849120 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-378014720 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (15, 3)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)],
  term ((-4478781440 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1)],
  term ((-5371125760 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-12956303360 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1676738560 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-83923840 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((4843604480 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-69980960 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((-202442240 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-78597120 : Rat) / 12247399) [(2, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((11683809280 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((4038901120 : Rat) / 330679773) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((1512058880 : Rat) / 110226591) [(2, 1), (7, 1), (8, 1), (15, 3)],
  term ((2046714880 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (11, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (11, 1), (12, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (11, 1), (14, 1)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (7, 1), (8, 2), (11, 1), (15, 2)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((31979920 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (13, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-1845698240 : Rat) / 330679773) [(2, 1), (7, 1), (8, 2), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (7, 1), (8, 2), (15, 3)],
  term ((191968000 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1)],
  term ((671390720 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((1619537920 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((209592320 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((31471440 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-605450560 : Rat) / 110226591) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((26995500 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)],
  term ((75915840 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((29473920 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1460476160 : Rat) / 110226591) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-173114000 : Rat) / 36742197) [(2, 1), (7, 1), (15, 1)],
  term ((-189007360 : Rat) / 36742197) [(2, 1), (7, 1), (15, 3)],
  term ((4173030400 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (11, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((65203600 : Rat) / 12247399) [(2, 1), (8, 1), (9, 1), (13, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-3763179200 : Rat) / 330679773) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (8, 1), (9, 1), (15, 3)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (8, 1), (13, 2)],
  term ((-2086515200 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)],
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-32601800 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((1881589600 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (9, 1), (15, 3)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (13, 2)],
  term ((38133760 : Rat) / 6239241) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-1209098240 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-2330746880 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-18892160 : Rat) / 12247399) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((1090347520 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((595840 : Rat) / 231083) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-36417920 : Rat) / 12247399) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((2101834240 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-34388480 : Rat) / 6239241) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-19066880 : Rat) / 6239241) [(3, 1), (6, 1), (11, 1)],
  term ((604549120 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((1165373440 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((9446080 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-545173760 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-297920 : Rat) / 231083) [(3, 1), (6, 1), (13, 1)],
  term ((18208960 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-1050917120 : Rat) / 330679773) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((17194240 : Rat) / 6239241) [(3, 1), (6, 1), (15, 1)],
  term ((-38133760 : Rat) / 6239241) [(3, 1), (8, 1), (11, 1)],
  term ((1209098240 : Rat) / 330679773) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((2330746880 : Rat) / 330679773) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((18892160 : Rat) / 12247399) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-1090347520 : Rat) / 330679773) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-595840 : Rat) / 231083) [(3, 1), (8, 1), (13, 1)],
  term ((36417920 : Rat) / 12247399) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-2101834240 : Rat) / 330679773) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((34388480 : Rat) / 6239241) [(3, 1), (8, 1), (15, 1)],
  term ((19066880 : Rat) / 6239241) [(3, 1), (11, 1)],
  term ((-604549120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)],
  term ((-1165373440 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)],
  term ((-9446080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)],
  term ((297920 : Rat) / 231083) [(3, 1), (13, 1)],
  term ((-18208960 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)],
  term ((1050917120 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)],
  term ((-17194240 : Rat) / 6239241) [(3, 1), (15, 1)],
  term ((18 : Rat) / 67) [(4, 1)],
  term ((-1721 : Rat) / 67) [(4, 1), (5, 1), (7, 1)],
  term ((3442 : Rat) / 67) [(4, 1), (5, 1), (7, 1), (8, 1)],
  term ((-15362856828928 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-240044637952 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((18214535855444 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2387058240 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((11687208048 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-50923909120 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 2)],
  term ((2359640640 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-39051204272 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (8, 1), (15, 2)],
  term ((7681428414464 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((120022318976 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-9107267927722 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((1193529120 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((25461954560 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (11, 2)],
  term ((-1179820320 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((19525602136 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((8771824241152 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (8, 1), (11, 1)],
  term ((411179261304 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-9579498314696 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (8, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (11, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((-1721 : Rat) / 67) [(4, 1), (5, 1), (8, 1), (9, 1)],
  term ((1721 : Rat) / 134) [(4, 1), (5, 1), (9, 1)],
  term ((-36 : Rat) / 67) [(4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_0300_0399
      rs_R009_ueqv_R009NNNYN_block_19_0300_0399 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
