/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 18:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_18_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0300 : Poly :=
[
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 300 for generator 18. -/
def ep_Q1_028_partial_18_0300 : Poly :=
[
  term ((16 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 18. -/
theorem ep_Q1_028_partial_18_0300_valid :
    mulPoly ep_Q1_028_coefficient_18_0300
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0301 : Poly :=
[
  term ((56 : Rat) / 15) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 18. -/
def ep_Q1_028_partial_18_0301 : Poly :=
[
  term ((112 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-56 : Rat) / 15) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 18. -/
theorem ep_Q1_028_partial_18_0301_valid :
    mulPoly ep_Q1_028_coefficient_18_0301
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0302 : Poly :=
[
  term ((-448 : Rat) / 15) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 18. -/
def ep_Q1_028_partial_18_0302 : Poly :=
[
  term ((-896 : Rat) / 15) [(7, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 18. -/
theorem ep_Q1_028_partial_18_0302_valid :
    mulPoly ep_Q1_028_coefficient_18_0302
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0303 : Poly :=
[
  term ((224 : Rat) / 5) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 18. -/
def ep_Q1_028_partial_18_0303 : Poly :=
[
  term ((448 : Rat) / 5) [(7, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 5) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 18. -/
theorem ep_Q1_028_partial_18_0303_valid :
    mulPoly ep_Q1_028_coefficient_18_0303
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0304 : Poly :=
[
  term ((-112 : Rat) / 15) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 18. -/
def ep_Q1_028_partial_18_0304 : Poly :=
[
  term ((-224 : Rat) / 15) [(7, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 15) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 18. -/
theorem ep_Q1_028_partial_18_0304_valid :
    mulPoly ep_Q1_028_coefficient_18_0304
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0305 : Poly :=
[
  term ((-496 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 18. -/
def ep_Q1_028_partial_18_0305 : Poly :=
[
  term ((-992 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((496 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 18. -/
theorem ep_Q1_028_partial_18_0305_valid :
    mulPoly ep_Q1_028_coefficient_18_0305
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0306 : Poly :=
[
  term ((496 : Rat) / 15) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 306 for generator 18. -/
def ep_Q1_028_partial_18_0306 : Poly :=
[
  term ((992 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-496 : Rat) / 15) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 18. -/
theorem ep_Q1_028_partial_18_0306_valid :
    mulPoly ep_Q1_028_coefficient_18_0306
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0307 : Poly :=
[
  term ((-32 : Rat) / 5) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 307 for generator 18. -/
def ep_Q1_028_partial_18_0307 : Poly :=
[
  term ((-64 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 5) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 18. -/
theorem ep_Q1_028_partial_18_0307_valid :
    mulPoly ep_Q1_028_coefficient_18_0307
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0308 : Poly :=
[
  term ((36 : Rat) / 5) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 308 for generator 18. -/
def ep_Q1_028_partial_18_0308 : Poly :=
[
  term ((72 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 18. -/
theorem ep_Q1_028_partial_18_0308_valid :
    mulPoly ep_Q1_028_coefficient_18_0308
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0309 : Poly :=
[
  term ((-448 : Rat) / 15) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 18. -/
def ep_Q1_028_partial_18_0309 : Poly :=
[
  term ((-896 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 18. -/
theorem ep_Q1_028_partial_18_0309_valid :
    mulPoly ep_Q1_028_coefficient_18_0309
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0310 : Poly :=
[
  term ((16 : Rat) / 5) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 18. -/
def ep_Q1_028_partial_18_0310 : Poly :=
[
  term ((32 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 18. -/
theorem ep_Q1_028_partial_18_0310_valid :
    mulPoly ep_Q1_028_coefficient_18_0310
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0311 : Poly :=
[
  term ((274 : Rat) / 15) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 18. -/
def ep_Q1_028_partial_18_0311 : Poly :=
[
  term ((548 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-274 : Rat) / 15) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 18. -/
theorem ep_Q1_028_partial_18_0311_valid :
    mulPoly ep_Q1_028_coefficient_18_0311
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0312 : Poly :=
[
  term ((248 : Rat) / 15) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 312 for generator 18. -/
def ep_Q1_028_partial_18_0312 : Poly :=
[
  term ((496 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-248 : Rat) / 15) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 18. -/
theorem ep_Q1_028_partial_18_0312_valid :
    mulPoly ep_Q1_028_coefficient_18_0312
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0313 : Poly :=
[
  term ((448 : Rat) / 15) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 18. -/
def ep_Q1_028_partial_18_0313 : Poly :=
[
  term ((896 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 18. -/
theorem ep_Q1_028_partial_18_0313_valid :
    mulPoly ep_Q1_028_coefficient_18_0313
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0314 : Poly :=
[
  term ((32 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 314 for generator 18. -/
def ep_Q1_028_partial_18_0314 : Poly :=
[
  term ((64 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 18. -/
theorem ep_Q1_028_partial_18_0314_valid :
    mulPoly ep_Q1_028_coefficient_18_0314
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0315 : Poly :=
[
  term ((-112 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 315 for generator 18. -/
def ep_Q1_028_partial_18_0315 : Poly :=
[
  term ((-224 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((112 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 18. -/
theorem ep_Q1_028_partial_18_0315_valid :
    mulPoly ep_Q1_028_coefficient_18_0315
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0316 : Poly :=
[
  term ((-36 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 316 for generator 18. -/
def ep_Q1_028_partial_18_0316 : Poly :=
[
  term ((-72 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((36 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 18. -/
theorem ep_Q1_028_partial_18_0316_valid :
    mulPoly ep_Q1_028_coefficient_18_0316
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0317 : Poly :=
[
  term ((112 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 18. -/
def ep_Q1_028_partial_18_0317 : Poly :=
[
  term ((224 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 18. -/
theorem ep_Q1_028_partial_18_0317_valid :
    mulPoly ep_Q1_028_coefficient_18_0317
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0318 : Poly :=
[
  term ((292 : Rat) / 15) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 18. -/
def ep_Q1_028_partial_18_0318 : Poly :=
[
  term ((584 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-292 : Rat) / 15) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 18. -/
theorem ep_Q1_028_partial_18_0318_valid :
    mulPoly ep_Q1_028_coefficient_18_0318
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0319 : Poly :=
[
  term ((-248 : Rat) / 15) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 18. -/
def ep_Q1_028_partial_18_0319 : Poly :=
[
  term ((-496 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((248 : Rat) / 15) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 18. -/
theorem ep_Q1_028_partial_18_0319_valid :
    mulPoly ep_Q1_028_coefficient_18_0319
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0320 : Poly :=
[
  term ((-62 : Rat) / 5) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 320 for generator 18. -/
def ep_Q1_028_partial_18_0320 : Poly :=
[
  term ((-124 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((62 : Rat) / 5) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 18. -/
theorem ep_Q1_028_partial_18_0320_valid :
    mulPoly ep_Q1_028_coefficient_18_0320
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0321 : Poly :=
[
  term ((-16 : Rat) / 5) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 321 for generator 18. -/
def ep_Q1_028_partial_18_0321 : Poly :=
[
  term ((-32 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 5) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 18. -/
theorem ep_Q1_028_partial_18_0321_valid :
    mulPoly ep_Q1_028_coefficient_18_0321
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0322 : Poly :=
[
  term ((-62 : Rat) / 15) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 322 for generator 18. -/
def ep_Q1_028_partial_18_0322 : Poly :=
[
  term ((-124 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((62 : Rat) / 15) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 18. -/
theorem ep_Q1_028_partial_18_0322_valid :
    mulPoly ep_Q1_028_coefficient_18_0322
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0323 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 323 for generator 18. -/
def ep_Q1_028_partial_18_0323 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((6 : Rat) / 5) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 18. -/
theorem ep_Q1_028_partial_18_0323_valid :
    mulPoly ep_Q1_028_coefficient_18_0323
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0324 : Poly :=
[
  term ((496 : Rat) / 5) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 18. -/
def ep_Q1_028_partial_18_0324 : Poly :=
[
  term ((992 : Rat) / 5) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-496 : Rat) / 5) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 18. -/
theorem ep_Q1_028_partial_18_0324_valid :
    mulPoly ep_Q1_028_coefficient_18_0324
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0325 : Poly :=
[
  term ((-496 : Rat) / 15) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 18. -/
def ep_Q1_028_partial_18_0325 : Poly :=
[
  term ((-992 : Rat) / 15) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((496 : Rat) / 15) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 18. -/
theorem ep_Q1_028_partial_18_0325_valid :
    mulPoly ep_Q1_028_coefficient_18_0325
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0326 : Poly :=
[
  term ((-248 : Rat) / 15) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 18. -/
def ep_Q1_028_partial_18_0326 : Poly :=
[
  term ((-496 : Rat) / 15) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((248 : Rat) / 15) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 18. -/
theorem ep_Q1_028_partial_18_0326_valid :
    mulPoly ep_Q1_028_coefficient_18_0326
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0327 : Poly :=
[
  term ((-256 : Rat) / 15) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 327 for generator 18. -/
def ep_Q1_028_partial_18_0327 : Poly :=
[
  term ((-512 : Rat) / 15) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 18. -/
theorem ep_Q1_028_partial_18_0327_valid :
    mulPoly ep_Q1_028_coefficient_18_0327
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0328 : Poly :=
[
  term ((112 : Rat) / 5) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 18. -/
def ep_Q1_028_partial_18_0328 : Poly :=
[
  term ((224 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112 : Rat) / 5) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 18. -/
theorem ep_Q1_028_partial_18_0328_valid :
    mulPoly ep_Q1_028_coefficient_18_0328
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0329 : Poly :=
[
  term ((116 : Rat) / 15) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 18. -/
def ep_Q1_028_partial_18_0329 : Poly :=
[
  term ((232 : Rat) / 15) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 15) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 18. -/
theorem ep_Q1_028_partial_18_0329_valid :
    mulPoly ep_Q1_028_coefficient_18_0329
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0330 : Poly :=
[
  term ((-104 : Rat) / 5) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 330 for generator 18. -/
def ep_Q1_028_partial_18_0330 : Poly :=
[
  term ((-208 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((104 : Rat) / 5) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 18. -/
theorem ep_Q1_028_partial_18_0330_valid :
    mulPoly ep_Q1_028_coefficient_18_0330
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0331 : Poly :=
[
  term ((104 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 18. -/
def ep_Q1_028_partial_18_0331 : Poly :=
[
  term ((208 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-104 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 18. -/
theorem ep_Q1_028_partial_18_0331_valid :
    mulPoly ep_Q1_028_coefficient_18_0331
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0332 : Poly :=
[
  term ((-76 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 332 for generator 18. -/
def ep_Q1_028_partial_18_0332 : Poly :=
[
  term ((-152 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 18. -/
theorem ep_Q1_028_partial_18_0332_valid :
    mulPoly ep_Q1_028_coefficient_18_0332
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0333 : Poly :=
[
  term ((32 : Rat) / 15) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 18. -/
def ep_Q1_028_partial_18_0333 : Poly :=
[
  term ((64 : Rat) / 15) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 18. -/
theorem ep_Q1_028_partial_18_0333_valid :
    mulPoly ep_Q1_028_coefficient_18_0333
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0334 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 334 for generator 18. -/
def ep_Q1_028_partial_18_0334 : Poly :=
[
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 18. -/
theorem ep_Q1_028_partial_18_0334_valid :
    mulPoly ep_Q1_028_coefficient_18_0334
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0335 : Poly :=
[
  term ((256 : Rat) / 15) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 18. -/
def ep_Q1_028_partial_18_0335 : Poly :=
[
  term ((512 : Rat) / 15) [(7, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 18. -/
theorem ep_Q1_028_partial_18_0335_valid :
    mulPoly ep_Q1_028_coefficient_18_0335
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0336 : Poly :=
[
  term ((112 : Rat) / 15) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 18. -/
def ep_Q1_028_partial_18_0336 : Poly :=
[
  term ((224 : Rat) / 15) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-112 : Rat) / 15) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 18. -/
theorem ep_Q1_028_partial_18_0336_valid :
    mulPoly ep_Q1_028_coefficient_18_0336
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0337 : Poly :=
[
  term ((-8 : Rat) / 15) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 18. -/
def ep_Q1_028_partial_18_0337 : Poly :=
[
  term ((-16 : Rat) / 15) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 15) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 18. -/
theorem ep_Q1_028_partial_18_0337_valid :
    mulPoly ep_Q1_028_coefficient_18_0337
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0338 : Poly :=
[
  term ((-88 : Rat) / 15) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 18. -/
def ep_Q1_028_partial_18_0338 : Poly :=
[
  term ((-176 : Rat) / 15) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((88 : Rat) / 15) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 18. -/
theorem ep_Q1_028_partial_18_0338_valid :
    mulPoly ep_Q1_028_coefficient_18_0338
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0339 : Poly :=
[
  term ((48 : Rat) / 5) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 18. -/
def ep_Q1_028_partial_18_0339 : Poly :=
[
  term ((96 : Rat) / 5) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 18. -/
theorem ep_Q1_028_partial_18_0339_valid :
    mulPoly ep_Q1_028_coefficient_18_0339
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0340 : Poly :=
[
  term ((-4928 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 340 for generator 18. -/
def ep_Q1_028_partial_18_0340 : Poly :=
[
  term ((4928 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9856 : Rat) / 15) [(7, 2), (8, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 18. -/
theorem ep_Q1_028_partial_18_0340_valid :
    mulPoly ep_Q1_028_coefficient_18_0340
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0341 : Poly :=
[
  term ((2464 : Rat) / 5) [(7, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 341 for generator 18. -/
def ep_Q1_028_partial_18_0341 : Poly :=
[
  term ((-2464 : Rat) / 5) [(7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((4928 : Rat) / 5) [(7, 2), (8, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 18. -/
theorem ep_Q1_028_partial_18_0341_valid :
    mulPoly ep_Q1_028_coefficient_18_0341
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0342 : Poly :=
[
  term ((-1232 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 18. -/
def ep_Q1_028_partial_18_0342 : Poly :=
[
  term ((1232 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2464 : Rat) / 15) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 18. -/
theorem ep_Q1_028_partial_18_0342_valid :
    mulPoly ep_Q1_028_coefficient_18_0342
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0343 : Poly :=
[
  term ((-176 : Rat) / 3) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 343 for generator 18. -/
def ep_Q1_028_partial_18_0343 : Poly :=
[
  term ((176 : Rat) / 3) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 18. -/
theorem ep_Q1_028_partial_18_0343_valid :
    mulPoly ep_Q1_028_coefficient_18_0343
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0344 : Poly :=
[
  term ((88 : Rat) / 3) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 344 for generator 18. -/
def ep_Q1_028_partial_18_0344 : Poly :=
[
  term ((-88 : Rat) / 3) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 18. -/
theorem ep_Q1_028_partial_18_0344_valid :
    mulPoly ep_Q1_028_coefficient_18_0344
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0345 : Poly :=
[
  term ((352 : Rat) / 3) [(7, 2), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 345 for generator 18. -/
def ep_Q1_028_partial_18_0345 : Poly :=
[
  term ((-352 : Rat) / 3) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (8, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 18. -/
theorem ep_Q1_028_partial_18_0345_valid :
    mulPoly ep_Q1_028_coefficient_18_0345
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0346 : Poly :=
[
  term ((-704 : Rat) / 15) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 18. -/
def ep_Q1_028_partial_18_0346 : Poly :=
[
  term ((704 : Rat) / 15) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 18. -/
theorem ep_Q1_028_partial_18_0346_valid :
    mulPoly ep_Q1_028_coefficient_18_0346
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0347 : Poly :=
[
  term ((-2464 : Rat) / 15) [(7, 2), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 347 for generator 18. -/
def ep_Q1_028_partial_18_0347 : Poly :=
[
  term ((2464 : Rat) / 15) [(7, 2), (8, 1), (13, 2), (16, 1)],
  term ((-4928 : Rat) / 15) [(7, 2), (8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 18. -/
theorem ep_Q1_028_partial_18_0347_valid :
    mulPoly ep_Q1_028_coefficient_18_0347
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0348 : Poly :=
[
  term ((-352 : Rat) / 3) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 348 for generator 18. -/
def ep_Q1_028_partial_18_0348 : Poly :=
[
  term ((-704 : Rat) / 3) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 18. -/
theorem ep_Q1_028_partial_18_0348_valid :
    mulPoly ep_Q1_028_coefficient_18_0348
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0349 : Poly :=
[
  term ((-16544 : Rat) / 15) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 349 for generator 18. -/
def ep_Q1_028_partial_18_0349 : Poly :=
[
  term ((-33088 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((16544 : Rat) / 15) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 18. -/
theorem ep_Q1_028_partial_18_0349_valid :
    mulPoly ep_Q1_028_coefficient_18_0349
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0350 : Poly :=
[
  term ((4928 : Rat) / 15) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 18. -/
def ep_Q1_028_partial_18_0350 : Poly :=
[
  term ((9856 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 18. -/
theorem ep_Q1_028_partial_18_0350_valid :
    mulPoly ep_Q1_028_coefficient_18_0350
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0351 : Poly :=
[
  term ((5808 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 351 for generator 18. -/
def ep_Q1_028_partial_18_0351 : Poly :=
[
  term ((11616 : Rat) / 5) [(7, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5808 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 18. -/
theorem ep_Q1_028_partial_18_0351_valid :
    mulPoly ep_Q1_028_coefficient_18_0351
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0352 : Poly :=
[
  term ((-5368 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 352 for generator 18. -/
def ep_Q1_028_partial_18_0352 : Poly :=
[
  term ((-10736 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((5368 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 18. -/
theorem ep_Q1_028_partial_18_0352_valid :
    mulPoly ep_Q1_028_coefficient_18_0352
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0353 : Poly :=
[
  term ((-2464 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 353 for generator 18. -/
def ep_Q1_028_partial_18_0353 : Poly :=
[
  term ((-4928 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 18. -/
theorem ep_Q1_028_partial_18_0353_valid :
    mulPoly ep_Q1_028_coefficient_18_0353
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0354 : Poly :=
[
  term ((2464 : Rat) / 15) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 354 for generator 18. -/
def ep_Q1_028_partial_18_0354 : Poly :=
[
  term ((4928 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2464 : Rat) / 15) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 18. -/
theorem ep_Q1_028_partial_18_0354_valid :
    mulPoly ep_Q1_028_coefficient_18_0354
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0355 : Poly :=
[
  term ((-3872 : Rat) / 15) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 18. -/
def ep_Q1_028_partial_18_0355 : Poly :=
[
  term ((-7744 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3872 : Rat) / 15) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 18. -/
theorem ep_Q1_028_partial_18_0355_valid :
    mulPoly ep_Q1_028_coefficient_18_0355
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0356 : Poly :=
[
  term ((4576 : Rat) / 15) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 356 for generator 18. -/
def ep_Q1_028_partial_18_0356 : Poly :=
[
  term ((9152 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4576 : Rat) / 15) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 18. -/
theorem ep_Q1_028_partial_18_0356_valid :
    mulPoly ep_Q1_028_coefficient_18_0356
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0357 : Poly :=
[
  term ((1232 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 357 for generator 18. -/
def ep_Q1_028_partial_18_0357 : Poly :=
[
  term ((2464 : Rat) / 5) [(7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1232 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 18. -/
theorem ep_Q1_028_partial_18_0357_valid :
    mulPoly ep_Q1_028_coefficient_18_0357
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0358 : Poly :=
[
  term ((-616 : Rat) / 15) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 18. -/
def ep_Q1_028_partial_18_0358 : Poly :=
[
  term ((-1232 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((616 : Rat) / 15) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 18. -/
theorem ep_Q1_028_partial_18_0358_valid :
    mulPoly ep_Q1_028_coefficient_18_0358
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0359 : Poly :=
[
  term ((4928 : Rat) / 15) [(7, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 359 for generator 18. -/
def ep_Q1_028_partial_18_0359 : Poly :=
[
  term ((9856 : Rat) / 15) [(7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(7, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 18. -/
theorem ep_Q1_028_partial_18_0359_valid :
    mulPoly ep_Q1_028_coefficient_18_0359
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0360 : Poly :=
[
  term ((-2464 : Rat) / 5) [(7, 2), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 360 for generator 18. -/
def ep_Q1_028_partial_18_0360 : Poly :=
[
  term ((-4928 : Rat) / 5) [(7, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((2464 : Rat) / 5) [(7, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 18. -/
theorem ep_Q1_028_partial_18_0360_valid :
    mulPoly ep_Q1_028_coefficient_18_0360
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0361 : Poly :=
[
  term ((1232 : Rat) / 15) [(7, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 361 for generator 18. -/
def ep_Q1_028_partial_18_0361 : Poly :=
[
  term ((2464 : Rat) / 15) [(7, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-1232 : Rat) / 15) [(7, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 18. -/
theorem ep_Q1_028_partial_18_0361_valid :
    mulPoly ep_Q1_028_coefficient_18_0361
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0362 : Poly :=
[
  term (352 : Rat) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 362 for generator 18. -/
def ep_Q1_028_partial_18_0362 : Poly :=
[
  term (704 : Rat) [(7, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-352 : Rat) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 18. -/
theorem ep_Q1_028_partial_18_0362_valid :
    mulPoly ep_Q1_028_coefficient_18_0362
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0363 : Poly :=
[
  term ((-352 : Rat) / 3) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 18. -/
def ep_Q1_028_partial_18_0363 : Poly :=
[
  term ((-704 : Rat) / 3) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 18. -/
theorem ep_Q1_028_partial_18_0363_valid :
    mulPoly ep_Q1_028_coefficient_18_0363
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0364 : Poly :=
[
  term ((4928 : Rat) / 15) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 364 for generator 18. -/
def ep_Q1_028_partial_18_0364 : Poly :=
[
  term ((9856 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-4928 : Rat) / 15) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 18. -/
theorem ep_Q1_028_partial_18_0364_valid :
    mulPoly ep_Q1_028_coefficient_18_0364
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0365 : Poly :=
[
  term ((-176 : Rat) / 3) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 365 for generator 18. -/
def ep_Q1_028_partial_18_0365 : Poly :=
[
  term ((-352 : Rat) / 3) [(7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 18. -/
theorem ep_Q1_028_partial_18_0365_valid :
    mulPoly ep_Q1_028_coefficient_18_0365
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0366 : Poly :=
[
  term ((-196 : Rat) / 3) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 366 for generator 18. -/
def ep_Q1_028_partial_18_0366 : Poly :=
[
  term ((-392 : Rat) / 3) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((196 : Rat) / 3) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 18. -/
theorem ep_Q1_028_partial_18_0366_valid :
    mulPoly ep_Q1_028_coefficient_18_0366
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0367 : Poly :=
[
  term ((-4928 : Rat) / 15) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 367 for generator 18. -/
def ep_Q1_028_partial_18_0367 : Poly :=
[
  term ((-9856 : Rat) / 15) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4928 : Rat) / 15) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 18. -/
theorem ep_Q1_028_partial_18_0367_valid :
    mulPoly ep_Q1_028_coefficient_18_0367
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0368 : Poly :=
[
  term ((-88 : Rat) / 3) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 368 for generator 18. -/
def ep_Q1_028_partial_18_0368 : Poly :=
[
  term ((-176 : Rat) / 3) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((88 : Rat) / 3) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 18. -/
theorem ep_Q1_028_partial_18_0368_valid :
    mulPoly ep_Q1_028_coefficient_18_0368
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0369 : Poly :=
[
  term ((176 : Rat) / 3) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 18. -/
def ep_Q1_028_partial_18_0369 : Poly :=
[
  term ((352 : Rat) / 3) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 18. -/
theorem ep_Q1_028_partial_18_0369_valid :
    mulPoly ep_Q1_028_coefficient_18_0369
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0370 : Poly :=
[
  term ((44 : Rat) / 3) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 18. -/
def ep_Q1_028_partial_18_0370 : Poly :=
[
  term ((88 : Rat) / 3) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44 : Rat) / 3) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 18. -/
theorem ep_Q1_028_partial_18_0370_valid :
    mulPoly ep_Q1_028_coefficient_18_0370
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0371 : Poly :=
[
  term (-352 : Rat) [(7, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 371 for generator 18. -/
def ep_Q1_028_partial_18_0371 : Poly :=
[
  term (-704 : Rat) [(7, 2), (8, 1), (11, 2), (12, 1), (16, 1)],
  term (352 : Rat) [(7, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 18. -/
theorem ep_Q1_028_partial_18_0371_valid :
    mulPoly ep_Q1_028_coefficient_18_0371
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0372 : Poly :=
[
  term ((352 : Rat) / 3) [(7, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 372 for generator 18. -/
def ep_Q1_028_partial_18_0372 : Poly :=
[
  term ((704 : Rat) / 3) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 18. -/
theorem ep_Q1_028_partial_18_0372_valid :
    mulPoly ep_Q1_028_coefficient_18_0372
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0373 : Poly :=
[
  term ((176 : Rat) / 3) [(7, 2), (11, 2), (16, 1)]
]

/-- Partial product 373 for generator 18. -/
def ep_Q1_028_partial_18_0373 : Poly :=
[
  term ((352 : Rat) / 3) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 18. -/
theorem ep_Q1_028_partial_18_0373_valid :
    mulPoly ep_Q1_028_coefficient_18_0373
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0374 : Poly :=
[
  term ((2816 : Rat) / 15) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 18. -/
def ep_Q1_028_partial_18_0374 : Poly :=
[
  term ((5632 : Rat) / 15) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 18. -/
theorem ep_Q1_028_partial_18_0374_valid :
    mulPoly ep_Q1_028_coefficient_18_0374
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0375 : Poly :=
[
  term ((-1232 : Rat) / 5) [(7, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 375 for generator 18. -/
def ep_Q1_028_partial_18_0375 : Poly :=
[
  term ((-2464 : Rat) / 5) [(7, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((1232 : Rat) / 5) [(7, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 18. -/
theorem ep_Q1_028_partial_18_0375_valid :
    mulPoly ep_Q1_028_coefficient_18_0375
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0376 : Poly :=
[
  term ((528 : Rat) / 5) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 376 for generator 18. -/
def ep_Q1_028_partial_18_0376 : Poly :=
[
  term ((1056 : Rat) / 5) [(7, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 18. -/
theorem ep_Q1_028_partial_18_0376_valid :
    mulPoly ep_Q1_028_coefficient_18_0376
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0377 : Poly :=
[
  term ((1232 : Rat) / 15) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 377 for generator 18. -/
def ep_Q1_028_partial_18_0377 : Poly :=
[
  term ((2464 : Rat) / 15) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((-1232 : Rat) / 15) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 18. -/
theorem ep_Q1_028_partial_18_0377_valid :
    mulPoly ep_Q1_028_coefficient_18_0377
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0378 : Poly :=
[
  term ((-528 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 18. -/
def ep_Q1_028_partial_18_0378 : Poly :=
[
  term ((-1056 : Rat) / 5) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((528 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 18. -/
theorem ep_Q1_028_partial_18_0378_valid :
    mulPoly ep_Q1_028_coefficient_18_0378
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0379 : Poly :=
[
  term ((-352 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 18. -/
def ep_Q1_028_partial_18_0379 : Poly :=
[
  term ((-704 : Rat) / 15) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 18. -/
theorem ep_Q1_028_partial_18_0379_valid :
    mulPoly ep_Q1_028_coefficient_18_0379
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0380 : Poly :=
[
  term ((-2816 : Rat) / 15) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 380 for generator 18. -/
def ep_Q1_028_partial_18_0380 : Poly :=
[
  term ((-5632 : Rat) / 15) [(7, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 18. -/
theorem ep_Q1_028_partial_18_0380_valid :
    mulPoly ep_Q1_028_coefficient_18_0380
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0381 : Poly :=
[
  term ((-1232 : Rat) / 15) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 381 for generator 18. -/
def ep_Q1_028_partial_18_0381 : Poly :=
[
  term ((-2464 : Rat) / 15) [(7, 2), (8, 1), (13, 2), (16, 1)],
  term ((1232 : Rat) / 15) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 18. -/
theorem ep_Q1_028_partial_18_0381_valid :
    mulPoly ep_Q1_028_coefficient_18_0381
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0382 : Poly :=
[
  term ((-4 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 382 for generator 18. -/
def ep_Q1_028_partial_18_0382 : Poly :=
[
  term ((-8 : Rat) / 3) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 18. -/
theorem ep_Q1_028_partial_18_0382_valid :
    mulPoly ep_Q1_028_coefficient_18_0382
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0383 : Poly :=
[
  term ((968 : Rat) / 15) [(7, 2), (14, 2), (16, 1)]
]

/-- Partial product 383 for generator 18. -/
def ep_Q1_028_partial_18_0383 : Poly :=
[
  term ((1936 : Rat) / 15) [(7, 2), (8, 1), (14, 2), (16, 1)],
  term ((-968 : Rat) / 15) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 18. -/
theorem ep_Q1_028_partial_18_0383_valid :
    mulPoly ep_Q1_028_coefficient_18_0383
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0384 : Poly :=
[
  term (-8 : Rat) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 384 for generator 18. -/
def ep_Q1_028_partial_18_0384 : Poly :=
[
  term (8 : Rat) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(8, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 18. -/
theorem ep_Q1_028_partial_18_0384_valid :
    mulPoly ep_Q1_028_coefficient_18_0384
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0385 : Poly :=
[
  term (12 : Rat) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 385 for generator 18. -/
def ep_Q1_028_partial_18_0385 : Poly :=
[
  term (-12 : Rat) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(8, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 18. -/
theorem ep_Q1_028_partial_18_0385_valid :
    mulPoly ep_Q1_028_coefficient_18_0385
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0386 : Poly :=
[
  term (-2 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 18. -/
def ep_Q1_028_partial_18_0386 : Poly :=
[
  term (2 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 18. -/
theorem ep_Q1_028_partial_18_0386_valid :
    mulPoly ep_Q1_028_coefficient_18_0386
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0387 : Poly :=
[
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 387 for generator 18. -/
def ep_Q1_028_partial_18_0387 : Poly :=
[
  term (-3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 18. -/
theorem ep_Q1_028_partial_18_0387_valid :
    mulPoly ep_Q1_028_coefficient_18_0387
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0388 : Poly :=
[
  term ((-3 : Rat) / 2) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 18. -/
def ep_Q1_028_partial_18_0388 : Poly :=
[
  term ((3 : Rat) / 2) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 18. -/
theorem ep_Q1_028_partial_18_0388_valid :
    mulPoly ep_Q1_028_coefficient_18_0388
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0389 : Poly :=
[
  term (-6 : Rat) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 389 for generator 18. -/
def ep_Q1_028_partial_18_0389 : Poly :=
[
  term (6 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-12 : Rat) [(8, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 18. -/
theorem ep_Q1_028_partial_18_0389_valid :
    mulPoly ep_Q1_028_coefficient_18_0389
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0390 : Poly :=
[
  term (-11 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 390 for generator 18. -/
def ep_Q1_028_partial_18_0390 : Poly :=
[
  term (11 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-22 : Rat) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 18. -/
theorem ep_Q1_028_partial_18_0390_valid :
    mulPoly ep_Q1_028_coefficient_18_0390
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0391 : Poly :=
[
  term (12 : Rat) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 391 for generator 18. -/
def ep_Q1_028_partial_18_0391 : Poly :=
[
  term (-12 : Rat) [(8, 1), (13, 2), (16, 1)],
  term (24 : Rat) [(8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 18. -/
theorem ep_Q1_028_partial_18_0391_valid :
    mulPoly ep_Q1_028_coefficient_18_0391
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0392 : Poly :=
[
  term (6 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 392 for generator 18. -/
def ep_Q1_028_partial_18_0392 : Poly :=
[
  term (12 : Rat) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 18. -/
theorem ep_Q1_028_partial_18_0392_valid :
    mulPoly ep_Q1_028_coefficient_18_0392
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0393 : Poly :=
[
  term (-18 : Rat) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 393 for generator 18. -/
def ep_Q1_028_partial_18_0393 : Poly :=
[
  term (-36 : Rat) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (18 : Rat) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 18. -/
theorem ep_Q1_028_partial_18_0393_valid :
    mulPoly ep_Q1_028_coefficient_18_0393
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0394 : Poly :=
[
  term (8 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 394 for generator 18. -/
def ep_Q1_028_partial_18_0394 : Poly :=
[
  term (16 : Rat) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 18. -/
theorem ep_Q1_028_partial_18_0394_valid :
    mulPoly ep_Q1_028_coefficient_18_0394
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0395 : Poly :=
[
  term (15 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 395 for generator 18. -/
def ep_Q1_028_partial_18_0395 : Poly :=
[
  term (30 : Rat) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term (-15 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 18. -/
theorem ep_Q1_028_partial_18_0395_valid :
    mulPoly ep_Q1_028_coefficient_18_0395
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0396 : Poly :=
[
  term ((-13 : Rat) / 2) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 396 for generator 18. -/
def ep_Q1_028_partial_18_0396 : Poly :=
[
  term (-13 : Rat) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((13 : Rat) / 2) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 18. -/
theorem ep_Q1_028_partial_18_0396_valid :
    mulPoly ep_Q1_028_coefficient_18_0396
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0397 : Poly :=
[
  term (-4 : Rat) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 397 for generator 18. -/
def ep_Q1_028_partial_18_0397 : Poly :=
[
  term (-8 : Rat) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 18. -/
theorem ep_Q1_028_partial_18_0397_valid :
    mulPoly ep_Q1_028_coefficient_18_0397
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0398 : Poly :=
[
  term (-12 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 398 for generator 18. -/
def ep_Q1_028_partial_18_0398 : Poly :=
[
  term (-24 : Rat) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 18. -/
theorem ep_Q1_028_partial_18_0398_valid :
    mulPoly ep_Q1_028_coefficient_18_0398
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0399 : Poly :=
[
  term (11 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 399 for generator 18. -/
def ep_Q1_028_partial_18_0399 : Poly :=
[
  term (22 : Rat) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-11 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 18. -/
theorem ep_Q1_028_partial_18_0399_valid :
    mulPoly ep_Q1_028_coefficient_18_0399
        ep_Q1_028_generator_18_0300_0399 =
      ep_Q1_028_partial_18_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_18_0300_0399 : List Poly :=
[
  ep_Q1_028_partial_18_0300,
  ep_Q1_028_partial_18_0301,
  ep_Q1_028_partial_18_0302,
  ep_Q1_028_partial_18_0303,
  ep_Q1_028_partial_18_0304,
  ep_Q1_028_partial_18_0305,
  ep_Q1_028_partial_18_0306,
  ep_Q1_028_partial_18_0307,
  ep_Q1_028_partial_18_0308,
  ep_Q1_028_partial_18_0309,
  ep_Q1_028_partial_18_0310,
  ep_Q1_028_partial_18_0311,
  ep_Q1_028_partial_18_0312,
  ep_Q1_028_partial_18_0313,
  ep_Q1_028_partial_18_0314,
  ep_Q1_028_partial_18_0315,
  ep_Q1_028_partial_18_0316,
  ep_Q1_028_partial_18_0317,
  ep_Q1_028_partial_18_0318,
  ep_Q1_028_partial_18_0319,
  ep_Q1_028_partial_18_0320,
  ep_Q1_028_partial_18_0321,
  ep_Q1_028_partial_18_0322,
  ep_Q1_028_partial_18_0323,
  ep_Q1_028_partial_18_0324,
  ep_Q1_028_partial_18_0325,
  ep_Q1_028_partial_18_0326,
  ep_Q1_028_partial_18_0327,
  ep_Q1_028_partial_18_0328,
  ep_Q1_028_partial_18_0329,
  ep_Q1_028_partial_18_0330,
  ep_Q1_028_partial_18_0331,
  ep_Q1_028_partial_18_0332,
  ep_Q1_028_partial_18_0333,
  ep_Q1_028_partial_18_0334,
  ep_Q1_028_partial_18_0335,
  ep_Q1_028_partial_18_0336,
  ep_Q1_028_partial_18_0337,
  ep_Q1_028_partial_18_0338,
  ep_Q1_028_partial_18_0339,
  ep_Q1_028_partial_18_0340,
  ep_Q1_028_partial_18_0341,
  ep_Q1_028_partial_18_0342,
  ep_Q1_028_partial_18_0343,
  ep_Q1_028_partial_18_0344,
  ep_Q1_028_partial_18_0345,
  ep_Q1_028_partial_18_0346,
  ep_Q1_028_partial_18_0347,
  ep_Q1_028_partial_18_0348,
  ep_Q1_028_partial_18_0349,
  ep_Q1_028_partial_18_0350,
  ep_Q1_028_partial_18_0351,
  ep_Q1_028_partial_18_0352,
  ep_Q1_028_partial_18_0353,
  ep_Q1_028_partial_18_0354,
  ep_Q1_028_partial_18_0355,
  ep_Q1_028_partial_18_0356,
  ep_Q1_028_partial_18_0357,
  ep_Q1_028_partial_18_0358,
  ep_Q1_028_partial_18_0359,
  ep_Q1_028_partial_18_0360,
  ep_Q1_028_partial_18_0361,
  ep_Q1_028_partial_18_0362,
  ep_Q1_028_partial_18_0363,
  ep_Q1_028_partial_18_0364,
  ep_Q1_028_partial_18_0365,
  ep_Q1_028_partial_18_0366,
  ep_Q1_028_partial_18_0367,
  ep_Q1_028_partial_18_0368,
  ep_Q1_028_partial_18_0369,
  ep_Q1_028_partial_18_0370,
  ep_Q1_028_partial_18_0371,
  ep_Q1_028_partial_18_0372,
  ep_Q1_028_partial_18_0373,
  ep_Q1_028_partial_18_0374,
  ep_Q1_028_partial_18_0375,
  ep_Q1_028_partial_18_0376,
  ep_Q1_028_partial_18_0377,
  ep_Q1_028_partial_18_0378,
  ep_Q1_028_partial_18_0379,
  ep_Q1_028_partial_18_0380,
  ep_Q1_028_partial_18_0381,
  ep_Q1_028_partial_18_0382,
  ep_Q1_028_partial_18_0383,
  ep_Q1_028_partial_18_0384,
  ep_Q1_028_partial_18_0385,
  ep_Q1_028_partial_18_0386,
  ep_Q1_028_partial_18_0387,
  ep_Q1_028_partial_18_0388,
  ep_Q1_028_partial_18_0389,
  ep_Q1_028_partial_18_0390,
  ep_Q1_028_partial_18_0391,
  ep_Q1_028_partial_18_0392,
  ep_Q1_028_partial_18_0393,
  ep_Q1_028_partial_18_0394,
  ep_Q1_028_partial_18_0395,
  ep_Q1_028_partial_18_0396,
  ep_Q1_028_partial_18_0397,
  ep_Q1_028_partial_18_0398,
  ep_Q1_028_partial_18_0399
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_18_0300_0399 : Poly :=
[
  term ((16 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((112 : Rat) / 15) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 15) [(7, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 5) [(7, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 15) [(7, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-992 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((992 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-896 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((548 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((496 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((896 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-224 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((224 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((584 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-496 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-124 : Rat) / 15) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((992 : Rat) / 5) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-992 : Rat) / 15) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-496 : Rat) / 15) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-512 : Rat) / 15) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((224 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 15) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((208 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-152 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((512 : Rat) / 15) [(7, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 15) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 15) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 15) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-56 : Rat) / 15) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 15) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 5) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 15) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((496 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-496 : Rat) / 15) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((448 : Rat) / 15) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-274 : Rat) / 15) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-248 : Rat) / 15) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-448 : Rat) / 15) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((112 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-112 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-292 : Rat) / 15) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 15) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((62 : Rat) / 5) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((62 : Rat) / 15) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((6 : Rat) / 5) [(7, 1), (11, 1), (16, 1)],
  term ((-496 : Rat) / 5) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((496 : Rat) / 15) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 15) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-112 : Rat) / 5) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 15) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((104 : Rat) / 5) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-104 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((76 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (13, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-112 : Rat) / 15) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 15) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 15) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(7, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-33088 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((9856 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((11616 : Rat) / 5) [(7, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10736 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((4928 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7744 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9152 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((9856 : Rat) / 15) [(7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-4928 : Rat) / 5) [(7, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(7, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term (704 : Rat) [(7, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((9856 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-392 : Rat) / 3) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-9856 : Rat) / 15) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-704 : Rat) [(7, 2), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((5632 : Rat) / 15) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2464 : Rat) / 5) [(7, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((1056 : Rat) / 5) [(7, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((2464 : Rat) / 15) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((-1056 : Rat) / 5) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5632 : Rat) / 15) [(7, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((1936 : Rat) / 15) [(7, 2), (8, 1), (14, 2), (16, 1)],
  term ((-9856 : Rat) / 15) [(7, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((4928 : Rat) / 5) [(7, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2464 : Rat) / 15) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (8, 2), (11, 2), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(7, 2), (8, 2), (13, 2), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((16544 : Rat) / 15) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5808 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((5368 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2464 : Rat) / 15) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3872 : Rat) / 15) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4576 : Rat) / 15) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1232 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((616 : Rat) / 15) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((2464 : Rat) / 5) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((-1232 : Rat) / 15) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term (-352 : Rat) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((196 : Rat) / 3) [(7, 2), (10, 1), (16, 1)],
  term ((4928 : Rat) / 15) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((88 : Rat) / 3) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44 : Rat) / 3) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (352 : Rat) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (11, 2), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 5) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-528 : Rat) / 5) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1232 : Rat) / 15) [(7, 2), (12, 1), (16, 1)],
  term ((528 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1232 : Rat) / 15) [(7, 2), (13, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 2), (14, 1), (16, 1)],
  term ((-968 : Rat) / 15) [(7, 2), (14, 2), (16, 1)],
  term (12 : Rat) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term (-36 : Rat) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term (-13 : Rat) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term (22 : Rat) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 2) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (11 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (13, 2), (16, 1)],
  term (-16 : Rat) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(8, 2), (11, 2), (16, 1)],
  term (-22 : Rat) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(8, 2), (13, 2), (16, 1)],
  term (-6 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (18 : Rat) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((13 : Rat) / 2) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term (-11 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 300 through 399. -/
theorem ep_Q1_028_block_18_0300_0399_valid :
    checkProductSumEq ep_Q1_028_partials_18_0300_0399
      ep_Q1_028_block_18_0300_0399 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
