/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 3:300-376

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_03_0300_0376 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0300 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 300 for generator 3. -/
def ep_Q2_020_partial_03_0300 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 3. -/
theorem ep_Q2_020_partial_03_0300_valid :
    mulPoly ep_Q2_020_coefficient_03_0300
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0301 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 3. -/
def ep_Q2_020_partial_03_0301 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 3. -/
theorem ep_Q2_020_partial_03_0301_valid :
    mulPoly ep_Q2_020_coefficient_03_0301
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0302 : Poly :=
[
  term ((-362068826687141490 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 302 for generator 3. -/
def ep_Q2_020_partial_03_0302 : Poly :=
[
  term ((-362068826687141490 : Rat) / 28298395017400811) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-362068826687141490 : Rat) / 28298395017400811) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((362068826687141490 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((362068826687141490 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 3. -/
theorem ep_Q2_020_partial_03_0302_valid :
    mulPoly ep_Q2_020_coefficient_03_0302
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0303 : Poly :=
[
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 303 for generator 3. -/
def ep_Q2_020_partial_03_0303 : Poly :=
[
  term ((-21436308964867500 : Rat) / 28298395017400811) [(2, 2), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(3, 2), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 3. -/
theorem ep_Q2_020_partial_03_0303_valid :
    mulPoly ep_Q2_020_coefficient_03_0303
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0304 : Poly :=
[
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 3. -/
def ep_Q2_020_partial_03_0304 : Poly :=
[
  term ((-983715691841784 : Rat) / 1230365000756557) [(2, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(3, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 3. -/
theorem ep_Q2_020_partial_03_0304_valid :
    mulPoly ep_Q2_020_coefficient_03_0304
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0305 : Poly :=
[
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 3. -/
def ep_Q2_020_partial_03_0305 : Poly :=
[
  term ((-1746679789583532 : Rat) / 28298395017400811) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 3. -/
theorem ep_Q2_020_partial_03_0305_valid :
    mulPoly ep_Q2_020_coefficient_03_0305
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0306 : Poly :=
[
  term ((7699541364649404 : Rat) / 690204756521971) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 306 for generator 3. -/
def ep_Q2_020_partial_03_0306 : Poly :=
[
  term ((7699541364649404 : Rat) / 690204756521971) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((7699541364649404 : Rat) / 690204756521971) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7699541364649404 : Rat) / 690204756521971) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7699541364649404 : Rat) / 690204756521971) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 3. -/
theorem ep_Q2_020_partial_03_0306_valid :
    mulPoly ep_Q2_020_coefficient_03_0306
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0307 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 307 for generator 3. -/
def ep_Q2_020_partial_03_0307 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 3. -/
theorem ep_Q2_020_partial_03_0307_valid :
    mulPoly ep_Q2_020_coefficient_03_0307
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0308 : Poly :=
[
  term ((-578829561118097205 : Rat) / 56596790034801622) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 308 for generator 3. -/
def ep_Q2_020_partial_03_0308 : Poly :=
[
  term ((-578829561118097205 : Rat) / 56596790034801622) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-578829561118097205 : Rat) / 56596790034801622) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((578829561118097205 : Rat) / 56596790034801622) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((578829561118097205 : Rat) / 56596790034801622) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 3. -/
theorem ep_Q2_020_partial_03_0308_valid :
    mulPoly ep_Q2_020_coefficient_03_0308
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0309 : Poly :=
[
  term ((-138777901394266476 : Rat) / 28298395017400811) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 3. -/
def ep_Q2_020_partial_03_0309 : Poly :=
[
  term ((-138777901394266476 : Rat) / 28298395017400811) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-138777901394266476 : Rat) / 28298395017400811) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((138777901394266476 : Rat) / 28298395017400811) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((138777901394266476 : Rat) / 28298395017400811) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 3. -/
theorem ep_Q2_020_partial_03_0309_valid :
    mulPoly ep_Q2_020_coefficient_03_0309
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0310 : Poly :=
[
  term ((723478579784067726 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 3. -/
def ep_Q2_020_partial_03_0310 : Poly :=
[
  term ((723478579784067726 : Rat) / 28298395017400811) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((723478579784067726 : Rat) / 28298395017400811) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-723478579784067726 : Rat) / 28298395017400811) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-723478579784067726 : Rat) / 28298395017400811) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 3. -/
theorem ep_Q2_020_partial_03_0310_valid :
    mulPoly ep_Q2_020_coefficient_03_0310
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0311 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 311 for generator 3. -/
def ep_Q2_020_partial_03_0311 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 3. -/
theorem ep_Q2_020_partial_03_0311_valid :
    mulPoly ep_Q2_020_coefficient_03_0311
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0312 : Poly :=
[
  term ((58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 312 for generator 3. -/
def ep_Q2_020_partial_03_0312 : Poly :=
[
  term ((58160154420493836 : Rat) / 28298395017400811) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((58160154420493836 : Rat) / 28298395017400811) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 3. -/
theorem ep_Q2_020_partial_03_0312_valid :
    mulPoly ep_Q2_020_coefficient_03_0312
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0313 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 313 for generator 3. -/
def ep_Q2_020_partial_03_0313 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(2, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(3, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 3. -/
theorem ep_Q2_020_partial_03_0313_valid :
    mulPoly ep_Q2_020_coefficient_03_0313
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0314 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 3. -/
def ep_Q2_020_partial_03_0314 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 3. -/
theorem ep_Q2_020_partial_03_0314_valid :
    mulPoly ep_Q2_020_coefficient_03_0314
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0315 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 315 for generator 3. -/
def ep_Q2_020_partial_03_0315 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(2, 2), (7, 2), (9, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(3, 2), (7, 2), (9, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 3. -/
theorem ep_Q2_020_partial_03_0315_valid :
    mulPoly ep_Q2_020_coefficient_03_0315
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0316 : Poly :=
[
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 316 for generator 3. -/
def ep_Q2_020_partial_03_0316 : Poly :=
[
  term ((-4133278580342544 : Rat) / 28298395017400811) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 3. -/
theorem ep_Q2_020_partial_03_0316_valid :
    mulPoly ep_Q2_020_coefficient_03_0316
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0317 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 317 for generator 3. -/
def ep_Q2_020_partial_03_0317 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(3, 2), (7, 2), (14, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (8, 2), (14, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 3. -/
theorem ep_Q2_020_partial_03_0317_valid :
    mulPoly ep_Q2_020_coefficient_03_0317
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0318 : Poly :=
[
  term ((-165632231768795946 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 318 for generator 3. -/
def ep_Q2_020_partial_03_0318 : Poly :=
[
  term ((-165632231768795946 : Rat) / 28298395017400811) [(2, 2), (7, 2), (16, 1)],
  term ((-165632231768795946 : Rat) / 28298395017400811) [(3, 2), (7, 2), (16, 1)],
  term ((165632231768795946 : Rat) / 28298395017400811) [(7, 2), (8, 2), (16, 1)],
  term ((165632231768795946 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 3. -/
theorem ep_Q2_020_partial_03_0318_valid :
    mulPoly ep_Q2_020_coefficient_03_0318
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0319 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 319 for generator 3. -/
def ep_Q2_020_partial_03_0319 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(2, 2), (7, 3), (8, 1), (9, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(3, 2), (7, 3), (8, 1), (9, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 3), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 3. -/
theorem ep_Q2_020_partial_03_0319_valid :
    mulPoly ep_Q2_020_coefficient_03_0319
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0320 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(7, 3), (9, 1), (16, 1)]
]

/-- Partial product 320 for generator 3. -/
def ep_Q2_020_partial_03_0320 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(2, 2), (7, 3), (9, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(3, 2), (7, 3), (9, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 3. -/
theorem ep_Q2_020_partial_03_0320_valid :
    mulPoly ep_Q2_020_coefficient_03_0320
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0321 : Poly :=
[
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 321 for generator 3. -/
def ep_Q2_020_partial_03_0321 : Poly :=
[
  term ((14290872643245000 : Rat) / 28298395017400811) [(2, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(3, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 3. -/
theorem ep_Q2_020_partial_03_0321_valid :
    mulPoly ep_Q2_020_coefficient_03_0321
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0322 : Poly :=
[
  term ((-1948755360442500 : Rat) / 975806724737959) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 322 for generator 3. -/
def ep_Q2_020_partial_03_0322 : Poly :=
[
  term ((-1948755360442500 : Rat) / 975806724737959) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 3. -/
theorem ep_Q2_020_partial_03_0322_valid :
    mulPoly ep_Q2_020_coefficient_03_0322
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0323 : Poly :=
[
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 3. -/
def ep_Q2_020_partial_03_0323 : Poly :=
[
  term ((655810461227856 : Rat) / 1230365000756557) [(2, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 3. -/
theorem ep_Q2_020_partial_03_0323_valid :
    mulPoly ep_Q2_020_coefficient_03_0323
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0324 : Poly :=
[
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 3. -/
def ep_Q2_020_partial_03_0324 : Poly :=
[
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 3. -/
theorem ep_Q2_020_partial_03_0324_valid :
    mulPoly ep_Q2_020_coefficient_03_0324
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0325 : Poly :=
[
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 325 for generator 3. -/
def ep_Q2_020_partial_03_0325 : Poly :=
[
  term ((132576259515771798 : Rat) / 28298395017400811) [(2, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 3. -/
theorem ep_Q2_020_partial_03_0325_valid :
    mulPoly ep_Q2_020_coefficient_03_0325
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0326 : Poly :=
[
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 326 for generator 3. -/
def ep_Q2_020_partial_03_0326 : Poly :=
[
  term ((36692854888581252 : Rat) / 28298395017400811) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 3. -/
theorem ep_Q2_020_partial_03_0326_valid :
    mulPoly ep_Q2_020_coefficient_03_0326
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0327 : Poly :=
[
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 2), (16, 1)]
]

/-- Partial product 327 for generator 3. -/
def ep_Q2_020_partial_03_0327 : Poly :=
[
  term ((-6745411801148508 : Rat) / 975806724737959) [(2, 2), (8, 1), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(3, 2), (8, 1), (12, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 3. -/
theorem ep_Q2_020_partial_03_0327_valid :
    mulPoly ep_Q2_020_coefficient_03_0327
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0328 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 3. -/
def ep_Q2_020_partial_03_0328 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(2, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 3. -/
theorem ep_Q2_020_partial_03_0328_valid :
    mulPoly ep_Q2_020_coefficient_03_0328
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0329 : Poly :=
[
  term ((-172853318336052702 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 3. -/
def ep_Q2_020_partial_03_0329 : Poly :=
[
  term ((-172853318336052702 : Rat) / 28298395017400811) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-172853318336052702 : Rat) / 28298395017400811) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 3. -/
theorem ep_Q2_020_partial_03_0329_valid :
    mulPoly ep_Q2_020_coefficient_03_0329
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0330 : Poly :=
[
  term ((8980666535772738 : Rat) / 28298395017400811) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 330 for generator 3. -/
def ep_Q2_020_partial_03_0330 : Poly :=
[
  term ((8980666535772738 : Rat) / 28298395017400811) [(2, 2), (8, 1), (13, 2), (16, 1)],
  term ((8980666535772738 : Rat) / 28298395017400811) [(3, 2), (8, 1), (13, 2), (16, 1)],
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 3. -/
theorem ep_Q2_020_partial_03_0330_valid :
    mulPoly ep_Q2_020_coefficient_03_0330
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0331 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 3. -/
def ep_Q2_020_partial_03_0331 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(2, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 3. -/
theorem ep_Q2_020_partial_03_0331_valid :
    mulPoly ep_Q2_020_coefficient_03_0331
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0332 : Poly :=
[
  term ((-748899506373033286 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 332 for generator 3. -/
def ep_Q2_020_partial_03_0332 : Poly :=
[
  term ((-748899506373033286 : Rat) / 28298395017400811) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((-748899506373033286 : Rat) / 28298395017400811) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 3. -/
theorem ep_Q2_020_partial_03_0332_valid :
    mulPoly ep_Q2_020_coefficient_03_0332
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0333 : Poly :=
[
  term ((-29809566419448 : Rat) / 1230365000756557) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 3. -/
def ep_Q2_020_partial_03_0333 : Poly :=
[
  term ((-29809566419448 : Rat) / 1230365000756557) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-29809566419448 : Rat) / 1230365000756557) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 3. -/
theorem ep_Q2_020_partial_03_0333_valid :
    mulPoly ep_Q2_020_coefficient_03_0333
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0334 : Poly :=
[
  term ((1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (16, 1)]
]

/-- Partial product 334 for generator 3. -/
def ep_Q2_020_partial_03_0334 : Poly :=
[
  term ((1786254623283510589 : Rat) / 226387160139206488) [(2, 2), (8, 1), (16, 1)],
  term ((1786254623283510589 : Rat) / 226387160139206488) [(3, 2), (8, 1), (16, 1)],
  term ((-1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (9, 2), (16, 1)],
  term ((-1786254623283510589 : Rat) / 226387160139206488) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 3. -/
theorem ep_Q2_020_partial_03_0334_valid :
    mulPoly ep_Q2_020_coefficient_03_0334
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0335 : Poly :=
[
  term ((-63040682717534934 : Rat) / 28298395017400811) [(8, 2), (16, 1)]
]

/-- Partial product 335 for generator 3. -/
def ep_Q2_020_partial_03_0335 : Poly :=
[
  term ((-63040682717534934 : Rat) / 28298395017400811) [(2, 2), (8, 2), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(3, 2), (8, 2), (16, 1)],
  term ((63040682717534934 : Rat) / 28298395017400811) [(8, 2), (9, 2), (16, 1)],
  term ((63040682717534934 : Rat) / 28298395017400811) [(8, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 3. -/
theorem ep_Q2_020_partial_03_0335_valid :
    mulPoly ep_Q2_020_coefficient_03_0335
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0336 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 3. -/
def ep_Q2_020_partial_03_0336 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 3. -/
theorem ep_Q2_020_partial_03_0336_valid :
    mulPoly ep_Q2_020_coefficient_03_0336
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0337 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 3. -/
def ep_Q2_020_partial_03_0337 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 3. -/
theorem ep_Q2_020_partial_03_0337_valid :
    mulPoly ep_Q2_020_coefficient_03_0337
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0338 : Poly :=
[
  term ((-507584456368439801 : Rat) / 113193580069603244) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 338 for generator 3. -/
def ep_Q2_020_partial_03_0338 : Poly :=
[
  term ((-507584456368439801 : Rat) / 113193580069603244) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-507584456368439801 : Rat) / 113193580069603244) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((507584456368439801 : Rat) / 113193580069603244) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((507584456368439801 : Rat) / 113193580069603244) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 3. -/
theorem ep_Q2_020_partial_03_0338_valid :
    mulPoly ep_Q2_020_coefficient_03_0338
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0339 : Poly :=
[
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 339 for generator 3. -/
def ep_Q2_020_partial_03_0339 : Poly :=
[
  term ((7145436321622500 : Rat) / 28298395017400811) [(2, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(3, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7145436321622500 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7145436321622500 : Rat) / 28298395017400811) [(9, 3), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 3. -/
theorem ep_Q2_020_partial_03_0339_valid :
    mulPoly ep_Q2_020_coefficient_03_0339
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0340 : Poly :=
[
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 3. -/
def ep_Q2_020_partial_03_0340 : Poly :=
[
  term ((327905230613928 : Rat) / 1230365000756557) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-327905230613928 : Rat) / 1230365000756557) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-327905230613928 : Rat) / 1230365000756557) [(9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 3. -/
theorem ep_Q2_020_partial_03_0340_valid :
    mulPoly ep_Q2_020_coefficient_03_0340
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0341 : Poly :=
[
  term ((-204597608769079470 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 341 for generator 3. -/
def ep_Q2_020_partial_03_0341 : Poly :=
[
  term ((-204597608769079470 : Rat) / 28298395017400811) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 3. -/
theorem ep_Q2_020_partial_03_0341_valid :
    mulPoly ep_Q2_020_coefficient_03_0341
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0342 : Poly :=
[
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 3. -/
def ep_Q2_020_partial_03_0342 : Poly :=
[
  term ((304779992731677000 : Rat) / 28298395017400811) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 3. -/
theorem ep_Q2_020_partial_03_0342_valid :
    mulPoly ep_Q2_020_coefficient_03_0342
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0343 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 343 for generator 3. -/
def ep_Q2_020_partial_03_0343 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 3. -/
theorem ep_Q2_020_partial_03_0343_valid :
    mulPoly ep_Q2_020_coefficient_03_0343
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0344 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 344 for generator 3. -/
def ep_Q2_020_partial_03_0344 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 3. -/
theorem ep_Q2_020_partial_03_0344_valid :
    mulPoly ep_Q2_020_coefficient_03_0344
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0345 : Poly :=
[
  term ((253498591440945816 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 345 for generator 3. -/
def ep_Q2_020_partial_03_0345 : Poly :=
[
  term ((253498591440945816 : Rat) / 28298395017400811) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((253498591440945816 : Rat) / 28298395017400811) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-253498591440945816 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-253498591440945816 : Rat) / 28298395017400811) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 3. -/
theorem ep_Q2_020_partial_03_0345_valid :
    mulPoly ep_Q2_020_coefficient_03_0345
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0346 : Poly :=
[
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 3. -/
def ep_Q2_020_partial_03_0346 : Poly :=
[
  term ((-149047832097240 : Rat) / 1230365000756557) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 3. -/
theorem ep_Q2_020_partial_03_0346_valid :
    mulPoly ep_Q2_020_coefficient_03_0346
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0347 : Poly :=
[
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 3. -/
def ep_Q2_020_partial_03_0347 : Poly :=
[
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((4280037303797814429 : Rat) / 113193580069603244) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((4280037303797814429 : Rat) / 113193580069603244) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 3. -/
theorem ep_Q2_020_partial_03_0347_valid :
    mulPoly ep_Q2_020_coefficient_03_0347
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0348 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 348 for generator 3. -/
def ep_Q2_020_partial_03_0348 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 3. -/
theorem ep_Q2_020_partial_03_0348_valid :
    mulPoly ep_Q2_020_coefficient_03_0348
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0349 : Poly :=
[
  term ((-4797566462729128 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

/-- Partial product 349 for generator 3. -/
def ep_Q2_020_partial_03_0349 : Poly :=
[
  term ((-4797566462729128 : Rat) / 28298395017400811) [(2, 2), (9, 2), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(3, 2), (9, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(8, 2), (9, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 3. -/
theorem ep_Q2_020_partial_03_0349_valid :
    mulPoly ep_Q2_020_coefficient_03_0349
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0350 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 350 for generator 3. -/
def ep_Q2_020_partial_03_0350 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 3. -/
theorem ep_Q2_020_partial_03_0350_valid :
    mulPoly ep_Q2_020_coefficient_03_0350
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0351 : Poly :=
[
  term ((-817986686653222596 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 3. -/
def ep_Q2_020_partial_03_0351 : Poly :=
[
  term ((-817986686653222596 : Rat) / 28298395017400811) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-817986686653222596 : Rat) / 28298395017400811) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((817986686653222596 : Rat) / 28298395017400811) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((817986686653222596 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 3. -/
theorem ep_Q2_020_partial_03_0351_valid :
    mulPoly ep_Q2_020_coefficient_03_0351
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0352 : Poly :=
[
  term ((-19487553604425000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 352 for generator 3. -/
def ep_Q2_020_partial_03_0352 : Poly :=
[
  term ((-19487553604425000 : Rat) / 28298395017400811) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 3. -/
theorem ep_Q2_020_partial_03_0352_valid :
    mulPoly ep_Q2_020_coefficient_03_0352
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0353 : Poly :=
[
  term ((7795021441770000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 353 for generator 3. -/
def ep_Q2_020_partial_03_0353 : Poly :=
[
  term ((7795021441770000 : Rat) / 28298395017400811) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 3. -/
theorem ep_Q2_020_partial_03_0353_valid :
    mulPoly ep_Q2_020_coefficient_03_0353
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0354 : Poly :=
[
  term ((-298523267803318689 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 354 for generator 3. -/
def ep_Q2_020_partial_03_0354 : Poly :=
[
  term ((-298523267803318689 : Rat) / 28298395017400811) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-298523267803318689 : Rat) / 28298395017400811) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((298523267803318689 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((298523267803318689 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 3. -/
theorem ep_Q2_020_partial_03_0354_valid :
    mulPoly ep_Q2_020_coefficient_03_0354
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0355 : Poly :=
[
  term ((-4943653566448249737 : Rat) / 28298395017400811) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 3. -/
def ep_Q2_020_partial_03_0355 : Poly :=
[
  term ((-4943653566448249737 : Rat) / 28298395017400811) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4943653566448249737 : Rat) / 28298395017400811) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4943653566448249737 : Rat) / 28298395017400811) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4943653566448249737 : Rat) / 28298395017400811) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 3. -/
theorem ep_Q2_020_partial_03_0355_valid :
    mulPoly ep_Q2_020_coefficient_03_0355
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0356 : Poly :=
[
  term ((17257591360360284715 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 3. -/
def ep_Q2_020_partial_03_0356 : Poly :=
[
  term ((17257591360360284715 : Rat) / 113193580069603244) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((17257591360360284715 : Rat) / 113193580069603244) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17257591360360284715 : Rat) / 113193580069603244) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17257591360360284715 : Rat) / 113193580069603244) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 3. -/
theorem ep_Q2_020_partial_03_0356_valid :
    mulPoly ep_Q2_020_coefficient_03_0356
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0357 : Poly :=
[
  term ((357714797033376 : Rat) / 1230365000756557) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 357 for generator 3. -/
def ep_Q2_020_partial_03_0357 : Poly :=
[
  term ((357714797033376 : Rat) / 1230365000756557) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 3. -/
theorem ep_Q2_020_partial_03_0357_valid :
    mulPoly ep_Q2_020_coefficient_03_0357
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0358 : Poly :=
[
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (16, 1)]
]

/-- Partial product 358 for generator 3. -/
def ep_Q2_020_partial_03_0358 : Poly :=
[
  term ((294705188331674139 : Rat) / 28298395017400811) [(2, 2), (11, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(3, 2), (11, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(8, 2), (11, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 3. -/
theorem ep_Q2_020_partial_03_0358_valid :
    mulPoly ep_Q2_020_coefficient_03_0358
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0359 : Poly :=
[
  term ((-724455115577581413 : Rat) / 28298395017400811) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 3. -/
def ep_Q2_020_partial_03_0359 : Poly :=
[
  term ((-724455115577581413 : Rat) / 28298395017400811) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724455115577581413 : Rat) / 28298395017400811) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((724455115577581413 : Rat) / 28298395017400811) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((724455115577581413 : Rat) / 28298395017400811) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 3. -/
theorem ep_Q2_020_partial_03_0359_valid :
    mulPoly ep_Q2_020_coefficient_03_0359
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0360 : Poly :=
[
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 360 for generator 3. -/
def ep_Q2_020_partial_03_0360 : Poly :=
[
  term ((25050814386426345 : Rat) / 56596790034801622) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(8, 2), (12, 1), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(9, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 3. -/
theorem ep_Q2_020_partial_03_0360_valid :
    mulPoly ep_Q2_020_coefficient_03_0360
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0361 : Poly :=
[
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 361 for generator 3. -/
def ep_Q2_020_partial_03_0361 : Poly :=
[
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((3153763242200198829 : Rat) / 226387160139206488) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((3153763242200198829 : Rat) / 226387160139206488) [(9, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 3. -/
theorem ep_Q2_020_partial_03_0361_valid :
    mulPoly ep_Q2_020_coefficient_03_0361
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0362 : Poly :=
[
  term ((893325140779787937 : Rat) / 56596790034801622) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 362 for generator 3. -/
def ep_Q2_020_partial_03_0362 : Poly :=
[
  term ((893325140779787937 : Rat) / 56596790034801622) [(2, 2), (12, 1), (14, 2), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(3, 2), (12, 1), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(8, 2), (12, 1), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(9, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 3. -/
theorem ep_Q2_020_partial_03_0362_valid :
    mulPoly ep_Q2_020_coefficient_03_0362
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0363 : Poly :=
[
  term ((504181794758889366 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 363 for generator 3. -/
def ep_Q2_020_partial_03_0363 : Poly :=
[
  term ((504181794758889366 : Rat) / 28298395017400811) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((504181794758889366 : Rat) / 28298395017400811) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-504181794758889366 : Rat) / 28298395017400811) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-504181794758889366 : Rat) / 28298395017400811) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 3. -/
theorem ep_Q2_020_partial_03_0363_valid :
    mulPoly ep_Q2_020_coefficient_03_0363
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0364 : Poly :=
[
  term ((-23112364444619553 : Rat) / 56596790034801622) [(12, 1), (16, 1)]
]

/-- Partial product 364 for generator 3. -/
def ep_Q2_020_partial_03_0364 : Poly :=
[
  term ((-23112364444619553 : Rat) / 56596790034801622) [(2, 2), (12, 1), (16, 1)],
  term ((-23112364444619553 : Rat) / 56596790034801622) [(3, 2), (12, 1), (16, 1)],
  term ((23112364444619553 : Rat) / 56596790034801622) [(8, 2), (12, 1), (16, 1)],
  term ((23112364444619553 : Rat) / 56596790034801622) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 3. -/
theorem ep_Q2_020_partial_03_0364_valid :
    mulPoly ep_Q2_020_coefficient_03_0364
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0365 : Poly :=
[
  term ((-376269112660858785 : Rat) / 113193580069603244) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 365 for generator 3. -/
def ep_Q2_020_partial_03_0365 : Poly :=
[
  term ((-376269112660858785 : Rat) / 113193580069603244) [(2, 2), (12, 2), (14, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(3, 2), (12, 2), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(8, 2), (12, 2), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(9, 2), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 3. -/
theorem ep_Q2_020_partial_03_0365_valid :
    mulPoly ep_Q2_020_coefficient_03_0365
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0366 : Poly :=
[
  term ((1439992816278032403 : Rat) / 113193580069603244) [(12, 2), (16, 1)]
]

/-- Partial product 366 for generator 3. -/
def ep_Q2_020_partial_03_0366 : Poly :=
[
  term ((1439992816278032403 : Rat) / 113193580069603244) [(2, 2), (12, 2), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(3, 2), (12, 2), (16, 1)],
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(8, 2), (12, 2), (16, 1)],
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 3. -/
theorem ep_Q2_020_partial_03_0366_valid :
    mulPoly ep_Q2_020_coefficient_03_0366
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0367 : Poly :=
[
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 3), (16, 1)]
]

/-- Partial product 367 for generator 3. -/
def ep_Q2_020_partial_03_0367 : Poly :=
[
  term ((25050814386426345 : Rat) / 56596790034801622) [(2, 2), (12, 3), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(3, 2), (12, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(8, 2), (12, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(9, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 3. -/
theorem ep_Q2_020_partial_03_0367_valid :
    mulPoly ep_Q2_020_coefficient_03_0367
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0368 : Poly :=
[
  term ((569090344757276205 : Rat) / 56596790034801622) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 368 for generator 3. -/
def ep_Q2_020_partial_03_0368 : Poly :=
[
  term ((569090344757276205 : Rat) / 56596790034801622) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((569090344757276205 : Rat) / 56596790034801622) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-569090344757276205 : Rat) / 56596790034801622) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-569090344757276205 : Rat) / 56596790034801622) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 3. -/
theorem ep_Q2_020_partial_03_0368_valid :
    mulPoly ep_Q2_020_coefficient_03_0368
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0369 : Poly :=
[
  term ((5120304761254964661 : Rat) / 226387160139206488) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 3. -/
def ep_Q2_020_partial_03_0369 : Poly :=
[
  term ((5120304761254964661 : Rat) / 226387160139206488) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((5120304761254964661 : Rat) / 226387160139206488) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5120304761254964661 : Rat) / 226387160139206488) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5120304761254964661 : Rat) / 226387160139206488) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 3. -/
theorem ep_Q2_020_partial_03_0369_valid :
    mulPoly ep_Q2_020_coefficient_03_0369
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0370 : Poly :=
[
  term ((-422837274669478413 : Rat) / 113193580069603244) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 370 for generator 3. -/
def ep_Q2_020_partial_03_0370 : Poly :=
[
  term ((-422837274669478413 : Rat) / 113193580069603244) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(3, 2), (13, 2), (14, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 113193580069603244) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 113193580069603244) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 3. -/
theorem ep_Q2_020_partial_03_0370_valid :
    mulPoly ep_Q2_020_coefficient_03_0370
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0371 : Poly :=
[
  term ((-534979022340165237 : Rat) / 113193580069603244) [(13, 2), (16, 1)]
]

/-- Partial product 371 for generator 3. -/
def ep_Q2_020_partial_03_0371 : Poly :=
[
  term ((-534979022340165237 : Rat) / 113193580069603244) [(2, 2), (13, 2), (16, 1)],
  term ((-534979022340165237 : Rat) / 113193580069603244) [(3, 2), (13, 2), (16, 1)],
  term ((534979022340165237 : Rat) / 113193580069603244) [(8, 2), (13, 2), (16, 1)],
  term ((534979022340165237 : Rat) / 113193580069603244) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 3. -/
theorem ep_Q2_020_partial_03_0371_valid :
    mulPoly ep_Q2_020_coefficient_03_0371
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0372 : Poly :=
[
  term ((-2951147075525352 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 372 for generator 3. -/
def ep_Q2_020_partial_03_0372 : Poly :=
[
  term ((-2951147075525352 : Rat) / 1230365000756557) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2951147075525352 : Rat) / 1230365000756557) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((2951147075525352 : Rat) / 1230365000756557) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((2951147075525352 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 3. -/
theorem ep_Q2_020_partial_03_0372_valid :
    mulPoly ep_Q2_020_coefficient_03_0372
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0373 : Poly :=
[
  term ((4380476978646617747 : Rat) / 56596790034801622) [(14, 1), (16, 1)]
]

/-- Partial product 373 for generator 3. -/
def ep_Q2_020_partial_03_0373 : Poly :=
[
  term ((4380476978646617747 : Rat) / 56596790034801622) [(2, 2), (14, 1), (16, 1)],
  term ((4380476978646617747 : Rat) / 56596790034801622) [(3, 2), (14, 1), (16, 1)],
  term ((-4380476978646617747 : Rat) / 56596790034801622) [(8, 2), (14, 1), (16, 1)],
  term ((-4380476978646617747 : Rat) / 56596790034801622) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 3. -/
theorem ep_Q2_020_partial_03_0373_valid :
    mulPoly ep_Q2_020_coefficient_03_0373
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0374 : Poly :=
[
  term ((-4928003181080834913 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 374 for generator 3. -/
def ep_Q2_020_partial_03_0374 : Poly :=
[
  term ((-4928003181080834913 : Rat) / 56596790034801622) [(2, 2), (14, 2), (16, 1)],
  term ((-4928003181080834913 : Rat) / 56596790034801622) [(3, 2), (14, 2), (16, 1)],
  term ((4928003181080834913 : Rat) / 56596790034801622) [(8, 2), (14, 2), (16, 1)],
  term ((4928003181080834913 : Rat) / 56596790034801622) [(9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 3. -/
theorem ep_Q2_020_partial_03_0374_valid :
    mulPoly ep_Q2_020_coefficient_03_0374
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0375 : Poly :=
[
  term ((-4187551167825502623 : Rat) / 113193580069603244) [(15, 2), (16, 1)]
]

/-- Partial product 375 for generator 3. -/
def ep_Q2_020_partial_03_0375 : Poly :=
[
  term ((-4187551167825502623 : Rat) / 113193580069603244) [(2, 2), (15, 2), (16, 1)],
  term ((-4187551167825502623 : Rat) / 113193580069603244) [(3, 2), (15, 2), (16, 1)],
  term ((4187551167825502623 : Rat) / 113193580069603244) [(8, 2), (15, 2), (16, 1)],
  term ((4187551167825502623 : Rat) / 113193580069603244) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 3. -/
theorem ep_Q2_020_partial_03_0375_valid :
    mulPoly ep_Q2_020_coefficient_03_0375
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 3. -/
def ep_Q2_020_coefficient_03_0376 : Poly :=
[
  term ((-1102908807455845825 : Rat) / 56596790034801622) [(16, 1)]
]

/-- Partial product 376 for generator 3. -/
def ep_Q2_020_partial_03_0376 : Poly :=
[
  term ((-1102908807455845825 : Rat) / 56596790034801622) [(2, 2), (16, 1)],
  term ((-1102908807455845825 : Rat) / 56596790034801622) [(3, 2), (16, 1)],
  term ((1102908807455845825 : Rat) / 56596790034801622) [(8, 2), (16, 1)],
  term ((1102908807455845825 : Rat) / 56596790034801622) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 3. -/
theorem ep_Q2_020_partial_03_0376_valid :
    mulPoly ep_Q2_020_coefficient_03_0376
        ep_Q2_020_generator_03_0300_0376 =
      ep_Q2_020_partial_03_0376 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_03_0300_0376 : List Poly :=
[
  ep_Q2_020_partial_03_0300,
  ep_Q2_020_partial_03_0301,
  ep_Q2_020_partial_03_0302,
  ep_Q2_020_partial_03_0303,
  ep_Q2_020_partial_03_0304,
  ep_Q2_020_partial_03_0305,
  ep_Q2_020_partial_03_0306,
  ep_Q2_020_partial_03_0307,
  ep_Q2_020_partial_03_0308,
  ep_Q2_020_partial_03_0309,
  ep_Q2_020_partial_03_0310,
  ep_Q2_020_partial_03_0311,
  ep_Q2_020_partial_03_0312,
  ep_Q2_020_partial_03_0313,
  ep_Q2_020_partial_03_0314,
  ep_Q2_020_partial_03_0315,
  ep_Q2_020_partial_03_0316,
  ep_Q2_020_partial_03_0317,
  ep_Q2_020_partial_03_0318,
  ep_Q2_020_partial_03_0319,
  ep_Q2_020_partial_03_0320,
  ep_Q2_020_partial_03_0321,
  ep_Q2_020_partial_03_0322,
  ep_Q2_020_partial_03_0323,
  ep_Q2_020_partial_03_0324,
  ep_Q2_020_partial_03_0325,
  ep_Q2_020_partial_03_0326,
  ep_Q2_020_partial_03_0327,
  ep_Q2_020_partial_03_0328,
  ep_Q2_020_partial_03_0329,
  ep_Q2_020_partial_03_0330,
  ep_Q2_020_partial_03_0331,
  ep_Q2_020_partial_03_0332,
  ep_Q2_020_partial_03_0333,
  ep_Q2_020_partial_03_0334,
  ep_Q2_020_partial_03_0335,
  ep_Q2_020_partial_03_0336,
  ep_Q2_020_partial_03_0337,
  ep_Q2_020_partial_03_0338,
  ep_Q2_020_partial_03_0339,
  ep_Q2_020_partial_03_0340,
  ep_Q2_020_partial_03_0341,
  ep_Q2_020_partial_03_0342,
  ep_Q2_020_partial_03_0343,
  ep_Q2_020_partial_03_0344,
  ep_Q2_020_partial_03_0345,
  ep_Q2_020_partial_03_0346,
  ep_Q2_020_partial_03_0347,
  ep_Q2_020_partial_03_0348,
  ep_Q2_020_partial_03_0349,
  ep_Q2_020_partial_03_0350,
  ep_Q2_020_partial_03_0351,
  ep_Q2_020_partial_03_0352,
  ep_Q2_020_partial_03_0353,
  ep_Q2_020_partial_03_0354,
  ep_Q2_020_partial_03_0355,
  ep_Q2_020_partial_03_0356,
  ep_Q2_020_partial_03_0357,
  ep_Q2_020_partial_03_0358,
  ep_Q2_020_partial_03_0359,
  ep_Q2_020_partial_03_0360,
  ep_Q2_020_partial_03_0361,
  ep_Q2_020_partial_03_0362,
  ep_Q2_020_partial_03_0363,
  ep_Q2_020_partial_03_0364,
  ep_Q2_020_partial_03_0365,
  ep_Q2_020_partial_03_0366,
  ep_Q2_020_partial_03_0367,
  ep_Q2_020_partial_03_0368,
  ep_Q2_020_partial_03_0369,
  ep_Q2_020_partial_03_0370,
  ep_Q2_020_partial_03_0371,
  ep_Q2_020_partial_03_0372,
  ep_Q2_020_partial_03_0373,
  ep_Q2_020_partial_03_0374,
  ep_Q2_020_partial_03_0375,
  ep_Q2_020_partial_03_0376
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_03_0300_0376 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-362068826687141490 : Rat) / 28298395017400811) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(2, 2), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(2, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((7699541364649404 : Rat) / 690204756521971) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-578829561118097205 : Rat) / 56596790034801622) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-138777901394266476 : Rat) / 28298395017400811) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((723478579784067726 : Rat) / 28298395017400811) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((58160154420493836 : Rat) / 28298395017400811) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(2, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(2, 2), (7, 2), (9, 2), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((-165632231768795946 : Rat) / 28298395017400811) [(2, 2), (7, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(2, 2), (7, 3), (8, 1), (9, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(2, 2), (7, 3), (9, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(2, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(2, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(2, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(2, 2), (8, 1), (12, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(2, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-172853318336052702 : Rat) / 28298395017400811) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8980666535772738 : Rat) / 28298395017400811) [(2, 2), (8, 1), (13, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(2, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-748899506373033286 : Rat) / 28298395017400811) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((-29809566419448 : Rat) / 1230365000756557) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((1786254623283510589 : Rat) / 226387160139206488) [(2, 2), (8, 1), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(2, 2), (8, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-507584456368439801 : Rat) / 113193580069603244) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(2, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((253498591440945816 : Rat) / 28298395017400811) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(2, 2), (9, 2), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-817986686653222596 : Rat) / 28298395017400811) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-298523267803318689 : Rat) / 28298395017400811) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4943653566448249737 : Rat) / 28298395017400811) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17257591360360284715 : Rat) / 113193580069603244) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(2, 2), (11, 2), (16, 1)],
  term ((-724455115577581413 : Rat) / 28298395017400811) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(2, 2), (12, 1), (14, 2), (16, 1)],
  term ((504181794758889366 : Rat) / 28298395017400811) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23112364444619553 : Rat) / 56596790034801622) [(2, 2), (12, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(2, 2), (12, 2), (14, 1), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(2, 2), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(2, 2), (12, 3), (16, 1)],
  term ((569090344757276205 : Rat) / 56596790034801622) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5120304761254964661 : Rat) / 226387160139206488) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((-534979022340165237 : Rat) / 113193580069603244) [(2, 2), (13, 2), (16, 1)],
  term ((-2951147075525352 : Rat) / 1230365000756557) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((4380476978646617747 : Rat) / 56596790034801622) [(2, 2), (14, 1), (16, 1)],
  term ((-4928003181080834913 : Rat) / 56596790034801622) [(2, 2), (14, 2), (16, 1)],
  term ((-4187551167825502623 : Rat) / 113193580069603244) [(2, 2), (15, 2), (16, 1)],
  term ((-1102908807455845825 : Rat) / 56596790034801622) [(2, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-362068826687141490 : Rat) / 28298395017400811) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(3, 2), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(3, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((7699541364649404 : Rat) / 690204756521971) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-578829561118097205 : Rat) / 56596790034801622) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-138777901394266476 : Rat) / 28298395017400811) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((723478579784067726 : Rat) / 28298395017400811) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((58160154420493836 : Rat) / 28298395017400811) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(3, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(3, 2), (7, 2), (9, 2), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(3, 2), (7, 2), (14, 1), (16, 1)],
  term ((-165632231768795946 : Rat) / 28298395017400811) [(3, 2), (7, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(3, 2), (7, 3), (8, 1), (9, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(3, 2), (7, 3), (9, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(3, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1948755360442500 : Rat) / 975806724737959) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4400051354968116081 : Rat) / 56596790034801622) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(3, 2), (8, 1), (12, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-172853318336052702 : Rat) / 28298395017400811) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8980666535772738 : Rat) / 28298395017400811) [(3, 2), (8, 1), (13, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-748899506373033286 : Rat) / 28298395017400811) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((-29809566419448 : Rat) / 1230365000756557) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((1786254623283510589 : Rat) / 226387160139206488) [(3, 2), (8, 1), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(3, 2), (8, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-507584456368439801 : Rat) / 113193580069603244) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(3, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((253498591440945816 : Rat) / 28298395017400811) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4280037303797814429 : Rat) / 113193580069603244) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(3, 2), (9, 2), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-817986686653222596 : Rat) / 28298395017400811) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-298523267803318689 : Rat) / 28298395017400811) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4943653566448249737 : Rat) / 28298395017400811) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17257591360360284715 : Rat) / 113193580069603244) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(3, 2), (11, 2), (16, 1)],
  term ((-724455115577581413 : Rat) / 28298395017400811) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(3, 2), (12, 1), (14, 2), (16, 1)],
  term ((504181794758889366 : Rat) / 28298395017400811) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23112364444619553 : Rat) / 56596790034801622) [(3, 2), (12, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(3, 2), (12, 2), (14, 1), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(3, 2), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(3, 2), (12, 3), (16, 1)],
  term ((569090344757276205 : Rat) / 56596790034801622) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5120304761254964661 : Rat) / 226387160139206488) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(3, 2), (13, 2), (14, 1), (16, 1)],
  term ((-534979022340165237 : Rat) / 113193580069603244) [(3, 2), (13, 2), (16, 1)],
  term ((-2951147075525352 : Rat) / 1230365000756557) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((4380476978646617747 : Rat) / 56596790034801622) [(3, 2), (14, 1), (16, 1)],
  term ((-4928003181080834913 : Rat) / 56596790034801622) [(3, 2), (14, 2), (16, 1)],
  term ((-4187551167825502623 : Rat) / 113193580069603244) [(3, 2), (15, 2), (16, 1)],
  term ((-1102908807455845825 : Rat) / 56596790034801622) [(3, 2), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((362068826687141490 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-7699541364649404 : Rat) / 690204756521971) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((578829561118097205 : Rat) / 56596790034801622) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((138777901394266476 : Rat) / 28298395017400811) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-723478579784067726 : Rat) / 28298395017400811) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((362068826687141490 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-7699541364649404 : Rat) / 690204756521971) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((578829561118097205 : Rat) / 56596790034801622) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((138777901394266476 : Rat) / 28298395017400811) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-723478579784067726 : Rat) / 28298395017400811) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (8, 2), (9, 2), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (8, 2), (14, 1), (16, 1)],
  term ((165632231768795946 : Rat) / 28298395017400811) [(7, 2), (8, 2), (16, 1)],
  term ((-58160154420493836 : Rat) / 28298395017400811) [(7, 2), (8, 3), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((165632231768795946 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 3), (15, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 4), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 1), (9, 3), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 3), (8, 2), (9, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (8, 3), (9, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(7, 3), (9, 3), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (9, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((507584456368439801 : Rat) / 113193580069603244) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7145436321622500 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-327905230613928 : Rat) / 1230365000756557) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-253498591440945816 : Rat) / 28298395017400811) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4280037303797814429 : Rat) / 113193580069603244) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((67838249180264062 : Rat) / 28298395017400811) [(8, 2), (9, 2), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((817986686653222596 : Rat) / 28298395017400811) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((298523267803318689 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((4943653566448249737 : Rat) / 28298395017400811) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17257591360360284715 : Rat) / 113193580069603244) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(8, 2), (11, 2), (16, 1)],
  term ((724455115577581413 : Rat) / 28298395017400811) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(8, 2), (12, 1), (13, 2), (16, 1)],
  term ((3153763242200198829 : Rat) / 226387160139206488) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(8, 2), (12, 1), (14, 2), (16, 1)],
  term ((-504181794758889366 : Rat) / 28298395017400811) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((23112364444619553 : Rat) / 56596790034801622) [(8, 2), (12, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(8, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(8, 2), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(8, 2), (12, 3), (16, 1)],
  term ((-569090344757276205 : Rat) / 56596790034801622) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5120304761254964661 : Rat) / 226387160139206488) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 113193580069603244) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((534979022340165237 : Rat) / 113193580069603244) [(8, 2), (13, 2), (16, 1)],
  term ((2951147075525352 : Rat) / 1230365000756557) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4380476978646617747 : Rat) / 56596790034801622) [(8, 2), (14, 1), (16, 1)],
  term ((4928003181080834913 : Rat) / 56596790034801622) [(8, 2), (14, 2), (16, 1)],
  term ((4187551167825502623 : Rat) / 113193580069603244) [(8, 2), (15, 2), (16, 1)],
  term ((1102908807455845825 : Rat) / 56596790034801622) [(8, 2), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1948755360442500 : Rat) / 975806724737959) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4400051354968116081 : Rat) / 56596790034801622) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 3), (12, 1), (14, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 3), (12, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 3), (12, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 3), (13, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 3), (14, 1), (15, 2), (16, 1)],
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 3), (14, 1), (16, 1)],
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 3), (15, 2), (16, 1)],
  term ((-1786254623283510589 : Rat) / 226387160139206488) [(8, 3), (16, 1)],
  term ((63040682717534934 : Rat) / 28298395017400811) [(8, 4), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((817986686653222596 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((298523267803318689 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((4943653566448249737 : Rat) / 28298395017400811) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17257591360360284715 : Rat) / 113193580069603244) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(9, 2), (11, 2), (16, 1)],
  term ((724455115577581413 : Rat) / 28298395017400811) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(9, 2), (12, 1), (13, 2), (16, 1)],
  term ((3153763242200198829 : Rat) / 226387160139206488) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-504181794758889366 : Rat) / 28298395017400811) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((23112364444619553 : Rat) / 56596790034801622) [(9, 2), (12, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(9, 2), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(9, 2), (12, 3), (16, 1)],
  term ((-569090344757276205 : Rat) / 56596790034801622) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5120304761254964661 : Rat) / 226387160139206488) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 113193580069603244) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((534979022340165237 : Rat) / 113193580069603244) [(9, 2), (13, 2), (16, 1)],
  term ((2951147075525352 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4380476978646617747 : Rat) / 56596790034801622) [(9, 2), (14, 1), (16, 1)],
  term ((4928003181080834913 : Rat) / 56596790034801622) [(9, 2), (14, 2), (16, 1)],
  term ((4187551167825502623 : Rat) / 113193580069603244) [(9, 2), (15, 2), (16, 1)],
  term ((1102908807455845825 : Rat) / 56596790034801622) [(9, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((507584456368439801 : Rat) / 113193580069603244) [(9, 3), (11, 1), (16, 1)],
  term ((-7145436321622500 : Rat) / 28298395017400811) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((-327905230613928 : Rat) / 1230365000756557) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-253498591440945816 : Rat) / 28298395017400811) [(9, 3), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((4280037303797814429 : Rat) / 113193580069603244) [(9, 3), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 3), (15, 3), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 300 through 376. -/
theorem ep_Q2_020_block_03_0300_0376_valid :
    checkProductSumEq ep_Q2_020_partials_03_0300_0376
      ep_Q2_020_block_03_0300_0376 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
