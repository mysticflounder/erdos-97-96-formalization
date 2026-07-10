/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 21:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_21_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0500 : Poly :=
[
  term ((-294705188331674139 : Rat) / 28298395017400811) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 500 for generator 21. -/
def ep_Q2_020_partial_21_0500 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 21. -/
theorem ep_Q2_020_partial_21_0500_valid :
    mulPoly ep_Q2_020_coefficient_21_0500
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0501 : Poly :=
[
  term ((1540723537949905221 : Rat) / 113193580069603244) [(6, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 501 for generator 21. -/
def ep_Q2_020_partial_21_0501 : Poly :=
[
  term ((1540723537949905221 : Rat) / 56596790034801622) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 113193580069603244) [(6, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 21. -/
theorem ep_Q2_020_partial_21_0501_valid :
    mulPoly ep_Q2_020_coefficient_21_0501
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0502 : Poly :=
[
  term ((3997779211156146 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 502 for generator 21. -/
def ep_Q2_020_partial_21_0502 : Poly :=
[
  term ((7995558422312292 : Rat) / 28298395017400811) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-3997779211156146 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 21. -/
theorem ep_Q2_020_partial_21_0502_valid :
    mulPoly ep_Q2_020_coefficient_21_0502
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0503 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 21. -/
def ep_Q2_020_partial_21_0503 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 21. -/
theorem ep_Q2_020_partial_21_0503_valid :
    mulPoly ep_Q2_020_coefficient_21_0503
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0504 : Poly :=
[
  term ((-31572069295626096 : Rat) / 28298395017400811) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 504 for generator 21. -/
def ep_Q2_020_partial_21_0504 : Poly :=
[
  term ((-63144138591252192 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((31572069295626096 : Rat) / 28298395017400811) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 21. -/
theorem ep_Q2_020_partial_21_0504_valid :
    mulPoly ep_Q2_020_coefficient_21_0504
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0505 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 505 for generator 21. -/
def ep_Q2_020_partial_21_0505 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 21. -/
theorem ep_Q2_020_partial_21_0505_valid :
    mulPoly ep_Q2_020_coefficient_21_0505
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0506 : Poly :=
[
  term ((-1686147399959997573 : Rat) / 113193580069603244) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 506 for generator 21. -/
def ep_Q2_020_partial_21_0506 : Poly :=
[
  term ((-1686147399959997573 : Rat) / 56596790034801622) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((1686147399959997573 : Rat) / 113193580069603244) [(6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 21. -/
theorem ep_Q2_020_partial_21_0506_valid :
    mulPoly ep_Q2_020_coefficient_21_0506
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0507 : Poly :=
[
  term ((-247561266585996000 : Rat) / 28298395017400811) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 507 for generator 21. -/
def ep_Q2_020_partial_21_0507 : Poly :=
[
  term ((-495122533171992000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((247561266585996000 : Rat) / 28298395017400811) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 21. -/
theorem ep_Q2_020_partial_21_0507_valid :
    mulPoly ep_Q2_020_coefficient_21_0507
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0508 : Poly :=
[
  term ((-957191082295341 : Rat) / 113193580069603244) [(6, 1), (16, 1)]
]

/-- Partial product 508 for generator 21. -/
def ep_Q2_020_partial_21_0508 : Poly :=
[
  term ((-957191082295341 : Rat) / 56596790034801622) [(6, 1), (10, 1), (16, 1)],
  term ((957191082295341 : Rat) / 113193580069603244) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 21. -/
theorem ep_Q2_020_partial_21_0508_valid :
    mulPoly ep_Q2_020_coefficient_21_0508
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0509 : Poly :=
[
  term ((-308308298647661079 : Rat) / 56596790034801622) [(6, 2), (14, 1), (16, 1)]
]

/-- Partial product 509 for generator 21. -/
def ep_Q2_020_partial_21_0509 : Poly :=
[
  term ((-308308298647661079 : Rat) / 28298395017400811) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((308308298647661079 : Rat) / 56596790034801622) [(6, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 21. -/
theorem ep_Q2_020_partial_21_0509_valid :
    mulPoly ep_Q2_020_coefficient_21_0509
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0510 : Poly :=
[
  term ((10794524541140538 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

/-- Partial product 510 for generator 21. -/
def ep_Q2_020_partial_21_0510 : Poly :=
[
  term ((21589049082281076 : Rat) / 28298395017400811) [(6, 2), (10, 1), (16, 1)],
  term ((-10794524541140538 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 21. -/
theorem ep_Q2_020_partial_21_0510_valid :
    mulPoly ep_Q2_020_coefficient_21_0510
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0511 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 511 for generator 21. -/
def ep_Q2_020_partial_21_0511 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 21. -/
theorem ep_Q2_020_partial_21_0511_valid :
    mulPoly ep_Q2_020_coefficient_21_0511
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0512 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 512 for generator 21. -/
def ep_Q2_020_partial_21_0512 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 21. -/
theorem ep_Q2_020_partial_21_0512_valid :
    mulPoly ep_Q2_020_coefficient_21_0512
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0513 : Poly :=
[
  term ((75318245511320832 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 513 for generator 21. -/
def ep_Q2_020_partial_21_0513 : Poly :=
[
  term ((150636491022641664 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-75318245511320832 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 21. -/
theorem ep_Q2_020_partial_21_0513_valid :
    mulPoly ep_Q2_020_coefficient_21_0513
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0514 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 514 for generator 21. -/
def ep_Q2_020_partial_21_0514 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 21. -/
theorem ep_Q2_020_partial_21_0514_valid :
    mulPoly ep_Q2_020_coefficient_21_0514
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0515 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 515 for generator 21. -/
def ep_Q2_020_partial_21_0515 : Poly :=
[
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 21. -/
theorem ep_Q2_020_partial_21_0515_valid :
    mulPoly ep_Q2_020_coefficient_21_0515
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0516 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 516 for generator 21. -/
def ep_Q2_020_partial_21_0516 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 21. -/
theorem ep_Q2_020_partial_21_0516_valid :
    mulPoly ep_Q2_020_coefficient_21_0516
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0517 : Poly :=
[
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 517 for generator 21. -/
def ep_Q2_020_partial_21_0517 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 21. -/
theorem ep_Q2_020_partial_21_0517_valid :
    mulPoly ep_Q2_020_coefficient_21_0517
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0518 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 518 for generator 21. -/
def ep_Q2_020_partial_21_0518 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 21. -/
theorem ep_Q2_020_partial_21_0518_valid :
    mulPoly ep_Q2_020_coefficient_21_0518
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0519 : Poly :=
[
  term ((48795401747512233 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 519 for generator 21. -/
def ep_Q2_020_partial_21_0519 : Poly :=
[
  term ((97590803495024466 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-48795401747512233 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 21. -/
theorem ep_Q2_020_partial_21_0519_valid :
    mulPoly ep_Q2_020_coefficient_21_0519
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0520 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 520 for generator 21. -/
def ep_Q2_020_partial_21_0520 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 21. -/
theorem ep_Q2_020_partial_21_0520_valid :
    mulPoly ep_Q2_020_coefficient_21_0520
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0521 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 21. -/
def ep_Q2_020_partial_21_0521 : Poly :=
[
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 21. -/
theorem ep_Q2_020_partial_21_0521_valid :
    mulPoly ep_Q2_020_coefficient_21_0521
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0522 : Poly :=
[
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 522 for generator 21. -/
def ep_Q2_020_partial_21_0522 : Poly :=
[
  term ((-13973438316668256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 21. -/
theorem ep_Q2_020_partial_21_0522_valid :
    mulPoly ep_Q2_020_coefficient_21_0522
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0523 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 523 for generator 21. -/
def ep_Q2_020_partial_21_0523 : Poly :=
[
  term ((-155900428835400000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 21. -/
theorem ep_Q2_020_partial_21_0523_valid :
    mulPoly ep_Q2_020_coefficient_21_0523
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0524 : Poly :=
[
  term ((34674983936563740 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 524 for generator 21. -/
def ep_Q2_020_partial_21_0524 : Poly :=
[
  term ((69349967873127480 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-34674983936563740 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 21. -/
theorem ep_Q2_020_partial_21_0524_valid :
    mulPoly ep_Q2_020_coefficient_21_0524
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0525 : Poly :=
[
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 525 for generator 21. -/
def ep_Q2_020_partial_21_0525 : Poly :=
[
  term ((-575680206406485024 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 21. -/
theorem ep_Q2_020_partial_21_0525_valid :
    mulPoly ep_Q2_020_coefficient_21_0525
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0526 : Poly :=
[
  term ((943312363841277 : Rat) / 1230365000756557) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 21. -/
def ep_Q2_020_partial_21_0526 : Poly :=
[
  term ((1886624727682554 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-943312363841277 : Rat) / 1230365000756557) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 21. -/
theorem ep_Q2_020_partial_21_0526_valid :
    mulPoly ep_Q2_020_coefficient_21_0526
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0527 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 527 for generator 21. -/
def ep_Q2_020_partial_21_0527 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 21. -/
theorem ep_Q2_020_partial_21_0527_valid :
    mulPoly ep_Q2_020_coefficient_21_0527
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0528 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 528 for generator 21. -/
def ep_Q2_020_partial_21_0528 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 21. -/
theorem ep_Q2_020_partial_21_0528_valid :
    mulPoly ep_Q2_020_coefficient_21_0528
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0529 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 529 for generator 21. -/
def ep_Q2_020_partial_21_0529 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 21. -/
theorem ep_Q2_020_partial_21_0529_valid :
    mulPoly ep_Q2_020_coefficient_21_0529
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0530 : Poly :=
[
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 530 for generator 21. -/
def ep_Q2_020_partial_21_0530 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 21. -/
theorem ep_Q2_020_partial_21_0530_valid :
    mulPoly ep_Q2_020_coefficient_21_0530
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0531 : Poly :=
[
  term ((7795021441770000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 531 for generator 21. -/
def ep_Q2_020_partial_21_0531 : Poly :=
[
  term ((-7795021441770000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 21. -/
theorem ep_Q2_020_partial_21_0531_valid :
    mulPoly ep_Q2_020_coefficient_21_0531
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0532 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 532 for generator 21. -/
def ep_Q2_020_partial_21_0532 : Poly :=
[
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 21. -/
theorem ep_Q2_020_partial_21_0532_valid :
    mulPoly ep_Q2_020_coefficient_21_0532
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0533 : Poly :=
[
  term ((357714797033376 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 533 for generator 21. -/
def ep_Q2_020_partial_21_0533 : Poly :=
[
  term ((-357714797033376 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 21. -/
theorem ep_Q2_020_partial_21_0533_valid :
    mulPoly ep_Q2_020_coefficient_21_0533
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0534 : Poly :=
[
  term ((-53592968210241361 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 534 for generator 21. -/
def ep_Q2_020_partial_21_0534 : Poly :=
[
  term ((53592968210241361 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-107185936420482722 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 21. -/
theorem ep_Q2_020_partial_21_0534_valid :
    mulPoly ep_Q2_020_coefficient_21_0534
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0535 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 535 for generator 21. -/
def ep_Q2_020_partial_21_0535 : Poly :=
[
  term ((-171490471718940000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 21. -/
theorem ep_Q2_020_partial_21_0535_valid :
    mulPoly ep_Q2_020_coefficient_21_0535
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0536 : Poly :=
[
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 536 for generator 21. -/
def ep_Q2_020_partial_21_0536 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 21. -/
theorem ep_Q2_020_partial_21_0536_valid :
    mulPoly ep_Q2_020_coefficient_21_0536
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0537 : Poly :=
[
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 21. -/
def ep_Q2_020_partial_21_0537 : Poly :=
[
  term ((-7869725534734272 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 21. -/
theorem ep_Q2_020_partial_21_0537_valid :
    mulPoly ep_Q2_020_coefficient_21_0537
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0538 : Poly :=
[
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 21. -/
def ep_Q2_020_partial_21_0538 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 21. -/
theorem ep_Q2_020_partial_21_0538_valid :
    mulPoly ep_Q2_020_coefficient_21_0538
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0539 : Poly :=
[
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 539 for generator 21. -/
def ep_Q2_020_partial_21_0539 : Poly :=
[
  term ((13973438316668256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 21. -/
theorem ep_Q2_020_partial_21_0539_valid :
    mulPoly ep_Q2_020_coefficient_21_0539
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0540 : Poly :=
[
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 540 for generator 21. -/
def ep_Q2_020_partial_21_0540 : Poly :=
[
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 21. -/
theorem ep_Q2_020_partial_21_0540_valid :
    mulPoly ep_Q2_020_coefficient_21_0540
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0541 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 541 for generator 21. -/
def ep_Q2_020_partial_21_0541 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 21. -/
theorem ep_Q2_020_partial_21_0541_valid :
    mulPoly ep_Q2_020_coefficient_21_0541
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0542 : Poly :=
[
  term ((3897510720885000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 542 for generator 21. -/
def ep_Q2_020_partial_21_0542 : Poly :=
[
  term ((7795021441770000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 21. -/
theorem ep_Q2_020_partial_21_0542_valid :
    mulPoly ep_Q2_020_coefficient_21_0542
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0543 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 543 for generator 21. -/
def ep_Q2_020_partial_21_0543 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 21. -/
theorem ep_Q2_020_partial_21_0543_valid :
    mulPoly ep_Q2_020_coefficient_21_0543
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0544 : Poly :=
[
  term ((-486835826105449338 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 544 for generator 21. -/
def ep_Q2_020_partial_21_0544 : Poly :=
[
  term ((-973671652210898676 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((486835826105449338 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 21. -/
theorem ep_Q2_020_partial_21_0544_valid :
    mulPoly ep_Q2_020_coefficient_21_0544
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0545 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 545 for generator 21. -/
def ep_Q2_020_partial_21_0545 : Poly :=
[
  term ((575680206406485024 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 21. -/
theorem ep_Q2_020_partial_21_0545_valid :
    mulPoly ep_Q2_020_coefficient_21_0545
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0546 : Poly :=
[
  term ((178857398516688 : Rat) / 1230365000756557) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 546 for generator 21. -/
def ep_Q2_020_partial_21_0546 : Poly :=
[
  term ((357714797033376 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 21. -/
theorem ep_Q2_020_partial_21_0546_valid :
    mulPoly ep_Q2_020_coefficient_21_0546
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0547 : Poly :=
[
  term ((-53592968210241361 : Rat) / 56596790034801622) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 547 for generator 21. -/
def ep_Q2_020_partial_21_0547 : Poly :=
[
  term ((-53592968210241361 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term ((53592968210241361 : Rat) / 56596790034801622) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 21. -/
theorem ep_Q2_020_partial_21_0547_valid :
    mulPoly ep_Q2_020_coefficient_21_0547
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0548 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 548 for generator 21. -/
def ep_Q2_020_partial_21_0548 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 21. -/
theorem ep_Q2_020_partial_21_0548_valid :
    mulPoly ep_Q2_020_coefficient_21_0548
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0549 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 549 for generator 21. -/
def ep_Q2_020_partial_21_0549 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 3), (10, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 3), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 21. -/
theorem ep_Q2_020_partial_21_0549_valid :
    mulPoly ep_Q2_020_coefficient_21_0549
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0550 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 3), (16, 1)]
]

/-- Partial product 550 for generator 21. -/
def ep_Q2_020_partial_21_0550 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 21. -/
theorem ep_Q2_020_partial_21_0550_valid :
    mulPoly ep_Q2_020_coefficient_21_0550
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0551 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 551 for generator 21. -/
def ep_Q2_020_partial_21_0551 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 21. -/
theorem ep_Q2_020_partial_21_0551_valid :
    mulPoly ep_Q2_020_coefficient_21_0551
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0552 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 552 for generator 21. -/
def ep_Q2_020_partial_21_0552 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 21. -/
theorem ep_Q2_020_partial_21_0552_valid :
    mulPoly ep_Q2_020_coefficient_21_0552
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0553 : Poly :=
[
  term ((294705188331674139 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 553 for generator 21. -/
def ep_Q2_020_partial_21_0553 : Poly :=
[
  term ((-294705188331674139 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 21. -/
theorem ep_Q2_020_partial_21_0553_valid :
    mulPoly ep_Q2_020_coefficient_21_0553
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0554 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 21. -/
def ep_Q2_020_partial_21_0554 : Poly :=
[
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 21. -/
theorem ep_Q2_020_partial_21_0554_valid :
    mulPoly ep_Q2_020_coefficient_21_0554
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0555 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 555 for generator 21. -/
def ep_Q2_020_partial_21_0555 : Poly :=
[
  term ((3247925600737500 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 21. -/
theorem ep_Q2_020_partial_21_0555_valid :
    mulPoly ep_Q2_020_coefficient_21_0555
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0556 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 556 for generator 21. -/
def ep_Q2_020_partial_21_0556 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 21. -/
theorem ep_Q2_020_partial_21_0556_valid :
    mulPoly ep_Q2_020_coefficient_21_0556
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0557 : Poly :=
[
  term ((55884022713451971 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 557 for generator 21. -/
def ep_Q2_020_partial_21_0557 : Poly :=
[
  term ((-55884022713451971 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((111768045426903942 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 21. -/
theorem ep_Q2_020_partial_21_0557_valid :
    mulPoly ep_Q2_020_coefficient_21_0557
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0558 : Poly :=
[
  term ((140491951463384736 : Rat) / 28298395017400811) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 558 for generator 21. -/
def ep_Q2_020_partial_21_0558 : Poly :=
[
  term ((-140491951463384736 : Rat) / 28298395017400811) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((280983902926769472 : Rat) / 28298395017400811) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 21. -/
theorem ep_Q2_020_partial_21_0558_valid :
    mulPoly ep_Q2_020_coefficient_21_0558
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0559 : Poly :=
[
  term ((-473163480869574756 : Rat) / 28298395017400811) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 559 for generator 21. -/
def ep_Q2_020_partial_21_0559 : Poly :=
[
  term ((473163480869574756 : Rat) / 28298395017400811) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-946326961739149512 : Rat) / 28298395017400811) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 21. -/
theorem ep_Q2_020_partial_21_0559_valid :
    mulPoly ep_Q2_020_coefficient_21_0559
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0560 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 560 for generator 21. -/
def ep_Q2_020_partial_21_0560 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 21. -/
theorem ep_Q2_020_partial_21_0560_valid :
    mulPoly ep_Q2_020_coefficient_21_0560
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0561 : Poly :=
[
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 561 for generator 21. -/
def ep_Q2_020_partial_21_0561 : Poly :=
[
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 21. -/
theorem ep_Q2_020_partial_21_0561_valid :
    mulPoly ep_Q2_020_coefficient_21_0561
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0562 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 562 for generator 21. -/
def ep_Q2_020_partial_21_0562 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 21. -/
theorem ep_Q2_020_partial_21_0562_valid :
    mulPoly ep_Q2_020_coefficient_21_0562
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0563 : Poly :=
[
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 21. -/
def ep_Q2_020_partial_21_0563 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 21. -/
theorem ep_Q2_020_partial_21_0563_valid :
    mulPoly ep_Q2_020_coefficient_21_0563
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0564 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 564 for generator 21. -/
def ep_Q2_020_partial_21_0564 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 21. -/
theorem ep_Q2_020_partial_21_0564_valid :
    mulPoly ep_Q2_020_coefficient_21_0564
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0565 : Poly :=
[
  term ((212910917530741782 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 565 for generator 21. -/
def ep_Q2_020_partial_21_0565 : Poly :=
[
  term ((425821835061483564 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-212910917530741782 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 21. -/
theorem ep_Q2_020_partial_21_0565_valid :
    mulPoly ep_Q2_020_coefficient_21_0565
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0566 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 566 for generator 21. -/
def ep_Q2_020_partial_21_0566 : Poly :=
[
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 21. -/
theorem ep_Q2_020_partial_21_0566_valid :
    mulPoly ep_Q2_020_coefficient_21_0566
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0567 : Poly :=
[
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 567 for generator 21. -/
def ep_Q2_020_partial_21_0567 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 21. -/
theorem ep_Q2_020_partial_21_0567_valid :
    mulPoly ep_Q2_020_coefficient_21_0567
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0568 : Poly :=
[
  term ((294705188331674139 : Rat) / 56596790034801622) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 568 for generator 21. -/
def ep_Q2_020_partial_21_0568 : Poly :=
[
  term ((294705188331674139 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-294705188331674139 : Rat) / 56596790034801622) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 21. -/
theorem ep_Q2_020_partial_21_0568_valid :
    mulPoly ep_Q2_020_coefficient_21_0568
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0569 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 569 for generator 21. -/
def ep_Q2_020_partial_21_0569 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 21. -/
theorem ep_Q2_020_partial_21_0569_valid :
    mulPoly ep_Q2_020_coefficient_21_0569
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0570 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 21. -/
def ep_Q2_020_partial_21_0570 : Poly :=
[
  term ((3934862767367136 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 21. -/
theorem ep_Q2_020_partial_21_0570_valid :
    mulPoly ep_Q2_020_coefficient_21_0570
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0571 : Poly :=
[
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 571 for generator 21. -/
def ep_Q2_020_partial_21_0571 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 21. -/
theorem ep_Q2_020_partial_21_0571_valid :
    mulPoly ep_Q2_020_coefficient_21_0571
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0572 : Poly :=
[
  term ((1575579030354900477 : Rat) / 113193580069603244) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 572 for generator 21. -/
def ep_Q2_020_partial_21_0572 : Poly :=
[
  term ((1575579030354900477 : Rat) / 56596790034801622) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1575579030354900477 : Rat) / 113193580069603244) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 21. -/
theorem ep_Q2_020_partial_21_0572_valid :
    mulPoly ep_Q2_020_coefficient_21_0572
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0573 : Poly :=
[
  term ((-19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 573 for generator 21. -/
def ep_Q2_020_partial_21_0573 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 21. -/
theorem ep_Q2_020_partial_21_0573_valid :
    mulPoly ep_Q2_020_coefficient_21_0573
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0574 : Poly :=
[
  term ((19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 574 for generator 21. -/
def ep_Q2_020_partial_21_0574 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 21. -/
theorem ep_Q2_020_partial_21_0574_valid :
    mulPoly ep_Q2_020_coefficient_21_0574
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0575 : Poly :=
[
  term ((55884022713451971 : Rat) / 56596790034801622) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 575 for generator 21. -/
def ep_Q2_020_partial_21_0575 : Poly :=
[
  term ((55884022713451971 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-55884022713451971 : Rat) / 56596790034801622) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 21. -/
theorem ep_Q2_020_partial_21_0575_valid :
    mulPoly ep_Q2_020_coefficient_21_0575
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0576 : Poly :=
[
  term ((225278615687458620 : Rat) / 28298395017400811) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 21. -/
def ep_Q2_020_partial_21_0576 : Poly :=
[
  term ((450557231374917240 : Rat) / 28298395017400811) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-225278615687458620 : Rat) / 28298395017400811) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 21. -/
theorem ep_Q2_020_partial_21_0576_valid :
    mulPoly ep_Q2_020_coefficient_21_0576
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0577 : Poly :=
[
  term ((-894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 21. -/
def ep_Q2_020_partial_21_0577 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 21. -/
theorem ep_Q2_020_partial_21_0577_valid :
    mulPoly ep_Q2_020_coefficient_21_0577
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0578 : Poly :=
[
  term ((-236581740434787378 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 578 for generator 21. -/
def ep_Q2_020_partial_21_0578 : Poly :=
[
  term ((-473163480869574756 : Rat) / 28298395017400811) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((236581740434787378 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 21. -/
theorem ep_Q2_020_partial_21_0578_valid :
    mulPoly ep_Q2_020_coefficient_21_0578
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0579 : Poly :=
[
  term ((894286992583440 : Rat) / 1230365000756557) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 579 for generator 21. -/
def ep_Q2_020_partial_21_0579 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 21. -/
theorem ep_Q2_020_partial_21_0579_valid :
    mulPoly ep_Q2_020_coefficient_21_0579
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0580 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 580 for generator 21. -/
def ep_Q2_020_partial_21_0580 : Poly :=
[
  term ((575680206406485024 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 21. -/
theorem ep_Q2_020_partial_21_0580_valid :
    mulPoly ep_Q2_020_coefficient_21_0580
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0581 : Poly :=
[
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 581 for generator 21. -/
def ep_Q2_020_partial_21_0581 : Poly :=
[
  term ((-767573608541980032 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 21. -/
theorem ep_Q2_020_partial_21_0581_valid :
    mulPoly ep_Q2_020_coefficient_21_0581
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0582 : Poly :=
[
  term ((-273928087067836248 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 582 for generator 21. -/
def ep_Q2_020_partial_21_0582 : Poly :=
[
  term ((-547856174135672496 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((273928087067836248 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 21. -/
theorem ep_Q2_020_partial_21_0582_valid :
    mulPoly ep_Q2_020_coefficient_21_0582
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0583 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 583 for generator 21. -/
def ep_Q2_020_partial_21_0583 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 21. -/
theorem ep_Q2_020_partial_21_0583_valid :
    mulPoly ep_Q2_020_coefficient_21_0583
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0584 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 584 for generator 21. -/
def ep_Q2_020_partial_21_0584 : Poly :=
[
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 21. -/
theorem ep_Q2_020_partial_21_0584_valid :
    mulPoly ep_Q2_020_coefficient_21_0584
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0585 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 585 for generator 21. -/
def ep_Q2_020_partial_21_0585 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 21. -/
theorem ep_Q2_020_partial_21_0585_valid :
    mulPoly ep_Q2_020_coefficient_21_0585
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0586 : Poly :=
[
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 586 for generator 21. -/
def ep_Q2_020_partial_21_0586 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-575680206406485024 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 21. -/
theorem ep_Q2_020_partial_21_0586_valid :
    mulPoly ep_Q2_020_coefficient_21_0586
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0587 : Poly :=
[
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 587 for generator 21. -/
def ep_Q2_020_partial_21_0587 : Poly :=
[
  term ((767573608541980032 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 21. -/
theorem ep_Q2_020_partial_21_0587_valid :
    mulPoly ep_Q2_020_coefficient_21_0587
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0588 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 588 for generator 21. -/
def ep_Q2_020_partial_21_0588 : Poly :=
[
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 21. -/
theorem ep_Q2_020_partial_21_0588_valid :
    mulPoly ep_Q2_020_coefficient_21_0588
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0589 : Poly :=
[
  term ((114346394036992338 : Rat) / 28298395017400811) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 589 for generator 21. -/
def ep_Q2_020_partial_21_0589 : Poly :=
[
  term ((-114346394036992338 : Rat) / 28298395017400811) [(7, 2), (10, 1), (16, 1)],
  term ((228692788073984676 : Rat) / 28298395017400811) [(7, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 21. -/
theorem ep_Q2_020_partial_21_0589_valid :
    mulPoly ep_Q2_020_coefficient_21_0589
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0590 : Poly :=
[
  term ((-212361597579913575 : Rat) / 56596790034801622) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 590 for generator 21. -/
def ep_Q2_020_partial_21_0590 : Poly :=
[
  term ((-212361597579913575 : Rat) / 28298395017400811) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((212361597579913575 : Rat) / 56596790034801622) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 21. -/
theorem ep_Q2_020_partial_21_0590_valid :
    mulPoly ep_Q2_020_coefficient_21_0590
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0591 : Poly :=
[
  term ((57173197018496169 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 591 for generator 21. -/
def ep_Q2_020_partial_21_0591 : Poly :=
[
  term ((114346394036992338 : Rat) / 28298395017400811) [(7, 2), (10, 1), (16, 1)],
  term ((-57173197018496169 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 21. -/
theorem ep_Q2_020_partial_21_0591_valid :
    mulPoly ep_Q2_020_coefficient_21_0591
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0592 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 592 for generator 21. -/
def ep_Q2_020_partial_21_0592 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 3), (9, 1), (10, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 21. -/
theorem ep_Q2_020_partial_21_0592_valid :
    mulPoly ep_Q2_020_coefficient_21_0592
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0593 : Poly :=
[
  term ((-23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (16, 1)]
]

/-- Partial product 593 for generator 21. -/
def ep_Q2_020_partial_21_0593 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (9, 1), (10, 1), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 21. -/
theorem ep_Q2_020_partial_21_0593_valid :
    mulPoly ep_Q2_020_coefficient_21_0593
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0594 : Poly :=
[
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 21. -/
def ep_Q2_020_partial_21_0594 : Poly :=
[
  term ((-51966809611800000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 21. -/
theorem ep_Q2_020_partial_21_0594_valid :
    mulPoly ep_Q2_020_coefficient_21_0594
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0595 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 595 for generator 21. -/
def ep_Q2_020_partial_21_0595 : Poly :=
[
  term ((-2384765313555840 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 21. -/
theorem ep_Q2_020_partial_21_0595_valid :
    mulPoly ep_Q2_020_coefficient_21_0595
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0596 : Poly :=
[
  term ((-72487606254096515 : Rat) / 2460730001513114) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 596 for generator 21. -/
def ep_Q2_020_partial_21_0596 : Poly :=
[
  term ((-72487606254096515 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((72487606254096515 : Rat) / 2460730001513114) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 21. -/
theorem ep_Q2_020_partial_21_0596_valid :
    mulPoly ep_Q2_020_coefficient_21_0596
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0597 : Poly :=
[
  term ((14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 597 for generator 21. -/
def ep_Q2_020_partial_21_0597 : Poly :=
[
  term ((28581745286490000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 21. -/
theorem ep_Q2_020_partial_21_0597_valid :
    mulPoly ep_Q2_020_coefficient_21_0597
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0598 : Poly :=
[
  term ((655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 21. -/
def ep_Q2_020_partial_21_0598 : Poly :=
[
  term ((1311620922455712 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 21. -/
theorem ep_Q2_020_partial_21_0598_valid :
    mulPoly ep_Q2_020_coefficient_21_0598
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0599 : Poly :=
[
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 599 for generator 21. -/
def ep_Q2_020_partial_21_0599 : Poly :=
[
  term ((51966809611800000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 21. -/
theorem ep_Q2_020_partial_21_0599_valid :
    mulPoly ep_Q2_020_coefficient_21_0599
        ep_Q2_020_generator_21_0500_0599 =
      ep_Q2_020_partial_21_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_21_0500_0599 : List Poly :=
[
  ep_Q2_020_partial_21_0500,
  ep_Q2_020_partial_21_0501,
  ep_Q2_020_partial_21_0502,
  ep_Q2_020_partial_21_0503,
  ep_Q2_020_partial_21_0504,
  ep_Q2_020_partial_21_0505,
  ep_Q2_020_partial_21_0506,
  ep_Q2_020_partial_21_0507,
  ep_Q2_020_partial_21_0508,
  ep_Q2_020_partial_21_0509,
  ep_Q2_020_partial_21_0510,
  ep_Q2_020_partial_21_0511,
  ep_Q2_020_partial_21_0512,
  ep_Q2_020_partial_21_0513,
  ep_Q2_020_partial_21_0514,
  ep_Q2_020_partial_21_0515,
  ep_Q2_020_partial_21_0516,
  ep_Q2_020_partial_21_0517,
  ep_Q2_020_partial_21_0518,
  ep_Q2_020_partial_21_0519,
  ep_Q2_020_partial_21_0520,
  ep_Q2_020_partial_21_0521,
  ep_Q2_020_partial_21_0522,
  ep_Q2_020_partial_21_0523,
  ep_Q2_020_partial_21_0524,
  ep_Q2_020_partial_21_0525,
  ep_Q2_020_partial_21_0526,
  ep_Q2_020_partial_21_0527,
  ep_Q2_020_partial_21_0528,
  ep_Q2_020_partial_21_0529,
  ep_Q2_020_partial_21_0530,
  ep_Q2_020_partial_21_0531,
  ep_Q2_020_partial_21_0532,
  ep_Q2_020_partial_21_0533,
  ep_Q2_020_partial_21_0534,
  ep_Q2_020_partial_21_0535,
  ep_Q2_020_partial_21_0536,
  ep_Q2_020_partial_21_0537,
  ep_Q2_020_partial_21_0538,
  ep_Q2_020_partial_21_0539,
  ep_Q2_020_partial_21_0540,
  ep_Q2_020_partial_21_0541,
  ep_Q2_020_partial_21_0542,
  ep_Q2_020_partial_21_0543,
  ep_Q2_020_partial_21_0544,
  ep_Q2_020_partial_21_0545,
  ep_Q2_020_partial_21_0546,
  ep_Q2_020_partial_21_0547,
  ep_Q2_020_partial_21_0548,
  ep_Q2_020_partial_21_0549,
  ep_Q2_020_partial_21_0550,
  ep_Q2_020_partial_21_0551,
  ep_Q2_020_partial_21_0552,
  ep_Q2_020_partial_21_0553,
  ep_Q2_020_partial_21_0554,
  ep_Q2_020_partial_21_0555,
  ep_Q2_020_partial_21_0556,
  ep_Q2_020_partial_21_0557,
  ep_Q2_020_partial_21_0558,
  ep_Q2_020_partial_21_0559,
  ep_Q2_020_partial_21_0560,
  ep_Q2_020_partial_21_0561,
  ep_Q2_020_partial_21_0562,
  ep_Q2_020_partial_21_0563,
  ep_Q2_020_partial_21_0564,
  ep_Q2_020_partial_21_0565,
  ep_Q2_020_partial_21_0566,
  ep_Q2_020_partial_21_0567,
  ep_Q2_020_partial_21_0568,
  ep_Q2_020_partial_21_0569,
  ep_Q2_020_partial_21_0570,
  ep_Q2_020_partial_21_0571,
  ep_Q2_020_partial_21_0572,
  ep_Q2_020_partial_21_0573,
  ep_Q2_020_partial_21_0574,
  ep_Q2_020_partial_21_0575,
  ep_Q2_020_partial_21_0576,
  ep_Q2_020_partial_21_0577,
  ep_Q2_020_partial_21_0578,
  ep_Q2_020_partial_21_0579,
  ep_Q2_020_partial_21_0580,
  ep_Q2_020_partial_21_0581,
  ep_Q2_020_partial_21_0582,
  ep_Q2_020_partial_21_0583,
  ep_Q2_020_partial_21_0584,
  ep_Q2_020_partial_21_0585,
  ep_Q2_020_partial_21_0586,
  ep_Q2_020_partial_21_0587,
  ep_Q2_020_partial_21_0588,
  ep_Q2_020_partial_21_0589,
  ep_Q2_020_partial_21_0590,
  ep_Q2_020_partial_21_0591,
  ep_Q2_020_partial_21_0592,
  ep_Q2_020_partial_21_0593,
  ep_Q2_020_partial_21_0594,
  ep_Q2_020_partial_21_0595,
  ep_Q2_020_partial_21_0596,
  ep_Q2_020_partial_21_0597,
  ep_Q2_020_partial_21_0598,
  ep_Q2_020_partial_21_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_21_0500_0599 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((1540723537949905221 : Rat) / 56596790034801622) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63144138591252192 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1686147399959997573 : Rat) / 56596790034801622) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-495122533171992000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-957191082295341 : Rat) / 56596790034801622) [(6, 1), (10, 1), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(6, 1), (11, 2), (16, 1)],
  term ((-1540723537949905221 : Rat) / 113193580069603244) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3997779211156146 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31572069295626096 : Rat) / 28298395017400811) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1686147399959997573 : Rat) / 113193580069603244) [(6, 1), (14, 1), (16, 1)],
  term ((247561266585996000 : Rat) / 28298395017400811) [(6, 1), (15, 2), (16, 1)],
  term ((957191082295341 : Rat) / 113193580069603244) [(6, 1), (16, 1)],
  term ((-308308298647661079 : Rat) / 28298395017400811) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(6, 2), (10, 1), (16, 1)],
  term ((308308298647661079 : Rat) / 56596790034801622) [(6, 2), (14, 1), (16, 1)],
  term ((-10794524541140538 : Rat) / 28298395017400811) [(6, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((150636491022641664 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-75318245511320832 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((97590803495024466 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-13973438316668256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((69349967873127480 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-575680206406485024 : Rat) / 28298395017400811) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1886624727682554 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-48795401747512233 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-34674983936563740 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-943312363841277 : Rat) / 1230365000756557) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-171490471718940000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7869725534734272 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13973438316668256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-829751600609277420 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((575680206406485024 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-107185936420482722 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((486835826105449338 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((53592968210241361 : Rat) / 56596790034801622) [(7, 1), (9, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 3), (10, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 1), (9, 3), (16, 1)],
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((425821835061483564 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1582074881556375477 : Rat) / 56596790034801622) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((310065279911532504 : Rat) / 28298395017400811) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((111768045426903942 : Rat) / 28298395017400811) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((280983902926769472 : Rat) / 28298395017400811) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-946326961739149512 : Rat) / 28298395017400811) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-212910917530741782 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 56596790034801622) [(7, 1), (11, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1575579030354900477 : Rat) / 113193580069603244) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-55884022713451971 : Rat) / 56596790034801622) [(7, 1), (13, 1), (16, 1)],
  term ((-225278615687458620 : Rat) / 28298395017400811) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((236581740434787378 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(7, 1), (15, 3), (16, 1)],
  term ((575680206406485024 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-767573608541980032 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-547856174135672496 : Rat) / 28298395017400811) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((273928087067836248 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((767573608541980032 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-575680206406485024 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 2), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)],
  term ((-212361597579913575 : Rat) / 28298395017400811) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((228692788073984676 : Rat) / 28298395017400811) [(7, 2), (10, 2), (16, 1)],
  term ((212361597579913575 : Rat) / 56596790034801622) [(7, 2), (14, 1), (16, 1)],
  term ((-57173197018496169 : Rat) / 28298395017400811) [(7, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (9, 1), (10, 2), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(7, 3), (9, 1), (16, 1)],
  term ((-51966809611800000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2384765313555840 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-72487606254096515 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((51966809611800000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((72487606254096515 : Rat) / 2460730001513114) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 500 through 599. -/
theorem ep_Q2_020_block_21_0500_0599_valid :
    checkProductSumEq ep_Q2_020_partials_21_0500_0599
      ep_Q2_020_block_21_0500_0599 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
