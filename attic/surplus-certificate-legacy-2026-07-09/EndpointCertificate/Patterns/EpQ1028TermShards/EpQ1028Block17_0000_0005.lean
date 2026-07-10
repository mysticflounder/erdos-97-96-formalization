/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 17:0-5

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 17 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_17_0000_0005 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def ep_Q1_028_coefficient_17_0000 : Poly :=
[
  term ((224 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 17. -/
def ep_Q1_028_partial_17_0000 : Poly :=
[
  term ((-448 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (6, 1), (7, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 1), (3, 1), (5, 2), (7, 2), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((448 : Rat) / 3) [(3, 1), (5, 2), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (10, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 2), (16, 1)],
  term ((448 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem ep_Q1_028_partial_17_0000_valid :
    mulPoly ep_Q1_028_coefficient_17_0000
        ep_Q1_028_generator_17_0000_0005 =
      ep_Q1_028_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def ep_Q1_028_coefficient_17_0001 : Poly :=
[
  term ((-92 : Rat) / 5) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 1 for generator 17. -/
def ep_Q1_028_partial_17_0001 : Poly :=
[
  term ((184 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-92 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((184 : Rat) / 5) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-92 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-184 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((92 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((92 : Rat) / 5) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-184 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem ep_Q1_028_partial_17_0001_valid :
    mulPoly ep_Q1_028_coefficient_17_0001
        ep_Q1_028_generator_17_0000_0005 =
      ep_Q1_028_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def ep_Q1_028_coefficient_17_0002 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def ep_Q1_028_partial_17_0002 : Poly :=
[
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((896 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem ep_Q1_028_partial_17_0002_valid :
    mulPoly ep_Q1_028_coefficient_17_0002
        ep_Q1_028_generator_17_0000_0005 =
      ep_Q1_028_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def ep_Q1_028_coefficient_17_0003 : Poly :=
[
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def ep_Q1_028_partial_17_0003 : Poly :=
[
  term ((448 : Rat) / 3) [(0, 1), (5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem ep_Q1_028_partial_17_0003_valid :
    mulPoly ep_Q1_028_coefficient_17_0003
        ep_Q1_028_generator_17_0000_0005 =
      ep_Q1_028_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def ep_Q1_028_coefficient_17_0004 : Poly :=
[
  term ((84 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def ep_Q1_028_partial_17_0004 : Poly :=
[
  term ((-168 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((84 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((84 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((168 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((168 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem ep_Q1_028_partial_17_0004_valid :
    mulPoly ep_Q1_028_coefficient_17_0004
        ep_Q1_028_generator_17_0000_0005 =
      ep_Q1_028_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def ep_Q1_028_coefficient_17_0005 : Poly :=
[
  term ((-28 : Rat) / 5) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def ep_Q1_028_partial_17_0005 : Poly :=
[
  term ((56 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 5) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 5) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((28 : Rat) / 5) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem ep_Q1_028_partial_17_0005_valid :
    mulPoly ep_Q1_028_coefficient_17_0005
        ep_Q1_028_generator_17_0000_0005 =
      ep_Q1_028_partial_17_0005 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_17_0000_0005 : List Poly :=
[
  ep_Q1_028_partial_17_0000,
  ep_Q1_028_partial_17_0001,
  ep_Q1_028_partial_17_0002,
  ep_Q1_028_partial_17_0003,
  ep_Q1_028_partial_17_0004,
  ep_Q1_028_partial_17_0005
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_17_0000_0005 : Poly :=
[
  term ((-448 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (6, 1), (7, 1), (16, 1)],
  term ((184 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 1), (5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((56 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-92 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 1), (3, 1), (5, 2), (7, 2), (16, 1)],
  term ((184 : Rat) / 5) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((896 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((56 : Rat) / 5) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-92 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(3, 1), (5, 2), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (10, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 2), (16, 1)],
  term ((448 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term ((-184 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((92 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((92 : Rat) / 5) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-184 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((28 : Rat) / 5) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((28 : Rat) / 5) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 5. -/
theorem ep_Q1_028_block_17_0000_0005_valid :
    checkProductSumEq ep_Q1_028_partials_17_0000_0005
      ep_Q1_028_block_17_0000_0005 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
