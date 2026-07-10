/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 28:0-50

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_28_0000_0050 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0000 : Poly :=
[
  term ((-8225 : Rat) / 16) []
]

/-- Partial product 0 for generator 28. -/
def ep_Q2_064_partial_28_0000 : Poly :=
[
  term ((8225 : Rat) / 8) [(0, 1), (14, 1)],
  term ((-8225 : Rat) / 16) [(0, 2)],
  term ((8225 : Rat) / 8) [(1, 1), (15, 1)],
  term ((-8225 : Rat) / 16) [(1, 2)],
  term ((-8225 : Rat) / 8) [(4, 1), (14, 1)],
  term ((8225 : Rat) / 16) [(4, 2)],
  term ((-8225 : Rat) / 8) [(5, 1), (15, 1)],
  term ((8225 : Rat) / 16) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem ep_Q2_064_partial_28_0000_valid :
    mulPoly ep_Q2_064_coefficient_28_0000
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0001 : Poly :=
[
  term ((9 : Rat) / 4) [(0, 1)]
]

/-- Partial product 1 for generator 28. -/
def ep_Q2_064_partial_28_0001 : Poly :=
[
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (15, 1)],
  term ((9 : Rat) / 4) [(0, 1), (1, 2)],
  term ((9 : Rat) / 2) [(0, 1), (4, 1), (14, 1)],
  term ((-9 : Rat) / 4) [(0, 1), (4, 2)],
  term ((9 : Rat) / 2) [(0, 1), (5, 1), (15, 1)],
  term ((-9 : Rat) / 4) [(0, 1), (5, 2)],
  term ((-9 : Rat) / 2) [(0, 2), (14, 1)],
  term ((9 : Rat) / 4) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem ep_Q2_064_partial_28_0001_valid :
    mulPoly ep_Q2_064_coefficient_28_0001
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0002 : Poly :=
[
  term (54 : Rat) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 28. -/
def ep_Q2_064_partial_28_0002 : Poly :=
[
  term (108 : Rat) [(0, 1), (1, 1), (3, 1), (4, 1), (14, 1)],
  term (-54 : Rat) [(0, 1), (1, 1), (3, 1), (4, 2)],
  term (108 : Rat) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term (-54 : Rat) [(0, 1), (1, 1), (3, 1), (5, 2)],
  term (-108 : Rat) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term (54 : Rat) [(0, 1), (1, 3), (3, 1)],
  term (-108 : Rat) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term (54 : Rat) [(0, 3), (1, 1), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem ep_Q2_064_partial_28_0002_valid :
    mulPoly ep_Q2_064_coefficient_28_0002
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0003 : Poly :=
[
  term (-18 : Rat) [(0, 1), (1, 1), (5, 1)]
]

/-- Partial product 3 for generator 28. -/
def ep_Q2_064_partial_28_0003 : Poly :=
[
  term (-36 : Rat) [(0, 1), (1, 1), (4, 1), (5, 1), (14, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (4, 2), (5, 1)],
  term (-36 : Rat) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (5, 3)],
  term (36 : Rat) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term (-18 : Rat) [(0, 1), (1, 3), (5, 1)],
  term (36 : Rat) [(0, 2), (1, 1), (5, 1), (14, 1)],
  term (-18 : Rat) [(0, 3), (1, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem ep_Q2_064_partial_28_0003_valid :
    mulPoly ep_Q2_064_coefficient_28_0003
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0004 : Poly :=
[
  term (-36 : Rat) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 4 for generator 28. -/
def ep_Q2_064_partial_28_0004 : Poly :=
[
  term (-72 : Rat) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1)],
  term (36 : Rat) [(0, 1), (1, 1), (4, 2), (9, 1)],
  term (-72 : Rat) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1)],
  term (36 : Rat) [(0, 1), (1, 1), (5, 2), (9, 1)],
  term (72 : Rat) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term (-36 : Rat) [(0, 1), (1, 3), (9, 1)],
  term (72 : Rat) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term (-36 : Rat) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem ep_Q2_064_partial_28_0004_valid :
    mulPoly ep_Q2_064_coefficient_28_0004
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0005 : Poly :=
[
  term (-18 : Rat) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 5 for generator 28. -/
def ep_Q2_064_partial_28_0005 : Poly :=
[
  term (-36 : Rat) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term (-36 : Rat) [(0, 1), (1, 1), (5, 1), (15, 2)],
  term (18 : Rat) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term (36 : Rat) [(0, 1), (1, 2), (15, 2)],
  term (-18 : Rat) [(0, 1), (1, 3), (15, 1)],
  term (36 : Rat) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term (-18 : Rat) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem ep_Q2_064_partial_28_0005_valid :
    mulPoly ep_Q2_064_coefficient_28_0005
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0006 : Poly :=
[
  term (-81 : Rat) [(0, 1), (3, 1), (5, 1)]
]

/-- Partial product 6 for generator 28. -/
def ep_Q2_064_partial_28_0006 : Poly :=
[
  term (162 : Rat) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term (-81 : Rat) [(0, 1), (1, 2), (3, 1), (5, 1)],
  term (-162 : Rat) [(0, 1), (3, 1), (4, 1), (5, 1), (14, 1)],
  term (81 : Rat) [(0, 1), (3, 1), (4, 2), (5, 1)],
  term (-162 : Rat) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term (81 : Rat) [(0, 1), (3, 1), (5, 3)],
  term (162 : Rat) [(0, 2), (3, 1), (5, 1), (14, 1)],
  term (-81 : Rat) [(0, 3), (3, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem ep_Q2_064_partial_28_0006_valid :
    mulPoly ep_Q2_064_coefficient_28_0006
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0007 : Poly :=
[
  term (54 : Rat) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 7 for generator 28. -/
def ep_Q2_064_partial_28_0007 : Poly :=
[
  term (-108 : Rat) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1)],
  term (54 : Rat) [(0, 1), (1, 2), (5, 1), (9, 1)],
  term (108 : Rat) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1)],
  term (-54 : Rat) [(0, 1), (4, 2), (5, 1), (9, 1)],
  term (108 : Rat) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term (-54 : Rat) [(0, 1), (5, 3), (9, 1)],
  term (-108 : Rat) [(0, 2), (5, 1), (9, 1), (14, 1)],
  term (54 : Rat) [(0, 3), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem ep_Q2_064_partial_28_0007_valid :
    mulPoly ep_Q2_064_coefficient_28_0007
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0008 : Poly :=
[
  term (27 : Rat) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 8 for generator 28. -/
def ep_Q2_064_partial_28_0008 : Poly :=
[
  term (-54 : Rat) [(0, 1), (1, 1), (5, 1), (15, 2)],
  term (27 : Rat) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term (54 : Rat) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term (-27 : Rat) [(0, 1), (4, 2), (5, 1), (15, 1)],
  term (54 : Rat) [(0, 1), (5, 2), (15, 2)],
  term (-27 : Rat) [(0, 1), (5, 3), (15, 1)],
  term (-54 : Rat) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term (27 : Rat) [(0, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem ep_Q2_064_partial_28_0008_valid :
    mulPoly ep_Q2_064_coefficient_28_0008
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0009 : Poly :=
[
  term (-18 : Rat) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 28. -/
def ep_Q2_064_partial_28_0009 : Poly :=
[
  term (36 : Rat) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem ep_Q2_064_partial_28_0009_valid :
    mulPoly ep_Q2_064_coefficient_28_0009
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0010 : Poly :=
[
  term (27 : Rat) [(0, 1), (5, 2)]
]

/-- Partial product 10 for generator 28. -/
def ep_Q2_064_partial_28_0010 : Poly :=
[
  term (-54 : Rat) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term (27 : Rat) [(0, 1), (1, 2), (5, 2)],
  term (54 : Rat) [(0, 1), (4, 1), (5, 2), (14, 1)],
  term (-27 : Rat) [(0, 1), (4, 2), (5, 2)],
  term (54 : Rat) [(0, 1), (5, 3), (15, 1)],
  term (-27 : Rat) [(0, 1), (5, 4)],
  term (-54 : Rat) [(0, 2), (5, 2), (14, 1)],
  term (27 : Rat) [(0, 3), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem ep_Q2_064_partial_28_0010_valid :
    mulPoly ep_Q2_064_coefficient_28_0010
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0011 : Poly :=
[
  term (-18 : Rat) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 28. -/
def ep_Q2_064_partial_28_0011 : Poly :=
[
  term (36 : Rat) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term (-18 : Rat) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term (18 : Rat) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem ep_Q2_064_partial_28_0011_valid :
    mulPoly ep_Q2_064_coefficient_28_0011
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0012 : Poly :=
[
  term (81 : Rat) [(1, 1), (3, 1)]
]

/-- Partial product 12 for generator 28. -/
def ep_Q2_064_partial_28_0012 : Poly :=
[
  term (-162 : Rat) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term (81 : Rat) [(0, 2), (1, 1), (3, 1)],
  term (162 : Rat) [(1, 1), (3, 1), (4, 1), (14, 1)],
  term (-81 : Rat) [(1, 1), (3, 1), (4, 2)],
  term (162 : Rat) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term (-81 : Rat) [(1, 1), (3, 1), (5, 2)],
  term (-162 : Rat) [(1, 2), (3, 1), (15, 1)],
  term (81 : Rat) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem ep_Q2_064_partial_28_0012_valid :
    mulPoly ep_Q2_064_coefficient_28_0012
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0013 : Poly :=
[
  term (9 : Rat) [(1, 1), (5, 1)]
]

/-- Partial product 13 for generator 28. -/
def ep_Q2_064_partial_28_0013 : Poly :=
[
  term (-18 : Rat) [(0, 1), (1, 1), (5, 1), (14, 1)],
  term (9 : Rat) [(0, 2), (1, 1), (5, 1)],
  term (18 : Rat) [(1, 1), (4, 1), (5, 1), (14, 1)],
  term (-9 : Rat) [(1, 1), (4, 2), (5, 1)],
  term (18 : Rat) [(1, 1), (5, 2), (15, 1)],
  term (-9 : Rat) [(1, 1), (5, 3)],
  term (-18 : Rat) [(1, 2), (5, 1), (15, 1)],
  term (9 : Rat) [(1, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem ep_Q2_064_partial_28_0013_valid :
    mulPoly ep_Q2_064_coefficient_28_0013
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0014 : Poly :=
[
  term (-9 : Rat) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 14 for generator 28. -/
def ep_Q2_064_partial_28_0014 : Poly :=
[
  term (18 : Rat) [(0, 1), (1, 1), (5, 1), (14, 1), (16, 1)],
  term (-9 : Rat) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (5, 3), (16, 1)],
  term (18 : Rat) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem ep_Q2_064_partial_28_0014_valid :
    mulPoly ep_Q2_064_coefficient_28_0014
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0015 : Poly :=
[
  term (-36 : Rat) [(1, 1), (7, 1)]
]

/-- Partial product 15 for generator 28. -/
def ep_Q2_064_partial_28_0015 : Poly :=
[
  term (72 : Rat) [(0, 1), (1, 1), (7, 1), (14, 1)],
  term (-36 : Rat) [(0, 2), (1, 1), (7, 1)],
  term (-72 : Rat) [(1, 1), (4, 1), (7, 1), (14, 1)],
  term (36 : Rat) [(1, 1), (4, 2), (7, 1)],
  term (-72 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term (36 : Rat) [(1, 1), (5, 2), (7, 1)],
  term (72 : Rat) [(1, 2), (7, 1), (15, 1)],
  term (-36 : Rat) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem ep_Q2_064_partial_28_0015_valid :
    mulPoly ep_Q2_064_coefficient_28_0015
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0016 : Poly :=
[
  term (-54 : Rat) [(1, 1), (9, 1)]
]

/-- Partial product 16 for generator 28. -/
def ep_Q2_064_partial_28_0016 : Poly :=
[
  term (108 : Rat) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term (-54 : Rat) [(0, 2), (1, 1), (9, 1)],
  term (-108 : Rat) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term (54 : Rat) [(1, 1), (4, 2), (9, 1)],
  term (-108 : Rat) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term (54 : Rat) [(1, 1), (5, 2), (9, 1)],
  term (108 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (-54 : Rat) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem ep_Q2_064_partial_28_0016_valid :
    mulPoly ep_Q2_064_coefficient_28_0016
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0017 : Poly :=
[
  term (-18 : Rat) [(1, 1), (13, 1)]
]

/-- Partial product 17 for generator 28. -/
def ep_Q2_064_partial_28_0017 : Poly :=
[
  term (36 : Rat) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term (-18 : Rat) [(0, 2), (1, 1), (13, 1)],
  term (-36 : Rat) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term (18 : Rat) [(1, 1), (4, 2), (13, 1)],
  term (-36 : Rat) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term (18 : Rat) [(1, 1), (5, 2), (13, 1)],
  term (36 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (-18 : Rat) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem ep_Q2_064_partial_28_0017_valid :
    mulPoly ep_Q2_064_coefficient_28_0017
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0018 : Poly :=
[
  term (9 : Rat) [(1, 1), (15, 1)]
]

/-- Partial product 18 for generator 28. -/
def ep_Q2_064_partial_28_0018 : Poly :=
[
  term (-18 : Rat) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term (9 : Rat) [(0, 2), (1, 1), (15, 1)],
  term (18 : Rat) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term (-9 : Rat) [(1, 1), (4, 2), (15, 1)],
  term (18 : Rat) [(1, 1), (5, 1), (15, 2)],
  term (-9 : Rat) [(1, 1), (5, 2), (15, 1)],
  term (-18 : Rat) [(1, 2), (15, 2)],
  term (9 : Rat) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem ep_Q2_064_partial_28_0018_valid :
    mulPoly ep_Q2_064_coefficient_28_0018
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0019 : Poly :=
[
  term (-9 : Rat) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 28. -/
def ep_Q2_064_partial_28_0019 : Poly :=
[
  term (18 : Rat) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term (9 : Rat) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term (18 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (-9 : Rat) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem ep_Q2_064_partial_28_0019_valid :
    mulPoly ep_Q2_064_coefficient_28_0019
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0020 : Poly :=
[
  term (-6783 : Rat) [(3, 1), (5, 1)]
]

/-- Partial product 20 for generator 28. -/
def ep_Q2_064_partial_28_0020 : Poly :=
[
  term (13566 : Rat) [(0, 1), (3, 1), (5, 1), (14, 1)],
  term (-6783 : Rat) [(0, 2), (3, 1), (5, 1)],
  term (13566 : Rat) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term (-6783 : Rat) [(1, 2), (3, 1), (5, 1)],
  term (-13566 : Rat) [(3, 1), (4, 1), (5, 1), (14, 1)],
  term (6783 : Rat) [(3, 1), (4, 2), (5, 1)],
  term (-13566 : Rat) [(3, 1), (5, 2), (15, 1)],
  term (6783 : Rat) [(3, 1), (5, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem ep_Q2_064_partial_28_0020_valid :
    mulPoly ep_Q2_064_coefficient_28_0020
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0021 : Poly :=
[
  term (8523 : Rat) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 21 for generator 28. -/
def ep_Q2_064_partial_28_0021 : Poly :=
[
  term (-17046 : Rat) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term (8523 : Rat) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term (-17046 : Rat) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term (8523 : Rat) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term (17046 : Rat) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term (-8523 : Rat) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term (17046 : Rat) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term (-8523 : Rat) [(3, 1), (5, 2), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem ep_Q2_064_partial_28_0021_valid :
    mulPoly ep_Q2_064_coefficient_28_0021
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0022 : Poly :=
[
  term (324 : Rat) [(3, 1), (7, 1)]
]

/-- Partial product 22 for generator 28. -/
def ep_Q2_064_partial_28_0022 : Poly :=
[
  term (-648 : Rat) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term (324 : Rat) [(0, 2), (3, 1), (7, 1)],
  term (-648 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (324 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (648 : Rat) [(3, 1), (4, 1), (7, 1), (14, 1)],
  term (-324 : Rat) [(3, 1), (4, 2), (7, 1)],
  term (648 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term (-324 : Rat) [(3, 1), (5, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem ep_Q2_064_partial_28_0022_valid :
    mulPoly ep_Q2_064_coefficient_28_0022
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0023 : Poly :=
[
  term (-8595 : Rat) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 23 for generator 28. -/
def ep_Q2_064_partial_28_0023 : Poly :=
[
  term (17190 : Rat) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term (-8595 : Rat) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term (17190 : Rat) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term (-8595 : Rat) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term (-17190 : Rat) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term (8595 : Rat) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term (-17190 : Rat) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term (8595 : Rat) [(3, 1), (5, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem ep_Q2_064_partial_28_0023_valid :
    mulPoly ep_Q2_064_coefficient_28_0023
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0024 : Poly :=
[
  term ((3861 : Rat) / 8) [(3, 1), (13, 1)]
]

/-- Partial product 24 for generator 28. -/
def ep_Q2_064_partial_28_0024 : Poly :=
[
  term ((-3861 : Rat) / 4) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((3861 : Rat) / 8) [(0, 2), (3, 1), (13, 1)],
  term ((-3861 : Rat) / 4) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((3861 : Rat) / 8) [(1, 2), (3, 1), (13, 1)],
  term ((3861 : Rat) / 4) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((-3861 : Rat) / 8) [(3, 1), (4, 2), (13, 1)],
  term ((3861 : Rat) / 4) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-3861 : Rat) / 8) [(3, 1), (5, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem ep_Q2_064_partial_28_0024_valid :
    mulPoly ep_Q2_064_coefficient_28_0024
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0025 : Poly :=
[
  term (36 : Rat) [(3, 1), (15, 1)]
]

/-- Partial product 25 for generator 28. -/
def ep_Q2_064_partial_28_0025 : Poly :=
[
  term (-72 : Rat) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term (36 : Rat) [(0, 2), (3, 1), (15, 1)],
  term (-72 : Rat) [(1, 1), (3, 1), (15, 2)],
  term (36 : Rat) [(1, 2), (3, 1), (15, 1)],
  term (72 : Rat) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term (-36 : Rat) [(3, 1), (4, 2), (15, 1)],
  term (72 : Rat) [(3, 1), (5, 1), (15, 2)],
  term (-36 : Rat) [(3, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem ep_Q2_064_partial_28_0025_valid :
    mulPoly ep_Q2_064_coefficient_28_0025
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0026 : Poly :=
[
  term ((7929 : Rat) / 4) [(3, 2)]
]

/-- Partial product 26 for generator 28. -/
def ep_Q2_064_partial_28_0026 : Poly :=
[
  term ((-7929 : Rat) / 2) [(0, 1), (3, 2), (14, 1)],
  term ((7929 : Rat) / 4) [(0, 2), (3, 2)],
  term ((-7929 : Rat) / 2) [(1, 1), (3, 2), (15, 1)],
  term ((7929 : Rat) / 4) [(1, 2), (3, 2)],
  term ((7929 : Rat) / 2) [(3, 2), (4, 1), (14, 1)],
  term ((-7929 : Rat) / 4) [(3, 2), (4, 2)],
  term ((7929 : Rat) / 2) [(3, 2), (5, 1), (15, 1)],
  term ((-7929 : Rat) / 4) [(3, 2), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem ep_Q2_064_partial_28_0026_valid :
    mulPoly ep_Q2_064_coefficient_28_0026
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0027 : Poly :=
[
  term (-2841 : Rat) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 27 for generator 28. -/
def ep_Q2_064_partial_28_0027 : Poly :=
[
  term (5682 : Rat) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term (-2841 : Rat) [(0, 2), (5, 1), (6, 1), (15, 1)],
  term (5682 : Rat) [(1, 1), (5, 1), (6, 1), (15, 2)],
  term (-2841 : Rat) [(1, 2), (5, 1), (6, 1), (15, 1)],
  term (-5682 : Rat) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term (2841 : Rat) [(4, 2), (5, 1), (6, 1), (15, 1)],
  term (-5682 : Rat) [(5, 2), (6, 1), (15, 2)],
  term (2841 : Rat) [(5, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem ep_Q2_064_partial_28_0027_valid :
    mulPoly ep_Q2_064_coefficient_28_0027
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0028 : Poly :=
[
  term ((945 : Rat) / 8) [(5, 1), (7, 1)]
]

/-- Partial product 28 for generator 28. -/
def ep_Q2_064_partial_28_0028 : Poly :=
[
  term ((-945 : Rat) / 4) [(0, 1), (5, 1), (7, 1), (14, 1)],
  term ((945 : Rat) / 8) [(0, 2), (5, 1), (7, 1)],
  term ((-945 : Rat) / 4) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((945 : Rat) / 8) [(1, 2), (5, 1), (7, 1)],
  term ((945 : Rat) / 4) [(4, 1), (5, 1), (7, 1), (14, 1)],
  term ((-945 : Rat) / 8) [(4, 2), (5, 1), (7, 1)],
  term ((945 : Rat) / 4) [(5, 2), (7, 1), (15, 1)],
  term ((-945 : Rat) / 8) [(5, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem ep_Q2_064_partial_28_0028_valid :
    mulPoly ep_Q2_064_coefficient_28_0028
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0029 : Poly :=
[
  term (3641 : Rat) [(5, 1), (9, 1)]
]

/-- Partial product 29 for generator 28. -/
def ep_Q2_064_partial_28_0029 : Poly :=
[
  term (-7282 : Rat) [(0, 1), (5, 1), (9, 1), (14, 1)],
  term (3641 : Rat) [(0, 2), (5, 1), (9, 1)],
  term (-7282 : Rat) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term (3641 : Rat) [(1, 2), (5, 1), (9, 1)],
  term (7282 : Rat) [(4, 1), (5, 1), (9, 1), (14, 1)],
  term (-3641 : Rat) [(4, 2), (5, 1), (9, 1)],
  term (7282 : Rat) [(5, 2), (9, 1), (15, 1)],
  term (-3641 : Rat) [(5, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem ep_Q2_064_partial_28_0029_valid :
    mulPoly ep_Q2_064_coefficient_28_0029
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0030 : Poly :=
[
  term (2865 : Rat) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 30 for generator 28. -/
def ep_Q2_064_partial_28_0030 : Poly :=
[
  term (-5730 : Rat) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term (2865 : Rat) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term (2865 : Rat) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term (-2865 : Rat) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(5, 2), (12, 1), (15, 2)],
  term (-2865 : Rat) [(5, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem ep_Q2_064_partial_28_0030_valid :
    mulPoly ep_Q2_064_coefficient_28_0030
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0031 : Poly :=
[
  term ((-3843 : Rat) / 8) [(5, 1), (13, 1)]
]

/-- Partial product 31 for generator 28. -/
def ep_Q2_064_partial_28_0031 : Poly :=
[
  term ((3843 : Rat) / 4) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((-3843 : Rat) / 8) [(0, 2), (5, 1), (13, 1)],
  term ((3843 : Rat) / 4) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-3843 : Rat) / 8) [(1, 2), (5, 1), (13, 1)],
  term ((-3843 : Rat) / 4) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((3843 : Rat) / 8) [(4, 2), (5, 1), (13, 1)],
  term ((-3843 : Rat) / 4) [(5, 2), (13, 1), (15, 1)],
  term ((3843 : Rat) / 8) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem ep_Q2_064_partial_28_0031_valid :
    mulPoly ep_Q2_064_coefficient_28_0031
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0032 : Poly :=
[
  term ((1807 : Rat) / 2) [(5, 1), (15, 1)]
]

/-- Partial product 32 for generator 28. -/
def ep_Q2_064_partial_28_0032 : Poly :=
[
  term (-1807 : Rat) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((1807 : Rat) / 2) [(0, 2), (5, 1), (15, 1)],
  term (-1807 : Rat) [(1, 1), (5, 1), (15, 2)],
  term ((1807 : Rat) / 2) [(1, 2), (5, 1), (15, 1)],
  term (1807 : Rat) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-1807 : Rat) / 2) [(4, 2), (5, 1), (15, 1)],
  term (1807 : Rat) [(5, 2), (15, 2)],
  term ((-1807 : Rat) / 2) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem ep_Q2_064_partial_28_0032_valid :
    mulPoly ep_Q2_064_coefficient_28_0032
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0033 : Poly :=
[
  term (16 : Rat) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 28. -/
def ep_Q2_064_partial_28_0033 : Poly :=
[
  term (-32 : Rat) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(5, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem ep_Q2_064_partial_28_0033_valid :
    mulPoly ep_Q2_064_coefficient_28_0033
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0034 : Poly :=
[
  term ((8163 : Rat) / 4) [(5, 2)]
]

/-- Partial product 34 for generator 28. -/
def ep_Q2_064_partial_28_0034 : Poly :=
[
  term ((-8163 : Rat) / 2) [(0, 1), (5, 2), (14, 1)],
  term ((8163 : Rat) / 4) [(0, 2), (5, 2)],
  term ((-8163 : Rat) / 2) [(1, 1), (5, 2), (15, 1)],
  term ((8163 : Rat) / 4) [(1, 2), (5, 2)],
  term ((8163 : Rat) / 2) [(4, 1), (5, 2), (14, 1)],
  term ((-8163 : Rat) / 4) [(4, 2), (5, 2)],
  term ((8163 : Rat) / 2) [(5, 3), (15, 1)],
  term ((-8163 : Rat) / 4) [(5, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem ep_Q2_064_partial_28_0034_valid :
    mulPoly ep_Q2_064_coefficient_28_0034
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0035 : Poly :=
[
  term (-45 : Rat) [(6, 1)]
]

/-- Partial product 35 for generator 28. -/
def ep_Q2_064_partial_28_0035 : Poly :=
[
  term (90 : Rat) [(0, 1), (6, 1), (14, 1)],
  term (-45 : Rat) [(0, 2), (6, 1)],
  term (90 : Rat) [(1, 1), (6, 1), (15, 1)],
  term (-45 : Rat) [(1, 2), (6, 1)],
  term (-90 : Rat) [(4, 1), (6, 1), (14, 1)],
  term (45 : Rat) [(4, 2), (6, 1)],
  term (-90 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (45 : Rat) [(5, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem ep_Q2_064_partial_28_0035_valid :
    mulPoly ep_Q2_064_coefficient_28_0035
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0036 : Poly :=
[
  term (-5682 : Rat) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 36 for generator 28. -/
def ep_Q2_064_partial_28_0036 : Poly :=
[
  term (11364 : Rat) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term (-5682 : Rat) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term (11364 : Rat) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term (-5682 : Rat) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term (-11364 : Rat) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term (5682 : Rat) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term (-11364 : Rat) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term (5682 : Rat) [(5, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem ep_Q2_064_partial_28_0036_valid :
    mulPoly ep_Q2_064_coefficient_28_0036
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0037 : Poly :=
[
  term (-2841 : Rat) [(6, 1), (15, 2)]
]

/-- Partial product 37 for generator 28. -/
def ep_Q2_064_partial_28_0037 : Poly :=
[
  term (5682 : Rat) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term (-2841 : Rat) [(0, 2), (6, 1), (15, 2)],
  term (5682 : Rat) [(1, 1), (6, 1), (15, 3)],
  term (-2841 : Rat) [(1, 2), (6, 1), (15, 2)],
  term (-5682 : Rat) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term (2841 : Rat) [(4, 2), (6, 1), (15, 2)],
  term (-5682 : Rat) [(5, 1), (6, 1), (15, 3)],
  term (2841 : Rat) [(5, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem ep_Q2_064_partial_28_0037_valid :
    mulPoly ep_Q2_064_coefficient_28_0037
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0038 : Poly :=
[
  term (-216 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 38 for generator 28. -/
def ep_Q2_064_partial_28_0038 : Poly :=
[
  term (432 : Rat) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term (-216 : Rat) [(0, 2), (7, 1), (9, 1)],
  term (432 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (-216 : Rat) [(1, 2), (7, 1), (9, 1)],
  term (-432 : Rat) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term (216 : Rat) [(4, 2), (7, 1), (9, 1)],
  term (-432 : Rat) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term (216 : Rat) [(5, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem ep_Q2_064_partial_28_0038_valid :
    mulPoly ep_Q2_064_coefficient_28_0038
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0039 : Poly :=
[
  term ((-13605 : Rat) / 8) [(7, 1), (15, 1)]
]

/-- Partial product 39 for generator 28. -/
def ep_Q2_064_partial_28_0039 : Poly :=
[
  term ((13605 : Rat) / 4) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-13605 : Rat) / 8) [(0, 2), (7, 1), (15, 1)],
  term ((13605 : Rat) / 4) [(1, 1), (7, 1), (15, 2)],
  term ((-13605 : Rat) / 8) [(1, 2), (7, 1), (15, 1)],
  term ((-13605 : Rat) / 4) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((13605 : Rat) / 8) [(4, 2), (7, 1), (15, 1)],
  term ((-13605 : Rat) / 4) [(5, 1), (7, 1), (15, 2)],
  term ((13605 : Rat) / 8) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem ep_Q2_064_partial_28_0039_valid :
    mulPoly ep_Q2_064_coefficient_28_0039
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0040 : Poly :=
[
  term (5730 : Rat) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 40 for generator 28. -/
def ep_Q2_064_partial_28_0040 : Poly :=
[
  term (-11460 : Rat) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term (5730 : Rat) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term (-11460 : Rat) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term (5730 : Rat) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term (11460 : Rat) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term (-5730 : Rat) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term (11460 : Rat) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term (-5730 : Rat) [(5, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem ep_Q2_064_partial_28_0040_valid :
    mulPoly ep_Q2_064_coefficient_28_0040
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0041 : Poly :=
[
  term ((-1971 : Rat) / 8) [(9, 1), (13, 1)]
]

/-- Partial product 41 for generator 28. -/
def ep_Q2_064_partial_28_0041 : Poly :=
[
  term ((1971 : Rat) / 4) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1971 : Rat) / 8) [(0, 2), (9, 1), (13, 1)],
  term ((1971 : Rat) / 4) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(1, 2), (9, 1), (13, 1)],
  term ((-1971 : Rat) / 4) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((1971 : Rat) / 8) [(4, 2), (9, 1), (13, 1)],
  term ((-1971 : Rat) / 4) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem ep_Q2_064_partial_28_0041_valid :
    mulPoly ep_Q2_064_coefficient_28_0041
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0042 : Poly :=
[
  term (-24 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 42 for generator 28. -/
def ep_Q2_064_partial_28_0042 : Poly :=
[
  term (48 : Rat) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term (-24 : Rat) [(0, 2), (9, 1), (15, 1)],
  term (48 : Rat) [(1, 1), (9, 1), (15, 2)],
  term (-24 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (-48 : Rat) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(4, 2), (9, 1), (15, 1)],
  term (-48 : Rat) [(5, 1), (9, 1), (15, 2)],
  term (24 : Rat) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem ep_Q2_064_partial_28_0042_valid :
    mulPoly ep_Q2_064_coefficient_28_0042
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0043 : Poly :=
[
  term (-881 : Rat) [(9, 2)]
]

/-- Partial product 43 for generator 28. -/
def ep_Q2_064_partial_28_0043 : Poly :=
[
  term (1762 : Rat) [(0, 1), (9, 2), (14, 1)],
  term (-881 : Rat) [(0, 2), (9, 2)],
  term (1762 : Rat) [(1, 1), (9, 2), (15, 1)],
  term (-881 : Rat) [(1, 2), (9, 2)],
  term (-1762 : Rat) [(4, 1), (9, 2), (14, 1)],
  term (881 : Rat) [(4, 2), (9, 2)],
  term (-1762 : Rat) [(5, 1), (9, 2), (15, 1)],
  term (881 : Rat) [(5, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem ep_Q2_064_partial_28_0043_valid :
    mulPoly ep_Q2_064_coefficient_28_0043
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0044 : Poly :=
[
  term (45 : Rat) [(12, 1)]
]

/-- Partial product 44 for generator 28. -/
def ep_Q2_064_partial_28_0044 : Poly :=
[
  term (-90 : Rat) [(0, 1), (12, 1), (14, 1)],
  term (45 : Rat) [(0, 2), (12, 1)],
  term (-90 : Rat) [(1, 1), (12, 1), (15, 1)],
  term (45 : Rat) [(1, 2), (12, 1)],
  term (90 : Rat) [(4, 1), (12, 1), (14, 1)],
  term (-45 : Rat) [(4, 2), (12, 1)],
  term (90 : Rat) [(5, 1), (12, 1), (15, 1)],
  term (-45 : Rat) [(5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem ep_Q2_064_partial_28_0044_valid :
    mulPoly ep_Q2_064_coefficient_28_0044
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0045 : Poly :=
[
  term (2865 : Rat) [(12, 1), (15, 2)]
]

/-- Partial product 45 for generator 28. -/
def ep_Q2_064_partial_28_0045 : Poly :=
[
  term (-5730 : Rat) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term (2865 : Rat) [(0, 2), (12, 1), (15, 2)],
  term (-5730 : Rat) [(1, 1), (12, 1), (15, 3)],
  term (2865 : Rat) [(1, 2), (12, 1), (15, 2)],
  term (5730 : Rat) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term (-2865 : Rat) [(4, 2), (12, 1), (15, 2)],
  term (5730 : Rat) [(5, 1), (12, 1), (15, 3)],
  term (-2865 : Rat) [(5, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem ep_Q2_064_partial_28_0045_valid :
    mulPoly ep_Q2_064_coefficient_28_0045
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0046 : Poly :=
[
  term ((11091 : Rat) / 8) [(13, 1), (15, 1)]
]

/-- Partial product 46 for generator 28. -/
def ep_Q2_064_partial_28_0046 : Poly :=
[
  term ((-11091 : Rat) / 4) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((11091 : Rat) / 8) [(0, 2), (13, 1), (15, 1)],
  term ((-11091 : Rat) / 4) [(1, 1), (13, 1), (15, 2)],
  term ((11091 : Rat) / 8) [(1, 2), (13, 1), (15, 1)],
  term ((11091 : Rat) / 4) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11091 : Rat) / 8) [(4, 2), (13, 1), (15, 1)],
  term ((11091 : Rat) / 4) [(5, 1), (13, 1), (15, 2)],
  term ((-11091 : Rat) / 8) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem ep_Q2_064_partial_28_0046_valid :
    mulPoly ep_Q2_064_coefficient_28_0046
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0047 : Poly :=
[
  term (18 : Rat) [(13, 2)]
]

/-- Partial product 47 for generator 28. -/
def ep_Q2_064_partial_28_0047 : Poly :=
[
  term (-36 : Rat) [(0, 1), (13, 2), (14, 1)],
  term (18 : Rat) [(0, 2), (13, 2)],
  term (-36 : Rat) [(1, 1), (13, 2), (15, 1)],
  term (18 : Rat) [(1, 2), (13, 2)],
  term (36 : Rat) [(4, 1), (13, 2), (14, 1)],
  term (-18 : Rat) [(4, 2), (13, 2)],
  term (36 : Rat) [(5, 1), (13, 2), (15, 1)],
  term (-18 : Rat) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 28. -/
theorem ep_Q2_064_partial_28_0047_valid :
    mulPoly ep_Q2_064_coefficient_28_0047
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0048 : Poly :=
[
  term ((-9 : Rat) / 4) [(14, 1)]
]

/-- Partial product 48 for generator 28. -/
def ep_Q2_064_partial_28_0048 : Poly :=
[
  term ((9 : Rat) / 2) [(0, 1), (14, 2)],
  term ((-9 : Rat) / 4) [(0, 2), (14, 1)],
  term ((9 : Rat) / 2) [(1, 1), (14, 1), (15, 1)],
  term ((-9 : Rat) / 4) [(1, 2), (14, 1)],
  term ((-9 : Rat) / 2) [(4, 1), (14, 2)],
  term ((9 : Rat) / 4) [(4, 2), (14, 1)],
  term ((-9 : Rat) / 2) [(5, 1), (14, 1), (15, 1)],
  term ((9 : Rat) / 4) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 28. -/
theorem ep_Q2_064_partial_28_0048_valid :
    mulPoly ep_Q2_064_coefficient_28_0048
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0049 : Poly :=
[
  term ((-4549 : Rat) / 4) [(15, 2)]
]

/-- Partial product 49 for generator 28. -/
def ep_Q2_064_partial_28_0049 : Poly :=
[
  term ((4549 : Rat) / 2) [(0, 1), (14, 1), (15, 2)],
  term ((-4549 : Rat) / 4) [(0, 2), (15, 2)],
  term ((4549 : Rat) / 2) [(1, 1), (15, 3)],
  term ((-4549 : Rat) / 4) [(1, 2), (15, 2)],
  term ((-4549 : Rat) / 2) [(4, 1), (14, 1), (15, 2)],
  term ((4549 : Rat) / 4) [(4, 2), (15, 2)],
  term ((-4549 : Rat) / 2) [(5, 1), (15, 3)],
  term ((4549 : Rat) / 4) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 28. -/
theorem ep_Q2_064_partial_28_0049_valid :
    mulPoly ep_Q2_064_coefficient_28_0049
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 28. -/
def ep_Q2_064_coefficient_28_0050 : Poly :=
[
  term (16 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 50 for generator 28. -/
def ep_Q2_064_partial_28_0050 : Poly :=
[
  term (-32 : Rat) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (-32 : Rat) [(1, 1), (15, 3), (16, 1)],
  term (16 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (32 : Rat) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(4, 2), (15, 2), (16, 1)],
  term (32 : Rat) [(5, 1), (15, 3), (16, 1)],
  term (-16 : Rat) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 28. -/
theorem ep_Q2_064_partial_28_0050_valid :
    mulPoly ep_Q2_064_coefficient_28_0050
        ep_Q2_064_generator_28_0000_0050 =
      ep_Q2_064_partial_28_0050 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_28_0000_0050 : List Poly :=
[
  ep_Q2_064_partial_28_0000,
  ep_Q2_064_partial_28_0001,
  ep_Q2_064_partial_28_0002,
  ep_Q2_064_partial_28_0003,
  ep_Q2_064_partial_28_0004,
  ep_Q2_064_partial_28_0005,
  ep_Q2_064_partial_28_0006,
  ep_Q2_064_partial_28_0007,
  ep_Q2_064_partial_28_0008,
  ep_Q2_064_partial_28_0009,
  ep_Q2_064_partial_28_0010,
  ep_Q2_064_partial_28_0011,
  ep_Q2_064_partial_28_0012,
  ep_Q2_064_partial_28_0013,
  ep_Q2_064_partial_28_0014,
  ep_Q2_064_partial_28_0015,
  ep_Q2_064_partial_28_0016,
  ep_Q2_064_partial_28_0017,
  ep_Q2_064_partial_28_0018,
  ep_Q2_064_partial_28_0019,
  ep_Q2_064_partial_28_0020,
  ep_Q2_064_partial_28_0021,
  ep_Q2_064_partial_28_0022,
  ep_Q2_064_partial_28_0023,
  ep_Q2_064_partial_28_0024,
  ep_Q2_064_partial_28_0025,
  ep_Q2_064_partial_28_0026,
  ep_Q2_064_partial_28_0027,
  ep_Q2_064_partial_28_0028,
  ep_Q2_064_partial_28_0029,
  ep_Q2_064_partial_28_0030,
  ep_Q2_064_partial_28_0031,
  ep_Q2_064_partial_28_0032,
  ep_Q2_064_partial_28_0033,
  ep_Q2_064_partial_28_0034,
  ep_Q2_064_partial_28_0035,
  ep_Q2_064_partial_28_0036,
  ep_Q2_064_partial_28_0037,
  ep_Q2_064_partial_28_0038,
  ep_Q2_064_partial_28_0039,
  ep_Q2_064_partial_28_0040,
  ep_Q2_064_partial_28_0041,
  ep_Q2_064_partial_28_0042,
  ep_Q2_064_partial_28_0043,
  ep_Q2_064_partial_28_0044,
  ep_Q2_064_partial_28_0045,
  ep_Q2_064_partial_28_0046,
  ep_Q2_064_partial_28_0047,
  ep_Q2_064_partial_28_0048,
  ep_Q2_064_partial_28_0049,
  ep_Q2_064_partial_28_0050
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_28_0000_0050 : Poly :=
[
  term (108 : Rat) [(0, 1), (1, 1), (3, 1), (4, 1), (14, 1)],
  term (-54 : Rat) [(0, 1), (1, 1), (3, 1), (4, 2)],
  term (270 : Rat) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term (-54 : Rat) [(0, 1), (1, 1), (3, 1), (5, 2)],
  term (-162 : Rat) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term (-36 : Rat) [(0, 1), (1, 1), (4, 1), (5, 1), (14, 1)],
  term (-72 : Rat) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1)],
  term (-36 : Rat) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (4, 2), (5, 1)],
  term (36 : Rat) [(0, 1), (1, 1), (4, 2), (9, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term (-180 : Rat) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1)],
  term (-18 : Rat) [(0, 1), (1, 1), (5, 1), (14, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (5, 1), (14, 1), (16, 1)],
  term (-90 : Rat) [(0, 1), (1, 1), (5, 1), (15, 2)],
  term (36 : Rat) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term (36 : Rat) [(0, 1), (1, 1), (5, 2), (9, 1)],
  term (-72 : Rat) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (5, 3)],
  term (72 : Rat) [(0, 1), (1, 1), (7, 1), (14, 1)],
  term (108 : Rat) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term (36 : Rat) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term (-18 : Rat) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (15, 1)],
  term (36 : Rat) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((9 : Rat) / 4) [(0, 1), (1, 2)],
  term (-81 : Rat) [(0, 1), (1, 2), (3, 1), (5, 1)],
  term (-108 : Rat) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term (54 : Rat) [(0, 1), (1, 2), (5, 1), (9, 1)],
  term (63 : Rat) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term (-18 : Rat) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(0, 1), (1, 2), (5, 2)],
  term (72 : Rat) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term (36 : Rat) [(0, 1), (1, 2), (15, 2)],
  term (-18 : Rat) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term (54 : Rat) [(0, 1), (1, 3), (3, 1)],
  term (-18 : Rat) [(0, 1), (1, 3), (5, 1)],
  term (-36 : Rat) [(0, 1), (1, 3), (9, 1)],
  term (-18 : Rat) [(0, 1), (1, 3), (15, 1)],
  term (-162 : Rat) [(0, 1), (3, 1), (4, 1), (5, 1), (14, 1)],
  term (81 : Rat) [(0, 1), (3, 1), (4, 2), (5, 1)],
  term (13566 : Rat) [(0, 1), (3, 1), (5, 1), (14, 1)],
  term (-162 : Rat) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term (81 : Rat) [(0, 1), (3, 1), (5, 3)],
  term (-17046 : Rat) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term (-648 : Rat) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term (17190 : Rat) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3861 : Rat) / 4) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term (-72 : Rat) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-7929 : Rat) / 2) [(0, 1), (3, 2), (14, 1)],
  term (108 : Rat) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1)],
  term (54 : Rat) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term (-36 : Rat) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (54 : Rat) [(0, 1), (4, 1), (5, 2), (14, 1)],
  term ((9 : Rat) / 2) [(0, 1), (4, 1), (14, 1)],
  term (-36 : Rat) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 4) [(0, 1), (4, 2)],
  term (-54 : Rat) [(0, 1), (4, 2), (5, 1), (9, 1)],
  term (-27 : Rat) [(0, 1), (4, 2), (5, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(0, 1), (4, 2), (5, 2)],
  term (18 : Rat) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term (5682 : Rat) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-945 : Rat) / 4) [(0, 1), (5, 1), (7, 1), (14, 1)],
  term (-7282 : Rat) [(0, 1), (5, 1), (9, 1), (14, 1)],
  term (-5730 : Rat) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((3843 : Rat) / 4) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term (-1807 : Rat) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term (-32 : Rat) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(0, 1), (5, 1), (15, 1)],
  term (-36 : Rat) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-9 : Rat) / 4) [(0, 1), (5, 2)],
  term (108 : Rat) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((-8163 : Rat) / 2) [(0, 1), (5, 2), (14, 1)],
  term (54 : Rat) [(0, 1), (5, 2), (15, 2)],
  term (-18 : Rat) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term (-54 : Rat) [(0, 1), (5, 3), (9, 1)],
  term (27 : Rat) [(0, 1), (5, 3), (15, 1)],
  term (18 : Rat) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term (-27 : Rat) [(0, 1), (5, 4)],
  term (11364 : Rat) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term (90 : Rat) [(0, 1), (6, 1), (14, 1)],
  term (5682 : Rat) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term (432 : Rat) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((13605 : Rat) / 4) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term (-11460 : Rat) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1971 : Rat) / 4) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term (48 : Rat) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term (1762 : Rat) [(0, 1), (9, 2), (14, 1)],
  term (-90 : Rat) [(0, 1), (12, 1), (14, 1)],
  term (-5730 : Rat) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11091 : Rat) / 4) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term (-36 : Rat) [(0, 1), (13, 2), (14, 1)],
  term ((8225 : Rat) / 8) [(0, 1), (14, 1)],
  term ((4549 : Rat) / 2) [(0, 1), (14, 1), (15, 2)],
  term (-32 : Rat) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(0, 1), (14, 2)],
  term ((-8225 : Rat) / 16) [(0, 2)],
  term (81 : Rat) [(0, 2), (1, 1), (3, 1)],
  term (-108 : Rat) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term (9 : Rat) [(0, 2), (1, 1), (5, 1)],
  term (36 : Rat) [(0, 2), (1, 1), (5, 1), (14, 1)],
  term (-9 : Rat) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term (-36 : Rat) [(0, 2), (1, 1), (7, 1)],
  term (-54 : Rat) [(0, 2), (1, 1), (9, 1)],
  term (72 : Rat) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term (-18 : Rat) [(0, 2), (1, 1), (13, 1)],
  term (36 : Rat) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term (9 : Rat) [(0, 2), (1, 1), (15, 1)],
  term (-9 : Rat) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term (-6783 : Rat) [(0, 2), (3, 1), (5, 1)],
  term (162 : Rat) [(0, 2), (3, 1), (5, 1), (14, 1)],
  term (8523 : Rat) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term (324 : Rat) [(0, 2), (3, 1), (7, 1)],
  term (-8595 : Rat) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((3861 : Rat) / 8) [(0, 2), (3, 1), (13, 1)],
  term (36 : Rat) [(0, 2), (3, 1), (15, 1)],
  term ((7929 : Rat) / 4) [(0, 2), (3, 2)],
  term (-2841 : Rat) [(0, 2), (5, 1), (6, 1), (15, 1)],
  term ((945 : Rat) / 8) [(0, 2), (5, 1), (7, 1)],
  term (3641 : Rat) [(0, 2), (5, 1), (9, 1)],
  term (-108 : Rat) [(0, 2), (5, 1), (9, 1), (14, 1)],
  term (2865 : Rat) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3843 : Rat) / 8) [(0, 2), (5, 1), (13, 1)],
  term (-54 : Rat) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term (36 : Rat) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1807 : Rat) / 2) [(0, 2), (5, 1), (15, 1)],
  term (16 : Rat) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((8163 : Rat) / 4) [(0, 2), (5, 2)],
  term (-54 : Rat) [(0, 2), (5, 2), (14, 1)],
  term (-45 : Rat) [(0, 2), (6, 1)],
  term (-5682 : Rat) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term (-2841 : Rat) [(0, 2), (6, 1), (15, 2)],
  term (-216 : Rat) [(0, 2), (7, 1), (9, 1)],
  term ((-13605 : Rat) / 8) [(0, 2), (7, 1), (15, 1)],
  term (5730 : Rat) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(0, 2), (9, 1), (13, 1)],
  term (-24 : Rat) [(0, 2), (9, 1), (15, 1)],
  term (-881 : Rat) [(0, 2), (9, 2)],
  term (45 : Rat) [(0, 2), (12, 1)],
  term (2865 : Rat) [(0, 2), (12, 1), (15, 2)],
  term ((11091 : Rat) / 8) [(0, 2), (13, 1), (15, 1)],
  term (18 : Rat) [(0, 2), (13, 2)],
  term ((-27 : Rat) / 4) [(0, 2), (14, 1)],
  term (36 : Rat) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4549 : Rat) / 4) [(0, 2), (15, 2)],
  term (16 : Rat) [(0, 2), (15, 2), (16, 1)],
  term ((9 : Rat) / 4) [(0, 3)],
  term (54 : Rat) [(0, 3), (1, 1), (3, 1)],
  term (-18 : Rat) [(0, 3), (1, 1), (5, 1)],
  term (-36 : Rat) [(0, 3), (1, 1), (9, 1)],
  term (-18 : Rat) [(0, 3), (1, 1), (15, 1)],
  term (-81 : Rat) [(0, 3), (3, 1), (5, 1)],
  term (54 : Rat) [(0, 3), (5, 1), (9, 1)],
  term (27 : Rat) [(0, 3), (5, 1), (15, 1)],
  term (-18 : Rat) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(0, 3), (5, 2)],
  term (-18 : Rat) [(0, 3), (15, 2), (16, 1)],
  term (162 : Rat) [(1, 1), (3, 1), (4, 1), (14, 1)],
  term (-81 : Rat) [(1, 1), (3, 1), (4, 2)],
  term (13728 : Rat) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term (-81 : Rat) [(1, 1), (3, 1), (5, 2)],
  term (-17046 : Rat) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term (-648 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (17190 : Rat) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-3861 : Rat) / 4) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term (-72 : Rat) [(1, 1), (3, 1), (15, 2)],
  term ((-7929 : Rat) / 2) [(1, 1), (3, 2), (15, 1)],
  term (18 : Rat) [(1, 1), (4, 1), (5, 1), (14, 1)],
  term (-18 : Rat) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term (-72 : Rat) [(1, 1), (4, 1), (7, 1), (14, 1)],
  term (-108 : Rat) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term (-36 : Rat) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term (18 : Rat) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term (-18 : Rat) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (4, 2), (5, 1)],
  term (9 : Rat) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term (36 : Rat) [(1, 1), (4, 2), (7, 1)],
  term (54 : Rat) [(1, 1), (4, 2), (9, 1)],
  term (18 : Rat) [(1, 1), (4, 2), (13, 1)],
  term (-9 : Rat) [(1, 1), (4, 2), (15, 1)],
  term (9 : Rat) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term (5682 : Rat) [(1, 1), (5, 1), (6, 1), (15, 2)],
  term ((-1233 : Rat) / 4) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term (-7390 : Rat) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term (-5730 : Rat) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((3699 : Rat) / 4) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term (-1789 : Rat) [(1, 1), (5, 1), (15, 2)],
  term (-50 : Rat) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term (36 : Rat) [(1, 1), (5, 2), (7, 1)],
  term (54 : Rat) [(1, 1), (5, 2), (9, 1)],
  term (18 : Rat) [(1, 1), (5, 2), (13, 1)],
  term ((-8145 : Rat) / 2) [(1, 1), (5, 2), (15, 1)],
  term (-9 : Rat) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (5, 3)],
  term (9 : Rat) [(1, 1), (5, 3), (16, 1)],
  term (11364 : Rat) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term (90 : Rat) [(1, 1), (6, 1), (15, 1)],
  term (5682 : Rat) [(1, 1), (6, 1), (15, 3)],
  term (432 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((13605 : Rat) / 4) [(1, 1), (7, 1), (15, 2)],
  term (-11460 : Rat) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((1971 : Rat) / 4) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term (48 : Rat) [(1, 1), (9, 1), (15, 2)],
  term (1762 : Rat) [(1, 1), (9, 2), (15, 1)],
  term (-90 : Rat) [(1, 1), (12, 1), (15, 1)],
  term (-5730 : Rat) [(1, 1), (12, 1), (15, 3)],
  term ((-11091 : Rat) / 4) [(1, 1), (13, 1), (15, 2)],
  term (-36 : Rat) [(1, 1), (13, 2), (15, 1)],
  term ((9 : Rat) / 2) [(1, 1), (14, 1), (15, 1)],
  term ((8225 : Rat) / 8) [(1, 1), (15, 1)],
  term ((4549 : Rat) / 2) [(1, 1), (15, 3)],
  term (-32 : Rat) [(1, 1), (15, 3), (16, 1)],
  term ((-8225 : Rat) / 16) [(1, 2)],
  term (-6783 : Rat) [(1, 2), (3, 1), (5, 1)],
  term (8523 : Rat) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term (324 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (-8595 : Rat) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((3861 : Rat) / 8) [(1, 2), (3, 1), (13, 1)],
  term (-126 : Rat) [(1, 2), (3, 1), (15, 1)],
  term ((7929 : Rat) / 4) [(1, 2), (3, 2)],
  term (-2841 : Rat) [(1, 2), (5, 1), (6, 1), (15, 1)],
  term ((945 : Rat) / 8) [(1, 2), (5, 1), (7, 1)],
  term (3641 : Rat) [(1, 2), (5, 1), (9, 1)],
  term (2865 : Rat) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3843 : Rat) / 8) [(1, 2), (5, 1), (13, 1)],
  term ((1771 : Rat) / 2) [(1, 2), (5, 1), (15, 1)],
  term (34 : Rat) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((8163 : Rat) / 4) [(1, 2), (5, 2)],
  term (-45 : Rat) [(1, 2), (6, 1)],
  term (-5682 : Rat) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term (-2841 : Rat) [(1, 2), (6, 1), (15, 2)],
  term (-216 : Rat) [(1, 2), (7, 1), (9, 1)],
  term ((-13029 : Rat) / 8) [(1, 2), (7, 1), (15, 1)],
  term (5730 : Rat) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1971 : Rat) / 8) [(1, 2), (9, 1), (13, 1)],
  term (84 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (-881 : Rat) [(1, 2), (9, 2)],
  term (45 : Rat) [(1, 2), (12, 1)],
  term (2865 : Rat) [(1, 2), (12, 1), (15, 2)],
  term ((11379 : Rat) / 8) [(1, 2), (13, 1), (15, 1)],
  term (18 : Rat) [(1, 2), (13, 2)],
  term ((-9 : Rat) / 4) [(1, 2), (14, 1)],
  term ((-4621 : Rat) / 4) [(1, 2), (15, 2)],
  term (34 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (81 : Rat) [(1, 3), (3, 1)],
  term (9 : Rat) [(1, 3), (5, 1)],
  term (-9 : Rat) [(1, 3), (5, 1), (16, 1)],
  term (-36 : Rat) [(1, 3), (7, 1)],
  term (-54 : Rat) [(1, 3), (9, 1)],
  term (-18 : Rat) [(1, 3), (13, 1)],
  term (9 : Rat) [(1, 3), (15, 1)],
  term (-9 : Rat) [(1, 3), (15, 1), (16, 1)],
  term (-13566 : Rat) [(3, 1), (4, 1), (5, 1), (14, 1)],
  term (17046 : Rat) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term (648 : Rat) [(3, 1), (4, 1), (7, 1), (14, 1)],
  term (-17190 : Rat) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((3861 : Rat) / 4) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term (72 : Rat) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term (6783 : Rat) [(3, 1), (4, 2), (5, 1)],
  term (-8523 : Rat) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term (-324 : Rat) [(3, 1), (4, 2), (7, 1)],
  term (8595 : Rat) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-3861 : Rat) / 8) [(3, 1), (4, 2), (13, 1)],
  term (-36 : Rat) [(3, 1), (4, 2), (15, 1)],
  term (17046 : Rat) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term (648 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term (-17190 : Rat) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((3861 : Rat) / 4) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term (72 : Rat) [(3, 1), (5, 1), (15, 2)],
  term (-8523 : Rat) [(3, 1), (5, 2), (6, 1), (15, 1)],
  term (-324 : Rat) [(3, 1), (5, 2), (7, 1)],
  term (8595 : Rat) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-3861 : Rat) / 8) [(3, 1), (5, 2), (13, 1)],
  term (-13602 : Rat) [(3, 1), (5, 2), (15, 1)],
  term (6783 : Rat) [(3, 1), (5, 3)],
  term ((7929 : Rat) / 2) [(3, 2), (4, 1), (14, 1)],
  term ((-7929 : Rat) / 4) [(3, 2), (4, 2)],
  term ((7929 : Rat) / 2) [(3, 2), (5, 1), (15, 1)],
  term ((-7929 : Rat) / 4) [(3, 2), (5, 2)],
  term (-5682 : Rat) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((945 : Rat) / 4) [(4, 1), (5, 1), (7, 1), (14, 1)],
  term (7282 : Rat) [(4, 1), (5, 1), (9, 1), (14, 1)],
  term (5730 : Rat) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3843 : Rat) / 4) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term (1807 : Rat) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term (32 : Rat) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((8163 : Rat) / 2) [(4, 1), (5, 2), (14, 1)],
  term (-11364 : Rat) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term (-90 : Rat) [(4, 1), (6, 1), (14, 1)],
  term (-5682 : Rat) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term (-432 : Rat) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-13605 : Rat) / 4) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term (11460 : Rat) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1971 : Rat) / 4) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term (-48 : Rat) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term (-1762 : Rat) [(4, 1), (9, 2), (14, 1)],
  term (90 : Rat) [(4, 1), (12, 1), (14, 1)],
  term (5730 : Rat) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((11091 : Rat) / 4) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term (36 : Rat) [(4, 1), (13, 2), (14, 1)],
  term ((-8225 : Rat) / 8) [(4, 1), (14, 1)],
  term ((-4549 : Rat) / 2) [(4, 1), (14, 1), (15, 2)],
  term (32 : Rat) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(4, 1), (14, 2)],
  term ((8225 : Rat) / 16) [(4, 2)],
  term (2841 : Rat) [(4, 2), (5, 1), (6, 1), (15, 1)],
  term ((-945 : Rat) / 8) [(4, 2), (5, 1), (7, 1)],
  term (-3641 : Rat) [(4, 2), (5, 1), (9, 1)],
  term (-2865 : Rat) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((3843 : Rat) / 8) [(4, 2), (5, 1), (13, 1)],
  term ((-1807 : Rat) / 2) [(4, 2), (5, 1), (15, 1)],
  term (-16 : Rat) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8163 : Rat) / 4) [(4, 2), (5, 2)],
  term (45 : Rat) [(4, 2), (6, 1)],
  term (5682 : Rat) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term (2841 : Rat) [(4, 2), (6, 1), (15, 2)],
  term (216 : Rat) [(4, 2), (7, 1), (9, 1)],
  term ((13605 : Rat) / 8) [(4, 2), (7, 1), (15, 1)],
  term (-5730 : Rat) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(4, 2), (9, 1), (13, 1)],
  term (24 : Rat) [(4, 2), (9, 1), (15, 1)],
  term (881 : Rat) [(4, 2), (9, 2)],
  term (-45 : Rat) [(4, 2), (12, 1)],
  term (-2865 : Rat) [(4, 2), (12, 1), (15, 2)],
  term ((-11091 : Rat) / 8) [(4, 2), (13, 1), (15, 1)],
  term (-18 : Rat) [(4, 2), (13, 2)],
  term ((9 : Rat) / 4) [(4, 2), (14, 1)],
  term ((4549 : Rat) / 4) [(4, 2), (15, 2)],
  term (-16 : Rat) [(4, 2), (15, 2), (16, 1)],
  term (-11364 : Rat) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term (-90 : Rat) [(5, 1), (6, 1), (15, 1)],
  term (-5682 : Rat) [(5, 1), (6, 1), (15, 3)],
  term (-432 : Rat) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-13605 : Rat) / 4) [(5, 1), (7, 1), (15, 2)],
  term (11460 : Rat) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1971 : Rat) / 4) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term (-48 : Rat) [(5, 1), (9, 1), (15, 2)],
  term (-1762 : Rat) [(5, 1), (9, 2), (15, 1)],
  term (90 : Rat) [(5, 1), (12, 1), (15, 1)],
  term (5730 : Rat) [(5, 1), (12, 1), (15, 3)],
  term ((11091 : Rat) / 4) [(5, 1), (13, 1), (15, 2)],
  term (36 : Rat) [(5, 1), (13, 2), (15, 1)],
  term ((-9 : Rat) / 2) [(5, 1), (14, 1), (15, 1)],
  term ((-8225 : Rat) / 8) [(5, 1), (15, 1)],
  term ((-4549 : Rat) / 2) [(5, 1), (15, 3)],
  term (32 : Rat) [(5, 1), (15, 3), (16, 1)],
  term ((8225 : Rat) / 16) [(5, 2)],
  term (45 : Rat) [(5, 2), (6, 1)],
  term (5682 : Rat) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term (-2841 : Rat) [(5, 2), (6, 1), (15, 2)],
  term (216 : Rat) [(5, 2), (7, 1), (9, 1)],
  term ((15495 : Rat) / 8) [(5, 2), (7, 1), (15, 1)],
  term (-5730 : Rat) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((1971 : Rat) / 8) [(5, 2), (9, 1), (13, 1)],
  term (7306 : Rat) [(5, 2), (9, 1), (15, 1)],
  term (881 : Rat) [(5, 2), (9, 2)],
  term (-45 : Rat) [(5, 2), (12, 1)],
  term (2865 : Rat) [(5, 2), (12, 1), (15, 2)],
  term ((-18777 : Rat) / 8) [(5, 2), (13, 1), (15, 1)],
  term (-18 : Rat) [(5, 2), (13, 2)],
  term ((9 : Rat) / 4) [(5, 2), (14, 1)],
  term ((11777 : Rat) / 4) [(5, 2), (15, 2)],
  term (16 : Rat) [(5, 2), (15, 2), (16, 1)],
  term (2841 : Rat) [(5, 3), (6, 1), (15, 1)],
  term ((-945 : Rat) / 8) [(5, 3), (7, 1)],
  term (-3641 : Rat) [(5, 3), (9, 1)],
  term (-2865 : Rat) [(5, 3), (12, 1), (15, 1)],
  term ((3843 : Rat) / 8) [(5, 3), (13, 1)],
  term (3178 : Rat) [(5, 3), (15, 1)],
  term (-16 : Rat) [(5, 3), (15, 1), (16, 1)],
  term ((-8163 : Rat) / 4) [(5, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 50. -/
theorem ep_Q2_064_block_28_0000_0050_valid :
    checkProductSumEq ep_Q2_064_partials_28_0000_0050
      ep_Q2_064_block_28_0000_0050 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
