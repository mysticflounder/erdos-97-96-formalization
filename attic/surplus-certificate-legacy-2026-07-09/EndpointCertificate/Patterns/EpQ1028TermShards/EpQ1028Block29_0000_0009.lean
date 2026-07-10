/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 29:0-9

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_29_0000_0009 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0000 : Poly :=
[
  term (-44 : Rat) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 29. -/
def ep_Q1_028_partial_29_0000 : Poly :=
[
  term (88 : Rat) [(0, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term (-44 : Rat) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term (88 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (-44 : Rat) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term (-88 : Rat) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term (44 : Rat) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term (-88 : Rat) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term (44 : Rat) [(5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem ep_Q1_028_partial_29_0000_valid :
    mulPoly ep_Q1_028_coefficient_29_0000
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0001 : Poly :=
[
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1 for generator 29. -/
def ep_Q1_028_partial_29_0001 : Poly :=
[
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem ep_Q1_028_partial_29_0001_valid :
    mulPoly ep_Q1_028_coefficient_29_0001
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0002 : Poly :=
[
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 29. -/
def ep_Q1_028_partial_29_0002 : Poly :=
[
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem ep_Q1_028_partial_29_0002_valid :
    mulPoly ep_Q1_028_coefficient_29_0002
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0003 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 29. -/
def ep_Q1_028_partial_29_0003 : Poly :=
[
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem ep_Q1_028_partial_29_0003_valid :
    mulPoly ep_Q1_028_coefficient_29_0003
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0004 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 2), (16, 1)]
]

/-- Partial product 4 for generator 29. -/
def ep_Q1_028_partial_29_0004 : Poly :=
[
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (16, 1)],
  term ((896 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (6, 2), (7, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 3), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem ep_Q1_028_partial_29_0004_valid :
    mulPoly ep_Q1_028_coefficient_29_0004
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0005 : Poly :=
[
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 5 for generator 29. -/
def ep_Q1_028_partial_29_0005 : Poly :=
[
  term ((-16 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((16 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((16 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem ep_Q1_028_partial_29_0005_valid :
    mulPoly ep_Q1_028_coefficient_29_0005
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0006 : Poly :=
[
  term ((28 : Rat) / 5) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 29. -/
def ep_Q1_028_partial_29_0006 : Poly :=
[
  term ((-56 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((28 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((56 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((56 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem ep_Q1_028_partial_29_0006_valid :
    mulPoly ep_Q1_028_coefficient_29_0006
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0007 : Poly :=
[
  term ((84 : Rat) / 5) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 29. -/
def ep_Q1_028_partial_29_0007 : Poly :=
[
  term ((-168 : Rat) / 5) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((168 : Rat) / 5) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((168 : Rat) / 5) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem ep_Q1_028_partial_29_0007_valid :
    mulPoly ep_Q1_028_coefficient_29_0007
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0008 : Poly :=
[
  term ((84 : Rat) / 5) [(7, 2), (16, 1)]
]

/-- Partial product 8 for generator 29. -/
def ep_Q1_028_partial_29_0008 : Poly :=
[
  term ((-168 : Rat) / 5) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((84 : Rat) / 5) [(0, 2), (7, 2), (16, 1)],
  term ((-168 : Rat) / 5) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(1, 2), (7, 2), (16, 1)],
  term ((168 : Rat) / 5) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(6, 2), (7, 2), (16, 1)],
  term ((168 : Rat) / 5) [(7, 3), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem ep_Q1_028_partial_29_0008_valid :
    mulPoly ep_Q1_028_coefficient_29_0008
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def ep_Q1_028_coefficient_29_0009 : Poly :=
[
  term (-1 : Rat) [(16, 1)]
]

/-- Partial product 9 for generator 29. -/
def ep_Q1_028_partial_29_0009 : Poly :=
[
  term (2 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem ep_Q1_028_partial_29_0009_valid :
    mulPoly ep_Q1_028_coefficient_29_0009
        ep_Q1_028_generator_29_0000_0009 =
      ep_Q1_028_partial_29_0009 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_29_0000_0009 : List Poly :=
[
  ep_Q1_028_partial_29_0000,
  ep_Q1_028_partial_29_0001,
  ep_Q1_028_partial_29_0002,
  ep_Q1_028_partial_29_0003,
  ep_Q1_028_partial_29_0004,
  ep_Q1_028_partial_29_0005,
  ep_Q1_028_partial_29_0006,
  ep_Q1_028_partial_29_0007,
  ep_Q1_028_partial_29_0008,
  ep_Q1_028_partial_29_0009
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_29_0000_0009 : Poly :=
[
  term (88 : Rat) [(0, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (-44 : Rat) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (16, 1)],
  term ((8 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((28 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((84 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 5) [(0, 2), (7, 2), (16, 1)],
  term (-1 : Rat) [(0, 2), (16, 1)],
  term (88 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (-44 : Rat) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (16, 1)],
  term ((8 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((28 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((84 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 5) [(1, 2), (7, 2), (16, 1)],
  term (-1 : Rat) [(1, 2), (16, 1)],
  term (-88 : Rat) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term (44 : Rat) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term (-88 : Rat) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term (44 : Rat) [(5, 1), (7, 3), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (6, 2), (7, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 3), (9, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 3), (11, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 3), (13, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 3), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 4), (16, 1)],
  term ((16 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((56 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((168 : Rat) / 5) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((168 : Rat) / 5) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(6, 2), (7, 2), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(7, 3), (9, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(7, 3), (11, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 3), (13, 1), (16, 1)],
  term ((168 : Rat) / 5) [(7, 3), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 9. -/
theorem ep_Q1_028_block_29_0000_0009_valid :
    checkProductSumEq ep_Q1_028_partials_29_0000_0009
      ep_Q1_028_block_29_0000_0009 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
