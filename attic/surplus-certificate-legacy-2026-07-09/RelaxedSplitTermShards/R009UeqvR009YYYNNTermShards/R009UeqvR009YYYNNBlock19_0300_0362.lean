/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 19:300-362

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0300 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 300 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0300 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0300_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0300
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0301 : Poly :=
[
  term ((905582106 : Rat) / 21337981) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 301 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0301 : Poly :=
[
  term ((1811164212 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-905582106 : Rat) / 21337981) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0301_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0301
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0302 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0302 : Poly :=
[
  term ((-142964775 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0302_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0302
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0303 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 303 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0303 : Poly :=
[
  term ((-9914440896 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0303_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0303
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0304 : Poly :=
[
  term ((-53259609 : Rat) / 42675962) [(5, 1), (13, 1)]
]

/-- Partial product 304 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0304 : Poly :=
[
  term ((-53259609 : Rat) / 21337981) [(5, 1), (8, 1), (13, 1)],
  term ((53259609 : Rat) / 42675962) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0304_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0304
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0305 : Poly :=
[
  term ((17753203 : Rat) / 85351924) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 305 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0305 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0305_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0305
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0306 : Poly :=
[
  term ((929478834 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 306 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0306 : Poly :=
[
  term ((1858957668 : Rat) / 21337981) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-929478834 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0306_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0306
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0307 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 307 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0307 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0307_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0307
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0308 : Poly :=
[
  term ((1048546881 : Rat) / 42675962) [(5, 1), (15, 1)]
]

/-- Partial product 308 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0308 : Poly :=
[
  term ((1048546881 : Rat) / 21337981) [(5, 1), (8, 1), (15, 1)],
  term ((-1048546881 : Rat) / 42675962) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0308_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0308
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0309 : Poly :=
[
  term ((-142964775 : Rat) / 85351924) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0309 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0309_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0309
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0310 : Poly :=
[
  term ((-3098262780 : Rat) / 21337981) [(5, 1), (15, 3)]
]

/-- Partial product 310 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0310 : Poly :=
[
  term ((-6196525560 : Rat) / 21337981) [(5, 1), (8, 1), (15, 3)],
  term ((3098262780 : Rat) / 21337981) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0310_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0310
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0311 : Poly :=
[
  term ((576814347 : Rat) / 170703848) [(8, 1)]
]

/-- Partial product 311 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0311 : Poly :=
[
  term ((-576814347 : Rat) / 170703848) [(8, 1)],
  term ((576814347 : Rat) / 85351924) [(8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0311_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0311
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0312 : Poly :=
[
  term ((744038307 : Rat) / 21337981) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 312 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0312 : Poly :=
[
  term ((-744038307 : Rat) / 21337981) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1488076614 : Rat) / 21337981) [(8, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0312_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0312
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0313 : Poly :=
[
  term ((9318768 : Rat) / 435469) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 313 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0313 : Poly :=
[
  term ((-9318768 : Rat) / 435469) [(8, 1), (13, 1), (15, 1)],
  term ((18637536 : Rat) / 435469) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0313_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0313
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0314 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(8, 1), (13, 1), (15, 3)]
]

/-- Partial product 314 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0314 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(8, 1), (13, 1), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(8, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0314_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0314
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0315 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(8, 1), (13, 2)]
]

/-- Partial product 315 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0315 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(8, 1), (13, 2)],
  term ((-35506406 : Rat) / 21337981) [(8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0315_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0315
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0316 : Poly :=
[
  term ((-147205635 : Rat) / 42675962) [(8, 1), (14, 1)]
]

/-- Partial product 316 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0316 : Poly :=
[
  term ((147205635 : Rat) / 42675962) [(8, 1), (14, 1)],
  term ((-147205635 : Rat) / 21337981) [(8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0316_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0316
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0317 : Poly :=
[
  term ((23498213 : Rat) / 42675962) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 317 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0317 : Poly :=
[
  term ((23498213 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-23498213 : Rat) / 42675962) [(9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0317_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0317
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0318 : Poly :=
[
  term ((-744038307 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 318 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0318 : Poly :=
[
  term ((-1488076614 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((744038307 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0318_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0318
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0319 : Poly :=
[
  term ((-309413997 : Rat) / 21337981) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 319 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0319 : Poly :=
[
  term ((-618827994 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((309413997 : Rat) / 21337981) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0319_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0319
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0320 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 320 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0320 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0320_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0320
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0321 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(9, 1), (13, 1)]
]

/-- Partial product 321 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0321 : Poly :=
[
  term ((35506406 : Rat) / 21337981) [(8, 1), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0321_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0321
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0322 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 322 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0322 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0322_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0322
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0323 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 323 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0323 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0323_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0323
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0324 : Poly :=
[
  term ((-1262700597 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 324 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0324 : Poly :=
[
  term ((-2525401194 : Rat) / 21337981) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1262700597 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0324_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0324
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0325 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0325 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0325_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0325
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0326 : Poly :=
[
  term ((17769393 : Rat) / 3048283) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 326 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0326 : Poly :=
[
  term ((35538786 : Rat) / 3048283) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-17769393 : Rat) / 3048283) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0326_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0326
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0327 : Poly :=
[
  term ((-742211319 : Rat) / 42675962) [(9, 1), (15, 1)]
]

/-- Partial product 327 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0327 : Poly :=
[
  term ((-742211319 : Rat) / 21337981) [(8, 1), (9, 1), (15, 1)],
  term ((742211319 : Rat) / 42675962) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0327_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0327
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0328 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0328 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0328_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0328
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0329 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(9, 1), (15, 3)]
]

/-- Partial product 329 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0329 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(8, 1), (9, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0329_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0329
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0330 : Poly :=
[
  term ((-135197442 : Rat) / 21337981) [(9, 2)]
]

/-- Partial product 330 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0330 : Poly :=
[
  term ((-270394884 : Rat) / 21337981) [(8, 1), (9, 2)],
  term ((135197442 : Rat) / 21337981) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0330_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0330
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0331 : Poly :=
[
  term ((-348102729 : Rat) / 42675962) [(10, 1)]
]

/-- Partial product 331 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0331 : Poly :=
[
  term ((-348102729 : Rat) / 21337981) [(8, 1), (10, 1)],
  term ((348102729 : Rat) / 42675962) [(10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0331_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0331
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0332 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 332 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0332 : Poly :=
[
  term ((197559972 : Rat) / 3048283) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0332_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0332
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0333 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0333 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0333_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0333
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0334 : Poly :=
[
  term ((-17769393 : Rat) / 3048283) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 334 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0334 : Poly :=
[
  term ((-35538786 : Rat) / 3048283) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((17769393 : Rat) / 3048283) [(10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0334_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0334
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0335 : Poly :=
[
  term ((-93198381 : Rat) / 21337981) [(10, 1), (15, 2)]
]

/-- Partial product 335 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0335 : Poly :=
[
  term ((-186396762 : Rat) / 21337981) [(8, 1), (10, 1), (15, 2)],
  term ((93198381 : Rat) / 21337981) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0335_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0335
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0336 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 336 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0336 : Poly :=
[
  term ((-142964775 : Rat) / 21337981) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0336_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0336
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0337 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 337 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0337 : Poly :=
[
  term ((-98779986 : Rat) / 3048283) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0337_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0337
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0338 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 338 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0338 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0338_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0338
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0339 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(11, 1), (15, 3)]
]

/-- Partial product 339 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0339 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(8, 1), (11, 1), (15, 3)],
  term ((-49389993 : Rat) / 3048283) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0339_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0339
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0340 : Poly :=
[
  term ((-47514599 : Rat) / 170703848) [(12, 1)]
]

/-- Partial product 340 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0340 : Poly :=
[
  term ((-47514599 : Rat) / 85351924) [(8, 1), (12, 1)],
  term ((47514599 : Rat) / 170703848) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0340_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0340
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0341 : Poly :=
[
  term ((44139420 : Rat) / 21337981) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 341 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0341 : Poly :=
[
  term ((88278840 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-44139420 : Rat) / 21337981) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0341_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0341
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0342 : Poly :=
[
  term ((271418583 : Rat) / 42675962) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 342 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0342 : Poly :=
[
  term ((271418583 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-271418583 : Rat) / 42675962) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0342_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0342
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0343 : Poly :=
[
  term ((-80358989 : Rat) / 21337981) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0343 : Poly :=
[
  term ((-160717978 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((80358989 : Rat) / 21337981) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0343_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0343
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0344 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 344 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0344 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0344_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0344
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0345 : Poly :=
[
  term ((12008193 : Rat) / 85351924) [(12, 1), (14, 1)]
]

/-- Partial product 345 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0345 : Poly :=
[
  term ((12008193 : Rat) / 42675962) [(8, 1), (12, 1), (14, 1)],
  term ((-12008193 : Rat) / 85351924) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0345_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0345
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0346 : Poly :=
[
  term ((17769393 : Rat) / 3048283) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 346 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0346 : Poly :=
[
  term ((35538786 : Rat) / 3048283) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-17769393 : Rat) / 3048283) [(12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0346_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0346
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0347 : Poly :=
[
  term ((-443470227 : Rat) / 42675962) [(12, 1), (15, 2)]
]

/-- Partial product 347 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0347 : Poly :=
[
  term ((-443470227 : Rat) / 21337981) [(8, 1), (12, 1), (15, 2)],
  term ((443470227 : Rat) / 42675962) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0347_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0347
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0348 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 348 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0348 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0348_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0348
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0349 : Poly :=
[
  term ((-325707777 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 349 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0349 : Poly :=
[
  term ((-325707777 : Rat) / 21337981) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((325707777 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0349_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0349
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0350 : Poly :=
[
  term ((76543767 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 350 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0350 : Poly :=
[
  term ((153087534 : Rat) / 21337981) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0350_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0350
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0351 : Poly :=
[
  term ((144316215 : Rat) / 21337981) [(13, 1), (15, 1)]
]

/-- Partial product 351 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0351 : Poly :=
[
  term ((288632430 : Rat) / 21337981) [(8, 1), (13, 1), (15, 1)],
  term ((-144316215 : Rat) / 21337981) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0351_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0351
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0352 : Poly :=
[
  term ((-303682753 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0352 : Poly :=
[
  term ((-303682753 : Rat) / 42675962) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((303682753 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0352_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0352
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0353 : Poly :=
[
  term ((-1508491296 : Rat) / 21337981) [(13, 1), (15, 3)]
]

/-- Partial product 353 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0353 : Poly :=
[
  term ((-3016982592 : Rat) / 21337981) [(8, 1), (13, 1), (15, 3)],
  term ((1508491296 : Rat) / 21337981) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0353_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0353
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0354 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(13, 2)]
]

/-- Partial product 354 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0354 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(8, 1), (13, 2)],
  term ((17753203 : Rat) / 42675962) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0354_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0354
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0355 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(13, 2), (16, 1)]
]

/-- Partial product 355 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0355 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(8, 1), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0355_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0355
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0356 : Poly :=
[
  term ((264241647 : Rat) / 21337981) [(14, 1)]
]

/-- Partial product 356 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0356 : Poly :=
[
  term ((528483294 : Rat) / 21337981) [(8, 1), (14, 1)],
  term ((-264241647 : Rat) / 21337981) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0356_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0356
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0357 : Poly :=
[
  term ((-15810300 : Rat) / 3048283) [(14, 1), (15, 2)]
]

/-- Partial product 357 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0357 : Poly :=
[
  term ((-31620600 : Rat) / 3048283) [(8, 1), (14, 1), (15, 2)],
  term ((15810300 : Rat) / 3048283) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0357_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0357
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0358 : Poly :=
[
  term ((-342524349 : Rat) / 85351924) [(14, 2)]
]

/-- Partial product 358 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0358 : Poly :=
[
  term ((-342524349 : Rat) / 42675962) [(8, 1), (14, 2)],
  term ((342524349 : Rat) / 85351924) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0358_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0358
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0359 : Poly :=
[
  term ((-40718556 : Rat) / 3048283) [(14, 2), (15, 2)]
]

/-- Partial product 359 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0359 : Poly :=
[
  term ((-81437112 : Rat) / 3048283) [(8, 1), (14, 2), (15, 2)],
  term ((40718556 : Rat) / 3048283) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0359_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0359
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0360 : Poly :=
[
  term ((387365709 : Rat) / 85351924) [(15, 2)]
]

/-- Partial product 360 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0360 : Poly :=
[
  term ((387365709 : Rat) / 42675962) [(8, 1), (15, 2)],
  term ((-387365709 : Rat) / 85351924) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0360_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0360
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0361 : Poly :=
[
  term ((142964775 : Rat) / 85351924) [(15, 2), (16, 1)]
]

/-- Partial product 361 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0361 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(8, 1), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0361_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0361
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YYYNN_coefficient_19_0362 : Poly :=
[
  term ((-40718556 : Rat) / 3048283) [(15, 4)]
]

/-- Partial product 362 for generator 19. -/
def rs_R009_ueqv_R009YYYNN_partial_19_0362 : Poly :=
[
  term ((-81437112 : Rat) / 3048283) [(8, 1), (15, 4)],
  term ((40718556 : Rat) / 3048283) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 19. -/
theorem rs_R009_ueqv_R009YYYNN_partial_19_0362_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_19_0362
        rs_R009_ueqv_R009YYYNN_generator_19_0300_0362 =
      rs_R009_ueqv_R009YYYNN_partial_19_0362 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_19_0300_0362 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_19_0300,
  rs_R009_ueqv_R009YYYNN_partial_19_0301,
  rs_R009_ueqv_R009YYYNN_partial_19_0302,
  rs_R009_ueqv_R009YYYNN_partial_19_0303,
  rs_R009_ueqv_R009YYYNN_partial_19_0304,
  rs_R009_ueqv_R009YYYNN_partial_19_0305,
  rs_R009_ueqv_R009YYYNN_partial_19_0306,
  rs_R009_ueqv_R009YYYNN_partial_19_0307,
  rs_R009_ueqv_R009YYYNN_partial_19_0308,
  rs_R009_ueqv_R009YYYNN_partial_19_0309,
  rs_R009_ueqv_R009YYYNN_partial_19_0310,
  rs_R009_ueqv_R009YYYNN_partial_19_0311,
  rs_R009_ueqv_R009YYYNN_partial_19_0312,
  rs_R009_ueqv_R009YYYNN_partial_19_0313,
  rs_R009_ueqv_R009YYYNN_partial_19_0314,
  rs_R009_ueqv_R009YYYNN_partial_19_0315,
  rs_R009_ueqv_R009YYYNN_partial_19_0316,
  rs_R009_ueqv_R009YYYNN_partial_19_0317,
  rs_R009_ueqv_R009YYYNN_partial_19_0318,
  rs_R009_ueqv_R009YYYNN_partial_19_0319,
  rs_R009_ueqv_R009YYYNN_partial_19_0320,
  rs_R009_ueqv_R009YYYNN_partial_19_0321,
  rs_R009_ueqv_R009YYYNN_partial_19_0322,
  rs_R009_ueqv_R009YYYNN_partial_19_0323,
  rs_R009_ueqv_R009YYYNN_partial_19_0324,
  rs_R009_ueqv_R009YYYNN_partial_19_0325,
  rs_R009_ueqv_R009YYYNN_partial_19_0326,
  rs_R009_ueqv_R009YYYNN_partial_19_0327,
  rs_R009_ueqv_R009YYYNN_partial_19_0328,
  rs_R009_ueqv_R009YYYNN_partial_19_0329,
  rs_R009_ueqv_R009YYYNN_partial_19_0330,
  rs_R009_ueqv_R009YYYNN_partial_19_0331,
  rs_R009_ueqv_R009YYYNN_partial_19_0332,
  rs_R009_ueqv_R009YYYNN_partial_19_0333,
  rs_R009_ueqv_R009YYYNN_partial_19_0334,
  rs_R009_ueqv_R009YYYNN_partial_19_0335,
  rs_R009_ueqv_R009YYYNN_partial_19_0336,
  rs_R009_ueqv_R009YYYNN_partial_19_0337,
  rs_R009_ueqv_R009YYYNN_partial_19_0338,
  rs_R009_ueqv_R009YYYNN_partial_19_0339,
  rs_R009_ueqv_R009YYYNN_partial_19_0340,
  rs_R009_ueqv_R009YYYNN_partial_19_0341,
  rs_R009_ueqv_R009YYYNN_partial_19_0342,
  rs_R009_ueqv_R009YYYNN_partial_19_0343,
  rs_R009_ueqv_R009YYYNN_partial_19_0344,
  rs_R009_ueqv_R009YYYNN_partial_19_0345,
  rs_R009_ueqv_R009YYYNN_partial_19_0346,
  rs_R009_ueqv_R009YYYNN_partial_19_0347,
  rs_R009_ueqv_R009YYYNN_partial_19_0348,
  rs_R009_ueqv_R009YYYNN_partial_19_0349,
  rs_R009_ueqv_R009YYYNN_partial_19_0350,
  rs_R009_ueqv_R009YYYNN_partial_19_0351,
  rs_R009_ueqv_R009YYYNN_partial_19_0352,
  rs_R009_ueqv_R009YYYNN_partial_19_0353,
  rs_R009_ueqv_R009YYYNN_partial_19_0354,
  rs_R009_ueqv_R009YYYNN_partial_19_0355,
  rs_R009_ueqv_R009YYYNN_partial_19_0356,
  rs_R009_ueqv_R009YYYNN_partial_19_0357,
  rs_R009_ueqv_R009YYYNN_partial_19_0358,
  rs_R009_ueqv_R009YYYNN_partial_19_0359,
  rs_R009_ueqv_R009YYYNN_partial_19_0360,
  rs_R009_ueqv_R009YYYNN_partial_19_0361,
  rs_R009_ueqv_R009YYYNN_partial_19_0362
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_19_0300_0362 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((1811164212 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9914440896 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-53259609 : Rat) / 21337981) [(5, 1), (8, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((1858957668 : Rat) / 21337981) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((1048546881 : Rat) / 21337981) [(5, 1), (8, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6196525560 : Rat) / 21337981) [(5, 1), (8, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-905582106 : Rat) / 21337981) [(5, 1), (12, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(5, 1), (12, 1), (15, 3)],
  term ((53259609 : Rat) / 42675962) [(5, 1), (13, 1)],
  term ((-17753203 : Rat) / 85351924) [(5, 1), (13, 1), (16, 1)],
  term ((-929478834 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 2), (15, 1)],
  term ((-1048546881 : Rat) / 42675962) [(5, 1), (15, 1)],
  term ((142964775 : Rat) / 85351924) [(5, 1), (15, 1), (16, 1)],
  term ((3098262780 : Rat) / 21337981) [(5, 1), (15, 3)],
  term ((-576814347 : Rat) / 170703848) [(8, 1)],
  term ((23498213 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1488076614 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-618827994 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((4957220448 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((35506406 : Rat) / 21337981) [(8, 1), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2525401194 : Rat) / 21337981) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35538786 : Rat) / 3048283) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-742211319 : Rat) / 21337981) [(8, 1), (9, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(8, 1), (9, 1), (15, 3)],
  term ((-270394884 : Rat) / 21337981) [(8, 1), (9, 2)],
  term ((-348102729 : Rat) / 21337981) [(8, 1), (10, 1)],
  term ((197559972 : Rat) / 3048283) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((17753203 : Rat) / 21337981) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35538786 : Rat) / 3048283) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-186396762 : Rat) / 21337981) [(8, 1), (10, 1), (15, 2)],
  term ((-142964775 : Rat) / 21337981) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-98779986 : Rat) / 3048283) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(8, 1), (11, 1), (15, 3)],
  term ((-47514599 : Rat) / 85351924) [(8, 1), (12, 1)],
  term ((88278840 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((271418583 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-160717978 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((12008193 : Rat) / 42675962) [(8, 1), (12, 1), (14, 1)],
  term ((35538786 : Rat) / 3048283) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-443470227 : Rat) / 21337981) [(8, 1), (12, 1), (15, 2)],
  term ((142964775 : Rat) / 21337981) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1069746084 : Rat) / 21337981) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((153087534 : Rat) / 21337981) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-167987202 : Rat) / 21337981) [(8, 1), (13, 1), (15, 1)],
  term ((-303682753 : Rat) / 42675962) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-538372368 : Rat) / 21337981) [(8, 1), (13, 1), (15, 3)],
  term ((17753203 : Rat) / 21337981) [(8, 1), (13, 2), (16, 1)],
  term ((1204172223 : Rat) / 42675962) [(8, 1), (14, 1)],
  term ((-31620600 : Rat) / 3048283) [(8, 1), (14, 1), (15, 2)],
  term ((-342524349 : Rat) / 42675962) [(8, 1), (14, 2)],
  term ((-81437112 : Rat) / 3048283) [(8, 1), (14, 2), (15, 2)],
  term ((387365709 : Rat) / 42675962) [(8, 1), (15, 2)],
  term ((142964775 : Rat) / 42675962) [(8, 1), (15, 2), (16, 1)],
  term ((-81437112 : Rat) / 3048283) [(8, 1), (15, 4)],
  term ((576814347 : Rat) / 85351924) [(8, 2)],
  term ((1488076614 : Rat) / 21337981) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((18637536 : Rat) / 435469) [(8, 2), (13, 1), (15, 1)],
  term ((-4957220448 : Rat) / 21337981) [(8, 2), (13, 1), (15, 3)],
  term ((-35506406 : Rat) / 21337981) [(8, 2), (13, 2)],
  term ((-147205635 : Rat) / 21337981) [(8, 2), (14, 1)],
  term ((-23498213 : Rat) / 42675962) [(9, 1), (12, 1), (13, 1)],
  term ((744038307 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((309413997 : Rat) / 21337981) [(9, 1), (12, 1), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(9, 1), (12, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(9, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (16, 1)],
  term ((1262700597 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(9, 1), (14, 2), (15, 1)],
  term ((742211319 : Rat) / 42675962) [(9, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(9, 1), (15, 3)],
  term ((135197442 : Rat) / 21337981) [(9, 2)],
  term ((348102729 : Rat) / 42675962) [(10, 1)],
  term ((-98779986 : Rat) / 3048283) [(10, 1), (11, 1), (15, 1)],
  term ((-17753203 : Rat) / 42675962) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((17769393 : Rat) / 3048283) [(10, 1), (14, 1), (15, 2)],
  term ((93198381 : Rat) / 21337981) [(10, 1), (15, 2)],
  term ((142964775 : Rat) / 42675962) [(10, 1), (15, 2), (16, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(11, 1), (15, 3)],
  term ((47514599 : Rat) / 170703848) [(12, 1)],
  term ((-44139420 : Rat) / 21337981) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-271418583 : Rat) / 42675962) [(12, 1), (13, 1), (15, 1)],
  term ((80358989 : Rat) / 21337981) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(12, 1), (13, 2), (16, 1)],
  term ((-12008193 : Rat) / 85351924) [(12, 1), (14, 1)],
  term ((-17769393 : Rat) / 3048283) [(12, 1), (14, 1), (15, 2)],
  term ((443470227 : Rat) / 42675962) [(12, 1), (15, 2)],
  term ((-142964775 : Rat) / 42675962) [(12, 1), (15, 2), (16, 1)],
  term ((325707777 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)],
  term ((-144316215 : Rat) / 21337981) [(13, 1), (15, 1)],
  term ((303682753 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)],
  term ((1508491296 : Rat) / 21337981) [(13, 1), (15, 3)],
  term ((17753203 : Rat) / 42675962) [(13, 2)],
  term ((-17753203 : Rat) / 42675962) [(13, 2), (16, 1)],
  term ((-264241647 : Rat) / 21337981) [(14, 1)],
  term ((15810300 : Rat) / 3048283) [(14, 1), (15, 2)],
  term ((342524349 : Rat) / 85351924) [(14, 2)],
  term ((40718556 : Rat) / 3048283) [(14, 2), (15, 2)],
  term ((-387365709 : Rat) / 85351924) [(15, 2)],
  term ((-142964775 : Rat) / 85351924) [(15, 2), (16, 1)],
  term ((40718556 : Rat) / 3048283) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 300 through 362. -/
theorem rs_R009_ueqv_R009YYYNN_block_19_0300_0362_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_19_0300_0362
      rs_R009_ueqv_R009YYYNN_block_19_0300_0362 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
