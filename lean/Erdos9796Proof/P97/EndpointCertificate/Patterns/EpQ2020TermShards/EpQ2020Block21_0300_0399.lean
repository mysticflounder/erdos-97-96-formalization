/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 21:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_21_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0300 : Poly :=
[
  term ((2153304459397091295 : Rat) / 113193580069603244) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 300 for generator 21. -/
def ep_Q2_020_partial_21_0300 : Poly :=
[
  term ((2153304459397091295 : Rat) / 56596790034801622) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2153304459397091295 : Rat) / 113193580069603244) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 21. -/
theorem ep_Q2_020_partial_21_0300_valid :
    mulPoly ep_Q2_020_coefficient_21_0300
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0301 : Poly :=
[
  term ((-59619132838896 : Rat) / 1230365000756557) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 21. -/
def ep_Q2_020_partial_21_0301 : Poly :=
[
  term ((-119238265677792 : Rat) / 1230365000756557) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 21. -/
theorem ep_Q2_020_partial_21_0301_valid :
    mulPoly ep_Q2_020_coefficient_21_0301
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0302 : Poly :=
[
  term ((914447652962322759 : Rat) / 56596790034801622) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 21. -/
def ep_Q2_020_partial_21_0302 : Poly :=
[
  term ((914447652962322759 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-914447652962322759 : Rat) / 56596790034801622) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 21. -/
theorem ep_Q2_020_partial_21_0302_valid :
    mulPoly ep_Q2_020_coefficient_21_0302
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0303 : Poly :=
[
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 303 for generator 21. -/
def ep_Q2_020_partial_21_0303 : Poly :=
[
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 21. -/
theorem ep_Q2_020_partial_21_0303_valid :
    mulPoly ep_Q2_020_coefficient_21_0303
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0304 : Poly :=
[
  term ((-47553558654003012 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 304 for generator 21. -/
def ep_Q2_020_partial_21_0304 : Poly :=
[
  term ((47553558654003012 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-95107117308006024 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 21. -/
theorem ep_Q2_020_partial_21_0304_valid :
    mulPoly ep_Q2_020_coefficient_21_0304
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0305 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 305 for generator 21. -/
def ep_Q2_020_partial_21_0305 : Poly :=
[
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 21. -/
theorem ep_Q2_020_partial_21_0305_valid :
    mulPoly ep_Q2_020_coefficient_21_0305
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0306 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 21. -/
def ep_Q2_020_partial_21_0306 : Poly :=
[
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 21. -/
theorem ep_Q2_020_partial_21_0306_valid :
    mulPoly ep_Q2_020_coefficient_21_0306
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0307 : Poly :=
[
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 307 for generator 21. -/
def ep_Q2_020_partial_21_0307 : Poly :=
[
  term ((118610657023559616 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 21. -/
theorem ep_Q2_020_partial_21_0307_valid :
    mulPoly ep_Q2_020_coefficient_21_0307
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0308 : Poly :=
[
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 308 for generator 21. -/
def ep_Q2_020_partial_21_0308 : Poly :=
[
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 21. -/
theorem ep_Q2_020_partial_21_0308_valid :
    mulPoly ep_Q2_020_coefficient_21_0308
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0309 : Poly :=
[
  term ((-105180844467982926 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 309 for generator 21. -/
def ep_Q2_020_partial_21_0309 : Poly :=
[
  term ((-210361688935965852 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((105180844467982926 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 21. -/
theorem ep_Q2_020_partial_21_0309_valid :
    mulPoly ep_Q2_020_coefficient_21_0309
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0310 : Poly :=
[
  term ((-23776779327001506 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 310 for generator 21. -/
def ep_Q2_020_partial_21_0310 : Poly :=
[
  term ((-47553558654003012 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((23776779327001506 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 21. -/
theorem ep_Q2_020_partial_21_0310_valid :
    mulPoly ep_Q2_020_coefficient_21_0310
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0311 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 311 for generator 21. -/
def ep_Q2_020_partial_21_0311 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 21. -/
theorem ep_Q2_020_partial_21_0311_valid :
    mulPoly ep_Q2_020_coefficient_21_0311
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0312 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 21. -/
def ep_Q2_020_partial_21_0312 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 21. -/
theorem ep_Q2_020_partial_21_0312_valid :
    mulPoly ep_Q2_020_coefficient_21_0312
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0313 : Poly :=
[
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 313 for generator 21. -/
def ep_Q2_020_partial_21_0313 : Poly :=
[
  term ((-62360171534160000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 21. -/
theorem ep_Q2_020_partial_21_0313_valid :
    mulPoly ep_Q2_020_coefficient_21_0313
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0314 : Poly :=
[
  term ((7795021441770000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 314 for generator 21. -/
def ep_Q2_020_partial_21_0314 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 21. -/
theorem ep_Q2_020_partial_21_0314_valid :
    mulPoly ep_Q2_020_coefficient_21_0314
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0315 : Poly :=
[
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 21. -/
def ep_Q2_020_partial_21_0315 : Poly :=
[
  term ((-2861718376267008 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 21. -/
theorem ep_Q2_020_partial_21_0315_valid :
    mulPoly ep_Q2_020_coefficient_21_0315
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0316 : Poly :=
[
  term ((357714797033376 : Rat) / 1230365000756557) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 21. -/
def ep_Q2_020_partial_21_0316 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 21. -/
theorem ep_Q2_020_partial_21_0316_valid :
    mulPoly ep_Q2_020_coefficient_21_0316
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0317 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 317 for generator 21. -/
def ep_Q2_020_partial_21_0317 : Poly :=
[
  term ((589410376663348278 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1178820753326696556 : Rat) / 28298395017400811) [(1, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 21. -/
theorem ep_Q2_020_partial_21_0317_valid :
    mulPoly ep_Q2_020_coefficient_21_0317
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0318 : Poly :=
[
  term ((63009756654307500 : Rat) / 28298395017400811) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 318 for generator 21. -/
def ep_Q2_020_partial_21_0318 : Poly :=
[
  term ((-63009756654307500 : Rat) / 28298395017400811) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((126019513308615000 : Rat) / 28298395017400811) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 21. -/
theorem ep_Q2_020_partial_21_0318_valid :
    mulPoly ep_Q2_020_coefficient_21_0318
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0319 : Poly :=
[
  term ((-206932265528512692 : Rat) / 28298395017400811) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 319 for generator 21. -/
def ep_Q2_020_partial_21_0319 : Poly :=
[
  term ((206932265528512692 : Rat) / 28298395017400811) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-413864531057025384 : Rat) / 28298395017400811) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 21. -/
theorem ep_Q2_020_partial_21_0319_valid :
    mulPoly ep_Q2_020_coefficient_21_0319
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0320 : Poly :=
[
  term ((-1848193118005776 : Rat) / 1230365000756557) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 21. -/
def ep_Q2_020_partial_21_0320 : Poly :=
[
  term ((1848193118005776 : Rat) / 1230365000756557) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3696386236011552 : Rat) / 1230365000756557) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 21. -/
theorem ep_Q2_020_partial_21_0320_valid :
    mulPoly ep_Q2_020_coefficient_21_0320
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0321 : Poly :=
[
  term ((-521667412340340 : Rat) / 1230365000756557) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 21. -/
def ep_Q2_020_partial_21_0321 : Poly :=
[
  term ((521667412340340 : Rat) / 1230365000756557) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1043334824680680 : Rat) / 1230365000756557) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 21. -/
theorem ep_Q2_020_partial_21_0321_valid :
    mulPoly ep_Q2_020_coefficient_21_0321
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0322 : Poly :=
[
  term ((-164030632278182688 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 322 for generator 21. -/
def ep_Q2_020_partial_21_0322 : Poly :=
[
  term ((-328061264556365376 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((164030632278182688 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 21. -/
theorem ep_Q2_020_partial_21_0322_valid :
    mulPoly ep_Q2_020_coefficient_21_0322
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0323 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 21. -/
def ep_Q2_020_partial_21_0323 : Poly :=
[
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 21. -/
theorem ep_Q2_020_partial_21_0323_valid :
    mulPoly ep_Q2_020_coefficient_21_0323
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0324 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 324 for generator 21. -/
def ep_Q2_020_partial_21_0324 : Poly :=
[
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 21. -/
theorem ep_Q2_020_partial_21_0324_valid :
    mulPoly ep_Q2_020_coefficient_21_0324
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0325 : Poly :=
[
  term ((-85119343610157697 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 325 for generator 21. -/
def ep_Q2_020_partial_21_0325 : Poly :=
[
  term ((-170238687220315394 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((85119343610157697 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 21. -/
theorem ep_Q2_020_partial_21_0325_valid :
    mulPoly ep_Q2_020_coefficient_21_0325
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0326 : Poly :=
[
  term ((-294705188331674139 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 326 for generator 21. -/
def ep_Q2_020_partial_21_0326 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 21. -/
theorem ep_Q2_020_partial_21_0326_valid :
    mulPoly ep_Q2_020_coefficient_21_0326
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0327 : Poly :=
[
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 21. -/
def ep_Q2_020_partial_21_0327 : Poly :=
[
  term ((656122529112730752 : Rat) / 28298395017400811) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 21. -/
theorem ep_Q2_020_partial_21_0327_valid :
    mulPoly ep_Q2_020_coefficient_21_0327
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0328 : Poly :=
[
  term ((-3364629990578172285 : Rat) / 113193580069603244) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 328 for generator 21. -/
def ep_Q2_020_partial_21_0328 : Poly :=
[
  term ((-3364629990578172285 : Rat) / 56596790034801622) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3364629990578172285 : Rat) / 113193580069603244) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 21. -/
theorem ep_Q2_020_partial_21_0328_valid :
    mulPoly ep_Q2_020_coefficient_21_0328
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0329 : Poly :=
[
  term ((-3897510720885000 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 329 for generator 21. -/
def ep_Q2_020_partial_21_0329 : Poly :=
[
  term ((-7795021441770000 : Rat) / 975806724737959) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((3897510720885000 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 21. -/
theorem ep_Q2_020_partial_21_0329_valid :
    mulPoly ep_Q2_020_coefficient_21_0329
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0330 : Poly :=
[
  term ((-103466132764256346 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 330 for generator 21. -/
def ep_Q2_020_partial_21_0330 : Poly :=
[
  term ((-206932265528512692 : Rat) / 28298395017400811) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((103466132764256346 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 21. -/
theorem ep_Q2_020_partial_21_0330_valid :
    mulPoly ep_Q2_020_coefficient_21_0330
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0331 : Poly :=
[
  term ((-928264429436329623 : Rat) / 56596790034801622) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 331 for generator 21. -/
def ep_Q2_020_partial_21_0331 : Poly :=
[
  term ((-928264429436329623 : Rat) / 28298395017400811) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((928264429436329623 : Rat) / 56596790034801622) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 21. -/
theorem ep_Q2_020_partial_21_0331_valid :
    mulPoly ep_Q2_020_coefficient_21_0331
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0332 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 21. -/
def ep_Q2_020_partial_21_0332 : Poly :=
[
  term ((8585155128801024 : Rat) / 1230365000756557) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 21. -/
theorem ep_Q2_020_partial_21_0332_valid :
    mulPoly ep_Q2_020_coefficient_21_0332
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0333 : Poly :=
[
  term ((-260833706170170 : Rat) / 1230365000756557) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 21. -/
def ep_Q2_020_partial_21_0333 : Poly :=
[
  term ((-521667412340340 : Rat) / 1230365000756557) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((260833706170170 : Rat) / 1230365000756557) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 21. -/
theorem ep_Q2_020_partial_21_0333_valid :
    mulPoly ep_Q2_020_coefficient_21_0333
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0334 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 1), (16, 1)]
]

/-- Partial product 334 for generator 21. -/
def ep_Q2_020_partial_21_0334 : Poly :=
[
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 21. -/
theorem ep_Q2_020_partial_21_0334_valid :
    mulPoly ep_Q2_020_coefficient_21_0334
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0335 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)]
]

/-- Partial product 335 for generator 21. -/
def ep_Q2_020_partial_21_0335 : Poly :=
[
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 21. -/
theorem ep_Q2_020_partial_21_0335_valid :
    mulPoly ep_Q2_020_coefficient_21_0335
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0336 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)]
]

/-- Partial product 336 for generator 21. -/
def ep_Q2_020_partial_21_0336 : Poly :=
[
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (10, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 21. -/
theorem ep_Q2_020_partial_21_0336_valid :
    mulPoly ep_Q2_020_coefficient_21_0336
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0337 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 337 for generator 21. -/
def ep_Q2_020_partial_21_0337 : Poly :=
[
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 21. -/
theorem ep_Q2_020_partial_21_0337_valid :
    mulPoly ep_Q2_020_coefficient_21_0337
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0338 : Poly :=
[
  term ((-49817343705886410 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)]
]

/-- Partial product 338 for generator 21. -/
def ep_Q2_020_partial_21_0338 : Poly :=
[
  term ((-99634687411772820 : Rat) / 28298395017400811) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((49817343705886410 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 21. -/
theorem ep_Q2_020_partial_21_0338_valid :
    mulPoly ep_Q2_020_coefficient_21_0338
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0339 : Poly :=
[
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 339 for generator 21. -/
def ep_Q2_020_partial_21_0339 : Poly :=
[
  term ((134377968022292784 : Rat) / 28298395017400811) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((-268755936044585568 : Rat) / 28298395017400811) [(1, 2), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 21. -/
theorem ep_Q2_020_partial_21_0339_valid :
    mulPoly ep_Q2_020_coefficient_21_0339
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0340 : Poly :=
[
  term ((57329867464971165 : Rat) / 28298395017400811) [(1, 2), (10, 1), (16, 1)]
]

/-- Partial product 340 for generator 21. -/
def ep_Q2_020_partial_21_0340 : Poly :=
[
  term ((-57329867464971165 : Rat) / 28298395017400811) [(1, 2), (10, 1), (16, 1)],
  term ((114659734929942330 : Rat) / 28298395017400811) [(1, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 21. -/
theorem ep_Q2_020_partial_21_0340_valid :
    mulPoly ep_Q2_020_coefficient_21_0340
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0341 : Poly :=
[
  term ((268755936044585568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 341 for generator 21. -/
def ep_Q2_020_partial_21_0341 : Poly :=
[
  term ((537511872089171136 : Rat) / 28298395017400811) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-268755936044585568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 21. -/
theorem ep_Q2_020_partial_21_0341_valid :
    mulPoly ep_Q2_020_coefficient_21_0341
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0342 : Poly :=
[
  term ((-67188984011146392 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 342 for generator 21. -/
def ep_Q2_020_partial_21_0342 : Poly :=
[
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 21. -/
theorem ep_Q2_020_partial_21_0342_valid :
    mulPoly ep_Q2_020_coefficient_21_0342
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0343 : Poly :=
[
  term ((-31247899218482724 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)]
]

/-- Partial product 343 for generator 21. -/
def ep_Q2_020_partial_21_0343 : Poly :=
[
  term ((-62495798436965448 : Rat) / 28298395017400811) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((31247899218482724 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 21. -/
theorem ep_Q2_020_partial_21_0343_valid :
    mulPoly ep_Q2_020_coefficient_21_0343
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0344 : Poly :=
[
  term ((57329867464971165 : Rat) / 56596790034801622) [(1, 2), (16, 1)]
]

/-- Partial product 344 for generator 21. -/
def ep_Q2_020_partial_21_0344 : Poly :=
[
  term ((57329867464971165 : Rat) / 28298395017400811) [(1, 2), (10, 1), (16, 1)],
  term ((-57329867464971165 : Rat) / 56596790034801622) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 21. -/
theorem ep_Q2_020_partial_21_0344_valid :
    mulPoly ep_Q2_020_coefficient_21_0344
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0345 : Poly :=
[
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 345 for generator 21. -/
def ep_Q2_020_partial_21_0345 : Poly :=
[
  term ((1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 21. -/
theorem ep_Q2_020_partial_21_0345_valid :
    mulPoly ep_Q2_020_coefficient_21_0345
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0346 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 21. -/
def ep_Q2_020_partial_21_0346 : Poly :=
[
  term ((-742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 21. -/
theorem ep_Q2_020_partial_21_0346_valid :
    mulPoly ep_Q2_020_coefficient_21_0346
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0347 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 347 for generator 21. -/
def ep_Q2_020_partial_21_0347 : Poly :=
[
  term ((742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 21. -/
theorem ep_Q2_020_partial_21_0347_valid :
    mulPoly ep_Q2_020_coefficient_21_0347
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0348 : Poly :=
[
  term ((-175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 21. -/
def ep_Q2_020_partial_21_0348 : Poly :=
[
  term ((-351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 21. -/
theorem ep_Q2_020_partial_21_0348_valid :
    mulPoly ep_Q2_020_coefficient_21_0348
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0349 : Poly :=
[
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 349 for generator 21. -/
def ep_Q2_020_partial_21_0349 : Poly :=
[
  term ((351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 21. -/
theorem ep_Q2_020_partial_21_0349_valid :
    mulPoly ep_Q2_020_coefficient_21_0349
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0350 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 21. -/
def ep_Q2_020_partial_21_0350 : Poly :=
[
  term ((3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 21. -/
theorem ep_Q2_020_partial_21_0350_valid :
    mulPoly ep_Q2_020_coefficient_21_0350
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0351 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 21. -/
def ep_Q2_020_partial_21_0351 : Poly :=
[
  term ((690727606191489504 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 21. -/
theorem ep_Q2_020_partial_21_0351_valid :
    mulPoly ep_Q2_020_coefficient_21_0351
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0352 : Poly :=
[
  term ((-979528844998953843 : Rat) / 56596790034801622) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 352 for generator 21. -/
def ep_Q2_020_partial_21_0352 : Poly :=
[
  term ((-979528844998953843 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 21. -/
theorem ep_Q2_020_partial_21_0352_valid :
    mulPoly ep_Q2_020_coefficient_21_0352
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0353 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 353 for generator 21. -/
def ep_Q2_020_partial_21_0353 : Poly :=
[
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 21. -/
theorem ep_Q2_020_partial_21_0353_valid :
    mulPoly ep_Q2_020_coefficient_21_0353
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0354 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 354 for generator 21. -/
def ep_Q2_020_partial_21_0354 : Poly :=
[
  term ((-690727606191489504 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 21. -/
theorem ep_Q2_020_partial_21_0354_valid :
    mulPoly ep_Q2_020_coefficient_21_0354
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0355 : Poly :=
[
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 21. -/
def ep_Q2_020_partial_21_0355 : Poly :=
[
  term ((979528844998953843 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 21. -/
theorem ep_Q2_020_partial_21_0355_valid :
    mulPoly ep_Q2_020_coefficient_21_0355
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0356 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 356 for generator 21. -/
def ep_Q2_020_partial_21_0356 : Poly :=
[
  term ((138528511220848320 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 21. -/
theorem ep_Q2_020_partial_21_0356_valid :
    mulPoly ep_Q2_020_coefficient_21_0356
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0357 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 21. -/
def ep_Q2_020_partial_21_0357 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 21. -/
theorem ep_Q2_020_partial_21_0357_valid :
    mulPoly ep_Q2_020_coefficient_21_0357
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0358 : Poly :=
[
  term ((541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 358 for generator 21. -/
def ep_Q2_020_partial_21_0358 : Poly :=
[
  term ((1082631401966977644 : Rat) / 28298395017400811) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 21. -/
theorem ep_Q2_020_partial_21_0358_valid :
    mulPoly ep_Q2_020_coefficient_21_0358
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0359 : Poly :=
[
  term ((-140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 21. -/
def ep_Q2_020_partial_21_0359 : Poly :=
[
  term ((-281272938854905152 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 21. -/
theorem ep_Q2_020_partial_21_0359_valid :
    mulPoly ep_Q2_020_coefficient_21_0359
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0360 : Poly :=
[
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 360 for generator 21. -/
def ep_Q2_020_partial_21_0360 : Poly :=
[
  term ((281272938854905152 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 21. -/
theorem ep_Q2_020_partial_21_0360_valid :
    mulPoly ep_Q2_020_coefficient_21_0360
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0361 : Poly :=
[
  term ((-160218385881654951 : Rat) / 975806724737959) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 361 for generator 21. -/
def ep_Q2_020_partial_21_0361 : Poly :=
[
  term ((-320436771763309902 : Rat) / 975806724737959) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 21. -/
theorem ep_Q2_020_partial_21_0361_valid :
    mulPoly ep_Q2_020_coefficient_21_0361
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0362 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 362 for generator 21. -/
def ep_Q2_020_partial_21_0362 : Poly :=
[
  term ((-155900428835400000 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 21. -/
theorem ep_Q2_020_partial_21_0362_valid :
    mulPoly ep_Q2_020_coefficient_21_0362
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0363 : Poly :=
[
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 21. -/
def ep_Q2_020_partial_21_0363 : Poly :=
[
  term ((-4163688479918734536 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 21. -/
theorem ep_Q2_020_partial_21_0363_valid :
    mulPoly ep_Q2_020_coefficient_21_0363
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0364 : Poly :=
[
  term ((200042314802096763 : Rat) / 56596790034801622) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 21. -/
def ep_Q2_020_partial_21_0364 : Poly :=
[
  term ((200042314802096763 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 21. -/
theorem ep_Q2_020_partial_21_0364_valid :
    mulPoly ep_Q2_020_coefficient_21_0364
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0365 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 365 for generator 21. -/
def ep_Q2_020_partial_21_0365 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 21. -/
theorem ep_Q2_020_partial_21_0365_valid :
    mulPoly ep_Q2_020_coefficient_21_0365
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0366 : Poly :=
[
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 21. -/
def ep_Q2_020_partial_21_0366 : Poly :=
[
  term ((320436771763309902 : Rat) / 975806724737959) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 21. -/
theorem ep_Q2_020_partial_21_0366_valid :
    mulPoly ep_Q2_020_coefficient_21_0366
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0367 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 21. -/
def ep_Q2_020_partial_21_0367 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 21. -/
theorem ep_Q2_020_partial_21_0367_valid :
    mulPoly ep_Q2_020_coefficient_21_0367
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0368 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 368 for generator 21. -/
def ep_Q2_020_partial_21_0368 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 21. -/
theorem ep_Q2_020_partial_21_0368_valid :
    mulPoly ep_Q2_020_coefficient_21_0368
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0369 : Poly :=
[
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 369 for generator 21. -/
def ep_Q2_020_partial_21_0369 : Poly :=
[
  term ((-200042314802096763 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 21. -/
theorem ep_Q2_020_partial_21_0369_valid :
    mulPoly ep_Q2_020_coefficient_21_0369
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0370 : Poly :=
[
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 370 for generator 21. -/
def ep_Q2_020_partial_21_0370 : Poly :=
[
  term ((4163688479918734536 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 21. -/
theorem ep_Q2_020_partial_21_0370_valid :
    mulPoly ep_Q2_020_coefficient_21_0370
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0371 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 371 for generator 21. -/
def ep_Q2_020_partial_21_0371 : Poly :=
[
  term ((742179327954631344 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 21. -/
theorem ep_Q2_020_partial_21_0371_valid :
    mulPoly ep_Q2_020_coefficient_21_0371
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0372 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 372 for generator 21. -/
def ep_Q2_020_partial_21_0372 : Poly :=
[
  term ((-742179327954631344 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 21. -/
theorem ep_Q2_020_partial_21_0372_valid :
    mulPoly ep_Q2_020_coefficient_21_0372
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0373 : Poly :=
[
  term ((198348295900969719 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 373 for generator 21. -/
def ep_Q2_020_partial_21_0373 : Poly :=
[
  term ((396696591801939438 : Rat) / 28298395017400811) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-198348295900969719 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 21. -/
theorem ep_Q2_020_partial_21_0373_valid :
    mulPoly ep_Q2_020_coefficient_21_0373
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0374 : Poly :=
[
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 21. -/
def ep_Q2_020_partial_21_0374 : Poly :=
[
  term ((135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 21. -/
theorem ep_Q2_020_partial_21_0374_valid :
    mulPoly ep_Q2_020_coefficient_21_0374
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0375 : Poly :=
[
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 375 for generator 21. -/
def ep_Q2_020_partial_21_0375 : Poly :=
[
  term ((-135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 21. -/
theorem ep_Q2_020_partial_21_0375_valid :
    mulPoly ep_Q2_020_coefficient_21_0375
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0376 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 21. -/
def ep_Q2_020_partial_21_0376 : Poly :=
[
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 21. -/
theorem ep_Q2_020_partial_21_0376_valid :
    mulPoly ep_Q2_020_coefficient_21_0376
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0377 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 21. -/
def ep_Q2_020_partial_21_0377 : Poly :=
[
  term ((-690727606191489504 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 21. -/
theorem ep_Q2_020_partial_21_0377_valid :
    mulPoly ep_Q2_020_coefficient_21_0377
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0378 : Poly :=
[
  term ((-80424576917094150 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 378 for generator 21. -/
def ep_Q2_020_partial_21_0378 : Poly :=
[
  term ((-160849153834188300 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 21. -/
theorem ep_Q2_020_partial_21_0378_valid :
    mulPoly ep_Q2_020_coefficient_21_0378
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0379 : Poly :=
[
  term ((30834355542465789 : Rat) / 975806724737959) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 379 for generator 21. -/
def ep_Q2_020_partial_21_0379 : Poly :=
[
  term ((61668711084931578 : Rat) / 975806724737959) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 21. -/
theorem ep_Q2_020_partial_21_0379_valid :
    mulPoly ep_Q2_020_coefficient_21_0379
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0380 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 380 for generator 21. -/
def ep_Q2_020_partial_21_0380 : Poly :=
[
  term ((3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 21. -/
theorem ep_Q2_020_partial_21_0380_valid :
    mulPoly ep_Q2_020_coefficient_21_0380
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0381 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 381 for generator 21. -/
def ep_Q2_020_partial_21_0381 : Poly :=
[
  term ((690727606191489504 : Rat) / 28298395017400811) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 21. -/
theorem ep_Q2_020_partial_21_0381_valid :
    mulPoly ep_Q2_020_coefficient_21_0381
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0382 : Poly :=
[
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 21. -/
def ep_Q2_020_partial_21_0382 : Poly :=
[
  term ((-61668711084931578 : Rat) / 975806724737959) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 21. -/
theorem ep_Q2_020_partial_21_0382_valid :
    mulPoly ep_Q2_020_coefficient_21_0382
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0383 : Poly :=
[
  term ((-659239419967364391 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 383 for generator 21. -/
def ep_Q2_020_partial_21_0383 : Poly :=
[
  term ((-1318478839934728782 : Rat) / 28298395017400811) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((659239419967364391 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 21. -/
theorem ep_Q2_020_partial_21_0383_valid :
    mulPoly ep_Q2_020_coefficient_21_0383
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0384 : Poly :=
[
  term ((-228676022214586338 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)]
]

/-- Partial product 384 for generator 21. -/
def ep_Q2_020_partial_21_0384 : Poly :=
[
  term ((-457352044429172676 : Rat) / 28298395017400811) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((228676022214586338 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 21. -/
theorem ep_Q2_020_partial_21_0384_valid :
    mulPoly ep_Q2_020_coefficient_21_0384
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0385 : Poly :=
[
  term ((168229351638173781 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)]
]

/-- Partial product 385 for generator 21. -/
def ep_Q2_020_partial_21_0385 : Poly :=
[
  term ((336458703276347562 : Rat) / 28298395017400811) [(4, 2), (10, 1), (14, 1), (16, 1)],
  term ((-168229351638173781 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 21. -/
theorem ep_Q2_020_partial_21_0385_valid :
    mulPoly ep_Q2_020_coefficient_21_0385
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0386 : Poly :=
[
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 386 for generator 21. -/
def ep_Q2_020_partial_21_0386 : Poly :=
[
  term ((-5772021300868680 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 21. -/
theorem ep_Q2_020_partial_21_0386_valid :
    mulPoly ep_Q2_020_coefficient_21_0386
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0387 : Poly :=
[
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 387 for generator 21. -/
def ep_Q2_020_partial_21_0387 : Poly :=
[
  term ((151695815324587776 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-75847907662293888 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 21. -/
theorem ep_Q2_020_partial_21_0387_valid :
    mulPoly ep_Q2_020_coefficient_21_0387
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0388 : Poly :=
[
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 21. -/
def ep_Q2_020_partial_21_0388 : Poly :=
[
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 21. -/
theorem ep_Q2_020_partial_21_0388_valid :
    mulPoly ep_Q2_020_coefficient_21_0388
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0389 : Poly :=
[
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 389 for generator 21. -/
def ep_Q2_020_partial_21_0389 : Poly :=
[
  term ((-5772021300868680 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 21. -/
theorem ep_Q2_020_partial_21_0389_valid :
    mulPoly ep_Q2_020_coefficient_21_0389
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0390 : Poly :=
[
  term ((49008008613254526 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 390 for generator 21. -/
def ep_Q2_020_partial_21_0390 : Poly :=
[
  term ((98016017226509052 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-49008008613254526 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 21. -/
theorem ep_Q2_020_partial_21_0390_valid :
    mulPoly ep_Q2_020_coefficient_21_0390
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0391 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 21. -/
def ep_Q2_020_partial_21_0391 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 21. -/
theorem ep_Q2_020_partial_21_0391_valid :
    mulPoly ep_Q2_020_coefficient_21_0391
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0392 : Poly :=
[
  term ((3842578930494912 : Rat) / 28298395017400811) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 21. -/
def ep_Q2_020_partial_21_0392 : Poly :=
[
  term ((7685157860989824 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3842578930494912 : Rat) / 28298395017400811) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 21. -/
theorem ep_Q2_020_partial_21_0392_valid :
    mulPoly ep_Q2_020_coefficient_21_0392
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0393 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 21. -/
def ep_Q2_020_partial_21_0393 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 21. -/
theorem ep_Q2_020_partial_21_0393_valid :
    mulPoly ep_Q2_020_coefficient_21_0393
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0394 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 394 for generator 21. -/
def ep_Q2_020_partial_21_0394 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 21. -/
theorem ep_Q2_020_partial_21_0394_valid :
    mulPoly ep_Q2_020_coefficient_21_0394
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0395 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 395 for generator 21. -/
def ep_Q2_020_partial_21_0395 : Poly :=
[
  term ((138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 21. -/
theorem ep_Q2_020_partial_21_0395_valid :
    mulPoly ep_Q2_020_coefficient_21_0395
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0396 : Poly :=
[
  term ((-36363734195472684 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 396 for generator 21. -/
def ep_Q2_020_partial_21_0396 : Poly :=
[
  term ((-72727468390945368 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((36363734195472684 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 21. -/
theorem ep_Q2_020_partial_21_0396_valid :
    mulPoly ep_Q2_020_coefficient_21_0396
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0397 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 397 for generator 21. -/
def ep_Q2_020_partial_21_0397 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 21. -/
theorem ep_Q2_020_partial_21_0397_valid :
    mulPoly ep_Q2_020_coefficient_21_0397
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0398 : Poly :=
[
  term ((-6926425561042416 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 21. -/
def ep_Q2_020_partial_21_0398 : Poly :=
[
  term ((6926425561042416 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 21. -/
theorem ep_Q2_020_partial_21_0398_valid :
    mulPoly ep_Q2_020_coefficient_21_0398
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0399 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 399 for generator 21. -/
def ep_Q2_020_partial_21_0399 : Poly :=
[
  term ((152381362342933152 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 21. -/
theorem ep_Q2_020_partial_21_0399_valid :
    mulPoly ep_Q2_020_coefficient_21_0399
        ep_Q2_020_generator_21_0300_0399 =
      ep_Q2_020_partial_21_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_21_0300_0399 : List Poly :=
[
  ep_Q2_020_partial_21_0300,
  ep_Q2_020_partial_21_0301,
  ep_Q2_020_partial_21_0302,
  ep_Q2_020_partial_21_0303,
  ep_Q2_020_partial_21_0304,
  ep_Q2_020_partial_21_0305,
  ep_Q2_020_partial_21_0306,
  ep_Q2_020_partial_21_0307,
  ep_Q2_020_partial_21_0308,
  ep_Q2_020_partial_21_0309,
  ep_Q2_020_partial_21_0310,
  ep_Q2_020_partial_21_0311,
  ep_Q2_020_partial_21_0312,
  ep_Q2_020_partial_21_0313,
  ep_Q2_020_partial_21_0314,
  ep_Q2_020_partial_21_0315,
  ep_Q2_020_partial_21_0316,
  ep_Q2_020_partial_21_0317,
  ep_Q2_020_partial_21_0318,
  ep_Q2_020_partial_21_0319,
  ep_Q2_020_partial_21_0320,
  ep_Q2_020_partial_21_0321,
  ep_Q2_020_partial_21_0322,
  ep_Q2_020_partial_21_0323,
  ep_Q2_020_partial_21_0324,
  ep_Q2_020_partial_21_0325,
  ep_Q2_020_partial_21_0326,
  ep_Q2_020_partial_21_0327,
  ep_Q2_020_partial_21_0328,
  ep_Q2_020_partial_21_0329,
  ep_Q2_020_partial_21_0330,
  ep_Q2_020_partial_21_0331,
  ep_Q2_020_partial_21_0332,
  ep_Q2_020_partial_21_0333,
  ep_Q2_020_partial_21_0334,
  ep_Q2_020_partial_21_0335,
  ep_Q2_020_partial_21_0336,
  ep_Q2_020_partial_21_0337,
  ep_Q2_020_partial_21_0338,
  ep_Q2_020_partial_21_0339,
  ep_Q2_020_partial_21_0340,
  ep_Q2_020_partial_21_0341,
  ep_Q2_020_partial_21_0342,
  ep_Q2_020_partial_21_0343,
  ep_Q2_020_partial_21_0344,
  ep_Q2_020_partial_21_0345,
  ep_Q2_020_partial_21_0346,
  ep_Q2_020_partial_21_0347,
  ep_Q2_020_partial_21_0348,
  ep_Q2_020_partial_21_0349,
  ep_Q2_020_partial_21_0350,
  ep_Q2_020_partial_21_0351,
  ep_Q2_020_partial_21_0352,
  ep_Q2_020_partial_21_0353,
  ep_Q2_020_partial_21_0354,
  ep_Q2_020_partial_21_0355,
  ep_Q2_020_partial_21_0356,
  ep_Q2_020_partial_21_0357,
  ep_Q2_020_partial_21_0358,
  ep_Q2_020_partial_21_0359,
  ep_Q2_020_partial_21_0360,
  ep_Q2_020_partial_21_0361,
  ep_Q2_020_partial_21_0362,
  ep_Q2_020_partial_21_0363,
  ep_Q2_020_partial_21_0364,
  ep_Q2_020_partial_21_0365,
  ep_Q2_020_partial_21_0366,
  ep_Q2_020_partial_21_0367,
  ep_Q2_020_partial_21_0368,
  ep_Q2_020_partial_21_0369,
  ep_Q2_020_partial_21_0370,
  ep_Q2_020_partial_21_0371,
  ep_Q2_020_partial_21_0372,
  ep_Q2_020_partial_21_0373,
  ep_Q2_020_partial_21_0374,
  ep_Q2_020_partial_21_0375,
  ep_Q2_020_partial_21_0376,
  ep_Q2_020_partial_21_0377,
  ep_Q2_020_partial_21_0378,
  ep_Q2_020_partial_21_0379,
  ep_Q2_020_partial_21_0380,
  ep_Q2_020_partial_21_0381,
  ep_Q2_020_partial_21_0382,
  ep_Q2_020_partial_21_0383,
  ep_Q2_020_partial_21_0384,
  ep_Q2_020_partial_21_0385,
  ep_Q2_020_partial_21_0386,
  ep_Q2_020_partial_21_0387,
  ep_Q2_020_partial_21_0388,
  ep_Q2_020_partial_21_0389,
  ep_Q2_020_partial_21_0390,
  ep_Q2_020_partial_21_0391,
  ep_Q2_020_partial_21_0392,
  ep_Q2_020_partial_21_0393,
  ep_Q2_020_partial_21_0394,
  ep_Q2_020_partial_21_0395,
  ep_Q2_020_partial_21_0396,
  ep_Q2_020_partial_21_0397,
  ep_Q2_020_partial_21_0398,
  ep_Q2_020_partial_21_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_21_0300_0399 : Poly :=
[
  term ((2153304459397091295 : Rat) / 56596790034801622) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-119238265677792 : Rat) / 1230365000756557) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((914447652962322759 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2153304459397091295 : Rat) / 113193580069603244) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-914447652962322759 : Rat) / 56596790034801622) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((118610657023559616 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-210361688935965852 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-95107117308006024 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((105180844467982926 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((23776779327001506 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)],
  term ((-62360171534160000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2861718376267008 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-170238687220315394 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((656122529112730752 : Rat) / 28298395017400811) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3490649503886787285 : Rat) / 56596790034801622) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 975806724737959) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-885755987722196775 : Rat) / 28298395017400811) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8585155128801024 : Rat) / 1230365000756557) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1178820753326696556 : Rat) / 28298395017400811) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((126019513308615000 : Rat) / 28298395017400811) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-413864531057025384 : Rat) / 28298395017400811) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-3696386236011552 : Rat) / 1230365000756557) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1043334824680680 : Rat) / 1230365000756557) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((164030632278182688 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((85119343610157697 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)],
  term ((-328061264556365376 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3364629990578172285 : Rat) / 113193580069603244) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((103466132764256346 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)],
  term ((928264429436329623 : Rat) / 56596790034801622) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((260833706170170 : Rat) / 1230365000756557) [(1, 1), (15, 1), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 1), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (10, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-99634687411772820 : Rat) / 28298395017400811) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((49817343705886410 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)],
  term ((537511872089171136 : Rat) / 28298395017400811) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-62495798436965448 : Rat) / 28298395017400811) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-268755936044585568 : Rat) / 28298395017400811) [(1, 2), (10, 2), (12, 1), (16, 1)],
  term ((114659734929942330 : Rat) / 28298395017400811) [(1, 2), (10, 2), (16, 1)],
  term ((-268755936044585568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((31247899218482724 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((-57329867464971165 : Rat) / 56596790034801622) [(1, 2), (16, 1)],
  term ((1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1082631401966977644 : Rat) / 28298395017400811) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-281272938854905152 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((281272938854905152 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-320436771763309902 : Rat) / 975806724737959) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4163688479918734536 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((320436771763309902 : Rat) / 975806724737959) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((4163688479918734536 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((396696591801939438 : Rat) / 28298395017400811) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-198348295900969719 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-160849153834188300 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((61668711084931578 : Rat) / 975806724737959) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61668711084931578 : Rat) / 975806724737959) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1318478839934728782 : Rat) / 28298395017400811) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-457352044429172676 : Rat) / 28298395017400811) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((659239419967364391 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((228676022214586338 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)],
  term ((336458703276347562 : Rat) / 28298395017400811) [(4, 2), (10, 1), (14, 1), (16, 1)],
  term ((-168229351638173781 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((151695815324587776 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-75847907662293888 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((98016017226509052 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11362512431876820 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-49008008613254526 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3842578930494912 : Rat) / 28298395017400811) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-72727468390945368 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((36363734195472684 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((152381362342933152 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 300 through 399. -/
theorem ep_Q2_020_block_21_0300_0399_valid :
    checkProductSumEq ep_Q2_020_partials_21_0300_0399
      ep_Q2_020_block_21_0300_0399 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
