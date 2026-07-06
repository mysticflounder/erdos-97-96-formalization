/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 26:0-23

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 26 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_26_0000_0023 : Poly :=
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

/-- Coefficient term 0 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0000 : Poly :=
[
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 0 for generator 26. -/
def ep_Q1_028_partial_26_0000 : Poly :=
[
  term ((-64 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((32 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem ep_Q1_028_partial_26_0000_valid :
    mulPoly ep_Q1_028_coefficient_26_0000
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0001 : Poly :=
[
  term ((64 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1 for generator 26. -/
def ep_Q1_028_partial_26_0001 : Poly :=
[
  term ((-128 : Rat) / 5) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 5) [(0, 2), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 5) [(1, 2), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((128 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem ep_Q1_028_partial_26_0001_valid :
    mulPoly ep_Q1_028_coefficient_26_0001
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0002 : Poly :=
[
  term ((-256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 2 for generator 26. -/
def ep_Q1_028_partial_26_0002 : Poly :=
[
  term ((512 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((512 : Rat) / 15) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-512 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem ep_Q1_028_partial_26_0002_valid :
    mulPoly ep_Q1_028_coefficient_26_0002
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0003 : Poly :=
[
  term ((9344 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 3 for generator 26. -/
def ep_Q1_028_partial_26_0003 : Poly :=
[
  term ((-18688 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((9344 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-18688 : Rat) / 45) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((9344 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((18688 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9344 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9344 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((18688 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem ep_Q1_028_partial_26_0003_valid :
    mulPoly ep_Q1_028_coefficient_26_0003
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0004 : Poly :=
[
  term ((752 : Rat) / 45) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 26. -/
def ep_Q1_028_partial_26_0004 : Poly :=
[
  term ((-1504 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((752 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1504 : Rat) / 45) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((752 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((1504 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((1504 : Rat) / 45) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-752 : Rat) / 45) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-752 : Rat) / 45) [(5, 1), (7, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem ep_Q1_028_partial_26_0004_valid :
    mulPoly ep_Q1_028_coefficient_26_0004
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0005 : Poly :=
[
  term ((-2636 : Rat) / 45) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 5 for generator 26. -/
def ep_Q1_028_partial_26_0005 : Poly :=
[
  term ((5272 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2636 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((5272 : Rat) / 45) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2636 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-5272 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5272 : Rat) / 45) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2636 : Rat) / 45) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((2636 : Rat) / 45) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem ep_Q1_028_partial_26_0005_valid :
    mulPoly ep_Q1_028_coefficient_26_0005
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0006 : Poly :=
[
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 6 for generator 26. -/
def ep_Q1_028_partial_26_0006 : Poly :=
[
  term ((448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 26. -/
theorem ep_Q1_028_partial_26_0006_valid :
    mulPoly ep_Q1_028_coefficient_26_0006
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0007 : Poly :=
[
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 26. -/
def ep_Q1_028_partial_26_0007 : Poly :=
[
  term ((448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 26. -/
theorem ep_Q1_028_partial_26_0007_valid :
    mulPoly ep_Q1_028_coefficient_26_0007
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0008 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 26. -/
def ep_Q1_028_partial_26_0008 : Poly :=
[
  term ((-896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 26. -/
theorem ep_Q1_028_partial_26_0008_valid :
    mulPoly ep_Q1_028_coefficient_26_0008
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0009 : Poly :=
[
  term ((896 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (16, 1)]
]

/-- Partial product 9 for generator 26. -/
def ep_Q1_028_partial_26_0009 : Poly :=
[
  term ((-1792 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (12, 2), (16, 1)],
  term ((896 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (12, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (12, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 26. -/
theorem ep_Q1_028_partial_26_0009_valid :
    mulPoly ep_Q1_028_coefficient_26_0009
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0010 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 2), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 26. -/
def ep_Q1_028_partial_26_0010 : Poly :=
[
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((896 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 26. -/
theorem ep_Q1_028_partial_26_0010_valid :
    mulPoly ep_Q1_028_coefficient_26_0010
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0011 : Poly :=
[
  term ((224 : Rat) / 3) [(5, 2), (7, 2), (16, 1)]
]

/-- Partial product 11 for generator 26. -/
def ep_Q1_028_partial_26_0011 : Poly :=
[
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (12, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 2), (14, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 26. -/
theorem ep_Q1_028_partial_26_0011_valid :
    mulPoly ep_Q1_028_coefficient_26_0011
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0012 : Poly :=
[
  term ((-8 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 26. -/
def ep_Q1_028_partial_26_0012 : Poly :=
[
  term ((16 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 26. -/
theorem ep_Q1_028_partial_26_0012_valid :
    mulPoly ep_Q1_028_coefficient_26_0012
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0013 : Poly :=
[
  term ((-28 : Rat) / 5) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 26. -/
def ep_Q1_028_partial_26_0013 : Poly :=
[
  term ((56 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((56 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 5) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((28 : Rat) / 5) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 26. -/
theorem ep_Q1_028_partial_26_0013_valid :
    mulPoly ep_Q1_028_coefficient_26_0013
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0014 : Poly :=
[
  term ((64 : Rat) / 15) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 26. -/
def ep_Q1_028_partial_26_0014 : Poly :=
[
  term ((-128 : Rat) / 15) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 15) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 26. -/
theorem ep_Q1_028_partial_26_0014_valid :
    mulPoly ep_Q1_028_coefficient_26_0014
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0015 : Poly :=
[
  term ((-84 : Rat) / 5) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 26. -/
def ep_Q1_028_partial_26_0015 : Poly :=
[
  term ((168 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((168 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-84 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 5) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((84 : Rat) / 5) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-168 : Rat) / 5) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 26. -/
theorem ep_Q1_028_partial_26_0015_valid :
    mulPoly ep_Q1_028_coefficient_26_0015
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0016 : Poly :=
[
  term ((-32 : Rat) / 15) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 26. -/
def ep_Q1_028_partial_26_0016 : Poly :=
[
  term ((64 : Rat) / 15) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 15) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 15) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 26. -/
theorem ep_Q1_028_partial_26_0016_valid :
    mulPoly ep_Q1_028_coefficient_26_0016
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0017 : Poly :=
[
  term ((-16 : Rat) / 15) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 26. -/
def ep_Q1_028_partial_26_0017 : Poly :=
[
  term ((32 : Rat) / 15) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 15) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 15) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 15) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 26. -/
theorem ep_Q1_028_partial_26_0017_valid :
    mulPoly ep_Q1_028_coefficient_26_0017
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0018 : Poly :=
[
  term ((-704 : Rat) / 15) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 26. -/
def ep_Q1_028_partial_26_0018 : Poly :=
[
  term ((1408 : Rat) / 15) [(0, 1), (7, 2), (12, 2), (16, 1)],
  term ((-704 : Rat) / 15) [(0, 2), (7, 2), (12, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(1, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(1, 2), (7, 2), (12, 1), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 15) [(7, 2), (12, 1), (14, 2), (16, 1)],
  term ((704 : Rat) / 15) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 26. -/
theorem ep_Q1_028_partial_26_0018_valid :
    mulPoly ep_Q1_028_coefficient_26_0018
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0019 : Poly :=
[
  term ((352 : Rat) / 15) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 19 for generator 26. -/
def ep_Q1_028_partial_26_0019 : Poly :=
[
  term ((-704 : Rat) / 15) [(0, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((352 : Rat) / 15) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((352 : Rat) / 15) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((704 : Rat) / 15) [(7, 2), (12, 1), (14, 2), (16, 1)],
  term ((704 : Rat) / 15) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 15) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(7, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 26. -/
theorem ep_Q1_028_partial_26_0019_valid :
    mulPoly ep_Q1_028_coefficient_26_0019
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0020 : Poly :=
[
  term ((-76 : Rat) / 15) [(7, 2), (16, 1)]
]

/-- Partial product 20 for generator 26. -/
def ep_Q1_028_partial_26_0020 : Poly :=
[
  term ((152 : Rat) / 15) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-76 : Rat) / 15) [(0, 2), (7, 2), (16, 1)],
  term ((152 : Rat) / 15) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-76 : Rat) / 15) [(1, 2), (7, 2), (16, 1)],
  term ((-152 : Rat) / 15) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-152 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 15) [(7, 2), (14, 2), (16, 1)],
  term ((76 : Rat) / 15) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 26. -/
theorem ep_Q1_028_partial_26_0020_valid :
    mulPoly ep_Q1_028_coefficient_26_0020
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0021 : Poly :=
[
  term (6 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 21 for generator 26. -/
def ep_Q1_028_partial_26_0021 : Poly :=
[
  term (-12 : Rat) [(0, 1), (12, 2), (16, 1)],
  term (6 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (12 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (-6 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 26. -/
theorem ep_Q1_028_partial_26_0021_valid :
    mulPoly ep_Q1_028_coefficient_26_0021
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0022 : Poly :=
[
  term (2 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 22 for generator 26. -/
def ep_Q1_028_partial_26_0022 : Poly :=
[
  term (-4 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 26. -/
theorem ep_Q1_028_partial_26_0022_valid :
    mulPoly ep_Q1_028_coefficient_26_0022
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 26. -/
def ep_Q1_028_coefficient_26_0023 : Poly :=
[
  term (-3 : Rat) [(16, 1)]
]

/-- Partial product 23 for generator 26. -/
def ep_Q1_028_partial_26_0023 : Poly :=
[
  term (6 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (16, 1)],
  term (-6 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(14, 2), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 26. -/
theorem ep_Q1_028_partial_26_0023_valid :
    mulPoly ep_Q1_028_coefficient_26_0023
        ep_Q1_028_generator_26_0000_0023 =
      ep_Q1_028_partial_26_0023 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_26_0000_0023 : List Poly :=
[
  ep_Q1_028_partial_26_0000,
  ep_Q1_028_partial_26_0001,
  ep_Q1_028_partial_26_0002,
  ep_Q1_028_partial_26_0003,
  ep_Q1_028_partial_26_0004,
  ep_Q1_028_partial_26_0005,
  ep_Q1_028_partial_26_0006,
  ep_Q1_028_partial_26_0007,
  ep_Q1_028_partial_26_0008,
  ep_Q1_028_partial_26_0009,
  ep_Q1_028_partial_26_0010,
  ep_Q1_028_partial_26_0011,
  ep_Q1_028_partial_26_0012,
  ep_Q1_028_partial_26_0013,
  ep_Q1_028_partial_26_0014,
  ep_Q1_028_partial_26_0015,
  ep_Q1_028_partial_26_0016,
  ep_Q1_028_partial_26_0017,
  ep_Q1_028_partial_26_0018,
  ep_Q1_028_partial_26_0019,
  ep_Q1_028_partial_26_0020,
  ep_Q1_028_partial_26_0021,
  ep_Q1_028_partial_26_0022,
  ep_Q1_028_partial_26_0023
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_26_0000_0023 : Poly :=
[
  term ((-128 : Rat) / 5) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-1504 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((5272 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-18688 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (12, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (12, 2), (16, 1)],
  term ((16 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((56 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((168 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 15) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(0, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((152 : Rat) / 15) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(0, 1), (7, 2), (12, 2), (16, 1)],
  term (-4 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (12, 2), (16, 1)],
  term ((32 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((64 : Rat) / 5) [(0, 2), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((9344 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((752 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-2636 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (12, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((64 : Rat) / 15) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 15) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(0, 2), (7, 2), (12, 1), (16, 1)],
  term ((352 : Rat) / 15) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((-76 : Rat) / 15) [(0, 2), (7, 2), (16, 1)],
  term (6 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 15) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-18688 : Rat) / 45) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1504 : Rat) / 45) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((5272 : Rat) / 45) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(1, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((-1792 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((56 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((1408 : Rat) / 15) [(1, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((152 : Rat) / 15) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((64 : Rat) / 5) [(1, 2), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((9344 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((752 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-2636 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (12, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-28 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((64 : Rat) / 15) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(1, 2), (7, 2), (12, 1), (16, 1)],
  term ((352 : Rat) / 15) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((-76 : Rat) / 15) [(1, 2), (7, 2), (16, 1)],
  term (6 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((352 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((128 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 3), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((18688 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5272 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1568 : Rat) / 9) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9344 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((18688 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((1504 : Rat) / 45) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5272 : Rat) / 45) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-752 : Rat) / 45) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((2636 : Rat) / 45) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-752 : Rat) / 45) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((2636 : Rat) / 45) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (14, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 2), (14, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 2), (14, 3), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-56 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-56 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 5) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((28 : Rat) / 5) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-168 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((84 : Rat) / 5) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((44 : Rat) / 3) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-168 : Rat) / 5) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 15) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((16 : Rat) / 15) [(7, 1), (15, 3), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 15) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (12, 1), (14, 2), (16, 1)],
  term ((704 : Rat) / 15) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (12, 2), (14, 1), (16, 1)],
  term ((704 : Rat) / 15) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 15) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((76 : Rat) / 15) [(7, 2), (14, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(7, 2), (14, 3), (16, 1)],
  term ((76 : Rat) / 15) [(7, 2), (15, 2), (16, 1)],
  term (12 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (-6 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(12, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(14, 2), (16, 1)],
  term (-2 : Rat) [(14, 3), (16, 1)],
  term (3 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 23. -/
theorem ep_Q1_028_block_26_0000_0023_valid :
    checkProductSumEq ep_Q1_028_partials_26_0000_0023
      ep_Q1_028_block_26_0000_0023 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
