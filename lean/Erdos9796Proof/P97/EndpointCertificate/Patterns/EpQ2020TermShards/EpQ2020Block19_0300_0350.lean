/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 19:300-350

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 19 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_19_0300_0350 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(8, 1)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0300 : Poly :=
[
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 300 for generator 19. -/
def ep_Q2_020_partial_19_0300 : Poly :=
[
  term ((265152519031543596 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((265152519031543596 : Rat) / 28298395017400811) [(8, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 19. -/
theorem ep_Q2_020_partial_19_0300_valid :
    mulPoly ep_Q2_020_coefficient_19_0300
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0301 : Poly :=
[
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 301 for generator 19. -/
def ep_Q2_020_partial_19_0301 : Poly :=
[
  term ((73385709777162504 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(8, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 19. -/
theorem ep_Q2_020_partial_19_0301_valid :
    mulPoly ep_Q2_020_coefficient_19_0301
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0302 : Poly :=
[
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 2), (16, 1)]
]

/-- Partial product 302 for generator 19. -/
def ep_Q2_020_partial_19_0302 : Poly :=
[
  term ((-13490823602297016 : Rat) / 975806724737959) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (10, 2), (12, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 2), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(8, 2), (10, 1), (12, 2), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 19. -/
theorem ep_Q2_020_partial_19_0302_valid :
    mulPoly ep_Q2_020_coefficient_19_0302
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0303 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 19. -/
def ep_Q2_020_partial_19_0303 : Poly :=
[
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 19. -/
theorem ep_Q2_020_partial_19_0303_valid :
    mulPoly ep_Q2_020_coefficient_19_0303
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0304 : Poly :=
[
  term ((-172853318336052702 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 19. -/
def ep_Q2_020_partial_19_0304 : Poly :=
[
  term ((-345706636672105404 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-172853318336052702 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-345706636672105404 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((345706636672105404 : Rat) / 28298395017400811) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 19. -/
theorem ep_Q2_020_partial_19_0304_valid :
    mulPoly ep_Q2_020_coefficient_19_0304
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0305 : Poly :=
[
  term ((8980666535772738 : Rat) / 28298395017400811) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 305 for generator 19. -/
def ep_Q2_020_partial_19_0305 : Poly :=
[
  term ((17961333071545476 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((8980666535772738 : Rat) / 28298395017400811) [(8, 1), (13, 2), (16, 1)],
  term ((17961333071545476 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-17961333071545476 : Rat) / 28298395017400811) [(8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 19. -/
theorem ep_Q2_020_partial_19_0305_valid :
    mulPoly ep_Q2_020_coefficient_19_0305
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0306 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 306 for generator 19. -/
def ep_Q2_020_partial_19_0306 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 19. -/
theorem ep_Q2_020_partial_19_0306_valid :
    mulPoly ep_Q2_020_coefficient_19_0306
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0307 : Poly :=
[
  term ((-748899506373033286 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 307 for generator 19. -/
def ep_Q2_020_partial_19_0307 : Poly :=
[
  term ((-1497799012746066572 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-748899506373033286 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)],
  term ((-1497799012746066572 : Rat) / 28298395017400811) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((1497799012746066572 : Rat) / 28298395017400811) [(8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 19. -/
theorem ep_Q2_020_partial_19_0307_valid :
    mulPoly ep_Q2_020_coefficient_19_0307
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0308 : Poly :=
[
  term ((-29809566419448 : Rat) / 1230365000756557) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 19. -/
def ep_Q2_020_partial_19_0308 : Poly :=
[
  term ((-59619132838896 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-29809566419448 : Rat) / 1230365000756557) [(8, 1), (15, 2), (16, 1)],
  term ((-59619132838896 : Rat) / 1230365000756557) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 19. -/
theorem ep_Q2_020_partial_19_0308_valid :
    mulPoly ep_Q2_020_coefficient_19_0308
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0309 : Poly :=
[
  term ((1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (16, 1)]
]

/-- Partial product 309 for generator 19. -/
def ep_Q2_020_partial_19_0309 : Poly :=
[
  term ((1786254623283510589 : Rat) / 113193580069603244) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (10, 2), (16, 1)],
  term ((-1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (11, 2), (16, 1)],
  term ((1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (16, 1)],
  term ((1786254623283510589 : Rat) / 113193580069603244) [(8, 2), (10, 1), (16, 1)],
  term ((-1786254623283510589 : Rat) / 113193580069603244) [(8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 19. -/
theorem ep_Q2_020_partial_19_0309_valid :
    mulPoly ep_Q2_020_coefficient_19_0309
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0310 : Poly :=
[
  term ((-63040682717534934 : Rat) / 28298395017400811) [(8, 2), (16, 1)]
]

/-- Partial product 310 for generator 19. -/
def ep_Q2_020_partial_19_0310 : Poly :=
[
  term ((-126081365435069868 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((63040682717534934 : Rat) / 28298395017400811) [(8, 2), (10, 2), (16, 1)],
  term ((63040682717534934 : Rat) / 28298395017400811) [(8, 2), (11, 2), (16, 1)],
  term ((-63040682717534934 : Rat) / 28298395017400811) [(8, 2), (16, 1)],
  term ((-126081365435069868 : Rat) / 28298395017400811) [(8, 3), (10, 1), (16, 1)],
  term ((126081365435069868 : Rat) / 28298395017400811) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 19. -/
theorem ep_Q2_020_partial_19_0310_valid :
    mulPoly ep_Q2_020_coefficient_19_0310
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0311 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 19. -/
def ep_Q2_020_partial_19_0311 : Poly :=
[
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 19. -/
theorem ep_Q2_020_partial_19_0311_valid :
    mulPoly ep_Q2_020_coefficient_19_0311
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0312 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 19. -/
def ep_Q2_020_partial_19_0312 : Poly :=
[
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 19. -/
theorem ep_Q2_020_partial_19_0312_valid :
    mulPoly ep_Q2_020_coefficient_19_0312
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0313 : Poly :=
[
  term ((2826845431319999889 : Rat) / 113193580069603244) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 313 for generator 19. -/
def ep_Q2_020_partial_19_0313 : Poly :=
[
  term ((2826845431319999889 : Rat) / 56596790034801622) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2826845431319999889 : Rat) / 56596790034801622) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2826845431319999889 : Rat) / 113193580069603244) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((2826845431319999889 : Rat) / 113193580069603244) [(9, 1), (11, 1), (16, 1)],
  term ((-2826845431319999889 : Rat) / 113193580069603244) [(9, 1), (11, 3), (16, 1)],
  term ((2826845431319999889 : Rat) / 56596790034801622) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 19. -/
theorem ep_Q2_020_partial_19_0313_valid :
    mulPoly ep_Q2_020_coefficient_19_0313
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0314 : Poly :=
[
  term ((-7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 314 for generator 19. -/
def ep_Q2_020_partial_19_0314 : Poly :=
[
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((-7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 4), (13, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 2), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 19. -/
theorem ep_Q2_020_partial_19_0314_valid :
    mulPoly ep_Q2_020_coefficient_19_0314
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0315 : Poly :=
[
  term ((-327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 19. -/
def ep_Q2_020_partial_19_0315 : Poly :=
[
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 4), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 19. -/
theorem ep_Q2_020_partial_19_0315_valid :
    mulPoly ep_Q2_020_coefficient_19_0315
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0316 : Poly :=
[
  term ((-204597608769079470 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 316 for generator 19. -/
def ep_Q2_020_partial_19_0316 : Poly :=
[
  term ((-409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-409195217538158940 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 19. -/
theorem ep_Q2_020_partial_19_0316_valid :
    mulPoly ep_Q2_020_coefficient_19_0316
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0317 : Poly :=
[
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 19. -/
def ep_Q2_020_partial_19_0317 : Poly :=
[
  term ((609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((609559985463354000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 19. -/
theorem ep_Q2_020_partial_19_0317_valid :
    mulPoly ep_Q2_020_coefficient_19_0317
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0318 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 318 for generator 19. -/
def ep_Q2_020_partial_19_0318 : Poly :=
[
  term ((-6495851201475000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 19. -/
theorem ep_Q2_020_partial_19_0318_valid :
    mulPoly ep_Q2_020_coefficient_19_0318
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0319 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 19. -/
def ep_Q2_020_partial_19_0319 : Poly :=
[
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 19. -/
theorem ep_Q2_020_partial_19_0319_valid :
    mulPoly ep_Q2_020_coefficient_19_0319
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0320 : Poly :=
[
  term ((306439778732967066 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 320 for generator 19. -/
def ep_Q2_020_partial_19_0320 : Poly :=
[
  term ((612879557465934132 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-612879557465934132 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-306439778732967066 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-306439778732967066 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((306439778732967066 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)],
  term ((612879557465934132 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 19. -/
theorem ep_Q2_020_partial_19_0320_valid :
    mulPoly ep_Q2_020_coefficient_19_0320
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0321 : Poly :=
[
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 19. -/
def ep_Q2_020_partial_19_0321 : Poly :=
[
  term ((-298095664194480 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 19. -/
theorem ep_Q2_020_partial_19_0321_valid :
    mulPoly ep_Q2_020_coefficient_19_0321
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0322 : Poly :=
[
  term ((-1424516224748907435 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 19. -/
def ep_Q2_020_partial_19_0322 : Poly :=
[
  term ((-1424516224748907435 : Rat) / 56596790034801622) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1424516224748907435 : Rat) / 56596790034801622) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1424516224748907435 : Rat) / 113193580069603244) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1424516224748907435 : Rat) / 113193580069603244) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1424516224748907435 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)],
  term ((-1424516224748907435 : Rat) / 56596790034801622) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 19. -/
theorem ep_Q2_020_partial_19_0322_valid :
    mulPoly ep_Q2_020_coefficient_19_0322
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0323 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 323 for generator 19. -/
def ep_Q2_020_partial_19_0323 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (15, 3), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 19. -/
theorem ep_Q2_020_partial_19_0323_valid :
    mulPoly ep_Q2_020_coefficient_19_0323
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0324 : Poly :=
[
  term ((-4797566462729128 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

/-- Partial product 324 for generator 19. -/
def ep_Q2_020_partial_19_0324 : Poly :=
[
  term ((-9595132925458256 : Rat) / 28298395017400811) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(8, 1), (9, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 2), (10, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 2), (11, 2), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(9, 2), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 19. -/
theorem ep_Q2_020_partial_19_0324_valid :
    mulPoly ep_Q2_020_coefficient_19_0324
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0325 : Poly :=
[
  term ((-614800024832104596 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 19. -/
def ep_Q2_020_partial_19_0325 : Poly :=
[
  term ((-1229600049664209192 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1229600049664209192 : Rat) / 28298395017400811) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1229600049664209192 : Rat) / 28298395017400811) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((614800024832104596 : Rat) / 28298395017400811) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-614800024832104596 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((614800024832104596 : Rat) / 28298395017400811) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 19. -/
theorem ep_Q2_020_partial_19_0325_valid :
    mulPoly ep_Q2_020_coefficient_19_0325
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0326 : Poly :=
[
  term ((41573447689440000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 326 for generator 19. -/
def ep_Q2_020_partial_19_0326 : Poly :=
[
  term ((83146895378880000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-83146895378880000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((83146895378880000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-41573447689440000 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((41573447689440000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41573447689440000 : Rat) / 28298395017400811) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 19. -/
theorem ep_Q2_020_partial_19_0326_valid :
    mulPoly ep_Q2_020_coefficient_19_0326
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0327 : Poly :=
[
  term ((-7795021441770000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 327 for generator 19. -/
def ep_Q2_020_partial_19_0327 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 19. -/
theorem ep_Q2_020_partial_19_0327_valid :
    mulPoly ep_Q2_020_coefficient_19_0327
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0328 : Poly :=
[
  term ((34447713748584471 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 328 for generator 19. -/
def ep_Q2_020_partial_19_0328 : Poly :=
[
  term ((68895427497168942 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-68895427497168942 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((68895427497168942 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-34447713748584471 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((34447713748584471 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)],
  term ((-34447713748584471 : Rat) / 28298395017400811) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 19. -/
theorem ep_Q2_020_partial_19_0328_valid :
    mulPoly ep_Q2_020_coefficient_19_0328
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0329 : Poly :=
[
  term ((-5112077377130812743 : Rat) / 56596790034801622) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 19. -/
def ep_Q2_020_partial_19_0329 : Poly :=
[
  term ((-5112077377130812743 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5112077377130812743 : Rat) / 28298395017400811) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5112077377130812743 : Rat) / 28298395017400811) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((5112077377130812743 : Rat) / 56596790034801622) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5112077377130812743 : Rat) / 56596790034801622) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5112077377130812743 : Rat) / 56596790034801622) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 19. -/
theorem ep_Q2_020_partial_19_0329_valid :
    mulPoly ep_Q2_020_coefficient_19_0329
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0330 : Poly :=
[
  term ((7108735735229332109 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 19. -/
def ep_Q2_020_partial_19_0330 : Poly :=
[
  term ((7108735735229332109 : Rat) / 56596790034801622) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7108735735229332109 : Rat) / 56596790034801622) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7108735735229332109 : Rat) / 56596790034801622) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7108735735229332109 : Rat) / 113193580069603244) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((7108735735229332109 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)],
  term ((-7108735735229332109 : Rat) / 113193580069603244) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 19. -/
theorem ep_Q2_020_partial_19_0330_valid :
    mulPoly ep_Q2_020_coefficient_19_0330
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0331 : Poly :=
[
  term ((-357714797033376 : Rat) / 1230365000756557) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 331 for generator 19. -/
def ep_Q2_020_partial_19_0331 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(11, 1), (15, 3), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 19. -/
theorem ep_Q2_020_partial_19_0331_valid :
    mulPoly ep_Q2_020_coefficient_19_0331
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0332 : Poly :=
[
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (16, 1)]
]

/-- Partial product 332 for generator 19. -/
def ep_Q2_020_partial_19_0332 : Poly :=
[
  term ((589410376663348278 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(8, 1), (11, 2), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(9, 1), (11, 3), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(10, 2), (11, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 19. -/
theorem ep_Q2_020_partial_19_0332_valid :
    mulPoly ep_Q2_020_coefficient_19_0332
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0333 : Poly :=
[
  term ((11642040502154907 : Rat) / 28298395017400811) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 19. -/
def ep_Q2_020_partial_19_0333 : Poly :=
[
  term ((23284081004309814 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23284081004309814 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23284081004309814 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11642040502154907 : Rat) / 28298395017400811) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11642040502154907 : Rat) / 28298395017400811) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11642040502154907 : Rat) / 28298395017400811) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 19. -/
theorem ep_Q2_020_partial_19_0333_valid :
    mulPoly ep_Q2_020_coefficient_19_0333
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0334 : Poly :=
[
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 334 for generator 19. -/
def ep_Q2_020_partial_19_0334 : Poly :=
[
  term ((25050814386426345 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 19. -/
theorem ep_Q2_020_partial_19_0334_valid :
    mulPoly ep_Q2_020_coefficient_19_0334
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0335 : Poly :=
[
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 335 for generator 19. -/
def ep_Q2_020_partial_19_0335 : Poly :=
[
  term ((-3153763242200198829 : Rat) / 113193580069603244) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3153763242200198829 : Rat) / 113193580069603244) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3153763242200198829 : Rat) / 113193580069603244) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3153763242200198829 : Rat) / 226387160139206488) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((3153763242200198829 : Rat) / 226387160139206488) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 19. -/
theorem ep_Q2_020_partial_19_0335_valid :
    mulPoly ep_Q2_020_coefficient_19_0335
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0336 : Poly :=
[
  term ((893325140779787937 : Rat) / 56596790034801622) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 336 for generator 19. -/
def ep_Q2_020_partial_19_0336 : Poly :=
[
  term ((893325140779787937 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((893325140779787937 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(10, 2), (12, 1), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 19. -/
theorem ep_Q2_020_partial_19_0336_valid :
    mulPoly ep_Q2_020_coefficient_19_0336
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0337 : Poly :=
[
  term ((3372705900574254 : Rat) / 975806724737959) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 19. -/
def ep_Q2_020_partial_19_0337 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 19. -/
theorem ep_Q2_020_partial_19_0337_valid :
    mulPoly ep_Q2_020_coefficient_19_0337
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0338 : Poly :=
[
  term ((-412722248282909445 : Rat) / 56596790034801622) [(12, 1), (16, 1)]
]

/-- Partial product 338 for generator 19. -/
def ep_Q2_020_partial_19_0338 : Poly :=
[
  term ((-412722248282909445 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((412722248282909445 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)],
  term ((-412722248282909445 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((412722248282909445 : Rat) / 56596790034801622) [(10, 2), (12, 1), (16, 1)],
  term ((412722248282909445 : Rat) / 56596790034801622) [(11, 2), (12, 1), (16, 1)],
  term ((-412722248282909445 : Rat) / 56596790034801622) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 19. -/
theorem ep_Q2_020_partial_19_0338_valid :
    mulPoly ep_Q2_020_coefficient_19_0338
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0339 : Poly :=
[
  term ((-376269112660858785 : Rat) / 113193580069603244) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 339 for generator 19. -/
def ep_Q2_020_partial_19_0339 : Poly :=
[
  term ((-376269112660858785 : Rat) / 56596790034801622) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 56596790034801622) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 56596790034801622) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 19. -/
theorem ep_Q2_020_partial_19_0339_valid :
    mulPoly ep_Q2_020_coefficient_19_0339
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0340 : Poly :=
[
  term ((1439992816278032403 : Rat) / 113193580069603244) [(12, 2), (16, 1)]
]

/-- Partial product 340 for generator 19. -/
def ep_Q2_020_partial_19_0340 : Poly :=
[
  term ((1439992816278032403 : Rat) / 56596790034801622) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-1439992816278032403 : Rat) / 56596790034801622) [(8, 1), (12, 2), (16, 1)],
  term ((1439992816278032403 : Rat) / 56596790034801622) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(10, 2), (12, 2), (16, 1)],
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(11, 2), (12, 2), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 19. -/
theorem ep_Q2_020_partial_19_0340_valid :
    mulPoly ep_Q2_020_coefficient_19_0340
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0341 : Poly :=
[
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 3), (16, 1)]
]

/-- Partial product 341 for generator 19. -/
def ep_Q2_020_partial_19_0341 : Poly :=
[
  term ((25050814386426345 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(8, 1), (12, 3), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(10, 2), (12, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(11, 2), (12, 3), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 19. -/
theorem ep_Q2_020_partial_19_0341_valid :
    mulPoly ep_Q2_020_coefficient_19_0341
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0342 : Poly :=
[
  term ((18638227567958145 : Rat) / 1951613449475918) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 19. -/
def ep_Q2_020_partial_19_0342 : Poly :=
[
  term ((18638227567958145 : Rat) / 975806724737959) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18638227567958145 : Rat) / 975806724737959) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18638227567958145 : Rat) / 975806724737959) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18638227567958145 : Rat) / 1951613449475918) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18638227567958145 : Rat) / 1951613449475918) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18638227567958145 : Rat) / 1951613449475918) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 19. -/
theorem ep_Q2_020_partial_19_0342_valid :
    mulPoly ep_Q2_020_coefficient_19_0342
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0343 : Poly :=
[
  term ((2949798164478955155 : Rat) / 226387160139206488) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 19. -/
def ep_Q2_020_partial_19_0343 : Poly :=
[
  term ((2949798164478955155 : Rat) / 113193580069603244) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2949798164478955155 : Rat) / 113193580069603244) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2949798164478955155 : Rat) / 113193580069603244) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2949798164478955155 : Rat) / 226387160139206488) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2949798164478955155 : Rat) / 226387160139206488) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2949798164478955155 : Rat) / 226387160139206488) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 19. -/
theorem ep_Q2_020_partial_19_0343_valid :
    mulPoly ep_Q2_020_coefficient_19_0343
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0344 : Poly :=
[
  term ((-422837274669478413 : Rat) / 113193580069603244) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 344 for generator 19. -/
def ep_Q2_020_partial_19_0344 : Poly :=
[
  term ((-422837274669478413 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 56596790034801622) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 56596790034801622) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 113193580069603244) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 113193580069603244) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 19. -/
theorem ep_Q2_020_partial_19_0344_valid :
    mulPoly ep_Q2_020_coefficient_19_0344
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0345 : Poly :=
[
  term ((786188939194877643 : Rat) / 113193580069603244) [(13, 2), (16, 1)]
]

/-- Partial product 345 for generator 19. -/
def ep_Q2_020_partial_19_0345 : Poly :=
[
  term ((786188939194877643 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-786188939194877643 : Rat) / 56596790034801622) [(8, 1), (13, 2), (16, 1)],
  term ((786188939194877643 : Rat) / 56596790034801622) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-786188939194877643 : Rat) / 113193580069603244) [(10, 2), (13, 2), (16, 1)],
  term ((-786188939194877643 : Rat) / 113193580069603244) [(11, 2), (13, 2), (16, 1)],
  term ((786188939194877643 : Rat) / 113193580069603244) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 19. -/
theorem ep_Q2_020_partial_19_0345_valid :
    mulPoly ep_Q2_020_coefficient_19_0345
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0346 : Poly :=
[
  term ((-3606957536753208 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 346 for generator 19. -/
def ep_Q2_020_partial_19_0346 : Poly :=
[
  term ((-7213915073506416 : Rat) / 1230365000756557) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7213915073506416 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7213915073506416 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3606957536753208 : Rat) / 1230365000756557) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((3606957536753208 : Rat) / 1230365000756557) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3606957536753208 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 19. -/
theorem ep_Q2_020_partial_19_0346_valid :
    mulPoly ep_Q2_020_coefficient_19_0346
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0347 : Poly :=
[
  term ((4749873740738125689 : Rat) / 113193580069603244) [(14, 1), (16, 1)]
]

/-- Partial product 347 for generator 19. -/
def ep_Q2_020_partial_19_0347 : Poly :=
[
  term ((4749873740738125689 : Rat) / 56596790034801622) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4749873740738125689 : Rat) / 56596790034801622) [(8, 1), (14, 1), (16, 1)],
  term ((4749873740738125689 : Rat) / 56596790034801622) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4749873740738125689 : Rat) / 113193580069603244) [(10, 2), (14, 1), (16, 1)],
  term ((-4749873740738125689 : Rat) / 113193580069603244) [(11, 2), (14, 1), (16, 1)],
  term ((4749873740738125689 : Rat) / 113193580069603244) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 19. -/
theorem ep_Q2_020_partial_19_0347_valid :
    mulPoly ep_Q2_020_coefficient_19_0347
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0348 : Poly :=
[
  term ((-2846158941121467645 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 348 for generator 19. -/
def ep_Q2_020_partial_19_0348 : Poly :=
[
  term ((-2846158941121467645 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((2846158941121467645 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)],
  term ((-2846158941121467645 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2846158941121467645 : Rat) / 56596790034801622) [(10, 2), (14, 2), (16, 1)],
  term ((2846158941121467645 : Rat) / 56596790034801622) [(11, 2), (14, 2), (16, 1)],
  term ((-2846158941121467645 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 19. -/
theorem ep_Q2_020_partial_19_0348_valid :
    mulPoly ep_Q2_020_coefficient_19_0348
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0349 : Poly :=
[
  term ((493391519918285112 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

/-- Partial product 349 for generator 19. -/
def ep_Q2_020_partial_19_0349 : Poly :=
[
  term ((986783039836570224 : Rat) / 28298395017400811) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-986783039836570224 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)],
  term ((986783039836570224 : Rat) / 28298395017400811) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-493391519918285112 : Rat) / 28298395017400811) [(10, 2), (15, 2), (16, 1)],
  term ((-493391519918285112 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)],
  term ((493391519918285112 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 19. -/
theorem ep_Q2_020_partial_19_0349_valid :
    mulPoly ep_Q2_020_coefficient_19_0349
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 19. -/
def ep_Q2_020_coefficient_19_0350 : Poly :=
[
  term ((-2196017968799347143 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 350 for generator 19. -/
def ep_Q2_020_partial_19_0350 : Poly :=
[
  term ((-2196017968799347143 : Rat) / 113193580069603244) [(8, 1), (10, 1), (16, 1)],
  term ((2196017968799347143 : Rat) / 113193580069603244) [(8, 1), (16, 1)],
  term ((-2196017968799347143 : Rat) / 113193580069603244) [(9, 1), (11, 1), (16, 1)],
  term ((2196017968799347143 : Rat) / 226387160139206488) [(10, 2), (16, 1)],
  term ((2196017968799347143 : Rat) / 226387160139206488) [(11, 2), (16, 1)],
  term ((-2196017968799347143 : Rat) / 226387160139206488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 19. -/
theorem ep_Q2_020_partial_19_0350_valid :
    mulPoly ep_Q2_020_coefficient_19_0350
        ep_Q2_020_generator_19_0300_0350 =
      ep_Q2_020_partial_19_0350 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_19_0300_0350 : List Poly :=
[
  ep_Q2_020_partial_19_0300,
  ep_Q2_020_partial_19_0301,
  ep_Q2_020_partial_19_0302,
  ep_Q2_020_partial_19_0303,
  ep_Q2_020_partial_19_0304,
  ep_Q2_020_partial_19_0305,
  ep_Q2_020_partial_19_0306,
  ep_Q2_020_partial_19_0307,
  ep_Q2_020_partial_19_0308,
  ep_Q2_020_partial_19_0309,
  ep_Q2_020_partial_19_0310,
  ep_Q2_020_partial_19_0311,
  ep_Q2_020_partial_19_0312,
  ep_Q2_020_partial_19_0313,
  ep_Q2_020_partial_19_0314,
  ep_Q2_020_partial_19_0315,
  ep_Q2_020_partial_19_0316,
  ep_Q2_020_partial_19_0317,
  ep_Q2_020_partial_19_0318,
  ep_Q2_020_partial_19_0319,
  ep_Q2_020_partial_19_0320,
  ep_Q2_020_partial_19_0321,
  ep_Q2_020_partial_19_0322,
  ep_Q2_020_partial_19_0323,
  ep_Q2_020_partial_19_0324,
  ep_Q2_020_partial_19_0325,
  ep_Q2_020_partial_19_0326,
  ep_Q2_020_partial_19_0327,
  ep_Q2_020_partial_19_0328,
  ep_Q2_020_partial_19_0329,
  ep_Q2_020_partial_19_0330,
  ep_Q2_020_partial_19_0331,
  ep_Q2_020_partial_19_0332,
  ep_Q2_020_partial_19_0333,
  ep_Q2_020_partial_19_0334,
  ep_Q2_020_partial_19_0335,
  ep_Q2_020_partial_19_0336,
  ep_Q2_020_partial_19_0337,
  ep_Q2_020_partial_19_0338,
  ep_Q2_020_partial_19_0339,
  ep_Q2_020_partial_19_0340,
  ep_Q2_020_partial_19_0341,
  ep_Q2_020_partial_19_0342,
  ep_Q2_020_partial_19_0343,
  ep_Q2_020_partial_19_0344,
  ep_Q2_020_partial_19_0345,
  ep_Q2_020_partial_19_0346,
  ep_Q2_020_partial_19_0347,
  ep_Q2_020_partial_19_0348,
  ep_Q2_020_partial_19_0349,
  ep_Q2_020_partial_19_0350
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_19_0300_0350 : Poly :=
[
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((2826845431319999889 : Rat) / 56596790034801622) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((612879557465934132 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1424516224748907435 : Rat) / 56596790034801622) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((265152519031543596 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-371690041478005404 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17961333071545476 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1497799012746066572 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1252001789616816 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3867436239356489189 : Rat) / 113193580069603244) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-612879557465934132 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1424516224748907435 : Rat) / 56596790034801622) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(8, 1), (9, 2), (16, 1)],
  term ((-1229600049664209192 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((83146895378880000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((68895427497168942 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5112077377130812743 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7108735735229332109 : Rat) / 56596790034801622) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((23284081004309814 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3153763242200198829 : Rat) / 113193580069603244) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-412722248282909445 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 56596790034801622) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((1439992816278032403 : Rat) / 56596790034801622) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 3), (16, 1)],
  term ((18638227567958145 : Rat) / 975806724737959) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2949798164478955155 : Rat) / 113193580069603244) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((786188939194877643 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-7213915073506416 : Rat) / 1230365000756557) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4749873740738125689 : Rat) / 56596790034801622) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2846158941121467645 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((986783039836570224 : Rat) / 28298395017400811) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2196017968799347143 : Rat) / 113193580069603244) [(8, 1), (10, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (10, 2), (12, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1786254623283510589 : Rat) / 226387160139206488) [(8, 1), (10, 2), (16, 1)],
  term ((1229600049664209192 : Rat) / 28298395017400811) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-83146895378880000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68895427497168942 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((5112077377130812743 : Rat) / 28298395017400811) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7108735735229332109 : Rat) / 56596790034801622) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((172853318336052702 : Rat) / 28298395017400811) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8980666535772738 : Rat) / 28298395017400811) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((748899506373033286 : Rat) / 28298395017400811) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((29809566419448 : Rat) / 1230365000756557) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-6501537636590296813 : Rat) / 226387160139206488) [(8, 1), (11, 2), (16, 1)],
  term ((-23284081004309814 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((3684068280263286021 : Rat) / 113193580069603244) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((19539787094412639 : Rat) / 1230365000756557) [(8, 1), (12, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 56596790034801622) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1831226700744645867 : Rat) / 56596790034801622) [(8, 1), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(8, 1), (12, 3), (16, 1)],
  term ((-553500301873736205 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3641211437823165963 : Rat) / 113193580069603244) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 56596790034801622) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-768227606123332167 : Rat) / 56596790034801622) [(8, 1), (13, 2), (16, 1)],
  term ((6617723745117456 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6247672753484192261 : Rat) / 56596790034801622) [(8, 1), (14, 1), (16, 1)],
  term ((2846158941121467645 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)],
  term ((-987468659864217528 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)],
  term ((213044502099386375 : Rat) / 7806453797903672) [(8, 1), (16, 1)],
  term ((-126081365435069868 : Rat) / 28298395017400811) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((265152519031543596 : Rat) / 28298395017400811) [(8, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(8, 2), (10, 1), (12, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345706636672105404 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((17961333071545476 : Rat) / 28298395017400811) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1497799012746066572 : Rat) / 28298395017400811) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-59619132838896 : Rat) / 1230365000756557) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((1786254623283510589 : Rat) / 113193580069603244) [(8, 2), (10, 1), (16, 1)],
  term ((63040682717534934 : Rat) / 28298395017400811) [(8, 2), (10, 2), (16, 1)],
  term ((63040682717534934 : Rat) / 28298395017400811) [(8, 2), (11, 2), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(8, 2), (12, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 2), (12, 2), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345706636672105404 : Rat) / 28298395017400811) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17961333071545476 : Rat) / 28298395017400811) [(8, 2), (13, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((1497799012746066572 : Rat) / 28298395017400811) [(8, 2), (14, 1), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(8, 2), (15, 2), (16, 1)],
  term ((-2038417354153650325 : Rat) / 113193580069603244) [(8, 2), (16, 1)],
  term ((-126081365435069868 : Rat) / 28298395017400811) [(8, 3), (10, 1), (16, 1)],
  term ((126081365435069868 : Rat) / 28298395017400811) [(8, 3), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2826845431319999889 : Rat) / 113193580069603244) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-306439778732967066 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1424516224748907435 : Rat) / 113193580069603244) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((23284081004309814 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3153763242200198829 : Rat) / 113193580069603244) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-412722248282909445 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 56596790034801622) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1439992816278032403 : Rat) / 56596790034801622) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((18638227567958145 : Rat) / 975806724737959) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3001764974090755155 : Rat) / 113193580069603244) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 56596790034801622) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((786188939194877643 : Rat) / 56596790034801622) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7213915073506416 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4749873740738125689 : Rat) / 56596790034801622) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2846158941121467645 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((1000495440389516304 : Rat) / 28298395017400811) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((315413731260326373 : Rat) / 56596790034801622) [(9, 1), (11, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1534380042395886192 : Rat) / 28298395017400811) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((86394820979617500 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-244689787557420624 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-5108649276992576223 : Rat) / 28298395017400811) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((15611820413991090277 : Rat) / 113193580069603244) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((-469203924666606777 : Rat) / 113193580069603244) [(9, 1), (11, 3), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 4), (13, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 4), (15, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((306439778732967066 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1424516224748907435 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (15, 3), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 2), (10, 2), (16, 1)],
  term ((-409195217538158940 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((609559985463354000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((612879557465934132 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1424516224748907435 : Rat) / 56596790034801622) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((2836440564245458145 : Rat) / 56596790034801622) [(9, 2), (11, 2), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 2), (11, 3), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(9, 2), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(9, 3), (11, 1), (16, 1)],
  term ((614800024832104596 : Rat) / 28298395017400811) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41573447689440000 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-34447713748584471 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((5112077377130812743 : Rat) / 56596790034801622) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7108735735229332109 : Rat) / 113193580069603244) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(10, 2), (11, 2), (16, 1)],
  term ((-11642040502154907 : Rat) / 28298395017400811) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((3153763242200198829 : Rat) / 226387160139206488) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(10, 2), (12, 1), (14, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((412722248282909445 : Rat) / 56596790034801622) [(10, 2), (12, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(10, 2), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(10, 2), (12, 3), (16, 1)],
  term ((-18638227567958145 : Rat) / 1951613449475918) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2949798164478955155 : Rat) / 226387160139206488) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 113193580069603244) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-786188939194877643 : Rat) / 113193580069603244) [(10, 2), (13, 2), (16, 1)],
  term ((3606957536753208 : Rat) / 1230365000756557) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4749873740738125689 : Rat) / 113193580069603244) [(10, 2), (14, 1), (16, 1)],
  term ((2846158941121467645 : Rat) / 56596790034801622) [(10, 2), (14, 2), (16, 1)],
  term ((-493391519918285112 : Rat) / 28298395017400811) [(10, 2), (15, 2), (16, 1)],
  term ((2196017968799347143 : Rat) / 226387160139206488) [(10, 2), (16, 1)],
  term ((-614800024832104596 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((41573447689440000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((34447713748584471 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)],
  term ((-5112077377130812743 : Rat) / 56596790034801622) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7108735735229332109 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(11, 1), (15, 3), (16, 1)],
  term ((-11642040502154907 : Rat) / 28298395017400811) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((3153763242200198829 : Rat) / 226387160139206488) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((412722248282909445 : Rat) / 56596790034801622) [(11, 2), (12, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1439992816278032403 : Rat) / 113193580069603244) [(11, 2), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(11, 2), (12, 3), (16, 1)],
  term ((-18638227567958145 : Rat) / 1951613449475918) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2949798164478955155 : Rat) / 226387160139206488) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((422837274669478413 : Rat) / 113193580069603244) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-786188939194877643 : Rat) / 113193580069603244) [(11, 2), (13, 2), (16, 1)],
  term ((3606957536753208 : Rat) / 1230365000756557) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4749873740738125689 : Rat) / 113193580069603244) [(11, 2), (14, 1), (16, 1)],
  term ((2846158941121467645 : Rat) / 56596790034801622) [(11, 2), (14, 2), (16, 1)],
  term ((-493391519918285112 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)],
  term ((4553659475452740255 : Rat) / 226387160139206488) [(11, 2), (16, 1)],
  term ((614800024832104596 : Rat) / 28298395017400811) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-41573447689440000 : Rat) / 28298395017400811) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-34447713748584471 : Rat) / 28298395017400811) [(11, 3), (13, 1), (16, 1)],
  term ((5112077377130812743 : Rat) / 56596790034801622) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7108735735229332109 : Rat) / 113193580069603244) [(11, 3), (15, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(11, 3), (15, 3), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(11, 4), (16, 1)],
  term ((11642040502154907 : Rat) / 28298395017400811) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 1), (13, 2), (16, 1)],
  term ((-3153763242200198829 : Rat) / 226387160139206488) [(12, 1), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(12, 1), (14, 2), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(12, 1), (15, 2), (16, 1)],
  term ((-412722248282909445 : Rat) / 56596790034801622) [(12, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(12, 2), (14, 1), (16, 1)],
  term ((1439992816278032403 : Rat) / 113193580069603244) [(12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 3), (16, 1)],
  term ((18638227567958145 : Rat) / 1951613449475918) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2949798164478955155 : Rat) / 226387160139206488) [(13, 1), (15, 1), (16, 1)],
  term ((-422837274669478413 : Rat) / 113193580069603244) [(13, 2), (14, 1), (16, 1)],
  term ((786188939194877643 : Rat) / 113193580069603244) [(13, 2), (16, 1)],
  term ((-3606957536753208 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)],
  term ((4749873740738125689 : Rat) / 113193580069603244) [(14, 1), (16, 1)],
  term ((-2846158941121467645 : Rat) / 56596790034801622) [(14, 2), (16, 1)],
  term ((493391519918285112 : Rat) / 28298395017400811) [(15, 2), (16, 1)],
  term ((-2196017968799347143 : Rat) / 226387160139206488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 300 through 350. -/
theorem ep_Q2_020_block_19_0300_0350_valid :
    checkProductSumEq ep_Q2_020_partials_19_0300_0350
      ep_Q2_020_block_19_0300_0350 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
