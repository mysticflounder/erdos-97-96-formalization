/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 30:0-5

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 30 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_30_0000_0005 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(2, 1), (6, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def ep_Q2_064_coefficient_30_0000 : Poly :=
[
  term (18 : Rat) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 0 for generator 30. -/
def ep_Q2_064_partial_30_0000 : Poly :=
[
  term (-36 : Rat) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem ep_Q2_064_partial_30_0000_valid :
    mulPoly ep_Q2_064_coefficient_30_0000
        ep_Q2_064_generator_30_0000_0005 =
      ep_Q2_064_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def ep_Q2_064_coefficient_30_0001 : Poly :=
[
  term (18 : Rat) [(0, 1), (15, 2)]
]

/-- Partial product 1 for generator 30. -/
def ep_Q2_064_partial_30_0001 : Poly :=
[
  term (-36 : Rat) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term (-18 : Rat) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem ep_Q2_064_partial_30_0001_valid :
    mulPoly ep_Q2_064_coefficient_30_0001
        ep_Q2_064_generator_30_0000_0005 =
      ep_Q2_064_partial_30_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 30. -/
def ep_Q2_064_coefficient_30_0002 : Poly :=
[
  term (9 : Rat) [(1, 1), (5, 1)]
]

/-- Partial product 2 for generator 30. -/
def ep_Q2_064_partial_30_0002 : Poly :=
[
  term (-18 : Rat) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (5, 1)],
  term (9 : Rat) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term (9 : Rat) [(1, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 30. -/
theorem ep_Q2_064_partial_30_0002_valid :
    mulPoly ep_Q2_064_coefficient_30_0002
        ep_Q2_064_generator_30_0000_0005 =
      ep_Q2_064_partial_30_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 30. -/
def ep_Q2_064_coefficient_30_0003 : Poly :=
[
  term (9 : Rat) [(1, 1), (15, 1)]
]

/-- Partial product 3 for generator 30. -/
def ep_Q2_064_partial_30_0003 : Poly :=
[
  term (-18 : Rat) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 30. -/
theorem ep_Q2_064_partial_30_0003_valid :
    mulPoly ep_Q2_064_coefficient_30_0003
        ep_Q2_064_generator_30_0000_0005 =
      ep_Q2_064_partial_30_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 30. -/
def ep_Q2_064_coefficient_30_0004 : Poly :=
[
  term (-16 : Rat) [(5, 1), (15, 1)]
]

/-- Partial product 4 for generator 30. -/
def ep_Q2_064_partial_30_0004 : Poly :=
[
  term (32 : Rat) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 30. -/
theorem ep_Q2_064_partial_30_0004_valid :
    mulPoly ep_Q2_064_coefficient_30_0004
        ep_Q2_064_generator_30_0000_0005 =
      ep_Q2_064_partial_30_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 30. -/
def ep_Q2_064_coefficient_30_0005 : Poly :=
[
  term (-16 : Rat) [(15, 2)]
]

/-- Partial product 5 for generator 30. -/
def ep_Q2_064_partial_30_0005 : Poly :=
[
  term (32 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(2, 2), (15, 2), (16, 1)],
  term (32 : Rat) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(3, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(6, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(7, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 30. -/
theorem ep_Q2_064_partial_30_0005_valid :
    mulPoly ep_Q2_064_coefficient_30_0005
        ep_Q2_064_generator_30_0000_0005 =
      ep_Q2_064_partial_30_0005 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_30_0000_0005 : List Poly :=
[
  ep_Q2_064_partial_30_0000,
  ep_Q2_064_partial_30_0001,
  ep_Q2_064_partial_30_0002,
  ep_Q2_064_partial_30_0003,
  ep_Q2_064_partial_30_0004,
  ep_Q2_064_partial_30_0005
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_30_0000_0005 : Poly :=
[
  term (-36 : Rat) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (5, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term (-18 : Rat) [(0, 1), (15, 2)],
  term (-18 : Rat) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (5, 1)],
  term (9 : Rat) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term (9 : Rat) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term (9 : Rat) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (15, 1)],
  term (32 : Rat) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 2), (15, 2), (16, 1)],
  term (32 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (15, 1)],
  term (-16 : Rat) [(6, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(7, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 5. -/
theorem ep_Q2_064_block_30_0000_0005_valid :
    checkProductSumEq ep_Q2_064_partials_30_0000_0005
      ep_Q2_064_block_30_0000_0005 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
