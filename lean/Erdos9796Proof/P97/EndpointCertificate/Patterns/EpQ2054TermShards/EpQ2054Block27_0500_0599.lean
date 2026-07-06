/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 27:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_27_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0500 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 500 for generator 27. -/
def ep_Q2_054_partial_27_0500 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 27. -/
theorem ep_Q2_054_partial_27_0500_valid :
    mulPoly ep_Q2_054_coefficient_27_0500
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0501 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 501 for generator 27. -/
def ep_Q2_054_partial_27_0501 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 27. -/
theorem ep_Q2_054_partial_27_0501_valid :
    mulPoly ep_Q2_054_coefficient_27_0501
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0502 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 502 for generator 27. -/
def ep_Q2_054_partial_27_0502 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 27. -/
theorem ep_Q2_054_partial_27_0502_valid :
    mulPoly ep_Q2_054_coefficient_27_0502
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0503 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 27. -/
def ep_Q2_054_partial_27_0503 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 27. -/
theorem ep_Q2_054_partial_27_0503_valid :
    mulPoly ep_Q2_054_coefficient_27_0503
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0504 : Poly :=
[
  term ((-4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 504 for generator 27. -/
def ep_Q2_054_partial_27_0504 : Poly :=
[
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 27. -/
theorem ep_Q2_054_partial_27_0504_valid :
    mulPoly ep_Q2_054_coefficient_27_0504
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0505 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 505 for generator 27. -/
def ep_Q2_054_partial_27_0505 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 27. -/
theorem ep_Q2_054_partial_27_0505_valid :
    mulPoly ep_Q2_054_coefficient_27_0505
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0506 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 506 for generator 27. -/
def ep_Q2_054_partial_27_0506 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 27. -/
theorem ep_Q2_054_partial_27_0506_valid :
    mulPoly ep_Q2_054_coefficient_27_0506
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0507 : Poly :=
[
  term ((-13727981250 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)]
]

/-- Partial product 507 for generator 27. -/
def ep_Q2_054_partial_27_0507 : Poly :=
[
  term ((13727981250 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 27. -/
theorem ep_Q2_054_partial_27_0507_valid :
    mulPoly ep_Q2_054_coefficient_27_0507
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0508 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1)]
]

/-- Partial product 508 for generator 27. -/
def ep_Q2_054_partial_27_0508 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 27. -/
theorem ep_Q2_054_partial_27_0508_valid :
    mulPoly ep_Q2_054_coefficient_27_0508
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0509 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 509 for generator 27. -/
def ep_Q2_054_partial_27_0509 : Poly :=
[
  term ((48810600000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 27. -/
theorem ep_Q2_054_partial_27_0509_valid :
    mulPoly ep_Q2_054_coefficient_27_0509
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0510 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 1)]
]

/-- Partial product 510 for generator 27. -/
def ep_Q2_054_partial_27_0510 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 27. -/
theorem ep_Q2_054_partial_27_0510_valid :
    mulPoly ep_Q2_054_coefficient_27_0510
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0511 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 511 for generator 27. -/
def ep_Q2_054_partial_27_0511 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 27. -/
theorem ep_Q2_054_partial_27_0511_valid :
    mulPoly ep_Q2_054_coefficient_27_0511
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0512 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 512 for generator 27. -/
def ep_Q2_054_partial_27_0512 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 27. -/
theorem ep_Q2_054_partial_27_0512_valid :
    mulPoly ep_Q2_054_coefficient_27_0512
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0513 : Poly :=
[
  term ((1144201671009 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 513 for generator 27. -/
def ep_Q2_054_partial_27_0513 : Poly :=
[
  term ((-1144201671009 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)],
  term ((2288403342018 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 27. -/
theorem ep_Q2_054_partial_27_0513_valid :
    mulPoly ep_Q2_054_coefficient_27_0513
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0514 : Poly :=
[
  term ((39658612500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 514 for generator 27. -/
def ep_Q2_054_partial_27_0514 : Poly :=
[
  term ((79317225000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-39658612500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 27. -/
theorem ep_Q2_054_partial_27_0514_valid :
    mulPoly ep_Q2_054_coefficient_27_0514
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0515 : Poly :=
[
  term ((639944203878 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 515 for generator 27. -/
def ep_Q2_054_partial_27_0515 : Poly :=
[
  term ((-639944203878 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 27. -/
theorem ep_Q2_054_partial_27_0515_valid :
    mulPoly ep_Q2_054_coefficient_27_0515
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0516 : Poly :=
[
  term ((21354637500 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 516 for generator 27. -/
def ep_Q2_054_partial_27_0516 : Poly :=
[
  term ((42709275000 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-21354637500 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 27. -/
theorem ep_Q2_054_partial_27_0516_valid :
    mulPoly ep_Q2_054_coefficient_27_0516
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0517 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 517 for generator 27. -/
def ep_Q2_054_partial_27_0517 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 27. -/
theorem ep_Q2_054_partial_27_0517_valid :
    mulPoly ep_Q2_054_coefficient_27_0517
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0518 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 518 for generator 27. -/
def ep_Q2_054_partial_27_0518 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 27. -/
theorem ep_Q2_054_partial_27_0518_valid :
    mulPoly ep_Q2_054_coefficient_27_0518
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0519 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 519 for generator 27. -/
def ep_Q2_054_partial_27_0519 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 27. -/
theorem ep_Q2_054_partial_27_0519_valid :
    mulPoly ep_Q2_054_coefficient_27_0519
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0520 : Poly :=
[
  term ((16171530073560 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 520 for generator 27. -/
def ep_Q2_054_partial_27_0520 : Poly :=
[
  term ((32343060147120 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-16171530073560 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 27. -/
theorem ep_Q2_054_partial_27_0520_valid :
    mulPoly ep_Q2_054_coefficient_27_0520
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0521 : Poly :=
[
  term ((1437433626015 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 27. -/
def ep_Q2_054_partial_27_0521 : Poly :=
[
  term ((2874867252030 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 27. -/
theorem ep_Q2_054_partial_27_0521_valid :
    mulPoly ep_Q2_054_coefficient_27_0521
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0522 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 522 for generator 27. -/
def ep_Q2_054_partial_27_0522 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 27. -/
theorem ep_Q2_054_partial_27_0522_valid :
    mulPoly ep_Q2_054_coefficient_27_0522
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0523 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 523 for generator 27. -/
def ep_Q2_054_partial_27_0523 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 27. -/
theorem ep_Q2_054_partial_27_0523_valid :
    mulPoly ep_Q2_054_coefficient_27_0523
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0524 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 524 for generator 27. -/
def ep_Q2_054_partial_27_0524 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 27. -/
theorem ep_Q2_054_partial_27_0524_valid :
    mulPoly ep_Q2_054_coefficient_27_0524
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0525 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 525 for generator 27. -/
def ep_Q2_054_partial_27_0525 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 27. -/
theorem ep_Q2_054_partial_27_0525_valid :
    mulPoly ep_Q2_054_coefficient_27_0525
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0526 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 526 for generator 27. -/
def ep_Q2_054_partial_27_0526 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 27. -/
theorem ep_Q2_054_partial_27_0526_valid :
    mulPoly ep_Q2_054_coefficient_27_0526
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0527 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 527 for generator 27. -/
def ep_Q2_054_partial_27_0527 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 27. -/
theorem ep_Q2_054_partial_27_0527_valid :
    mulPoly ep_Q2_054_coefficient_27_0527
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0528 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 528 for generator 27. -/
def ep_Q2_054_partial_27_0528 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 27. -/
theorem ep_Q2_054_partial_27_0528_valid :
    mulPoly ep_Q2_054_coefficient_27_0528
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0529 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 529 for generator 27. -/
def ep_Q2_054_partial_27_0529 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 27. -/
theorem ep_Q2_054_partial_27_0529_valid :
    mulPoly ep_Q2_054_coefficient_27_0529
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0530 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 530 for generator 27. -/
def ep_Q2_054_partial_27_0530 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 27. -/
theorem ep_Q2_054_partial_27_0530_valid :
    mulPoly ep_Q2_054_coefficient_27_0530
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0531 : Poly :=
[
  term ((-14357900532600 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 531 for generator 27. -/
def ep_Q2_054_partial_27_0531 : Poly :=
[
  term ((-28715801065200 : Rat) / 45033486517) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((14357900532600 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 27. -/
theorem ep_Q2_054_partial_27_0531_valid :
    mulPoly ep_Q2_054_coefficient_27_0531
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0532 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 27. -/
def ep_Q2_054_partial_27_0532 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 27. -/
theorem ep_Q2_054_partial_27_0532_valid :
    mulPoly ep_Q2_054_coefficient_27_0532
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0533 : Poly :=
[
  term ((1057950565560 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 533 for generator 27. -/
def ep_Q2_054_partial_27_0533 : Poly :=
[
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 27. -/
theorem ep_Q2_054_partial_27_0533_valid :
    mulPoly ep_Q2_054_coefficient_27_0533
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0534 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 534 for generator 27. -/
def ep_Q2_054_partial_27_0534 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 27. -/
theorem ep_Q2_054_partial_27_0534_valid :
    mulPoly ep_Q2_054_coefficient_27_0534
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0535 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 535 for generator 27. -/
def ep_Q2_054_partial_27_0535 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 27. -/
theorem ep_Q2_054_partial_27_0535_valid :
    mulPoly ep_Q2_054_coefficient_27_0535
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0536 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 536 for generator 27. -/
def ep_Q2_054_partial_27_0536 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 27. -/
theorem ep_Q2_054_partial_27_0536_valid :
    mulPoly ep_Q2_054_coefficient_27_0536
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0537 : Poly :=
[
  term ((218251834008 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 537 for generator 27. -/
def ep_Q2_054_partial_27_0537 : Poly :=
[
  term ((-218251834008 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1)],
  term ((436503668016 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 27. -/
theorem ep_Q2_054_partial_27_0537_valid :
    mulPoly ep_Q2_054_coefficient_27_0537
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0538 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 538 for generator 27. -/
def ep_Q2_054_partial_27_0538 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 27. -/
theorem ep_Q2_054_partial_27_0538_valid :
    mulPoly ep_Q2_054_coefficient_27_0538
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0539 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 539 for generator 27. -/
def ep_Q2_054_partial_27_0539 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 27. -/
theorem ep_Q2_054_partial_27_0539_valid :
    mulPoly ep_Q2_054_coefficient_27_0539
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0540 : Poly :=
[
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 540 for generator 27. -/
def ep_Q2_054_partial_27_0540 : Poly :=
[
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 27. -/
theorem ep_Q2_054_partial_27_0540_valid :
    mulPoly ep_Q2_054_coefficient_27_0540
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0541 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 541 for generator 27. -/
def ep_Q2_054_partial_27_0541 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 27. -/
theorem ep_Q2_054_partial_27_0541_valid :
    mulPoly ep_Q2_054_coefficient_27_0541
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0542 : Poly :=
[
  term ((-80715328893 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 542 for generator 27. -/
def ep_Q2_054_partial_27_0542 : Poly :=
[
  term ((-161430657786 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((80715328893 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 27. -/
theorem ep_Q2_054_partial_27_0542_valid :
    mulPoly ep_Q2_054_coefficient_27_0542
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0543 : Poly :=
[
  term ((100757196720 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 27. -/
def ep_Q2_054_partial_27_0543 : Poly :=
[
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-100757196720 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 27. -/
theorem ep_Q2_054_partial_27_0543_valid :
    mulPoly ep_Q2_054_coefficient_27_0543
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0544 : Poly :=
[
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 544 for generator 27. -/
def ep_Q2_054_partial_27_0544 : Poly :=
[
  term ((1876874506790 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1)],
  term ((-3753749013580 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 27. -/
theorem ep_Q2_054_partial_27_0544_valid :
    mulPoly ep_Q2_054_coefficient_27_0544
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0545 : Poly :=
[
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 545 for generator 27. -/
def ep_Q2_054_partial_27_0545 : Poly :=
[
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 27. -/
theorem ep_Q2_054_partial_27_0545_valid :
    mulPoly ep_Q2_054_coefficient_27_0545
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0546 : Poly :=
[
  term ((-20314585812237 : Rat) / 90066973034) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 546 for generator 27. -/
def ep_Q2_054_partial_27_0546 : Poly :=
[
  term ((-20314585812237 : Rat) / 45033486517) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((20314585812237 : Rat) / 90066973034) [(3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 27. -/
theorem ep_Q2_054_partial_27_0546_valid :
    mulPoly ep_Q2_054_coefficient_27_0546
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0547 : Poly :=
[
  term ((-2177050212075 : Rat) / 90066973034) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 27. -/
def ep_Q2_054_partial_27_0547 : Poly :=
[
  term ((-2177050212075 : Rat) / 45033486517) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2177050212075 : Rat) / 90066973034) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 27. -/
theorem ep_Q2_054_partial_27_0547_valid :
    mulPoly ep_Q2_054_coefficient_27_0547
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0548 : Poly :=
[
  term ((2706185843181 : Rat) / 90066973034) [(3, 1), (11, 1)]
]

/-- Partial product 548 for generator 27. -/
def ep_Q2_054_partial_27_0548 : Poly :=
[
  term ((-2706185843181 : Rat) / 90066973034) [(3, 1), (11, 1)],
  term ((2706185843181 : Rat) / 45033486517) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 27. -/
theorem ep_Q2_054_partial_27_0548_valid :
    mulPoly ep_Q2_054_coefficient_27_0548
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0549 : Poly :=
[
  term ((1876874506790 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 549 for generator 27. -/
def ep_Q2_054_partial_27_0549 : Poly :=
[
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1)],
  term ((3753749013580 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 27. -/
theorem ep_Q2_054_partial_27_0549_valid :
    mulPoly ep_Q2_054_coefficient_27_0549
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0550 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 550 for generator 27. -/
def ep_Q2_054_partial_27_0550 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 27. -/
theorem ep_Q2_054_partial_27_0550_valid :
    mulPoly ep_Q2_054_coefficient_27_0550
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0551 : Poly :=
[
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 27. -/
def ep_Q2_054_partial_27_0551 : Poly :=
[
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 27. -/
theorem ep_Q2_054_partial_27_0551_valid :
    mulPoly ep_Q2_054_coefficient_27_0551
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0552 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 552 for generator 27. -/
def ep_Q2_054_partial_27_0552 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 27. -/
theorem ep_Q2_054_partial_27_0552_valid :
    mulPoly ep_Q2_054_coefficient_27_0552
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0553 : Poly :=
[
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 553 for generator 27. -/
def ep_Q2_054_partial_27_0553 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 27. -/
theorem ep_Q2_054_partial_27_0553_valid :
    mulPoly ep_Q2_054_coefficient_27_0553
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0554 : Poly :=
[
  term ((-1047563170399 : Rat) / 45033486517) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 554 for generator 27. -/
def ep_Q2_054_partial_27_0554 : Poly :=
[
  term ((1047563170399 : Rat) / 45033486517) [(3, 1), (11, 1), (14, 1)],
  term ((-2095126340798 : Rat) / 45033486517) [(3, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 27. -/
theorem ep_Q2_054_partial_27_0554_valid :
    mulPoly ep_Q2_054_coefficient_27_0554
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0555 : Poly :=
[
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 555 for generator 27. -/
def ep_Q2_054_partial_27_0555 : Poly :=
[
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 27. -/
theorem ep_Q2_054_partial_27_0555_valid :
    mulPoly ep_Q2_054_coefficient_27_0555
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0556 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 556 for generator 27. -/
def ep_Q2_054_partial_27_0556 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 27. -/
theorem ep_Q2_054_partial_27_0556_valid :
    mulPoly ep_Q2_054_coefficient_27_0556
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0557 : Poly :=
[
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 27. -/
def ep_Q2_054_partial_27_0557 : Poly :=
[
  term ((-806057573760 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 27. -/
theorem ep_Q2_054_partial_27_0557_valid :
    mulPoly ep_Q2_054_coefficient_27_0557
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0558 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 558 for generator 27. -/
def ep_Q2_054_partial_27_0558 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 27. -/
theorem ep_Q2_054_partial_27_0558_valid :
    mulPoly ep_Q2_054_coefficient_27_0558
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0559 : Poly :=
[
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 559 for generator 27. -/
def ep_Q2_054_partial_27_0559 : Poly :=
[
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 27. -/
theorem ep_Q2_054_partial_27_0559_valid :
    mulPoly ep_Q2_054_coefficient_27_0559
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0560 : Poly :=
[
  term ((226703692620 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 560 for generator 27. -/
def ep_Q2_054_partial_27_0560 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-226703692620 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 27. -/
theorem ep_Q2_054_partial_27_0560_valid :
    mulPoly ep_Q2_054_coefficient_27_0560
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0561 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 561 for generator 27. -/
def ep_Q2_054_partial_27_0561 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 27. -/
theorem ep_Q2_054_partial_27_0561_valid :
    mulPoly ep_Q2_054_coefficient_27_0561
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0562 : Poly :=
[
  term ((26086366945359 : Rat) / 90066973034) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 562 for generator 27. -/
def ep_Q2_054_partial_27_0562 : Poly :=
[
  term ((26086366945359 : Rat) / 45033486517) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-26086366945359 : Rat) / 90066973034) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 27. -/
theorem ep_Q2_054_partial_27_0562_valid :
    mulPoly ep_Q2_054_coefficient_27_0562
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0563 : Poly :=
[
  term ((907910485650 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 27. -/
def ep_Q2_054_partial_27_0563 : Poly :=
[
  term ((1815820971300 : Rat) / 45033486517) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-907910485650 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 27. -/
theorem ep_Q2_054_partial_27_0563_valid :
    mulPoly ep_Q2_054_coefficient_27_0563
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0564 : Poly :=
[
  term ((4450724725651 : Rat) / 90066973034) [(3, 1), (13, 1)]
]

/-- Partial product 564 for generator 27. -/
def ep_Q2_054_partial_27_0564 : Poly :=
[
  term ((-4450724725651 : Rat) / 90066973034) [(3, 1), (13, 1)],
  term ((4450724725651 : Rat) / 45033486517) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 27. -/
theorem ep_Q2_054_partial_27_0564_valid :
    mulPoly ep_Q2_054_coefficient_27_0564
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0565 : Poly :=
[
  term ((298493049517 : Rat) / 45033486517) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 565 for generator 27. -/
def ep_Q2_054_partial_27_0565 : Poly :=
[
  term ((-298493049517 : Rat) / 45033486517) [(3, 1), (13, 1), (14, 1)],
  term ((596986099034 : Rat) / 45033486517) [(3, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 27. -/
theorem ep_Q2_054_partial_27_0565_valid :
    mulPoly ep_Q2_054_coefficient_27_0565
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0566 : Poly :=
[
  term ((9959520181221 : Rat) / 90066973034) [(3, 1), (15, 1)]
]

/-- Partial product 566 for generator 27. -/
def ep_Q2_054_partial_27_0566 : Poly :=
[
  term ((9959520181221 : Rat) / 45033486517) [(3, 1), (14, 1), (15, 1)],
  term ((-9959520181221 : Rat) / 90066973034) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 27. -/
theorem ep_Q2_054_partial_27_0566_valid :
    mulPoly ep_Q2_054_coefficient_27_0566
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0567 : Poly :=
[
  term ((428765943645 : Rat) / 45033486517) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 27. -/
def ep_Q2_054_partial_27_0567 : Poly :=
[
  term ((857531887290 : Rat) / 45033486517) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-428765943645 : Rat) / 45033486517) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 27. -/
theorem ep_Q2_054_partial_27_0567_valid :
    mulPoly ep_Q2_054_coefficient_27_0567
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0568 : Poly :=
[
  term ((-5893439645016 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 568 for generator 27. -/
def ep_Q2_054_partial_27_0568 : Poly :=
[
  term ((5893439645016 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-11786879290032 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 27. -/
theorem ep_Q2_054_partial_27_0568_valid :
    mulPoly ep_Q2_054_coefficient_27_0568
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0569 : Poly :=
[
  term ((2946719822508 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 569 for generator 27. -/
def ep_Q2_054_partial_27_0569 : Poly :=
[
  term ((5893439645016 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 27. -/
theorem ep_Q2_054_partial_27_0569_valid :
    mulPoly ep_Q2_054_coefficient_27_0569
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0570 : Poly :=
[
  term ((367622707952592 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 570 for generator 27. -/
def ep_Q2_054_partial_27_0570 : Poly :=
[
  term ((735245415905184 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 27. -/
theorem ep_Q2_054_partial_27_0570_valid :
    mulPoly ep_Q2_054_coefficient_27_0570
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0571 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 571 for generator 27. -/
def ep_Q2_054_partial_27_0571 : Poly :=
[
  term ((-367622707952592 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 27. -/
theorem ep_Q2_054_partial_27_0571_valid :
    mulPoly ep_Q2_054_coefficient_27_0571
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0572 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 572 for generator 27. -/
def ep_Q2_054_partial_27_0572 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((653215415904 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 27. -/
theorem ep_Q2_054_partial_27_0572_valid :
    mulPoly ep_Q2_054_coefficient_27_0572
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0573 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 573 for generator 27. -/
def ep_Q2_054_partial_27_0573 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 27. -/
theorem ep_Q2_054_partial_27_0573_valid :
    mulPoly ep_Q2_054_coefficient_27_0573
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0574 : Poly :=
[
  term ((2381405728560 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 574 for generator 27. -/
def ep_Q2_054_partial_27_0574 : Poly :=
[
  term ((-2381405728560 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1)],
  term ((4762811457120 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 27. -/
theorem ep_Q2_054_partial_27_0574_valid :
    mulPoly ep_Q2_054_coefficient_27_0574
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0575 : Poly :=
[
  term ((-159038119382616 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 575 for generator 27. -/
def ep_Q2_054_partial_27_0575 : Poly :=
[
  term ((-318076238765232 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 27. -/
theorem ep_Q2_054_partial_27_0575_valid :
    mulPoly ep_Q2_054_coefficient_27_0575
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0576 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 576 for generator 27. -/
def ep_Q2_054_partial_27_0576 : Poly :=
[
  term ((159038119382616 : Rat) / 45033486517) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 27. -/
theorem ep_Q2_054_partial_27_0576_valid :
    mulPoly ep_Q2_054_coefficient_27_0576
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0577 : Poly :=
[
  term ((-1190702864280 : Rat) / 45033486517) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 577 for generator 27. -/
def ep_Q2_054_partial_27_0577 : Poly :=
[
  term ((-2381405728560 : Rat) / 45033486517) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 27. -/
theorem ep_Q2_054_partial_27_0577_valid :
    mulPoly ep_Q2_054_coefficient_27_0577
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0578 : Poly :=
[
  term ((-13727981250000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 578 for generator 27. -/
def ep_Q2_054_partial_27_0578 : Poly :=
[
  term ((13727981250000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-27455962500000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 27. -/
theorem ep_Q2_054_partial_27_0578_valid :
    mulPoly ep_Q2_054_coefficient_27_0578
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0579 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 579 for generator 27. -/
def ep_Q2_054_partial_27_0579 : Poly :=
[
  term ((13727981250000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 27. -/
theorem ep_Q2_054_partial_27_0579_valid :
    mulPoly ep_Q2_054_coefficient_27_0579
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0580 : Poly :=
[
  term ((-1057909264920 : Rat) / 45033486517) [(4, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 580 for generator 27. -/
def ep_Q2_054_partial_27_0580 : Poly :=
[
  term ((1057909264920 : Rat) / 45033486517) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-2115818529840 : Rat) / 45033486517) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 27. -/
theorem ep_Q2_054_partial_27_0580_valid :
    mulPoly ep_Q2_054_coefficient_27_0580
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0581 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

/-- Partial product 581 for generator 27. -/
def ep_Q2_054_partial_27_0581 : Poly :=
[
  term ((1057909264920 : Rat) / 45033486517) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 27. -/
theorem ep_Q2_054_partial_27_0581_valid :
    mulPoly ep_Q2_054_coefficient_27_0581
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0582 : Poly :=
[
  term ((-1473359911254 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1)]
]

/-- Partial product 582 for generator 27. -/
def ep_Q2_054_partial_27_0582 : Poly :=
[
  term ((1473359911254 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 27. -/
theorem ep_Q2_054_partial_27_0582_valid :
    mulPoly ep_Q2_054_coefficient_27_0582
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0583 : Poly :=
[
  term ((5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 1)]
]

/-- Partial product 583 for generator 27. -/
def ep_Q2_054_partial_27_0583 : Poly :=
[
  term ((-5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 1)],
  term ((11786879290032 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 27. -/
theorem ep_Q2_054_partial_27_0583_valid :
    mulPoly ep_Q2_054_coefficient_27_0583
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0584 : Poly :=
[
  term ((-2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (14, 1)]
]

/-- Partial product 584 for generator 27. -/
def ep_Q2_054_partial_27_0584 : Poly :=
[
  term ((2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (14, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 27. -/
theorem ep_Q2_054_partial_27_0584_valid :
    mulPoly ep_Q2_054_coefficient_27_0584
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0585 : Poly :=
[
  term ((595351432140 : Rat) / 45033486517) [(5, 1), (7, 1)]
]

/-- Partial product 585 for generator 27. -/
def ep_Q2_054_partial_27_0585 : Poly :=
[
  term ((-595351432140 : Rat) / 45033486517) [(5, 1), (7, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 27. -/
theorem ep_Q2_054_partial_27_0585_valid :
    mulPoly ep_Q2_054_coefficient_27_0585
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0586 : Poly :=
[
  term ((-367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 586 for generator 27. -/
def ep_Q2_054_partial_27_0586 : Poly :=
[
  term ((-735245415905184 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 27. -/
theorem ep_Q2_054_partial_27_0586_valid :
    mulPoly ep_Q2_054_coefficient_27_0586
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0587 : Poly :=
[
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 587 for generator 27. -/
def ep_Q2_054_partial_27_0587 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 27. -/
theorem ep_Q2_054_partial_27_0587_valid :
    mulPoly ep_Q2_054_coefficient_27_0587
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0588 : Poly :=
[
  term ((91905676988148 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 588 for generator 27. -/
def ep_Q2_054_partial_27_0588 : Poly :=
[
  term ((183811353976296 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 27. -/
theorem ep_Q2_054_partial_27_0588_valid :
    mulPoly ep_Q2_054_coefficient_27_0588
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0589 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 589 for generator 27. -/
def ep_Q2_054_partial_27_0589 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 27. -/
theorem ep_Q2_054_partial_27_0589_valid :
    mulPoly ep_Q2_054_coefficient_27_0589
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0590 : Poly :=
[
  term ((81651926988 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 590 for generator 27. -/
def ep_Q2_054_partial_27_0590 : Poly :=
[
  term ((-81651926988 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 27. -/
theorem ep_Q2_054_partial_27_0590_valid :
    mulPoly ep_Q2_054_coefficient_27_0590
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0591 : Poly :=
[
  term ((163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 591 for generator 27. -/
def ep_Q2_054_partial_27_0591 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 27. -/
theorem ep_Q2_054_partial_27_0591_valid :
    mulPoly ep_Q2_054_coefficient_27_0591
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0592 : Poly :=
[
  term ((-2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1)]
]

/-- Partial product 592 for generator 27. -/
def ep_Q2_054_partial_27_0592 : Poly :=
[
  term ((2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1)],
  term ((-4762811457120 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 27. -/
theorem ep_Q2_054_partial_27_0592_valid :
    mulPoly ep_Q2_054_coefficient_27_0592
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0593 : Poly :=
[
  term ((159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 593 for generator 27. -/
def ep_Q2_054_partial_27_0593 : Poly :=
[
  term ((318076238765232 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 27. -/
theorem ep_Q2_054_partial_27_0593_valid :
    mulPoly ep_Q2_054_coefficient_27_0593
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0594 : Poly :=
[
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 594 for generator 27. -/
def ep_Q2_054_partial_27_0594 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 27. -/
theorem ep_Q2_054_partial_27_0594_valid :
    mulPoly ep_Q2_054_coefficient_27_0594
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0595 : Poly :=
[
  term ((-39759529845654 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 595 for generator 27. -/
def ep_Q2_054_partial_27_0595 : Poly :=
[
  term ((-79519059691308 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 27. -/
theorem ep_Q2_054_partial_27_0595_valid :
    mulPoly ep_Q2_054_coefficient_27_0595
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0596 : Poly :=
[
  term ((1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 596 for generator 27. -/
def ep_Q2_054_partial_27_0596 : Poly :=
[
  term ((-1190702864280 : Rat) / 45033486517) [(5, 1), (7, 1), (14, 1)],
  term ((2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 27. -/
theorem ep_Q2_054_partial_27_0596_valid :
    mulPoly ep_Q2_054_coefficient_27_0596
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0597 : Poly :=
[
  term ((13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 597 for generator 27. -/
def ep_Q2_054_partial_27_0597 : Poly :=
[
  term ((-13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1)],
  term ((27455962500000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 27. -/
theorem ep_Q2_054_partial_27_0597_valid :
    mulPoly ep_Q2_054_coefficient_27_0597
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0598 : Poly :=
[
  term ((-3431995312500 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1)]
]

/-- Partial product 598 for generator 27. -/
def ep_Q2_054_partial_27_0598 : Poly :=
[
  term ((3431995312500 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 27. -/
theorem ep_Q2_054_partial_27_0598_valid :
    mulPoly ep_Q2_054_coefficient_27_0598
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0599 : Poly :=
[
  term ((-6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 599 for generator 27. -/
def ep_Q2_054_partial_27_0599 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 27. -/
theorem ep_Q2_054_partial_27_0599_valid :
    mulPoly ep_Q2_054_coefficient_27_0599
        ep_Q2_054_generator_27_0500_0599 =
      ep_Q2_054_partial_27_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_27_0500_0599 : List Poly :=
[
  ep_Q2_054_partial_27_0500,
  ep_Q2_054_partial_27_0501,
  ep_Q2_054_partial_27_0502,
  ep_Q2_054_partial_27_0503,
  ep_Q2_054_partial_27_0504,
  ep_Q2_054_partial_27_0505,
  ep_Q2_054_partial_27_0506,
  ep_Q2_054_partial_27_0507,
  ep_Q2_054_partial_27_0508,
  ep_Q2_054_partial_27_0509,
  ep_Q2_054_partial_27_0510,
  ep_Q2_054_partial_27_0511,
  ep_Q2_054_partial_27_0512,
  ep_Q2_054_partial_27_0513,
  ep_Q2_054_partial_27_0514,
  ep_Q2_054_partial_27_0515,
  ep_Q2_054_partial_27_0516,
  ep_Q2_054_partial_27_0517,
  ep_Q2_054_partial_27_0518,
  ep_Q2_054_partial_27_0519,
  ep_Q2_054_partial_27_0520,
  ep_Q2_054_partial_27_0521,
  ep_Q2_054_partial_27_0522,
  ep_Q2_054_partial_27_0523,
  ep_Q2_054_partial_27_0524,
  ep_Q2_054_partial_27_0525,
  ep_Q2_054_partial_27_0526,
  ep_Q2_054_partial_27_0527,
  ep_Q2_054_partial_27_0528,
  ep_Q2_054_partial_27_0529,
  ep_Q2_054_partial_27_0530,
  ep_Q2_054_partial_27_0531,
  ep_Q2_054_partial_27_0532,
  ep_Q2_054_partial_27_0533,
  ep_Q2_054_partial_27_0534,
  ep_Q2_054_partial_27_0535,
  ep_Q2_054_partial_27_0536,
  ep_Q2_054_partial_27_0537,
  ep_Q2_054_partial_27_0538,
  ep_Q2_054_partial_27_0539,
  ep_Q2_054_partial_27_0540,
  ep_Q2_054_partial_27_0541,
  ep_Q2_054_partial_27_0542,
  ep_Q2_054_partial_27_0543,
  ep_Q2_054_partial_27_0544,
  ep_Q2_054_partial_27_0545,
  ep_Q2_054_partial_27_0546,
  ep_Q2_054_partial_27_0547,
  ep_Q2_054_partial_27_0548,
  ep_Q2_054_partial_27_0549,
  ep_Q2_054_partial_27_0550,
  ep_Q2_054_partial_27_0551,
  ep_Q2_054_partial_27_0552,
  ep_Q2_054_partial_27_0553,
  ep_Q2_054_partial_27_0554,
  ep_Q2_054_partial_27_0555,
  ep_Q2_054_partial_27_0556,
  ep_Q2_054_partial_27_0557,
  ep_Q2_054_partial_27_0558,
  ep_Q2_054_partial_27_0559,
  ep_Q2_054_partial_27_0560,
  ep_Q2_054_partial_27_0561,
  ep_Q2_054_partial_27_0562,
  ep_Q2_054_partial_27_0563,
  ep_Q2_054_partial_27_0564,
  ep_Q2_054_partial_27_0565,
  ep_Q2_054_partial_27_0566,
  ep_Q2_054_partial_27_0567,
  ep_Q2_054_partial_27_0568,
  ep_Q2_054_partial_27_0569,
  ep_Q2_054_partial_27_0570,
  ep_Q2_054_partial_27_0571,
  ep_Q2_054_partial_27_0572,
  ep_Q2_054_partial_27_0573,
  ep_Q2_054_partial_27_0574,
  ep_Q2_054_partial_27_0575,
  ep_Q2_054_partial_27_0576,
  ep_Q2_054_partial_27_0577,
  ep_Q2_054_partial_27_0578,
  ep_Q2_054_partial_27_0579,
  ep_Q2_054_partial_27_0580,
  ep_Q2_054_partial_27_0581,
  ep_Q2_054_partial_27_0582,
  ep_Q2_054_partial_27_0583,
  ep_Q2_054_partial_27_0584,
  ep_Q2_054_partial_27_0585,
  ep_Q2_054_partial_27_0586,
  ep_Q2_054_partial_27_0587,
  ep_Q2_054_partial_27_0588,
  ep_Q2_054_partial_27_0589,
  ep_Q2_054_partial_27_0590,
  ep_Q2_054_partial_27_0591,
  ep_Q2_054_partial_27_0592,
  ep_Q2_054_partial_27_0593,
  ep_Q2_054_partial_27_0594,
  ep_Q2_054_partial_27_0595,
  ep_Q2_054_partial_27_0596,
  ep_Q2_054_partial_27_0597,
  ep_Q2_054_partial_27_0598,
  ep_Q2_054_partial_27_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_27_0500_0599 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((13727981250 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (14, 1)],
  term ((48810600000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((48810600000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 2)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (14, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-1144201671009 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)],
  term ((2288403342018 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((79317225000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-39658612500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-639944203878 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 1)],
  term ((42709275000 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 2)],
  term ((-21354637500 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3839665223268 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((32343060147120 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((2874867252030 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16171530073560 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-28715801065200 : Rat) / 45033486517) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((14357900532600 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-218251834008 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((436503668016 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-161430657786 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((80715328893 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-100757196720 : Rat) / 45033486517) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1)],
  term ((-3753749013580 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-403028786880 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((201514393440 : Rat) / 45033486517) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20314585812237 : Rat) / 45033486517) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2177050212075 : Rat) / 45033486517) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((20314585812237 : Rat) / 90066973034) [(3, 1), (10, 1), (15, 1)],
  term ((2177050212075 : Rat) / 90066973034) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2706185843181 : Rat) / 90066973034) [(3, 1), (11, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1)],
  term ((3753749013580 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((3753749013580 : Rat) / 45033486517) [(3, 1), (11, 1), (14, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2095126340798 : Rat) / 45033486517) [(3, 1), (11, 1), (14, 2)],
  term ((-201514393440 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-806057573760 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-806057573760 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((403028786880 : Rat) / 45033486517) [(3, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-226703692620 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((26086366945359 : Rat) / 45033486517) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((1815820971300 : Rat) / 45033486517) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26086366945359 : Rat) / 90066973034) [(3, 1), (12, 1), (15, 1)],
  term ((-907910485650 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4450724725651 : Rat) / 90066973034) [(3, 1), (13, 1)],
  term ((4152231676134 : Rat) / 45033486517) [(3, 1), (13, 1), (14, 1)],
  term ((596986099034 : Rat) / 45033486517) [(3, 1), (13, 1), (14, 2)],
  term ((9959520181221 : Rat) / 45033486517) [(3, 1), (14, 1), (15, 1)],
  term ((857531887290 : Rat) / 45033486517) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9959520181221 : Rat) / 90066973034) [(3, 1), (15, 1)],
  term ((-428765943645 : Rat) / 45033486517) [(3, 1), (15, 1), (16, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-11786879290032 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((5893439645016 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((735245415905184 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-326607707952 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((653215415904 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1)],
  term ((-318076238765232 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((4762811457120 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-2381405728560 : Rat) / 45033486517) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(4, 1), (7, 1), (15, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-27455962500000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-2115818529840 : Rat) / 45033486517) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 1)],
  term ((11786879290032 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (14, 2)],
  term ((-595351432140 : Rat) / 45033486517) [(5, 1), (7, 1)],
  term ((-735245415905184 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1)],
  term ((318076238765232 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4762811457120 : Rat) / 45033486517) [(5, 1), (7, 1), (10, 1), (14, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((2381405728560 : Rat) / 45033486517) [(5, 1), (7, 1), (14, 2)],
  term ((-13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1)],
  term ((27455962500000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 500 through 599. -/
theorem ep_Q2_054_block_27_0500_0599_valid :
    checkProductSumEq ep_Q2_054_partials_27_0500_0599
      ep_Q2_054_block_27_0500_0599 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
