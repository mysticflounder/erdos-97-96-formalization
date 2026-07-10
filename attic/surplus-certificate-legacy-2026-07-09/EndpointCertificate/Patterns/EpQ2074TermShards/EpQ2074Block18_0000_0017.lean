/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 18:0-17

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_18_0000_0017 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0000 : Poly :=
[
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 18. -/
def ep_Q2_074_partial_18_0000 : Poly :=
[
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((528 : Rat) / 769) [(0, 1), (1, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem ep_Q2_074_partial_18_0000_valid :
    mulPoly ep_Q2_074_coefficient_18_0000
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0001 : Poly :=
[
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1 for generator 18. -/
def ep_Q2_074_partial_18_0001 : Poly :=
[
  term ((-528 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem ep_Q2_074_partial_18_0001_valid :
    mulPoly ep_Q2_074_coefficient_18_0001
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0002 : Poly :=
[
  term ((132 : Rat) / 769) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 18. -/
def ep_Q2_074_partial_18_0002 : Poly :=
[
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem ep_Q2_074_partial_18_0002_valid :
    mulPoly ep_Q2_074_coefficient_18_0002
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0003 : Poly :=
[
  term ((-132 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 3 for generator 18. -/
def ep_Q2_074_partial_18_0003 : Poly :=
[
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((132 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem ep_Q2_074_partial_18_0003_valid :
    mulPoly ep_Q2_074_coefficient_18_0003
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0004 : Poly :=
[
  term ((132 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 18. -/
def ep_Q2_074_partial_18_0004 : Poly :=
[
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem ep_Q2_074_partial_18_0004_valid :
    mulPoly ep_Q2_074_coefficient_18_0004
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0005 : Poly :=
[
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 18. -/
def ep_Q2_074_partial_18_0005 : Poly :=
[
  term ((-528 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem ep_Q2_074_partial_18_0005_valid :
    mulPoly ep_Q2_074_coefficient_18_0005
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0006 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 18. -/
def ep_Q2_074_partial_18_0006 : Poly :=
[
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem ep_Q2_074_partial_18_0006_valid :
    mulPoly ep_Q2_074_coefficient_18_0006
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0007 : Poly :=
[
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 7 for generator 18. -/
def ep_Q2_074_partial_18_0007 : Poly :=
[
  term ((-1584 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem ep_Q2_074_partial_18_0007_valid :
    mulPoly ep_Q2_074_coefficient_18_0007
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0008 : Poly :=
[
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 18. -/
def ep_Q2_074_partial_18_0008 : Poly :=
[
  term ((3168 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem ep_Q2_074_partial_18_0008_valid :
    mulPoly ep_Q2_074_coefficient_18_0008
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0009 : Poly :=
[
  term ((-1584 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 9 for generator 18. -/
def ep_Q2_074_partial_18_0009 : Poly :=
[
  term ((-3168 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem ep_Q2_074_partial_18_0009_valid :
    mulPoly ep_Q2_074_coefficient_18_0009
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0010 : Poly :=
[
  term ((396 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 18. -/
def ep_Q2_074_partial_18_0010 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem ep_Q2_074_partial_18_0010_valid :
    mulPoly ep_Q2_074_coefficient_18_0010
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0011 : Poly :=
[
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 18. -/
def ep_Q2_074_partial_18_0011 : Poly :=
[
  term ((-1584 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem ep_Q2_074_partial_18_0011_valid :
    mulPoly ep_Q2_074_coefficient_18_0011
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0012 : Poly :=
[
  term ((-528 : Rat) / 769) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 18. -/
def ep_Q2_074_partial_18_0012 : Poly :=
[
  term ((528 : Rat) / 769) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1056 : Rat) / 769) [(1, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem ep_Q2_074_partial_18_0012_valid :
    mulPoly ep_Q2_074_coefficient_18_0012
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0013 : Poly :=
[
  term ((528 : Rat) / 769) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 13 for generator 18. -/
def ep_Q2_074_partial_18_0013 : Poly :=
[
  term ((1056 : Rat) / 769) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 18. -/
theorem ep_Q2_074_partial_18_0013_valid :
    mulPoly ep_Q2_074_coefficient_18_0013
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0014 : Poly :=
[
  term ((-792 : Rat) / 769) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 18. -/
def ep_Q2_074_partial_18_0014 : Poly :=
[
  term ((-1584 : Rat) / 769) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 18. -/
theorem ep_Q2_074_partial_18_0014_valid :
    mulPoly ep_Q2_074_coefficient_18_0014
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0015 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 15 for generator 18. -/
def ep_Q2_074_partial_18_0015 : Poly :=
[
  term ((1584 : Rat) / 769) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 18. -/
theorem ep_Q2_074_partial_18_0015_valid :
    mulPoly ep_Q2_074_coefficient_18_0015
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0016 : Poly :=
[
  term ((-264 : Rat) / 769) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 18. -/
def ep_Q2_074_partial_18_0016 : Poly :=
[
  term ((-528 : Rat) / 769) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 18. -/
theorem ep_Q2_074_partial_18_0016_valid :
    mulPoly ep_Q2_074_coefficient_18_0016
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 18. -/
def ep_Q2_074_coefficient_18_0017 : Poly :=
[
  term ((528 : Rat) / 769) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 18. -/
def ep_Q2_074_partial_18_0017 : Poly :=
[
  term ((1056 : Rat) / 769) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 18. -/
theorem ep_Q2_074_partial_18_0017_valid :
    mulPoly ep_Q2_074_coefficient_18_0017
        ep_Q2_074_generator_18_0000_0017 =
      ep_Q2_074_partial_18_0017 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_18_0000_0017 : List Poly :=
[
  ep_Q2_074_partial_18_0000,
  ep_Q2_074_partial_18_0001,
  ep_Q2_074_partial_18_0002,
  ep_Q2_074_partial_18_0003,
  ep_Q2_074_partial_18_0004,
  ep_Q2_074_partial_18_0005,
  ep_Q2_074_partial_18_0006,
  ep_Q2_074_partial_18_0007,
  ep_Q2_074_partial_18_0008,
  ep_Q2_074_partial_18_0009,
  ep_Q2_074_partial_18_0010,
  ep_Q2_074_partial_18_0011,
  ep_Q2_074_partial_18_0012,
  ep_Q2_074_partial_18_0013,
  ep_Q2_074_partial_18_0014,
  ep_Q2_074_partial_18_0015,
  ep_Q2_074_partial_18_0016,
  ep_Q2_074_partial_18_0017
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_18_0000_0017 : Poly :=
[
  term ((-528 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((528 : Rat) / 769) [(0, 1), (1, 1), (8, 2), (11, 1), (16, 1)],
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((132 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((264 : Rat) / 769) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((3168 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3168 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (8, 2), (11, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((1056 : Rat) / 769) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((1056 : Rat) / 769) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1056 : Rat) / 769) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 1), (11, 1), (16, 1)],
  term ((-528 : Rat) / 769) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 17. -/
theorem ep_Q2_074_block_18_0000_0017_valid :
    checkProductSumEq ep_Q2_074_partials_18_0000_0017
      ep_Q2_074_block_18_0000_0017 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
