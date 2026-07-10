/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 26:500-506

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 26 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_26_0500_0506 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 26. -/
def ep_Q2_054_coefficient_26_0500 : Poly :=
[
  term ((-65840875358745 : Rat) / 90066973034) [(12, 1), (15, 2)]
]

/-- Partial product 500 for generator 26. -/
def ep_Q2_054_partial_26_0500 : Poly :=
[
  term ((65840875358745 : Rat) / 45033486517) [(0, 1), (12, 2), (15, 2)],
  term ((-65840875358745 : Rat) / 90066973034) [(0, 2), (12, 1), (15, 2)],
  term ((65840875358745 : Rat) / 45033486517) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-65840875358745 : Rat) / 90066973034) [(1, 2), (12, 1), (15, 2)],
  term ((-65840875358745 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 3)],
  term ((65840875358745 : Rat) / 90066973034) [(12, 1), (14, 2), (15, 2)],
  term ((65840875358745 : Rat) / 90066973034) [(12, 1), (15, 4)],
  term ((-65840875358745 : Rat) / 45033486517) [(12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 26. -/
theorem ep_Q2_054_partial_26_0500_valid :
    mulPoly ep_Q2_054_coefficient_26_0500
        ep_Q2_054_generator_26_0500_0506 =
      ep_Q2_054_partial_26_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 26. -/
def ep_Q2_054_coefficient_26_0501 : Poly :=
[
  term ((75672795875 : Rat) / 90066973034) [(12, 1), (16, 1)]
]

/-- Partial product 501 for generator 26. -/
def ep_Q2_054_partial_26_0501 : Poly :=
[
  term ((-75672795875 : Rat) / 45033486517) [(0, 1), (12, 2), (16, 1)],
  term ((75672795875 : Rat) / 90066973034) [(0, 2), (12, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((75672795875 : Rat) / 90066973034) [(1, 2), (12, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75672795875 : Rat) / 90066973034) [(12, 1), (14, 2), (16, 1)],
  term ((-75672795875 : Rat) / 90066973034) [(12, 1), (15, 2), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 26. -/
theorem ep_Q2_054_partial_26_0501_valid :
    mulPoly ep_Q2_054_coefficient_26_0501
        ep_Q2_054_generator_26_0500_0506 =
      ep_Q2_054_partial_26_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 26. -/
def ep_Q2_054_coefficient_26_0502 : Poly :=
[
  term ((186326835980289 : Rat) / 180133946068) [(13, 1), (15, 1)]
]

/-- Partial product 502 for generator 26. -/
def ep_Q2_054_partial_26_0502 : Poly :=
[
  term ((-186326835980289 : Rat) / 90066973034) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((186326835980289 : Rat) / 180133946068) [(0, 2), (13, 1), (15, 1)],
  term ((-186326835980289 : Rat) / 90066973034) [(1, 1), (13, 2), (15, 1)],
  term ((186326835980289 : Rat) / 180133946068) [(1, 2), (13, 1), (15, 1)],
  term ((186326835980289 : Rat) / 90066973034) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-186326835980289 : Rat) / 180133946068) [(13, 1), (14, 2), (15, 1)],
  term ((-186326835980289 : Rat) / 180133946068) [(13, 1), (15, 3)],
  term ((186326835980289 : Rat) / 90066973034) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 26. -/
theorem ep_Q2_054_partial_26_0502_valid :
    mulPoly ep_Q2_054_coefficient_26_0502
        ep_Q2_054_generator_26_0500_0506 =
      ep_Q2_054_partial_26_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 26. -/
def ep_Q2_054_coefficient_26_0503 : Poly :=
[
  term ((-75672795875 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 26. -/
def ep_Q2_054_partial_26_0503 : Poly :=
[
  term ((151345591750 : Rat) / 45033486517) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((151345591750 : Rat) / 45033486517) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-151345591750 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(13, 1), (15, 3), (16, 1)],
  term ((-151345591750 : Rat) / 45033486517) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 26. -/
theorem ep_Q2_054_partial_26_0503_valid :
    mulPoly ep_Q2_054_coefficient_26_0503
        ep_Q2_054_generator_26_0500_0506 =
      ep_Q2_054_partial_26_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 26. -/
def ep_Q2_054_coefficient_26_0504 : Poly :=
[
  term ((41938768238860 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 504 for generator 26. -/
def ep_Q2_054_partial_26_0504 : Poly :=
[
  term ((-83877536477720 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)],
  term ((41938768238860 : Rat) / 45033486517) [(0, 2), (15, 2)],
  term ((-83877536477720 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)],
  term ((41938768238860 : Rat) / 45033486517) [(1, 2), (15, 2)],
  term ((83877536477720 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2)],
  term ((83877536477720 : Rat) / 45033486517) [(13, 1), (15, 3)],
  term ((-41938768238860 : Rat) / 45033486517) [(14, 2), (15, 2)],
  term ((-41938768238860 : Rat) / 45033486517) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 26. -/
theorem ep_Q2_054_partial_26_0504_valid :
    mulPoly ep_Q2_054_coefficient_26_0504
        ep_Q2_054_generator_26_0500_0506 =
      ep_Q2_054_partial_26_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 26. -/
def ep_Q2_054_coefficient_26_0505 : Poly :=
[
  term ((-1202551833387 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 505 for generator 26. -/
def ep_Q2_054_partial_26_0505 : Poly :=
[
  term ((1202551833387 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1202551833387 : Rat) / 90066973034) [(0, 2), (15, 2), (16, 1)],
  term ((1202551833387 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1202551833387 : Rat) / 90066973034) [(1, 2), (15, 2), (16, 1)],
  term ((-1202551833387 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1202551833387 : Rat) / 45033486517) [(13, 1), (15, 3), (16, 1)],
  term ((1202551833387 : Rat) / 90066973034) [(14, 2), (15, 2), (16, 1)],
  term ((1202551833387 : Rat) / 90066973034) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 26. -/
theorem ep_Q2_054_partial_26_0505_valid :
    mulPoly ep_Q2_054_coefficient_26_0505
        ep_Q2_054_generator_26_0500_0506 =
      ep_Q2_054_partial_26_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 26. -/
def ep_Q2_054_coefficient_26_0506 : Poly :=
[
  term ((-45403677525 : Rat) / 90066973034) [(16, 1)]
]

/-- Partial product 506 for generator 26. -/
def ep_Q2_054_partial_26_0506 : Poly :=
[
  term ((45403677525 : Rat) / 45033486517) [(0, 1), (12, 1), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(0, 2), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(1, 1), (13, 1), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(1, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(12, 1), (14, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(14, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 26. -/
theorem ep_Q2_054_partial_26_0506_valid :
    mulPoly ep_Q2_054_coefficient_26_0506
        ep_Q2_054_generator_26_0500_0506 =
      ep_Q2_054_partial_26_0506 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_26_0500_0506 : List Poly :=
[
  ep_Q2_054_partial_26_0500,
  ep_Q2_054_partial_26_0501,
  ep_Q2_054_partial_26_0502,
  ep_Q2_054_partial_26_0503,
  ep_Q2_054_partial_26_0504,
  ep_Q2_054_partial_26_0505,
  ep_Q2_054_partial_26_0506
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_26_0500_0506 : Poly :=
[
  term ((-186326835980289 : Rat) / 90066973034) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((151345591750 : Rat) / 45033486517) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83877536477720 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)],
  term ((1202551833387 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(0, 1), (12, 1), (16, 1)],
  term ((65840875358745 : Rat) / 45033486517) [(0, 1), (12, 2), (15, 2)],
  term ((-75672795875 : Rat) / 45033486517) [(0, 1), (12, 2), (16, 1)],
  term ((-65840875358745 : Rat) / 90066973034) [(0, 2), (12, 1), (15, 2)],
  term ((75672795875 : Rat) / 90066973034) [(0, 2), (12, 1), (16, 1)],
  term ((186326835980289 : Rat) / 180133946068) [(0, 2), (13, 1), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((41938768238860 : Rat) / 45033486517) [(0, 2), (15, 2)],
  term ((-1202551833387 : Rat) / 90066973034) [(0, 2), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(0, 2), (16, 1)],
  term ((65840875358745 : Rat) / 45033486517) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-75672795875 : Rat) / 45033486517) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-83877536477720 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)],
  term ((1202551833387 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(1, 1), (13, 1), (16, 1)],
  term ((-186326835980289 : Rat) / 90066973034) [(1, 1), (13, 2), (15, 1)],
  term ((151345591750 : Rat) / 45033486517) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-65840875358745 : Rat) / 90066973034) [(1, 2), (12, 1), (15, 2)],
  term ((75672795875 : Rat) / 90066973034) [(1, 2), (12, 1), (16, 1)],
  term ((186326835980289 : Rat) / 180133946068) [(1, 2), (13, 1), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((41938768238860 : Rat) / 45033486517) [(1, 2), (15, 2)],
  term ((-1202551833387 : Rat) / 90066973034) [(1, 2), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(1, 2), (16, 1)],
  term ((186326835980289 : Rat) / 90066973034) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-151345591750 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65840875358745 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 3)],
  term ((83877536477720 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2)],
  term ((-1202551833387 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(12, 1), (14, 1), (16, 1)],
  term ((65840875358745 : Rat) / 90066973034) [(12, 1), (14, 2), (15, 2)],
  term ((-75672795875 : Rat) / 90066973034) [(12, 1), (14, 2), (16, 1)],
  term ((-75672795875 : Rat) / 90066973034) [(12, 1), (15, 2), (16, 1)],
  term ((65840875358745 : Rat) / 90066973034) [(12, 1), (15, 4)],
  term ((-65840875358745 : Rat) / 45033486517) [(12, 2), (14, 1), (15, 2)],
  term ((75672795875 : Rat) / 45033486517) [(12, 2), (14, 1), (16, 1)],
  term ((-186326835980289 : Rat) / 180133946068) [(13, 1), (14, 2), (15, 1)],
  term ((75672795875 : Rat) / 45033486517) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)],
  term ((149183309930591 : Rat) / 180133946068) [(13, 1), (15, 3)],
  term ((-1126879037512 : Rat) / 45033486517) [(13, 1), (15, 3), (16, 1)],
  term ((186326835980289 : Rat) / 90066973034) [(13, 2), (15, 2)],
  term ((-151345591750 : Rat) / 45033486517) [(13, 2), (15, 2), (16, 1)],
  term ((-41938768238860 : Rat) / 45033486517) [(14, 2), (15, 2)],
  term ((1202551833387 : Rat) / 90066973034) [(14, 2), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(14, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(15, 2), (16, 1)],
  term ((-41938768238860 : Rat) / 45033486517) [(15, 4)],
  term ((1202551833387 : Rat) / 90066973034) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 500 through 506. -/
theorem ep_Q2_054_block_26_0500_0506_valid :
    checkProductSumEq ep_Q2_054_partials_26_0500_0506
      ep_Q2_054_block_26_0500_0506 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
