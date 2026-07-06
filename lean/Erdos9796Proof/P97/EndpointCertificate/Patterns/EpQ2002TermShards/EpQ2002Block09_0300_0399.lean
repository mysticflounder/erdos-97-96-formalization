/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0300 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 300 for generator 9. -/
def ep_Q2_002_partial_09_0300 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 9. -/
theorem ep_Q2_002_partial_09_0300_valid :
    mulPoly ep_Q2_002_coefficient_09_0300
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0301 : Poly :=
[
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (12, 1)]
]

/-- Partial product 301 for generator 9. -/
def ep_Q2_002_partial_09_0301 : Poly :=
[
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (12, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 9. -/
theorem ep_Q2_002_partial_09_0301_valid :
    mulPoly ep_Q2_002_coefficient_09_0301
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0302 : Poly :=
[
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 302 for generator 9. -/
def ep_Q2_002_partial_09_0302 : Poly :=
[
  term ((-14135510582059419798884537332992 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 9. -/
theorem ep_Q2_002_partial_09_0302_valid :
    mulPoly ep_Q2_002_coefficient_09_0302
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0303 : Poly :=
[
  term ((-4199696869645929207758528429616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 1)]
]

/-- Partial product 303 for generator 9. -/
def ep_Q2_002_partial_09_0303 : Poly :=
[
  term ((-8399393739291858415517056859232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((4199696869645929207758528429616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 9. -/
theorem ep_Q2_002_partial_09_0303_valid :
    mulPoly ep_Q2_002_coefficient_09_0303
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0304 : Poly :=
[
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 2)]
]

/-- Partial product 304 for generator 9. -/
def ep_Q2_002_partial_09_0304 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 2)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 9. -/
theorem ep_Q2_002_partial_09_0304_valid :
    mulPoly ep_Q2_002_coefficient_09_0304
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0305 : Poly :=
[
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 305 for generator 9. -/
def ep_Q2_002_partial_09_0305 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 9. -/
theorem ep_Q2_002_partial_09_0305_valid :
    mulPoly ep_Q2_002_coefficient_09_0305
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0306 : Poly :=
[
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 306 for generator 9. -/
def ep_Q2_002_partial_09_0306 : Poly :=
[
  term ((-32047189985581250176232147123712 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 9. -/
theorem ep_Q2_002_partial_09_0306_valid :
    mulPoly ep_Q2_002_coefficient_09_0306
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0307 : Poly :=
[
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1)]
]

/-- Partial product 307 for generator 9. -/
def ep_Q2_002_partial_09_0307 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1)],
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 9. -/
theorem ep_Q2_002_partial_09_0307_valid :
    mulPoly ep_Q2_002_coefficient_09_0307
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0308 : Poly :=
[
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 308 for generator 9. -/
def ep_Q2_002_partial_09_0308 : Poly :=
[
  term ((-390155114549454292952617578029568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 9. -/
theorem ep_Q2_002_partial_09_0308_valid :
    mulPoly ep_Q2_002_coefficient_09_0308
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0309 : Poly :=
[
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 309 for generator 9. -/
def ep_Q2_002_partial_09_0309 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 9. -/
theorem ep_Q2_002_partial_09_0309_valid :
    mulPoly ep_Q2_002_coefficient_09_0309
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0310 : Poly :=
[
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 310 for generator 9. -/
def ep_Q2_002_partial_09_0310 : Poly :=
[
  term ((734735145747810060266254535264256 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 9. -/
theorem ep_Q2_002_partial_09_0310_valid :
    mulPoly ep_Q2_002_coefficient_09_0310
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0311 : Poly :=
[
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 311 for generator 9. -/
def ep_Q2_002_partial_09_0311 : Poly :=
[
  term ((2244206414374987957333299333783500317696256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 9. -/
theorem ep_Q2_002_partial_09_0311_valid :
    mulPoly ep_Q2_002_coefficient_09_0311
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0312 : Poly :=
[
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 9. -/
def ep_Q2_002_partial_09_0312 : Poly :=
[
  term ((305920653408 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 9. -/
theorem ep_Q2_002_partial_09_0312_valid :
    mulPoly ep_Q2_002_coefficient_09_0312
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0313 : Poly :=
[
  term ((-285034632395184306099465571949523720277632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 313 for generator 9. -/
def ep_Q2_002_partial_09_0313 : Poly :=
[
  term ((-570069264790368612198931143899047440555264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((285034632395184306099465571949523720277632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 9. -/
theorem ep_Q2_002_partial_09_0313_valid :
    mulPoly ep_Q2_002_coefficient_09_0313
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0314 : Poly :=
[
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 9. -/
def ep_Q2_002_partial_09_0314 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 9. -/
theorem ep_Q2_002_partial_09_0314_valid :
    mulPoly ep_Q2_002_coefficient_09_0314
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0315 : Poly :=
[
  term ((3978972709842137493616932886944 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2)]
]

/-- Partial product 315 for generator 9. -/
def ep_Q2_002_partial_09_0315 : Poly :=
[
  term ((7957945419684274987233865773888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2)],
  term ((-3978972709842137493616932886944 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 9. -/
theorem ep_Q2_002_partial_09_0315_valid :
    mulPoly ep_Q2_002_coefficient_09_0315
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0316 : Poly :=
[
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (14, 1)]
]

/-- Partial product 316 for generator 9. -/
def ep_Q2_002_partial_09_0316 : Poly :=
[
  term ((-57633634447981455265059241442688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2), (14, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 9. -/
theorem ep_Q2_002_partial_09_0316_valid :
    mulPoly ep_Q2_002_coefficient_09_0316
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0317 : Poly :=
[
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 317 for generator 9. -/
def ep_Q2_002_partial_09_0317 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1)],
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 9. -/
theorem ep_Q2_002_partial_09_0317_valid :
    mulPoly ep_Q2_002_coefficient_09_0317
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0318 : Poly :=
[
  term ((-1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (14, 1)]
]

/-- Partial product 318 for generator 9. -/
def ep_Q2_002_partial_09_0318 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1), (14, 1)],
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 9. -/
theorem ep_Q2_002_partial_09_0318_valid :
    mulPoly ep_Q2_002_coefficient_09_0318
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0319 : Poly :=
[
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 319 for generator 9. -/
def ep_Q2_002_partial_09_0319 : Poly :=
[
  term ((10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 9. -/
theorem ep_Q2_002_partial_09_0319_valid :
    mulPoly ep_Q2_002_coefficient_09_0319
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0320 : Poly :=
[
  term ((-1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 320 for generator 9. -/
def ep_Q2_002_partial_09_0320 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1)],
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 9. -/
theorem ep_Q2_002_partial_09_0320_valid :
    mulPoly ep_Q2_002_coefficient_09_0320
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0321 : Poly :=
[
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 321 for generator 9. -/
def ep_Q2_002_partial_09_0321 : Poly :=
[
  term ((130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 9. -/
theorem ep_Q2_002_partial_09_0321_valid :
    mulPoly ep_Q2_002_coefficient_09_0321
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0322 : Poly :=
[
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 322 for generator 9. -/
def ep_Q2_002_partial_09_0322 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 9. -/
theorem ep_Q2_002_partial_09_0322_valid :
    mulPoly ep_Q2_002_coefficient_09_0322
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0323 : Poly :=
[
  term ((-202856910197784082358085153456 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 323 for generator 9. -/
def ep_Q2_002_partial_09_0323 : Poly :=
[
  term ((-405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (12, 1)],
  term ((202856910197784082358085153456 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 9. -/
theorem ep_Q2_002_partial_09_0323_valid :
    mulPoly ep_Q2_002_coefficient_09_0323
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0324 : Poly :=
[
  term ((688484777327171463767644615872 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (14, 1)]
]

/-- Partial product 324 for generator 9. -/
def ep_Q2_002_partial_09_0324 : Poly :=
[
  term ((1376969554654342927535289231744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1)],
  term ((-688484777327171463767644615872 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 9. -/
theorem ep_Q2_002_partial_09_0324_valid :
    mulPoly ep_Q2_002_coefficient_09_0324
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0325 : Poly :=
[
  term ((-8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 325 for generator 9. -/
def ep_Q2_002_partial_09_0325 : Poly :=
[
  term ((-17752015743631584637682074955520 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 9. -/
theorem ep_Q2_002_partial_09_0325_valid :
    mulPoly ep_Q2_002_coefficient_09_0325
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0326 : Poly :=
[
  term ((30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 326 for generator 9. -/
def ep_Q2_002_partial_09_0326 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 9. -/
theorem ep_Q2_002_partial_09_0326_valid :
    mulPoly ep_Q2_002_coefficient_09_0326
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0327 : Poly :=
[
  term ((-215567875926100089059078166112 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 327 for generator 9. -/
def ep_Q2_002_partial_09_0327 : Poly :=
[
  term ((-431135751852200178118156332224 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((215567875926100089059078166112 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 9. -/
theorem ep_Q2_002_partial_09_0327_valid :
    mulPoly ep_Q2_002_coefficient_09_0327
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0328 : Poly :=
[
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 328 for generator 9. -/
def ep_Q2_002_partial_09_0328 : Poly :=
[
  term ((-745809674377051221998173723204418943823232 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 9. -/
theorem ep_Q2_002_partial_09_0328_valid :
    mulPoly ep_Q2_002_coefficient_09_0328
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0329 : Poly :=
[
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 329 for generator 9. -/
def ep_Q2_002_partial_09_0329 : Poly :=
[
  term ((-101973551136 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 9. -/
theorem ep_Q2_002_partial_09_0329_valid :
    mulPoly ep_Q2_002_coefficient_09_0329
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0330 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 2)]
]

/-- Partial product 330 for generator 9. -/
def ep_Q2_002_partial_09_0330 : Poly :=
[
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (14, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 9. -/
theorem ep_Q2_002_partial_09_0330_valid :
    mulPoly ep_Q2_002_coefficient_09_0330
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0331 : Poly :=
[
  term ((92127516160498435113756673517452174433024 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (15, 2)]
]

/-- Partial product 331 for generator 9. -/
def ep_Q2_002_partial_09_0331 : Poly :=
[
  term ((184255032320996870227513347034904348866048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((-92127516160498435113756673517452174433024 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 9. -/
theorem ep_Q2_002_partial_09_0331_valid :
    mulPoly ep_Q2_002_coefficient_09_0331
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0332 : Poly :=
[
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 332 for generator 9. -/
def ep_Q2_002_partial_09_0332 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 9. -/
theorem ep_Q2_002_partial_09_0332_valid :
    mulPoly ep_Q2_002_coefficient_09_0332
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0333 : Poly :=
[
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1)]
]

/-- Partial product 333 for generator 9. -/
def ep_Q2_002_partial_09_0333 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1)],
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 9. -/
theorem ep_Q2_002_partial_09_0333_valid :
    mulPoly ep_Q2_002_coefficient_09_0333
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0334 : Poly :=
[
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1), (14, 1)]
]

/-- Partial product 334 for generator 9. -/
def ep_Q2_002_partial_09_0334 : Poly :=
[
  term ((-2345622979022214119647616213376 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1), (14, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 9. -/
theorem ep_Q2_002_partial_09_0334_valid :
    mulPoly ep_Q2_002_coefficient_09_0334
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0335 : Poly :=
[
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (14, 1), (15, 1)]
]

/-- Partial product 335 for generator 9. -/
def ep_Q2_002_partial_09_0335 : Poly :=
[
  term ((-8312954790988180052920072534144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (14, 1), (15, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 9. -/
theorem ep_Q2_002_partial_09_0335_valid :
    mulPoly ep_Q2_002_coefficient_09_0335
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0336 : Poly :=
[
  term ((1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (15, 1)]
]

/-- Partial product 336 for generator 9. -/
def ep_Q2_002_partial_09_0336 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((-1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 9. -/
theorem ep_Q2_002_partial_09_0336_valid :
    mulPoly ep_Q2_002_coefficient_09_0336
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0337 : Poly :=
[
  term ((-3602102152998840954066202590168 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 337 for generator 9. -/
def ep_Q2_002_partial_09_0337 : Poly :=
[
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((3602102152998840954066202590168 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 9. -/
theorem ep_Q2_002_partial_09_0337_valid :
    mulPoly ep_Q2_002_coefficient_09_0337
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0338 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 338 for generator 9. -/
def ep_Q2_002_partial_09_0338 : Poly :=
[
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 9. -/
theorem ep_Q2_002_partial_09_0338_valid :
    mulPoly ep_Q2_002_coefficient_09_0338
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0339 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 339 for generator 9. -/
def ep_Q2_002_partial_09_0339 : Poly :=
[
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 9. -/
theorem ep_Q2_002_partial_09_0339_valid :
    mulPoly ep_Q2_002_coefficient_09_0339
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0340 : Poly :=
[
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 340 for generator 9. -/
def ep_Q2_002_partial_09_0340 : Poly :=
[
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 9. -/
theorem ep_Q2_002_partial_09_0340_valid :
    mulPoly ep_Q2_002_coefficient_09_0340
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0341 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 9. -/
def ep_Q2_002_partial_09_0341 : Poly :=
[
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 9. -/
theorem ep_Q2_002_partial_09_0341_valid :
    mulPoly ep_Q2_002_coefficient_09_0341
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0342 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 2)]
]

/-- Partial product 342 for generator 9. -/
def ep_Q2_002_partial_09_0342 : Poly :=
[
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 2)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 9. -/
theorem ep_Q2_002_partial_09_0342_valid :
    mulPoly ep_Q2_002_coefficient_09_0342
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0343 : Poly :=
[
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (14, 1)]
]

/-- Partial product 343 for generator 9. -/
def ep_Q2_002_partial_09_0343 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 9. -/
theorem ep_Q2_002_partial_09_0343_valid :
    mulPoly ep_Q2_002_coefficient_09_0343
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0344 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 2), (11, 1)]
]

/-- Partial product 344 for generator 9. -/
def ep_Q2_002_partial_09_0344 : Poly :=
[
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 2), (11, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 9. -/
theorem ep_Q2_002_partial_09_0344_valid :
    mulPoly ep_Q2_002_coefficient_09_0344
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0345 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 345 for generator 9. -/
def ep_Q2_002_partial_09_0345 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (8, 1), (11, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 9. -/
theorem ep_Q2_002_partial_09_0345_valid :
    mulPoly ep_Q2_002_coefficient_09_0345
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0346 : Poly :=
[
  term ((-15050827987475180833089005688768 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 346 for generator 9. -/
def ep_Q2_002_partial_09_0346 : Poly :=
[
  term ((-30101655974950361666178011377536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((15050827987475180833089005688768 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 9. -/
theorem ep_Q2_002_partial_09_0346_valid :
    mulPoly ep_Q2_002_coefficient_09_0346
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0347 : Poly :=
[
  term ((-2002949374098828136014509195232 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 347 for generator 9. -/
def ep_Q2_002_partial_09_0347 : Poly :=
[
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (9, 1)],
  term ((2002949374098828136014509195232 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 9. -/
theorem ep_Q2_002_partial_09_0347_valid :
    mulPoly ep_Q2_002_coefficient_09_0347
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0348 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 348 for generator 9. -/
def ep_Q2_002_partial_09_0348 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 9. -/
theorem ep_Q2_002_partial_09_0348_valid :
    mulPoly ep_Q2_002_coefficient_09_0348
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0349 : Poly :=
[
  term ((-1600354290433248829872600069600 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 349 for generator 9. -/
def ep_Q2_002_partial_09_0349 : Poly :=
[
  term ((-3200708580866497659745200139200 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((1600354290433248829872600069600 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 9. -/
theorem ep_Q2_002_partial_09_0349_valid :
    mulPoly ep_Q2_002_coefficient_09_0349
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0350 : Poly :=
[
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 350 for generator 9. -/
def ep_Q2_002_partial_09_0350 : Poly :=
[
  term ((-1252951825237464718032818647488 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1)],
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 9. -/
theorem ep_Q2_002_partial_09_0350_valid :
    mulPoly ep_Q2_002_coefficient_09_0350
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0351 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 351 for generator 9. -/
def ep_Q2_002_partial_09_0351 : Poly :=
[
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 9. -/
theorem ep_Q2_002_partial_09_0351_valid :
    mulPoly ep_Q2_002_coefficient_09_0351
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0352 : Poly :=
[
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 352 for generator 9. -/
def ep_Q2_002_partial_09_0352 : Poly :=
[
  term ((17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 9. -/
theorem ep_Q2_002_partial_09_0352_valid :
    mulPoly ep_Q2_002_coefficient_09_0352
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0353 : Poly :=
[
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 353 for generator 9. -/
def ep_Q2_002_partial_09_0353 : Poly :=
[
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (11, 1), (15, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 9. -/
theorem ep_Q2_002_partial_09_0353_valid :
    mulPoly ep_Q2_002_coefficient_09_0353
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0354 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 354 for generator 9. -/
def ep_Q2_002_partial_09_0354 : Poly :=
[
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 9. -/
theorem ep_Q2_002_partial_09_0354_valid :
    mulPoly ep_Q2_002_coefficient_09_0354
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0355 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 355 for generator 9. -/
def ep_Q2_002_partial_09_0355 : Poly :=
[
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (11, 2), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 9. -/
theorem ep_Q2_002_partial_09_0355_valid :
    mulPoly ep_Q2_002_coefficient_09_0355
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0356 : Poly :=
[
  term ((-663970446613720423818027114432 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 356 for generator 9. -/
def ep_Q2_002_partial_09_0356 : Poly :=
[
  term ((-1327940893227440847636054228864 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((663970446613720423818027114432 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 9. -/
theorem ep_Q2_002_partial_09_0356_valid :
    mulPoly ep_Q2_002_coefficient_09_0356
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0357 : Poly :=
[
  term ((3432415293811829973034660805280 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 357 for generator 9. -/
def ep_Q2_002_partial_09_0357 : Poly :=
[
  term ((6864830587623659946069321610560 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-3432415293811829973034660805280 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 9. -/
theorem ep_Q2_002_partial_09_0357_valid :
    mulPoly ep_Q2_002_coefficient_09_0357
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0358 : Poly :=
[
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 358 for generator 9. -/
def ep_Q2_002_partial_09_0358 : Poly :=
[
  term ((-32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 9. -/
theorem ep_Q2_002_partial_09_0358_valid :
    mulPoly ep_Q2_002_coefficient_09_0358
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0359 : Poly :=
[
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 359 for generator 9. -/
def ep_Q2_002_partial_09_0359 : Poly :=
[
  term ((14135510582059419798884537332992 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (13, 1), (15, 2)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 9. -/
theorem ep_Q2_002_partial_09_0359_valid :
    mulPoly ep_Q2_002_coefficient_09_0359
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0360 : Poly :=
[
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 360 for generator 9. -/
def ep_Q2_002_partial_09_0360 : Poly :=
[
  term ((519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 9. -/
theorem ep_Q2_002_partial_09_0360_valid :
    mulPoly ep_Q2_002_coefficient_09_0360
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0361 : Poly :=
[
  term ((1505925468 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 9. -/
def ep_Q2_002_partial_09_0361 : Poly :=
[
  term ((3011850936 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1505925468 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 9. -/
theorem ep_Q2_002_partial_09_0361_valid :
    mulPoly ep_Q2_002_coefficient_09_0361
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0362 : Poly :=
[
  term ((275044739571682492567797614957245301438264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 362 for generator 9. -/
def ep_Q2_002_partial_09_0362 : Poly :=
[
  term ((550089479143364985135595229914490602876528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-275044739571682492567797614957245301438264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 9. -/
theorem ep_Q2_002_partial_09_0362_valid :
    mulPoly ep_Q2_002_coefficient_09_0362
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0363 : Poly :=
[
  term ((19873003572 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 9. -/
def ep_Q2_002_partial_09_0363 : Poly :=
[
  term ((39746007144 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-19873003572 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 9. -/
theorem ep_Q2_002_partial_09_0363_valid :
    mulPoly ep_Q2_002_coefficient_09_0363
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0364 : Poly :=
[
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (15, 1)]
]

/-- Partial product 364 for generator 9. -/
def ep_Q2_002_partial_09_0364 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 9. -/
theorem ep_Q2_002_partial_09_0364_valid :
    mulPoly ep_Q2_002_coefficient_09_0364
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0365 : Poly :=
[
  term ((180870785222767822002925415260 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 365 for generator 9. -/
def ep_Q2_002_partial_09_0365 : Poly :=
[
  term ((361741570445535644005850830520 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1)],
  term ((-180870785222767822002925415260 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 9. -/
theorem ep_Q2_002_partial_09_0365_valid :
    mulPoly ep_Q2_002_coefficient_09_0365
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0366 : Poly :=
[
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 366 for generator 9. -/
def ep_Q2_002_partial_09_0366 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 9. -/
theorem ep_Q2_002_partial_09_0366_valid :
    mulPoly ep_Q2_002_coefficient_09_0366
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0367 : Poly :=
[
  term ((127283287130105166327846106560 : Rat) / 11272482215364523786105976789) [(1, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 367 for generator 9. -/
def ep_Q2_002_partial_09_0367 : Poly :=
[
  term ((254566574260210332655692213120 : Rat) / 11272482215364523786105976789) [(1, 1), (2, 1), (7, 1), (8, 1), (14, 1)],
  term ((-127283287130105166327846106560 : Rat) / 11272482215364523786105976789) [(1, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 9. -/
theorem ep_Q2_002_partial_09_0367_valid :
    mulPoly ep_Q2_002_coefficient_09_0367
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0368 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 368 for generator 9. -/
def ep_Q2_002_partial_09_0368 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 9. -/
theorem ep_Q2_002_partial_09_0368_valid :
    mulPoly ep_Q2_002_coefficient_09_0368
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0369 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 369 for generator 9. -/
def ep_Q2_002_partial_09_0369 : Poly :=
[
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 9. -/
theorem ep_Q2_002_partial_09_0369_valid :
    mulPoly ep_Q2_002_coefficient_09_0369
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0370 : Poly :=
[
  term ((202856910197784082358085153456 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 370 for generator 9. -/
def ep_Q2_002_partial_09_0370 : Poly :=
[
  term ((405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (7, 1), (12, 1)],
  term ((-202856910197784082358085153456 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 9. -/
theorem ep_Q2_002_partial_09_0370_valid :
    mulPoly ep_Q2_002_coefficient_09_0370
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0371 : Poly :=
[
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 371 for generator 9. -/
def ep_Q2_002_partial_09_0371 : Poly :=
[
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 9. -/
theorem ep_Q2_002_partial_09_0371_valid :
    mulPoly ep_Q2_002_coefficient_09_0371
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0372 : Poly :=
[
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 372 for generator 9. -/
def ep_Q2_002_partial_09_0372 : Poly :=
[
  term ((-14135510582059419798884537332992 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 9. -/
theorem ep_Q2_002_partial_09_0372_valid :
    mulPoly ep_Q2_002_coefficient_09_0372
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0373 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 373 for generator 9. -/
def ep_Q2_002_partial_09_0373 : Poly :=
[
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 9. -/
theorem ep_Q2_002_partial_09_0373_valid :
    mulPoly ep_Q2_002_coefficient_09_0373
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0374 : Poly :=
[
  term ((-6857215028076285803424778886456 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 374 for generator 9. -/
def ep_Q2_002_partial_09_0374 : Poly :=
[
  term ((-13714430056152571606849557772912 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((6857215028076285803424778886456 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 9. -/
theorem ep_Q2_002_partial_09_0374_valid :
    mulPoly ep_Q2_002_coefficient_09_0374
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0375 : Poly :=
[
  term ((187299592499742091916890701322385171734128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (15, 2)]
]

/-- Partial product 375 for generator 9. -/
def ep_Q2_002_partial_09_0375 : Poly :=
[
  term ((374599184999484183833781402644770343468256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-187299592499742091916890701322385171734128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 9. -/
theorem ep_Q2_002_partial_09_0375_valid :
    mulPoly ep_Q2_002_coefficient_09_0375
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0376 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 376 for generator 9. -/
def ep_Q2_002_partial_09_0376 : Poly :=
[
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 9. -/
theorem ep_Q2_002_partial_09_0376_valid :
    mulPoly ep_Q2_002_coefficient_09_0376
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0377 : Poly :=
[
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1)]
]

/-- Partial product 377 for generator 9. -/
def ep_Q2_002_partial_09_0377 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 9. -/
theorem ep_Q2_002_partial_09_0377_valid :
    mulPoly ep_Q2_002_coefficient_09_0377
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0378 : Poly :=
[
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1)]
]

/-- Partial product 378 for generator 9. -/
def ep_Q2_002_partial_09_0378 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 9. -/
theorem ep_Q2_002_partial_09_0378_valid :
    mulPoly ep_Q2_002_coefficient_09_0378
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0379 : Poly :=
[
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (13, 1)]
]

/-- Partial product 379 for generator 9. -/
def ep_Q2_002_partial_09_0379 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 9. -/
theorem ep_Q2_002_partial_09_0379_valid :
    mulPoly ep_Q2_002_coefficient_09_0379
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0380 : Poly :=
[
  term ((20992967153973962226702769679736424244944 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (7, 2), (15, 1)]
]

/-- Partial product 380 for generator 9. -/
def ep_Q2_002_partial_09_0380 : Poly :=
[
  term ((41985934307947924453405539359472848489888 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-20992967153973962226702769679736424244944 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 9. -/
theorem ep_Q2_002_partial_09_0380_valid :
    mulPoly ep_Q2_002_coefficient_09_0380
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0381 : Poly :=
[
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 9. -/
def ep_Q2_002_partial_09_0381 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 9. -/
theorem ep_Q2_002_partial_09_0381_valid :
    mulPoly ep_Q2_002_coefficient_09_0381
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0382 : Poly :=
[
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3)]
]

/-- Partial product 382 for generator 9. -/
def ep_Q2_002_partial_09_0382 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 3)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 9. -/
theorem ep_Q2_002_partial_09_0382_valid :
    mulPoly ep_Q2_002_coefficient_09_0382
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0383 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 383 for generator 9. -/
def ep_Q2_002_partial_09_0383 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 9. -/
theorem ep_Q2_002_partial_09_0383_valid :
    mulPoly ep_Q2_002_coefficient_09_0383
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0384 : Poly :=
[
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 384 for generator 9. -/
def ep_Q2_002_partial_09_0384 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 9. -/
theorem ep_Q2_002_partial_09_0384_valid :
    mulPoly ep_Q2_002_coefficient_09_0384
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0385 : Poly :=
[
  term ((-4251041006184107431397670861792 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 385 for generator 9. -/
def ep_Q2_002_partial_09_0385 : Poly :=
[
  term ((-8502082012368214862795341723584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((4251041006184107431397670861792 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 9. -/
theorem ep_Q2_002_partial_09_0385_valid :
    mulPoly ep_Q2_002_coefficient_09_0385
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0386 : Poly :=
[
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (14, 2)]
]

/-- Partial product 386 for generator 9. -/
def ep_Q2_002_partial_09_0386 : Poly :=
[
  term ((1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 9. -/
theorem ep_Q2_002_partial_09_0386_valid :
    mulPoly ep_Q2_002_coefficient_09_0386
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0387 : Poly :=
[
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 387 for generator 9. -/
def ep_Q2_002_partial_09_0387 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 9. -/
theorem ep_Q2_002_partial_09_0387_valid :
    mulPoly ep_Q2_002_coefficient_09_0387
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0388 : Poly :=
[
  term ((-21273245631834252591517208598960 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 388 for generator 9. -/
def ep_Q2_002_partial_09_0388 : Poly :=
[
  term ((-42546491263668505183034417197920 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((21273245631834252591517208598960 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 9. -/
theorem ep_Q2_002_partial_09_0388_valid :
    mulPoly ep_Q2_002_coefficient_09_0388
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0389 : Poly :=
[
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 389 for generator 9. -/
def ep_Q2_002_partial_09_0389 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 9. -/
theorem ep_Q2_002_partial_09_0389_valid :
    mulPoly ep_Q2_002_coefficient_09_0389
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0390 : Poly :=
[
  term ((-110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 390 for generator 9. -/
def ep_Q2_002_partial_09_0390 : Poly :=
[
  term ((-220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 9. -/
theorem ep_Q2_002_partial_09_0390_valid :
    mulPoly ep_Q2_002_coefficient_09_0390
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0391 : Poly :=
[
  term ((313237956309366179508204661872 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 391 for generator 9. -/
def ep_Q2_002_partial_09_0391 : Poly :=
[
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-313237956309366179508204661872 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 9. -/
theorem ep_Q2_002_partial_09_0391_valid :
    mulPoly ep_Q2_002_coefficient_09_0391
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0392 : Poly :=
[
  term ((40730860170708656518178151866160 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 392 for generator 9. -/
def ep_Q2_002_partial_09_0392 : Poly :=
[
  term ((81461720341417313036356303732320 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-40730860170708656518178151866160 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 9. -/
theorem ep_Q2_002_partial_09_0392_valid :
    mulPoly ep_Q2_002_coefficient_09_0392
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0393 : Poly :=
[
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 393 for generator 9. -/
def ep_Q2_002_partial_09_0393 : Poly :=
[
  term ((-10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 9. -/
theorem ep_Q2_002_partial_09_0393_valid :
    mulPoly ep_Q2_002_coefficient_09_0393
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0394 : Poly :=
[
  term ((-30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 394 for generator 9. -/
def ep_Q2_002_partial_09_0394 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 9. -/
theorem ep_Q2_002_partial_09_0394_valid :
    mulPoly ep_Q2_002_coefficient_09_0394
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0395 : Poly :=
[
  term ((-159411278827456025234788665024563437368184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 395 for generator 9. -/
def ep_Q2_002_partial_09_0395 : Poly :=
[
  term ((-318822557654912050469577330049126874736368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((159411278827456025234788665024563437368184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 9. -/
theorem ep_Q2_002_partial_09_0395_valid :
    mulPoly ep_Q2_002_coefficient_09_0395
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0396 : Poly :=
[
  term ((11006757768 : Rat) / 7401317245) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 9. -/
def ep_Q2_002_partial_09_0396 : Poly :=
[
  term ((22013515536 : Rat) / 7401317245) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11006757768 : Rat) / 7401317245) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 9. -/
theorem ep_Q2_002_partial_09_0396_valid :
    mulPoly ep_Q2_002_coefficient_09_0396
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0397 : Poly :=
[
  term ((-2704701600759789466137495268252 : Rat) / 1273790490336191187829975377157) [(1, 1), (15, 1)]
]

/-- Partial product 397 for generator 9. -/
def ep_Q2_002_partial_09_0397 : Poly :=
[
  term ((-5409403201519578932274990536504 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (15, 1)],
  term ((2704701600759789466137495268252 : Rat) / 1273790490336191187829975377157) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 9. -/
theorem ep_Q2_002_partial_09_0397_valid :
    mulPoly ep_Q2_002_coefficient_09_0397
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0398 : Poly :=
[
  term ((-93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)]
]

/-- Partial product 398 for generator 9. -/
def ep_Q2_002_partial_09_0398 : Poly :=
[
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (15, 3)],
  term ((93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 9. -/
theorem ep_Q2_002_partial_09_0398_valid :
    mulPoly ep_Q2_002_coefficient_09_0398
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0399 : Poly :=
[
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 399 for generator 9. -/
def ep_Q2_002_partial_09_0399 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 9. -/
theorem ep_Q2_002_partial_09_0399_valid :
    mulPoly ep_Q2_002_coefficient_09_0399
        ep_Q2_002_generator_09_0300_0399 =
      ep_Q2_002_partial_09_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0300_0399 : List Poly :=
[
  ep_Q2_002_partial_09_0300,
  ep_Q2_002_partial_09_0301,
  ep_Q2_002_partial_09_0302,
  ep_Q2_002_partial_09_0303,
  ep_Q2_002_partial_09_0304,
  ep_Q2_002_partial_09_0305,
  ep_Q2_002_partial_09_0306,
  ep_Q2_002_partial_09_0307,
  ep_Q2_002_partial_09_0308,
  ep_Q2_002_partial_09_0309,
  ep_Q2_002_partial_09_0310,
  ep_Q2_002_partial_09_0311,
  ep_Q2_002_partial_09_0312,
  ep_Q2_002_partial_09_0313,
  ep_Q2_002_partial_09_0314,
  ep_Q2_002_partial_09_0315,
  ep_Q2_002_partial_09_0316,
  ep_Q2_002_partial_09_0317,
  ep_Q2_002_partial_09_0318,
  ep_Q2_002_partial_09_0319,
  ep_Q2_002_partial_09_0320,
  ep_Q2_002_partial_09_0321,
  ep_Q2_002_partial_09_0322,
  ep_Q2_002_partial_09_0323,
  ep_Q2_002_partial_09_0324,
  ep_Q2_002_partial_09_0325,
  ep_Q2_002_partial_09_0326,
  ep_Q2_002_partial_09_0327,
  ep_Q2_002_partial_09_0328,
  ep_Q2_002_partial_09_0329,
  ep_Q2_002_partial_09_0330,
  ep_Q2_002_partial_09_0331,
  ep_Q2_002_partial_09_0332,
  ep_Q2_002_partial_09_0333,
  ep_Q2_002_partial_09_0334,
  ep_Q2_002_partial_09_0335,
  ep_Q2_002_partial_09_0336,
  ep_Q2_002_partial_09_0337,
  ep_Q2_002_partial_09_0338,
  ep_Q2_002_partial_09_0339,
  ep_Q2_002_partial_09_0340,
  ep_Q2_002_partial_09_0341,
  ep_Q2_002_partial_09_0342,
  ep_Q2_002_partial_09_0343,
  ep_Q2_002_partial_09_0344,
  ep_Q2_002_partial_09_0345,
  ep_Q2_002_partial_09_0346,
  ep_Q2_002_partial_09_0347,
  ep_Q2_002_partial_09_0348,
  ep_Q2_002_partial_09_0349,
  ep_Q2_002_partial_09_0350,
  ep_Q2_002_partial_09_0351,
  ep_Q2_002_partial_09_0352,
  ep_Q2_002_partial_09_0353,
  ep_Q2_002_partial_09_0354,
  ep_Q2_002_partial_09_0355,
  ep_Q2_002_partial_09_0356,
  ep_Q2_002_partial_09_0357,
  ep_Q2_002_partial_09_0358,
  ep_Q2_002_partial_09_0359,
  ep_Q2_002_partial_09_0360,
  ep_Q2_002_partial_09_0361,
  ep_Q2_002_partial_09_0362,
  ep_Q2_002_partial_09_0363,
  ep_Q2_002_partial_09_0364,
  ep_Q2_002_partial_09_0365,
  ep_Q2_002_partial_09_0366,
  ep_Q2_002_partial_09_0367,
  ep_Q2_002_partial_09_0368,
  ep_Q2_002_partial_09_0369,
  ep_Q2_002_partial_09_0370,
  ep_Q2_002_partial_09_0371,
  ep_Q2_002_partial_09_0372,
  ep_Q2_002_partial_09_0373,
  ep_Q2_002_partial_09_0374,
  ep_Q2_002_partial_09_0375,
  ep_Q2_002_partial_09_0376,
  ep_Q2_002_partial_09_0377,
  ep_Q2_002_partial_09_0378,
  ep_Q2_002_partial_09_0379,
  ep_Q2_002_partial_09_0380,
  ep_Q2_002_partial_09_0381,
  ep_Q2_002_partial_09_0382,
  ep_Q2_002_partial_09_0383,
  ep_Q2_002_partial_09_0384,
  ep_Q2_002_partial_09_0385,
  ep_Q2_002_partial_09_0386,
  ep_Q2_002_partial_09_0387,
  ep_Q2_002_partial_09_0388,
  ep_Q2_002_partial_09_0389,
  ep_Q2_002_partial_09_0390,
  ep_Q2_002_partial_09_0391,
  ep_Q2_002_partial_09_0392,
  ep_Q2_002_partial_09_0393,
  ep_Q2_002_partial_09_0394,
  ep_Q2_002_partial_09_0395,
  ep_Q2_002_partial_09_0396,
  ep_Q2_002_partial_09_0397,
  ep_Q2_002_partial_09_0398,
  ep_Q2_002_partial_09_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0300_0399 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (12, 1)],
  term ((-14135510582059419798884537332992 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-8399393739291858415517056859232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 2)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1)],
  term ((-32047189985581250176232147123712 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1)],
  term ((-390155114549454292952617578029568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1)],
  term ((734735145747810060266254535264256 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((2244206414374987957333299333783500317696256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((305920653408 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-570069264790368612198931143899047440555264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((7957945419684274987233865773888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2)],
  term ((-57633634447981455265059241442688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2), (14, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1), (14, 1)],
  term ((10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1)],
  term ((130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((-405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (12, 1)],
  term ((1376969554654342927535289231744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1)],
  term ((-17752015743631584637682074955520 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-431135751852200178118156332224 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((-745809674377051221998173723204418943823232 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2)],
  term ((-101973551136 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (14, 2)],
  term ((184255032320996870227513347034904348866048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1)],
  term ((-2345622979022214119647616213376 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1), (14, 1)],
  term ((-8312954790988180052920072534144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (14, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 2)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 2), (11, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (8, 1), (11, 1)],
  term ((-30101655974950361666178011377536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (9, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3200708580866497659745200139200 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-1252951825237464718032818647488 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (11, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (11, 2), (15, 1)],
  term ((-1327940893227440847636054228864 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((6864830587623659946069321610560 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((14135510582059419798884537332992 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (13, 1), (15, 2)],
  term ((519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((3011850936 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((550089479143364985135595229914490602876528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((39746007144 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((361741570445535644005850830520 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1)],
  term ((254566574260210332655692213120 : Rat) / 11272482215364523786105976789) [(1, 1), (2, 1), (7, 1), (8, 1), (14, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (7, 1), (12, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1)],
  term ((-14135510582059419798884537332992 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-13714430056152571606849557772912 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((374599184999484183833781402644770343468256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((41985934307947924453405539359472848489888 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 3)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-8502082012368214862795341723584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-42546491263668505183034417197920 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((81461720341417313036356303732320 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-318822557654912050469577330049126874736368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((22013515536 : Rat) / 7401317245) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5409403201519578932274990536504 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (15, 1)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (15, 3)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (12, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((4199696869645929207758528429616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 2)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((285034632395184306099465571949523720277632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3978972709842137493616932886944 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (14, 1)],
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)],
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (14, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((202856910197784082358085153456 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1)],
  term ((-688484777327171463767644615872 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (12, 1), (14, 1)],
  term ((8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((215567875926100089059078166112 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 2)],
  term ((-92127516160498435113756673517452174433024 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (15, 2)],
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1), (14, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((-1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (15, 1)],
  term ((3602102152998840954066202590168 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (14, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 2), (11, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((15050827987475180833089005688768 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((2002949374098828136014509195232 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((1600354290433248829872600069600 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (11, 1)],
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((663970446613720423818027114432 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-3432415293811829973034660805280 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (13, 1)],
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1505925468 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-275044739571682492567797614957245301438264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)],
  term ((-19873003572 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 2), (15, 1)],
  term ((-180870785222767822002925415260 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1)],
  term ((-127283287130105166327846106560 : Rat) / 11272482215364523786105976789) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-202856910197784082358085153456 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (12, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((6857215028076285803424778886456 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 1)],
  term ((-187299592499742091916890701322385171734128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1)],
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1)],
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (13, 1)],
  term ((-20992967153973962226702769679736424244944 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (7, 2), (15, 1)],
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (15, 1)],
  term ((4251041006184107431397670861792 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (14, 2)],
  term ((-1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (15, 2)],
  term ((21273245631834252591517208598960 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 1)],
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (15, 2)],
  term ((110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-313237956309366179508204661872 : Rat) / 97983883872014706756151952089) [(1, 1), (12, 1), (15, 1)],
  term ((-40730860170708656518178151866160 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 1)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 2)],
  term ((30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (15, 2)],
  term ((159411278827456025234788665024563437368184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 1), (15, 1)],
  term ((-11006757768 : Rat) / 7401317245) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((2704701600759789466137495268252 : Rat) / 1273790490336191187829975377157) [(1, 1), (15, 1)],
  term ((93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)],
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 300 through 399. -/
theorem ep_Q2_002_block_09_0300_0399_valid :
    checkProductSumEq ep_Q2_002_partials_09_0300_0399
      ep_Q2_002_block_09_0300_0399 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
