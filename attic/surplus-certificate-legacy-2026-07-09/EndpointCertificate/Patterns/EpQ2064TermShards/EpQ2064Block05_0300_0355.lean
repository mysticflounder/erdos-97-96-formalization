/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 5:300-355

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_05_0300_0355 : Poly :=
[
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0300 : Poly :=
[
  term ((-729 : Rat) / 2) [(7, 1), (11, 1)]
]

/-- Partial product 300 for generator 5. -/
def ep_Q2_064_partial_05_0300 : Poly :=
[
  term ((-729 : Rat) / 2) [(4, 2), (7, 1), (11, 1)],
  term ((-729 : Rat) / 2) [(5, 2), (7, 1), (11, 1)],
  term ((729 : Rat) / 2) [(7, 1), (11, 1), (14, 2)],
  term ((729 : Rat) / 2) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 5. -/
theorem ep_Q2_064_partial_05_0300_valid :
    mulPoly ep_Q2_064_coefficient_05_0300
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0301 : Poly :=
[
  term (27 : Rat) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 301 for generator 5. -/
def ep_Q2_064_partial_05_0301 : Poly :=
[
  term (27 : Rat) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term (27 : Rat) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term (-27 : Rat) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term (-27 : Rat) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 5. -/
theorem ep_Q2_064_partial_05_0301_valid :
    mulPoly ep_Q2_064_coefficient_05_0301
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0302 : Poly :=
[
  term ((15819 : Rat) / 4) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 302 for generator 5. -/
def ep_Q2_064_partial_05_0302 : Poly :=
[
  term ((15819 : Rat) / 4) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((15819 : Rat) / 4) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-15819 : Rat) / 4) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-15819 : Rat) / 4) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 5. -/
theorem ep_Q2_064_partial_05_0302_valid :
    mulPoly ep_Q2_064_coefficient_05_0302
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0303 : Poly :=
[
  term ((42975 : Rat) / 4) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 303 for generator 5. -/
def ep_Q2_064_partial_05_0303 : Poly :=
[
  term ((42975 : Rat) / 4) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-42975 : Rat) / 4) [(7, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 5. -/
theorem ep_Q2_064_partial_05_0303_valid :
    mulPoly ep_Q2_064_coefficient_05_0303
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0304 : Poly :=
[
  term ((-521 : Rat) / 2) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 304 for generator 5. -/
def ep_Q2_064_partial_05_0304 : Poly :=
[
  term ((-521 : Rat) / 2) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-521 : Rat) / 2) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((521 : Rat) / 2) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((521 : Rat) / 2) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 5. -/
theorem ep_Q2_064_partial_05_0304_valid :
    mulPoly ep_Q2_064_coefficient_05_0304
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0305 : Poly :=
[
  term (-22920 : Rat) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 305 for generator 5. -/
def ep_Q2_064_partial_05_0305 : Poly :=
[
  term (-22920 : Rat) [(4, 2), (7, 1), (12, 2), (15, 1)],
  term (-22920 : Rat) [(5, 2), (7, 1), (12, 2), (15, 1)],
  term (22920 : Rat) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term (22920 : Rat) [(7, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 5. -/
theorem ep_Q2_064_partial_05_0305_valid :
    mulPoly ep_Q2_064_coefficient_05_0305
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0306 : Poly :=
[
  term ((2949 : Rat) / 2) [(7, 1), (13, 1)]
]

/-- Partial product 306 for generator 5. -/
def ep_Q2_064_partial_05_0306 : Poly :=
[
  term ((2949 : Rat) / 2) [(4, 2), (7, 1), (13, 1)],
  term ((2949 : Rat) / 2) [(5, 2), (7, 1), (13, 1)],
  term ((-2949 : Rat) / 2) [(7, 1), (13, 1), (14, 2)],
  term ((-2949 : Rat) / 2) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 5. -/
theorem ep_Q2_064_partial_05_0306_valid :
    mulPoly ep_Q2_064_coefficient_05_0306
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0307 : Poly :=
[
  term ((-24051 : Rat) / 16) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 307 for generator 5. -/
def ep_Q2_064_partial_05_0307 : Poly :=
[
  term ((-24051 : Rat) / 16) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-24051 : Rat) / 16) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((24051 : Rat) / 16) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((24051 : Rat) / 16) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 5. -/
theorem ep_Q2_064_partial_05_0307_valid :
    mulPoly ep_Q2_064_coefficient_05_0307
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0308 : Poly :=
[
  term ((19401 : Rat) / 16) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 308 for generator 5. -/
def ep_Q2_064_partial_05_0308 : Poly :=
[
  term ((19401 : Rat) / 16) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((19401 : Rat) / 16) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((-19401 : Rat) / 16) [(7, 1), (14, 1), (15, 3)],
  term ((-19401 : Rat) / 16) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 5. -/
theorem ep_Q2_064_partial_05_0308_valid :
    mulPoly ep_Q2_064_coefficient_05_0308
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0309 : Poly :=
[
  term (16 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 5. -/
def ep_Q2_064_partial_05_0309 : Poly :=
[
  term (16 : Rat) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term (-16 : Rat) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 5. -/
theorem ep_Q2_064_partial_05_0309_valid :
    mulPoly ep_Q2_064_coefficient_05_0309
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0310 : Poly :=
[
  term ((-70793 : Rat) / 8) [(7, 1), (15, 1)]
]

/-- Partial product 310 for generator 5. -/
def ep_Q2_064_partial_05_0310 : Poly :=
[
  term ((-70793 : Rat) / 8) [(4, 2), (7, 1), (15, 1)],
  term ((-70793 : Rat) / 8) [(5, 2), (7, 1), (15, 1)],
  term ((70793 : Rat) / 8) [(7, 1), (14, 2), (15, 1)],
  term ((70793 : Rat) / 8) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 5. -/
theorem ep_Q2_064_partial_05_0310_valid :
    mulPoly ep_Q2_064_coefficient_05_0310
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0311 : Poly :=
[
  term (-32 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 5. -/
def ep_Q2_064_partial_05_0311 : Poly :=
[
  term (-32 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (32 : Rat) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 5. -/
theorem ep_Q2_064_partial_05_0311_valid :
    mulPoly ep_Q2_064_coefficient_05_0311
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0312 : Poly :=
[
  term (378 : Rat) [(7, 2)]
]

/-- Partial product 312 for generator 5. -/
def ep_Q2_064_partial_05_0312 : Poly :=
[
  term (378 : Rat) [(4, 2), (7, 2)],
  term (378 : Rat) [(5, 2), (7, 2)],
  term (-378 : Rat) [(7, 2), (14, 2)],
  term (-378 : Rat) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 5. -/
theorem ep_Q2_064_partial_05_0312_valid :
    mulPoly ep_Q2_064_coefficient_05_0312
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0313 : Poly :=
[
  term (-405 : Rat) [(7, 2), (10, 1)]
]

/-- Partial product 313 for generator 5. -/
def ep_Q2_064_partial_05_0313 : Poly :=
[
  term (-405 : Rat) [(4, 2), (7, 2), (10, 1)],
  term (-405 : Rat) [(5, 2), (7, 2), (10, 1)],
  term (405 : Rat) [(7, 2), (10, 1), (14, 2)],
  term (405 : Rat) [(7, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 5. -/
theorem ep_Q2_064_partial_05_0313_valid :
    mulPoly ep_Q2_064_coefficient_05_0313
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0314 : Poly :=
[
  term (864 : Rat) [(7, 2), (12, 1)]
]

/-- Partial product 314 for generator 5. -/
def ep_Q2_064_partial_05_0314 : Poly :=
[
  term (864 : Rat) [(4, 2), (7, 2), (12, 1)],
  term (864 : Rat) [(5, 2), (7, 2), (12, 1)],
  term (-864 : Rat) [(7, 2), (12, 1), (14, 2)],
  term (-864 : Rat) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 5. -/
theorem ep_Q2_064_partial_05_0314_valid :
    mulPoly ep_Q2_064_coefficient_05_0314
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0315 : Poly :=
[
  term (-405 : Rat) [(7, 2), (14, 1)]
]

/-- Partial product 315 for generator 5. -/
def ep_Q2_064_partial_05_0315 : Poly :=
[
  term (-405 : Rat) [(4, 2), (7, 2), (14, 1)],
  term (-405 : Rat) [(5, 2), (7, 2), (14, 1)],
  term (405 : Rat) [(7, 2), (14, 1), (15, 2)],
  term (405 : Rat) [(7, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 5. -/
theorem ep_Q2_064_partial_05_0315_valid :
    mulPoly ep_Q2_064_coefficient_05_0315
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0316 : Poly :=
[
  term ((-881 : Rat) / 4) [(8, 1)]
]

/-- Partial product 316 for generator 5. -/
def ep_Q2_064_partial_05_0316 : Poly :=
[
  term ((-881 : Rat) / 4) [(4, 2), (8, 1)],
  term ((-881 : Rat) / 4) [(5, 2), (8, 1)],
  term ((881 : Rat) / 4) [(8, 1), (14, 2)],
  term ((881 : Rat) / 4) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 5. -/
theorem ep_Q2_064_partial_05_0316_valid :
    mulPoly ep_Q2_064_coefficient_05_0316
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0317 : Poly :=
[
  term ((881 : Rat) / 2) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 317 for generator 5. -/
def ep_Q2_064_partial_05_0317 : Poly :=
[
  term ((881 : Rat) / 2) [(4, 2), (8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 2) [(5, 2), (8, 1), (9, 1), (11, 1)],
  term ((-881 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-881 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 5. -/
theorem ep_Q2_064_partial_05_0317_valid :
    mulPoly ep_Q2_064_coefficient_05_0317
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0318 : Poly :=
[
  term ((881 : Rat) / 8) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 318 for generator 5. -/
def ep_Q2_064_partial_05_0318 : Poly :=
[
  term ((881 : Rat) / 8) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((881 : Rat) / 8) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term ((-881 : Rat) / 8) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-881 : Rat) / 8) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 5. -/
theorem ep_Q2_064_partial_05_0318_valid :
    mulPoly ep_Q2_064_coefficient_05_0318
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0319 : Poly :=
[
  term (-2865 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 319 for generator 5. -/
def ep_Q2_064_partial_05_0319 : Poly :=
[
  term (-2865 : Rat) [(4, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term (-2865 : Rat) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term (2865 : Rat) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term (2865 : Rat) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 5. -/
theorem ep_Q2_064_partial_05_0319_valid :
    mulPoly ep_Q2_064_coefficient_05_0319
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0320 : Poly :=
[
  term ((1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 320 for generator 5. -/
def ep_Q2_064_partial_05_0320 : Poly :=
[
  term ((1971 : Rat) / 16) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((1971 : Rat) / 16) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 5. -/
theorem ep_Q2_064_partial_05_0320_valid :
    mulPoly ep_Q2_064_coefficient_05_0320
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0321 : Poly :=
[
  term (526 : Rat) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 321 for generator 5. -/
def ep_Q2_064_partial_05_0321 : Poly :=
[
  term (526 : Rat) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term (526 : Rat) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term (-526 : Rat) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term (-526 : Rat) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 5. -/
theorem ep_Q2_064_partial_05_0321_valid :
    mulPoly ep_Q2_064_coefficient_05_0321
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0322 : Poly :=
[
  term ((-2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 322 for generator 5. -/
def ep_Q2_064_partial_05_0322 : Poly :=
[
  term ((-2865 : Rat) / 4) [(4, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(5, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 5. -/
theorem ep_Q2_064_partial_05_0322_valid :
    mulPoly ep_Q2_064_coefficient_05_0322
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0323 : Poly :=
[
  term ((26989 : Rat) / 16) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 323 for generator 5. -/
def ep_Q2_064_partial_05_0323 : Poly :=
[
  term ((26989 : Rat) / 16) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 16) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-26989 : Rat) / 16) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-26989 : Rat) / 16) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 5. -/
theorem ep_Q2_064_partial_05_0323_valid :
    mulPoly ep_Q2_064_coefficient_05_0323
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0324 : Poly :=
[
  term ((1377 : Rat) / 8) [(8, 1), (13, 2)]
]

/-- Partial product 324 for generator 5. -/
def ep_Q2_064_partial_05_0324 : Poly :=
[
  term ((1377 : Rat) / 8) [(4, 2), (8, 1), (13, 2)],
  term ((1377 : Rat) / 8) [(5, 2), (8, 1), (13, 2)],
  term ((-1377 : Rat) / 8) [(8, 1), (13, 2), (14, 2)],
  term ((-1377 : Rat) / 8) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 5. -/
theorem ep_Q2_064_partial_05_0324_valid :
    mulPoly ep_Q2_064_coefficient_05_0324
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0325 : Poly :=
[
  term (2865 : Rat) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 325 for generator 5. -/
def ep_Q2_064_partial_05_0325 : Poly :=
[
  term (2865 : Rat) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (2865 : Rat) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (-2865 : Rat) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term (-2865 : Rat) [(9, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 5. -/
theorem ep_Q2_064_partial_05_0325_valid :
    mulPoly ep_Q2_064_coefficient_05_0325
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0326 : Poly :=
[
  term ((-1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 326 for generator 5. -/
def ep_Q2_064_partial_05_0326 : Poly :=
[
  term ((-1971 : Rat) / 16) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1971 : Rat) / 16) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 5. -/
theorem ep_Q2_064_partial_05_0326_valid :
    mulPoly ep_Q2_064_coefficient_05_0326
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0327 : Poly :=
[
  term (-526 : Rat) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 327 for generator 5. -/
def ep_Q2_064_partial_05_0327 : Poly :=
[
  term (-526 : Rat) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term (-526 : Rat) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term (526 : Rat) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term (526 : Rat) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 5. -/
theorem ep_Q2_064_partial_05_0327_valid :
    mulPoly ep_Q2_064_coefficient_05_0327
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0328 : Poly :=
[
  term ((-11453 : Rat) / 8) [(9, 1), (11, 1)]
]

/-- Partial product 328 for generator 5. -/
def ep_Q2_064_partial_05_0328 : Poly :=
[
  term ((-11453 : Rat) / 8) [(4, 2), (9, 1), (11, 1)],
  term ((-11453 : Rat) / 8) [(5, 2), (9, 1), (11, 1)],
  term ((11453 : Rat) / 8) [(9, 1), (11, 1), (14, 2)],
  term ((11453 : Rat) / 8) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 5. -/
theorem ep_Q2_064_partial_05_0328_valid :
    mulPoly ep_Q2_064_coefficient_05_0328
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0329 : Poly :=
[
  term ((-7479 : Rat) / 16) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 329 for generator 5. -/
def ep_Q2_064_partial_05_0329 : Poly :=
[
  term ((-7479 : Rat) / 16) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-7479 : Rat) / 16) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((7479 : Rat) / 16) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((7479 : Rat) / 16) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 5. -/
theorem ep_Q2_064_partial_05_0329_valid :
    mulPoly ep_Q2_064_coefficient_05_0329
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0330 : Poly :=
[
  term ((-41721 : Rat) / 8) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 330 for generator 5. -/
def ep_Q2_064_partial_05_0330 : Poly :=
[
  term ((-41721 : Rat) / 8) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-41721 : Rat) / 8) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((41721 : Rat) / 8) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((41721 : Rat) / 8) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 5. -/
theorem ep_Q2_064_partial_05_0330_valid :
    mulPoly ep_Q2_064_coefficient_05_0330
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0331 : Poly :=
[
  term ((8595 : Rat) / 2) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 331 for generator 5. -/
def ep_Q2_064_partial_05_0331 : Poly :=
[
  term ((8595 : Rat) / 2) [(4, 2), (9, 1), (12, 2), (15, 1)],
  term ((8595 : Rat) / 2) [(5, 2), (9, 1), (12, 2), (15, 1)],
  term ((-8595 : Rat) / 2) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-8595 : Rat) / 2) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 5. -/
theorem ep_Q2_064_partial_05_0331_valid :
    mulPoly ep_Q2_064_coefficient_05_0331
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0332 : Poly :=
[
  term ((4565 : Rat) / 8) [(9, 1), (13, 1)]
]

/-- Partial product 332 for generator 5. -/
def ep_Q2_064_partial_05_0332 : Poly :=
[
  term ((4565 : Rat) / 8) [(4, 2), (9, 1), (13, 1)],
  term ((4565 : Rat) / 8) [(5, 2), (9, 1), (13, 1)],
  term ((-4565 : Rat) / 8) [(9, 1), (13, 1), (14, 2)],
  term ((-4565 : Rat) / 8) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 5. -/
theorem ep_Q2_064_partial_05_0332_valid :
    mulPoly ep_Q2_064_coefficient_05_0332
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0333 : Poly :=
[
  term ((6167 : Rat) / 8) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 333 for generator 5. -/
def ep_Q2_064_partial_05_0333 : Poly :=
[
  term ((6167 : Rat) / 8) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((6167 : Rat) / 8) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-6167 : Rat) / 8) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6167 : Rat) / 8) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 5. -/
theorem ep_Q2_064_partial_05_0333_valid :
    mulPoly ep_Q2_064_coefficient_05_0333
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0334 : Poly :=
[
  term ((-56875 : Rat) / 16) [(9, 1), (15, 1)]
]

/-- Partial product 334 for generator 5. -/
def ep_Q2_064_partial_05_0334 : Poly :=
[
  term ((-56875 : Rat) / 16) [(4, 2), (9, 1), (15, 1)],
  term ((-56875 : Rat) / 16) [(5, 2), (9, 1), (15, 1)],
  term ((56875 : Rat) / 16) [(9, 1), (14, 2), (15, 1)],
  term ((56875 : Rat) / 16) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 5. -/
theorem ep_Q2_064_partial_05_0334_valid :
    mulPoly ep_Q2_064_coefficient_05_0334
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0335 : Poly :=
[
  term ((4405 : Rat) / 8) [(9, 2)]
]

/-- Partial product 335 for generator 5. -/
def ep_Q2_064_partial_05_0335 : Poly :=
[
  term ((4405 : Rat) / 8) [(4, 2), (9, 2)],
  term ((4405 : Rat) / 8) [(5, 2), (9, 2)],
  term ((-4405 : Rat) / 8) [(9, 2), (14, 2)],
  term ((-4405 : Rat) / 8) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 5. -/
theorem ep_Q2_064_partial_05_0335_valid :
    mulPoly ep_Q2_064_coefficient_05_0335
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0336 : Poly :=
[
  term ((-881 : Rat) / 2) [(9, 2), (10, 1)]
]

/-- Partial product 336 for generator 5. -/
def ep_Q2_064_partial_05_0336 : Poly :=
[
  term ((-881 : Rat) / 2) [(4, 2), (9, 2), (10, 1)],
  term ((-881 : Rat) / 2) [(5, 2), (9, 2), (10, 1)],
  term ((881 : Rat) / 2) [(9, 2), (10, 1), (14, 2)],
  term ((881 : Rat) / 2) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 5. -/
theorem ep_Q2_064_partial_05_0336_valid :
    mulPoly ep_Q2_064_coefficient_05_0336
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0337 : Poly :=
[
  term ((-2643 : Rat) / 4) [(9, 2), (12, 1)]
]

/-- Partial product 337 for generator 5. -/
def ep_Q2_064_partial_05_0337 : Poly :=
[
  term ((-2643 : Rat) / 4) [(4, 2), (9, 2), (12, 1)],
  term ((-2643 : Rat) / 4) [(5, 2), (9, 2), (12, 1)],
  term ((2643 : Rat) / 4) [(9, 2), (12, 1), (14, 2)],
  term ((2643 : Rat) / 4) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 5. -/
theorem ep_Q2_064_partial_05_0337_valid :
    mulPoly ep_Q2_064_coefficient_05_0337
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0338 : Poly :=
[
  term ((37245 : Rat) / 4) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 338 for generator 5. -/
def ep_Q2_064_partial_05_0338 : Poly :=
[
  term ((37245 : Rat) / 4) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((37245 : Rat) / 4) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-37245 : Rat) / 4) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-37245 : Rat) / 4) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 5. -/
theorem ep_Q2_064_partial_05_0338_valid :
    mulPoly ep_Q2_064_coefficient_05_0338
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0339 : Poly :=
[
  term ((-54789 : Rat) / 32) [(11, 1), (13, 1)]
]

/-- Partial product 339 for generator 5. -/
def ep_Q2_064_partial_05_0339 : Poly :=
[
  term ((-54789 : Rat) / 32) [(4, 2), (11, 1), (13, 1)],
  term ((-54789 : Rat) / 32) [(5, 2), (11, 1), (13, 1)],
  term ((54789 : Rat) / 32) [(11, 1), (13, 1), (14, 2)],
  term ((54789 : Rat) / 32) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 5. -/
theorem ep_Q2_064_partial_05_0339_valid :
    mulPoly ep_Q2_064_coefficient_05_0339
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0340 : Poly :=
[
  term ((91895 : Rat) / 16) [(11, 1), (15, 1)]
]

/-- Partial product 340 for generator 5. -/
def ep_Q2_064_partial_05_0340 : Poly :=
[
  term ((91895 : Rat) / 16) [(4, 2), (11, 1), (15, 1)],
  term ((91895 : Rat) / 16) [(5, 2), (11, 1), (15, 1)],
  term ((-91895 : Rat) / 16) [(11, 1), (14, 2), (15, 1)],
  term ((-91895 : Rat) / 16) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 5. -/
theorem ep_Q2_064_partial_05_0340_valid :
    mulPoly ep_Q2_064_coefficient_05_0340
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0341 : Poly :=
[
  term ((-27 : Rat) / 2) [(11, 2)]
]

/-- Partial product 341 for generator 5. -/
def ep_Q2_064_partial_05_0341 : Poly :=
[
  term ((-27 : Rat) / 2) [(4, 2), (11, 2)],
  term ((-27 : Rat) / 2) [(5, 2), (11, 2)],
  term ((27 : Rat) / 2) [(11, 2), (14, 2)],
  term ((27 : Rat) / 2) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 5. -/
theorem ep_Q2_064_partial_05_0341_valid :
    mulPoly ep_Q2_064_coefficient_05_0341
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0342 : Poly :=
[
  term ((-1107 : Rat) / 32) [(12, 1)]
]

/-- Partial product 342 for generator 5. -/
def ep_Q2_064_partial_05_0342 : Poly :=
[
  term ((-1107 : Rat) / 32) [(4, 2), (12, 1)],
  term ((-1107 : Rat) / 32) [(5, 2), (12, 1)],
  term ((1107 : Rat) / 32) [(12, 1), (14, 2)],
  term ((1107 : Rat) / 32) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 5. -/
theorem ep_Q2_064_partial_05_0342_valid :
    mulPoly ep_Q2_064_coefficient_05_0342
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0343 : Poly :=
[
  term ((-20055 : Rat) / 4) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 343 for generator 5. -/
def ep_Q2_064_partial_05_0343 : Poly :=
[
  term ((-20055 : Rat) / 4) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-20055 : Rat) / 4) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((20055 : Rat) / 4) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((20055 : Rat) / 4) [(12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 5. -/
theorem ep_Q2_064_partial_05_0343_valid :
    mulPoly ep_Q2_064_coefficient_05_0343
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0344 : Poly :=
[
  term ((-26301 : Rat) / 8) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 344 for generator 5. -/
def ep_Q2_064_partial_05_0344 : Poly :=
[
  term ((-26301 : Rat) / 8) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-26301 : Rat) / 8) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((26301 : Rat) / 8) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((26301 : Rat) / 8) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 5. -/
theorem ep_Q2_064_partial_05_0344_valid :
    mulPoly ep_Q2_064_coefficient_05_0344
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0345 : Poly :=
[
  term ((-2169 : Rat) / 8) [(12, 1), (14, 1)]
]

/-- Partial product 345 for generator 5. -/
def ep_Q2_064_partial_05_0345 : Poly :=
[
  term ((-2169 : Rat) / 8) [(4, 2), (12, 1), (14, 1)],
  term ((-2169 : Rat) / 8) [(5, 2), (12, 1), (14, 1)],
  term ((2169 : Rat) / 8) [(12, 1), (14, 1), (15, 2)],
  term ((2169 : Rat) / 8) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 5. -/
theorem ep_Q2_064_partial_05_0345_valid :
    mulPoly ep_Q2_064_coefficient_05_0345
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0346 : Poly :=
[
  term ((-1449 : Rat) / 2) [(12, 1), (15, 2)]
]

/-- Partial product 346 for generator 5. -/
def ep_Q2_064_partial_05_0346 : Poly :=
[
  term ((-1449 : Rat) / 2) [(4, 2), (12, 1), (15, 2)],
  term ((-1449 : Rat) / 2) [(5, 2), (12, 1), (15, 2)],
  term ((1449 : Rat) / 2) [(12, 1), (14, 2), (15, 2)],
  term ((1449 : Rat) / 2) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 5. -/
theorem ep_Q2_064_partial_05_0346_valid :
    mulPoly ep_Q2_064_coefficient_05_0346
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0347 : Poly :=
[
  term ((1953 : Rat) / 16) [(12, 2)]
]

/-- Partial product 347 for generator 5. -/
def ep_Q2_064_partial_05_0347 : Poly :=
[
  term ((1953 : Rat) / 16) [(4, 2), (12, 2)],
  term ((1953 : Rat) / 16) [(5, 2), (12, 2)],
  term ((-1953 : Rat) / 16) [(12, 2), (14, 2)],
  term ((-1953 : Rat) / 16) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 5. -/
theorem ep_Q2_064_partial_05_0347_valid :
    mulPoly ep_Q2_064_coefficient_05_0347
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0348 : Poly :=
[
  term (8595 : Rat) [(12, 2), (15, 2)]
]

/-- Partial product 348 for generator 5. -/
def ep_Q2_064_partial_05_0348 : Poly :=
[
  term (8595 : Rat) [(4, 2), (12, 2), (15, 2)],
  term (8595 : Rat) [(5, 2), (12, 2), (15, 2)],
  term (-8595 : Rat) [(12, 2), (14, 2), (15, 2)],
  term (-8595 : Rat) [(12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 5. -/
theorem ep_Q2_064_partial_05_0348_valid :
    mulPoly ep_Q2_064_coefficient_05_0348
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0349 : Poly :=
[
  term ((-35177 : Rat) / 16) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 349 for generator 5. -/
def ep_Q2_064_partial_05_0349 : Poly :=
[
  term ((-35177 : Rat) / 16) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-35177 : Rat) / 16) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((35177 : Rat) / 16) [(13, 1), (14, 1), (15, 3)],
  term ((35177 : Rat) / 16) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 5. -/
theorem ep_Q2_064_partial_05_0349_valid :
    mulPoly ep_Q2_064_coefficient_05_0349
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0350 : Poly :=
[
  term ((340331 : Rat) / 32) [(13, 1), (15, 1)]
]

/-- Partial product 350 for generator 5. -/
def ep_Q2_064_partial_05_0350 : Poly :=
[
  term ((340331 : Rat) / 32) [(4, 2), (13, 1), (15, 1)],
  term ((340331 : Rat) / 32) [(5, 2), (13, 1), (15, 1)],
  term ((-340331 : Rat) / 32) [(13, 1), (14, 2), (15, 1)],
  term ((-340331 : Rat) / 32) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 5. -/
theorem ep_Q2_064_partial_05_0350_valid :
    mulPoly ep_Q2_064_coefficient_05_0350
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0351 : Poly :=
[
  term ((-5583 : Rat) / 16) [(13, 2)]
]

/-- Partial product 351 for generator 5. -/
def ep_Q2_064_partial_05_0351 : Poly :=
[
  term ((-5583 : Rat) / 16) [(4, 2), (13, 2)],
  term ((-5583 : Rat) / 16) [(5, 2), (13, 2)],
  term ((5583 : Rat) / 16) [(13, 2), (14, 2)],
  term ((5583 : Rat) / 16) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 5. -/
theorem ep_Q2_064_partial_05_0351_valid :
    mulPoly ep_Q2_064_coefficient_05_0351
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0352 : Poly :=
[
  term ((19227 : Rat) / 16) [(13, 2), (14, 1)]
]

/-- Partial product 352 for generator 5. -/
def ep_Q2_064_partial_05_0352 : Poly :=
[
  term ((19227 : Rat) / 16) [(4, 2), (13, 2), (14, 1)],
  term ((19227 : Rat) / 16) [(5, 2), (13, 2), (14, 1)],
  term ((-19227 : Rat) / 16) [(13, 2), (14, 1), (15, 2)],
  term ((-19227 : Rat) / 16) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 5. -/
theorem ep_Q2_064_partial_05_0352_valid :
    mulPoly ep_Q2_064_coefficient_05_0352
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0353 : Poly :=
[
  term ((8909 : Rat) / 16) [(14, 1)]
]

/-- Partial product 353 for generator 5. -/
def ep_Q2_064_partial_05_0353 : Poly :=
[
  term ((8909 : Rat) / 16) [(4, 2), (14, 1)],
  term ((8909 : Rat) / 16) [(5, 2), (14, 1)],
  term ((-8909 : Rat) / 16) [(14, 1), (15, 2)],
  term ((-8909 : Rat) / 16) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 5. -/
theorem ep_Q2_064_partial_05_0353_valid :
    mulPoly ep_Q2_064_coefficient_05_0353
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0354 : Poly :=
[
  term ((-27 : Rat) / 4) [(14, 2)]
]

/-- Partial product 354 for generator 5. -/
def ep_Q2_064_partial_05_0354 : Poly :=
[
  term ((-27 : Rat) / 4) [(4, 2), (14, 2)],
  term ((-27 : Rat) / 4) [(5, 2), (14, 2)],
  term ((27 : Rat) / 4) [(14, 2), (15, 2)],
  term ((27 : Rat) / 4) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 5. -/
theorem ep_Q2_064_partial_05_0354_valid :
    mulPoly ep_Q2_064_coefficient_05_0354
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 5. -/
def ep_Q2_064_coefficient_05_0355 : Poly :=
[
  term ((-36723 : Rat) / 8) [(15, 2)]
]

/-- Partial product 355 for generator 5. -/
def ep_Q2_064_partial_05_0355 : Poly :=
[
  term ((-36723 : Rat) / 8) [(4, 2), (15, 2)],
  term ((-36723 : Rat) / 8) [(5, 2), (15, 2)],
  term ((36723 : Rat) / 8) [(14, 2), (15, 2)],
  term ((36723 : Rat) / 8) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 5. -/
theorem ep_Q2_064_partial_05_0355_valid :
    mulPoly ep_Q2_064_coefficient_05_0355
        ep_Q2_064_generator_05_0300_0355 =
      ep_Q2_064_partial_05_0355 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_05_0300_0355 : List Poly :=
[
  ep_Q2_064_partial_05_0300,
  ep_Q2_064_partial_05_0301,
  ep_Q2_064_partial_05_0302,
  ep_Q2_064_partial_05_0303,
  ep_Q2_064_partial_05_0304,
  ep_Q2_064_partial_05_0305,
  ep_Q2_064_partial_05_0306,
  ep_Q2_064_partial_05_0307,
  ep_Q2_064_partial_05_0308,
  ep_Q2_064_partial_05_0309,
  ep_Q2_064_partial_05_0310,
  ep_Q2_064_partial_05_0311,
  ep_Q2_064_partial_05_0312,
  ep_Q2_064_partial_05_0313,
  ep_Q2_064_partial_05_0314,
  ep_Q2_064_partial_05_0315,
  ep_Q2_064_partial_05_0316,
  ep_Q2_064_partial_05_0317,
  ep_Q2_064_partial_05_0318,
  ep_Q2_064_partial_05_0319,
  ep_Q2_064_partial_05_0320,
  ep_Q2_064_partial_05_0321,
  ep_Q2_064_partial_05_0322,
  ep_Q2_064_partial_05_0323,
  ep_Q2_064_partial_05_0324,
  ep_Q2_064_partial_05_0325,
  ep_Q2_064_partial_05_0326,
  ep_Q2_064_partial_05_0327,
  ep_Q2_064_partial_05_0328,
  ep_Q2_064_partial_05_0329,
  ep_Q2_064_partial_05_0330,
  ep_Q2_064_partial_05_0331,
  ep_Q2_064_partial_05_0332,
  ep_Q2_064_partial_05_0333,
  ep_Q2_064_partial_05_0334,
  ep_Q2_064_partial_05_0335,
  ep_Q2_064_partial_05_0336,
  ep_Q2_064_partial_05_0337,
  ep_Q2_064_partial_05_0338,
  ep_Q2_064_partial_05_0339,
  ep_Q2_064_partial_05_0340,
  ep_Q2_064_partial_05_0341,
  ep_Q2_064_partial_05_0342,
  ep_Q2_064_partial_05_0343,
  ep_Q2_064_partial_05_0344,
  ep_Q2_064_partial_05_0345,
  ep_Q2_064_partial_05_0346,
  ep_Q2_064_partial_05_0347,
  ep_Q2_064_partial_05_0348,
  ep_Q2_064_partial_05_0349,
  ep_Q2_064_partial_05_0350,
  ep_Q2_064_partial_05_0351,
  ep_Q2_064_partial_05_0352,
  ep_Q2_064_partial_05_0353,
  ep_Q2_064_partial_05_0354,
  ep_Q2_064_partial_05_0355
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_05_0300_0355 : Poly :=
[
  term ((-729 : Rat) / 2) [(4, 2), (7, 1), (11, 1)],
  term (27 : Rat) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((15819 : Rat) / 4) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((42975 : Rat) / 4) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-521 : Rat) / 2) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term (-22920 : Rat) [(4, 2), (7, 1), (12, 2), (15, 1)],
  term ((2949 : Rat) / 2) [(4, 2), (7, 1), (13, 1)],
  term ((-24051 : Rat) / 16) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((19401 : Rat) / 16) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term (16 : Rat) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70793 : Rat) / 8) [(4, 2), (7, 1), (15, 1)],
  term (-32 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (378 : Rat) [(4, 2), (7, 2)],
  term (-405 : Rat) [(4, 2), (7, 2), (10, 1)],
  term (864 : Rat) [(4, 2), (7, 2), (12, 1)],
  term (-405 : Rat) [(4, 2), (7, 2), (14, 1)],
  term ((-881 : Rat) / 4) [(4, 2), (8, 1)],
  term ((881 : Rat) / 2) [(4, 2), (8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 8) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term (-2865 : Rat) [(4, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 16) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term (526 : Rat) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(4, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 16) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 8) [(4, 2), (8, 1), (13, 2)],
  term (2865 : Rat) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 16) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term (-526 : Rat) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-11453 : Rat) / 8) [(4, 2), (9, 1), (11, 1)],
  term ((-7479 : Rat) / 16) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-41721 : Rat) / 8) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((8595 : Rat) / 2) [(4, 2), (9, 1), (12, 2), (15, 1)],
  term ((4565 : Rat) / 8) [(4, 2), (9, 1), (13, 1)],
  term ((6167 : Rat) / 8) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-56875 : Rat) / 16) [(4, 2), (9, 1), (15, 1)],
  term ((4405 : Rat) / 8) [(4, 2), (9, 2)],
  term ((-881 : Rat) / 2) [(4, 2), (9, 2), (10, 1)],
  term ((-2643 : Rat) / 4) [(4, 2), (9, 2), (12, 1)],
  term ((37245 : Rat) / 4) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-54789 : Rat) / 32) [(4, 2), (11, 1), (13, 1)],
  term ((91895 : Rat) / 16) [(4, 2), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(4, 2), (11, 2)],
  term ((-1107 : Rat) / 32) [(4, 2), (12, 1)],
  term ((-20055 : Rat) / 4) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26301 : Rat) / 8) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2169 : Rat) / 8) [(4, 2), (12, 1), (14, 1)],
  term ((-1449 : Rat) / 2) [(4, 2), (12, 1), (15, 2)],
  term ((1953 : Rat) / 16) [(4, 2), (12, 2)],
  term (8595 : Rat) [(4, 2), (12, 2), (15, 2)],
  term ((-35177 : Rat) / 16) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((340331 : Rat) / 32) [(4, 2), (13, 1), (15, 1)],
  term ((-5583 : Rat) / 16) [(4, 2), (13, 2)],
  term ((19227 : Rat) / 16) [(4, 2), (13, 2), (14, 1)],
  term ((8909 : Rat) / 16) [(4, 2), (14, 1)],
  term ((-27 : Rat) / 4) [(4, 2), (14, 2)],
  term ((-36723 : Rat) / 8) [(4, 2), (15, 2)],
  term ((-729 : Rat) / 2) [(5, 2), (7, 1), (11, 1)],
  term (27 : Rat) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((15819 : Rat) / 4) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((42975 : Rat) / 4) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-521 : Rat) / 2) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term (-22920 : Rat) [(5, 2), (7, 1), (12, 2), (15, 1)],
  term ((2949 : Rat) / 2) [(5, 2), (7, 1), (13, 1)],
  term ((-24051 : Rat) / 16) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((19401 : Rat) / 16) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term (16 : Rat) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70793 : Rat) / 8) [(5, 2), (7, 1), (15, 1)],
  term (-32 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term (378 : Rat) [(5, 2), (7, 2)],
  term (-405 : Rat) [(5, 2), (7, 2), (10, 1)],
  term (864 : Rat) [(5, 2), (7, 2), (12, 1)],
  term (-405 : Rat) [(5, 2), (7, 2), (14, 1)],
  term ((-881 : Rat) / 4) [(5, 2), (8, 1)],
  term ((881 : Rat) / 2) [(5, 2), (8, 1), (9, 1), (11, 1)],
  term ((881 : Rat) / 8) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term (-2865 : Rat) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 16) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term (526 : Rat) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(5, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((26989 : Rat) / 16) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((1377 : Rat) / 8) [(5, 2), (8, 1), (13, 2)],
  term (2865 : Rat) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 16) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term (-526 : Rat) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-11453 : Rat) / 8) [(5, 2), (9, 1), (11, 1)],
  term ((-7479 : Rat) / 16) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-41721 : Rat) / 8) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((8595 : Rat) / 2) [(5, 2), (9, 1), (12, 2), (15, 1)],
  term ((4565 : Rat) / 8) [(5, 2), (9, 1), (13, 1)],
  term ((6167 : Rat) / 8) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-56875 : Rat) / 16) [(5, 2), (9, 1), (15, 1)],
  term ((4405 : Rat) / 8) [(5, 2), (9, 2)],
  term ((-881 : Rat) / 2) [(5, 2), (9, 2), (10, 1)],
  term ((-2643 : Rat) / 4) [(5, 2), (9, 2), (12, 1)],
  term ((37245 : Rat) / 4) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-54789 : Rat) / 32) [(5, 2), (11, 1), (13, 1)],
  term ((91895 : Rat) / 16) [(5, 2), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(5, 2), (11, 2)],
  term ((-1107 : Rat) / 32) [(5, 2), (12, 1)],
  term ((-20055 : Rat) / 4) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26301 : Rat) / 8) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2169 : Rat) / 8) [(5, 2), (12, 1), (14, 1)],
  term ((-1449 : Rat) / 2) [(5, 2), (12, 1), (15, 2)],
  term ((1953 : Rat) / 16) [(5, 2), (12, 2)],
  term (8595 : Rat) [(5, 2), (12, 2), (15, 2)],
  term ((-35177 : Rat) / 16) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((340331 : Rat) / 32) [(5, 2), (13, 1), (15, 1)],
  term ((-5583 : Rat) / 16) [(5, 2), (13, 2)],
  term ((19227 : Rat) / 16) [(5, 2), (13, 2), (14, 1)],
  term ((8909 : Rat) / 16) [(5, 2), (14, 1)],
  term ((-27 : Rat) / 4) [(5, 2), (14, 2)],
  term ((-36723 : Rat) / 8) [(5, 2), (15, 2)],
  term (-27 : Rat) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term (-27 : Rat) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((729 : Rat) / 2) [(7, 1), (11, 1), (14, 2)],
  term ((729 : Rat) / 2) [(7, 1), (11, 1), (15, 2)],
  term ((-15819 : Rat) / 4) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-15819 : Rat) / 4) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-42975 : Rat) / 4) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((521 : Rat) / 2) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-42975 : Rat) / 4) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((521 : Rat) / 2) [(7, 1), (12, 1), (15, 3)],
  term (22920 : Rat) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term (22920 : Rat) [(7, 1), (12, 2), (15, 3)],
  term ((24051 : Rat) / 16) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2949 : Rat) / 2) [(7, 1), (13, 1), (14, 2)],
  term ((24051 : Rat) / 16) [(7, 1), (13, 1), (14, 3)],
  term ((-2949 : Rat) / 2) [(7, 1), (13, 1), (15, 2)],
  term ((-19401 : Rat) / 16) [(7, 1), (14, 1), (15, 3)],
  term (-16 : Rat) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((70793 : Rat) / 8) [(7, 1), (14, 2), (15, 1)],
  term (32 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19401 : Rat) / 16) [(7, 1), (14, 3), (15, 1)],
  term (-16 : Rat) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((70793 : Rat) / 8) [(7, 1), (15, 3)],
  term (32 : Rat) [(7, 1), (15, 3), (16, 1)],
  term (405 : Rat) [(7, 2), (10, 1), (14, 2)],
  term (405 : Rat) [(7, 2), (10, 1), (15, 2)],
  term (-864 : Rat) [(7, 2), (12, 1), (14, 2)],
  term (-864 : Rat) [(7, 2), (12, 1), (15, 2)],
  term (405 : Rat) [(7, 2), (14, 1), (15, 2)],
  term (-378 : Rat) [(7, 2), (14, 2)],
  term (405 : Rat) [(7, 2), (14, 3)],
  term (-378 : Rat) [(7, 2), (15, 2)],
  term ((-881 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-881 : Rat) / 2) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-881 : Rat) / 8) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-881 : Rat) / 8) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term (2865 : Rat) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term (2865 : Rat) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1971 : Rat) / 16) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term (-526 : Rat) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term (-526 : Rat) [(8, 1), (11, 1), (15, 3)],
  term ((2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2865 : Rat) / 4) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-26989 : Rat) / 16) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-26989 : Rat) / 16) [(8, 1), (13, 1), (15, 3)],
  term ((-1377 : Rat) / 8) [(8, 1), (13, 2), (14, 2)],
  term ((-1377 : Rat) / 8) [(8, 1), (13, 2), (15, 2)],
  term ((881 : Rat) / 4) [(8, 1), (14, 2)],
  term ((881 : Rat) / 4) [(8, 1), (15, 2)],
  term (-2865 : Rat) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term (-2865 : Rat) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((1971 : Rat) / 16) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term (526 : Rat) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term (526 : Rat) [(9, 1), (10, 1), (15, 3)],
  term ((11453 : Rat) / 8) [(9, 1), (11, 1), (14, 2)],
  term ((11453 : Rat) / 8) [(9, 1), (11, 1), (15, 2)],
  term ((7479 : Rat) / 16) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((7479 : Rat) / 16) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((41721 : Rat) / 8) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((41721 : Rat) / 8) [(9, 1), (12, 1), (15, 3)],
  term ((-8595 : Rat) / 2) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-8595 : Rat) / 2) [(9, 1), (12, 2), (15, 3)],
  term ((-6167 : Rat) / 8) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4565 : Rat) / 8) [(9, 1), (13, 1), (14, 2)],
  term ((-6167 : Rat) / 8) [(9, 1), (13, 1), (14, 3)],
  term ((-4565 : Rat) / 8) [(9, 1), (13, 1), (15, 2)],
  term ((56875 : Rat) / 16) [(9, 1), (14, 2), (15, 1)],
  term ((56875 : Rat) / 16) [(9, 1), (15, 3)],
  term ((881 : Rat) / 2) [(9, 2), (10, 1), (14, 2)],
  term ((881 : Rat) / 2) [(9, 2), (10, 1), (15, 2)],
  term ((2643 : Rat) / 4) [(9, 2), (12, 1), (14, 2)],
  term ((2643 : Rat) / 4) [(9, 2), (12, 1), (15, 2)],
  term ((-4405 : Rat) / 8) [(9, 2), (14, 2)],
  term ((-4405 : Rat) / 8) [(9, 2), (15, 2)],
  term ((-37245 : Rat) / 4) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-37245 : Rat) / 4) [(11, 1), (12, 1), (15, 3)],
  term ((54789 : Rat) / 32) [(11, 1), (13, 1), (14, 2)],
  term ((54789 : Rat) / 32) [(11, 1), (13, 1), (15, 2)],
  term ((-91895 : Rat) / 16) [(11, 1), (14, 2), (15, 1)],
  term ((-91895 : Rat) / 16) [(11, 1), (15, 3)],
  term ((27 : Rat) / 2) [(11, 2), (14, 2)],
  term ((27 : Rat) / 2) [(11, 2), (15, 2)],
  term ((20055 : Rat) / 4) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((26301 : Rat) / 8) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((20055 : Rat) / 4) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((26301 : Rat) / 8) [(12, 1), (13, 1), (15, 3)],
  term ((2169 : Rat) / 8) [(12, 1), (14, 1), (15, 2)],
  term ((1107 : Rat) / 32) [(12, 1), (14, 2)],
  term ((1449 : Rat) / 2) [(12, 1), (14, 2), (15, 2)],
  term ((2169 : Rat) / 8) [(12, 1), (14, 3)],
  term ((1107 : Rat) / 32) [(12, 1), (15, 2)],
  term ((1449 : Rat) / 2) [(12, 1), (15, 4)],
  term ((-1953 : Rat) / 16) [(12, 2), (14, 2)],
  term (-8595 : Rat) [(12, 2), (14, 2), (15, 2)],
  term ((-1953 : Rat) / 16) [(12, 2), (15, 2)],
  term (-8595 : Rat) [(12, 2), (15, 4)],
  term ((35177 : Rat) / 16) [(13, 1), (14, 1), (15, 3)],
  term ((-340331 : Rat) / 32) [(13, 1), (14, 2), (15, 1)],
  term ((35177 : Rat) / 16) [(13, 1), (14, 3), (15, 1)],
  term ((-340331 : Rat) / 32) [(13, 1), (15, 3)],
  term ((-19227 : Rat) / 16) [(13, 2), (14, 1), (15, 2)],
  term ((5583 : Rat) / 16) [(13, 2), (14, 2)],
  term ((-19227 : Rat) / 16) [(13, 2), (14, 3)],
  term ((5583 : Rat) / 16) [(13, 2), (15, 2)],
  term ((-8909 : Rat) / 16) [(14, 1), (15, 2)],
  term ((36777 : Rat) / 8) [(14, 2), (15, 2)],
  term ((-8909 : Rat) / 16) [(14, 3)],
  term ((27 : Rat) / 4) [(14, 4)],
  term ((36723 : Rat) / 8) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 300 through 355. -/
theorem ep_Q2_064_block_05_0300_0355_valid :
    checkProductSumEq ep_Q2_064_partials_05_0300_0355
      ep_Q2_064_block_05_0300_0355 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
