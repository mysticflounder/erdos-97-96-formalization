/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 8:200-203

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 8 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_08_0200_0203 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 8. -/
def ep_Q2_064_coefficient_08_0200 : Poly :=
[
  term ((-19227 : Rat) / 16) [(13, 2), (14, 1)]
]

/-- Partial product 200 for generator 8. -/
def ep_Q2_064_partial_08_0200 : Poly :=
[
  term ((19227 : Rat) / 8) [(0, 1), (13, 2), (14, 1)],
  term ((-19227 : Rat) / 16) [(0, 2), (13, 2), (14, 1)],
  term ((-19227 : Rat) / 16) [(1, 2), (13, 2), (14, 1)],
  term ((19227 : Rat) / 16) [(13, 2), (14, 1), (15, 2)],
  term ((-19227 : Rat) / 8) [(13, 2), (14, 2)],
  term ((19227 : Rat) / 16) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 8. -/
theorem ep_Q2_064_partial_08_0200_valid :
    mulPoly ep_Q2_064_coefficient_08_0200
        ep_Q2_064_generator_08_0200_0203 =
      ep_Q2_064_partial_08_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 8. -/
def ep_Q2_064_coefficient_08_0201 : Poly :=
[
  term ((-4499 : Rat) / 16) [(14, 1)]
]

/-- Partial product 201 for generator 8. -/
def ep_Q2_064_partial_08_0201 : Poly :=
[
  term ((4499 : Rat) / 8) [(0, 1), (14, 1)],
  term ((-4499 : Rat) / 16) [(0, 2), (14, 1)],
  term ((-4499 : Rat) / 16) [(1, 2), (14, 1)],
  term ((4499 : Rat) / 16) [(14, 1), (15, 2)],
  term ((-4499 : Rat) / 8) [(14, 2)],
  term ((4499 : Rat) / 16) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 8. -/
theorem ep_Q2_064_partial_08_0201_valid :
    mulPoly ep_Q2_064_coefficient_08_0201
        ep_Q2_064_generator_08_0200_0203 =
      ep_Q2_064_partial_08_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 8. -/
def ep_Q2_064_coefficient_08_0202 : Poly :=
[
  term ((27 : Rat) / 4) [(14, 2)]
]

/-- Partial product 202 for generator 8. -/
def ep_Q2_064_partial_08_0202 : Poly :=
[
  term ((-27 : Rat) / 2) [(0, 1), (14, 2)],
  term ((27 : Rat) / 4) [(0, 2), (14, 2)],
  term ((27 : Rat) / 4) [(1, 2), (14, 2)],
  term ((-27 : Rat) / 4) [(14, 2), (15, 2)],
  term ((27 : Rat) / 2) [(14, 3)],
  term ((-27 : Rat) / 4) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 8. -/
theorem ep_Q2_064_partial_08_0202_valid :
    mulPoly ep_Q2_064_coefficient_08_0202
        ep_Q2_064_generator_08_0200_0203 =
      ep_Q2_064_partial_08_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 8. -/
def ep_Q2_064_coefficient_08_0203 : Poly :=
[
  term ((27 : Rat) / 4) [(15, 2)]
]

/-- Partial product 203 for generator 8. -/
def ep_Q2_064_partial_08_0203 : Poly :=
[
  term ((-27 : Rat) / 2) [(0, 1), (15, 2)],
  term ((27 : Rat) / 4) [(0, 2), (15, 2)],
  term ((27 : Rat) / 4) [(1, 2), (15, 2)],
  term ((27 : Rat) / 2) [(14, 1), (15, 2)],
  term ((-27 : Rat) / 4) [(14, 2), (15, 2)],
  term ((-27 : Rat) / 4) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 8. -/
theorem ep_Q2_064_partial_08_0203_valid :
    mulPoly ep_Q2_064_coefficient_08_0203
        ep_Q2_064_generator_08_0200_0203 =
      ep_Q2_064_partial_08_0203 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_08_0200_0203 : List Poly :=
[
  ep_Q2_064_partial_08_0200,
  ep_Q2_064_partial_08_0201,
  ep_Q2_064_partial_08_0202,
  ep_Q2_064_partial_08_0203
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_08_0200_0203 : Poly :=
[
  term ((19227 : Rat) / 8) [(0, 1), (13, 2), (14, 1)],
  term ((4499 : Rat) / 8) [(0, 1), (14, 1)],
  term ((-27 : Rat) / 2) [(0, 1), (14, 2)],
  term ((-27 : Rat) / 2) [(0, 1), (15, 2)],
  term ((-19227 : Rat) / 16) [(0, 2), (13, 2), (14, 1)],
  term ((-4499 : Rat) / 16) [(0, 2), (14, 1)],
  term ((27 : Rat) / 4) [(0, 2), (14, 2)],
  term ((27 : Rat) / 4) [(0, 2), (15, 2)],
  term ((-19227 : Rat) / 16) [(1, 2), (13, 2), (14, 1)],
  term ((-4499 : Rat) / 16) [(1, 2), (14, 1)],
  term ((27 : Rat) / 4) [(1, 2), (14, 2)],
  term ((27 : Rat) / 4) [(1, 2), (15, 2)],
  term ((19227 : Rat) / 16) [(13, 2), (14, 1), (15, 2)],
  term ((-19227 : Rat) / 8) [(13, 2), (14, 2)],
  term ((19227 : Rat) / 16) [(13, 2), (14, 3)],
  term ((4715 : Rat) / 16) [(14, 1), (15, 2)],
  term ((-4499 : Rat) / 8) [(14, 2)],
  term ((-27 : Rat) / 2) [(14, 2), (15, 2)],
  term ((4715 : Rat) / 16) [(14, 3)],
  term ((-27 : Rat) / 4) [(14, 4)],
  term ((-27 : Rat) / 4) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 200 through 203. -/
theorem ep_Q2_064_block_08_0200_0203_valid :
    checkProductSumEq ep_Q2_064_partials_08_0200_0203
      ep_Q2_064_block_08_0200_0203 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
