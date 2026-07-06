/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 22:300-376

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_22_0300_0376 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0300 : Poly :=
[
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 300 for generator 22. -/
def ep_Q2_020_partial_22_0300 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 22. -/
theorem ep_Q2_020_partial_22_0300_valid :
    mulPoly ep_Q2_020_coefficient_22_0300
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0301 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 22. -/
def ep_Q2_020_partial_22_0301 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 22. -/
theorem ep_Q2_020_partial_22_0301_valid :
    mulPoly ep_Q2_020_coefficient_22_0301
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0302 : Poly :=
[
  term ((-330004690464974700 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 302 for generator 22. -/
def ep_Q2_020_partial_22_0302 : Poly :=
[
  term ((-660009380929949400 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((330004690464974700 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-660009380929949400 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((330004690464974700 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 22. -/
theorem ep_Q2_020_partial_22_0302_valid :
    mulPoly ep_Q2_020_coefficient_22_0302
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0303 : Poly :=
[
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 303 for generator 22. -/
def ep_Q2_020_partial_22_0303 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 22. -/
theorem ep_Q2_020_partial_22_0303_valid :
    mulPoly ep_Q2_020_coefficient_22_0303
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0304 : Poly :=
[
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 22. -/
def ep_Q2_020_partial_22_0304 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 22. -/
theorem ep_Q2_020_partial_22_0304_valid :
    mulPoly ep_Q2_020_coefficient_22_0304
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0305 : Poly :=
[
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 22. -/
def ep_Q2_020_partial_22_0305 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 22. -/
theorem ep_Q2_020_partial_22_0305_valid :
    mulPoly ep_Q2_020_coefficient_22_0305
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0306 : Poly :=
[
  term ((-309185344749150564 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 306 for generator 22. -/
def ep_Q2_020_partial_22_0306 : Poly :=
[
  term ((-618370689498301128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((309185344749150564 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-618370689498301128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((309185344749150564 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 22. -/
theorem ep_Q2_020_partial_22_0306_valid :
    mulPoly ep_Q2_020_coefficient_22_0306
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0307 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 307 for generator 22. -/
def ep_Q2_020_partial_22_0307 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 22. -/
theorem ep_Q2_020_partial_22_0307_valid :
    mulPoly ep_Q2_020_coefficient_22_0307
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0308 : Poly :=
[
  term ((868309149650465745 : Rat) / 56596790034801622) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 308 for generator 22. -/
def ep_Q2_020_partial_22_0308 : Poly :=
[
  term ((868309149650465745 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-868309149650465745 : Rat) / 56596790034801622) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((868309149650465745 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-868309149650465745 : Rat) / 56596790034801622) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 22. -/
theorem ep_Q2_020_partial_22_0308_valid :
    mulPoly ep_Q2_020_coefficient_22_0308
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0309 : Poly :=
[
  term ((145634101670739516 : Rat) / 28298395017400811) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 22. -/
def ep_Q2_020_partial_22_0309 : Poly :=
[
  term ((291268203341479032 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-145634101670739516 : Rat) / 28298395017400811) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((291268203341479032 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-145634101670739516 : Rat) / 28298395017400811) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 22. -/
theorem ep_Q2_020_partial_22_0309_valid :
    mulPoly ep_Q2_020_coefficient_22_0309
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0310 : Poly :=
[
  term ((147069836239866711 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 22. -/
def ep_Q2_020_partial_22_0310 : Poly :=
[
  term ((294139672479733422 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-147069836239866711 : Rat) / 28298395017400811) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((294139672479733422 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-147069836239866711 : Rat) / 28298395017400811) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 22. -/
theorem ep_Q2_020_partial_22_0310_valid :
    mulPoly ep_Q2_020_coefficient_22_0310
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0311 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 311 for generator 22. -/
def ep_Q2_020_partial_22_0311 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 22. -/
theorem ep_Q2_020_partial_22_0311_valid :
    mulPoly ep_Q2_020_coefficient_22_0311
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0312 : Poly :=
[
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 312 for generator 22. -/
def ep_Q2_020_partial_22_0312 : Poly :=
[
  term ((-116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 22. -/
theorem ep_Q2_020_partial_22_0312_valid :
    mulPoly ep_Q2_020_coefficient_22_0312
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0313 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 313 for generator 22. -/
def ep_Q2_020_partial_22_0313 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 22. -/
theorem ep_Q2_020_partial_22_0313_valid :
    mulPoly ep_Q2_020_coefficient_22_0313
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0314 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 22. -/
def ep_Q2_020_partial_22_0314 : Poly :=
[
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 22. -/
theorem ep_Q2_020_partial_22_0314_valid :
    mulPoly ep_Q2_020_coefficient_22_0314
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0315 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 315 for generator 22. -/
def ep_Q2_020_partial_22_0315 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 22. -/
theorem ep_Q2_020_partial_22_0315_valid :
    mulPoly ep_Q2_020_coefficient_22_0315
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0316 : Poly :=
[
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 316 for generator 22. -/
def ep_Q2_020_partial_22_0316 : Poly :=
[
  term ((8266557160685088 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 22. -/
theorem ep_Q2_020_partial_22_0316_valid :
    mulPoly ep_Q2_020_coefficient_22_0316
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0317 : Poly :=
[
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 317 for generator 22. -/
def ep_Q2_020_partial_22_0317 : Poly :=
[
  term ((41831426046830472 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (8, 2), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 22. -/
theorem ep_Q2_020_partial_22_0317_valid :
    mulPoly ep_Q2_020_coefficient_22_0317
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0318 : Poly :=
[
  term ((119000440197182220 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 318 for generator 22. -/
def ep_Q2_020_partial_22_0318 : Poly :=
[
  term ((238000880394364440 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-119000440197182220 : Rat) / 28298395017400811) [(7, 2), (8, 2), (16, 1)],
  term ((238000880394364440 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-119000440197182220 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 22. -/
theorem ep_Q2_020_partial_22_0318_valid :
    mulPoly ep_Q2_020_coefficient_22_0318
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0319 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 319 for generator 22. -/
def ep_Q2_020_partial_22_0319 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 3), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 22. -/
theorem ep_Q2_020_partial_22_0319_valid :
    mulPoly ep_Q2_020_coefficient_22_0319
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0320 : Poly :=
[
  term ((23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (16, 1)]
]

/-- Partial product 320 for generator 22. -/
def ep_Q2_020_partial_22_0320 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (9, 2), (11, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 22. -/
theorem ep_Q2_020_partial_22_0320_valid :
    mulPoly ep_Q2_020_coefficient_22_0320
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0321 : Poly :=
[
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 321 for generator 22. -/
def ep_Q2_020_partial_22_0321 : Poly :=
[
  term ((-28581745286490000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 22. -/
theorem ep_Q2_020_partial_22_0321_valid :
    mulPoly ep_Q2_020_coefficient_22_0321
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0322 : Poly :=
[
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 322 for generator 22. -/
def ep_Q2_020_partial_22_0322 : Poly :=
[
  term ((3897510720885000 : Rat) / 975806724737959) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 975806724737959) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 22. -/
theorem ep_Q2_020_partial_22_0322_valid :
    mulPoly ep_Q2_020_coefficient_22_0322
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0323 : Poly :=
[
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 22. -/
def ep_Q2_020_partial_22_0323 : Poly :=
[
  term ((-1311620922455712 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 22. -/
theorem ep_Q2_020_partial_22_0323_valid :
    mulPoly ep_Q2_020_coefficient_22_0323
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0324 : Poly :=
[
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 22. -/
def ep_Q2_020_partial_22_0324 : Poly :=
[
  term ((4400051354968116081 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 28298395017400811) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 22. -/
theorem ep_Q2_020_partial_22_0324_valid :
    mulPoly ep_Q2_020_coefficient_22_0324
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0325 : Poly :=
[
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 325 for generator 22. -/
def ep_Q2_020_partial_22_0325 : Poly :=
[
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 22. -/
theorem ep_Q2_020_partial_22_0325_valid :
    mulPoly ep_Q2_020_coefficient_22_0325
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0326 : Poly :=
[
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 326 for generator 22. -/
def ep_Q2_020_partial_22_0326 : Poly :=
[
  term ((-73385709777162504 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 22. -/
theorem ep_Q2_020_partial_22_0326_valid :
    mulPoly ep_Q2_020_coefficient_22_0326
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0327 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 2), (16, 1)]
]

/-- Partial product 327 for generator 22. -/
def ep_Q2_020_partial_22_0327 : Poly :=
[
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 2), (10, 1), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 22. -/
theorem ep_Q2_020_partial_22_0327_valid :
    mulPoly ep_Q2_020_coefficient_22_0327
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0328 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 22. -/
def ep_Q2_020_partial_22_0328 : Poly :=
[
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 22. -/
theorem ep_Q2_020_partial_22_0328_valid :
    mulPoly ep_Q2_020_coefficient_22_0328
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0329 : Poly :=
[
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 22. -/
def ep_Q2_020_partial_22_0329 : Poly :=
[
  term ((345706636672105404 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-172853318336052702 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((345706636672105404 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-172853318336052702 : Rat) / 28298395017400811) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 22. -/
theorem ep_Q2_020_partial_22_0329_valid :
    mulPoly ep_Q2_020_coefficient_22_0329
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0330 : Poly :=
[
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 330 for generator 22. -/
def ep_Q2_020_partial_22_0330 : Poly :=
[
  term ((-17961333071545476 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((8980666535772738 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-17961333071545476 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((8980666535772738 : Rat) / 28298395017400811) [(8, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 22. -/
theorem ep_Q2_020_partial_22_0330_valid :
    mulPoly ep_Q2_020_coefficient_22_0330
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0331 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 22. -/
def ep_Q2_020_partial_22_0331 : Poly :=
[
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 22. -/
theorem ep_Q2_020_partial_22_0331_valid :
    mulPoly ep_Q2_020_coefficient_22_0331
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0332 : Poly :=
[
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 332 for generator 22. -/
def ep_Q2_020_partial_22_0332 : Poly :=
[
  term ((1497799012746066572 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-748899506373033286 : Rat) / 28298395017400811) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((1497799012746066572 : Rat) / 28298395017400811) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-748899506373033286 : Rat) / 28298395017400811) [(8, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 22. -/
theorem ep_Q2_020_partial_22_0332_valid :
    mulPoly ep_Q2_020_coefficient_22_0332
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0333 : Poly :=
[
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 22. -/
def ep_Q2_020_partial_22_0333 : Poly :=
[
  term ((59619132838896 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-29809566419448 : Rat) / 1230365000756557) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-29809566419448 : Rat) / 1230365000756557) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 22. -/
theorem ep_Q2_020_partial_22_0333_valid :
    mulPoly ep_Q2_020_coefficient_22_0333
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0334 : Poly :=
[
  term ((-1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (16, 1)]
]

/-- Partial product 334 for generator 22. -/
def ep_Q2_020_partial_22_0334 : Poly :=
[
  term ((-1786254623283510589 : Rat) / 113193580069603244) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (9, 2), (16, 1)],
  term ((-1786254623283510589 : Rat) / 113193580069603244) [(8, 2), (10, 1), (16, 1)],
  term ((1786254623283510589 : Rat) / 226387160139206488) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 22. -/
theorem ep_Q2_020_partial_22_0334_valid :
    mulPoly ep_Q2_020_coefficient_22_0334
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0335 : Poly :=
[
  term ((63040682717534934 : Rat) / 28298395017400811) [(8, 2), (16, 1)]
]

/-- Partial product 335 for generator 22. -/
def ep_Q2_020_partial_22_0335 : Poly :=
[
  term ((126081365435069868 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(8, 2), (9, 2), (16, 1)],
  term ((126081365435069868 : Rat) / 28298395017400811) [(8, 3), (10, 1), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(8, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 22. -/
theorem ep_Q2_020_partial_22_0335_valid :
    mulPoly ep_Q2_020_coefficient_22_0335
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0336 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 22. -/
def ep_Q2_020_partial_22_0336 : Poly :=
[
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 22. -/
theorem ep_Q2_020_partial_22_0336_valid :
    mulPoly ep_Q2_020_coefficient_22_0336
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0337 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 22. -/
def ep_Q2_020_partial_22_0337 : Poly :=
[
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 22. -/
theorem ep_Q2_020_partial_22_0337_valid :
    mulPoly ep_Q2_020_coefficient_22_0337
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0338 : Poly :=
[
  term ((507584456368439801 : Rat) / 113193580069603244) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 338 for generator 22. -/
def ep_Q2_020_partial_22_0338 : Poly :=
[
  term ((507584456368439801 : Rat) / 56596790034801622) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-507584456368439801 : Rat) / 113193580069603244) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((507584456368439801 : Rat) / 56596790034801622) [(9, 2), (11, 2), (16, 1)],
  term ((-507584456368439801 : Rat) / 113193580069603244) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 22. -/
theorem ep_Q2_020_partial_22_0338_valid :
    mulPoly ep_Q2_020_coefficient_22_0338
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0339 : Poly :=
[
  term ((-7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 339 for generator 22. -/
def ep_Q2_020_partial_22_0339 : Poly :=
[
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 2), (11, 3), (13, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 3), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 22. -/
theorem ep_Q2_020_partial_22_0339_valid :
    mulPoly ep_Q2_020_coefficient_22_0339
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0340 : Poly :=
[
  term ((-327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 22. -/
def ep_Q2_020_partial_22_0340 : Poly :=
[
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 22. -/
theorem ep_Q2_020_partial_22_0340_valid :
    mulPoly ep_Q2_020_coefficient_22_0340
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0341 : Poly :=
[
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 341 for generator 22. -/
def ep_Q2_020_partial_22_0341 : Poly :=
[
  term ((409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((409195217538158940 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(9, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 22. -/
theorem ep_Q2_020_partial_22_0341_valid :
    mulPoly ep_Q2_020_coefficient_22_0341
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0342 : Poly :=
[
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 22. -/
def ep_Q2_020_partial_22_0342 : Poly :=
[
  term ((-609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-609559985463354000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 22. -/
theorem ep_Q2_020_partial_22_0342_valid :
    mulPoly ep_Q2_020_coefficient_22_0342
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0343 : Poly :=
[
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 343 for generator 22. -/
def ep_Q2_020_partial_22_0343 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 22. -/
theorem ep_Q2_020_partial_22_0343_valid :
    mulPoly ep_Q2_020_coefficient_22_0343
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0344 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 344 for generator 22. -/
def ep_Q2_020_partial_22_0344 : Poly :=
[
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 22. -/
theorem ep_Q2_020_partial_22_0344_valid :
    mulPoly ep_Q2_020_coefficient_22_0344
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0345 : Poly :=
[
  term ((-253498591440945816 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 345 for generator 22. -/
def ep_Q2_020_partial_22_0345 : Poly :=
[
  term ((-506997182881891632 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((253498591440945816 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-506997182881891632 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((253498591440945816 : Rat) / 28298395017400811) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 22. -/
theorem ep_Q2_020_partial_22_0345_valid :
    mulPoly ep_Q2_020_coefficient_22_0345
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0346 : Poly :=
[
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 22. -/
def ep_Q2_020_partial_22_0346 : Poly :=
[
  term ((298095664194480 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 22. -/
theorem ep_Q2_020_partial_22_0346_valid :
    mulPoly ep_Q2_020_coefficient_22_0346
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0347 : Poly :=
[
  term ((4280037303797814429 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 22. -/
def ep_Q2_020_partial_22_0347 : Poly :=
[
  term ((4280037303797814429 : Rat) / 56596790034801622) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((4280037303797814429 : Rat) / 56596790034801622) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 22. -/
theorem ep_Q2_020_partial_22_0347_valid :
    mulPoly ep_Q2_020_coefficient_22_0347
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0348 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 348 for generator 22. -/
def ep_Q2_020_partial_22_0348 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 22. -/
theorem ep_Q2_020_partial_22_0348_valid :
    mulPoly ep_Q2_020_coefficient_22_0348
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0349 : Poly :=
[
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

/-- Partial product 349 for generator 22. -/
def ep_Q2_020_partial_22_0349 : Poly :=
[
  term ((9595132925458256 : Rat) / 28298395017400811) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(8, 2), (9, 2), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(9, 3), (11, 1), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 22. -/
theorem ep_Q2_020_partial_22_0349_valid :
    mulPoly ep_Q2_020_coefficient_22_0349
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0350 : Poly :=
[
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 350 for generator 22. -/
def ep_Q2_020_partial_22_0350 : Poly :=
[
  term ((-32004224177379840 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 22. -/
theorem ep_Q2_020_partial_22_0350_valid :
    mulPoly ep_Q2_020_coefficient_22_0350
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0351 : Poly :=
[
  term ((817986686653222596 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 22. -/
def ep_Q2_020_partial_22_0351 : Poly :=
[
  term ((1635973373306445192 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-817986686653222596 : Rat) / 28298395017400811) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1635973373306445192 : Rat) / 28298395017400811) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-817986686653222596 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 22. -/
theorem ep_Q2_020_partial_22_0351_valid :
    mulPoly ep_Q2_020_coefficient_22_0351
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0352 : Poly :=
[
  term ((-51966809611800000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 352 for generator 22. -/
def ep_Q2_020_partial_22_0352 : Poly :=
[
  term ((-103933619223600000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((51966809611800000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-103933619223600000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((51966809611800000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 22. -/
theorem ep_Q2_020_partial_22_0352_valid :
    mulPoly ep_Q2_020_coefficient_22_0352
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0353 : Poly :=
[
  term ((-7795021441770000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 353 for generator 22. -/
def ep_Q2_020_partial_22_0353 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 22. -/
theorem ep_Q2_020_partial_22_0353_valid :
    mulPoly ep_Q2_020_coefficient_22_0353
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0354 : Poly :=
[
  term ((411551078708983689 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 354 for generator 22. -/
def ep_Q2_020_partial_22_0354 : Poly :=
[
  term ((823102157417967378 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-411551078708983689 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((823102157417967378 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-411551078708983689 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 22. -/
theorem ep_Q2_020_partial_22_0354_valid :
    mulPoly ep_Q2_020_coefficient_22_0354
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0355 : Poly :=
[
  term ((124149696006002415 : Rat) / 1380409513043942) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 22. -/
def ep_Q2_020_partial_22_0355 : Poly :=
[
  term ((124149696006002415 : Rat) / 690204756521971) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124149696006002415 : Rat) / 1380409513043942) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((124149696006002415 : Rat) / 690204756521971) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-124149696006002415 : Rat) / 1380409513043942) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 22. -/
theorem ep_Q2_020_partial_22_0355_valid :
    mulPoly ep_Q2_020_coefficient_22_0355
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0356 : Poly :=
[
  term ((664312367180556209 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 22. -/
def ep_Q2_020_partial_22_0356 : Poly :=
[
  term ((664312367180556209 : Rat) / 56596790034801622) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-664312367180556209 : Rat) / 113193580069603244) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((664312367180556209 : Rat) / 56596790034801622) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-664312367180556209 : Rat) / 113193580069603244) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 22. -/
theorem ep_Q2_020_partial_22_0356_valid :
    mulPoly ep_Q2_020_coefficient_22_0356
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0357 : Poly :=
[
  term ((-357714797033376 : Rat) / 1230365000756557) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 357 for generator 22. -/
def ep_Q2_020_partial_22_0357 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 22. -/
theorem ep_Q2_020_partial_22_0357_valid :
    mulPoly ep_Q2_020_coefficient_22_0357
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0358 : Poly :=
[
  term ((-294705188331674139 : Rat) / 28298395017400811) [(11, 2), (16, 1)]
]

/-- Partial product 358 for generator 22. -/
def ep_Q2_020_partial_22_0358 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(8, 2), (11, 2), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(9, 1), (11, 3), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 22. -/
theorem ep_Q2_020_partial_22_0358_valid :
    mulPoly ep_Q2_020_coefficient_22_0358
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0359 : Poly :=
[
  term ((724455115577581413 : Rat) / 28298395017400811) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 22. -/
def ep_Q2_020_partial_22_0359 : Poly :=
[
  term ((1448910231155162826 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724455115577581413 : Rat) / 28298395017400811) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1448910231155162826 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724455115577581413 : Rat) / 28298395017400811) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 22. -/
theorem ep_Q2_020_partial_22_0359_valid :
    mulPoly ep_Q2_020_coefficient_22_0359
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0360 : Poly :=
[
  term ((-25050814386426345 : Rat) / 56596790034801622) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 360 for generator 22. -/
def ep_Q2_020_partial_22_0360 : Poly :=
[
  term ((-25050814386426345 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(8, 2), (12, 1), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(9, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 22. -/
theorem ep_Q2_020_partial_22_0360_valid :
    mulPoly ep_Q2_020_coefficient_22_0360
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0361 : Poly :=
[
  term ((3153763242200198829 : Rat) / 226387160139206488) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 361 for generator 22. -/
def ep_Q2_020_partial_22_0361 : Poly :=
[
  term ((3153763242200198829 : Rat) / 113193580069603244) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((3153763242200198829 : Rat) / 113193580069603244) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(9, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 22. -/
theorem ep_Q2_020_partial_22_0361_valid :
    mulPoly ep_Q2_020_coefficient_22_0361
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0362 : Poly :=
[
  term ((-893325140779787937 : Rat) / 56596790034801622) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 362 for generator 22. -/
def ep_Q2_020_partial_22_0362 : Poly :=
[
  term ((-893325140779787937 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(8, 2), (12, 1), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(9, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 22. -/
theorem ep_Q2_020_partial_22_0362_valid :
    mulPoly ep_Q2_020_coefficient_22_0362
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0363 : Poly :=
[
  term ((-504181794758889366 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 363 for generator 22. -/
def ep_Q2_020_partial_22_0363 : Poly :=
[
  term ((-1008363589517778732 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((504181794758889366 : Rat) / 28298395017400811) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1008363589517778732 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((504181794758889366 : Rat) / 28298395017400811) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 22. -/
theorem ep_Q2_020_partial_22_0363_valid :
    mulPoly ep_Q2_020_coefficient_22_0363
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0364 : Poly :=
[
  term ((412722248282909445 : Rat) / 56596790034801622) [(12, 1), (16, 1)]
]

/-- Partial product 364 for generator 22. -/
def ep_Q2_020_partial_22_0364 : Poly :=
[
  term ((412722248282909445 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-412722248282909445 : Rat) / 56596790034801622) [(8, 2), (12, 1), (16, 1)],
  term ((412722248282909445 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-412722248282909445 : Rat) / 56596790034801622) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 22. -/
theorem ep_Q2_020_partial_22_0364_valid :
    mulPoly ep_Q2_020_coefficient_22_0364
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0365 : Poly :=
[
  term ((376269112660858785 : Rat) / 113193580069603244) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 365 for generator 22. -/
def ep_Q2_020_partial_22_0365 : Poly :=
[
  term ((376269112660858785 : Rat) / 56596790034801622) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(8, 2), (12, 2), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 56596790034801622) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(9, 2), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 22. -/
theorem ep_Q2_020_partial_22_0365_valid :
    mulPoly ep_Q2_020_coefficient_22_0365
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0366 : Poly :=
[
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(12, 2), (16, 1)]
]

/-- Partial product 366 for generator 22. -/
def ep_Q2_020_partial_22_0366 : Poly :=
[
  term ((-1439992816278032403 : Rat) / 56596790034801622) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(8, 2), (12, 2), (16, 1)],
  term ((-1439992816278032403 : Rat) / 56596790034801622) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 22. -/
theorem ep_Q2_020_partial_22_0366_valid :
    mulPoly ep_Q2_020_coefficient_22_0366
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0367 : Poly :=
[
  term ((-25050814386426345 : Rat) / 56596790034801622) [(12, 3), (16, 1)]
]

/-- Partial product 367 for generator 22. -/
def ep_Q2_020_partial_22_0367 : Poly :=
[
  term ((-25050814386426345 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 3), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(8, 2), (12, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(9, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 22. -/
theorem ep_Q2_020_partial_22_0367_valid :
    mulPoly ep_Q2_020_coefficient_22_0367
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0368 : Poly :=
[
  term ((-517123535145476205 : Rat) / 56596790034801622) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 368 for generator 22. -/
def ep_Q2_020_partial_22_0368 : Poly :=
[
  term ((-517123535145476205 : Rat) / 28298395017400811) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((517123535145476205 : Rat) / 56596790034801622) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-517123535145476205 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((517123535145476205 : Rat) / 56596790034801622) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 22. -/
theorem ep_Q2_020_partial_22_0368_valid :
    mulPoly ep_Q2_020_coefficient_22_0368
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0369 : Poly :=
[
  term ((409965099710980539 : Rat) / 226387160139206488) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 22. -/
def ep_Q2_020_partial_22_0369 : Poly :=
[
  term ((409965099710980539 : Rat) / 113193580069603244) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-409965099710980539 : Rat) / 226387160139206488) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((409965099710980539 : Rat) / 113193580069603244) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-409965099710980539 : Rat) / 226387160139206488) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 22. -/
theorem ep_Q2_020_partial_22_0369_valid :
    mulPoly ep_Q2_020_coefficient_22_0369
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0370 : Poly :=
[
  term ((422837274669478413 : Rat) / 113193580069603244) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 370 for generator 22. -/
def ep_Q2_020_partial_22_0370 : Poly :=
[
  term ((422837274669478413 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 56596790034801622) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 22. -/
theorem ep_Q2_020_partial_22_0370_valid :
    mulPoly ep_Q2_020_coefficient_22_0370
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0371 : Poly :=
[
  term ((-1522286095274613963 : Rat) / 113193580069603244) [(13, 2), (16, 1)]
]

/-- Partial product 371 for generator 22. -/
def ep_Q2_020_partial_22_0371 : Poly :=
[
  term ((-1522286095274613963 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((1522286095274613963 : Rat) / 113193580069603244) [(8, 2), (13, 2), (16, 1)],
  term ((-1522286095274613963 : Rat) / 56596790034801622) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1522286095274613963 : Rat) / 113193580069603244) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 22. -/
theorem ep_Q2_020_partial_22_0371_valid :
    mulPoly ep_Q2_020_coefficient_22_0371
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0372 : Poly :=
[
  term ((4143529732303272 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 372 for generator 22. -/
def ep_Q2_020_partial_22_0372 : Poly :=
[
  term ((8287059464606544 : Rat) / 1230365000756557) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4143529732303272 : Rat) / 1230365000756557) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((8287059464606544 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4143529732303272 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 22. -/
theorem ep_Q2_020_partial_22_0372_valid :
    mulPoly ep_Q2_020_coefficient_22_0372
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0373 : Poly :=
[
  term ((-770664699223476461 : Rat) / 28298395017400811) [(14, 1), (16, 1)]
]

/-- Partial product 373 for generator 22. -/
def ep_Q2_020_partial_22_0373 : Poly :=
[
  term ((-1541329398446952922 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((770664699223476461 : Rat) / 28298395017400811) [(8, 2), (14, 1), (16, 1)],
  term ((-1541329398446952922 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((770664699223476461 : Rat) / 28298395017400811) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 22. -/
theorem ep_Q2_020_partial_22_0373_valid :
    mulPoly ep_Q2_020_coefficient_22_0373
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0374 : Poly :=
[
  term ((2846158941121467645 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 374 for generator 22. -/
def ep_Q2_020_partial_22_0374 : Poly :=
[
  term ((2846158941121467645 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2846158941121467645 : Rat) / 56596790034801622) [(8, 2), (14, 2), (16, 1)],
  term ((2846158941121467645 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2846158941121467645 : Rat) / 56596790034801622) [(9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 22. -/
theorem ep_Q2_020_partial_22_0374_valid :
    mulPoly ep_Q2_020_coefficient_22_0374
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0375 : Poly :=
[
  term ((846043087895654784 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

/-- Partial product 375 for generator 22. -/
def ep_Q2_020_partial_22_0375 : Poly :=
[
  term ((1692086175791309568 : Rat) / 28298395017400811) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-846043087895654784 : Rat) / 28298395017400811) [(8, 2), (15, 2), (16, 1)],
  term ((1692086175791309568 : Rat) / 28298395017400811) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-846043087895654784 : Rat) / 28298395017400811) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 22. -/
theorem ep_Q2_020_partial_22_0375_valid :
    mulPoly ep_Q2_020_coefficient_22_0375
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0376 : Poly :=
[
  term ((264401512477563649 : Rat) / 113193580069603244) [(16, 1)]
]

/-- Partial product 376 for generator 22. -/
def ep_Q2_020_partial_22_0376 : Poly :=
[
  term ((264401512477563649 : Rat) / 56596790034801622) [(8, 1), (10, 1), (16, 1)],
  term ((-264401512477563649 : Rat) / 113193580069603244) [(8, 2), (16, 1)],
  term ((264401512477563649 : Rat) / 56596790034801622) [(9, 1), (11, 1), (16, 1)],
  term ((-264401512477563649 : Rat) / 113193580069603244) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 22. -/
theorem ep_Q2_020_partial_22_0376_valid :
    mulPoly ep_Q2_020_coefficient_22_0376
        ep_Q2_020_generator_22_0300_0376 =
      ep_Q2_020_partial_22_0376 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_22_0300_0376 : List Poly :=
[
  ep_Q2_020_partial_22_0300,
  ep_Q2_020_partial_22_0301,
  ep_Q2_020_partial_22_0302,
  ep_Q2_020_partial_22_0303,
  ep_Q2_020_partial_22_0304,
  ep_Q2_020_partial_22_0305,
  ep_Q2_020_partial_22_0306,
  ep_Q2_020_partial_22_0307,
  ep_Q2_020_partial_22_0308,
  ep_Q2_020_partial_22_0309,
  ep_Q2_020_partial_22_0310,
  ep_Q2_020_partial_22_0311,
  ep_Q2_020_partial_22_0312,
  ep_Q2_020_partial_22_0313,
  ep_Q2_020_partial_22_0314,
  ep_Q2_020_partial_22_0315,
  ep_Q2_020_partial_22_0316,
  ep_Q2_020_partial_22_0317,
  ep_Q2_020_partial_22_0318,
  ep_Q2_020_partial_22_0319,
  ep_Q2_020_partial_22_0320,
  ep_Q2_020_partial_22_0321,
  ep_Q2_020_partial_22_0322,
  ep_Q2_020_partial_22_0323,
  ep_Q2_020_partial_22_0324,
  ep_Q2_020_partial_22_0325,
  ep_Q2_020_partial_22_0326,
  ep_Q2_020_partial_22_0327,
  ep_Q2_020_partial_22_0328,
  ep_Q2_020_partial_22_0329,
  ep_Q2_020_partial_22_0330,
  ep_Q2_020_partial_22_0331,
  ep_Q2_020_partial_22_0332,
  ep_Q2_020_partial_22_0333,
  ep_Q2_020_partial_22_0334,
  ep_Q2_020_partial_22_0335,
  ep_Q2_020_partial_22_0336,
  ep_Q2_020_partial_22_0337,
  ep_Q2_020_partial_22_0338,
  ep_Q2_020_partial_22_0339,
  ep_Q2_020_partial_22_0340,
  ep_Q2_020_partial_22_0341,
  ep_Q2_020_partial_22_0342,
  ep_Q2_020_partial_22_0343,
  ep_Q2_020_partial_22_0344,
  ep_Q2_020_partial_22_0345,
  ep_Q2_020_partial_22_0346,
  ep_Q2_020_partial_22_0347,
  ep_Q2_020_partial_22_0348,
  ep_Q2_020_partial_22_0349,
  ep_Q2_020_partial_22_0350,
  ep_Q2_020_partial_22_0351,
  ep_Q2_020_partial_22_0352,
  ep_Q2_020_partial_22_0353,
  ep_Q2_020_partial_22_0354,
  ep_Q2_020_partial_22_0355,
  ep_Q2_020_partial_22_0356,
  ep_Q2_020_partial_22_0357,
  ep_Q2_020_partial_22_0358,
  ep_Q2_020_partial_22_0359,
  ep_Q2_020_partial_22_0360,
  ep_Q2_020_partial_22_0361,
  ep_Q2_020_partial_22_0362,
  ep_Q2_020_partial_22_0363,
  ep_Q2_020_partial_22_0364,
  ep_Q2_020_partial_22_0365,
  ep_Q2_020_partial_22_0366,
  ep_Q2_020_partial_22_0367,
  ep_Q2_020_partial_22_0368,
  ep_Q2_020_partial_22_0369,
  ep_Q2_020_partial_22_0370,
  ep_Q2_020_partial_22_0371,
  ep_Q2_020_partial_22_0372,
  ep_Q2_020_partial_22_0373,
  ep_Q2_020_partial_22_0374,
  ep_Q2_020_partial_22_0375,
  ep_Q2_020_partial_22_0376
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_22_0300_0376 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-660009380929949400 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-618370689498301128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((868309149650465745 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((291268203341479032 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((294139672479733422 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((330004690464974700 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((309185344749150564 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-868309149650465745 : Rat) / 56596790034801622) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-145634101670739516 : Rat) / 28298395017400811) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-147069836239866711 : Rat) / 28298395017400811) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-618370689498301128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((868309149650465745 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((291268203341479032 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((294139672479733422 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-660009380929949400 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((330004690464974700 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((309185344749150564 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-868309149650465745 : Rat) / 56596790034801622) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-145634101670739516 : Rat) / 28298395017400811) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-147069836239866711 : Rat) / 28298395017400811) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((238000880394364440 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 2), (16, 1)],
  term ((-116320308840987672 : Rat) / 28298395017400811) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (8, 2), (14, 1), (16, 1)],
  term ((-119000440197182220 : Rat) / 28298395017400811) [(7, 2), (8, 2), (16, 1)],
  term ((58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 3), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((238000880394364440 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((-119000440197182220 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 4), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 3), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 3), (9, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (9, 2), (11, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 3), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((507584456368439801 : Rat) / 56596790034801622) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-506997182881891632 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4280037303797814429 : Rat) / 56596790034801622) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345706636672105404 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17961333071545476 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1497799012746066572 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1786254623283510589 : Rat) / 113193580069603244) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 975806724737959) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-172853318336052702 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((8980666535772738 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-748899506373033286 : Rat) / 28298395017400811) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-29809566419448 : Rat) / 1230365000756557) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (9, 2), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1635973373306445192 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-103933619223600000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((823102157417967378 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((124149696006002415 : Rat) / 690204756521971) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((664312367180556209 : Rat) / 56596790034801622) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((1448910231155162826 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((3153763242200198829 : Rat) / 113193580069603244) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1008363589517778732 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((412722248282909445 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 56596790034801622) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1439992816278032403 : Rat) / 56596790034801622) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 3), (16, 1)],
  term ((-517123535145476205 : Rat) / 28298395017400811) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((409965099710980539 : Rat) / 113193580069603244) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1522286095274613963 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((8287059464606544 : Rat) / 1230365000756557) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1541329398446952922 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((2846158941121467645 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((1692086175791309568 : Rat) / 28298395017400811) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((264401512477563649 : Rat) / 56596790034801622) [(8, 1), (10, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-79487673857569 : Rat) / 2760819026087884) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((253498591440945816 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-67838249180264062 : Rat) / 28298395017400811) [(8, 2), (9, 2), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 975806724737959) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 28298395017400811) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 2), (10, 1), (12, 2), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345706636672105404 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17961333071545476 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1497799012746066572 : Rat) / 28298395017400811) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1786254623283510589 : Rat) / 113193580069603244) [(8, 2), (10, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-817986686653222596 : Rat) / 28298395017400811) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((51966809611800000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-411551078708983689 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-124149696006002415 : Rat) / 1380409513043942) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-664312367180556209 : Rat) / 113193580069603244) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(8, 2), (11, 2), (16, 1)],
  term ((-724455115577581413 : Rat) / 28298395017400811) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(8, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(8, 2), (12, 1), (14, 2), (16, 1)],
  term ((504181794758889366 : Rat) / 28298395017400811) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-412722248282909445 : Rat) / 56596790034801622) [(8, 2), (12, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(8, 2), (12, 2), (14, 1), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(8, 2), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(8, 2), (12, 3), (16, 1)],
  term ((517123535145476205 : Rat) / 56596790034801622) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-409965099710980539 : Rat) / 226387160139206488) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((1522286095274613963 : Rat) / 113193580069603244) [(8, 2), (13, 2), (16, 1)],
  term ((-4143529732303272 : Rat) / 1230365000756557) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((770664699223476461 : Rat) / 28298395017400811) [(8, 2), (14, 1), (16, 1)],
  term ((-2846158941121467645 : Rat) / 56596790034801622) [(8, 2), (14, 2), (16, 1)],
  term ((-846043087895654784 : Rat) / 28298395017400811) [(8, 2), (15, 2), (16, 1)],
  term ((-264401512477563649 : Rat) / 113193580069603244) [(8, 2), (16, 1)],
  term ((126081365435069868 : Rat) / 28298395017400811) [(8, 3), (10, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 3), (12, 1), (14, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 3), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 3), (12, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-172853318336052702 : Rat) / 28298395017400811) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((8980666535772738 : Rat) / 28298395017400811) [(8, 3), (13, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 3), (14, 1), (15, 2), (16, 1)],
  term ((-748899506373033286 : Rat) / 28298395017400811) [(8, 3), (14, 1), (16, 1)],
  term ((-29809566419448 : Rat) / 1230365000756557) [(8, 3), (15, 2), (16, 1)],
  term ((1786254623283510589 : Rat) / 226387160139206488) [(8, 3), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(8, 4), (16, 1)],
  term ((1448910231155162826 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((3153763242200198829 : Rat) / 113193580069603244) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1008363589517778732 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((412722248282909445 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 56596790034801622) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1439992816278032403 : Rat) / 56596790034801622) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((-517123535145476205 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((409965099710980539 : Rat) / 113193580069603244) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 56596790034801622) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1522286095274613963 : Rat) / 56596790034801622) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((8287059464606544 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1541329398446952922 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2846158941121467645 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((1692086175791309568 : Rat) / 28298395017400811) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((264401512477563649 : Rat) / 56596790034801622) [(9, 1), (11, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((1635973373306445192 : Rat) / 28298395017400811) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-103933619223600000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((823102157417967378 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((124149696006002415 : Rat) / 690204756521971) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((664312367180556209 : Rat) / 56596790034801622) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(9, 1), (11, 3), (16, 1)],
  term ((777243795578027100 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1427546672116576596 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((58462660813275000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18188383364130000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-918548261590875321 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-5076425135693152935 : Rat) / 56596790034801622) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7895762240415072649 : Rat) / 113193580069603244) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-834667859744544 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((1096994833031788079 : Rat) / 56596790034801622) [(9, 2), (11, 2), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 2), (11, 3), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((-724455115577581413 : Rat) / 28298395017400811) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(9, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((504181794758889366 : Rat) / 28298395017400811) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-412722248282909445 : Rat) / 56596790034801622) [(9, 2), (12, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(9, 2), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(9, 2), (12, 3), (16, 1)],
  term ((517123535145476205 : Rat) / 56596790034801622) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-409965099710980539 : Rat) / 226387160139206488) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((1522286095274613963 : Rat) / 113193580069603244) [(9, 2), (13, 2), (16, 1)],
  term ((-4143529732303272 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((770664699223476461 : Rat) / 28298395017400811) [(9, 2), (14, 1), (16, 1)],
  term ((-2846158941121467645 : Rat) / 56596790034801622) [(9, 2), (14, 2), (16, 1)],
  term ((-846043087895654784 : Rat) / 28298395017400811) [(9, 2), (15, 2), (16, 1)],
  term ((-264401512477563649 : Rat) / 113193580069603244) [(9, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-469203924666606777 : Rat) / 113193580069603244) [(9, 3), (11, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(9, 3), (12, 1), (13, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((253498591440945816 : Rat) / 28298395017400811) [(9, 3), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(9, 3), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 3), (15, 3), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 300 through 376. -/
theorem ep_Q2_020_block_22_0300_0376_valid :
    checkProductSumEq ep_Q2_020_partials_22_0300_0376
      ep_Q2_020_block_22_0300_0376 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
