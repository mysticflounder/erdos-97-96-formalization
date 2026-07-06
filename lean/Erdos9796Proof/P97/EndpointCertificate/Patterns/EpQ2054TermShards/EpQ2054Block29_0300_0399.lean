/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 29:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_29_0300_0399 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0300 : Poly :=
[
  term ((-4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 300 for generator 29. -/
def ep_Q2_054_partial_29_0300 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 29. -/
theorem ep_Q2_054_partial_29_0300_valid :
    mulPoly ep_Q2_054_coefficient_29_0300
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0301 : Poly :=
[
  term ((-82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 301 for generator 29. -/
def ep_Q2_054_partial_29_0301 : Poly :=
[
  term ((-164735775000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 29. -/
theorem ep_Q2_054_partial_29_0301_valid :
    mulPoly ep_Q2_054_coefficient_29_0301
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0302 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 29. -/
def ep_Q2_054_partial_29_0302 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 29. -/
theorem ep_Q2_054_partial_29_0302_valid :
    mulPoly ep_Q2_054_coefficient_29_0302
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0303 : Poly :=
[
  term ((59487918750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)]
]

/-- Partial product 303 for generator 29. -/
def ep_Q2_054_partial_29_0303 : Poly :=
[
  term ((118975837500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (14, 1)],
  term ((-59487918750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 2)],
  term ((118975837500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-59487918750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 29. -/
theorem ep_Q2_054_partial_29_0303_valid :
    mulPoly ep_Q2_054_coefficient_29_0303
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0304 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 304 for generator 29. -/
def ep_Q2_054_partial_29_0304 : Poly :=
[
  term ((-48810600000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 29. -/
theorem ep_Q2_054_partial_29_0304_valid :
    mulPoly ep_Q2_054_coefficient_29_0304
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0305 : Poly :=
[
  term ((-1926696602259 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 305 for generator 29. -/
def ep_Q2_054_partial_29_0305 : Poly :=
[
  term ((-3853393204518 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((1926696602259 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 2)],
  term ((-3853393204518 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (14, 1)],
  term ((1926696602259 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 29. -/
theorem ep_Q2_054_partial_29_0305_valid :
    mulPoly ep_Q2_054_coefficient_29_0305
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0306 : Poly :=
[
  term ((-15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 306 for generator 29. -/
def ep_Q2_054_partial_29_0306 : Poly :=
[
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 29. -/
theorem ep_Q2_054_partial_29_0306_valid :
    mulPoly ep_Q2_054_coefficient_29_0306
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0307 : Poly :=
[
  term ((68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 307 for generator 29. -/
def ep_Q2_054_partial_29_0307 : Poly :=
[
  term ((137279812500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((137279812500 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((-68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 29. -/
theorem ep_Q2_054_partial_29_0307_valid :
    mulPoly ep_Q2_054_coefficient_29_0307
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0308 : Poly :=
[
  term ((30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 29. -/
def ep_Q2_054_partial_29_0308 : Poly :=
[
  term ((61013250000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((61013250000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 29. -/
theorem ep_Q2_054_partial_29_0308_valid :
    mulPoly ep_Q2_054_coefficient_29_0308
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0309 : Poly :=
[
  term ((-15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 309 for generator 29. -/
def ep_Q2_054_partial_29_0309 : Poly :=
[
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 29. -/
theorem ep_Q2_054_partial_29_0309_valid :
    mulPoly ep_Q2_054_coefficient_29_0309
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0310 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 310 for generator 29. -/
def ep_Q2_054_partial_29_0310 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 29. -/
theorem ep_Q2_054_partial_29_0310_valid :
    mulPoly ep_Q2_054_coefficient_29_0310
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0311 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 311 for generator 29. -/
def ep_Q2_054_partial_29_0311 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 29. -/
theorem ep_Q2_054_partial_29_0311_valid :
    mulPoly ep_Q2_054_coefficient_29_0311
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0312 : Poly :=
[
  term ((-1511357950800 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 312 for generator 29. -/
def ep_Q2_054_partial_29_0312 : Poly :=
[
  term ((-3022715901600 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((1511357950800 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-3022715901600 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((1511357950800 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 29. -/
theorem ep_Q2_054_partial_29_0312_valid :
    mulPoly ep_Q2_054_coefficient_29_0312
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0313 : Poly :=
[
  term ((1057950565560 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 313 for generator 29. -/
def ep_Q2_054_partial_29_0313 : Poly :=
[
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 29. -/
theorem ep_Q2_054_partial_29_0313_valid :
    mulPoly ep_Q2_054_coefficient_29_0313
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0314 : Poly :=
[
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 314 for generator 29. -/
def ep_Q2_054_partial_29_0314 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 29. -/
theorem ep_Q2_054_partial_29_0314_valid :
    mulPoly ep_Q2_054_coefficient_29_0314
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0315 : Poly :=
[
  term ((11518995669804 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 315 for generator 29. -/
def ep_Q2_054_partial_29_0315 : Poly :=
[
  term ((23037991339608 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11518995669804 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (13, 1)],
  term ((23037991339608 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((-11518995669804 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 29. -/
theorem ep_Q2_054_partial_29_0315_valid :
    mulPoly ep_Q2_054_coefficient_29_0315
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0316 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 316 for generator 29. -/
def ep_Q2_054_partial_29_0316 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 2), (15, 3)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 29. -/
theorem ep_Q2_054_partial_29_0316_valid :
    mulPoly ep_Q2_054_coefficient_29_0316
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0317 : Poly :=
[
  term ((8765876114640 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 317 for generator 29. -/
def ep_Q2_054_partial_29_0317 : Poly :=
[
  term ((17531752229280 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8765876114640 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((17531752229280 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-8765876114640 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 29. -/
theorem ep_Q2_054_partial_29_0317_valid :
    mulPoly ep_Q2_054_coefficient_29_0317
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0318 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 29. -/
def ep_Q2_054_partial_29_0318 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 29. -/
theorem ep_Q2_054_partial_29_0318_valid :
    mulPoly ep_Q2_054_coefficient_29_0318
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0319 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 319 for generator 29. -/
def ep_Q2_054_partial_29_0319 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 29. -/
theorem ep_Q2_054_partial_29_0319_valid :
    mulPoly ep_Q2_054_coefficient_29_0319
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0320 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 320 for generator 29. -/
def ep_Q2_054_partial_29_0320 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 29. -/
theorem ep_Q2_054_partial_29_0320_valid :
    mulPoly ep_Q2_054_coefficient_29_0320
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0321 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 321 for generator 29. -/
def ep_Q2_054_partial_29_0321 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 29. -/
theorem ep_Q2_054_partial_29_0321_valid :
    mulPoly ep_Q2_054_coefficient_29_0321
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0322 : Poly :=
[
  term ((-226703692620 : Rat) / 45033486517) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 322 for generator 29. -/
def ep_Q2_054_partial_29_0322 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((226703692620 : Rat) / 45033486517) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((226703692620 : Rat) / 45033486517) [(3, 1), (9, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 29. -/
theorem ep_Q2_054_partial_29_0322_valid :
    mulPoly ep_Q2_054_coefficient_29_0322
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0323 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 323 for generator 29. -/
def ep_Q2_054_partial_29_0323 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 29. -/
theorem ep_Q2_054_partial_29_0323_valid :
    mulPoly ep_Q2_054_coefficient_29_0323
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0324 : Poly :=
[
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 29. -/
def ep_Q2_054_partial_29_0324 : Poly :=
[
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 29. -/
theorem ep_Q2_054_partial_29_0324_valid :
    mulPoly ep_Q2_054_coefficient_29_0324
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0325 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 325 for generator 29. -/
def ep_Q2_054_partial_29_0325 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 2), (15, 3)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 29. -/
theorem ep_Q2_054_partial_29_0325_valid :
    mulPoly ep_Q2_054_coefficient_29_0325
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0326 : Poly :=
[
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 326 for generator 29. -/
def ep_Q2_054_partial_29_0326 : Poly :=
[
  term ((806057573760 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((806057573760 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 29. -/
theorem ep_Q2_054_partial_29_0326_valid :
    mulPoly ep_Q2_054_coefficient_29_0326
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0327 : Poly :=
[
  term ((562743634215 : Rat) / 90066973034) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 327 for generator 29. -/
def ep_Q2_054_partial_29_0327 : Poly :=
[
  term ((562743634215 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-562743634215 : Rat) / 90066973034) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((562743634215 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-562743634215 : Rat) / 90066973034) [(3, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 29. -/
theorem ep_Q2_054_partial_29_0327_valid :
    mulPoly ep_Q2_054_coefficient_29_0327
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0328 : Poly :=
[
  term ((461986437495 : Rat) / 90066973034) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 29. -/
def ep_Q2_054_partial_29_0328 : Poly :=
[
  term ((461986437495 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-461986437495 : Rat) / 90066973034) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((461986437495 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-461986437495 : Rat) / 90066973034) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 29. -/
theorem ep_Q2_054_partial_29_0328_valid :
    mulPoly ep_Q2_054_coefficient_29_0328
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0329 : Poly :=
[
  term ((-1767748589786 : Rat) / 45033486517) [(3, 1), (11, 1)]
]

/-- Partial product 329 for generator 29. -/
def ep_Q2_054_partial_29_0329 : Poly :=
[
  term ((-3535497179572 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((1767748589786 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 2)],
  term ((-3535497179572 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((1767748589786 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 29. -/
theorem ep_Q2_054_partial_29_0329_valid :
    mulPoly ep_Q2_054_coefficient_29_0329
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0330 : Poly :=
[
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 330 for generator 29. -/
def ep_Q2_054_partial_29_0330 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 29. -/
theorem ep_Q2_054_partial_29_0330_valid :
    mulPoly ep_Q2_054_coefficient_29_0330
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0331 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 331 for generator 29. -/
def ep_Q2_054_partial_29_0331 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1360222155720 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1360222155720 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 29. -/
theorem ep_Q2_054_partial_29_0331_valid :
    mulPoly ep_Q2_054_coefficient_29_0331
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0332 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 332 for generator 29. -/
def ep_Q2_054_partial_29_0332 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 29. -/
theorem ep_Q2_054_partial_29_0332_valid :
    mulPoly ep_Q2_054_coefficient_29_0332
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0333 : Poly :=
[
  term ((-982382668020 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 333 for generator 29. -/
def ep_Q2_054_partial_29_0333 : Poly :=
[
  term ((-1964765336040 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((982382668020 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1964765336040 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((982382668020 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 29. -/
theorem ep_Q2_054_partial_29_0333_valid :
    mulPoly ep_Q2_054_coefficient_29_0333
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0334 : Poly :=
[
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 29. -/
def ep_Q2_054_partial_29_0334 : Poly :=
[
  term ((806057573760 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((806057573760 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 29. -/
theorem ep_Q2_054_partial_29_0334_valid :
    mulPoly ep_Q2_054_coefficient_29_0334
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0335 : Poly :=
[
  term ((-242145986679 : Rat) / 90066973034) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 335 for generator 29. -/
def ep_Q2_054_partial_29_0335 : Poly :=
[
  term ((-242145986679 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((242145986679 : Rat) / 90066973034) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-242145986679 : Rat) / 45033486517) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((242145986679 : Rat) / 90066973034) [(3, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 29. -/
theorem ep_Q2_054_partial_29_0335_valid :
    mulPoly ep_Q2_054_coefficient_29_0335
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0336 : Poly :=
[
  term ((251892991800 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 29. -/
def ep_Q2_054_partial_29_0336 : Poly :=
[
  term ((503785983600 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-251892991800 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((503785983600 : Rat) / 45033486517) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-251892991800 : Rat) / 45033486517) [(3, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 29. -/
theorem ep_Q2_054_partial_29_0336_valid :
    mulPoly ep_Q2_054_coefficient_29_0336
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0337 : Poly :=
[
  term ((-127398524938 : Rat) / 45033486517) [(3, 1), (13, 1)]
]

/-- Partial product 337 for generator 29. -/
def ep_Q2_054_partial_29_0337 : Poly :=
[
  term ((-254797049876 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((127398524938 : Rat) / 45033486517) [(3, 1), (12, 2), (13, 1)],
  term ((-254797049876 : Rat) / 45033486517) [(3, 1), (13, 2), (15, 1)],
  term ((127398524938 : Rat) / 45033486517) [(3, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 29. -/
theorem ep_Q2_054_partial_29_0337_valid :
    mulPoly ep_Q2_054_coefficient_29_0337
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0338 : Poly :=
[
  term ((-1133518463100 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 338 for generator 29. -/
def ep_Q2_054_partial_29_0338 : Poly :=
[
  term ((-2267036926200 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1133518463100 : Rat) / 45033486517) [(3, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2267036926200 : Rat) / 45033486517) [(3, 1), (13, 2), (15, 3)],
  term ((1133518463100 : Rat) / 45033486517) [(3, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 29. -/
theorem ep_Q2_054_partial_29_0338_valid :
    mulPoly ep_Q2_054_coefficient_29_0338
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0339 : Poly :=
[
  term ((-503785983600 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 339 for generator 29. -/
def ep_Q2_054_partial_29_0339 : Poly :=
[
  term ((-1007571967200 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((503785983600 : Rat) / 45033486517) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1007571967200 : Rat) / 45033486517) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((503785983600 : Rat) / 45033486517) [(3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 29. -/
theorem ep_Q2_054_partial_29_0339_valid :
    mulPoly ep_Q2_054_coefficient_29_0339
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0340 : Poly :=
[
  term ((-7872239970183 : Rat) / 45033486517) [(3, 1), (15, 1)]
]

/-- Partial product 340 for generator 29. -/
def ep_Q2_054_partial_29_0340 : Poly :=
[
  term ((-15744479940366 : Rat) / 45033486517) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((7872239970183 : Rat) / 45033486517) [(3, 1), (12, 2), (15, 1)],
  term ((-15744479940366 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2)],
  term ((7872239970183 : Rat) / 45033486517) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 29. -/
theorem ep_Q2_054_partial_29_0340_valid :
    mulPoly ep_Q2_054_coefficient_29_0340
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0341 : Poly :=
[
  term ((-1319518324785 : Rat) / 90066973034) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 29. -/
def ep_Q2_054_partial_29_0341 : Poly :=
[
  term ((-1319518324785 : Rat) / 45033486517) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1319518324785 : Rat) / 90066973034) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1319518324785 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1319518324785 : Rat) / 90066973034) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 29. -/
theorem ep_Q2_054_partial_29_0341_valid :
    mulPoly ep_Q2_054_coefficient_29_0341
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0342 : Poly :=
[
  term ((2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1)]
]

/-- Partial product 342 for generator 29. -/
def ep_Q2_054_partial_29_0342 : Poly :=
[
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (12, 2)],
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 29. -/
theorem ep_Q2_054_partial_29_0342_valid :
    mulPoly ep_Q2_054_coefficient_29_0342
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0343 : Poly :=
[
  term ((-1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1)]
]

/-- Partial product 343 for generator 29. -/
def ep_Q2_054_partial_29_0343 : Poly :=
[
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (12, 2)],
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 29. -/
theorem ep_Q2_054_partial_29_0343_valid :
    mulPoly ep_Q2_054_coefficient_29_0343
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0344 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 344 for generator 29. -/
def ep_Q2_054_partial_29_0344 : Poly :=
[
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 2), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 29. -/
theorem ep_Q2_054_partial_29_0344_valid :
    mulPoly ep_Q2_054_coefficient_29_0344
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0345 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 345 for generator 29. -/
def ep_Q2_054_partial_29_0345 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 29. -/
theorem ep_Q2_054_partial_29_0345_valid :
    mulPoly ep_Q2_054_coefficient_29_0345
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0346 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 346 for generator 29. -/
def ep_Q2_054_partial_29_0346 : Poly :=
[
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 2), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 29. -/
theorem ep_Q2_054_partial_29_0346_valid :
    mulPoly ep_Q2_054_coefficient_29_0346
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0347 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1)]
]

/-- Partial product 347 for generator 29. -/
def ep_Q2_054_partial_29_0347 : Poly :=
[
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (12, 2), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 2), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 29. -/
theorem ep_Q2_054_partial_29_0347_valid :
    mulPoly ep_Q2_054_coefficient_29_0347
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0348 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 348 for generator 29. -/
def ep_Q2_054_partial_29_0348 : Poly :=
[
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (12, 2), (13, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 2), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 29. -/
theorem ep_Q2_054_partial_29_0348_valid :
    mulPoly ep_Q2_054_coefficient_29_0348
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0349 : Poly :=
[
  term ((1973083659258 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 349 for generator 29. -/
def ep_Q2_054_partial_29_0349 : Poly :=
[
  term ((3946167318516 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1)],
  term ((-1973083659258 : Rat) / 45033486517) [(6, 1), (12, 2)],
  term ((3946167318516 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)],
  term ((-1973083659258 : Rat) / 45033486517) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 29. -/
theorem ep_Q2_054_partial_29_0349_valid :
    mulPoly ep_Q2_054_coefficient_29_0349
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0350 : Poly :=
[
  term ((997566637500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 350 for generator 29. -/
def ep_Q2_054_partial_29_0350 : Poly :=
[
  term ((1995133275000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-997566637500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 2)],
  term ((1995133275000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-997566637500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 29. -/
theorem ep_Q2_054_partial_29_0350_valid :
    mulPoly ep_Q2_054_coefficient_29_0350
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0351 : Poly :=
[
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 351 for generator 29. -/
def ep_Q2_054_partial_29_0351 : Poly :=
[
  term ((1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 29. -/
theorem ep_Q2_054_partial_29_0351_valid :
    mulPoly ep_Q2_054_coefficient_29_0351
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0352 : Poly :=
[
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 352 for generator 29. -/
def ep_Q2_054_partial_29_0352 : Poly :=
[
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 29. -/
theorem ep_Q2_054_partial_29_0352_valid :
    mulPoly ep_Q2_054_coefficient_29_0352
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0353 : Poly :=
[
  term ((1550023889886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 353 for generator 29. -/
def ep_Q2_054_partial_29_0353 : Poly :=
[
  term ((3100047779772 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1550023889886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 2)],
  term ((3100047779772 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1550023889886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 29. -/
theorem ep_Q2_054_partial_29_0353_valid :
    mulPoly ep_Q2_054_coefficient_29_0353
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0354 : Poly :=
[
  term ((-155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 354 for generator 29. -/
def ep_Q2_054_partial_29_0354 : Poly :=
[
  term ((-311167575000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (12, 2)],
  term ((-311167575000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 29. -/
theorem ep_Q2_054_partial_29_0354_valid :
    mulPoly ep_Q2_054_coefficient_29_0354
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0355 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 355 for generator 29. -/
def ep_Q2_054_partial_29_0355 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 29. -/
theorem ep_Q2_054_partial_29_0355_valid :
    mulPoly ep_Q2_054_coefficient_29_0355
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0356 : Poly :=
[
  term ((-1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 356 for generator 29. -/
def ep_Q2_054_partial_29_0356 : Poly :=
[
  term ((-1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 29. -/
theorem ep_Q2_054_partial_29_0356_valid :
    mulPoly ep_Q2_054_coefficient_29_0356
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0357 : Poly :=
[
  term ((5440471301889 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 357 for generator 29. -/
def ep_Q2_054_partial_29_0357 : Poly :=
[
  term ((5440471301889 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5440471301889 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1), (12, 2)],
  term ((5440471301889 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5440471301889 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 29. -/
theorem ep_Q2_054_partial_29_0357_valid :
    mulPoly ep_Q2_054_coefficient_29_0357
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0358 : Poly :=
[
  term ((-46895884605333 : Rat) / 180133946068) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 358 for generator 29. -/
def ep_Q2_054_partial_29_0358 : Poly :=
[
  term ((-46895884605333 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((46895884605333 : Rat) / 180133946068) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((-46895884605333 : Rat) / 90066973034) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((46895884605333 : Rat) / 180133946068) [(6, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 29. -/
theorem ep_Q2_054_partial_29_0358_valid :
    mulPoly ep_Q2_054_coefficient_29_0358
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0359 : Poly :=
[
  term ((7784463619782 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 359 for generator 29. -/
def ep_Q2_054_partial_29_0359 : Poly :=
[
  term ((15568927239564 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7784463619782 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((15568927239564 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-7784463619782 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 29. -/
theorem ep_Q2_054_partial_29_0359_valid :
    mulPoly ep_Q2_054_coefficient_29_0359
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0360 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 360 for generator 29. -/
def ep_Q2_054_partial_29_0360 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 29. -/
theorem ep_Q2_054_partial_29_0360_valid :
    mulPoly ep_Q2_054_coefficient_29_0360
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0361 : Poly :=
[
  term ((9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2)]
]

/-- Partial product 361 for generator 29. -/
def ep_Q2_054_partial_29_0361 : Poly :=
[
  term ((18480283493364 : Rat) / 45033486517) [(6, 1), (7, 2), (12, 1), (14, 1)],
  term ((-9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2), (12, 2)],
  term ((18480283493364 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 29. -/
theorem ep_Q2_054_partial_29_0361_valid :
    mulPoly ep_Q2_054_coefficient_29_0361
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0362 : Poly :=
[
  term ((2801699376066 : Rat) / 45033486517) [(6, 1), (8, 1)]
]

/-- Partial product 362 for generator 29. -/
def ep_Q2_054_partial_29_0362 : Poly :=
[
  term ((5603398752132 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((-2801699376066 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2)],
  term ((5603398752132 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-2801699376066 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 29. -/
theorem ep_Q2_054_partial_29_0362_valid :
    mulPoly ep_Q2_054_coefficient_29_0362
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0363 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 363 for generator 29. -/
def ep_Q2_054_partial_29_0363 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 29. -/
theorem ep_Q2_054_partial_29_0363_valid :
    mulPoly ep_Q2_054_coefficient_29_0363
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0364 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 29. -/
def ep_Q2_054_partial_29_0364 : Poly :=
[
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 29. -/
theorem ep_Q2_054_partial_29_0364_valid :
    mulPoly ep_Q2_054_coefficient_29_0364
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0365 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 365 for generator 29. -/
def ep_Q2_054_partial_29_0365 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 29. -/
theorem ep_Q2_054_partial_29_0365_valid :
    mulPoly ep_Q2_054_coefficient_29_0365
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0366 : Poly :=
[
  term ((-17679604473540 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 366 for generator 29. -/
def ep_Q2_054_partial_29_0366 : Poly :=
[
  term ((-35359208947080 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17679604473540 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-35359208947080 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((17679604473540 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 29. -/
theorem ep_Q2_054_partial_29_0366_valid :
    mulPoly ep_Q2_054_coefficient_29_0366
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0367 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 29. -/
def ep_Q2_054_partial_29_0367 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 29. -/
theorem ep_Q2_054_partial_29_0367_valid :
    mulPoly ep_Q2_054_coefficient_29_0367
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0368 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 368 for generator 29. -/
def ep_Q2_054_partial_29_0368 : Poly :=
[
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 2), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 29. -/
theorem ep_Q2_054_partial_29_0368_valid :
    mulPoly ep_Q2_054_coefficient_29_0368
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0369 : Poly :=
[
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)]
]

/-- Partial product 369 for generator 29. -/
def ep_Q2_054_partial_29_0369 : Poly :=
[
  term ((-8135100000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((-8135100000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (14, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 29. -/
theorem ep_Q2_054_partial_29_0369_valid :
    mulPoly ep_Q2_054_coefficient_29_0369
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0370 : Poly :=
[
  term ((-15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 370 for generator 29. -/
def ep_Q2_054_partial_29_0370 : Poly :=
[
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 29. -/
theorem ep_Q2_054_partial_29_0370_valid :
    mulPoly ep_Q2_054_coefficient_29_0370
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0371 : Poly :=
[
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 371 for generator 29. -/
def ep_Q2_054_partial_29_0371 : Poly :=
[
  term ((-28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2), (15, 2)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 29. -/
theorem ep_Q2_054_partial_29_0371_valid :
    mulPoly ep_Q2_054_coefficient_29_0371
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0372 : Poly :=
[
  term ((30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 29. -/
def ep_Q2_054_partial_29_0372 : Poly :=
[
  term ((61013250000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((61013250000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 29. -/
theorem ep_Q2_054_partial_29_0372_valid :
    mulPoly ep_Q2_054_coefficient_29_0372
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0373 : Poly :=
[
  term ((14004877722768 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2)]
]

/-- Partial product 373 for generator 29. -/
def ep_Q2_054_partial_29_0373 : Poly :=
[
  term ((28009755445536 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-14004877722768 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((28009755445536 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-14004877722768 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 29. -/
theorem ep_Q2_054_partial_29_0373_valid :
    mulPoly ep_Q2_054_coefficient_29_0373
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0374 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 374 for generator 29. -/
def ep_Q2_054_partial_29_0374 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 29. -/
theorem ep_Q2_054_partial_29_0374_valid :
    mulPoly ep_Q2_054_coefficient_29_0374
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0375 : Poly :=
[
  term ((5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 375 for generator 29. -/
def ep_Q2_054_partial_29_0375 : Poly :=
[
  term ((5279757708591 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((5279757708591 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 29. -/
theorem ep_Q2_054_partial_29_0375_valid :
    mulPoly ep_Q2_054_coefficient_29_0375
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0376 : Poly :=
[
  term ((3400682388255 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 376 for generator 29. -/
def ep_Q2_054_partial_29_0376 : Poly :=
[
  term ((3400682388255 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3400682388255 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((3400682388255 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3400682388255 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 29. -/
theorem ep_Q2_054_partial_29_0376_valid :
    mulPoly ep_Q2_054_coefficient_29_0376
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0377 : Poly :=
[
  term ((5384884399461 : Rat) / 180133946068) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 377 for generator 29. -/
def ep_Q2_054_partial_29_0377 : Poly :=
[
  term ((5384884399461 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5384884399461 : Rat) / 180133946068) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((5384884399461 : Rat) / 90066973034) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-5384884399461 : Rat) / 180133946068) [(6, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 29. -/
theorem ep_Q2_054_partial_29_0377_valid :
    mulPoly ep_Q2_054_coefficient_29_0377
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0378 : Poly :=
[
  term ((-22433902858098 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 378 for generator 29. -/
def ep_Q2_054_partial_29_0378 : Poly :=
[
  term ((-44867805716196 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((22433902858098 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-44867805716196 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((22433902858098 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 29. -/
theorem ep_Q2_054_partial_29_0378_valid :
    mulPoly ep_Q2_054_coefficient_29_0378
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0379 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 29. -/
def ep_Q2_054_partial_29_0379 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 29. -/
theorem ep_Q2_054_partial_29_0379_valid :
    mulPoly ep_Q2_054_coefficient_29_0379
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0380 : Poly :=
[
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 2)]
]

/-- Partial product 380 for generator 29. -/
def ep_Q2_054_partial_29_0380 : Poly :=
[
  term ((-734867342892 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 29. -/
theorem ep_Q2_054_partial_29_0380_valid :
    mulPoly ep_Q2_054_coefficient_29_0380
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0381 : Poly :=
[
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 381 for generator 29. -/
def ep_Q2_054_partial_29_0381 : Poly :=
[
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 29. -/
theorem ep_Q2_054_partial_29_0381_valid :
    mulPoly ep_Q2_054_coefficient_29_0381
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0382 : Poly :=
[
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 29. -/
def ep_Q2_054_partial_29_0382 : Poly :=
[
  term ((-3789141777960 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3789141777960 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 29. -/
theorem ep_Q2_054_partial_29_0382_valid :
    mulPoly ep_Q2_054_coefficient_29_0382
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0383 : Poly :=
[
  term ((13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2)]
]

/-- Partial product 383 for generator 29. -/
def ep_Q2_054_partial_29_0383 : Poly :=
[
  term ((26130916929042 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 2), (15, 2)],
  term ((26130916929042 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 29. -/
theorem ep_Q2_054_partial_29_0383_valid :
    mulPoly ep_Q2_054_coefficient_29_0383
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0384 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 384 for generator 29. -/
def ep_Q2_054_partial_29_0384 : Poly :=
[
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 29. -/
theorem ep_Q2_054_partial_29_0384_valid :
    mulPoly ep_Q2_054_coefficient_29_0384
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0385 : Poly :=
[
  term ((-1420928166735 : Rat) / 90066973034) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 385 for generator 29. -/
def ep_Q2_054_partial_29_0385 : Poly :=
[
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1420928166735 : Rat) / 90066973034) [(6, 1), (10, 1), (12, 2), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1420928166735 : Rat) / 90066973034) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 29. -/
theorem ep_Q2_054_partial_29_0385_valid :
    mulPoly ep_Q2_054_coefficient_29_0385
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0386 : Poly :=
[
  term ((-13734294477039 : Rat) / 90066973034) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 386 for generator 29. -/
def ep_Q2_054_partial_29_0386 : Poly :=
[
  term ((-13734294477039 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((13734294477039 : Rat) / 90066973034) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-13734294477039 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((13734294477039 : Rat) / 90066973034) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 29. -/
theorem ep_Q2_054_partial_29_0386_valid :
    mulPoly ep_Q2_054_coefficient_29_0386
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0387 : Poly :=
[
  term ((468772657731 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 29. -/
def ep_Q2_054_partial_29_0387 : Poly :=
[
  term ((937545315462 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-468772657731 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((937545315462 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-468772657731 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 29. -/
theorem ep_Q2_054_partial_29_0387_valid :
    mulPoly ep_Q2_054_coefficient_29_0387
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0388 : Poly :=
[
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 388 for generator 29. -/
def ep_Q2_054_partial_29_0388 : Poly :=
[
  term ((-3789141777960 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3789141777960 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 29. -/
theorem ep_Q2_054_partial_29_0388_valid :
    mulPoly ep_Q2_054_coefficient_29_0388
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0389 : Poly :=
[
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (12, 1)]
]

/-- Partial product 389 for generator 29. -/
def ep_Q2_054_partial_29_0389 : Poly :=
[
  term ((8135100000 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 2)],
  term ((8135100000 : Rat) / 45033486517) [(6, 1), (12, 2), (14, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 29. -/
theorem ep_Q2_054_partial_29_0389_valid :
    mulPoly ep_Q2_054_coefficient_29_0389
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0390 : Poly :=
[
  term ((-2368213611225 : Rat) / 90066973034) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 390 for generator 29. -/
def ep_Q2_054_partial_29_0390 : Poly :=
[
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2368213611225 : Rat) / 90066973034) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((2368213611225 : Rat) / 90066973034) [(6, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 29. -/
theorem ep_Q2_054_partial_29_0390_valid :
    mulPoly ep_Q2_054_coefficient_29_0390
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0391 : Poly :=
[
  term ((131132933958267 : Rat) / 90066973034) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 391 for generator 29. -/
def ep_Q2_054_partial_29_0391 : Poly :=
[
  term ((131132933958267 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-131132933958267 : Rat) / 90066973034) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((131132933958267 : Rat) / 45033486517) [(6, 1), (13, 2), (15, 2)],
  term ((-131132933958267 : Rat) / 90066973034) [(6, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 29. -/
theorem ep_Q2_054_partial_29_0391_valid :
    mulPoly ep_Q2_054_coefficient_29_0391
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0392 : Poly :=
[
  term ((2368213611225 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 29. -/
def ep_Q2_054_partial_29_0392 : Poly :=
[
  term ((4736427222450 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4736427222450 : Rat) / 45033486517) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 29. -/
theorem ep_Q2_054_partial_29_0392_valid :
    mulPoly ep_Q2_054_coefficient_29_0392
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0393 : Poly :=
[
  term ((32090998383072 : Rat) / 45033486517) [(6, 1), (15, 2)]
]

/-- Partial product 393 for generator 29. -/
def ep_Q2_054_partial_29_0393 : Poly :=
[
  term ((64181996766144 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-32090998383072 : Rat) / 45033486517) [(6, 1), (12, 2), (15, 2)],
  term ((64181996766144 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 3)],
  term ((-32090998383072 : Rat) / 45033486517) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 29. -/
theorem ep_Q2_054_partial_29_0393_valid :
    mulPoly ep_Q2_054_coefficient_29_0393
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0394 : Poly :=
[
  term ((323518744674 : Rat) / 45033486517) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 394 for generator 29. -/
def ep_Q2_054_partial_29_0394 : Poly :=
[
  term ((647037489348 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-323518744674 : Rat) / 45033486517) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((647037489348 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-323518744674 : Rat) / 45033486517) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 29. -/
theorem ep_Q2_054_partial_29_0394_valid :
    mulPoly ep_Q2_054_coefficient_29_0394
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0395 : Poly :=
[
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (16, 1)]
]

/-- Partial product 395 for generator 29. -/
def ep_Q2_054_partial_29_0395 : Poly :=
[
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (12, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 29. -/
theorem ep_Q2_054_partial_29_0395_valid :
    mulPoly ep_Q2_054_coefficient_29_0395
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0396 : Poly :=
[
  term ((-4301002565694 : Rat) / 45033486517) [(6, 2)]
]

/-- Partial product 396 for generator 29. -/
def ep_Q2_054_partial_29_0396 : Poly :=
[
  term ((-8602005131388 : Rat) / 45033486517) [(6, 2), (12, 1), (14, 1)],
  term ((4301002565694 : Rat) / 45033486517) [(6, 2), (12, 2)],
  term ((-8602005131388 : Rat) / 45033486517) [(6, 2), (13, 1), (15, 1)],
  term ((4301002565694 : Rat) / 45033486517) [(6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 29. -/
theorem ep_Q2_054_partial_29_0396_valid :
    mulPoly ep_Q2_054_coefficient_29_0396
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0397 : Poly :=
[
  term ((477257521446 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 397 for generator 29. -/
def ep_Q2_054_partial_29_0397 : Poly :=
[
  term ((954515042892 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-477257521446 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 2)],
  term ((954515042892 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-477257521446 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 29. -/
theorem ep_Q2_054_partial_29_0397_valid :
    mulPoly ep_Q2_054_coefficient_29_0397
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0398 : Poly :=
[
  term ((-132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 398 for generator 29. -/
def ep_Q2_054_partial_29_0398 : Poly :=
[
  term ((-265407637500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 2)],
  term ((-265407637500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 29. -/
theorem ep_Q2_054_partial_29_0398_valid :
    mulPoly ep_Q2_054_coefficient_29_0398
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0399 : Poly :=
[
  term ((1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 399 for generator 29. -/
def ep_Q2_054_partial_29_0399 : Poly :=
[
  term ((2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 29. -/
theorem ep_Q2_054_partial_29_0399_valid :
    mulPoly ep_Q2_054_coefficient_29_0399
        ep_Q2_054_generator_29_0300_0399 =
      ep_Q2_054_partial_29_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_29_0300_0399 : List Poly :=
[
  ep_Q2_054_partial_29_0300,
  ep_Q2_054_partial_29_0301,
  ep_Q2_054_partial_29_0302,
  ep_Q2_054_partial_29_0303,
  ep_Q2_054_partial_29_0304,
  ep_Q2_054_partial_29_0305,
  ep_Q2_054_partial_29_0306,
  ep_Q2_054_partial_29_0307,
  ep_Q2_054_partial_29_0308,
  ep_Q2_054_partial_29_0309,
  ep_Q2_054_partial_29_0310,
  ep_Q2_054_partial_29_0311,
  ep_Q2_054_partial_29_0312,
  ep_Q2_054_partial_29_0313,
  ep_Q2_054_partial_29_0314,
  ep_Q2_054_partial_29_0315,
  ep_Q2_054_partial_29_0316,
  ep_Q2_054_partial_29_0317,
  ep_Q2_054_partial_29_0318,
  ep_Q2_054_partial_29_0319,
  ep_Q2_054_partial_29_0320,
  ep_Q2_054_partial_29_0321,
  ep_Q2_054_partial_29_0322,
  ep_Q2_054_partial_29_0323,
  ep_Q2_054_partial_29_0324,
  ep_Q2_054_partial_29_0325,
  ep_Q2_054_partial_29_0326,
  ep_Q2_054_partial_29_0327,
  ep_Q2_054_partial_29_0328,
  ep_Q2_054_partial_29_0329,
  ep_Q2_054_partial_29_0330,
  ep_Q2_054_partial_29_0331,
  ep_Q2_054_partial_29_0332,
  ep_Q2_054_partial_29_0333,
  ep_Q2_054_partial_29_0334,
  ep_Q2_054_partial_29_0335,
  ep_Q2_054_partial_29_0336,
  ep_Q2_054_partial_29_0337,
  ep_Q2_054_partial_29_0338,
  ep_Q2_054_partial_29_0339,
  ep_Q2_054_partial_29_0340,
  ep_Q2_054_partial_29_0341,
  ep_Q2_054_partial_29_0342,
  ep_Q2_054_partial_29_0343,
  ep_Q2_054_partial_29_0344,
  ep_Q2_054_partial_29_0345,
  ep_Q2_054_partial_29_0346,
  ep_Q2_054_partial_29_0347,
  ep_Q2_054_partial_29_0348,
  ep_Q2_054_partial_29_0349,
  ep_Q2_054_partial_29_0350,
  ep_Q2_054_partial_29_0351,
  ep_Q2_054_partial_29_0352,
  ep_Q2_054_partial_29_0353,
  ep_Q2_054_partial_29_0354,
  ep_Q2_054_partial_29_0355,
  ep_Q2_054_partial_29_0356,
  ep_Q2_054_partial_29_0357,
  ep_Q2_054_partial_29_0358,
  ep_Q2_054_partial_29_0359,
  ep_Q2_054_partial_29_0360,
  ep_Q2_054_partial_29_0361,
  ep_Q2_054_partial_29_0362,
  ep_Q2_054_partial_29_0363,
  ep_Q2_054_partial_29_0364,
  ep_Q2_054_partial_29_0365,
  ep_Q2_054_partial_29_0366,
  ep_Q2_054_partial_29_0367,
  ep_Q2_054_partial_29_0368,
  ep_Q2_054_partial_29_0369,
  ep_Q2_054_partial_29_0370,
  ep_Q2_054_partial_29_0371,
  ep_Q2_054_partial_29_0372,
  ep_Q2_054_partial_29_0373,
  ep_Q2_054_partial_29_0374,
  ep_Q2_054_partial_29_0375,
  ep_Q2_054_partial_29_0376,
  ep_Q2_054_partial_29_0377,
  ep_Q2_054_partial_29_0378,
  ep_Q2_054_partial_29_0379,
  ep_Q2_054_partial_29_0380,
  ep_Q2_054_partial_29_0381,
  ep_Q2_054_partial_29_0382,
  ep_Q2_054_partial_29_0383,
  ep_Q2_054_partial_29_0384,
  ep_Q2_054_partial_29_0385,
  ep_Q2_054_partial_29_0386,
  ep_Q2_054_partial_29_0387,
  ep_Q2_054_partial_29_0388,
  ep_Q2_054_partial_29_0389,
  ep_Q2_054_partial_29_0390,
  ep_Q2_054_partial_29_0391,
  ep_Q2_054_partial_29_0392,
  ep_Q2_054_partial_29_0393,
  ep_Q2_054_partial_29_0394,
  ep_Q2_054_partial_29_0395,
  ep_Q2_054_partial_29_0396,
  ep_Q2_054_partial_29_0397,
  ep_Q2_054_partial_29_0398,
  ep_Q2_054_partial_29_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_29_0300_0399 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 3)],
  term ((118975837500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (14, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-59487918750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 2)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((118975837500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-59487918750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 2)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 2), (16, 1)],
  term ((137279812500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((61013250000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3853393204518 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1926696602259 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 2)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3853393204518 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (14, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((1926696602259 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 3)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 3), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((137279812500 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((61013250000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 3), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3022715901600 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((1511357950800 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((-3022715901600 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((23037991339608 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((17531752229280 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11518995669804 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (13, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-8765876114640 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 3), (15, 1)],
  term ((17531752229280 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((14272115224968 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 2), (15, 3)],
  term ((-11518995669804 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 3)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 3), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((226703692620 : Rat) / 45033486517) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((226703692620 : Rat) / 45033486517) [(3, 1), (9, 1), (13, 3), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((806057573760 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((562743634215 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((461986437495 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-562743634215 : Rat) / 90066973034) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((-461986437495 : Rat) / 90066973034) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((562743634215 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((461986437495 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-562743634215 : Rat) / 90066973034) [(3, 1), (10, 1), (13, 2), (15, 1)],
  term ((-461986437495 : Rat) / 90066973034) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 2), (15, 3)],
  term ((806057573760 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 3), (15, 2)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3535497179572 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1767748589786 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 2)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3535497179572 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1767748589786 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 3), (15, 1)],
  term ((-1964765336040 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((806057573760 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((982382668020 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1964765336040 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((806057573760 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((982382668020 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-254797049876 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1007571967200 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-242145986679 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((503785983600 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((242145986679 : Rat) / 90066973034) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-251892991800 : Rat) / 45033486517) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15744479940366 : Rat) / 45033486517) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1319518324785 : Rat) / 45033486517) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((127398524938 : Rat) / 45033486517) [(3, 1), (12, 2), (13, 1)],
  term ((1133518463100 : Rat) / 45033486517) [(3, 1), (12, 2), (13, 1), (15, 2)],
  term ((503785983600 : Rat) / 45033486517) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-242145986679 : Rat) / 45033486517) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((503785983600 : Rat) / 45033486517) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((7872239970183 : Rat) / 45033486517) [(3, 1), (12, 2), (15, 1)],
  term ((1319518324785 : Rat) / 90066973034) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((242145986679 : Rat) / 90066973034) [(3, 1), (12, 3), (15, 1)],
  term ((-251892991800 : Rat) / 45033486517) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((-15744479940366 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2)],
  term ((-1319518324785 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((7617442920307 : Rat) / 45033486517) [(3, 1), (13, 2), (15, 1)],
  term ((1319518324785 : Rat) / 90066973034) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(3, 1), (13, 2), (15, 3)],
  term ((-1007571967200 : Rat) / 45033486517) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((127398524938 : Rat) / 45033486517) [(3, 1), (13, 3)],
  term ((1133518463100 : Rat) / 45033486517) [(3, 1), (13, 3), (15, 2)],
  term ((503785983600 : Rat) / 45033486517) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (12, 2)],
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (13, 2)],
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 2), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 3), (15, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 3)],
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (12, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 2)],
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 2), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 3), (15, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (12, 2), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 2), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 3)],
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (12, 2), (13, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 2), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 3)],
  term ((1995133275000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-997566637500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 2)],
  term ((1995133275000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-997566637500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((2525948550000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 3)],
  term ((-311167575000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (12, 2)],
  term ((-311167575000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 2)],
  term ((3100047779772 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1550023889886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 2)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((3100047779772 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1550023889886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 2)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((5440471301889 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5440471301889 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1), (12, 2)],
  term ((5440471301889 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5440471301889 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1), (13, 2)],
  term ((-46895884605333 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((15568927239564 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((46895884605333 : Rat) / 180133946068) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((-7784463619782 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((15568927239564 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62464811844897 : Rat) / 90066973034) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((46895884605333 : Rat) / 180133946068) [(6, 1), (7, 1), (13, 3)],
  term ((18480283493364 : Rat) / 45033486517) [(6, 1), (7, 2), (12, 1), (14, 1)],
  term ((-9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2), (12, 2)],
  term ((18480283493364 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 2)],
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 3), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-35359208947080 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17679604473540 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-35359208947080 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((17679604473540 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 2), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((61013250000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8135100000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((5603398752132 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((28009755445536 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2801699376066 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8135100000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (14, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-14004877722768 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 3)],
  term ((15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 3), (16, 1)],
  term ((5603398752132 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((28009755445536 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-2801699376066 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2)],
  term ((-42063443768304 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2), (15, 2)],
  term ((61013250000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 3), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((5279757708591 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((5279757708591 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((3400682388255 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3400682388255 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((3400682388255 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3400682388255 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((5384884399461 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-44867805716196 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5384884399461 : Rat) / 180133946068) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((22433902858098 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-44867805716196 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1916578168020 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((50252690115657 : Rat) / 90066973034) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5384884399461 : Rat) / 180133946068) [(6, 1), (9, 1), (13, 3)],
  term ((-734867342892 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 2)],
  term ((-3789141777960 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((26130916929042 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 2), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1420928166735 : Rat) / 90066973034) [(6, 1), (10, 1), (12, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 3), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((26130916929042 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 2), (15, 2)],
  term ((-4423912117296 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1420928166735 : Rat) / 90066973034) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13734294477039 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((937545315462 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13734294477039 : Rat) / 90066973034) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-468772657731 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-13734294477039 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((937545315462 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((13734294477039 : Rat) / 90066973034) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-468772657731 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3789141777960 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3789141777960 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((131132933958267 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4736427222450 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8135100000 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 2)],
  term ((2368213611225 : Rat) / 90066973034) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((3946167318516 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1)],
  term ((64181996766144 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((647037489348 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1973083659258 : Rat) / 45033486517) [(6, 1), (12, 2)],
  term ((-131132933958267 : Rat) / 90066973034) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8135100000 : Rat) / 45033486517) [(6, 1), (12, 2), (14, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((-32090998383072 : Rat) / 45033486517) [(6, 1), (12, 2), (15, 2)],
  term ((-323518744674 : Rat) / 45033486517) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (12, 2), (16, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (12, 3)],
  term ((2368213611225 : Rat) / 90066973034) [(6, 1), (12, 3), (16, 1)],
  term ((3946167318516 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((64181996766144 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 3)],
  term ((647037489348 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1973083659258 : Rat) / 45033486517) [(6, 1), (13, 2)],
  term ((99041935575195 : Rat) / 45033486517) [(6, 1), (13, 2), (15, 2)],
  term ((4412908477776 : Rat) / 45033486517) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (13, 2), (16, 1)],
  term ((-131132933958267 : Rat) / 90066973034) [(6, 1), (13, 3), (15, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-8602005131388 : Rat) / 45033486517) [(6, 2), (12, 1), (14, 1)],
  term ((4301002565694 : Rat) / 45033486517) [(6, 2), (12, 2)],
  term ((-8602005131388 : Rat) / 45033486517) [(6, 2), (13, 1), (15, 1)],
  term ((4301002565694 : Rat) / 45033486517) [(6, 2), (13, 2)],
  term ((-265407637500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 2)],
  term ((-265407637500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((954515042892 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-477257521446 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 2)],
  term ((954515042892 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-477257521446 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 2)],
  term ((2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 300 through 399. -/
theorem ep_Q2_054_block_29_0300_0399_valid :
    checkProductSumEq ep_Q2_054_partials_29_0300_0399
      ep_Q2_054_block_29_0300_0399 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
