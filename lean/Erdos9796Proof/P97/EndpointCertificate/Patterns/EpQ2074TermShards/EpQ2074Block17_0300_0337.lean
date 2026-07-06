/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 17:300-337

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 17 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_17_0300_0337 : Poly :=
[
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0300 : Poly :=
[
  term ((63207 : Rat) / 1538) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 300 for generator 17. -/
def ep_Q2_074_partial_17_0300 : Poly :=
[
  term ((63207 : Rat) / 769) [(3, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((63207 : Rat) / 769) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63207 : Rat) / 1538) [(3, 2), (12, 1), (14, 2), (16, 1)],
  term ((-63207 : Rat) / 1538) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 17. -/
theorem ep_Q2_074_partial_17_0300_valid :
    mulPoly ep_Q2_074_coefficient_17_0300
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0301 : Poly :=
[
  term ((-61479 : Rat) / 3076) [(3, 2), (16, 1)]
]

/-- Partial product 301 for generator 17. -/
def ep_Q2_074_partial_17_0301 : Poly :=
[
  term ((-61479 : Rat) / 1538) [(3, 2), (6, 1), (14, 1), (16, 1)],
  term ((-61479 : Rat) / 1538) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((61479 : Rat) / 3076) [(3, 2), (14, 2), (16, 1)],
  term ((61479 : Rat) / 3076) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 17. -/
theorem ep_Q2_074_partial_17_0301_valid :
    mulPoly ep_Q2_074_coefficient_17_0301
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0302 : Poly :=
[
  term ((-2460 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 17. -/
def ep_Q2_074_partial_17_0302 : Poly :=
[
  term ((-4920 : Rat) / 769) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4920 : Rat) / 769) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 17. -/
theorem ep_Q2_074_partial_17_0302_valid :
    mulPoly ep_Q2_074_coefficient_17_0302
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0303 : Poly :=
[
  term ((-3690 : Rat) / 769) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 17. -/
def ep_Q2_074_partial_17_0303 : Poly :=
[
  term ((-7380 : Rat) / 769) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-7380 : Rat) / 769) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 17. -/
theorem ep_Q2_074_partial_17_0303_valid :
    mulPoly ep_Q2_074_coefficient_17_0303
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0304 : Poly :=
[
  term ((-36459 : Rat) / 769) [(4, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 304 for generator 17. -/
def ep_Q2_074_partial_17_0304 : Poly :=
[
  term ((-72918 : Rat) / 769) [(4, 1), (6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72918 : Rat) / 769) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 17. -/
theorem ep_Q2_074_partial_17_0304_valid :
    mulPoly ep_Q2_074_coefficient_17_0304
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0305 : Poly :=
[
  term ((-10440 : Rat) / 769) [(4, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 305 for generator 17. -/
def ep_Q2_074_partial_17_0305 : Poly :=
[
  term ((-20880 : Rat) / 769) [(4, 1), (6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-20880 : Rat) / 769) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10440 : Rat) / 769) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10440 : Rat) / 769) [(4, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 17. -/
theorem ep_Q2_074_partial_17_0305_valid :
    mulPoly ep_Q2_074_coefficient_17_0305
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0306 : Poly :=
[
  term ((88326 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 306 for generator 17. -/
def ep_Q2_074_partial_17_0306 : Poly :=
[
  term ((176652 : Rat) / 769) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((176652 : Rat) / 769) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-88326 : Rat) / 769) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-88326 : Rat) / 769) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 17. -/
theorem ep_Q2_074_partial_17_0306_valid :
    mulPoly ep_Q2_074_coefficient_17_0306
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0307 : Poly :=
[
  term ((-5994 : Rat) / 769) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 307 for generator 17. -/
def ep_Q2_074_partial_17_0307 : Poly :=
[
  term ((-11988 : Rat) / 769) [(4, 1), (6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-11988 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 17. -/
theorem ep_Q2_074_partial_17_0307_valid :
    mulPoly ep_Q2_074_coefficient_17_0307
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0308 : Poly :=
[
  term ((1230 : Rat) / 769) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 17. -/
def ep_Q2_074_partial_17_0308 : Poly :=
[
  term ((2460 : Rat) / 769) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2460 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 17. -/
theorem ep_Q2_074_partial_17_0308_valid :
    mulPoly ep_Q2_074_coefficient_17_0308
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0309 : Poly :=
[
  term ((17922 : Rat) / 769) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 309 for generator 17. -/
def ep_Q2_074_partial_17_0309 : Poly :=
[
  term ((35844 : Rat) / 769) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((35844 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17922 : Rat) / 769) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-17922 : Rat) / 769) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 17. -/
theorem ep_Q2_074_partial_17_0309_valid :
    mulPoly ep_Q2_074_coefficient_17_0309
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0310 : Poly :=
[
  term ((-1230 : Rat) / 769) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 17. -/
def ep_Q2_074_partial_17_0310 : Poly :=
[
  term ((-2460 : Rat) / 769) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2460 : Rat) / 769) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1230 : Rat) / 769) [(4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1230 : Rat) / 769) [(4, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 17. -/
theorem ep_Q2_074_partial_17_0310_valid :
    mulPoly ep_Q2_074_coefficient_17_0310
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0311 : Poly :=
[
  term ((-7839 : Rat) / 769) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 17. -/
def ep_Q2_074_partial_17_0311 : Poly :=
[
  term ((-15678 : Rat) / 769) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15678 : Rat) / 769) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((7839 : Rat) / 769) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7839 : Rat) / 769) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 17. -/
theorem ep_Q2_074_partial_17_0311_valid :
    mulPoly ep_Q2_074_coefficient_17_0311
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0312 : Poly :=
[
  term ((46827 : Rat) / 1538) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 312 for generator 17. -/
def ep_Q2_074_partial_17_0312 : Poly :=
[
  term ((46827 : Rat) / 769) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((46827 : Rat) / 769) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46827 : Rat) / 1538) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-46827 : Rat) / 1538) [(4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 17. -/
theorem ep_Q2_074_partial_17_0312_valid :
    mulPoly ep_Q2_074_coefficient_17_0312
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0313 : Poly :=
[
  term ((-615 : Rat) / 769) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 313 for generator 17. -/
def ep_Q2_074_partial_17_0313 : Poly :=
[
  term ((-1230 : Rat) / 769) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((615 : Rat) / 769) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((615 : Rat) / 769) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 17. -/
theorem ep_Q2_074_partial_17_0313_valid :
    mulPoly ep_Q2_074_coefficient_17_0313
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0314 : Poly :=
[
  term ((-95463 : Rat) / 1538) [(4, 1), (16, 1)]
]

/-- Partial product 314 for generator 17. -/
def ep_Q2_074_partial_17_0314 : Poly :=
[
  term ((-95463 : Rat) / 769) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-95463 : Rat) / 769) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((95463 : Rat) / 1538) [(4, 1), (14, 2), (16, 1)],
  term ((95463 : Rat) / 1538) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 17. -/
theorem ep_Q2_074_partial_17_0314_valid :
    mulPoly ep_Q2_074_coefficient_17_0314
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0315 : Poly :=
[
  term ((15993 : Rat) / 3076) [(4, 2), (14, 1), (16, 1)]
]

/-- Partial product 315 for generator 17. -/
def ep_Q2_074_partial_17_0315 : Poly :=
[
  term ((15993 : Rat) / 1538) [(4, 2), (6, 1), (14, 2), (16, 1)],
  term ((15993 : Rat) / 1538) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15993 : Rat) / 3076) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-15993 : Rat) / 3076) [(4, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 17. -/
theorem ep_Q2_074_partial_17_0315_valid :
    mulPoly ep_Q2_074_coefficient_17_0315
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0316 : Poly :=
[
  term ((-47979 : Rat) / 6152) [(4, 2), (16, 1)]
]

/-- Partial product 316 for generator 17. -/
def ep_Q2_074_partial_17_0316 : Poly :=
[
  term ((-47979 : Rat) / 3076) [(4, 2), (6, 1), (14, 1), (16, 1)],
  term ((-47979 : Rat) / 3076) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((47979 : Rat) / 6152) [(4, 2), (14, 2), (16, 1)],
  term ((47979 : Rat) / 6152) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 17. -/
theorem ep_Q2_074_partial_17_0316_valid :
    mulPoly ep_Q2_074_coefficient_17_0316
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0317 : Poly :=
[
  term ((5901 : Rat) / 769) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 317 for generator 17. -/
def ep_Q2_074_partial_17_0317 : Poly :=
[
  term ((11802 : Rat) / 769) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5901 : Rat) / 769) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-5901 : Rat) / 769) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((11802 : Rat) / 769) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 17. -/
theorem ep_Q2_074_partial_17_0317_valid :
    mulPoly ep_Q2_074_coefficient_17_0317
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0318 : Poly :=
[
  term ((-63 : Rat) / 769) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 318 for generator 17. -/
def ep_Q2_074_partial_17_0318 : Poly :=
[
  term ((-126 : Rat) / 769) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-126 : Rat) / 769) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 769) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((63 : Rat) / 769) [(5, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 17. -/
theorem ep_Q2_074_partial_17_0318_valid :
    mulPoly ep_Q2_074_coefficient_17_0318
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0319 : Poly :=
[
  term ((-189 : Rat) / 1538) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 319 for generator 17. -/
def ep_Q2_074_partial_17_0319 : Poly :=
[
  term ((-189 : Rat) / 769) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-189 : Rat) / 769) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((189 : Rat) / 1538) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((189 : Rat) / 1538) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 17. -/
theorem ep_Q2_074_partial_17_0319_valid :
    mulPoly ep_Q2_074_coefficient_17_0319
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0320 : Poly :=
[
  term ((6801 : Rat) / 769) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 17. -/
def ep_Q2_074_partial_17_0320 : Poly :=
[
  term ((13602 : Rat) / 769) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((13602 : Rat) / 769) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6801 : Rat) / 769) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6801 : Rat) / 769) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 17. -/
theorem ep_Q2_074_partial_17_0320_valid :
    mulPoly ep_Q2_074_coefficient_17_0320
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0321 : Poly :=
[
  term ((15993 : Rat) / 3076) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 321 for generator 17. -/
def ep_Q2_074_partial_17_0321 : Poly :=
[
  term ((15993 : Rat) / 1538) [(5, 2), (6, 1), (14, 2), (16, 1)],
  term ((15993 : Rat) / 1538) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15993 : Rat) / 3076) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-15993 : Rat) / 3076) [(5, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 17. -/
theorem ep_Q2_074_partial_17_0321_valid :
    mulPoly ep_Q2_074_coefficient_17_0321
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0322 : Poly :=
[
  term ((133125 : Rat) / 6152) [(5, 2), (16, 1)]
]

/-- Partial product 322 for generator 17. -/
def ep_Q2_074_partial_17_0322 : Poly :=
[
  term ((133125 : Rat) / 3076) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((133125 : Rat) / 3076) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-133125 : Rat) / 6152) [(5, 2), (14, 2), (16, 1)],
  term ((-133125 : Rat) / 6152) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 17. -/
theorem ep_Q2_074_partial_17_0322_valid :
    mulPoly ep_Q2_074_coefficient_17_0322
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0323 : Poly :=
[
  term ((25180 : Rat) / 769) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 17. -/
def ep_Q2_074_partial_17_0323 : Poly :=
[
  term ((50360 : Rat) / 769) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25180 : Rat) / 769) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25180 : Rat) / 769) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((50360 : Rat) / 769) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 17. -/
theorem ep_Q2_074_partial_17_0323_valid :
    mulPoly ep_Q2_074_coefficient_17_0323
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0324 : Poly :=
[
  term ((14589 : Rat) / 769) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 17. -/
def ep_Q2_074_partial_17_0324 : Poly :=
[
  term ((29178 : Rat) / 769) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14589 : Rat) / 769) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14589 : Rat) / 769) [(7, 1), (15, 3), (16, 1)],
  term ((29178 : Rat) / 769) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 17. -/
theorem ep_Q2_074_partial_17_0324_valid :
    mulPoly ep_Q2_074_coefficient_17_0324
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0325 : Poly :=
[
  term ((-101292 : Rat) / 769) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 325 for generator 17. -/
def ep_Q2_074_partial_17_0325 : Poly :=
[
  term ((-202584 : Rat) / 769) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-202584 : Rat) / 769) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((101292 : Rat) / 769) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((101292 : Rat) / 769) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 17. -/
theorem ep_Q2_074_partial_17_0325_valid :
    mulPoly ep_Q2_074_coefficient_17_0325
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0326 : Poly :=
[
  term ((-3204 : Rat) / 769) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 326 for generator 17. -/
def ep_Q2_074_partial_17_0326 : Poly :=
[
  term ((-6408 : Rat) / 769) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-6408 : Rat) / 769) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3204 : Rat) / 769) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3204 : Rat) / 769) [(10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 17. -/
theorem ep_Q2_074_partial_17_0326_valid :
    mulPoly ep_Q2_074_coefficient_17_0326
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0327 : Poly :=
[
  term ((184926 : Rat) / 769) [(10, 1), (16, 1)]
]

/-- Partial product 327 for generator 17. -/
def ep_Q2_074_partial_17_0327 : Poly :=
[
  term ((369852 : Rat) / 769) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((369852 : Rat) / 769) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-184926 : Rat) / 769) [(10, 1), (14, 2), (16, 1)],
  term ((-184926 : Rat) / 769) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 17. -/
theorem ep_Q2_074_partial_17_0327_valid :
    mulPoly ep_Q2_074_coefficient_17_0327
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0328 : Poly :=
[
  term ((54576 : Rat) / 769) [(10, 2), (12, 1), (16, 1)]
]

/-- Partial product 328 for generator 17. -/
def ep_Q2_074_partial_17_0328 : Poly :=
[
  term ((109152 : Rat) / 769) [(6, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((109152 : Rat) / 769) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (12, 1), (14, 2), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 17. -/
theorem ep_Q2_074_partial_17_0328_valid :
    mulPoly ep_Q2_074_coefficient_17_0328
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0329 : Poly :=
[
  term ((-109152 : Rat) / 769) [(10, 2), (16, 1)]
]

/-- Partial product 329 for generator 17. -/
def ep_Q2_074_partial_17_0329 : Poly :=
[
  term ((-218304 : Rat) / 769) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((-218304 : Rat) / 769) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((109152 : Rat) / 769) [(10, 2), (14, 2), (16, 1)],
  term ((109152 : Rat) / 769) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 17. -/
theorem ep_Q2_074_partial_17_0329_valid :
    mulPoly ep_Q2_074_coefficient_17_0329
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0330 : Poly :=
[
  term ((93861 : Rat) / 3076) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 330 for generator 17. -/
def ep_Q2_074_partial_17_0330 : Poly :=
[
  term ((93861 : Rat) / 1538) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((93861 : Rat) / 1538) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93861 : Rat) / 3076) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-93861 : Rat) / 3076) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 17. -/
theorem ep_Q2_074_partial_17_0330_valid :
    mulPoly ep_Q2_074_coefficient_17_0330
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0331 : Poly :=
[
  term ((-12590 : Rat) / 769) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 17. -/
def ep_Q2_074_partial_17_0331 : Poly :=
[
  term ((-25180 : Rat) / 769) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25180 : Rat) / 769) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((12590 : Rat) / 769) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((12590 : Rat) / 769) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 17. -/
theorem ep_Q2_074_partial_17_0331_valid :
    mulPoly ep_Q2_074_coefficient_17_0331
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0332 : Poly :=
[
  term ((384277 : Rat) / 6152) [(12, 1), (16, 1)]
]

/-- Partial product 332 for generator 17. -/
def ep_Q2_074_partial_17_0332 : Poly :=
[
  term ((384277 : Rat) / 3076) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((384277 : Rat) / 3076) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-384277 : Rat) / 6152) [(12, 1), (14, 2), (16, 1)],
  term ((-384277 : Rat) / 6152) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 17. -/
theorem ep_Q2_074_partial_17_0332_valid :
    mulPoly ep_Q2_074_coefficient_17_0332
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0333 : Poly :=
[
  term ((12590 : Rat) / 769) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 17. -/
def ep_Q2_074_partial_17_0333 : Poly :=
[
  term ((25180 : Rat) / 769) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((25180 : Rat) / 769) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12590 : Rat) / 769) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-12590 : Rat) / 769) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 17. -/
theorem ep_Q2_074_partial_17_0333_valid :
    mulPoly ep_Q2_074_coefficient_17_0333
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0334 : Poly :=
[
  term ((26580 : Rat) / 769) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 17. -/
def ep_Q2_074_partial_17_0334 : Poly :=
[
  term ((53160 : Rat) / 769) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((53160 : Rat) / 769) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-26580 : Rat) / 769) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26580 : Rat) / 769) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 17. -/
theorem ep_Q2_074_partial_17_0334_valid :
    mulPoly ep_Q2_074_coefficient_17_0334
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0335 : Poly :=
[
  term ((-134089 : Rat) / 6152) [(14, 1), (16, 1)]
]

/-- Partial product 335 for generator 17. -/
def ep_Q2_074_partial_17_0335 : Poly :=
[
  term ((-134089 : Rat) / 3076) [(6, 1), (14, 2), (16, 1)],
  term ((-134089 : Rat) / 3076) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((134089 : Rat) / 6152) [(14, 1), (15, 2), (16, 1)],
  term ((134089 : Rat) / 6152) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 17. -/
theorem ep_Q2_074_partial_17_0335_valid :
    mulPoly ep_Q2_074_coefficient_17_0335
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0336 : Poly :=
[
  term ((46429 : Rat) / 3076) [(15, 2), (16, 1)]
]

/-- Partial product 336 for generator 17. -/
def ep_Q2_074_partial_17_0336 : Poly :=
[
  term ((46429 : Rat) / 1538) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((46429 : Rat) / 1538) [(7, 1), (15, 3), (16, 1)],
  term ((-46429 : Rat) / 3076) [(14, 2), (15, 2), (16, 1)],
  term ((-46429 : Rat) / 3076) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 17. -/
theorem ep_Q2_074_partial_17_0336_valid :
    mulPoly ep_Q2_074_coefficient_17_0336
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 17. -/
def ep_Q2_074_coefficient_17_0337 : Poly :=
[
  term ((-229631 : Rat) / 3076) [(16, 1)]
]

/-- Partial product 337 for generator 17. -/
def ep_Q2_074_partial_17_0337 : Poly :=
[
  term ((-229631 : Rat) / 1538) [(6, 1), (14, 1), (16, 1)],
  term ((-229631 : Rat) / 1538) [(7, 1), (15, 1), (16, 1)],
  term ((229631 : Rat) / 3076) [(14, 2), (16, 1)],
  term ((229631 : Rat) / 3076) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 17. -/
theorem ep_Q2_074_partial_17_0337_valid :
    mulPoly ep_Q2_074_coefficient_17_0337
        ep_Q2_074_generator_17_0300_0337 =
      ep_Q2_074_partial_17_0337 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_17_0300_0337 : List Poly :=
[
  ep_Q2_074_partial_17_0300,
  ep_Q2_074_partial_17_0301,
  ep_Q2_074_partial_17_0302,
  ep_Q2_074_partial_17_0303,
  ep_Q2_074_partial_17_0304,
  ep_Q2_074_partial_17_0305,
  ep_Q2_074_partial_17_0306,
  ep_Q2_074_partial_17_0307,
  ep_Q2_074_partial_17_0308,
  ep_Q2_074_partial_17_0309,
  ep_Q2_074_partial_17_0310,
  ep_Q2_074_partial_17_0311,
  ep_Q2_074_partial_17_0312,
  ep_Q2_074_partial_17_0313,
  ep_Q2_074_partial_17_0314,
  ep_Q2_074_partial_17_0315,
  ep_Q2_074_partial_17_0316,
  ep_Q2_074_partial_17_0317,
  ep_Q2_074_partial_17_0318,
  ep_Q2_074_partial_17_0319,
  ep_Q2_074_partial_17_0320,
  ep_Q2_074_partial_17_0321,
  ep_Q2_074_partial_17_0322,
  ep_Q2_074_partial_17_0323,
  ep_Q2_074_partial_17_0324,
  ep_Q2_074_partial_17_0325,
  ep_Q2_074_partial_17_0326,
  ep_Q2_074_partial_17_0327,
  ep_Q2_074_partial_17_0328,
  ep_Q2_074_partial_17_0329,
  ep_Q2_074_partial_17_0330,
  ep_Q2_074_partial_17_0331,
  ep_Q2_074_partial_17_0332,
  ep_Q2_074_partial_17_0333,
  ep_Q2_074_partial_17_0334,
  ep_Q2_074_partial_17_0335,
  ep_Q2_074_partial_17_0336,
  ep_Q2_074_partial_17_0337
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_17_0300_0337 : Poly :=
[
  term ((63207 : Rat) / 769) [(3, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-61479 : Rat) / 1538) [(3, 2), (6, 1), (14, 1), (16, 1)],
  term ((63207 : Rat) / 769) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-61479 : Rat) / 1538) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-63207 : Rat) / 1538) [(3, 2), (12, 1), (14, 2), (16, 1)],
  term ((-63207 : Rat) / 1538) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((61479 : Rat) / 3076) [(3, 2), (14, 2), (16, 1)],
  term ((61479 : Rat) / 3076) [(3, 2), (15, 2), (16, 1)],
  term ((-4920 : Rat) / 769) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72918 : Rat) / 769) [(4, 1), (6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((176652 : Rat) / 769) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-20880 : Rat) / 769) [(4, 1), (6, 1), (10, 1), (14, 2), (16, 1)],
  term ((2460 : Rat) / 769) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((35844 : Rat) / 769) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11988 : Rat) / 769) [(4, 1), (6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-15678 : Rat) / 769) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2460 : Rat) / 769) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-95463 : Rat) / 769) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((46827 : Rat) / 769) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-72918 : Rat) / 769) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20880 : Rat) / 769) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((176652 : Rat) / 769) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11988 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((35844 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4920 : Rat) / 769) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2460 : Rat) / 769) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15678 : Rat) / 769) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((46827 : Rat) / 769) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-95463 : Rat) / 769) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-4920 : Rat) / 769) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((10440 : Rat) / 769) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-88326 : Rat) / 769) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((10440 : Rat) / 769) [(4, 1), (10, 1), (14, 3), (16, 1)],
  term ((-88326 : Rat) / 769) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-17922 : Rat) / 769) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (12, 1), (14, 3), (16, 1)],
  term ((-17922 : Rat) / 769) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (12, 1), (15, 4), (16, 1)],
  term ((1230 : Rat) / 769) [(4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((7839 : Rat) / 769) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1230 : Rat) / 769) [(4, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((7839 : Rat) / 769) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-46827 : Rat) / 1538) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((615 : Rat) / 769) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((95463 : Rat) / 1538) [(4, 1), (14, 2), (16, 1)],
  term ((-46827 : Rat) / 1538) [(4, 1), (14, 3), (16, 1)],
  term ((95463 : Rat) / 1538) [(4, 1), (15, 2), (16, 1)],
  term ((615 : Rat) / 769) [(4, 1), (15, 4), (16, 1)],
  term ((-47979 : Rat) / 3076) [(4, 2), (6, 1), (14, 1), (16, 1)],
  term ((15993 : Rat) / 1538) [(4, 2), (6, 1), (14, 2), (16, 1)],
  term ((15993 : Rat) / 1538) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47979 : Rat) / 3076) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-15993 : Rat) / 3076) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((47979 : Rat) / 6152) [(4, 2), (14, 2), (16, 1)],
  term ((-15993 : Rat) / 3076) [(4, 2), (14, 3), (16, 1)],
  term ((47979 : Rat) / 6152) [(4, 2), (15, 2), (16, 1)],
  term ((11802 : Rat) / 769) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-189 : Rat) / 769) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((13602 : Rat) / 769) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 769) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5901 : Rat) / 769) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((7701 : Rat) / 769) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((11802 : Rat) / 769) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((63 : Rat) / 769) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((189 : Rat) / 1538) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((63 : Rat) / 769) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((189 : Rat) / 1538) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6801 : Rat) / 769) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6801 : Rat) / 769) [(5, 1), (15, 3), (16, 1)],
  term ((133125 : Rat) / 3076) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((15993 : Rat) / 1538) [(5, 2), (6, 1), (14, 2), (16, 1)],
  term ((15993 : Rat) / 1538) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((133125 : Rat) / 3076) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-15993 : Rat) / 3076) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-133125 : Rat) / 6152) [(5, 2), (14, 2), (16, 1)],
  term ((-15993 : Rat) / 3076) [(5, 2), (14, 3), (16, 1)],
  term ((-133125 : Rat) / 6152) [(5, 2), (15, 2), (16, 1)],
  term ((50360 : Rat) / 769) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((29178 : Rat) / 769) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-202584 : Rat) / 769) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((369852 : Rat) / 769) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-6408 : Rat) / 769) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((109152 : Rat) / 769) [(6, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-218304 : Rat) / 769) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((-25180 : Rat) / 769) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((384277 : Rat) / 3076) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((93861 : Rat) / 1538) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((53160 : Rat) / 769) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25180 : Rat) / 769) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((46429 : Rat) / 1538) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-229631 : Rat) / 1538) [(6, 1), (14, 1), (16, 1)],
  term ((-134089 : Rat) / 3076) [(6, 1), (14, 2), (16, 1)],
  term ((-202584 : Rat) / 769) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6408 : Rat) / 769) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((369852 : Rat) / 769) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((109152 : Rat) / 769) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-218304 : Rat) / 769) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((93861 : Rat) / 1538) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25180 : Rat) / 769) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((384277 : Rat) / 3076) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50360 : Rat) / 769) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((25180 : Rat) / 769) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((53160 : Rat) / 769) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-134089 : Rat) / 3076) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14589 : Rat) / 769) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-229631 : Rat) / 1538) [(7, 1), (15, 1), (16, 1)],
  term ((17251 : Rat) / 1538) [(7, 1), (15, 3), (16, 1)],
  term ((50360 : Rat) / 769) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((29178 : Rat) / 769) [(7, 2), (15, 2), (16, 1)],
  term ((101292 : Rat) / 769) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((101292 : Rat) / 769) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3204 : Rat) / 769) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-184926 : Rat) / 769) [(10, 1), (14, 2), (16, 1)],
  term ((3204 : Rat) / 769) [(10, 1), (14, 3), (16, 1)],
  term ((-184926 : Rat) / 769) [(10, 1), (15, 2), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (12, 1), (14, 2), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((109152 : Rat) / 769) [(10, 2), (14, 2), (16, 1)],
  term ((109152 : Rat) / 769) [(10, 2), (15, 2), (16, 1)],
  term ((-93861 : Rat) / 3076) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12590 : Rat) / 769) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-384277 : Rat) / 6152) [(12, 1), (14, 2), (16, 1)],
  term ((-93861 : Rat) / 3076) [(12, 1), (14, 3), (16, 1)],
  term ((-384277 : Rat) / 6152) [(12, 1), (15, 2), (16, 1)],
  term ((12590 : Rat) / 769) [(12, 1), (15, 4), (16, 1)],
  term ((-12590 : Rat) / 769) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-26580 : Rat) / 769) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12590 : Rat) / 769) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-26580 : Rat) / 769) [(13, 1), (15, 3), (16, 1)],
  term ((134089 : Rat) / 6152) [(14, 1), (15, 2), (16, 1)],
  term ((-46429 : Rat) / 3076) [(14, 2), (15, 2), (16, 1)],
  term ((229631 : Rat) / 3076) [(14, 2), (16, 1)],
  term ((134089 : Rat) / 6152) [(14, 3), (16, 1)],
  term ((229631 : Rat) / 3076) [(15, 2), (16, 1)],
  term ((-46429 : Rat) / 3076) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 300 through 337. -/
theorem ep_Q2_074_block_17_0300_0337_valid :
    checkProductSumEq ep_Q2_074_partials_17_0300_0337
      ep_Q2_074_block_17_0300_0337 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
