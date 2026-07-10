/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 11:0-47

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_11_0000_0047 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0000 : Poly :=
[
  term ((-3861 : Rat) / 32) []
]

/-- Partial product 0 for generator 11. -/
def ep_Q2_064_partial_11_0000 : Poly :=
[
  term ((-3861 : Rat) / 16) [(2, 1), (12, 1)],
  term ((-3861 : Rat) / 16) [(3, 1), (13, 1)],
  term ((3861 : Rat) / 32) [(12, 2)],
  term ((3861 : Rat) / 32) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem ep_Q2_064_partial_11_0000_valid :
    mulPoly ep_Q2_064_coefficient_11_0000
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0001 : Poly :=
[
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 1 for generator 11. -/
def ep_Q2_064_partial_11_0001 : Poly :=
[
  term (-9 : Rat) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (3, 1), (12, 2)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term (-9 : Rat) [(0, 1), (1, 1), (3, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem ep_Q2_064_partial_11_0001_valid :
    mulPoly ep_Q2_064_coefficient_11_0001
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0002 : Poly :=
[
  term ((-81 : Rat) / 2) [(0, 1), (1, 1), (5, 1)]
]

/-- Partial product 2 for generator 11. -/
def ep_Q2_064_partial_11_0002 : Poly :=
[
  term (-81 : Rat) [(0, 1), (1, 1), (2, 1), (5, 1), (12, 1)],
  term (-81 : Rat) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1)],
  term ((81 : Rat) / 2) [(0, 1), (1, 1), (5, 1), (12, 2)],
  term ((81 : Rat) / 2) [(0, 1), (1, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem ep_Q2_064_partial_11_0002_valid :
    mulPoly ep_Q2_064_coefficient_11_0002
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0003 : Poly :=
[
  term (72 : Rat) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 3 for generator 11. -/
def ep_Q2_064_partial_11_0003 : Poly :=
[
  term (144 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term (144 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term (-72 : Rat) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term (-72 : Rat) [(0, 1), (1, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem ep_Q2_064_partial_11_0003_valid :
    mulPoly ep_Q2_064_coefficient_11_0003
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0004 : Poly :=
[
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 4 for generator 11. -/
def ep_Q2_064_partial_11_0004 : Poly :=
[
  term (-9 : Rat) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1)],
  term (-9 : Rat) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem ep_Q2_064_partial_11_0004_valid :
    mulPoly ep_Q2_064_coefficient_11_0004
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0005 : Poly :=
[
  term ((-45 : Rat) / 2) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 5 for generator 11. -/
def ep_Q2_064_partial_11_0005 : Poly :=
[
  term (-45 : Rat) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term (-45 : Rat) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 2) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((45 : Rat) / 2) [(0, 1), (1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem ep_Q2_064_partial_11_0005_valid :
    mulPoly ep_Q2_064_coefficient_11_0005
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0006 : Poly :=
[
  term ((27 : Rat) / 4) [(0, 1), (3, 1), (5, 1)]
]

/-- Partial product 6 for generator 11. -/
def ep_Q2_064_partial_11_0006 : Poly :=
[
  term ((27 : Rat) / 2) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1)],
  term ((-27 : Rat) / 4) [(0, 1), (3, 1), (5, 1), (12, 2)],
  term ((-27 : Rat) / 4) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((27 : Rat) / 2) [(0, 1), (3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem ep_Q2_064_partial_11_0006_valid :
    mulPoly ep_Q2_064_coefficient_11_0006
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0007 : Poly :=
[
  term (-108 : Rat) [(0, 1), (5, 1), (7, 1)]
]

/-- Partial product 7 for generator 11. -/
def ep_Q2_064_partial_11_0007 : Poly :=
[
  term (-216 : Rat) [(0, 1), (2, 1), (5, 1), (7, 1), (12, 1)],
  term (-216 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term (108 : Rat) [(0, 1), (5, 1), (7, 1), (12, 2)],
  term (108 : Rat) [(0, 1), (5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem ep_Q2_064_partial_11_0007_valid :
    mulPoly ep_Q2_064_coefficient_11_0007
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0008 : Poly :=
[
  term ((27 : Rat) / 4) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 8 for generator 11. -/
def ep_Q2_064_partial_11_0008 : Poly :=
[
  term ((27 : Rat) / 2) [(0, 1), (2, 1), (5, 1), (9, 1), (12, 1)],
  term ((27 : Rat) / 2) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-27 : Rat) / 4) [(0, 1), (5, 1), (9, 1), (12, 2)],
  term ((-27 : Rat) / 4) [(0, 1), (5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem ep_Q2_064_partial_11_0008_valid :
    mulPoly ep_Q2_064_coefficient_11_0008
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0009 : Poly :=
[
  term ((135 : Rat) / 4) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 9 for generator 11. -/
def ep_Q2_064_partial_11_0009 : Poly :=
[
  term ((135 : Rat) / 2) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((135 : Rat) / 2) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-135 : Rat) / 4) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-135 : Rat) / 4) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem ep_Q2_064_partial_11_0009_valid :
    mulPoly ep_Q2_064_coefficient_11_0009
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0010 : Poly :=
[
  term ((243 : Rat) / 4) [(0, 1), (5, 2)]
]

/-- Partial product 10 for generator 11. -/
def ep_Q2_064_partial_11_0010 : Poly :=
[
  term ((243 : Rat) / 2) [(0, 1), (2, 1), (5, 2), (12, 1)],
  term ((243 : Rat) / 2) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((-243 : Rat) / 4) [(0, 1), (5, 2), (12, 2)],
  term ((-243 : Rat) / 4) [(0, 1), (5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem ep_Q2_064_partial_11_0010_valid :
    mulPoly ep_Q2_064_coefficient_11_0010
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0011 : Poly :=
[
  term ((-27 : Rat) / 4) [(1, 1), (3, 1)]
]

/-- Partial product 11 for generator 11. -/
def ep_Q2_064_partial_11_0011 : Poly :=
[
  term ((-27 : Rat) / 2) [(1, 1), (2, 1), (3, 1), (12, 1)],
  term ((27 : Rat) / 4) [(1, 1), (3, 1), (12, 2)],
  term ((27 : Rat) / 4) [(1, 1), (3, 1), (13, 2)],
  term ((-27 : Rat) / 2) [(1, 1), (3, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem ep_Q2_064_partial_11_0011_valid :
    mulPoly ep_Q2_064_coefficient_11_0011
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0012 : Poly :=
[
  term ((-243 : Rat) / 4) [(1, 1), (5, 1)]
]

/-- Partial product 12 for generator 11. -/
def ep_Q2_064_partial_11_0012 : Poly :=
[
  term ((-243 : Rat) / 2) [(1, 1), (2, 1), (5, 1), (12, 1)],
  term ((-243 : Rat) / 2) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((243 : Rat) / 4) [(1, 1), (5, 1), (12, 2)],
  term ((243 : Rat) / 4) [(1, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem ep_Q2_064_partial_11_0012_valid :
    mulPoly ep_Q2_064_coefficient_11_0012
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0013 : Poly :=
[
  term (108 : Rat) [(1, 1), (7, 1)]
]

/-- Partial product 13 for generator 11. -/
def ep_Q2_064_partial_11_0013 : Poly :=
[
  term (216 : Rat) [(1, 1), (2, 1), (7, 1), (12, 1)],
  term (216 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term (-108 : Rat) [(1, 1), (7, 1), (12, 2)],
  term (-108 : Rat) [(1, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem ep_Q2_064_partial_11_0013_valid :
    mulPoly ep_Q2_064_coefficient_11_0013
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0014 : Poly :=
[
  term ((-27 : Rat) / 4) [(1, 1), (9, 1)]
]

/-- Partial product 14 for generator 11. -/
def ep_Q2_064_partial_11_0014 : Poly :=
[
  term ((-27 : Rat) / 2) [(1, 1), (2, 1), (9, 1), (12, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((27 : Rat) / 4) [(1, 1), (9, 1), (12, 2)],
  term ((27 : Rat) / 4) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem ep_Q2_064_partial_11_0014_valid :
    mulPoly ep_Q2_064_coefficient_11_0014
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0015 : Poly :=
[
  term ((-45 : Rat) / 2) [(1, 1), (15, 1)]
]

/-- Partial product 15 for generator 11. -/
def ep_Q2_064_partial_11_0015 : Poly :=
[
  term (-45 : Rat) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term (-45 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 2) [(1, 1), (12, 2), (15, 1)],
  term ((45 : Rat) / 2) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem ep_Q2_064_partial_11_0015_valid :
    mulPoly ep_Q2_064_coefficient_11_0015
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0016 : Poly :=
[
  term ((9 : Rat) / 2) [(1, 2)]
]

/-- Partial product 16 for generator 11. -/
def ep_Q2_064_partial_11_0016 : Poly :=
[
  term (9 : Rat) [(1, 2), (2, 1), (12, 1)],
  term (9 : Rat) [(1, 2), (3, 1), (13, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (12, 2)],
  term ((-9 : Rat) / 2) [(1, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem ep_Q2_064_partial_11_0016_valid :
    mulPoly ep_Q2_064_coefficient_11_0016
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0017 : Poly :=
[
  term ((-1953 : Rat) / 2) [(3, 1), (5, 1)]
]

/-- Partial product 17 for generator 11. -/
def ep_Q2_064_partial_11_0017 : Poly :=
[
  term (-1953 : Rat) [(2, 1), (3, 1), (5, 1), (12, 1)],
  term ((1953 : Rat) / 2) [(3, 1), (5, 1), (12, 2)],
  term ((1953 : Rat) / 2) [(3, 1), (5, 1), (13, 2)],
  term (-1953 : Rat) [(3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem ep_Q2_064_partial_11_0017_valid :
    mulPoly ep_Q2_064_coefficient_11_0017
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0018 : Poly :=
[
  term ((-2841 : Rat) / 4) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 18 for generator 11. -/
def ep_Q2_064_partial_11_0018 : Poly :=
[
  term ((-2841 : Rat) / 2) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((2841 : Rat) / 4) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-2841 : Rat) / 2) [(3, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem ep_Q2_064_partial_11_0018_valid :
    mulPoly ep_Q2_064_coefficient_11_0018
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0019 : Poly :=
[
  term (2616 : Rat) [(3, 1), (7, 1)]
]

/-- Partial product 19 for generator 11. -/
def ep_Q2_064_partial_11_0019 : Poly :=
[
  term (5232 : Rat) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term (-2616 : Rat) [(3, 1), (7, 1), (12, 2)],
  term (-2616 : Rat) [(3, 1), (7, 1), (13, 2)],
  term (5232 : Rat) [(3, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem ep_Q2_064_partial_11_0019_valid :
    mulPoly ep_Q2_064_coefficient_11_0019
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0020 : Poly :=
[
  term ((-4405 : Rat) / 16) [(3, 1), (9, 1)]
]

/-- Partial product 20 for generator 11. -/
def ep_Q2_064_partial_11_0020 : Poly :=
[
  term ((-4405 : Rat) / 8) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((4405 : Rat) / 16) [(3, 1), (9, 1), (12, 2)],
  term ((4405 : Rat) / 16) [(3, 1), (9, 1), (13, 2)],
  term ((-4405 : Rat) / 8) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem ep_Q2_064_partial_11_0020_valid :
    mulPoly ep_Q2_064_coefficient_11_0020
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0021 : Poly :=
[
  term ((2865 : Rat) / 4) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 21 for generator 11. -/
def ep_Q2_064_partial_11_0021 : Poly :=
[
  term ((2865 : Rat) / 2) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(3, 1), (12, 3), (15, 1)],
  term ((2865 : Rat) / 2) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem ep_Q2_064_partial_11_0021_valid :
    mulPoly ep_Q2_064_coefficient_11_0021
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0022 : Poly :=
[
  term ((-1377 : Rat) / 8) [(3, 1), (13, 1)]
]

/-- Partial product 22 for generator 11. -/
def ep_Q2_064_partial_11_0022 : Poly :=
[
  term ((-1377 : Rat) / 4) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((1377 : Rat) / 8) [(3, 1), (12, 2), (13, 1)],
  term ((1377 : Rat) / 8) [(3, 1), (13, 3)],
  term ((-1377 : Rat) / 4) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem ep_Q2_064_partial_11_0022_valid :
    mulPoly ep_Q2_064_coefficient_11_0022
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0023 : Poly :=
[
  term ((-15781 : Rat) / 4) [(3, 1), (15, 1)]
]

/-- Partial product 23 for generator 11. -/
def ep_Q2_064_partial_11_0023 : Poly :=
[
  term ((-15781 : Rat) / 2) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((15781 : Rat) / 4) [(3, 1), (12, 2), (15, 1)],
  term ((15781 : Rat) / 4) [(3, 1), (13, 2), (15, 1)],
  term ((-15781 : Rat) / 2) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem ep_Q2_064_partial_11_0023_valid :
    mulPoly ep_Q2_064_coefficient_11_0023
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0024 : Poly :=
[
  term ((-2643 : Rat) / 16) [(3, 2)]
]

/-- Partial product 24 for generator 11. -/
def ep_Q2_064_partial_11_0024 : Poly :=
[
  term ((-2643 : Rat) / 8) [(2, 1), (3, 2), (12, 1)],
  term ((2643 : Rat) / 16) [(3, 2), (12, 2)],
  term ((2643 : Rat) / 16) [(3, 2), (13, 2)],
  term ((-2643 : Rat) / 8) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 11. -/
theorem ep_Q2_064_partial_11_0024_valid :
    mulPoly ep_Q2_064_coefficient_11_0024
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0025 : Poly :=
[
  term ((-25569 : Rat) / 4) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 25 for generator 11. -/
def ep_Q2_064_partial_11_0025 : Poly :=
[
  term ((-25569 : Rat) / 2) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-25569 : Rat) / 2) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((25569 : Rat) / 4) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((25569 : Rat) / 4) [(5, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 11. -/
theorem ep_Q2_064_partial_11_0025_valid :
    mulPoly ep_Q2_064_coefficient_11_0025
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0026 : Poly :=
[
  term ((-65439 : Rat) / 8) [(5, 1), (7, 1)]
]

/-- Partial product 26 for generator 11. -/
def ep_Q2_064_partial_11_0026 : Poly :=
[
  term ((-65439 : Rat) / 4) [(2, 1), (5, 1), (7, 1), (12, 1)],
  term ((-65439 : Rat) / 4) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((65439 : Rat) / 8) [(5, 1), (7, 1), (12, 2)],
  term ((65439 : Rat) / 8) [(5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 11. -/
theorem ep_Q2_064_partial_11_0026_valid :
    mulPoly ep_Q2_064_coefficient_11_0026
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0027 : Poly :=
[
  term ((-7695 : Rat) / 16) [(5, 1), (9, 1)]
]

/-- Partial product 27 for generator 11. -/
def ep_Q2_064_partial_11_0027 : Poly :=
[
  term ((-7695 : Rat) / 8) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term ((-7695 : Rat) / 8) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((7695 : Rat) / 16) [(5, 1), (9, 1), (12, 2)],
  term ((7695 : Rat) / 16) [(5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 11. -/
theorem ep_Q2_064_partial_11_0027_valid :
    mulPoly ep_Q2_064_coefficient_11_0027
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0028 : Poly :=
[
  term ((25785 : Rat) / 4) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 28 for generator 11. -/
def ep_Q2_064_partial_11_0028 : Poly :=
[
  term ((25785 : Rat) / 2) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((25785 : Rat) / 2) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-25785 : Rat) / 4) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-25785 : Rat) / 4) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 11. -/
theorem ep_Q2_064_partial_11_0028_valid :
    mulPoly ep_Q2_064_coefficient_11_0028
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0029 : Poly :=
[
  term ((-25311 : Rat) / 16) [(5, 1), (13, 1)]
]

/-- Partial product 29 for generator 11. -/
def ep_Q2_064_partial_11_0029 : Poly :=
[
  term ((-25311 : Rat) / 8) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-25311 : Rat) / 8) [(3, 1), (5, 1), (13, 2)],
  term ((25311 : Rat) / 16) [(5, 1), (12, 2), (13, 1)],
  term ((25311 : Rat) / 16) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 11. -/
theorem ep_Q2_064_partial_11_0029_valid :
    mulPoly ep_Q2_064_coefficient_11_0029
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0030 : Poly :=
[
  term ((18627 : Rat) / 8) [(5, 1), (15, 1)]
]

/-- Partial product 30 for generator 11. -/
def ep_Q2_064_partial_11_0030 : Poly :=
[
  term ((18627 : Rat) / 4) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((18627 : Rat) / 4) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-18627 : Rat) / 8) [(5, 1), (12, 2), (15, 1)],
  term ((-18627 : Rat) / 8) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 11. -/
theorem ep_Q2_064_partial_11_0030_valid :
    mulPoly ep_Q2_064_coefficient_11_0030
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0031 : Poly :=
[
  term ((73467 : Rat) / 16) [(5, 2)]
]

/-- Partial product 31 for generator 11. -/
def ep_Q2_064_partial_11_0031 : Poly :=
[
  term ((73467 : Rat) / 8) [(2, 1), (5, 2), (12, 1)],
  term ((73467 : Rat) / 8) [(3, 1), (5, 2), (13, 1)],
  term ((-73467 : Rat) / 16) [(5, 2), (12, 2)],
  term ((-73467 : Rat) / 16) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 11. -/
theorem ep_Q2_064_partial_11_0031_valid :
    mulPoly ep_Q2_064_coefficient_11_0031
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0032 : Poly :=
[
  term (11364 : Rat) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 32 for generator 11. -/
def ep_Q2_064_partial_11_0032 : Poly :=
[
  term (22728 : Rat) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term (22728 : Rat) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term (-11364 : Rat) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term (-11364 : Rat) [(6, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 11. -/
theorem ep_Q2_064_partial_11_0032_valid :
    mulPoly ep_Q2_064_coefficient_11_0032
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0033 : Poly :=
[
  term ((-2841 : Rat) / 4) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 33 for generator 11. -/
def ep_Q2_064_partial_11_0033 : Poly :=
[
  term ((-2841 : Rat) / 2) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((2841 : Rat) / 4) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 11. -/
theorem ep_Q2_064_partial_11_0033_valid :
    mulPoly ep_Q2_064_coefficient_11_0033
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0034 : Poly :=
[
  term ((-14205 : Rat) / 4) [(6, 1), (15, 2)]
]

/-- Partial product 34 for generator 11. -/
def ep_Q2_064_partial_11_0034 : Poly :=
[
  term ((-14205 : Rat) / 2) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-14205 : Rat) / 2) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((14205 : Rat) / 4) [(6, 1), (12, 2), (15, 2)],
  term ((14205 : Rat) / 4) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 11. -/
theorem ep_Q2_064_partial_11_0034_valid :
    mulPoly ep_Q2_064_coefficient_11_0034
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0035 : Poly :=
[
  term (1735 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 35 for generator 11. -/
def ep_Q2_064_partial_11_0035 : Poly :=
[
  term (3470 : Rat) [(2, 1), (7, 1), (9, 1), (12, 1)],
  term (3470 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term (-1735 : Rat) [(7, 1), (9, 1), (12, 2)],
  term (-1735 : Rat) [(7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 11. -/
theorem ep_Q2_064_partial_11_0035_valid :
    mulPoly ep_Q2_064_coefficient_11_0035
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0036 : Poly :=
[
  term ((27 : Rat) / 2) [(7, 1), (11, 1)]
]

/-- Partial product 36 for generator 11. -/
def ep_Q2_064_partial_11_0036 : Poly :=
[
  term (27 : Rat) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term (27 : Rat) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (11, 1), (12, 2)],
  term ((-27 : Rat) / 2) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 11. -/
theorem ep_Q2_064_partial_11_0036_valid :
    mulPoly ep_Q2_064_coefficient_11_0036
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0037 : Poly :=
[
  term (-11460 : Rat) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 37 for generator 11. -/
def ep_Q2_064_partial_11_0037 : Poly :=
[
  term (-22920 : Rat) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term (-22920 : Rat) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term (11460 : Rat) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term (11460 : Rat) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 11. -/
theorem ep_Q2_064_partial_11_0037_valid :
    mulPoly ep_Q2_064_coefficient_11_0037
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0038 : Poly :=
[
  term ((15819 : Rat) / 8) [(7, 1), (13, 1)]
]

/-- Partial product 38 for generator 11. -/
def ep_Q2_064_partial_11_0038 : Poly :=
[
  term ((15819 : Rat) / 4) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((15819 : Rat) / 4) [(3, 1), (7, 1), (13, 2)],
  term ((-15819 : Rat) / 8) [(7, 1), (12, 2), (13, 1)],
  term ((-15819 : Rat) / 8) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 11. -/
theorem ep_Q2_064_partial_11_0038_valid :
    mulPoly ep_Q2_064_coefficient_11_0038
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0039 : Poly :=
[
  term ((17137 : Rat) / 4) [(7, 1), (15, 1)]
]

/-- Partial product 39 for generator 11. -/
def ep_Q2_064_partial_11_0039 : Poly :=
[
  term ((17137 : Rat) / 2) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((17137 : Rat) / 2) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-17137 : Rat) / 4) [(7, 1), (12, 2), (15, 1)],
  term ((-17137 : Rat) / 4) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 11. -/
theorem ep_Q2_064_partial_11_0039_valid :
    mulPoly ep_Q2_064_coefficient_11_0039
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0040 : Poly :=
[
  term (432 : Rat) [(7, 2)]
]

/-- Partial product 40 for generator 11. -/
def ep_Q2_064_partial_11_0040 : Poly :=
[
  term (864 : Rat) [(2, 1), (7, 2), (12, 1)],
  term (864 : Rat) [(3, 1), (7, 2), (13, 1)],
  term (-432 : Rat) [(7, 2), (12, 2)],
  term (-432 : Rat) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 11. -/
theorem ep_Q2_064_partial_11_0040_valid :
    mulPoly ep_Q2_064_coefficient_11_0040
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0041 : Poly :=
[
  term ((2865 : Rat) / 4) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 41 for generator 11. -/
def ep_Q2_064_partial_11_0041 : Poly :=
[
  term ((2865 : Rat) / 2) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((2865 : Rat) / 2) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 11. -/
theorem ep_Q2_064_partial_11_0041_valid :
    mulPoly ep_Q2_064_coefficient_11_0041
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0042 : Poly :=
[
  term ((-1377 : Rat) / 8) [(9, 1), (13, 1)]
]

/-- Partial product 42 for generator 11. -/
def ep_Q2_064_partial_11_0042 : Poly :=
[
  term ((-1377 : Rat) / 4) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1377 : Rat) / 4) [(3, 1), (9, 1), (13, 2)],
  term ((1377 : Rat) / 8) [(9, 1), (12, 2), (13, 1)],
  term ((1377 : Rat) / 8) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 11. -/
theorem ep_Q2_064_partial_11_0042_valid :
    mulPoly ep_Q2_064_coefficient_11_0042
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0043 : Poly :=
[
  term ((10041 : Rat) / 16) [(9, 1), (15, 1)]
]

/-- Partial product 43 for generator 11. -/
def ep_Q2_064_partial_11_0043 : Poly :=
[
  term ((10041 : Rat) / 8) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((10041 : Rat) / 8) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-10041 : Rat) / 16) [(9, 1), (12, 2), (15, 1)],
  term ((-10041 : Rat) / 16) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 11. -/
theorem ep_Q2_064_partial_11_0043_valid :
    mulPoly ep_Q2_064_coefficient_11_0043
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0044 : Poly :=
[
  term ((-881 : Rat) / 8) [(9, 2)]
]

/-- Partial product 44 for generator 11. -/
def ep_Q2_064_partial_11_0044 : Poly :=
[
  term ((-881 : Rat) / 4) [(2, 1), (9, 2), (12, 1)],
  term ((-881 : Rat) / 4) [(3, 1), (9, 2), (13, 1)],
  term ((881 : Rat) / 8) [(9, 2), (12, 2)],
  term ((881 : Rat) / 8) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 11. -/
theorem ep_Q2_064_partial_11_0044_valid :
    mulPoly ep_Q2_064_coefficient_11_0044
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0045 : Poly :=
[
  term ((14325 : Rat) / 4) [(12, 1), (15, 2)]
]

/-- Partial product 45 for generator 11. -/
def ep_Q2_064_partial_11_0045 : Poly :=
[
  term ((14325 : Rat) / 2) [(2, 1), (12, 2), (15, 2)],
  term ((14325 : Rat) / 2) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-14325 : Rat) / 4) [(12, 1), (13, 2), (15, 2)],
  term ((-14325 : Rat) / 4) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 11. -/
theorem ep_Q2_064_partial_11_0045_valid :
    mulPoly ep_Q2_064_coefficient_11_0045
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0046 : Poly :=
[
  term ((-1107 : Rat) / 16) [(13, 1), (15, 1)]
]

/-- Partial product 46 for generator 11. -/
def ep_Q2_064_partial_11_0046 : Poly :=
[
  term ((-1107 : Rat) / 8) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1107 : Rat) / 8) [(3, 1), (13, 2), (15, 1)],
  term ((1107 : Rat) / 16) [(12, 2), (13, 1), (15, 1)],
  term ((1107 : Rat) / 16) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 11. -/
theorem ep_Q2_064_partial_11_0046_valid :
    mulPoly ep_Q2_064_coefficient_11_0046
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 11. -/
def ep_Q2_064_coefficient_11_0047 : Poly :=
[
  term ((44047 : Rat) / 16) [(15, 2)]
]

/-- Partial product 47 for generator 11. -/
def ep_Q2_064_partial_11_0047 : Poly :=
[
  term ((44047 : Rat) / 8) [(2, 1), (12, 1), (15, 2)],
  term ((44047 : Rat) / 8) [(3, 1), (13, 1), (15, 2)],
  term ((-44047 : Rat) / 16) [(12, 2), (15, 2)],
  term ((-44047 : Rat) / 16) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 11. -/
theorem ep_Q2_064_partial_11_0047_valid :
    mulPoly ep_Q2_064_coefficient_11_0047
        ep_Q2_064_generator_11_0000_0047 =
      ep_Q2_064_partial_11_0047 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_11_0000_0047 : List Poly :=
[
  ep_Q2_064_partial_11_0000,
  ep_Q2_064_partial_11_0001,
  ep_Q2_064_partial_11_0002,
  ep_Q2_064_partial_11_0003,
  ep_Q2_064_partial_11_0004,
  ep_Q2_064_partial_11_0005,
  ep_Q2_064_partial_11_0006,
  ep_Q2_064_partial_11_0007,
  ep_Q2_064_partial_11_0008,
  ep_Q2_064_partial_11_0009,
  ep_Q2_064_partial_11_0010,
  ep_Q2_064_partial_11_0011,
  ep_Q2_064_partial_11_0012,
  ep_Q2_064_partial_11_0013,
  ep_Q2_064_partial_11_0014,
  ep_Q2_064_partial_11_0015,
  ep_Q2_064_partial_11_0016,
  ep_Q2_064_partial_11_0017,
  ep_Q2_064_partial_11_0018,
  ep_Q2_064_partial_11_0019,
  ep_Q2_064_partial_11_0020,
  ep_Q2_064_partial_11_0021,
  ep_Q2_064_partial_11_0022,
  ep_Q2_064_partial_11_0023,
  ep_Q2_064_partial_11_0024,
  ep_Q2_064_partial_11_0025,
  ep_Q2_064_partial_11_0026,
  ep_Q2_064_partial_11_0027,
  ep_Q2_064_partial_11_0028,
  ep_Q2_064_partial_11_0029,
  ep_Q2_064_partial_11_0030,
  ep_Q2_064_partial_11_0031,
  ep_Q2_064_partial_11_0032,
  ep_Q2_064_partial_11_0033,
  ep_Q2_064_partial_11_0034,
  ep_Q2_064_partial_11_0035,
  ep_Q2_064_partial_11_0036,
  ep_Q2_064_partial_11_0037,
  ep_Q2_064_partial_11_0038,
  ep_Q2_064_partial_11_0039,
  ep_Q2_064_partial_11_0040,
  ep_Q2_064_partial_11_0041,
  ep_Q2_064_partial_11_0042,
  ep_Q2_064_partial_11_0043,
  ep_Q2_064_partial_11_0044,
  ep_Q2_064_partial_11_0045,
  ep_Q2_064_partial_11_0046,
  ep_Q2_064_partial_11_0047
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_11_0000_0047 : Poly :=
[
  term (-9 : Rat) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1)],
  term (-81 : Rat) [(0, 1), (1, 1), (2, 1), (5, 1), (12, 1)],
  term (144 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term (-9 : Rat) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1)],
  term (-45 : Rat) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term (-81 : Rat) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1)],
  term (144 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term (-9 : Rat) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (3, 1), (12, 2)],
  term (-45 : Rat) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term (-9 : Rat) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((81 : Rat) / 2) [(0, 1), (1, 1), (5, 1), (12, 2)],
  term ((81 : Rat) / 2) [(0, 1), (1, 1), (5, 1), (13, 2)],
  term (-72 : Rat) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term (-72 : Rat) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((45 : Rat) / 2) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((45 : Rat) / 2) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((27 : Rat) / 2) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1)],
  term (-216 : Rat) [(0, 1), (2, 1), (5, 1), (7, 1), (12, 1)],
  term ((27 : Rat) / 2) [(0, 1), (2, 1), (5, 1), (9, 1), (12, 1)],
  term ((135 : Rat) / 2) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((243 : Rat) / 2) [(0, 1), (2, 1), (5, 2), (12, 1)],
  term (-216 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((27 : Rat) / 2) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-27 : Rat) / 4) [(0, 1), (3, 1), (5, 1), (12, 2)],
  term ((135 : Rat) / 2) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-27 : Rat) / 4) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((243 : Rat) / 2) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((27 : Rat) / 2) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term (108 : Rat) [(0, 1), (5, 1), (7, 1), (12, 2)],
  term (108 : Rat) [(0, 1), (5, 1), (7, 1), (13, 2)],
  term ((-27 : Rat) / 4) [(0, 1), (5, 1), (9, 1), (12, 2)],
  term ((-27 : Rat) / 4) [(0, 1), (5, 1), (9, 1), (13, 2)],
  term ((-135 : Rat) / 4) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-135 : Rat) / 4) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-243 : Rat) / 4) [(0, 1), (5, 2), (12, 2)],
  term ((-243 : Rat) / 4) [(0, 1), (5, 2), (13, 2)],
  term ((-27 : Rat) / 2) [(1, 1), (2, 1), (3, 1), (12, 1)],
  term ((-243 : Rat) / 2) [(1, 1), (2, 1), (5, 1), (12, 1)],
  term (216 : Rat) [(1, 1), (2, 1), (7, 1), (12, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (2, 1), (9, 1), (12, 1)],
  term (-45 : Rat) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-243 : Rat) / 2) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term (216 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((27 : Rat) / 4) [(1, 1), (3, 1), (12, 2)],
  term (-45 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((27 : Rat) / 4) [(1, 1), (3, 1), (13, 2)],
  term ((-27 : Rat) / 2) [(1, 1), (3, 2), (13, 1)],
  term ((243 : Rat) / 4) [(1, 1), (5, 1), (12, 2)],
  term ((243 : Rat) / 4) [(1, 1), (5, 1), (13, 2)],
  term (-108 : Rat) [(1, 1), (7, 1), (12, 2)],
  term (-108 : Rat) [(1, 1), (7, 1), (13, 2)],
  term ((27 : Rat) / 4) [(1, 1), (9, 1), (12, 2)],
  term ((27 : Rat) / 4) [(1, 1), (9, 1), (13, 2)],
  term ((45 : Rat) / 2) [(1, 1), (12, 2), (15, 1)],
  term ((45 : Rat) / 2) [(1, 1), (13, 2), (15, 1)],
  term (9 : Rat) [(1, 2), (2, 1), (12, 1)],
  term (9 : Rat) [(1, 2), (3, 1), (13, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (12, 2)],
  term ((-9 : Rat) / 2) [(1, 2), (13, 2)],
  term (-1953 : Rat) [(2, 1), (3, 1), (5, 1), (12, 1)],
  term ((-2841 : Rat) / 2) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term (5232 : Rat) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-4405 : Rat) / 8) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-1377 : Rat) / 4) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((-15781 : Rat) / 2) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-2643 : Rat) / 8) [(2, 1), (3, 2), (12, 1)],
  term ((-25569 : Rat) / 2) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-65439 : Rat) / 4) [(2, 1), (5, 1), (7, 1), (12, 1)],
  term ((-7695 : Rat) / 8) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term ((-25311 : Rat) / 8) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((18627 : Rat) / 4) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((25785 : Rat) / 2) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((73467 : Rat) / 8) [(2, 1), (5, 2), (12, 1)],
  term (22728 : Rat) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-14205 : Rat) / 2) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term (3470 : Rat) [(2, 1), (7, 1), (9, 1), (12, 1)],
  term (27 : Rat) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((15819 : Rat) / 4) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((17137 : Rat) / 2) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term (-22920 : Rat) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term (864 : Rat) [(2, 1), (7, 2), (12, 1)],
  term ((-1377 : Rat) / 4) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((10041 : Rat) / 8) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-881 : Rat) / 4) [(2, 1), (9, 2), (12, 1)],
  term ((-3861 : Rat) / 16) [(2, 1), (12, 1)],
  term ((-1107 : Rat) / 8) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((44047 : Rat) / 8) [(2, 1), (12, 1), (15, 2)],
  term ((14325 : Rat) / 2) [(2, 1), (12, 2), (15, 2)],
  term ((-25569 : Rat) / 2) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-65439 : Rat) / 4) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-7695 : Rat) / 8) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((25785 : Rat) / 2) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((1953 : Rat) / 2) [(3, 1), (5, 1), (12, 2)],
  term ((18627 : Rat) / 4) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-17499 : Rat) / 8) [(3, 1), (5, 1), (13, 2)],
  term ((73467 : Rat) / 8) [(3, 1), (5, 2), (13, 1)],
  term (22728 : Rat) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 4) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-14205 : Rat) / 2) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((2841 : Rat) / 4) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term (3470 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term (27 : Rat) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term (-22920 : Rat) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term (-2616 : Rat) [(3, 1), (7, 1), (12, 2)],
  term ((17137 : Rat) / 2) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((5355 : Rat) / 4) [(3, 1), (7, 1), (13, 2)],
  term (864 : Rat) [(3, 1), (7, 2), (13, 1)],
  term ((2865 : Rat) / 2) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4405 : Rat) / 16) [(3, 1), (9, 1), (12, 2)],
  term ((10041 : Rat) / 8) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1103 : Rat) / 16) [(3, 1), (9, 1), (13, 2)],
  term ((-881 : Rat) / 4) [(3, 1), (9, 2), (13, 1)],
  term ((14325 : Rat) / 2) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2865 : Rat) / 4) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((1377 : Rat) / 8) [(3, 1), (12, 2), (13, 1)],
  term ((15781 : Rat) / 4) [(3, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(3, 1), (12, 3), (15, 1)],
  term ((-3861 : Rat) / 16) [(3, 1), (13, 1)],
  term ((44047 : Rat) / 8) [(3, 1), (13, 1), (15, 2)],
  term ((30455 : Rat) / 8) [(3, 1), (13, 2), (15, 1)],
  term ((1377 : Rat) / 8) [(3, 1), (13, 3)],
  term (-1953 : Rat) [(3, 2), (5, 1), (13, 1)],
  term ((-2841 : Rat) / 2) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term (5232 : Rat) [(3, 2), (7, 1), (13, 1)],
  term ((-4405 : Rat) / 8) [(3, 2), (9, 1), (13, 1)],
  term ((2865 : Rat) / 2) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((2643 : Rat) / 16) [(3, 2), (12, 2)],
  term ((-15781 : Rat) / 2) [(3, 2), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 16) [(3, 2), (13, 2)],
  term ((-2643 : Rat) / 8) [(3, 3), (13, 1)],
  term ((25569 : Rat) / 4) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((25569 : Rat) / 4) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((65439 : Rat) / 8) [(5, 1), (7, 1), (12, 2)],
  term ((65439 : Rat) / 8) [(5, 1), (7, 1), (13, 2)],
  term ((7695 : Rat) / 16) [(5, 1), (9, 1), (12, 2)],
  term ((7695 : Rat) / 16) [(5, 1), (9, 1), (13, 2)],
  term ((-25785 : Rat) / 4) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((25311 : Rat) / 16) [(5, 1), (12, 2), (13, 1)],
  term ((-18627 : Rat) / 8) [(5, 1), (12, 2), (15, 1)],
  term ((-25785 : Rat) / 4) [(5, 1), (12, 3), (15, 1)],
  term ((-18627 : Rat) / 8) [(5, 1), (13, 2), (15, 1)],
  term ((25311 : Rat) / 16) [(5, 1), (13, 3)],
  term ((-73467 : Rat) / 16) [(5, 2), (12, 2)],
  term ((-73467 : Rat) / 16) [(5, 2), (13, 2)],
  term (-11364 : Rat) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term (-11364 : Rat) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((2841 : Rat) / 4) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((2841 : Rat) / 4) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((14205 : Rat) / 4) [(6, 1), (12, 2), (15, 2)],
  term ((14205 : Rat) / 4) [(6, 1), (13, 2), (15, 2)],
  term (-1735 : Rat) [(7, 1), (9, 1), (12, 2)],
  term (-1735 : Rat) [(7, 1), (9, 1), (13, 2)],
  term ((-27 : Rat) / 2) [(7, 1), (11, 1), (12, 2)],
  term ((-27 : Rat) / 2) [(7, 1), (11, 1), (13, 2)],
  term (11460 : Rat) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-15819 : Rat) / 8) [(7, 1), (12, 2), (13, 1)],
  term ((-17137 : Rat) / 4) [(7, 1), (12, 2), (15, 1)],
  term (11460 : Rat) [(7, 1), (12, 3), (15, 1)],
  term ((-17137 : Rat) / 4) [(7, 1), (13, 2), (15, 1)],
  term ((-15819 : Rat) / 8) [(7, 1), (13, 3)],
  term (-432 : Rat) [(7, 2), (12, 2)],
  term (-432 : Rat) [(7, 2), (13, 2)],
  term ((-2865 : Rat) / 4) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((1377 : Rat) / 8) [(9, 1), (12, 2), (13, 1)],
  term ((-10041 : Rat) / 16) [(9, 1), (12, 2), (15, 1)],
  term ((-2865 : Rat) / 4) [(9, 1), (12, 3), (15, 1)],
  term ((-10041 : Rat) / 16) [(9, 1), (13, 2), (15, 1)],
  term ((1377 : Rat) / 8) [(9, 1), (13, 3)],
  term ((881 : Rat) / 8) [(9, 2), (12, 2)],
  term ((881 : Rat) / 8) [(9, 2), (13, 2)],
  term ((-14325 : Rat) / 4) [(12, 1), (13, 2), (15, 2)],
  term ((3861 : Rat) / 32) [(12, 2)],
  term ((1107 : Rat) / 16) [(12, 2), (13, 1), (15, 1)],
  term ((-44047 : Rat) / 16) [(12, 2), (15, 2)],
  term ((-14325 : Rat) / 4) [(12, 3), (15, 2)],
  term ((3861 : Rat) / 32) [(13, 2)],
  term ((-44047 : Rat) / 16) [(13, 2), (15, 2)],
  term ((1107 : Rat) / 16) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 47. -/
theorem ep_Q2_064_block_11_0000_0047_valid :
    checkProductSumEq ep_Q2_064_partials_11_0000_0047
      ep_Q2_064_block_11_0000_0047 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
