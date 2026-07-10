/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 19:0-5

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 19 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_19_0000_0005 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def ep_Q2_074_coefficient_19_0000 : Poly :=
[
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 19. -/
def ep_Q2_074_partial_19_0000 : Poly :=
[
  term ((528 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((528 : Rat) / 769) [(0, 1), (1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem ep_Q2_074_partial_19_0000_valid :
    mulPoly ep_Q2_074_coefficient_19_0000
        ep_Q2_074_generator_19_0000_0005 =
      ep_Q2_074_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def ep_Q2_074_coefficient_19_0001 : Poly :=
[
  term ((-132 : Rat) / 769) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 19. -/
def ep_Q2_074_partial_19_0001 : Poly :=
[
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((132 : Rat) / 769) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((132 : Rat) / 769) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem ep_Q2_074_partial_19_0001_valid :
    mulPoly ep_Q2_074_coefficient_19_0001
        ep_Q2_074_generator_19_0000_0005 =
      ep_Q2_074_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def ep_Q2_074_coefficient_19_0002 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 19. -/
def ep_Q2_074_partial_19_0002 : Poly :=
[
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (10, 2), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (11, 2), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem ep_Q2_074_partial_19_0002_valid :
    mulPoly ep_Q2_074_coefficient_19_0002
        ep_Q2_074_generator_19_0000_0005 =
      ep_Q2_074_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def ep_Q2_074_coefficient_19_0003 : Poly :=
[
  term ((-1584 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 19. -/
def ep_Q2_074_partial_19_0003 : Poly :=
[
  term ((-3168 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3168 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (10, 2), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem ep_Q2_074_partial_19_0003_valid :
    mulPoly ep_Q2_074_coefficient_19_0003
        ep_Q2_074_generator_19_0000_0005 =
      ep_Q2_074_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def ep_Q2_074_coefficient_19_0004 : Poly :=
[
  term ((-528 : Rat) / 769) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 19. -/
def ep_Q2_074_partial_19_0004 : Poly :=
[
  term ((-1056 : Rat) / 769) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1056 : Rat) / 769) [(1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem ep_Q2_074_partial_19_0004_valid :
    mulPoly ep_Q2_074_coefficient_19_0004
        ep_Q2_074_generator_19_0000_0005 =
      ep_Q2_074_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def ep_Q2_074_coefficient_19_0005 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 19. -/
def ep_Q2_074_partial_19_0005 : Poly :=
[
  term ((1584 : Rat) / 769) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem ep_Q2_074_partial_19_0005_valid :
    mulPoly ep_Q2_074_coefficient_19_0005
        ep_Q2_074_generator_19_0000_0005 =
      ep_Q2_074_partial_19_0005 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_19_0000_0005 : List Poly :=
[
  ep_Q2_074_partial_19_0000,
  ep_Q2_074_partial_19_0001,
  ep_Q2_074_partial_19_0002,
  ep_Q2_074_partial_19_0003,
  ep_Q2_074_partial_19_0004,
  ep_Q2_074_partial_19_0005
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_19_0000_0005 : Poly :=
[
  term ((528 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((528 : Rat) / 769) [(0, 1), (1, 1), (9, 2), (11, 1), (16, 1)],
  term ((132 : Rat) / 769) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((132 : Rat) / 769) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-3168 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (10, 2), (16, 1)],
  term ((-3168 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (11, 2), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (9, 2), (11, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (10, 2), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1056 : Rat) / 769) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1056 : Rat) / 769) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 5. -/
theorem ep_Q2_074_block_19_0000_0005_valid :
    checkProductSumEq ep_Q2_074_partials_19_0000_0005
      ep_Q2_074_block_19_0000_0005 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
