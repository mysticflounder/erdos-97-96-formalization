/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 14:0-4

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 14 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_14_0000_0004 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(4, 1)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def ep_Q1_028_coefficient_14_0000 : Poly :=
[
  term ((-8 : Rat) / 5) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def ep_Q1_028_partial_14_0000 : Poly :=
[
  term ((-16 : Rat) / 5) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 5) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem ep_Q1_028_partial_14_0000_valid :
    mulPoly ep_Q1_028_coefficient_14_0000
        ep_Q1_028_generator_14_0000_0004 =
      ep_Q1_028_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def ep_Q1_028_coefficient_14_0001 : Poly :=
[
  term ((16 : Rat) / 3) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def ep_Q1_028_partial_14_0001 : Poly :=
[
  term ((32 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((32 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem ep_Q1_028_partial_14_0001_valid :
    mulPoly ep_Q1_028_coefficient_14_0001
        ep_Q1_028_generator_14_0000_0004 =
      ep_Q1_028_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def ep_Q1_028_coefficient_14_0002 : Poly :=
[
  term ((-16 : Rat) / 15) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def ep_Q1_028_partial_14_0002 : Poly :=
[
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 15) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 15) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 15) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((-32 : Rat) / 15) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem ep_Q1_028_partial_14_0002_valid :
    mulPoly ep_Q1_028_coefficient_14_0002
        ep_Q1_028_generator_14_0000_0004 =
      ep_Q1_028_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def ep_Q1_028_coefficient_14_0003 : Poly :=
[
  term ((-72 : Rat) / 5) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def ep_Q1_028_partial_14_0003 : Poly :=
[
  term ((-144 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((72 : Rat) / 5) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((72 : Rat) / 5) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(5, 1), (7, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem ep_Q1_028_partial_14_0003_valid :
    mulPoly ep_Q1_028_coefficient_14_0003
        ep_Q1_028_generator_14_0000_0004 =
      ep_Q1_028_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def ep_Q1_028_coefficient_14_0004 : Poly :=
[
  term ((16 : Rat) / 5) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def ep_Q1_028_partial_14_0004 : Poly :=
[
  term ((32 : Rat) / 5) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(7, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem ep_Q1_028_partial_14_0004_valid :
    mulPoly ep_Q1_028_coefficient_14_0004
        ep_Q1_028_generator_14_0000_0004 =
      ep_Q1_028_partial_14_0004 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_14_0000_0004 : List Poly :=
[
  ep_Q1_028_partial_14_0000,
  ep_Q1_028_partial_14_0001,
  ep_Q1_028_partial_14_0002,
  ep_Q1_028_partial_14_0003,
  ep_Q1_028_partial_14_0004
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_14_0000_0004 : Poly :=
[
  term ((-16 : Rat) / 5) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 5) [(3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 5) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(3, 1), (7, 1), (16, 1)],
  term ((32 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-80 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((144 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((32 : Rat) / 5) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((16 : Rat) / 15) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 15) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 15) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((104 : Rat) / 5) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(5, 1), (7, 1), (16, 1)],
  term ((32 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(7, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 4. -/
theorem ep_Q1_028_block_14_0000_0004_valid :
    checkProductSumEq ep_Q1_028_partials_14_0000_0004
      ep_Q1_028_block_14_0000_0004 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
