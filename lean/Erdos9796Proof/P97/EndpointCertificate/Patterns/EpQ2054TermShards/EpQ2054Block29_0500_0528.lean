/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 29:500-528

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_29_0500_0528 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0500 : Poly :=
[
  term ((-63167460068027 : Rat) / 360267892136) [(9, 1), (13, 1)]
]

/-- Partial product 500 for generator 29. -/
def ep_Q2_054_partial_29_0500 : Poly :=
[
  term ((-63167460068027 : Rat) / 180133946068) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((63167460068027 : Rat) / 360267892136) [(9, 1), (12, 2), (13, 1)],
  term ((-63167460068027 : Rat) / 180133946068) [(9, 1), (13, 2), (15, 1)],
  term ((63167460068027 : Rat) / 360267892136) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 29. -/
theorem ep_Q2_054_partial_29_0500_valid :
    mulPoly ep_Q2_054_coefficient_29_0500
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0501 : Poly :=
[
  term ((48985890175353 : Rat) / 180133946068) [(9, 1), (15, 1)]
]

/-- Partial product 501 for generator 29. -/
def ep_Q2_054_partial_29_0501 : Poly :=
[
  term ((48985890175353 : Rat) / 90066973034) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48985890175353 : Rat) / 180133946068) [(9, 1), (12, 2), (15, 1)],
  term ((48985890175353 : Rat) / 90066973034) [(9, 1), (13, 1), (15, 2)],
  term ((-48985890175353 : Rat) / 180133946068) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 29. -/
theorem ep_Q2_054_partial_29_0501_valid :
    mulPoly ep_Q2_054_coefficient_29_0501
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0502 : Poly :=
[
  term ((1277718778680 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 29. -/
def ep_Q2_054_partial_29_0502 : Poly :=
[
  term ((2555437557360 : Rat) / 45033486517) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1277718778680 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2555437557360 : Rat) / 45033486517) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1277718778680 : Rat) / 45033486517) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 29. -/
theorem ep_Q2_054_partial_29_0502_valid :
    mulPoly ep_Q2_054_coefficient_29_0502
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0503 : Poly :=
[
  term ((1106801874423 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 503 for generator 29. -/
def ep_Q2_054_partial_29_0503 : Poly :=
[
  term ((2213603748846 : Rat) / 45033486517) [(9, 2), (12, 1), (14, 1)],
  term ((-1106801874423 : Rat) / 45033486517) [(9, 2), (12, 2)],
  term ((2213603748846 : Rat) / 45033486517) [(9, 2), (13, 1), (15, 1)],
  term ((-1106801874423 : Rat) / 45033486517) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 29. -/
theorem ep_Q2_054_partial_29_0503_valid :
    mulPoly ep_Q2_054_coefficient_29_0503
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0504 : Poly :=
[
  term ((-408880257516 : Rat) / 45033486517) [(9, 2), (10, 1)]
]

/-- Partial product 504 for generator 29. -/
def ep_Q2_054_partial_29_0504 : Poly :=
[
  term ((-817760515032 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 2)],
  term ((-817760515032 : Rat) / 45033486517) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 29. -/
theorem ep_Q2_054_partial_29_0504_valid :
    mulPoly ep_Q2_054_coefficient_29_0504
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0505 : Poly :=
[
  term ((612389452410 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 505 for generator 29. -/
def ep_Q2_054_partial_29_0505 : Poly :=
[
  term ((1224778904820 : Rat) / 45033486517) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-612389452410 : Rat) / 45033486517) [(9, 2), (12, 1), (13, 2)],
  term ((1224778904820 : Rat) / 45033486517) [(9, 2), (12, 2), (14, 1)],
  term ((-612389452410 : Rat) / 45033486517) [(9, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 29. -/
theorem ep_Q2_054_partial_29_0505_valid :
    mulPoly ep_Q2_054_coefficient_29_0505
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0506 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 506 for generator 29. -/
def ep_Q2_054_partial_29_0506 : Poly :=
[
  term ((6584088149532 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 29. -/
theorem ep_Q2_054_partial_29_0506_valid :
    mulPoly ep_Q2_054_coefficient_29_0506
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0507 : Poly :=
[
  term ((12351476306976 : Rat) / 45033486517) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 507 for generator 29. -/
def ep_Q2_054_partial_29_0507 : Poly :=
[
  term ((24702952613952 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((24702952613952 : Rat) / 45033486517) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 29. -/
theorem ep_Q2_054_partial_29_0507_valid :
    mulPoly ep_Q2_054_coefficient_29_0507
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0508 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 508 for generator 29. -/
def ep_Q2_054_partial_29_0508 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 29. -/
theorem ep_Q2_054_partial_29_0508_valid :
    mulPoly ep_Q2_054_coefficient_29_0508
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0509 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 509 for generator 29. -/
def ep_Q2_054_partial_29_0509 : Poly :=
[
  term ((-6584088149532 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(10, 1), (13, 2), (15, 2)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 29. -/
theorem ep_Q2_054_partial_29_0509_valid :
    mulPoly ep_Q2_054_coefficient_29_0509
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0510 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 29. -/
def ep_Q2_054_partial_29_0510 : Poly :=
[
  term ((-121076473400 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 29. -/
theorem ep_Q2_054_partial_29_0510_valid :
    mulPoly ep_Q2_054_coefficient_29_0510
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0511 : Poly :=
[
  term ((-23322085193004 : Rat) / 45033486517) [(10, 1), (15, 2)]
]

/-- Partial product 511 for generator 29. -/
def ep_Q2_054_partial_29_0511 : Poly :=
[
  term ((-46644170386008 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((23322085193004 : Rat) / 45033486517) [(10, 1), (12, 2), (15, 2)],
  term ((-46644170386008 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 3)],
  term ((23322085193004 : Rat) / 45033486517) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 29. -/
theorem ep_Q2_054_partial_29_0511_valid :
    mulPoly ep_Q2_054_coefficient_29_0511
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0512 : Poly :=
[
  term ((-521418493026 : Rat) / 45033486517) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 512 for generator 29. -/
def ep_Q2_054_partial_29_0512 : Poly :=
[
  term ((-1042836986052 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1042836986052 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 29. -/
theorem ep_Q2_054_partial_29_0512_valid :
    mulPoly ep_Q2_054_coefficient_29_0512
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0513 : Poly :=
[
  term ((-45403677525 : Rat) / 90066973034) [(10, 1), (16, 1)]
]

/-- Partial product 513 for generator 29. -/
def ep_Q2_054_partial_29_0513 : Poly :=
[
  term ((-45403677525 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(10, 1), (12, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 29. -/
theorem ep_Q2_054_partial_29_0513_valid :
    mulPoly ep_Q2_054_coefficient_29_0513
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0514 : Poly :=
[
  term ((-23065163253678 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 514 for generator 29. -/
def ep_Q2_054_partial_29_0514 : Poly :=
[
  term ((-46130326507356 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((23065163253678 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-46130326507356 : Rat) / 45033486517) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((23065163253678 : Rat) / 45033486517) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 29. -/
theorem ep_Q2_054_partial_29_0514_valid :
    mulPoly ep_Q2_054_coefficient_29_0514
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0515 : Poly :=
[
  term ((548674012461 : Rat) / 45033486517) [(11, 1), (13, 1)]
]

/-- Partial product 515 for generator 29. -/
def ep_Q2_054_partial_29_0515 : Poly :=
[
  term ((1097348024922 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(11, 1), (12, 2), (13, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(11, 1), (13, 2), (15, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 29. -/
theorem ep_Q2_054_partial_29_0515_valid :
    mulPoly ep_Q2_054_coefficient_29_0515
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0516 : Poly :=
[
  term ((119738127537201 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 516 for generator 29. -/
def ep_Q2_054_partial_29_0516 : Poly :=
[
  term ((119738127537201 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-119738127537201 : Rat) / 90066973034) [(11, 1), (12, 2), (15, 1)],
  term ((119738127537201 : Rat) / 45033486517) [(11, 1), (13, 1), (15, 2)],
  term ((-119738127537201 : Rat) / 90066973034) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 29. -/
theorem ep_Q2_054_partial_29_0516_valid :
    mulPoly ep_Q2_054_coefficient_29_0516
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0517 : Poly :=
[
  term ((1495347986793 : Rat) / 90066973034) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 29. -/
def ep_Q2_054_partial_29_0517 : Poly :=
[
  term ((1495347986793 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1495347986793 : Rat) / 90066973034) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1495347986793 : Rat) / 45033486517) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1495347986793 : Rat) / 90066973034) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 29. -/
theorem ep_Q2_054_partial_29_0517_valid :
    mulPoly ep_Q2_054_coefficient_29_0517
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0518 : Poly :=
[
  term ((-7132762161993 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 518 for generator 29. -/
def ep_Q2_054_partial_29_0518 : Poly :=
[
  term ((-14265524323986 : Rat) / 45033486517) [(11, 2), (12, 1), (14, 1)],
  term ((7132762161993 : Rat) / 45033486517) [(11, 2), (12, 2)],
  term ((-14265524323986 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1)],
  term ((7132762161993 : Rat) / 45033486517) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 29. -/
theorem ep_Q2_054_partial_29_0518_valid :
    mulPoly ep_Q2_054_coefficient_29_0518
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0519 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (16, 1)]
]

/-- Partial product 519 for generator 29. -/
def ep_Q2_054_partial_29_0519 : Poly :=
[
  term ((-121076473400 : Rat) / 45033486517) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (12, 2), (16, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 29. -/
theorem ep_Q2_054_partial_29_0519_valid :
    mulPoly ep_Q2_054_coefficient_29_0519
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0520 : Poly :=
[
  term ((4514323132475 : Rat) / 45033486517) [(12, 1)]
]

/-- Partial product 520 for generator 29. -/
def ep_Q2_054_partial_29_0520 : Poly :=
[
  term ((9028646264950 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)],
  term ((-4514323132475 : Rat) / 45033486517) [(12, 1), (13, 2)],
  term ((9028646264950 : Rat) / 45033486517) [(12, 2), (14, 1)],
  term ((-4514323132475 : Rat) / 45033486517) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 29. -/
theorem ep_Q2_054_partial_29_0520_valid :
    mulPoly ep_Q2_054_coefficient_29_0520
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0521 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 521 for generator 29. -/
def ep_Q2_054_partial_29_0521 : Poly :=
[
  term ((-13511540080152 : Rat) / 45033486517) [(12, 1), (13, 2), (15, 2)],
  term ((6755770040076 : Rat) / 45033486517) [(12, 1), (13, 3), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 29. -/
theorem ep_Q2_054_partial_29_0521_valid :
    mulPoly ep_Q2_054_coefficient_29_0521
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0522 : Poly :=
[
  term ((72596645398821 : Rat) / 90066973034) [(12, 1), (15, 2)]
]

/-- Partial product 522 for generator 29. -/
def ep_Q2_054_partial_29_0522 : Poly :=
[
  term ((72596645398821 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 3)],
  term ((-72596645398821 : Rat) / 90066973034) [(12, 1), (13, 2), (15, 2)],
  term ((72596645398821 : Rat) / 45033486517) [(12, 2), (14, 1), (15, 2)],
  term ((-72596645398821 : Rat) / 90066973034) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 29. -/
theorem ep_Q2_054_partial_29_0522_valid :
    mulPoly ep_Q2_054_coefficient_29_0522
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0523 : Poly :=
[
  term ((-75672795875 : Rat) / 90066973034) [(12, 1), (16, 1)]
]

/-- Partial product 523 for generator 29. -/
def ep_Q2_054_partial_29_0523 : Poly :=
[
  term ((-75672795875 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((75672795875 : Rat) / 90066973034) [(12, 1), (13, 2), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(12, 2), (14, 1), (16, 1)],
  term ((75672795875 : Rat) / 90066973034) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 29. -/
theorem ep_Q2_054_partial_29_0523_valid :
    mulPoly ep_Q2_054_coefficient_29_0523
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0524 : Poly :=
[
  term ((-172131517497705 : Rat) / 180133946068) [(13, 1), (15, 1)]
]

/-- Partial product 524 for generator 29. -/
def ep_Q2_054_partial_29_0524 : Poly :=
[
  term ((-172131517497705 : Rat) / 90066973034) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((172131517497705 : Rat) / 180133946068) [(12, 2), (13, 1), (15, 1)],
  term ((-172131517497705 : Rat) / 90066973034) [(13, 2), (15, 2)],
  term ((172131517497705 : Rat) / 180133946068) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 29. -/
theorem ep_Q2_054_partial_29_0524_valid :
    mulPoly ep_Q2_054_coefficient_29_0524
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0525 : Poly :=
[
  term ((75672795875 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 525 for generator 29. -/
def ep_Q2_054_partial_29_0525 : Poly :=
[
  term ((151345591750 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((151345591750 : Rat) / 45033486517) [(13, 2), (15, 2), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 29. -/
theorem ep_Q2_054_partial_29_0525_valid :
    mulPoly ep_Q2_054_coefficient_29_0525
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0526 : Poly :=
[
  term ((-37683889295637 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 526 for generator 29. -/
def ep_Q2_054_partial_29_0526 : Poly :=
[
  term ((-75367778591274 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2)],
  term ((37683889295637 : Rat) / 45033486517) [(12, 2), (15, 2)],
  term ((-75367778591274 : Rat) / 45033486517) [(13, 1), (15, 3)],
  term ((37683889295637 : Rat) / 45033486517) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 29. -/
theorem ep_Q2_054_partial_29_0526_valid :
    mulPoly ep_Q2_054_coefficient_29_0526
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0527 : Poly :=
[
  term ((1202551833387 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 527 for generator 29. -/
def ep_Q2_054_partial_29_0527 : Poly :=
[
  term ((1202551833387 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1202551833387 : Rat) / 90066973034) [(12, 2), (15, 2), (16, 1)],
  term ((1202551833387 : Rat) / 45033486517) [(13, 1), (15, 3), (16, 1)],
  term ((-1202551833387 : Rat) / 90066973034) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 29. -/
theorem ep_Q2_054_partial_29_0527_valid :
    mulPoly ep_Q2_054_coefficient_29_0527
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 29. -/
def ep_Q2_054_coefficient_29_0528 : Poly :=
[
  term ((15134559175 : Rat) / 45033486517) [(16, 1)]
]

/-- Partial product 528 for generator 29. -/
def ep_Q2_054_partial_29_0528 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(12, 1), (14, 1), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(12, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 29. -/
theorem ep_Q2_054_partial_29_0528_valid :
    mulPoly ep_Q2_054_coefficient_29_0528
        ep_Q2_054_generator_29_0500_0528 =
      ep_Q2_054_partial_29_0528 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_29_0500_0528 : List Poly :=
[
  ep_Q2_054_partial_29_0500,
  ep_Q2_054_partial_29_0501,
  ep_Q2_054_partial_29_0502,
  ep_Q2_054_partial_29_0503,
  ep_Q2_054_partial_29_0504,
  ep_Q2_054_partial_29_0505,
  ep_Q2_054_partial_29_0506,
  ep_Q2_054_partial_29_0507,
  ep_Q2_054_partial_29_0508,
  ep_Q2_054_partial_29_0509,
  ep_Q2_054_partial_29_0510,
  ep_Q2_054_partial_29_0511,
  ep_Q2_054_partial_29_0512,
  ep_Q2_054_partial_29_0513,
  ep_Q2_054_partial_29_0514,
  ep_Q2_054_partial_29_0515,
  ep_Q2_054_partial_29_0516,
  ep_Q2_054_partial_29_0517,
  ep_Q2_054_partial_29_0518,
  ep_Q2_054_partial_29_0519,
  ep_Q2_054_partial_29_0520,
  ep_Q2_054_partial_29_0521,
  ep_Q2_054_partial_29_0522,
  ep_Q2_054_partial_29_0523,
  ep_Q2_054_partial_29_0524,
  ep_Q2_054_partial_29_0525,
  ep_Q2_054_partial_29_0526,
  ep_Q2_054_partial_29_0527,
  ep_Q2_054_partial_29_0528
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_29_0500_0528 : Poly :=
[
  term ((-63167460068027 : Rat) / 180133946068) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((48985890175353 : Rat) / 90066973034) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2555437557360 : Rat) / 45033486517) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((63167460068027 : Rat) / 360267892136) [(9, 1), (12, 2), (13, 1)],
  term ((-48985890175353 : Rat) / 180133946068) [(9, 1), (12, 2), (15, 1)],
  term ((-1277718778680 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((48985890175353 : Rat) / 90066973034) [(9, 1), (13, 1), (15, 2)],
  term ((2555437557360 : Rat) / 45033486517) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28038337560845 : Rat) / 45033486517) [(9, 1), (13, 2), (15, 1)],
  term ((-1277718778680 : Rat) / 45033486517) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((63167460068027 : Rat) / 360267892136) [(9, 1), (13, 3)],
  term ((-817760515032 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 2)],
  term ((-817760515032 : Rat) / 45033486517) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 1), (13, 2)],
  term ((1224778904820 : Rat) / 45033486517) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-612389452410 : Rat) / 45033486517) [(9, 2), (12, 1), (13, 2)],
  term ((2213603748846 : Rat) / 45033486517) [(9, 2), (12, 1), (14, 1)],
  term ((-1106801874423 : Rat) / 45033486517) [(9, 2), (12, 2)],
  term ((1224778904820 : Rat) / 45033486517) [(9, 2), (12, 2), (14, 1)],
  term ((-612389452410 : Rat) / 45033486517) [(9, 2), (12, 3)],
  term ((2213603748846 : Rat) / 45033486517) [(9, 2), (13, 1), (15, 1)],
  term ((-1106801874423 : Rat) / 45033486517) [(9, 2), (13, 2)],
  term ((6584088149532 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24702952613952 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-46644170386008 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1042836986052 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((24702952613952 : Rat) / 45033486517) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((23322085193004 : Rat) / 45033486517) [(10, 1), (12, 2), (15, 2)],
  term ((521418493026 : Rat) / 45033486517) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(10, 1), (12, 2), (16, 1)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 1), (12, 3), (15, 2)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (12, 3), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46644170386008 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 3)],
  term ((-1042836986052 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((16737997043472 : Rat) / 45033486517) [(10, 1), (13, 2), (15, 2)],
  term ((400342019626 : Rat) / 45033486517) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(10, 1), (13, 2), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (13, 3), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-46130326507356 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((23065163253678 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((119738127537201 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1495347986793 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(11, 1), (12, 2), (13, 1)],
  term ((-46130326507356 : Rat) / 45033486517) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-119738127537201 : Rat) / 90066973034) [(11, 1), (12, 2), (15, 1)],
  term ((-1495347986793 : Rat) / 90066973034) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((23065163253678 : Rat) / 45033486517) [(11, 1), (12, 3), (15, 1)],
  term ((119738127537201 : Rat) / 45033486517) [(11, 1), (13, 1), (15, 2)],
  term ((1495347986793 : Rat) / 45033486517) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-117543431487357 : Rat) / 90066973034) [(11, 1), (13, 2), (15, 1)],
  term ((-1495347986793 : Rat) / 90066973034) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(11, 1), (13, 3)],
  term ((-14265524323986 : Rat) / 45033486517) [(11, 2), (12, 1), (14, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((7132762161993 : Rat) / 45033486517) [(11, 2), (12, 2)],
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (12, 2), (16, 1)],
  term ((-14265524323986 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((7132762161993 : Rat) / 45033486517) [(11, 2), (13, 2)],
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (13, 2), (16, 1)],
  term ((-172131517497705 : Rat) / 90066973034) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((151345591750 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9028646264950 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((72596645398821 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 3)],
  term ((-4514323132475 : Rat) / 45033486517) [(12, 1), (13, 2)],
  term ((-99619725559125 : Rat) / 90066973034) [(12, 1), (13, 2), (15, 2)],
  term ((75672795875 : Rat) / 90066973034) [(12, 1), (13, 2), (16, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(12, 1), (13, 3), (15, 1)],
  term ((-75367778591274 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2)],
  term ((1202551833387 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(12, 1), (14, 1), (16, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((172131517497705 : Rat) / 180133946068) [(12, 2), (13, 1), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9028646264950 : Rat) / 45033486517) [(12, 2), (14, 1)],
  term ((72596645398821 : Rat) / 45033486517) [(12, 2), (14, 1), (15, 2)],
  term ((-75672795875 : Rat) / 45033486517) [(12, 2), (14, 1), (16, 1)],
  term ((37683889295637 : Rat) / 45033486517) [(12, 2), (15, 2)],
  term ((-1202551833387 : Rat) / 90066973034) [(12, 2), (15, 2), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(12, 2), (16, 1)],
  term ((-4514323132475 : Rat) / 45033486517) [(12, 3)],
  term ((6755770040076 : Rat) / 45033486517) [(12, 3), (13, 1), (15, 1)],
  term ((-72596645398821 : Rat) / 90066973034) [(12, 3), (15, 2)],
  term ((75672795875 : Rat) / 90066973034) [(12, 3), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)],
  term ((-75367778591274 : Rat) / 45033486517) [(13, 1), (15, 3)],
  term ((1202551833387 : Rat) / 45033486517) [(13, 1), (15, 3), (16, 1)],
  term ((-96763738906431 : Rat) / 90066973034) [(13, 2), (15, 2)],
  term ((-899860649887 : Rat) / 90066973034) [(13, 2), (15, 2), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(13, 2), (16, 1)],
  term ((172131517497705 : Rat) / 180133946068) [(13, 3), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 500 through 528. -/
theorem ep_Q2_054_block_29_0500_0528_valid :
    checkProductSumEq ep_Q2_054_partials_29_0500_0528
      ep_Q2_054_block_29_0500_0528 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
