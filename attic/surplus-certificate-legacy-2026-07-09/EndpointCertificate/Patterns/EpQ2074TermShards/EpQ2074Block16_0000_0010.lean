/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 16:0-10

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 16 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_16_0000_0010 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0000 : Poly :=
[
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 16. -/
def ep_Q2_074_partial_16_0000 : Poly :=
[
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 2), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem ep_Q2_074_partial_16_0000_valid :
    mulPoly ep_Q2_074_coefficient_16_0000
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0001 : Poly :=
[
  term ((16023 : Rat) / 769) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 1 for generator 16. -/
def ep_Q2_074_partial_16_0001 : Poly :=
[
  term ((32046 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((-16023 : Rat) / 769) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((32046 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-16023 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem ep_Q2_074_partial_16_0001_valid :
    mulPoly ep_Q2_074_coefficient_16_0001
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0002 : Poly :=
[
  term ((-297 : Rat) / 769) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 16. -/
def ep_Q2_074_partial_16_0002 : Poly :=
[
  term ((-594 : Rat) / 769) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((297 : Rat) / 769) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((297 : Rat) / 769) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem ep_Q2_074_partial_16_0002_valid :
    mulPoly ep_Q2_074_coefficient_16_0002
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0003 : Poly :=
[
  term ((1695 : Rat) / 769) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 16. -/
def ep_Q2_074_partial_16_0003 : Poly :=
[
  term ((3390 : Rat) / 769) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1695 : Rat) / 769) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((3390 : Rat) / 769) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1695 : Rat) / 769) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem ep_Q2_074_partial_16_0003_valid :
    mulPoly ep_Q2_074_coefficient_16_0003
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0004 : Poly :=
[
  term ((-7776 : Rat) / 769) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 4 for generator 16. -/
def ep_Q2_074_partial_16_0004 : Poly :=
[
  term ((-15552 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (6, 1), (16, 1)],
  term ((7776 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((-15552 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (7, 1), (16, 1)],
  term ((7776 : Rat) / 769) [(1, 2), (2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem ep_Q2_074_partial_16_0004_valid :
    mulPoly ep_Q2_074_coefficient_16_0004
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0005 : Poly :=
[
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 5 for generator 16. -/
def ep_Q2_074_partial_16_0005 : Poly :=
[
  term ((29520 : Rat) / 769) [(1, 2), (3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (4, 2), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem ep_Q2_074_partial_16_0005_valid :
    mulPoly ep_Q2_074_coefficient_16_0005
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0006 : Poly :=
[
  term ((4086 : Rat) / 769) [(1, 2), (16, 1)]
]

/-- Partial product 6 for generator 16. -/
def ep_Q2_074_partial_16_0006 : Poly :=
[
  term ((8172 : Rat) / 769) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-4086 : Rat) / 769) [(1, 2), (4, 2), (16, 1)],
  term ((8172 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-4086 : Rat) / 769) [(1, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem ep_Q2_074_partial_16_0006_valid :
    mulPoly ep_Q2_074_coefficient_16_0006
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0007 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (16, 1)]
]

/-- Partial product 7 for generator 16. -/
def ep_Q2_074_partial_16_0007 : Poly :=
[
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 1), (4, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem ep_Q2_074_partial_16_0007_valid :
    mulPoly ep_Q2_074_coefficient_16_0007
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0008 : Poly :=
[
  term ((-22638 : Rat) / 769) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 8 for generator 16. -/
def ep_Q2_074_partial_16_0008 : Poly :=
[
  term ((-45276 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((-45276 : Rat) / 769) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(3, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem ep_Q2_074_partial_16_0008_valid :
    mulPoly ep_Q2_074_coefficient_16_0008
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0009 : Poly :=
[
  term ((-990 : Rat) / 769) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 16. -/
def ep_Q2_074_partial_16_0009 : Poly :=
[
  term ((-1980 : Rat) / 769) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((990 : Rat) / 769) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1980 : Rat) / 769) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((990 : Rat) / 769) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem ep_Q2_074_partial_16_0009_valid :
    mulPoly ep_Q2_074_coefficient_16_0009
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def ep_Q2_074_coefficient_16_0010 : Poly :=
[
  term ((864 : Rat) / 769) [(3, 2), (16, 1)]
]

/-- Partial product 10 for generator 16. -/
def ep_Q2_074_partial_16_0010 : Poly :=
[
  term ((1728 : Rat) / 769) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 2), (4, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem ep_Q2_074_partial_16_0010_valid :
    mulPoly ep_Q2_074_coefficient_16_0010
        ep_Q2_074_generator_16_0000_0010 =
      ep_Q2_074_partial_16_0010 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_16_0000_0010 : List Poly :=
[
  ep_Q2_074_partial_16_0000,
  ep_Q2_074_partial_16_0001,
  ep_Q2_074_partial_16_0002,
  ep_Q2_074_partial_16_0003,
  ep_Q2_074_partial_16_0004,
  ep_Q2_074_partial_16_0005,
  ep_Q2_074_partial_16_0006,
  ep_Q2_074_partial_16_0007,
  ep_Q2_074_partial_16_0008,
  ep_Q2_074_partial_16_0009,
  ep_Q2_074_partial_16_0010
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_16_0000_0010 : Poly :=
[
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 2), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (5, 2), (16, 1)],
  term ((32046 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((-16023 : Rat) / 769) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((32046 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-16023 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-594 : Rat) / 769) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((3390 : Rat) / 769) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((297 : Rat) / 769) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-1695 : Rat) / 769) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((3390 : Rat) / 769) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((297 : Rat) / 769) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-1695 : Rat) / 769) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-15552 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (6, 1), (16, 1)],
  term ((7776 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((-15552 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (7, 1), (16, 1)],
  term ((7776 : Rat) / 769) [(1, 2), (2, 1), (5, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 2), (3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (4, 2), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (5, 3), (16, 1)],
  term ((8172 : Rat) / 769) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-4086 : Rat) / 769) [(1, 2), (4, 2), (16, 1)],
  term ((8172 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-4086 : Rat) / 769) [(1, 2), (5, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 1), (4, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((-45276 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1980 : Rat) / 769) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((990 : Rat) / 769) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1980 : Rat) / 769) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-45276 : Rat) / 769) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((990 : Rat) / 769) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(3, 1), (5, 3), (16, 1)],
  term ((1728 : Rat) / 769) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 2), (4, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 10. -/
theorem ep_Q2_074_block_16_0000_0010_valid :
    checkProductSumEq ep_Q2_074_partials_16_0000_0010
      ep_Q2_074_block_16_0000_0010 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
