/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 4:400-401

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_04_0400_0401 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 4. -/
def ep_Q2_020_coefficient_04_0400 : Poly :=
[
  term ((-3238077299178230619 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 400 for generator 4. -/
def ep_Q2_020_partial_04_0400 : Poly :=
[
  term ((-3238077299178230619 : Rat) / 56596790034801622) [(2, 2), (15, 2), (16, 1)],
  term ((-3238077299178230619 : Rat) / 56596790034801622) [(3, 2), (15, 2), (16, 1)],
  term ((3238077299178230619 : Rat) / 56596790034801622) [(10, 2), (15, 2), (16, 1)],
  term ((3238077299178230619 : Rat) / 56596790034801622) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 4. -/
theorem ep_Q2_020_partial_04_0400_valid :
    mulPoly ep_Q2_020_coefficient_04_0400
        ep_Q2_020_generator_04_0400_0401 =
      ep_Q2_020_partial_04_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 4. -/
def ep_Q2_020_coefficient_04_0401 : Poly :=
[
  term ((800858598525524823 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 401 for generator 4. -/
def ep_Q2_020_partial_04_0401 : Poly :=
[
  term ((800858598525524823 : Rat) / 226387160139206488) [(2, 2), (16, 1)],
  term ((800858598525524823 : Rat) / 226387160139206488) [(3, 2), (16, 1)],
  term ((-800858598525524823 : Rat) / 226387160139206488) [(10, 2), (16, 1)],
  term ((-800858598525524823 : Rat) / 226387160139206488) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 4. -/
theorem ep_Q2_020_partial_04_0401_valid :
    mulPoly ep_Q2_020_coefficient_04_0401
        ep_Q2_020_generator_04_0400_0401 =
      ep_Q2_020_partial_04_0401 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_04_0400_0401 : List Poly :=
[
  ep_Q2_020_partial_04_0400,
  ep_Q2_020_partial_04_0401
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_04_0400_0401 : Poly :=
[
  term ((-3238077299178230619 : Rat) / 56596790034801622) [(2, 2), (15, 2), (16, 1)],
  term ((800858598525524823 : Rat) / 226387160139206488) [(2, 2), (16, 1)],
  term ((-3238077299178230619 : Rat) / 56596790034801622) [(3, 2), (15, 2), (16, 1)],
  term ((800858598525524823 : Rat) / 226387160139206488) [(3, 2), (16, 1)],
  term ((3238077299178230619 : Rat) / 56596790034801622) [(10, 2), (15, 2), (16, 1)],
  term ((-800858598525524823 : Rat) / 226387160139206488) [(10, 2), (16, 1)],
  term ((3238077299178230619 : Rat) / 56596790034801622) [(11, 2), (15, 2), (16, 1)],
  term ((-800858598525524823 : Rat) / 226387160139206488) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 400 through 401. -/
theorem ep_Q2_020_block_04_0400_0401_valid :
    checkProductSumEq ep_Q2_020_partials_04_0400_0401
      ep_Q2_020_block_04_0400_0401 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
