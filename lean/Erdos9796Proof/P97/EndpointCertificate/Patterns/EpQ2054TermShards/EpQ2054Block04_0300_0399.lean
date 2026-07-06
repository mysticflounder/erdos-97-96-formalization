/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 4:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_04_0300_0399 : Poly :=
[
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0300 : Poly :=
[
  term ((-1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1)]
]

/-- Partial product 300 for generator 4. -/
def ep_Q2_054_partial_04_0300 : Poly :=
[
  term ((-1190702864280 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 2)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 2)],
  term ((-1190702864280 : Rat) / 45033486517) [(5, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem ep_Q2_054_partial_04_0300_valid :
    mulPoly ep_Q2_054_coefficient_04_0300
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0301 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 301 for generator 4. -/
def ep_Q2_054_partial_04_0301 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(5, 3), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem ep_Q2_054_partial_04_0301_valid :
    mulPoly ep_Q2_054_coefficient_04_0301
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0302 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 302 for generator 4. -/
def ep_Q2_054_partial_04_0302 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(5, 3), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem ep_Q2_054_partial_04_0302_valid :
    mulPoly ep_Q2_054_coefficient_04_0302
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0303 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 303 for generator 4. -/
def ep_Q2_054_partial_04_0303 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(5, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem ep_Q2_054_partial_04_0303_valid :
    mulPoly ep_Q2_054_coefficient_04_0303
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0304 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1)]
]

/-- Partial product 304 for generator 4. -/
def ep_Q2_054_partial_04_0304 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 2), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (11, 2), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(5, 3), (7, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem ep_Q2_054_partial_04_0304_valid :
    mulPoly ep_Q2_054_coefficient_04_0304
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0305 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 305 for generator 4. -/
def ep_Q2_054_partial_04_0305 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 2), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 2), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(5, 3), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem ep_Q2_054_partial_04_0305_valid :
    mulPoly ep_Q2_054_coefficient_04_0305
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0306 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 306 for generator 4. -/
def ep_Q2_054_partial_04_0306 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(4, 2), (6, 1)],
  term ((3050662500 : Rat) / 45033486517) [(5, 2), (6, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (10, 2)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem ep_Q2_054_partial_04_0306_valid :
    mulPoly ep_Q2_054_coefficient_04_0306
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0307 : Poly :=
[
  term ((-155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 307 for generator 4. -/
def ep_Q2_054_partial_04_0307 : Poly :=
[
  term ((-155583787500 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (11, 1)],
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem ep_Q2_054_partial_04_0307_valid :
    mulPoly ep_Q2_054_coefficient_04_0307
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0308 : Poly :=
[
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 308 for generator 4. -/
def ep_Q2_054_partial_04_0308 : Poly :=
[
  term ((-1715997656250 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem ep_Q2_054_partial_04_0308_valid :
    mulPoly ep_Q2_054_coefficient_04_0308
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0309 : Poly :=
[
  term ((-128127825000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 309 for generator 4. -/
def ep_Q2_054_partial_04_0309 : Poly :=
[
  term ((-128127825000 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (9, 1)],
  term ((128127825000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((128127825000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem ep_Q2_054_partial_04_0309_valid :
    mulPoly ep_Q2_054_coefficient_04_0309
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0310 : Poly :=
[
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 310 for generator 4. -/
def ep_Q2_054_partial_04_0310 : Poly :=
[
  term ((155583787500 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((155583787500 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 2)],
  term ((-155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem ep_Q2_054_partial_04_0310_valid :
    mulPoly ep_Q2_054_coefficient_04_0310
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0311 : Poly :=
[
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 311 for generator 4. -/
def ep_Q2_054_partial_04_0311 : Poly :=
[
  term ((1404775043127 : Rat) / 90066973034) [(4, 2), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(5, 2), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem ep_Q2_054_partial_04_0311_valid :
    mulPoly ep_Q2_054_coefficient_04_0311
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0312 : Poly :=
[
  term ((-389014506873 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 312 for generator 4. -/
def ep_Q2_054_partial_04_0312 : Poly :=
[
  term ((-389014506873 : Rat) / 180133946068) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term ((-389014506873 : Rat) / 180133946068) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((389014506873 : Rat) / 180133946068) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((389014506873 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem ep_Q2_054_partial_04_0312_valid :
    mulPoly ep_Q2_054_coefficient_04_0312
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0313 : Poly :=
[
  term ((-498508128135 : Rat) / 180133946068) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 313 for generator 4. -/
def ep_Q2_054_partial_04_0313 : Poly :=
[
  term ((-498508128135 : Rat) / 180133946068) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((-498508128135 : Rat) / 180133946068) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((498508128135 : Rat) / 180133946068) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((498508128135 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem ep_Q2_054_partial_04_0313_valid :
    mulPoly ep_Q2_054_coefficient_04_0313
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0314 : Poly :=
[
  term ((-924240661254 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 314 for generator 4. -/
def ep_Q2_054_partial_04_0314 : Poly :=
[
  term ((-924240661254 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-924240661254 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((924240661254 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((924240661254 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem ep_Q2_054_partial_04_0314_valid :
    mulPoly ep_Q2_054_coefficient_04_0314
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0315 : Poly :=
[
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (8, 1)]
]

/-- Partial product 315 for generator 4. -/
def ep_Q2_054_partial_04_0315 : Poly :=
[
  term ((-3050662500 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1)],
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2)],
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem ep_Q2_054_partial_04_0315_valid :
    mulPoly ep_Q2_054_coefficient_04_0315
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0316 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 316 for generator 4. -/
def ep_Q2_054_partial_04_0316 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem ep_Q2_054_partial_04_0316_valid :
    mulPoly ep_Q2_054_coefficient_04_0316
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0317 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 4. -/
def ep_Q2_054_partial_04_0317 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem ep_Q2_054_partial_04_0317_valid :
    mulPoly ep_Q2_054_coefficient_04_0317
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0318 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 318 for generator 4. -/
def ep_Q2_054_partial_04_0318 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem ep_Q2_054_partial_04_0318_valid :
    mulPoly ep_Q2_054_coefficient_04_0318
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0319 : Poly :=
[
  term ((3650321450772 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 319 for generator 4. -/
def ep_Q2_054_partial_04_0319 : Poly :=
[
  term ((3650321450772 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((3650321450772 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3650321450772 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-3650321450772 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem ep_Q2_054_partial_04_0319_valid :
    mulPoly ep_Q2_054_coefficient_04_0319
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0320 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 4. -/
def ep_Q2_054_partial_04_0320 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem ep_Q2_054_partial_04_0320_valid :
    mulPoly ep_Q2_054_coefficient_04_0320
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0321 : Poly :=
[
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)]
]

/-- Partial product 321 for generator 4. -/
def ep_Q2_054_partial_04_0321 : Poly :=
[
  term ((4067550000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (12, 1)],
  term ((4067550000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (12, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (12, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem ep_Q2_054_partial_04_0321_valid :
    mulPoly ep_Q2_054_coefficient_04_0321
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0322 : Poly :=
[
  term ((15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 322 for generator 4. -/
def ep_Q2_054_partial_04_0322 : Poly :=
[
  term ((15253312500 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem ep_Q2_054_partial_04_0322_valid :
    mulPoly ep_Q2_054_coefficient_04_0322
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0323 : Poly :=
[
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 323 for generator 4. -/
def ep_Q2_054_partial_04_0323 : Poly :=
[
  term ((45952838494074 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem ep_Q2_054_partial_04_0323_valid :
    mulPoly ep_Q2_054_coefficient_04_0323
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0324 : Poly :=
[
  term ((-30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 4. -/
def ep_Q2_054_partial_04_0324 : Poly :=
[
  term ((-30506625000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem ep_Q2_054_partial_04_0324_valid :
    mulPoly ep_Q2_054_coefficient_04_0324
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0325 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2)]
]

/-- Partial product 325 for generator 4. -/
def ep_Q2_054_partial_04_0325 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (15, 2)],
  term ((24405300000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (15, 2)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (15, 2)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem ep_Q2_054_partial_04_0325_valid :
    mulPoly ep_Q2_054_coefficient_04_0325
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0326 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 326 for generator 4. -/
def ep_Q2_054_partial_04_0326 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem ep_Q2_054_partial_04_0326_valid :
    mulPoly ep_Q2_054_coefficient_04_0326
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0327 : Poly :=
[
  term ((-5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 327 for generator 4. -/
def ep_Q2_054_partial_04_0327 : Poly :=
[
  term ((-5279757708591 : Rat) / 90066973034) [(4, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-5279757708591 : Rat) / 90066973034) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem ep_Q2_054_partial_04_0327_valid :
    mulPoly ep_Q2_054_coefficient_04_0327
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0328 : Poly :=
[
  term ((2020885192953 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 328 for generator 4. -/
def ep_Q2_054_partial_04_0328 : Poly :=
[
  term ((2020885192953 : Rat) / 180133946068) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((2020885192953 : Rat) / 180133946068) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((-2020885192953 : Rat) / 180133946068) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-2020885192953 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem ep_Q2_054_partial_04_0328_valid :
    mulPoly ep_Q2_054_coefficient_04_0328
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0329 : Poly :=
[
  term ((689898597651 : Rat) / 180133946068) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 329 for generator 4. -/
def ep_Q2_054_partial_04_0329 : Poly :=
[
  term ((689898597651 : Rat) / 180133946068) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((689898597651 : Rat) / 180133946068) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-689898597651 : Rat) / 180133946068) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((-689898597651 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem ep_Q2_054_partial_04_0329_valid :
    mulPoly ep_Q2_054_coefficient_04_0329
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0330 : Poly :=
[
  term ((2384733878010 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 330 for generator 4. -/
def ep_Q2_054_partial_04_0330 : Poly :=
[
  term ((2384733878010 : Rat) / 45033486517) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((2384733878010 : Rat) / 45033486517) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-2384733878010 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-2384733878010 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem ep_Q2_054_partial_04_0330_valid :
    mulPoly ep_Q2_054_coefficient_04_0330
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0331 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 331 for generator 4. -/
def ep_Q2_054_partial_04_0331 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(4, 2), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(5, 2), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem ep_Q2_054_partial_04_0331_valid :
    mulPoly ep_Q2_054_coefficient_04_0331
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0332 : Poly :=
[
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 4. -/
def ep_Q2_054_partial_04_0332 : Poly :=
[
  term ((1894570888980 : Rat) / 45033486517) [(4, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(5, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem ep_Q2_054_partial_04_0332_valid :
    mulPoly ep_Q2_054_coefficient_04_0332
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0333 : Poly :=
[
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2)]
]

/-- Partial product 333 for generator 4. -/
def ep_Q2_054_partial_04_0333 : Poly :=
[
  term ((-13065458464521 : Rat) / 45033486517) [(4, 2), (6, 1), (10, 1), (15, 2)],
  term ((-13065458464521 : Rat) / 45033486517) [(5, 2), (6, 1), (10, 1), (15, 2)],
  term ((13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 2), (15, 2)],
  term ((13065458464521 : Rat) / 45033486517) [(6, 1), (10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem ep_Q2_054_partial_04_0333_valid :
    mulPoly ep_Q2_054_coefficient_04_0333
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0334 : Poly :=
[
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 334 for generator 4. -/
def ep_Q2_054_partial_04_0334 : Poly :=
[
  term ((-634770339336 : Rat) / 45033486517) [(4, 2), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(5, 2), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem ep_Q2_054_partial_04_0334_valid :
    mulPoly ep_Q2_054_coefficient_04_0334
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0335 : Poly :=
[
  term ((1420928166735 : Rat) / 90066973034) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 335 for generator 4. -/
def ep_Q2_054_partial_04_0335 : Poly :=
[
  term ((1420928166735 : Rat) / 90066973034) [(4, 2), (6, 1), (10, 1), (16, 1)],
  term ((1420928166735 : Rat) / 90066973034) [(5, 2), (6, 1), (10, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 90066973034) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-1420928166735 : Rat) / 90066973034) [(6, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem ep_Q2_054_partial_04_0335_valid :
    mulPoly ep_Q2_054_coefficient_04_0335
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0336 : Poly :=
[
  term ((16934212859679 : Rat) / 90066973034) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 336 for generator 4. -/
def ep_Q2_054_partial_04_0336 : Poly :=
[
  term ((16934212859679 : Rat) / 90066973034) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((16934212859679 : Rat) / 90066973034) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-16934212859679 : Rat) / 90066973034) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-16934212859679 : Rat) / 90066973034) [(6, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem ep_Q2_054_partial_04_0336_valid :
    mulPoly ep_Q2_054_coefficient_04_0336
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0337 : Poly :=
[
  term ((156257552577 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 4. -/
def ep_Q2_054_partial_04_0337 : Poly :=
[
  term ((156257552577 : Rat) / 45033486517) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((156257552577 : Rat) / 45033486517) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-156257552577 : Rat) / 45033486517) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-156257552577 : Rat) / 45033486517) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem ep_Q2_054_partial_04_0337_valid :
    mulPoly ep_Q2_054_coefficient_04_0337
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0338 : Poly :=
[
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (12, 1)]
]

/-- Partial product 338 for generator 4. -/
def ep_Q2_054_partial_04_0338 : Poly :=
[
  term ((-4067550000 : Rat) / 45033486517) [(4, 2), (6, 1), (12, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(5, 2), (6, 1), (12, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (10, 2), (12, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem ep_Q2_054_partial_04_0338_valid :
    mulPoly ep_Q2_054_coefficient_04_0338
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0339 : Poly :=
[
  term ((2368213611225 : Rat) / 90066973034) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 339 for generator 4. -/
def ep_Q2_054_partial_04_0339 : Poly :=
[
  term ((2368213611225 : Rat) / 90066973034) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term ((2368213611225 : Rat) / 90066973034) [(5, 2), (6, 1), (12, 1), (16, 1)],
  term ((-2368213611225 : Rat) / 90066973034) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((-2368213611225 : Rat) / 90066973034) [(6, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem ep_Q2_054_partial_04_0339_valid :
    mulPoly ep_Q2_054_coefficient_04_0339
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0340 : Poly :=
[
  term ((-38302062349617 : Rat) / 90066973034) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 340 for generator 4. -/
def ep_Q2_054_partial_04_0340 : Poly :=
[
  term ((-38302062349617 : Rat) / 90066973034) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-38302062349617 : Rat) / 90066973034) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((38302062349617 : Rat) / 90066973034) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((38302062349617 : Rat) / 90066973034) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem ep_Q2_054_partial_04_0340_valid :
    mulPoly ep_Q2_054_coefficient_04_0340
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0341 : Poly :=
[
  term ((-2368213611225 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 4. -/
def ep_Q2_054_partial_04_0341 : Poly :=
[
  term ((-2368213611225 : Rat) / 45033486517) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2368213611225 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2368213611225 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem ep_Q2_054_partial_04_0341_valid :
    mulPoly ep_Q2_054_coefficient_04_0341
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0342 : Poly :=
[
  term ((-17553106982916 : Rat) / 45033486517) [(6, 1), (15, 2)]
]

/-- Partial product 342 for generator 4. -/
def ep_Q2_054_partial_04_0342 : Poly :=
[
  term ((-17553106982916 : Rat) / 45033486517) [(4, 2), (6, 1), (15, 2)],
  term ((-17553106982916 : Rat) / 45033486517) [(5, 2), (6, 1), (15, 2)],
  term ((17553106982916 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2)],
  term ((17553106982916 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem ep_Q2_054_partial_04_0342_valid :
    mulPoly ep_Q2_054_coefficient_04_0342
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0343 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 343 for generator 4. -/
def ep_Q2_054_partial_04_0343 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem ep_Q2_054_partial_04_0343_valid :
    mulPoly ep_Q2_054_coefficient_04_0343
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0344 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (16, 1)]
]

/-- Partial product 344 for generator 4. -/
def ep_Q2_054_partial_04_0344 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(4, 2), (6, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(5, 2), (6, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem ep_Q2_054_partial_04_0344_valid :
    mulPoly ep_Q2_054_coefficient_04_0344
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0345 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 345 for generator 4. -/
def ep_Q2_054_partial_04_0345 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (9, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (9, 1)],
  term ((109823850000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((109823850000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 4. -/
theorem ep_Q2_054_partial_04_0345_valid :
    mulPoly ep_Q2_054_coefficient_04_0345
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0346 : Poly :=
[
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 346 for generator 4. -/
def ep_Q2_054_partial_04_0346 : Poly :=
[
  term ((132703818750 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((132703818750 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 2)],
  term ((-132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 4. -/
theorem ep_Q2_054_partial_04_0346_valid :
    mulPoly ep_Q2_054_coefficient_04_0346
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0347 : Poly :=
[
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 347 for generator 4. -/
def ep_Q2_054_partial_04_0347 : Poly :=
[
  term ((-1017573207390 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 4. -/
theorem ep_Q2_054_partial_04_0347_valid :
    mulPoly ep_Q2_054_coefficient_04_0347
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0348 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 4. -/
def ep_Q2_054_partial_04_0348 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 4. -/
theorem ep_Q2_054_partial_04_0348_valid :
    mulPoly ep_Q2_054_coefficient_04_0348
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0349 : Poly :=
[
  term ((5765502342519 : Rat) / 90066973034) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 349 for generator 4. -/
def ep_Q2_054_partial_04_0349 : Poly :=
[
  term ((5765502342519 : Rat) / 90066973034) [(4, 2), (7, 1), (8, 1), (11, 1)],
  term ((5765502342519 : Rat) / 90066973034) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term ((-5765502342519 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((-5765502342519 : Rat) / 90066973034) [(7, 1), (8, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 4. -/
theorem ep_Q2_054_partial_04_0349_valid :
    mulPoly ep_Q2_054_coefficient_04_0349
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0350 : Poly :=
[
  term ((700127043750 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 350 for generator 4. -/
def ep_Q2_054_partial_04_0350 : Poly :=
[
  term ((700127043750 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((700127043750 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-700127043750 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1), (12, 1)],
  term ((-700127043750 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 4. -/
theorem ep_Q2_054_partial_04_0350_valid :
    mulPoly ep_Q2_054_coefficient_04_0350
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0351 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 351 for generator 4. -/
def ep_Q2_054_partial_04_0351 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 4. -/
theorem ep_Q2_054_partial_04_0351_valid :
    mulPoly ep_Q2_054_coefficient_04_0351
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0352 : Poly :=
[
  term ((971625284037 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 352 for generator 4. -/
def ep_Q2_054_partial_04_0352 : Poly :=
[
  term ((971625284037 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((971625284037 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-971625284037 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-971625284037 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 4. -/
theorem ep_Q2_054_partial_04_0352_valid :
    mulPoly ep_Q2_054_coefficient_04_0352
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0353 : Poly :=
[
  term ((3888832021875 : Rat) / 90066973034) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 353 for generator 4. -/
def ep_Q2_054_partial_04_0353 : Poly :=
[
  term ((3888832021875 : Rat) / 90066973034) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((3888832021875 : Rat) / 90066973034) [(5, 2), (7, 1), (8, 1), (13, 1)],
  term ((-3888832021875 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-3888832021875 : Rat) / 90066973034) [(7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 4. -/
theorem ep_Q2_054_partial_04_0353_valid :
    mulPoly ep_Q2_054_coefficient_04_0353
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0354 : Poly :=
[
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 354 for generator 4. -/
def ep_Q2_054_partial_04_0354 : Poly :=
[
  term ((91905676988148 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 4. -/
theorem ep_Q2_054_partial_04_0354_valid :
    mulPoly ep_Q2_054_coefficient_04_0354
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0355 : Poly :=
[
  term ((-6594234642441 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 355 for generator 4. -/
def ep_Q2_054_partial_04_0355 : Poly :=
[
  term ((-6594234642441 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((-6594234642441 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((6594234642441 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((6594234642441 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 4. -/
theorem ep_Q2_054_partial_04_0355_valid :
    mulPoly ep_Q2_054_coefficient_04_0355
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0356 : Poly :=
[
  term ((-132703818750 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1)]
]

/-- Partial product 356 for generator 4. -/
def ep_Q2_054_partial_04_0356 : Poly :=
[
  term ((-132703818750 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 2), (11, 1)],
  term ((-132703818750 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 2), (11, 1)],
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 2), (11, 1)],
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 4. -/
theorem ep_Q2_054_partial_04_0356_valid :
    mulPoly ep_Q2_054_coefficient_04_0356
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0357 : Poly :=
[
  term ((12182063323275 : Rat) / 90066973034) [(7, 1), (9, 1)]
]

/-- Partial product 357 for generator 4. -/
def ep_Q2_054_partial_04_0357 : Poly :=
[
  term ((12182063323275 : Rat) / 90066973034) [(4, 2), (7, 1), (9, 1)],
  term ((12182063323275 : Rat) / 90066973034) [(5, 2), (7, 1), (9, 1)],
  term ((-12182063323275 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 2)],
  term ((-12182063323275 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 4. -/
theorem ep_Q2_054_partial_04_0357_valid :
    mulPoly ep_Q2_054_coefficient_04_0357
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0358 : Poly :=
[
  term ((-16868034312093 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 358 for generator 4. -/
def ep_Q2_054_partial_04_0358 : Poly :=
[
  term ((-16868034312093 : Rat) / 180133946068) [(4, 2), (7, 1), (9, 1), (10, 1)],
  term ((-16868034312093 : Rat) / 180133946068) [(5, 2), (7, 1), (9, 1), (10, 1)],
  term ((16868034312093 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((16868034312093 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 4. -/
theorem ep_Q2_054_partial_04_0358_valid :
    mulPoly ep_Q2_054_coefficient_04_0358
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0359 : Poly :=
[
  term ((723870918675 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 359 for generator 4. -/
def ep_Q2_054_partial_04_0359 : Poly :=
[
  term ((723870918675 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((723870918675 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-723870918675 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((-723870918675 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 4. -/
theorem ep_Q2_054_partial_04_0359_valid :
    mulPoly ep_Q2_054_coefficient_04_0359
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0360 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 360 for generator 4. -/
def ep_Q2_054_partial_04_0360 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 4. -/
theorem ep_Q2_054_partial_04_0360_valid :
    mulPoly ep_Q2_054_coefficient_04_0360
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0361 : Poly :=
[
  term ((1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 361 for generator 4. -/
def ep_Q2_054_partial_04_0361 : Poly :=
[
  term ((1423997962425 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1423997962425 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 4. -/
theorem ep_Q2_054_partial_04_0361_valid :
    mulPoly ep_Q2_054_coefficient_04_0361
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0362 : Poly :=
[
  term ((-1423997962425 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 362 for generator 4. -/
def ep_Q2_054_partial_04_0362 : Poly :=
[
  term ((-1423997962425 : Rat) / 90066973034) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1423997962425 : Rat) / 90066973034) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((1423997962425 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((1423997962425 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 4. -/
theorem ep_Q2_054_partial_04_0362_valid :
    mulPoly ep_Q2_054_coefficient_04_0362
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0363 : Poly :=
[
  term ((-271273944051 : Rat) / 180133946068) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 363 for generator 4. -/
def ep_Q2_054_partial_04_0363 : Poly :=
[
  term ((-271273944051 : Rat) / 180133946068) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((-271273944051 : Rat) / 180133946068) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((271273944051 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((271273944051 : Rat) / 180133946068) [(7, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 4. -/
theorem ep_Q2_054_partial_04_0363_valid :
    mulPoly ep_Q2_054_coefficient_04_0363
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0364 : Poly :=
[
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 364 for generator 4. -/
def ep_Q2_054_partial_04_0364 : Poly :=
[
  term ((81651926988 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 4. -/
theorem ep_Q2_054_partial_04_0364_valid :
    mulPoly ep_Q2_054_coefficient_04_0364
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0365 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 365 for generator 4. -/
def ep_Q2_054_partial_04_0365 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 4. -/
theorem ep_Q2_054_partial_04_0365_valid :
    mulPoly ep_Q2_054_coefficient_04_0365
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0366 : Poly :=
[
  term ((3567136884075 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 366 for generator 4. -/
def ep_Q2_054_partial_04_0366 : Poly :=
[
  term ((3567136884075 : Rat) / 45033486517) [(4, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((3567136884075 : Rat) / 45033486517) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3567136884075 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3567136884075 : Rat) / 45033486517) [(7, 1), (10, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 4. -/
theorem ep_Q2_054_partial_04_0366_valid :
    mulPoly ep_Q2_054_coefficient_04_0366
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0367 : Poly :=
[
  term ((-3914431504323 : Rat) / 90066973034) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 367 for generator 4. -/
def ep_Q2_054_partial_04_0367 : Poly :=
[
  term ((-3914431504323 : Rat) / 90066973034) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-3914431504323 : Rat) / 90066973034) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((3914431504323 : Rat) / 90066973034) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((3914431504323 : Rat) / 90066973034) [(7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 4. -/
theorem ep_Q2_054_partial_04_0367_valid :
    mulPoly ep_Q2_054_coefficient_04_0367
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0368 : Poly :=
[
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 368 for generator 4. -/
def ep_Q2_054_partial_04_0368 : Poly :=
[
  term ((-205068152577 : Rat) / 45033486517) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 4. -/
theorem ep_Q2_054_partial_04_0368_valid :
    mulPoly ep_Q2_054_coefficient_04_0368
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0369 : Poly :=
[
  term ((1011539539281 : Rat) / 45033486517) [(7, 1), (11, 1)]
]

/-- Partial product 369 for generator 4. -/
def ep_Q2_054_partial_04_0369 : Poly :=
[
  term ((1011539539281 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1)],
  term ((1011539539281 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1)],
  term ((-1011539539281 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1)],
  term ((-1011539539281 : Rat) / 45033486517) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 4. -/
theorem ep_Q2_054_partial_04_0369_valid :
    mulPoly ep_Q2_054_coefficient_04_0369
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0370 : Poly :=
[
  term ((-748052195499 : Rat) / 90066973034) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 370 for generator 4. -/
def ep_Q2_054_partial_04_0370 : Poly :=
[
  term ((-748052195499 : Rat) / 90066973034) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-748052195499 : Rat) / 90066973034) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((748052195499 : Rat) / 90066973034) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((748052195499 : Rat) / 90066973034) [(7, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 4. -/
theorem ep_Q2_054_partial_04_0370_valid :
    mulPoly ep_Q2_054_coefficient_04_0370
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0371 : Poly :=
[
  term ((2914934992074 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 371 for generator 4. -/
def ep_Q2_054_partial_04_0371 : Poly :=
[
  term ((2914934992074 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2914934992074 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 4. -/
theorem ep_Q2_054_partial_04_0371_valid :
    mulPoly ep_Q2_054_coefficient_04_0371
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0372 : Poly :=
[
  term ((-1457467496037 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 372 for generator 4. -/
def ep_Q2_054_partial_04_0372 : Poly :=
[
  term ((-1457467496037 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1), (15, 2)],
  term ((-1457467496037 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1), (15, 2)],
  term ((1457467496037 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((1457467496037 : Rat) / 45033486517) [(7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 4. -/
theorem ep_Q2_054_partial_04_0372_valid :
    mulPoly ep_Q2_054_coefficient_04_0372
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0373 : Poly :=
[
  term ((-205068152577 : Rat) / 90066973034) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 373 for generator 4. -/
def ep_Q2_054_partial_04_0373 : Poly :=
[
  term ((-205068152577 : Rat) / 90066973034) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-205068152577 : Rat) / 90066973034) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((205068152577 : Rat) / 90066973034) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((205068152577 : Rat) / 90066973034) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 4. -/
theorem ep_Q2_054_partial_04_0373_valid :
    mulPoly ep_Q2_054_coefficient_04_0373
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0374 : Poly :=
[
  term ((-12220355244249 : Rat) / 180133946068) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 374 for generator 4. -/
def ep_Q2_054_partial_04_0374 : Poly :=
[
  term ((-12220355244249 : Rat) / 180133946068) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-12220355244249 : Rat) / 180133946068) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((12220355244249 : Rat) / 180133946068) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((12220355244249 : Rat) / 180133946068) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 4. -/
theorem ep_Q2_054_partial_04_0374_valid :
    mulPoly ep_Q2_054_coefficient_04_0374
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0375 : Poly :=
[
  term ((1044941408019 : Rat) / 360267892136) [(7, 1), (13, 1)]
]

/-- Partial product 375 for generator 4. -/
def ep_Q2_054_partial_04_0375 : Poly :=
[
  term ((1044941408019 : Rat) / 360267892136) [(4, 2), (7, 1), (13, 1)],
  term ((1044941408019 : Rat) / 360267892136) [(5, 2), (7, 1), (13, 1)],
  term ((-1044941408019 : Rat) / 360267892136) [(7, 1), (10, 2), (13, 1)],
  term ((-1044941408019 : Rat) / 360267892136) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 4. -/
theorem ep_Q2_054_partial_04_0375_valid :
    mulPoly ep_Q2_054_coefficient_04_0375
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0376 : Poly :=
[
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 376 for generator 4. -/
def ep_Q2_054_partial_04_0376 : Poly :=
[
  term ((-39759529845654 : Rat) / 45033486517) [(4, 2), (7, 1), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(5, 2), (7, 1), (13, 1), (15, 2)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 4. -/
theorem ep_Q2_054_partial_04_0376_valid :
    mulPoly ep_Q2_054_coefficient_04_0376
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0377 : Poly :=
[
  term ((-5544214462839 : Rat) / 90066973034) [(7, 1), (15, 1)]
]

/-- Partial product 377 for generator 4. -/
def ep_Q2_054_partial_04_0377 : Poly :=
[
  term ((-5544214462839 : Rat) / 90066973034) [(4, 2), (7, 1), (15, 1)],
  term ((-5544214462839 : Rat) / 90066973034) [(5, 2), (7, 1), (15, 1)],
  term ((5544214462839 : Rat) / 90066973034) [(7, 1), (10, 2), (15, 1)],
  term ((5544214462839 : Rat) / 90066973034) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 4. -/
theorem ep_Q2_054_partial_04_0377_valid :
    mulPoly ep_Q2_054_coefficient_04_0377
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0378 : Poly :=
[
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 4. -/
def ep_Q2_054_partial_04_0378 : Poly :=
[
  term ((205068152577 : Rat) / 45033486517) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((205068152577 : Rat) / 45033486517) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 4. -/
theorem ep_Q2_054_partial_04_0378_valid :
    mulPoly ep_Q2_054_coefficient_04_0378
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0379 : Poly :=
[
  term ((176878304325 : Rat) / 45033486517) [(7, 2)]
]

/-- Partial product 379 for generator 4. -/
def ep_Q2_054_partial_04_0379 : Poly :=
[
  term ((176878304325 : Rat) / 45033486517) [(4, 2), (7, 2)],
  term ((176878304325 : Rat) / 45033486517) [(5, 2), (7, 2)],
  term ((-176878304325 : Rat) / 45033486517) [(7, 2), (10, 2)],
  term ((-176878304325 : Rat) / 45033486517) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 4. -/
theorem ep_Q2_054_partial_04_0379_valid :
    mulPoly ep_Q2_054_coefficient_04_0379
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0380 : Poly :=
[
  term ((237951675000 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 380 for generator 4. -/
def ep_Q2_054_partial_04_0380 : Poly :=
[
  term ((237951675000 : Rat) / 45033486517) [(4, 2), (7, 2), (8, 1)],
  term ((237951675000 : Rat) / 45033486517) [(5, 2), (7, 2), (8, 1)],
  term ((-237951675000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2)],
  term ((-237951675000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 4. -/
theorem ep_Q2_054_partial_04_0380_valid :
    mulPoly ep_Q2_054_coefficient_04_0380
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0381 : Poly :=
[
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 381 for generator 4. -/
def ep_Q2_054_partial_04_0381 : Poly :=
[
  term ((-3431995312500 : Rat) / 45033486517) [(4, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(5, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 4. -/
theorem ep_Q2_054_partial_04_0381_valid :
    mulPoly ep_Q2_054_coefficient_04_0381
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0382 : Poly :=
[
  term ((-91339512975 : Rat) / 180133946068) [(7, 2), (10, 1)]
]

/-- Partial product 382 for generator 4. -/
def ep_Q2_054_partial_04_0382 : Poly :=
[
  term ((-91339512975 : Rat) / 180133946068) [(4, 2), (7, 2), (10, 1)],
  term ((-91339512975 : Rat) / 180133946068) [(5, 2), (7, 2), (10, 1)],
  term ((91339512975 : Rat) / 180133946068) [(7, 2), (10, 1), (11, 2)],
  term ((91339512975 : Rat) / 180133946068) [(7, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 4. -/
theorem ep_Q2_054_partial_04_0382_valid :
    mulPoly ep_Q2_054_coefficient_04_0382
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0383 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (12, 1)]
]

/-- Partial product 383 for generator 4. -/
def ep_Q2_054_partial_04_0383 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(4, 2), (7, 2), (10, 1), (12, 1)],
  term ((30446504325 : Rat) / 45033486517) [(5, 2), (7, 2), (10, 1), (12, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 2), (12, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 4. -/
theorem ep_Q2_054_partial_04_0383_valid :
    mulPoly ep_Q2_054_coefficient_04_0383
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0384 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 384 for generator 4. -/
def ep_Q2_054_partial_04_0384 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((30446504325 : Rat) / 45033486517) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 4. -/
theorem ep_Q2_054_partial_04_0384_valid :
    mulPoly ep_Q2_054_coefficient_04_0384
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0385 : Poly :=
[
  term ((-30446504325 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 385 for generator 4. -/
def ep_Q2_054_partial_04_0385 : Poly :=
[
  term ((-30446504325 : Rat) / 90066973034) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 4. -/
theorem ep_Q2_054_partial_04_0385_valid :
    mulPoly ep_Q2_054_coefficient_04_0385
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0386 : Poly :=
[
  term ((-152232521625 : Rat) / 180133946068) [(7, 2), (12, 1)]
]

/-- Partial product 386 for generator 4. -/
def ep_Q2_054_partial_04_0386 : Poly :=
[
  term ((-152232521625 : Rat) / 180133946068) [(4, 2), (7, 2), (12, 1)],
  term ((-152232521625 : Rat) / 180133946068) [(5, 2), (7, 2), (12, 1)],
  term ((152232521625 : Rat) / 180133946068) [(7, 2), (10, 2), (12, 1)],
  term ((152232521625 : Rat) / 180133946068) [(7, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 4. -/
theorem ep_Q2_054_partial_04_0386_valid :
    mulPoly ep_Q2_054_coefficient_04_0386
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0387 : Poly :=
[
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 387 for generator 4. -/
def ep_Q2_054_partial_04_0387 : Poly :=
[
  term ((-264477316230 : Rat) / 45033486517) [(4, 2), (7, 2), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(5, 2), (7, 2), (13, 1), (15, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 4. -/
theorem ep_Q2_054_partial_04_0387_valid :
    mulPoly ep_Q2_054_coefficient_04_0387
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0388 : Poly :=
[
  term ((3112703933613 : Rat) / 90066973034) [(8, 1)]
]

/-- Partial product 388 for generator 4. -/
def ep_Q2_054_partial_04_0388 : Poly :=
[
  term ((3112703933613 : Rat) / 90066973034) [(4, 2), (8, 1)],
  term ((3112703933613 : Rat) / 90066973034) [(5, 2), (8, 1)],
  term ((-3112703933613 : Rat) / 90066973034) [(8, 1), (10, 2)],
  term ((-3112703933613 : Rat) / 90066973034) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 4. -/
theorem ep_Q2_054_partial_04_0388_valid :
    mulPoly ep_Q2_054_coefficient_04_0388
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0389 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 389 for generator 4. -/
def ep_Q2_054_partial_04_0389 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((268454987811 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 3)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 4. -/
theorem ep_Q2_054_partial_04_0389_valid :
    mulPoly ep_Q2_054_coefficient_04_0389
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0390 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 390 for generator 4. -/
def ep_Q2_054_partial_04_0390 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 4. -/
theorem ep_Q2_054_partial_04_0390_valid :
    mulPoly ep_Q2_054_coefficient_04_0390
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0391 : Poly :=
[
  term ((272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 391 for generator 4. -/
def ep_Q2_054_partial_04_0391 : Poly :=
[
  term ((272471021838 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((272471021838 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 4. -/
theorem ep_Q2_054_partial_04_0391_valid :
    mulPoly ep_Q2_054_coefficient_04_0391
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0392 : Poly :=
[
  term ((-580017180441 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 392 for generator 4. -/
def ep_Q2_054_partial_04_0392 : Poly :=
[
  term ((-580017180441 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (11, 1)],
  term ((-580017180441 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (11, 1)],
  term ((580017180441 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((580017180441 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 4. -/
theorem ep_Q2_054_partial_04_0392_valid :
    mulPoly ep_Q2_054_coefficient_04_0392
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0393 : Poly :=
[
  term ((-571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 393 for generator 4. -/
def ep_Q2_054_partial_04_0393 : Poly :=
[
  term ((-571563488916 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 4. -/
theorem ep_Q2_054_partial_04_0393_valid :
    mulPoly ep_Q2_054_coefficient_04_0393
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0394 : Poly :=
[
  term ((268454987811 : Rat) / 90066973034) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 394 for generator 4. -/
def ep_Q2_054_partial_04_0394 : Poly :=
[
  term ((268454987811 : Rat) / 90066973034) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((268454987811 : Rat) / 90066973034) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term ((-268454987811 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-268454987811 : Rat) / 90066973034) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 4. -/
theorem ep_Q2_054_partial_04_0394_valid :
    mulPoly ep_Q2_054_coefficient_04_0394
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0395 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 395 for generator 4. -/
def ep_Q2_054_partial_04_0395 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 4. -/
theorem ep_Q2_054_partial_04_0395_valid :
    mulPoly ep_Q2_054_coefficient_04_0395
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0396 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 396 for generator 4. -/
def ep_Q2_054_partial_04_0396 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 4. -/
theorem ep_Q2_054_partial_04_0396_valid :
    mulPoly ep_Q2_054_coefficient_04_0396
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0397 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 397 for generator 4. -/
def ep_Q2_054_partial_04_0397 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 4. -/
theorem ep_Q2_054_partial_04_0397_valid :
    mulPoly ep_Q2_054_coefficient_04_0397
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0398 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 398 for generator 4. -/
def ep_Q2_054_partial_04_0398 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 4. -/
theorem ep_Q2_054_partial_04_0398_valid :
    mulPoly ep_Q2_054_coefficient_04_0398
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 4. -/
def ep_Q2_054_coefficient_04_0399 : Poly :=
[
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 4. -/
def ep_Q2_054_partial_04_0399 : Poly :=
[
  term ((201158132262 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 4. -/
theorem ep_Q2_054_partial_04_0399_valid :
    mulPoly ep_Q2_054_coefficient_04_0399
        ep_Q2_054_generator_04_0300_0399 =
      ep_Q2_054_partial_04_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_04_0300_0399 : List Poly :=
[
  ep_Q2_054_partial_04_0300,
  ep_Q2_054_partial_04_0301,
  ep_Q2_054_partial_04_0302,
  ep_Q2_054_partial_04_0303,
  ep_Q2_054_partial_04_0304,
  ep_Q2_054_partial_04_0305,
  ep_Q2_054_partial_04_0306,
  ep_Q2_054_partial_04_0307,
  ep_Q2_054_partial_04_0308,
  ep_Q2_054_partial_04_0309,
  ep_Q2_054_partial_04_0310,
  ep_Q2_054_partial_04_0311,
  ep_Q2_054_partial_04_0312,
  ep_Q2_054_partial_04_0313,
  ep_Q2_054_partial_04_0314,
  ep_Q2_054_partial_04_0315,
  ep_Q2_054_partial_04_0316,
  ep_Q2_054_partial_04_0317,
  ep_Q2_054_partial_04_0318,
  ep_Q2_054_partial_04_0319,
  ep_Q2_054_partial_04_0320,
  ep_Q2_054_partial_04_0321,
  ep_Q2_054_partial_04_0322,
  ep_Q2_054_partial_04_0323,
  ep_Q2_054_partial_04_0324,
  ep_Q2_054_partial_04_0325,
  ep_Q2_054_partial_04_0326,
  ep_Q2_054_partial_04_0327,
  ep_Q2_054_partial_04_0328,
  ep_Q2_054_partial_04_0329,
  ep_Q2_054_partial_04_0330,
  ep_Q2_054_partial_04_0331,
  ep_Q2_054_partial_04_0332,
  ep_Q2_054_partial_04_0333,
  ep_Q2_054_partial_04_0334,
  ep_Q2_054_partial_04_0335,
  ep_Q2_054_partial_04_0336,
  ep_Q2_054_partial_04_0337,
  ep_Q2_054_partial_04_0338,
  ep_Q2_054_partial_04_0339,
  ep_Q2_054_partial_04_0340,
  ep_Q2_054_partial_04_0341,
  ep_Q2_054_partial_04_0342,
  ep_Q2_054_partial_04_0343,
  ep_Q2_054_partial_04_0344,
  ep_Q2_054_partial_04_0345,
  ep_Q2_054_partial_04_0346,
  ep_Q2_054_partial_04_0347,
  ep_Q2_054_partial_04_0348,
  ep_Q2_054_partial_04_0349,
  ep_Q2_054_partial_04_0350,
  ep_Q2_054_partial_04_0351,
  ep_Q2_054_partial_04_0352,
  ep_Q2_054_partial_04_0353,
  ep_Q2_054_partial_04_0354,
  ep_Q2_054_partial_04_0355,
  ep_Q2_054_partial_04_0356,
  ep_Q2_054_partial_04_0357,
  ep_Q2_054_partial_04_0358,
  ep_Q2_054_partial_04_0359,
  ep_Q2_054_partial_04_0360,
  ep_Q2_054_partial_04_0361,
  ep_Q2_054_partial_04_0362,
  ep_Q2_054_partial_04_0363,
  ep_Q2_054_partial_04_0364,
  ep_Q2_054_partial_04_0365,
  ep_Q2_054_partial_04_0366,
  ep_Q2_054_partial_04_0367,
  ep_Q2_054_partial_04_0368,
  ep_Q2_054_partial_04_0369,
  ep_Q2_054_partial_04_0370,
  ep_Q2_054_partial_04_0371,
  ep_Q2_054_partial_04_0372,
  ep_Q2_054_partial_04_0373,
  ep_Q2_054_partial_04_0374,
  ep_Q2_054_partial_04_0375,
  ep_Q2_054_partial_04_0376,
  ep_Q2_054_partial_04_0377,
  ep_Q2_054_partial_04_0378,
  ep_Q2_054_partial_04_0379,
  ep_Q2_054_partial_04_0380,
  ep_Q2_054_partial_04_0381,
  ep_Q2_054_partial_04_0382,
  ep_Q2_054_partial_04_0383,
  ep_Q2_054_partial_04_0384,
  ep_Q2_054_partial_04_0385,
  ep_Q2_054_partial_04_0386,
  ep_Q2_054_partial_04_0387,
  ep_Q2_054_partial_04_0388,
  ep_Q2_054_partial_04_0389,
  ep_Q2_054_partial_04_0390,
  ep_Q2_054_partial_04_0391,
  ep_Q2_054_partial_04_0392,
  ep_Q2_054_partial_04_0393,
  ep_Q2_054_partial_04_0394,
  ep_Q2_054_partial_04_0395,
  ep_Q2_054_partial_04_0396,
  ep_Q2_054_partial_04_0397,
  ep_Q2_054_partial_04_0398,
  ep_Q2_054_partial_04_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_04_0300_0399 : Poly :=
[
  term ((-1190702864280 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 2), (8, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(4, 2), (5, 1), (7, 2), (13, 1)],
  term ((3050662500 : Rat) / 45033486517) [(4, 2), (6, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((155583787500 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(4, 2), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-389014506873 : Rat) / 180133946068) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term ((-498508128135 : Rat) / 180133946068) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((-924240661254 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((3650321450772 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((6101325000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4067550000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (12, 1)],
  term ((15253312500 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (15, 2)],
  term ((-12202650000 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((-5279757708591 : Rat) / 90066973034) [(4, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((2020885192953 : Rat) / 180133946068) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((689898597651 : Rat) / 180133946068) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((2384733878010 : Rat) / 45033486517) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(4, 2), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(4, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13065458464521 : Rat) / 45033486517) [(4, 2), (6, 1), (10, 1), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(4, 2), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1420928166735 : Rat) / 90066973034) [(4, 2), (6, 1), (10, 1), (16, 1)],
  term ((16934212859679 : Rat) / 90066973034) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((156257552577 : Rat) / 45033486517) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(4, 2), (6, 1), (12, 1)],
  term ((2368213611225 : Rat) / 90066973034) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term ((-38302062349617 : Rat) / 90066973034) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17553106982916 : Rat) / 45033486517) [(4, 2), (6, 1), (15, 2)],
  term ((634770339336 : Rat) / 45033486517) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(4, 2), (6, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (9, 1)],
  term ((132703818750 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5765502342519 : Rat) / 90066973034) [(4, 2), (7, 1), (8, 1), (11, 1)],
  term ((700127043750 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((971625284037 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((3888832021875 : Rat) / 90066973034) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-6594234642441 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((-132703818750 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 2), (11, 1)],
  term ((12182063323275 : Rat) / 90066973034) [(4, 2), (7, 1), (9, 1)],
  term ((-16868034312093 : Rat) / 180133946068) [(4, 2), (7, 1), (9, 1), (10, 1)],
  term ((723870918675 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((3050662500 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1423997962425 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1423997962425 : Rat) / 90066973034) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-271273944051 : Rat) / 180133946068) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((6101325000 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((3567136884075 : Rat) / 45033486517) [(4, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3914431504323 : Rat) / 90066973034) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1011539539281 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1)],
  term ((-748052195499 : Rat) / 90066973034) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((2914934992074 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1457467496037 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1), (15, 2)],
  term ((-205068152577 : Rat) / 90066973034) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-12220355244249 : Rat) / 180133946068) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((1044941408019 : Rat) / 360267892136) [(4, 2), (7, 1), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(4, 2), (7, 1), (13, 1), (15, 2)],
  term ((-5544214462839 : Rat) / 90066973034) [(4, 2), (7, 1), (15, 1)],
  term ((205068152577 : Rat) / 45033486517) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((176878304325 : Rat) / 45033486517) [(4, 2), (7, 2)],
  term ((237951675000 : Rat) / 45033486517) [(4, 2), (7, 2), (8, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(4, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-91339512975 : Rat) / 180133946068) [(4, 2), (7, 2), (10, 1)],
  term ((30446504325 : Rat) / 45033486517) [(4, 2), (7, 2), (10, 1), (12, 1)],
  term ((30446504325 : Rat) / 45033486517) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((-152232521625 : Rat) / 180133946068) [(4, 2), (7, 2), (12, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(4, 2), (7, 2), (13, 1), (15, 1)],
  term ((3112703933613 : Rat) / 90066973034) [(4, 2), (8, 1)],
  term ((268454987811 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((272471021838 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-580017180441 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (11, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((268454987811 : Rat) / 90066973034) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((268454987811 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((201158132262 : Rat) / 45033486517) [(4, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 2), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (11, 2), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 2), (13, 1)],
  term ((3050662500 : Rat) / 45033486517) [(5, 2), (6, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (9, 1)],
  term ((155583787500 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((1404775043127 : Rat) / 90066973034) [(5, 2), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-389014506873 : Rat) / 180133946068) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((-498508128135 : Rat) / 180133946068) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((-924240661254 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((3650321450772 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((6101325000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4067550000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (12, 1)],
  term ((15253312500 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (15, 2)],
  term ((-12202650000 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-5279757708591 : Rat) / 90066973034) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((2020885192953 : Rat) / 180133946068) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((689898597651 : Rat) / 180133946068) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((2384733878010 : Rat) / 45033486517) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(5, 2), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(5, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13065458464521 : Rat) / 45033486517) [(5, 2), (6, 1), (10, 1), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(5, 2), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1420928166735 : Rat) / 90066973034) [(5, 2), (6, 1), (10, 1), (16, 1)],
  term ((16934212859679 : Rat) / 90066973034) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((156257552577 : Rat) / 45033486517) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(5, 2), (6, 1), (12, 1)],
  term ((2368213611225 : Rat) / 90066973034) [(5, 2), (6, 1), (12, 1), (16, 1)],
  term ((-38302062349617 : Rat) / 90066973034) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2368213611225 : Rat) / 45033486517) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17553106982916 : Rat) / 45033486517) [(5, 2), (6, 1), (15, 2)],
  term ((634770339336 : Rat) / 45033486517) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(5, 2), (6, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (9, 1)],
  term ((132703818750 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5765502342519 : Rat) / 90066973034) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term ((700127043750 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((971625284037 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((3888832021875 : Rat) / 90066973034) [(5, 2), (7, 1), (8, 1), (13, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-6594234642441 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((-132703818750 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 2), (11, 1)],
  term ((12182063323275 : Rat) / 90066973034) [(5, 2), (7, 1), (9, 1)],
  term ((-16868034312093 : Rat) / 180133946068) [(5, 2), (7, 1), (9, 1), (10, 1)],
  term ((723870918675 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((3050662500 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1423997962425 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1423997962425 : Rat) / 90066973034) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-271273944051 : Rat) / 180133946068) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((6101325000 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((3567136884075 : Rat) / 45033486517) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3914431504323 : Rat) / 90066973034) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1011539539281 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1)],
  term ((-748052195499 : Rat) / 90066973034) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((2914934992074 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1457467496037 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1), (15, 2)],
  term ((-205068152577 : Rat) / 90066973034) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-12220355244249 : Rat) / 180133946068) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((1044941408019 : Rat) / 360267892136) [(5, 2), (7, 1), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(5, 2), (7, 1), (13, 1), (15, 2)],
  term ((-5544214462839 : Rat) / 90066973034) [(5, 2), (7, 1), (15, 1)],
  term ((205068152577 : Rat) / 45033486517) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((176878304325 : Rat) / 45033486517) [(5, 2), (7, 2)],
  term ((237951675000 : Rat) / 45033486517) [(5, 2), (7, 2), (8, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(5, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-91339512975 : Rat) / 180133946068) [(5, 2), (7, 2), (10, 1)],
  term ((30446504325 : Rat) / 45033486517) [(5, 2), (7, 2), (10, 1), (12, 1)],
  term ((30446504325 : Rat) / 45033486517) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((-152232521625 : Rat) / 180133946068) [(5, 2), (7, 2), (12, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(5, 2), (7, 2), (13, 1), (15, 1)],
  term ((3112703933613 : Rat) / 90066973034) [(5, 2), (8, 1)],
  term ((268454987811 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((272471021838 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-580017180441 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (11, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((268454987811 : Rat) / 90066973034) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((268454987811 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((201158132262 : Rat) / 45033486517) [(5, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1190702864280 : Rat) / 45033486517) [(5, 3), (7, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(5, 3), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(5, 3), (7, 1), (9, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(5, 3), (7, 1), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(5, 3), (7, 2), (8, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(5, 3), (7, 2), (13, 1)],
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (11, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 3)],
  term ((-155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 2)],
  term ((128127825000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((-155583787500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 3)],
  term ((128127825000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((389014506873 : Rat) / 180133946068) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((498508128135 : Rat) / 180133946068) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((924240661254 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((-1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 3), (15, 1)],
  term ((498508128135 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 2), (13, 1)],
  term ((924240661254 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((389014506873 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 3)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2)],
  term ((-3650321450772 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (12, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (15, 2)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 3), (12, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 3), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((30506625000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (15, 2)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-3650321450772 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 3), (15, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 3), (15, 1), (16, 1)],
  term ((5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2020885192953 : Rat) / 180133946068) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-689898597651 : Rat) / 180133946068) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((-2384733878010 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((5279757708591 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 3), (15, 1)],
  term ((-689898597651 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-2384733878010 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2020885192953 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 3)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 2), (15, 2)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1420928166735 : Rat) / 90066973034) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (10, 2)],
  term ((-16934212859679 : Rat) / 90066973034) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-156257552577 : Rat) / 45033486517) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (10, 2), (12, 1)],
  term ((-2368213611225 : Rat) / 90066973034) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((38302062349617 : Rat) / 90066973034) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((2368213611225 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((17553106982916 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 3), (12, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((13065458464521 : Rat) / 45033486517) [(6, 1), (10, 3), (15, 2)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (10, 3), (15, 2), (16, 1)],
  term ((-1420928166735 : Rat) / 90066973034) [(6, 1), (10, 3), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (11, 2)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1)],
  term ((-2368213611225 : Rat) / 90066973034) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((38302062349617 : Rat) / 90066973034) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((2368213611225 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((17553106982916 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 2), (16, 1)],
  term ((-16934212859679 : Rat) / 90066973034) [(6, 1), (11, 3), (15, 1)],
  term ((-156257552577 : Rat) / 45033486517) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 2)],
  term ((109823850000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((-132703818750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 3)],
  term ((109823850000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5765502342519 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((-700127043750 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1), (12, 1)],
  term ((9151987500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-971625284037 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3888832021875 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((6594234642441 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 3), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 3), (15, 1), (16, 1)],
  term ((-971625284037 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3888832021875 : Rat) / 90066973034) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((6594234642441 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-5765502342519 : Rat) / 90066973034) [(7, 1), (8, 1), (11, 3)],
  term ((-700127043750 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3), (12, 1)],
  term ((9151987500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3), (16, 1)],
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 2), (11, 1)],
  term ((132703818750 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 3)],
  term ((16868034312093 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((-723870918675 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-12182063323275 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 2)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((1423997962425 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((271273944051 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((16868034312093 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 3)],
  term ((-723870918675 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 3), (12, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 3), (16, 1)],
  term ((-12182063323275 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)],
  term ((271273944051 : Rat) / 180133946068) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 3), (13, 1)],
  term ((1423997962425 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term ((-3567136884075 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3914431504323 : Rat) / 90066973034) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1011539539281 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1)],
  term ((748052195499 : Rat) / 90066973034) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((1457467496037 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((205068152577 : Rat) / 90066973034) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((12220355244249 : Rat) / 180133946068) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1044941408019 : Rat) / 360267892136) [(7, 1), (10, 2), (13, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((5544214462839 : Rat) / 90066973034) [(7, 1), (10, 2), (15, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3567136884075 : Rat) / 45033486517) [(7, 1), (10, 3), (12, 1), (15, 1)],
  term ((3914431504323 : Rat) / 90066973034) [(7, 1), (10, 3), (15, 1)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((12220355244249 : Rat) / 180133946068) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1044941408019 : Rat) / 360267892136) [(7, 1), (11, 2), (13, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((5544214462839 : Rat) / 90066973034) [(7, 1), (11, 2), (15, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1011539539281 : Rat) / 45033486517) [(7, 1), (11, 3)],
  term ((748052195499 : Rat) / 90066973034) [(7, 1), (11, 3), (12, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 3), (13, 1), (15, 1)],
  term ((1457467496037 : Rat) / 45033486517) [(7, 1), (11, 3), (15, 2)],
  term ((205068152577 : Rat) / 90066973034) [(7, 1), (11, 3), (16, 1)],
  term ((-237951675000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-237951675000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((91339512975 : Rat) / 180133946068) [(7, 2), (10, 1), (11, 2)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 2), (12, 1)],
  term ((-176878304325 : Rat) / 45033486517) [(7, 2), (10, 2)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((152232521625 : Rat) / 180133946068) [(7, 2), (10, 2), (12, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((91339512975 : Rat) / 180133946068) [(7, 2), (10, 3)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 3), (12, 1)],
  term ((-176878304325 : Rat) / 45033486517) [(7, 2), (11, 2)],
  term ((152232521625 : Rat) / 180133946068) [(7, 2), (11, 2), (12, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 3), (13, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (11, 3), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 3)],
  term ((580017180441 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-268454987811 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (11, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (13, 1)],
  term ((-272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (15, 1)],
  term ((571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-268454987811 : Rat) / 90066973034) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((580017180441 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 3)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((-3112703933613 : Rat) / 90066973034) [(8, 1), (10, 2)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 3), (11, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 3), (12, 1), (16, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 3), (13, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3112703933613 : Rat) / 90066973034) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 399. -/
theorem ep_Q2_054_block_04_0300_0399_valid :
    checkProductSumEq ep_Q2_054_partials_04_0300_0399
      ep_Q2_054_block_04_0300_0399 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
