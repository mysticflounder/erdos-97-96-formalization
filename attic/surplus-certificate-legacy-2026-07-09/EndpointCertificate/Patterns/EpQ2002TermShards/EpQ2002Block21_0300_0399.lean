/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 21:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_21_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0300 : Poly :=
[
  term ((-7953070087928717772846962124288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 2)]
]

/-- Partial product 300 for generator 21. -/
def ep_Q2_002_partial_21_0300 : Poly :=
[
  term ((-15906140175857435545693924248576 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((7953070087928717772846962124288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 21. -/
theorem ep_Q2_002_partial_21_0300_valid :
    mulPoly ep_Q2_002_coefficient_21_0300
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0301 : Poly :=
[
  term ((-89110093170619461794145469410744 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 301 for generator 21. -/
def ep_Q2_002_partial_21_0301 : Poly :=
[
  term ((89110093170619461794145469410744 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1)],
  term ((-178220186341238923588290938821488 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 21. -/
theorem ep_Q2_002_partial_21_0301_valid :
    mulPoly ep_Q2_002_coefficient_21_0301
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0302 : Poly :=
[
  term ((-54273873978649311146752758913152 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 302 for generator 21. -/
def ep_Q2_002_partial_21_0302 : Poly :=
[
  term ((54273873978649311146752758913152 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-108547747957298622293505517826304 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 21. -/
theorem ep_Q2_002_partial_21_0302_valid :
    mulPoly ep_Q2_002_coefficient_21_0302
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0303 : Poly :=
[
  term ((103677442871319360869359978814208 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 303 for generator 21. -/
def ep_Q2_002_partial_21_0303 : Poly :=
[
  term ((-103677442871319360869359978814208 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((207354885742638721738719957628416 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 21. -/
theorem ep_Q2_002_partial_21_0303_valid :
    mulPoly ep_Q2_002_coefficient_21_0303
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0304 : Poly :=
[
  term ((-135524059278839796207267727288968119162328 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 304 for generator 21. -/
def ep_Q2_002_partial_21_0304 : Poly :=
[
  term ((135524059278839796207267727288968119162328 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-271048118557679592414535454577936238324656 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 21. -/
theorem ep_Q2_002_partial_21_0304_valid :
    mulPoly ep_Q2_002_coefficient_21_0304
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0305 : Poly :=
[
  term ((31296046146 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 21. -/
def ep_Q2_002_partial_21_0305 : Poly :=
[
  term ((-31296046146 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((62592092292 : Rat) / 7401317245) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 21. -/
theorem ep_Q2_002_partial_21_0305_valid :
    mulPoly ep_Q2_002_coefficient_21_0305
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0306 : Poly :=
[
  term ((204332948706653892901440100648928 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 306 for generator 21. -/
def ep_Q2_002_partial_21_0306 : Poly :=
[
  term ((-204332948706653892901440100648928 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (13, 1)],
  term ((408665897413307785802880201297856 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 21. -/
theorem ep_Q2_002_partial_21_0306_valid :
    mulPoly ep_Q2_002_coefficient_21_0306
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0307 : Poly :=
[
  term ((-19562329798618292751202621425298760275146 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 307 for generator 21. -/
def ep_Q2_002_partial_21_0307 : Poly :=
[
  term ((19562329798618292751202621425298760275146 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (15, 1)],
  term ((-39124659597236585502405242850597520550292 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 21. -/
theorem ep_Q2_002_partial_21_0307_valid :
    mulPoly ep_Q2_002_coefficient_21_0307
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0308 : Poly :=
[
  term ((114070604819 : Rat) / 14802634490) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 21. -/
def ep_Q2_002_partial_21_0308 : Poly :=
[
  term ((-114070604819 : Rat) / 14802634490) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((114070604819 : Rat) / 7401317245) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 21. -/
theorem ep_Q2_002_partial_21_0308_valid :
    mulPoly ep_Q2_002_coefficient_21_0308
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0309 : Poly :=
[
  term ((-44555046585309730897072734705372 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

/-- Partial product 309 for generator 21. -/
def ep_Q2_002_partial_21_0309 : Poly :=
[
  term ((-89110093170619461794145469410744 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1)],
  term ((44555046585309730897072734705372 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 21. -/
theorem ep_Q2_002_partial_21_0309_valid :
    mulPoly ep_Q2_002_coefficient_21_0309
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0310 : Poly :=
[
  term ((-23799774455223943760317190578340 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 310 for generator 21. -/
def ep_Q2_002_partial_21_0310 : Poly :=
[
  term ((-47599548910447887520634381156680 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((23799774455223943760317190578340 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 21. -/
theorem ep_Q2_002_partial_21_0310_valid :
    mulPoly ep_Q2_002_coefficient_21_0310
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0311 : Poly :=
[
  term ((74146457487101695326805049678496 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2)]
]

/-- Partial product 311 for generator 21. -/
def ep_Q2_002_partial_21_0311 : Poly :=
[
  term ((148292914974203390653610099356992 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((-74146457487101695326805049678496 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 21. -/
theorem ep_Q2_002_partial_21_0311_valid :
    mulPoly ep_Q2_002_coefficient_21_0311
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0312 : Poly :=
[
  term ((30375166391618512872966222592560 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 312 for generator 21. -/
def ep_Q2_002_partial_21_0312 : Poly :=
[
  term ((60750332783237025745932445185120 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-30375166391618512872966222592560 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 21. -/
theorem ep_Q2_002_partial_21_0312_valid :
    mulPoly ep_Q2_002_coefficient_21_0312
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0313 : Poly :=
[
  term ((-922918248779845976798580113620851463149416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 313 for generator 21. -/
def ep_Q2_002_partial_21_0313 : Poly :=
[
  term ((-1845836497559691953597160227241702926298832 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((922918248779845976798580113620851463149416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 21. -/
theorem ep_Q2_002_partial_21_0313_valid :
    mulPoly ep_Q2_002_coefficient_21_0313
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0314 : Poly :=
[
  term ((-17382212223 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 21. -/
def ep_Q2_002_partial_21_0314 : Poly :=
[
  term ((-34764424446 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((17382212223 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 21. -/
theorem ep_Q2_002_partial_21_0314_valid :
    mulPoly ep_Q2_002_coefficient_21_0314
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0315 : Poly :=
[
  term ((-142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 315 for generator 21. -/
def ep_Q2_002_partial_21_0315 : Poly :=
[
  term ((-284798296847261140404859948596480 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 21. -/
theorem ep_Q2_002_partial_21_0315_valid :
    mulPoly ep_Q2_002_coefficient_21_0315
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0316 : Poly :=
[
  term ((73313573855668433423487350776005577856208 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 316 for generator 21. -/
def ep_Q2_002_partial_21_0316 : Poly :=
[
  term ((146627147711336866846974701552011155712416 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-73313573855668433423487350776005577856208 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 21. -/
theorem ep_Q2_002_partial_21_0316_valid :
    mulPoly ep_Q2_002_coefficient_21_0316
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0317 : Poly :=
[
  term ((-21924681348 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 21. -/
def ep_Q2_002_partial_21_0317 : Poly :=
[
  term ((-43849362696 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((21924681348 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 21. -/
theorem ep_Q2_002_partial_21_0317_valid :
    mulPoly ep_Q2_002_coefficient_21_0317
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0318 : Poly :=
[
  term ((102166474353326946450720050324464 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 318 for generator 21. -/
def ep_Q2_002_partial_21_0318 : Poly :=
[
  term ((204332948706653892901440100648928 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (13, 1)],
  term ((-102166474353326946450720050324464 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 21. -/
theorem ep_Q2_002_partial_21_0318_valid :
    mulPoly ep_Q2_002_coefficient_21_0318
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0319 : Poly :=
[
  term ((-9781164899309146375601310712649380137573 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)]
]

/-- Partial product 319 for generator 21. -/
def ep_Q2_002_partial_21_0319 : Poly :=
[
  term ((-19562329798618292751202621425298760275146 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (15, 1)],
  term ((9781164899309146375601310712649380137573 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 21. -/
theorem ep_Q2_002_partial_21_0319_valid :
    mulPoly ep_Q2_002_coefficient_21_0319
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0320 : Poly :=
[
  term ((114070604819 : Rat) / 29605268980) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 21. -/
def ep_Q2_002_partial_21_0320 : Poly :=
[
  term ((114070604819 : Rat) / 14802634490) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114070604819 : Rat) / 29605268980) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 21. -/
theorem ep_Q2_002_partial_21_0320_valid :
    mulPoly ep_Q2_002_coefficient_21_0320
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0321 : Poly :=
[
  term ((3151397716081959890673170233936 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 321 for generator 21. -/
def ep_Q2_002_partial_21_0321 : Poly :=
[
  term ((-3151397716081959890673170233936 : Rat) / 1273790490336191187829975377157) [(1, 2)],
  term ((6302795432163919781346340467872 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 21. -/
theorem ep_Q2_002_partial_21_0321_valid :
    mulPoly ep_Q2_002_coefficient_21_0321
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0322 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (7, 1)]
]

/-- Partial product 322 for generator 21. -/
def ep_Q2_002_partial_21_0322 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 21. -/
theorem ep_Q2_002_partial_21_0322_valid :
    mulPoly ep_Q2_002_coefficient_21_0322
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0323 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (15, 1)]
]

/-- Partial product 323 for generator 21. -/
def ep_Q2_002_partial_21_0323 : Poly :=
[
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 21. -/
theorem ep_Q2_002_partial_21_0323_valid :
    mulPoly ep_Q2_002_coefficient_21_0323
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0324 : Poly :=
[
  term ((-751494261625585066016064357824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)]
]

/-- Partial product 324 for generator 21. -/
def ep_Q2_002_partial_21_0324 : Poly :=
[
  term ((751494261625585066016064357824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)],
  term ((-1502988523251170132032128715648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 21. -/
theorem ep_Q2_002_partial_21_0324_valid :
    mulPoly ep_Q2_002_coefficient_21_0324
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0325 : Poly :=
[
  term ((-254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1)]
]

/-- Partial product 325 for generator 21. -/
def ep_Q2_002_partial_21_0325 : Poly :=
[
  term ((254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1)],
  term ((-509196272315970129976896372480 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 21. -/
theorem ep_Q2_002_partial_21_0325_valid :
    mulPoly ep_Q2_002_coefficient_21_0325
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0326 : Poly :=
[
  term ((-1502988523251170132032128715648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 1)]
]

/-- Partial product 326 for generator 21. -/
def ep_Q2_002_partial_21_0326 : Poly :=
[
  term ((1502988523251170132032128715648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 1)],
  term ((-3005977046502340264064257431296 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 21. -/
theorem ep_Q2_002_partial_21_0326_valid :
    mulPoly ep_Q2_002_coefficient_21_0326
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0327 : Poly :=
[
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1)]
]

/-- Partial product 327 for generator 21. -/
def ep_Q2_002_partial_21_0327 : Poly :=
[
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 1), (12, 1)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 21. -/
theorem ep_Q2_002_partial_21_0327_valid :
    mulPoly ep_Q2_002_coefficient_21_0327
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0328 : Poly :=
[
  term ((-3745136527408889504497753414272 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1)]
]

/-- Partial product 328 for generator 21. -/
def ep_Q2_002_partial_21_0328 : Poly :=
[
  term ((3745136527408889504497753414272 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1)],
  term ((-7490273054817779008995506828544 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 21. -/
theorem ep_Q2_002_partial_21_0328_valid :
    mulPoly ep_Q2_002_coefficient_21_0328
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0329 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 329 for generator 21. -/
def ep_Q2_002_partial_21_0329 : Poly :=
[
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 21. -/
theorem ep_Q2_002_partial_21_0329_valid :
    mulPoly ep_Q2_002_coefficient_21_0329
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0330 : Poly :=
[
  term ((4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 1)]
]

/-- Partial product 330 for generator 21. -/
def ep_Q2_002_partial_21_0330 : Poly :=
[
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 1)],
  term ((8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 21. -/
theorem ep_Q2_002_partial_21_0330_valid :
    mulPoly ep_Q2_002_coefficient_21_0330
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0331 : Poly :=
[
  term ((-1777927323881560804755665493504 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 1)]
]

/-- Partial product 331 for generator 21. -/
def ep_Q2_002_partial_21_0331 : Poly :=
[
  term ((1777927323881560804755665493504 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 1)],
  term ((-3555854647763121609511330987008 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 21. -/
theorem ep_Q2_002_partial_21_0331_valid :
    mulPoly ep_Q2_002_coefficient_21_0331
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0332 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 332 for generator 21. -/
def ep_Q2_002_partial_21_0332 : Poly :=
[
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 21. -/
theorem ep_Q2_002_partial_21_0332_valid :
    mulPoly ep_Q2_002_coefficient_21_0332
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0333 : Poly :=
[
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1)]
]

/-- Partial product 333 for generator 21. -/
def ep_Q2_002_partial_21_0333 : Poly :=
[
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 1), (12, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 21. -/
theorem ep_Q2_002_partial_21_0333_valid :
    mulPoly ep_Q2_002_coefficient_21_0333
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0334 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 334 for generator 21. -/
def ep_Q2_002_partial_21_0334 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 21. -/
theorem ep_Q2_002_partial_21_0334_valid :
    mulPoly ep_Q2_002_coefficient_21_0334
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0335 : Poly :=
[
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (15, 1)]
]

/-- Partial product 335 for generator 21. -/
def ep_Q2_002_partial_21_0335 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 21. -/
theorem ep_Q2_002_partial_21_0335_valid :
    mulPoly ep_Q2_002_coefficient_21_0335
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0336 : Poly :=
[
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2)]
]

/-- Partial product 336 for generator 21. -/
def ep_Q2_002_partial_21_0336 : Poly :=
[
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 21. -/
theorem ep_Q2_002_partial_21_0336_valid :
    mulPoly ep_Q2_002_coefficient_21_0336
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0337 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2), (10, 1)]
]

/-- Partial product 337 for generator 21. -/
def ep_Q2_002_partial_21_0337 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2), (10, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 21. -/
theorem ep_Q2_002_partial_21_0337_valid :
    mulPoly ep_Q2_002_coefficient_21_0337
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0338 : Poly :=
[
  term ((-772044595670761740453662974824 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1)]
]

/-- Partial product 338 for generator 21. -/
def ep_Q2_002_partial_21_0338 : Poly :=
[
  term ((772044595670761740453662974824 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1)],
  term ((-1544089191341523480907325949648 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 21. -/
theorem ep_Q2_002_partial_21_0338_valid :
    mulPoly ep_Q2_002_coefficient_21_0338
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0339 : Poly :=
[
  term ((-2191509038392027947026439527664 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1)]
]

/-- Partial product 339 for generator 21. -/
def ep_Q2_002_partial_21_0339 : Poly :=
[
  term ((2191509038392027947026439527664 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1)],
  term ((-4383018076784055894052879055328 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 21. -/
theorem ep_Q2_002_partial_21_0339_valid :
    mulPoly ep_Q2_002_coefficient_21_0339
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0340 : Poly :=
[
  term ((3428976111848244903309752790048 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1)]
]

/-- Partial product 340 for generator 21. -/
def ep_Q2_002_partial_21_0340 : Poly :=
[
  term ((6857952223696489806619505580096 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((-3428976111848244903309752790048 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 21. -/
theorem ep_Q2_002_partial_21_0340_valid :
    mulPoly ep_Q2_002_coefficient_21_0340
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0341 : Poly :=
[
  term ((86731087721437362794829660480 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 2)]
]

/-- Partial product 341 for generator 21. -/
def ep_Q2_002_partial_21_0341 : Poly :=
[
  term ((-86731087721437362794829660480 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 2)],
  term ((173462175442874725589659320960 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 21. -/
theorem ep_Q2_002_partial_21_0341_valid :
    mulPoly ep_Q2_002_coefficient_21_0341
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0342 : Poly :=
[
  term ((6302795432163919781346340467872 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1)]
]

/-- Partial product 342 for generator 21. -/
def ep_Q2_002_partial_21_0342 : Poly :=
[
  term ((-6302795432163919781346340467872 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1)],
  term ((12605590864327839562692680935744 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 21. -/
theorem ep_Q2_002_partial_21_0342_valid :
    mulPoly ep_Q2_002_coefficient_21_0342
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0343 : Poly :=
[
  term ((3838814581233740016447748056576 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1), (12, 1)]
]

/-- Partial product 343 for generator 21. -/
def ep_Q2_002_partial_21_0343 : Poly :=
[
  term ((-3838814581233740016447748056576 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1), (12, 1)],
  term ((7677629162467480032895496113152 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 21. -/
theorem ep_Q2_002_partial_21_0343_valid :
    mulPoly ep_Q2_002_coefficient_21_0343
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0344 : Poly :=
[
  term ((1143300336247487672047813636272 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 344 for generator 21. -/
def ep_Q2_002_partial_21_0344 : Poly :=
[
  term ((2286600672494975344095627272544 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1), (12, 1)],
  term ((-1143300336247487672047813636272 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 21. -/
theorem ep_Q2_002_partial_21_0344_valid :
    mulPoly ep_Q2_002_coefficient_21_0344
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0345 : Poly :=
[
  term ((-5348354627174550319002376383360 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2)]
]

/-- Partial product 345 for generator 21. -/
def ep_Q2_002_partial_21_0345 : Poly :=
[
  term ((-10696709254349100638004752766720 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1), (12, 2)],
  term ((5348354627174550319002376383360 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 21. -/
theorem ep_Q2_002_partial_21_0345_valid :
    mulPoly ep_Q2_002_coefficient_21_0345
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0346 : Poly :=
[
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1)]
]

/-- Partial product 346 for generator 21. -/
def ep_Q2_002_partial_21_0346 : Poly :=
[
  term ((-60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1)],
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 21. -/
theorem ep_Q2_002_partial_21_0346_valid :
    mulPoly ep_Q2_002_coefficient_21_0346
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0347 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 347 for generator 21. -/
def ep_Q2_002_partial_21_0347 : Poly :=
[
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 21. -/
theorem ep_Q2_002_partial_21_0347_valid :
    mulPoly ep_Q2_002_coefficient_21_0347
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0348 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 348 for generator 21. -/
def ep_Q2_002_partial_21_0348 : Poly :=
[
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 21. -/
theorem ep_Q2_002_partial_21_0348_valid :
    mulPoly ep_Q2_002_coefficient_21_0348
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0349 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 349 for generator 21. -/
def ep_Q2_002_partial_21_0349 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 21. -/
theorem ep_Q2_002_partial_21_0349_valid :
    mulPoly ep_Q2_002_coefficient_21_0349
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0350 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 21. -/
def ep_Q2_002_partial_21_0350 : Poly :=
[
  term ((-150050235908 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 21. -/
theorem ep_Q2_002_partial_21_0350_valid :
    mulPoly ep_Q2_002_coefficient_21_0350
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0351 : Poly :=
[
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 1)]
]

/-- Partial product 351 for generator 21. -/
def ep_Q2_002_partial_21_0351 : Poly :=
[
  term ((113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1)],
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 21. -/
theorem ep_Q2_002_partial_21_0351_valid :
    mulPoly ep_Q2_002_coefficient_21_0351
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0352 : Poly :=
[
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 1)]
]

/-- Partial product 352 for generator 21. -/
def ep_Q2_002_partial_21_0352 : Poly :=
[
  term ((1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1)],
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 21. -/
theorem ep_Q2_002_partial_21_0352_valid :
    mulPoly ep_Q2_002_coefficient_21_0352
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0353 : Poly :=
[
  term ((38126575709 : Rat) / 6343986210) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 21. -/
def ep_Q2_002_partial_21_0353 : Poly :=
[
  term ((38126575709 : Rat) / 3171993105) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-38126575709 : Rat) / 6343986210) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 21. -/
theorem ep_Q2_002_partial_21_0353_valid :
    mulPoly ep_Q2_002_coefficient_21_0353
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0354 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 354 for generator 21. -/
def ep_Q2_002_partial_21_0354 : Poly :=
[
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 21. -/
theorem ep_Q2_002_partial_21_0354_valid :
    mulPoly ep_Q2_002_coefficient_21_0354
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0355 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 355 for generator 21. -/
def ep_Q2_002_partial_21_0355 : Poly :=
[
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 21. -/
theorem ep_Q2_002_partial_21_0355_valid :
    mulPoly ep_Q2_002_coefficient_21_0355
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0356 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 356 for generator 21. -/
def ep_Q2_002_partial_21_0356 : Poly :=
[
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 21. -/
theorem ep_Q2_002_partial_21_0356_valid :
    mulPoly ep_Q2_002_coefficient_21_0356
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0357 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 21. -/
def ep_Q2_002_partial_21_0357 : Poly :=
[
  term ((-381790635174 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 21. -/
theorem ep_Q2_002_partial_21_0357_valid :
    mulPoly ep_Q2_002_coefficient_21_0357
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0358 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 358 for generator 21. -/
def ep_Q2_002_partial_21_0358 : Poly :=
[
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 21. -/
theorem ep_Q2_002_partial_21_0358_valid :
    mulPoly ep_Q2_002_coefficient_21_0358
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0359 : Poly :=
[
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 359 for generator 21. -/
def ep_Q2_002_partial_21_0359 : Poly :=
[
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 21. -/
theorem ep_Q2_002_partial_21_0359_valid :
    mulPoly ep_Q2_002_coefficient_21_0359
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0360 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

/-- Partial product 360 for generator 21. -/
def ep_Q2_002_partial_21_0360 : Poly :=
[
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 21. -/
theorem ep_Q2_002_partial_21_0360_valid :
    mulPoly ep_Q2_002_coefficient_21_0360
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0361 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 361 for generator 21. -/
def ep_Q2_002_partial_21_0361 : Poly :=
[
  term ((15565557134 : Rat) / 4440790347) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 21. -/
theorem ep_Q2_002_partial_21_0361_valid :
    mulPoly ep_Q2_002_coefficient_21_0361
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0362 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 362 for generator 21. -/
def ep_Q2_002_partial_21_0362 : Poly :=
[
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 21. -/
theorem ep_Q2_002_partial_21_0362_valid :
    mulPoly ep_Q2_002_coefficient_21_0362
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0363 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 363 for generator 21. -/
def ep_Q2_002_partial_21_0363 : Poly :=
[
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 21. -/
theorem ep_Q2_002_partial_21_0363_valid :
    mulPoly ep_Q2_002_coefficient_21_0363
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0364 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 364 for generator 21. -/
def ep_Q2_002_partial_21_0364 : Poly :=
[
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 21. -/
theorem ep_Q2_002_partial_21_0364_valid :
    mulPoly ep_Q2_002_coefficient_21_0364
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0365 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 365 for generator 21. -/
def ep_Q2_002_partial_21_0365 : Poly :=
[
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 21. -/
theorem ep_Q2_002_partial_21_0365_valid :
    mulPoly ep_Q2_002_coefficient_21_0365
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0366 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 21. -/
def ep_Q2_002_partial_21_0366 : Poly :=
[
  term ((-195028145136 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 21. -/
theorem ep_Q2_002_partial_21_0366_valid :
    mulPoly ep_Q2_002_coefficient_21_0366
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0367 : Poly :=
[
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 367 for generator 21. -/
def ep_Q2_002_partial_21_0367 : Poly :=
[
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 21. -/
theorem ep_Q2_002_partial_21_0367_valid :
    mulPoly ep_Q2_002_coefficient_21_0367
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0368 : Poly :=
[
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 368 for generator 21. -/
def ep_Q2_002_partial_21_0368 : Poly :=
[
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 21. -/
theorem ep_Q2_002_partial_21_0368_valid :
    mulPoly ep_Q2_002_coefficient_21_0368
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0369 : Poly :=
[
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 369 for generator 21. -/
def ep_Q2_002_partial_21_0369 : Poly :=
[
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2)],
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 21. -/
theorem ep_Q2_002_partial_21_0369_valid :
    mulPoly ep_Q2_002_coefficient_21_0369
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0370 : Poly :=
[
  term ((88171245013 : Rat) / 22203951735) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 370 for generator 21. -/
def ep_Q2_002_partial_21_0370 : Poly :=
[
  term ((176342490026 : Rat) / 22203951735) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 22203951735) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 21. -/
theorem ep_Q2_002_partial_21_0370_valid :
    mulPoly ep_Q2_002_coefficient_21_0370
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0371 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (11, 1)]
]

/-- Partial product 371 for generator 21. -/
def ep_Q2_002_partial_21_0371 : Poly :=
[
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (10, 1), (11, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 21. -/
theorem ep_Q2_002_partial_21_0371_valid :
    mulPoly ep_Q2_002_coefficient_21_0371
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0372 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (13, 1)]
]

/-- Partial product 372 for generator 21. -/
def ep_Q2_002_partial_21_0372 : Poly :=
[
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (10, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 21. -/
theorem ep_Q2_002_partial_21_0372_valid :
    mulPoly ep_Q2_002_coefficient_21_0372
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0373 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 2), (15, 1)]
]

/-- Partial product 373 for generator 21. -/
def ep_Q2_002_partial_21_0373 : Poly :=
[
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 2), (10, 1), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 21. -/
theorem ep_Q2_002_partial_21_0373_valid :
    mulPoly ep_Q2_002_coefficient_21_0373
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0374 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 21. -/
def ep_Q2_002_partial_21_0374 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 21. -/
theorem ep_Q2_002_partial_21_0374_valid :
    mulPoly ep_Q2_002_coefficient_21_0374
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0375 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 375 for generator 21. -/
def ep_Q2_002_partial_21_0375 : Poly :=
[
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 21. -/
theorem ep_Q2_002_partial_21_0375_valid :
    mulPoly ep_Q2_002_coefficient_21_0375
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0376 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 376 for generator 21. -/
def ep_Q2_002_partial_21_0376 : Poly :=
[
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 21. -/
theorem ep_Q2_002_partial_21_0376_valid :
    mulPoly ep_Q2_002_coefficient_21_0376
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0377 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 377 for generator 21. -/
def ep_Q2_002_partial_21_0377 : Poly :=
[
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 21. -/
theorem ep_Q2_002_partial_21_0377_valid :
    mulPoly ep_Q2_002_coefficient_21_0377
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0378 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 21. -/
def ep_Q2_002_partial_21_0378 : Poly :=
[
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 21. -/
theorem ep_Q2_002_partial_21_0378_valid :
    mulPoly ep_Q2_002_coefficient_21_0378
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0379 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 379 for generator 21. -/
def ep_Q2_002_partial_21_0379 : Poly :=
[
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 21. -/
theorem ep_Q2_002_partial_21_0379_valid :
    mulPoly ep_Q2_002_coefficient_21_0379
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0380 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 380 for generator 21. -/
def ep_Q2_002_partial_21_0380 : Poly :=
[
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 21. -/
theorem ep_Q2_002_partial_21_0380_valid :
    mulPoly ep_Q2_002_coefficient_21_0380
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0381 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 381 for generator 21. -/
def ep_Q2_002_partial_21_0381 : Poly :=
[
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 21. -/
theorem ep_Q2_002_partial_21_0381_valid :
    mulPoly ep_Q2_002_coefficient_21_0381
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0382 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 382 for generator 21. -/
def ep_Q2_002_partial_21_0382 : Poly :=
[
  term ((65009381712 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 21. -/
theorem ep_Q2_002_partial_21_0382_valid :
    mulPoly ep_Q2_002_coefficient_21_0382
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0383 : Poly :=
[
  term ((3143038333245336990474819304230 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 383 for generator 21. -/
def ep_Q2_002_partial_21_0383 : Poly :=
[
  term ((6286076666490673980949638608460 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-3143038333245336990474819304230 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 21. -/
theorem ep_Q2_002_partial_21_0383_valid :
    mulPoly ep_Q2_002_coefficient_21_0383
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0384 : Poly :=
[
  term ((-8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 384 for generator 21. -/
def ep_Q2_002_partial_21_0384 : Poly :=
[
  term ((-17714465761563756053351934944976 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 21. -/
theorem ep_Q2_002_partial_21_0384_valid :
    mulPoly ep_Q2_002_coefficient_21_0384
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0385 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 385 for generator 21. -/
def ep_Q2_002_partial_21_0385 : Poly :=
[
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (10, 1), (11, 1), (15, 2)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 21. -/
theorem ep_Q2_002_partial_21_0385_valid :
    mulPoly ep_Q2_002_coefficient_21_0385
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0386 : Poly :=
[
  term ((16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 386 for generator 21. -/
def ep_Q2_002_partial_21_0386 : Poly :=
[
  term ((33359656448941307461750664745792 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 21. -/
theorem ep_Q2_002_partial_21_0386_valid :
    mulPoly ep_Q2_002_coefficient_21_0386
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0387 : Poly :=
[
  term ((105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 387 for generator 21. -/
def ep_Q2_002_partial_21_0387 : Poly :=
[
  term ((210685590387681408437679559919985937066584 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 21. -/
theorem ep_Q2_002_partial_21_0387_valid :
    mulPoly ep_Q2_002_coefficient_21_0387
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0388 : Poly :=
[
  term ((77504694161 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 21. -/
def ep_Q2_002_partial_21_0388 : Poly :=
[
  term ((155009388322 : Rat) / 7401317245) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-77504694161 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 21. -/
theorem ep_Q2_002_partial_21_0388_valid :
    mulPoly ep_Q2_002_coefficient_21_0388
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0389 : Poly :=
[
  term ((-5918929783951993258240853579160 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 389 for generator 21. -/
def ep_Q2_002_partial_21_0389 : Poly :=
[
  term ((-11837859567903986516481707158320 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (10, 1), (13, 1)],
  term ((5918929783951993258240853579160 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 21. -/
theorem ep_Q2_002_partial_21_0389_valid :
    mulPoly ep_Q2_002_coefficient_21_0389
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0390 : Poly :=
[
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 390 for generator 21. -/
def ep_Q2_002_partial_21_0390 : Poly :=
[
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 21. -/
theorem ep_Q2_002_partial_21_0390_valid :
    mulPoly ep_Q2_002_coefficient_21_0390
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0391 : Poly :=
[
  term ((4503884958266719619063914049711188674401 : Rat) / 9418309213428828857245785101775707465) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 391 for generator 21. -/
def ep_Q2_002_partial_21_0391 : Poly :=
[
  term ((9007769916533439238127828099422377348802 : Rat) / 9418309213428828857245785101775707465) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-4503884958266719619063914049711188674401 : Rat) / 9418309213428828857245785101775707465) [(3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 21. -/
theorem ep_Q2_002_partial_21_0391_valid :
    mulPoly ep_Q2_002_coefficient_21_0391
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0392 : Poly :=
[
  term ((-29181255517 : Rat) / 88815806940) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 21. -/
def ep_Q2_002_partial_21_0392 : Poly :=
[
  term ((-29181255517 : Rat) / 44407903470) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((29181255517 : Rat) / 88815806940) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 21. -/
theorem ep_Q2_002_partial_21_0392_valid :
    mulPoly ep_Q2_002_coefficient_21_0392
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0393 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 393 for generator 21. -/
def ep_Q2_002_partial_21_0393 : Poly :=
[
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (10, 1), (15, 3)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 21. -/
theorem ep_Q2_002_partial_21_0393_valid :
    mulPoly ep_Q2_002_coefficient_21_0393
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0394 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 394 for generator 21. -/
def ep_Q2_002_partial_21_0394 : Poly :=
[
  term ((-316951406728 : Rat) / 22203951735) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((158475703364 : Rat) / 22203951735) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 21. -/
theorem ep_Q2_002_partial_21_0394_valid :
    mulPoly ep_Q2_002_coefficient_21_0394
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0395 : Poly :=
[
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 395 for generator 21. -/
def ep_Q2_002_partial_21_0395 : Poly :=
[
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 21. -/
theorem ep_Q2_002_partial_21_0395_valid :
    mulPoly ep_Q2_002_coefficient_21_0395
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0396 : Poly :=
[
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 396 for generator 21. -/
def ep_Q2_002_partial_21_0396 : Poly :=
[
  term ((159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 21. -/
theorem ep_Q2_002_partial_21_0396_valid :
    mulPoly ep_Q2_002_coefficient_21_0396
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0397 : Poly :=
[
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 397 for generator 21. -/
def ep_Q2_002_partial_21_0397 : Poly :=
[
  term ((154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 21. -/
theorem ep_Q2_002_partial_21_0397_valid :
    mulPoly ep_Q2_002_coefficient_21_0397
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0398 : Poly :=
[
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 21. -/
def ep_Q2_002_partial_21_0398 : Poly :=
[
  term ((15110282248 : Rat) / 1480263449) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 21. -/
theorem ep_Q2_002_partial_21_0398_valid :
    mulPoly ep_Q2_002_coefficient_21_0398
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0399 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 399 for generator 21. -/
def ep_Q2_002_partial_21_0399 : Poly :=
[
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 21. -/
theorem ep_Q2_002_partial_21_0399_valid :
    mulPoly ep_Q2_002_coefficient_21_0399
        ep_Q2_002_generator_21_0300_0399 =
      ep_Q2_002_partial_21_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_21_0300_0399 : List Poly :=
[
  ep_Q2_002_partial_21_0300,
  ep_Q2_002_partial_21_0301,
  ep_Q2_002_partial_21_0302,
  ep_Q2_002_partial_21_0303,
  ep_Q2_002_partial_21_0304,
  ep_Q2_002_partial_21_0305,
  ep_Q2_002_partial_21_0306,
  ep_Q2_002_partial_21_0307,
  ep_Q2_002_partial_21_0308,
  ep_Q2_002_partial_21_0309,
  ep_Q2_002_partial_21_0310,
  ep_Q2_002_partial_21_0311,
  ep_Q2_002_partial_21_0312,
  ep_Q2_002_partial_21_0313,
  ep_Q2_002_partial_21_0314,
  ep_Q2_002_partial_21_0315,
  ep_Q2_002_partial_21_0316,
  ep_Q2_002_partial_21_0317,
  ep_Q2_002_partial_21_0318,
  ep_Q2_002_partial_21_0319,
  ep_Q2_002_partial_21_0320,
  ep_Q2_002_partial_21_0321,
  ep_Q2_002_partial_21_0322,
  ep_Q2_002_partial_21_0323,
  ep_Q2_002_partial_21_0324,
  ep_Q2_002_partial_21_0325,
  ep_Q2_002_partial_21_0326,
  ep_Q2_002_partial_21_0327,
  ep_Q2_002_partial_21_0328,
  ep_Q2_002_partial_21_0329,
  ep_Q2_002_partial_21_0330,
  ep_Q2_002_partial_21_0331,
  ep_Q2_002_partial_21_0332,
  ep_Q2_002_partial_21_0333,
  ep_Q2_002_partial_21_0334,
  ep_Q2_002_partial_21_0335,
  ep_Q2_002_partial_21_0336,
  ep_Q2_002_partial_21_0337,
  ep_Q2_002_partial_21_0338,
  ep_Q2_002_partial_21_0339,
  ep_Q2_002_partial_21_0340,
  ep_Q2_002_partial_21_0341,
  ep_Q2_002_partial_21_0342,
  ep_Q2_002_partial_21_0343,
  ep_Q2_002_partial_21_0344,
  ep_Q2_002_partial_21_0345,
  ep_Q2_002_partial_21_0346,
  ep_Q2_002_partial_21_0347,
  ep_Q2_002_partial_21_0348,
  ep_Q2_002_partial_21_0349,
  ep_Q2_002_partial_21_0350,
  ep_Q2_002_partial_21_0351,
  ep_Q2_002_partial_21_0352,
  ep_Q2_002_partial_21_0353,
  ep_Q2_002_partial_21_0354,
  ep_Q2_002_partial_21_0355,
  ep_Q2_002_partial_21_0356,
  ep_Q2_002_partial_21_0357,
  ep_Q2_002_partial_21_0358,
  ep_Q2_002_partial_21_0359,
  ep_Q2_002_partial_21_0360,
  ep_Q2_002_partial_21_0361,
  ep_Q2_002_partial_21_0362,
  ep_Q2_002_partial_21_0363,
  ep_Q2_002_partial_21_0364,
  ep_Q2_002_partial_21_0365,
  ep_Q2_002_partial_21_0366,
  ep_Q2_002_partial_21_0367,
  ep_Q2_002_partial_21_0368,
  ep_Q2_002_partial_21_0369,
  ep_Q2_002_partial_21_0370,
  ep_Q2_002_partial_21_0371,
  ep_Q2_002_partial_21_0372,
  ep_Q2_002_partial_21_0373,
  ep_Q2_002_partial_21_0374,
  ep_Q2_002_partial_21_0375,
  ep_Q2_002_partial_21_0376,
  ep_Q2_002_partial_21_0377,
  ep_Q2_002_partial_21_0378,
  ep_Q2_002_partial_21_0379,
  ep_Q2_002_partial_21_0380,
  ep_Q2_002_partial_21_0381,
  ep_Q2_002_partial_21_0382,
  ep_Q2_002_partial_21_0383,
  ep_Q2_002_partial_21_0384,
  ep_Q2_002_partial_21_0385,
  ep_Q2_002_partial_21_0386,
  ep_Q2_002_partial_21_0387,
  ep_Q2_002_partial_21_0388,
  ep_Q2_002_partial_21_0389,
  ep_Q2_002_partial_21_0390,
  ep_Q2_002_partial_21_0391,
  ep_Q2_002_partial_21_0392,
  ep_Q2_002_partial_21_0393,
  ep_Q2_002_partial_21_0394,
  ep_Q2_002_partial_21_0395,
  ep_Q2_002_partial_21_0396,
  ep_Q2_002_partial_21_0397,
  ep_Q2_002_partial_21_0398,
  ep_Q2_002_partial_21_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_21_0300_0399 : Poly :=
[
  term ((-15906140175857435545693924248576 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((7953070087928717772846962124288 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 2)],
  term ((6674325068201423626118377756472 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((148292914974203390653610099356992 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((-42927110088082335123427533629088 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1710312438280852157389892499952734807136504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-66060470592 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-284798296847261140404859948596480 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((146627147711336866846974701552011155712416 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-43849362696 : Rat) / 7401317245) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-178220186341238923588290938821488 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 2), (11, 1)],
  term ((-108547747957298622293505517826304 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((207354885742638721738719957628416 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((-271048118557679592414535454577936238324656 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((62592092292 : Rat) / 7401317245) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((408665897413307785802880201297856 : Rat) / 1273790490336191187829975377157) [(1, 1), (10, 2), (13, 1)],
  term ((-39124659597236585502405242850597520550292 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (10, 2), (15, 1)],
  term ((114070604819 : Rat) / 7401317245) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((44555046585309730897072734705372 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)],
  term ((23799774455223943760317190578340 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)],
  term ((-74146457487101695326805049678496 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2)],
  term ((-30375166391618512872966222592560 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)],
  term ((922918248779845976798580113620851463149416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)],
  term ((17382212223 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((142399148423630570202429974298240 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1)],
  term ((-73313573855668433423487350776005577856208 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (12, 2), (15, 1)],
  term ((21924681348 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-102166474353326946450720050324464 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)],
  term ((9781164899309146375601310712649380137573 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)],
  term ((-114070604819 : Rat) / 29605268980) [(1, 1), (15, 1), (16, 1)],
  term ((-3151397716081959890673170233936 : Rat) / 1273790490336191187829975377157) [(1, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((751494261625585066016064357824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)],
  term ((254598136157985064988448186240 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1)],
  term ((-509196272315970129976896372480 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (8, 1), (10, 1)],
  term ((3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 1), (12, 1)],
  term ((-3005977046502340264064257431296 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (10, 2)],
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1)],
  term ((3745136527408889504497753414272 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-4169144703998217557320436615616 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 1)],
  term ((8338289407996435114640873231232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (8, 1), (10, 1)],
  term ((-5712345730936218204239841335040 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 1)],
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 1), (12, 1)],
  term ((-3555854647763121609511330987008 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (10, 2)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (10, 2), (15, 1)],
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (15, 1)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 2), (10, 2)],
  term ((772044595670761740453662974824 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1)],
  term ((-14793472066364730342954145918464 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1)],
  term ((6857952223696489806619505580096 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 1), (12, 1)],
  term ((-4383018076784055894052879055328 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (10, 2)],
  term ((-3428976111848244903309752790048 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1)],
  term ((-86731087721437362794829660480 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 2)],
  term ((173462175442874725589659320960 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 2), (10, 1)],
  term ((-141110355339887697486556434912 : Rat) / 115799135485108289802725034287) [(1, 2), (10, 1), (12, 1)],
  term ((-10696709254349100638004752766720 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 1), (12, 2)],
  term ((12605590864327839562692680935744 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 2)],
  term ((7677629162467480032895496113152 : Rat) / 1273790490336191187829975377157) [(1, 2), (10, 2), (12, 1)],
  term ((-1143300336247487672047813636272 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)],
  term ((5348354627174550319002376383360 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2)],
  term ((-60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1)],
  term ((1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1)],
  term ((38126575709 : Rat) / 3171993105) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-38126575709 : Rat) / 6343986210) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2)],
  term ((15565557134 : Rat) / 4440790347) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2)],
  term ((176342490026 : Rat) / 22203951735) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-88171245013 : Rat) / 22203951735) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (10, 1), (11, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (10, 1), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 2), (10, 1), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2)],
  term ((65009381712 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-32504690856 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((6286076666490673980949638608460 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-17714465761563756053351934944976 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (10, 1), (11, 1), (15, 2)],
  term ((33359656448941307461750664745792 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((210685590387681408437679559919985937066584 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((155009388322 : Rat) / 7401317245) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11837859567903986516481707158320 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((9007769916533439238127828099422377348802 : Rat) / 9418309213428828857245785101775707465) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-29181255517 : Rat) / 44407903470) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (10, 1), (15, 3)],
  term ((-316951406728 : Rat) / 22203951735) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3143038333245336990474819304230 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (11, 1)],
  term ((8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-77504694161 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((5918929783951993258240853579160 : Rat) / 115799135485108289802725034287) [(3, 1), (6, 1), (13, 1)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-4503884958266719619063914049711188674401 : Rat) / 9418309213428828857245785101775707465) [(3, 1), (6, 1), (15, 1)],
  term ((29181255517 : Rat) / 88815806940) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((158475703364 : Rat) / 22203951735) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((15110282248 : Rat) / 1480263449) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 300 through 399. -/
theorem ep_Q2_002_block_21_0300_0399_valid :
    checkProductSumEq ep_Q2_002_partials_21_0300_0399
      ep_Q2_002_block_21_0300_0399 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
