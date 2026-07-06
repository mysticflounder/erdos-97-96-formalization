/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 7:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 7 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_07_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0000 : Poly :=
[
  term ((160 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def ep_Q1_028_partial_07_0000 : Poly :=
[
  term ((-320 : Rat) / 3) [(0, 1), (3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((160 : Rat) / 3) [(0, 2), (3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((160 : Rat) / 3) [(1, 2), (3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((320 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-160 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-160 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem ep_Q1_028_partial_07_0000_valid :
    mulPoly ep_Q1_028_coefficient_07_0000
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0001 : Poly :=
[
  term ((32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def ep_Q1_028_partial_07_0001 : Poly :=
[
  term ((-64 : Rat) / 15) [(0, 1), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 15) [(0, 2), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 2), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((64 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem ep_Q1_028_partial_07_0001_valid :
    mulPoly ep_Q1_028_coefficient_07_0001
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0002 : Poly :=
[
  term ((32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def ep_Q1_028_partial_07_0002 : Poly :=
[
  term ((-64 : Rat) / 15) [(0, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 15) [(0, 2), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 2), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem ep_Q1_028_partial_07_0002_valid :
    mulPoly ep_Q1_028_coefficient_07_0002
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0003 : Poly :=
[
  term ((-448 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def ep_Q1_028_partial_07_0003 : Poly :=
[
  term ((896 : Rat) / 15) [(0, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(0, 2), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(1, 2), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem ep_Q1_028_partial_07_0003_valid :
    mulPoly ep_Q1_028_coefficient_07_0003
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0004 : Poly :=
[
  term ((-5344 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def ep_Q1_028_partial_07_0004 : Poly :=
[
  term ((10688 : Rat) / 45) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-5344 : Rat) / 45) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-5344 : Rat) / 45) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-10688 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((5344 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((5344 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem ep_Q1_028_partial_07_0004_valid :
    mulPoly ep_Q1_028_coefficient_07_0004
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0005 : Poly :=
[
  term ((8272 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def ep_Q1_028_partial_07_0005 : Poly :=
[
  term ((-16544 : Rat) / 45) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((8272 : Rat) / 45) [(0, 2), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((8272 : Rat) / 45) [(1, 2), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((16544 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8272 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-8272 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem ep_Q1_028_partial_07_0005_valid :
    mulPoly ep_Q1_028_coefficient_07_0005
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0006 : Poly :=
[
  term (160 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def ep_Q1_028_partial_07_0006 : Poly :=
[
  term (-320 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term (160 : Rat) [(0, 2), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term (160 : Rat) [(1, 2), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term (320 : Rat) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term (-160 : Rat) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term (-160 : Rat) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem ep_Q1_028_partial_07_0006_valid :
    mulPoly ep_Q1_028_coefficient_07_0006
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0007 : Poly :=
[
  term ((3376 : Rat) / 9) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def ep_Q1_028_partial_07_0007 : Poly :=
[
  term ((-6752 : Rat) / 9) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((3376 : Rat) / 9) [(0, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((3376 : Rat) / 9) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((6752 : Rat) / 9) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3376 : Rat) / 9) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3376 : Rat) / 9) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem ep_Q1_028_partial_07_0007_valid :
    mulPoly ep_Q1_028_coefficient_07_0007
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0008 : Poly :=
[
  term ((448 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 7. -/
def ep_Q1_028_partial_07_0008 : Poly :=
[
  term ((-896 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem ep_Q1_028_partial_07_0008_valid :
    mulPoly ep_Q1_028_coefficient_07_0008
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0009 : Poly :=
[
  term ((560 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def ep_Q1_028_partial_07_0009 : Poly :=
[
  term ((-1120 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((560 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((560 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((-560 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (12, 2), (16, 1)],
  term ((-560 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem ep_Q1_028_partial_07_0009_valid :
    mulPoly ep_Q1_028_coefficient_07_0009
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0010 : Poly :=
[
  term ((-3136 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (9, 1), (16, 1)]
]

/-- Partial product 10 for generator 7. -/
def ep_Q1_028_partial_07_0010 : Poly :=
[
  term ((6272 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-6272 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (9, 1), (12, 2), (16, 1)],
  term ((3136 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem ep_Q1_028_partial_07_0010_valid :
    mulPoly ep_Q1_028_coefficient_07_0010
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0011 : Poly :=
[
  term ((1120 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 7. -/
def ep_Q1_028_partial_07_0011 : Poly :=
[
  term ((-2240 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (12, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem ep_Q1_028_partial_07_0011_valid :
    mulPoly ep_Q1_028_coefficient_07_0011
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0012 : Poly :=
[
  term (448 : Rat) [(3, 1), (5, 2), (7, 2), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 7. -/
def ep_Q1_028_partial_07_0012 : Poly :=
[
  term (-896 : Rat) [(0, 1), (3, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term (448 : Rat) [(0, 2), (3, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term (448 : Rat) [(1, 2), (3, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term (896 : Rat) [(3, 1), (5, 2), (7, 2), (12, 1), (13, 1), (16, 1)],
  term (-448 : Rat) [(3, 1), (5, 2), (7, 2), (12, 2), (13, 1), (16, 1)],
  term (-448 : Rat) [(3, 1), (5, 2), (7, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem ep_Q1_028_partial_07_0012_valid :
    mulPoly ep_Q1_028_coefficient_07_0012
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0013 : Poly :=
[
  term ((2912 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 7. -/
def ep_Q1_028_partial_07_0013 : Poly :=
[
  term ((-5824 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((2912 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((2912 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((5824 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2912 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-2912 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem ep_Q1_028_partial_07_0013_valid :
    mulPoly ep_Q1_028_coefficient_07_0013
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0014 : Poly :=
[
  term ((-224 : Rat) / 15) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 7. -/
def ep_Q1_028_partial_07_0014 : Poly :=
[
  term ((448 : Rat) / 15) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 15) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 15) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 15) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((224 : Rat) / 15) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem ep_Q1_028_partial_07_0014_valid :
    mulPoly ep_Q1_028_coefficient_07_0014
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0015 : Poly :=
[
  term ((248 : Rat) / 15) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 7. -/
def ep_Q1_028_partial_07_0015 : Poly :=
[
  term ((-496 : Rat) / 15) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 15) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 15) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((496 : Rat) / 15) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-248 : Rat) / 15) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-248 : Rat) / 15) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem ep_Q1_028_partial_07_0015_valid :
    mulPoly ep_Q1_028_coefficient_07_0015
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0016 : Poly :=
[
  term ((32 : Rat) / 5) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 7. -/
def ep_Q1_028_partial_07_0016 : Poly :=
[
  term ((-64 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem ep_Q1_028_partial_07_0016_valid :
    mulPoly ep_Q1_028_coefficient_07_0016
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0017 : Poly :=
[
  term ((208 : Rat) / 15) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 7. -/
def ep_Q1_028_partial_07_0017 : Poly :=
[
  term ((-416 : Rat) / 15) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 15) [(0, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 15) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((416 : Rat) / 15) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-208 : Rat) / 15) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-208 : Rat) / 15) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 7. -/
theorem ep_Q1_028_partial_07_0017_valid :
    mulPoly ep_Q1_028_coefficient_07_0017
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0018 : Poly :=
[
  term ((-134 : Rat) / 5) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 18 for generator 7. -/
def ep_Q1_028_partial_07_0018 : Poly :=
[
  term ((268 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term ((-134 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-134 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-268 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((134 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((134 : Rat) / 5) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 7. -/
theorem ep_Q1_028_partial_07_0018_valid :
    mulPoly ep_Q1_028_coefficient_07_0018
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0019 : Poly :=
[
  term ((2464 : Rat) / 15) [(3, 1), (7, 2), (9, 1), (16, 1)]
]

/-- Partial product 19 for generator 7. -/
def ep_Q1_028_partial_07_0019 : Poly :=
[
  term ((-4928 : Rat) / 15) [(0, 1), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(0, 2), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(1, 2), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((4928 : Rat) / 15) [(3, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((-2464 : Rat) / 15) [(3, 1), (7, 2), (9, 1), (12, 2), (16, 1)],
  term ((-2464 : Rat) / 15) [(3, 1), (7, 2), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 7. -/
theorem ep_Q1_028_partial_07_0019_valid :
    mulPoly ep_Q1_028_coefficient_07_0019
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0020 : Poly :=
[
  term ((-176 : Rat) / 3) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 7. -/
def ep_Q1_028_partial_07_0020 : Poly :=
[
  term ((352 : Rat) / 3) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(0, 2), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(1, 2), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(3, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((176 : Rat) / 3) [(3, 1), (7, 2), (11, 1), (12, 2), (16, 1)],
  term ((176 : Rat) / 3) [(3, 1), (7, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 7. -/
theorem ep_Q1_028_partial_07_0020_valid :
    mulPoly ep_Q1_028_coefficient_07_0020
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0021 : Poly :=
[
  term ((-352 : Rat) / 5) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 7. -/
def ep_Q1_028_partial_07_0021 : Poly :=
[
  term ((704 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-352 : Rat) / 5) [(0, 2), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-352 : Rat) / 5) [(1, 2), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-704 : Rat) / 5) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((352 : Rat) / 5) [(3, 1), (7, 2), (12, 2), (13, 1), (16, 1)],
  term ((352 : Rat) / 5) [(3, 1), (7, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 7. -/
theorem ep_Q1_028_partial_07_0021_valid :
    mulPoly ep_Q1_028_coefficient_07_0021
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0022 : Poly :=
[
  term ((-2288 : Rat) / 15) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 7. -/
def ep_Q1_028_partial_07_0022 : Poly :=
[
  term ((4576 : Rat) / 15) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2288 : Rat) / 15) [(0, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2288 : Rat) / 15) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4576 : Rat) / 15) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((2288 : Rat) / 15) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((2288 : Rat) / 15) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 7. -/
theorem ep_Q1_028_partial_07_0022_valid :
    mulPoly ep_Q1_028_coefficient_07_0022
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0023 : Poly :=
[
  term (4 : Rat) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 23 for generator 7. -/
def ep_Q1_028_partial_07_0023 : Poly :=
[
  term (-8 : Rat) [(0, 1), (3, 1), (9, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term (-4 : Rat) [(3, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 7. -/
theorem ep_Q1_028_partial_07_0023_valid :
    mulPoly ep_Q1_028_coefficient_07_0023
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0024 : Poly :=
[
  term (3 : Rat) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 7. -/
def ep_Q1_028_partial_07_0024 : Poly :=
[
  term (-6 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 7. -/
theorem ep_Q1_028_partial_07_0024_valid :
    mulPoly ep_Q1_028_coefficient_07_0024
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0025 : Poly :=
[
  term (7 : Rat) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 7. -/
def ep_Q1_028_partial_07_0025 : Poly :=
[
  term (-14 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term (-7 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 7. -/
theorem ep_Q1_028_partial_07_0025_valid :
    mulPoly ep_Q1_028_coefficient_07_0025
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0026 : Poly :=
[
  term ((3136 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 7. -/
def ep_Q1_028_partial_07_0026 : Poly :=
[
  term ((-6272 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((3136 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((3136 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((6272 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3136 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3136 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 7. -/
theorem ep_Q1_028_partial_07_0026_valid :
    mulPoly ep_Q1_028_coefficient_07_0026
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0027 : Poly :=
[
  term ((-64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 27 for generator 7. -/
def ep_Q1_028_partial_07_0027 : Poly :=
[
  term ((128 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 7. -/
theorem ep_Q1_028_partial_07_0027_valid :
    mulPoly ep_Q1_028_coefficient_07_0027
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0028 : Poly :=
[
  term ((-1504 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 7. -/
def ep_Q1_028_partial_07_0028 : Poly :=
[
  term ((3008 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1504 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1504 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3008 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1504 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1504 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 7. -/
theorem ep_Q1_028_partial_07_0028_valid :
    mulPoly ep_Q1_028_coefficient_07_0028
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0029 : Poly :=
[
  term ((-320 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 29 for generator 7. -/
def ep_Q1_028_partial_07_0029 : Poly :=
[
  term ((640 : Rat) / 3) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-320 : Rat) / 3) [(0, 2), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-320 : Rat) / 3) [(1, 2), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-640 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((320 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((320 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 7. -/
theorem ep_Q1_028_partial_07_0029_valid :
    mulPoly ep_Q1_028_coefficient_07_0029
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0030 : Poly :=
[
  term ((128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 7. -/
def ep_Q1_028_partial_07_0030 : Poly :=
[
  term ((-256 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((128 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((128 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 7. -/
theorem ep_Q1_028_partial_07_0030_valid :
    mulPoly ep_Q1_028_coefficient_07_0030
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0031 : Poly :=
[
  term ((-32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 7. -/
def ep_Q1_028_partial_07_0031 : Poly :=
[
  term ((64 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 7. -/
theorem ep_Q1_028_partial_07_0031_valid :
    mulPoly ep_Q1_028_coefficient_07_0031
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0032 : Poly :=
[
  term ((128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 32 for generator 7. -/
def ep_Q1_028_partial_07_0032 : Poly :=
[
  term ((-256 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((128 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((128 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 7. -/
theorem ep_Q1_028_partial_07_0032_valid :
    mulPoly ep_Q1_028_coefficient_07_0032
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0033 : Poly :=
[
  term ((-32 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 7. -/
def ep_Q1_028_partial_07_0033 : Poly :=
[
  term ((64 : Rat) / 5) [(0, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(0, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(1, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 7. -/
theorem ep_Q1_028_partial_07_0033_valid :
    mulPoly ep_Q1_028_coefficient_07_0033
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0034 : Poly :=
[
  term ((128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 34 for generator 7. -/
def ep_Q1_028_partial_07_0034 : Poly :=
[
  term ((-256 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 7. -/
theorem ep_Q1_028_partial_07_0034_valid :
    mulPoly ep_Q1_028_coefficient_07_0034
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0035 : Poly :=
[
  term ((-64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 35 for generator 7. -/
def ep_Q1_028_partial_07_0035 : Poly :=
[
  term ((128 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (14, 2), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 7. -/
theorem ep_Q1_028_partial_07_0035_valid :
    mulPoly ep_Q1_028_coefficient_07_0035
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0036 : Poly :=
[
  term ((352 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 7. -/
def ep_Q1_028_partial_07_0036 : Poly :=
[
  term ((-704 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((352 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((352 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((704 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 7. -/
theorem ep_Q1_028_partial_07_0036_valid :
    mulPoly ep_Q1_028_coefficient_07_0036
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0037 : Poly :=
[
  term ((-32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 37 for generator 7. -/
def ep_Q1_028_partial_07_0037 : Poly :=
[
  term ((64 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 7. -/
theorem ep_Q1_028_partial_07_0037_valid :
    mulPoly ep_Q1_028_coefficient_07_0037
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0038 : Poly :=
[
  term (8 : Rat) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 38 for generator 7. -/
def ep_Q1_028_partial_07_0038 : Poly :=
[
  term (-16 : Rat) [(0, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (4, 1), (7, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (4, 1), (7, 1), (9, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term (-8 : Rat) [(4, 1), (7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 7. -/
theorem ep_Q1_028_partial_07_0038_valid :
    mulPoly ep_Q1_028_coefficient_07_0038
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0039 : Poly :=
[
  term (-16 : Rat) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 39 for generator 7. -/
def ep_Q1_028_partial_07_0039 : Poly :=
[
  term (32 : Rat) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term (-32 : Rat) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term (16 : Rat) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 7. -/
theorem ep_Q1_028_partial_07_0039_valid :
    mulPoly ep_Q1_028_coefficient_07_0039
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0040 : Poly :=
[
  term (44 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 7. -/
def ep_Q1_028_partial_07_0040 : Poly :=
[
  term (-88 : Rat) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term (44 : Rat) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term (44 : Rat) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term (88 : Rat) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-44 : Rat) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term (-44 : Rat) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 7. -/
theorem ep_Q1_028_partial_07_0040_valid :
    mulPoly ep_Q1_028_coefficient_07_0040
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0041 : Poly :=
[
  term ((-2528 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 41 for generator 7. -/
def ep_Q1_028_partial_07_0041 : Poly :=
[
  term ((5056 : Rat) / 3) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2528 : Rat) / 3) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2528 : Rat) / 3) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-5056 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2528 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((2528 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 7. -/
theorem ep_Q1_028_partial_07_0041_valid :
    mulPoly ep_Q1_028_coefficient_07_0041
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0042 : Poly :=
[
  term ((-16544 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 42 for generator 7. -/
def ep_Q1_028_partial_07_0042 : Poly :=
[
  term ((33088 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-16544 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-16544 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((16544 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((16544 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 7. -/
theorem ep_Q1_028_partial_07_0042_valid :
    mulPoly ep_Q1_028_coefficient_07_0042
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0043 : Poly :=
[
  term ((38816 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 7. -/
def ep_Q1_028_partial_07_0043 : Poly :=
[
  term ((-77632 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((38816 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((38816 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((77632 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-38816 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-38816 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 7. -/
theorem ep_Q1_028_partial_07_0043_valid :
    mulPoly ep_Q1_028_coefficient_07_0043
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0044 : Poly :=
[
  term ((10688 : Rat) / 45) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 44 for generator 7. -/
def ep_Q1_028_partial_07_0044 : Poly :=
[
  term ((-21376 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((10688 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((10688 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((21376 : Rat) / 45) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-10688 : Rat) / 45) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((-10688 : Rat) / 45) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 7. -/
theorem ep_Q1_028_partial_07_0044_valid :
    mulPoly ep_Q1_028_coefficient_07_0044
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0045 : Poly :=
[
  term ((33088 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 7. -/
def ep_Q1_028_partial_07_0045 : Poly :=
[
  term ((-66176 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((33088 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((33088 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((66176 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 7. -/
theorem ep_Q1_028_partial_07_0045_valid :
    mulPoly ep_Q1_028_coefficient_07_0045
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0046 : Poly :=
[
  term ((-8272 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 7. -/
def ep_Q1_028_partial_07_0046 : Poly :=
[
  term ((16544 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8272 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8272 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16544 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8272 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8272 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 7. -/
theorem ep_Q1_028_partial_07_0046_valid :
    mulPoly ep_Q1_028_coefficient_07_0046
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0047 : Poly :=
[
  term ((33088 : Rat) / 45) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 47 for generator 7. -/
def ep_Q1_028_partial_07_0047 : Poly :=
[
  term ((-66176 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((33088 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((33088 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((66176 : Rat) / 45) [(5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 7. -/
theorem ep_Q1_028_partial_07_0047_valid :
    mulPoly ep_Q1_028_coefficient_07_0047
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0048 : Poly :=
[
  term ((-23744 : Rat) / 45) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 7. -/
def ep_Q1_028_partial_07_0048 : Poly :=
[
  term ((47488 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23744 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23744 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47488 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23744 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((23744 : Rat) / 45) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 7. -/
theorem ep_Q1_028_partial_07_0048_valid :
    mulPoly ep_Q1_028_coefficient_07_0048
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0049 : Poly :=
[
  term ((35396 : Rat) / 45) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 7. -/
def ep_Q1_028_partial_07_0049 : Poly :=
[
  term ((-70792 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((35396 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((35396 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((70792 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-35396 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-35396 : Rat) / 45) [(5, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 7. -/
theorem ep_Q1_028_partial_07_0049_valid :
    mulPoly ep_Q1_028_coefficient_07_0049
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0050 : Poly :=
[
  term ((-18688 : Rat) / 45) [(5, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 50 for generator 7. -/
def ep_Q1_028_partial_07_0050 : Poly :=
[
  term ((37376 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-18688 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-18688 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-37376 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((18688 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (14, 2), (16, 1)],
  term ((18688 : Rat) / 45) [(5, 1), (7, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 7. -/
theorem ep_Q1_028_partial_07_0050_valid :
    mulPoly ep_Q1_028_coefficient_07_0050
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0051 : Poly :=
[
  term ((-25072 : Rat) / 45) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 51 for generator 7. -/
def ep_Q1_028_partial_07_0051 : Poly :=
[
  term ((50144 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-25072 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-25072 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-50144 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((25072 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((25072 : Rat) / 45) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 7. -/
theorem ep_Q1_028_partial_07_0051_valid :
    mulPoly ep_Q1_028_coefficient_07_0051
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0052 : Poly :=
[
  term ((-6652 : Rat) / 45) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 52 for generator 7. -/
def ep_Q1_028_partial_07_0052 : Poly :=
[
  term ((13304 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-6652 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-6652 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-13304 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((6652 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((6652 : Rat) / 45) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 7. -/
theorem ep_Q1_028_partial_07_0052_valid :
    mulPoly ep_Q1_028_coefficient_07_0052
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0053 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 7. -/
def ep_Q1_028_partial_07_0053 : Poly :=
[
  term ((-896 : Rat) / 3) [(0, 1), (5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 2), (5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 2), (5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 7. -/
theorem ep_Q1_028_partial_07_0053_valid :
    mulPoly ep_Q1_028_coefficient_07_0053
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0054 : Poly :=
[
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 7. -/
def ep_Q1_028_partial_07_0054 : Poly :=
[
  term ((1792 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 7. -/
theorem ep_Q1_028_partial_07_0054_valid :
    mulPoly ep_Q1_028_coefficient_07_0054
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0055 : Poly :=
[
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 7. -/
def ep_Q1_028_partial_07_0055 : Poly :=
[
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 7. -/
theorem ep_Q1_028_partial_07_0055_valid :
    mulPoly ep_Q1_028_coefficient_07_0055
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0056 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 56 for generator 7. -/
def ep_Q1_028_partial_07_0056 : Poly :=
[
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 7. -/
theorem ep_Q1_028_partial_07_0056_valid :
    mulPoly ep_Q1_028_coefficient_07_0056
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0057 : Poly :=
[
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 57 for generator 7. -/
def ep_Q1_028_partial_07_0057 : Poly :=
[
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 7. -/
theorem ep_Q1_028_partial_07_0057_valid :
    mulPoly ep_Q1_028_coefficient_07_0057
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0058 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 58 for generator 7. -/
def ep_Q1_028_partial_07_0058 : Poly :=
[
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 7. -/
theorem ep_Q1_028_partial_07_0058_valid :
    mulPoly ep_Q1_028_coefficient_07_0058
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0059 : Poly :=
[
  term ((224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 59 for generator 7. -/
def ep_Q1_028_partial_07_0059 : Poly :=
[
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 7. -/
theorem ep_Q1_028_partial_07_0059_valid :
    mulPoly ep_Q1_028_coefficient_07_0059
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0060 : Poly :=
[
  term ((1792 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 7. -/
def ep_Q1_028_partial_07_0060 : Poly :=
[
  term ((-3584 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 7. -/
theorem ep_Q1_028_partial_07_0060_valid :
    mulPoly ep_Q1_028_coefficient_07_0060
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0061 : Poly :=
[
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 7. -/
def ep_Q1_028_partial_07_0061 : Poly :=
[
  term ((-896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 7. -/
theorem ep_Q1_028_partial_07_0061_valid :
    mulPoly ep_Q1_028_coefficient_07_0061
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0062 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 62 for generator 7. -/
def ep_Q1_028_partial_07_0062 : Poly :=
[
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 7. -/
theorem ep_Q1_028_partial_07_0062_valid :
    mulPoly ep_Q1_028_coefficient_07_0062
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0063 : Poly :=
[
  term ((-592 : Rat) / 3) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 7. -/
def ep_Q1_028_partial_07_0063 : Poly :=
[
  term ((1184 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-592 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-592 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1184 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((592 : Rat) / 3) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((592 : Rat) / 3) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 7. -/
theorem ep_Q1_028_partial_07_0063_valid :
    mulPoly ep_Q1_028_coefficient_07_0063
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0064 : Poly :=
[
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 64 for generator 7. -/
def ep_Q1_028_partial_07_0064 : Poly :=
[
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 7. -/
theorem ep_Q1_028_partial_07_0064_valid :
    mulPoly ep_Q1_028_coefficient_07_0064
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0065 : Poly :=
[
  term (-4928 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 65 for generator 7. -/
def ep_Q1_028_partial_07_0065 : Poly :=
[
  term (9856 : Rat) [(0, 1), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term (-4928 : Rat) [(0, 2), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term (-4928 : Rat) [(1, 2), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term (-9856 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term (4928 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term (4928 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 7. -/
theorem ep_Q1_028_partial_07_0065_valid :
    mulPoly ep_Q1_028_coefficient_07_0065
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0066 : Poly :=
[
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 66 for generator 7. -/
def ep_Q1_028_partial_07_0066 : Poly :=
[
  term ((4480 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 7. -/
theorem ep_Q1_028_partial_07_0066_valid :
    mulPoly ep_Q1_028_coefficient_07_0066
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0067 : Poly :=
[
  term ((8960 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 7. -/
def ep_Q1_028_partial_07_0067 : Poly :=
[
  term ((-17920 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((8960 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((8960 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((17920 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8960 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8960 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 7. -/
theorem ep_Q1_028_partial_07_0067_valid :
    mulPoly ep_Q1_028_coefficient_07_0067
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0068 : Poly :=
[
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (16, 1)]
]

/-- Partial product 68 for generator 7. -/
def ep_Q1_028_partial_07_0068 : Poly :=
[
  term ((-12544 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((6272 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((6272 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((12544 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (12, 1), (16, 1)],
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (12, 2), (16, 1)],
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 7. -/
theorem ep_Q1_028_partial_07_0068_valid :
    mulPoly ep_Q1_028_coefficient_07_0068
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0069 : Poly :=
[
  term ((4480 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 69 for generator 7. -/
def ep_Q1_028_partial_07_0069 : Poly :=
[
  term ((-8960 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((4480 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((4480 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((8960 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 7. -/
theorem ep_Q1_028_partial_07_0069_valid :
    mulPoly ep_Q1_028_coefficient_07_0069
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0070 : Poly :=
[
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 7. -/
def ep_Q1_028_partial_07_0070 : Poly :=
[
  term ((2240 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 7. -/
theorem ep_Q1_028_partial_07_0070_valid :
    mulPoly ep_Q1_028_coefficient_07_0070
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0071 : Poly :=
[
  term ((4480 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (16, 1)]
]

/-- Partial product 71 for generator 7. -/
def ep_Q1_028_partial_07_0071 : Poly :=
[
  term ((-8960 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (11, 2), (16, 1)],
  term ((4480 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (11, 2), (16, 1)],
  term ((4480 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (11, 2), (16, 1)],
  term ((8960 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (12, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (12, 2), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 7. -/
theorem ep_Q1_028_partial_07_0071_valid :
    mulPoly ep_Q1_028_coefficient_07_0071
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0072 : Poly :=
[
  term ((-3584 : Rat) / 3) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 7. -/
def ep_Q1_028_partial_07_0072 : Poly :=
[
  term ((7168 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 3) [(5, 2), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 7. -/
theorem ep_Q1_028_partial_07_0072_valid :
    mulPoly ep_Q1_028_coefficient_07_0072
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0073 : Poly :=
[
  term ((3136 : Rat) / 3) [(5, 2), (7, 2), (14, 1), (16, 1)]
]

/-- Partial product 73 for generator 7. -/
def ep_Q1_028_partial_07_0073 : Poly :=
[
  term ((-6272 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (14, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 7. -/
theorem ep_Q1_028_partial_07_0073_valid :
    mulPoly ep_Q1_028_coefficient_07_0073
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0074 : Poly :=
[
  term ((-1792 : Rat) / 3) [(5, 2), (7, 2), (14, 2), (16, 1)]
]

/-- Partial product 74 for generator 7. -/
def ep_Q1_028_partial_07_0074 : Poly :=
[
  term ((3584 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (14, 2), (16, 1)],
  term ((-1792 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (14, 2), (16, 1)],
  term ((-1792 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (14, 2), (16, 1)],
  term ((-3584 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 2), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (14, 2), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 7. -/
theorem ep_Q1_028_partial_07_0074_valid :
    mulPoly ep_Q1_028_coefficient_07_0074
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0075 : Poly :=
[
  term ((-3808 : Rat) / 3) [(5, 2), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 75 for generator 7. -/
def ep_Q1_028_partial_07_0075 : Poly :=
[
  term ((7616 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-3808 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-3808 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-7616 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((3808 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((3808 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 7. -/
theorem ep_Q1_028_partial_07_0075_valid :
    mulPoly ep_Q1_028_coefficient_07_0075
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0076 : Poly :=
[
  term ((-1120 : Rat) / 3) [(5, 2), (7, 2), (16, 1)]
]

/-- Partial product 76 for generator 7. -/
def ep_Q1_028_partial_07_0076 : Poly :=
[
  term ((2240 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 7. -/
theorem ep_Q1_028_partial_07_0076_valid :
    mulPoly ep_Q1_028_coefficient_07_0076
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0077 : Poly :=
[
  term ((-84 : Rat) / 5) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 7. -/
def ep_Q1_028_partial_07_0077 : Poly :=
[
  term ((168 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 7. -/
theorem ep_Q1_028_partial_07_0077_valid :
    mulPoly ep_Q1_028_coefficient_07_0077
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0078 : Poly :=
[
  term ((-464 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 7. -/
def ep_Q1_028_partial_07_0078 : Poly :=
[
  term ((928 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-464 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-464 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-928 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((464 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((464 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 7. -/
theorem ep_Q1_028_partial_07_0078_valid :
    mulPoly ep_Q1_028_coefficient_07_0078
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0079 : Poly :=
[
  term ((-32 : Rat) / 3) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 7. -/
def ep_Q1_028_partial_07_0079 : Poly :=
[
  term ((64 : Rat) / 3) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 3) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 7. -/
theorem ep_Q1_028_partial_07_0079_valid :
    mulPoly ep_Q1_028_coefficient_07_0079
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0080 : Poly :=
[
  term ((-8 : Rat) / 5) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 80 for generator 7. -/
def ep_Q1_028_partial_07_0080 : Poly :=
[
  term ((16 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 7. -/
theorem ep_Q1_028_partial_07_0080_valid :
    mulPoly ep_Q1_028_coefficient_07_0080
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0081 : Poly :=
[
  term ((128 : Rat) / 3) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 81 for generator 7. -/
def ep_Q1_028_partial_07_0081 : Poly :=
[
  term ((-256 : Rat) / 3) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 3) [(0, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 3) [(1, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 3) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 3) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-128 : Rat) / 3) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 7. -/
theorem ep_Q1_028_partial_07_0081_valid :
    mulPoly ep_Q1_028_coefficient_07_0081
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0082 : Poly :=
[
  term ((122 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 82 for generator 7. -/
def ep_Q1_028_partial_07_0082 : Poly :=
[
  term ((-244 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((122 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((122 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((244 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-122 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-122 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 7. -/
theorem ep_Q1_028_partial_07_0082_valid :
    mulPoly ep_Q1_028_coefficient_07_0082
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0083 : Poly :=
[
  term ((448 : Rat) / 15) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 7. -/
def ep_Q1_028_partial_07_0083 : Poly :=
[
  term ((-896 : Rat) / 15) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(0, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(1, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 15) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 7. -/
theorem ep_Q1_028_partial_07_0083_valid :
    mulPoly ep_Q1_028_coefficient_07_0083
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0084 : Poly :=
[
  term ((64 : Rat) / 3) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 7. -/
def ep_Q1_028_partial_07_0084 : Poly :=
[
  term ((-128 : Rat) / 3) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 3) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 3) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 3) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 3) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 3) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 7. -/
theorem ep_Q1_028_partial_07_0084_valid :
    mulPoly ep_Q1_028_coefficient_07_0084
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0085 : Poly :=
[
  term (12 : Rat) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 85 for generator 7. -/
def ep_Q1_028_partial_07_0085 : Poly :=
[
  term (-24 : Rat) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 7. -/
theorem ep_Q1_028_partial_07_0085_valid :
    mulPoly ep_Q1_028_coefficient_07_0085
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0086 : Poly :=
[
  term ((-248 : Rat) / 15) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 86 for generator 7. -/
def ep_Q1_028_partial_07_0086 : Poly :=
[
  term ((496 : Rat) / 15) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-248 : Rat) / 15) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-248 : Rat) / 15) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-496 : Rat) / 15) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((248 : Rat) / 15) [(7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((248 : Rat) / 15) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 7. -/
theorem ep_Q1_028_partial_07_0086_valid :
    mulPoly ep_Q1_028_coefficient_07_0086
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0087 : Poly :=
[
  term ((52 : Rat) / 5) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 87 for generator 7. -/
def ep_Q1_028_partial_07_0087 : Poly :=
[
  term ((-104 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((52 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((52 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((104 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-52 : Rat) / 5) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-52 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 7. -/
theorem ep_Q1_028_partial_07_0087_valid :
    mulPoly ep_Q1_028_coefficient_07_0087
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0088 : Poly :=
[
  term ((992 : Rat) / 15) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 7. -/
def ep_Q1_028_partial_07_0088 : Poly :=
[
  term ((-1984 : Rat) / 15) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((992 : Rat) / 15) [(0, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((992 : Rat) / 15) [(1, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1984 : Rat) / 15) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-992 : Rat) / 15) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-992 : Rat) / 15) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 7. -/
theorem ep_Q1_028_partial_07_0088_valid :
    mulPoly ep_Q1_028_coefficient_07_0088
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0089 : Poly :=
[
  term ((-84 : Rat) / 5) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 7. -/
def ep_Q1_028_partial_07_0089 : Poly :=
[
  term ((168 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 7. -/
theorem ep_Q1_028_partial_07_0089_valid :
    mulPoly ep_Q1_028_coefficient_07_0089
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0090 : Poly :=
[
  term ((84 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 90 for generator 7. -/
def ep_Q1_028_partial_07_0090 : Poly :=
[
  term ((-168 : Rat) / 5) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((168 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 7. -/
theorem ep_Q1_028_partial_07_0090_valid :
    mulPoly ep_Q1_028_coefficient_07_0090
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0091 : Poly :=
[
  term ((-256 : Rat) / 15) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 91 for generator 7. -/
def ep_Q1_028_partial_07_0091 : Poly :=
[
  term ((512 : Rat) / 15) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-256 : Rat) / 15) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-256 : Rat) / 15) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-512 : Rat) / 15) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 7. -/
theorem ep_Q1_028_partial_07_0091_valid :
    mulPoly ep_Q1_028_coefficient_07_0091
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0092 : Poly :=
[
  term ((256 : Rat) / 15) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 7. -/
def ep_Q1_028_partial_07_0092 : Poly :=
[
  term ((-512 : Rat) / 15) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 15) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 7. -/
theorem ep_Q1_028_partial_07_0092_valid :
    mulPoly ep_Q1_028_coefficient_07_0092
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0093 : Poly :=
[
  term ((-128 : Rat) / 15) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 7. -/
def ep_Q1_028_partial_07_0093 : Poly :=
[
  term ((256 : Rat) / 15) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(1, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 7. -/
theorem ep_Q1_028_partial_07_0093_valid :
    mulPoly ep_Q1_028_coefficient_07_0093
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0094 : Poly :=
[
  term ((-116 : Rat) / 15) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 7. -/
def ep_Q1_028_partial_07_0094 : Poly :=
[
  term ((232 : Rat) / 15) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 15) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-232 : Rat) / 15) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 15) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((116 : Rat) / 15) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 7. -/
theorem ep_Q1_028_partial_07_0094_valid :
    mulPoly ep_Q1_028_coefficient_07_0094
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0095 : Poly :=
[
  term ((-88 : Rat) / 3) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 95 for generator 7. -/
def ep_Q1_028_partial_07_0095 : Poly :=
[
  term ((176 : Rat) / 3) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-88 : Rat) / 3) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((-88 : Rat) / 3) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((88 : Rat) / 3) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((88 : Rat) / 3) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 7. -/
theorem ep_Q1_028_partial_07_0095_valid :
    mulPoly ep_Q1_028_coefficient_07_0095
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0096 : Poly :=
[
  term ((3872 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 96 for generator 7. -/
def ep_Q1_028_partial_07_0096 : Poly :=
[
  term ((-7744 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((3872 : Rat) / 5) [(0, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((3872 : Rat) / 5) [(1, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((7744 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3872 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3872 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 7. -/
theorem ep_Q1_028_partial_07_0096_valid :
    mulPoly ep_Q1_028_coefficient_07_0096
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0097 : Poly :=
[
  term ((352 : Rat) / 3) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 97 for generator 7. -/
def ep_Q1_028_partial_07_0097 : Poly :=
[
  term ((-704 : Rat) / 3) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((352 : Rat) / 3) [(0, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((352 : Rat) / 3) [(1, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 7. -/
theorem ep_Q1_028_partial_07_0097_valid :
    mulPoly ep_Q1_028_coefficient_07_0097
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0098 : Poly :=
[
  term ((-1408 : Rat) / 3) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 7. -/
def ep_Q1_028_partial_07_0098 : Poly :=
[
  term ((2816 : Rat) / 3) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 3) [(0, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 3) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2816 : Rat) / 3) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1408 : Rat) / 3) [(7, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1408 : Rat) / 3) [(7, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 7. -/
theorem ep_Q1_028_partial_07_0098_valid :
    mulPoly ep_Q1_028_coefficient_07_0098
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0099 : Poly :=
[
  term ((-4928 : Rat) / 15) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 99 for generator 7. -/
def ep_Q1_028_partial_07_0099 : Poly :=
[
  term ((9856 : Rat) / 15) [(0, 1), (7, 2), (9, 2), (16, 1)],
  term ((-4928 : Rat) / 15) [(0, 2), (7, 2), (9, 2), (16, 1)],
  term ((-4928 : Rat) / 15) [(1, 2), (7, 2), (9, 2), (16, 1)],
  term ((-9856 : Rat) / 15) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((4928 : Rat) / 15) [(7, 2), (9, 2), (12, 2), (16, 1)],
  term ((4928 : Rat) / 15) [(7, 2), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 7. -/
theorem ep_Q1_028_partial_07_0099_valid :
    mulPoly ep_Q1_028_coefficient_07_0099
        ep_Q1_028_generator_07_0000_0099 =
      ep_Q1_028_partial_07_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_07_0000_0099 : List Poly :=
[
  ep_Q1_028_partial_07_0000,
  ep_Q1_028_partial_07_0001,
  ep_Q1_028_partial_07_0002,
  ep_Q1_028_partial_07_0003,
  ep_Q1_028_partial_07_0004,
  ep_Q1_028_partial_07_0005,
  ep_Q1_028_partial_07_0006,
  ep_Q1_028_partial_07_0007,
  ep_Q1_028_partial_07_0008,
  ep_Q1_028_partial_07_0009,
  ep_Q1_028_partial_07_0010,
  ep_Q1_028_partial_07_0011,
  ep_Q1_028_partial_07_0012,
  ep_Q1_028_partial_07_0013,
  ep_Q1_028_partial_07_0014,
  ep_Q1_028_partial_07_0015,
  ep_Q1_028_partial_07_0016,
  ep_Q1_028_partial_07_0017,
  ep_Q1_028_partial_07_0018,
  ep_Q1_028_partial_07_0019,
  ep_Q1_028_partial_07_0020,
  ep_Q1_028_partial_07_0021,
  ep_Q1_028_partial_07_0022,
  ep_Q1_028_partial_07_0023,
  ep_Q1_028_partial_07_0024,
  ep_Q1_028_partial_07_0025,
  ep_Q1_028_partial_07_0026,
  ep_Q1_028_partial_07_0027,
  ep_Q1_028_partial_07_0028,
  ep_Q1_028_partial_07_0029,
  ep_Q1_028_partial_07_0030,
  ep_Q1_028_partial_07_0031,
  ep_Q1_028_partial_07_0032,
  ep_Q1_028_partial_07_0033,
  ep_Q1_028_partial_07_0034,
  ep_Q1_028_partial_07_0035,
  ep_Q1_028_partial_07_0036,
  ep_Q1_028_partial_07_0037,
  ep_Q1_028_partial_07_0038,
  ep_Q1_028_partial_07_0039,
  ep_Q1_028_partial_07_0040,
  ep_Q1_028_partial_07_0041,
  ep_Q1_028_partial_07_0042,
  ep_Q1_028_partial_07_0043,
  ep_Q1_028_partial_07_0044,
  ep_Q1_028_partial_07_0045,
  ep_Q1_028_partial_07_0046,
  ep_Q1_028_partial_07_0047,
  ep_Q1_028_partial_07_0048,
  ep_Q1_028_partial_07_0049,
  ep_Q1_028_partial_07_0050,
  ep_Q1_028_partial_07_0051,
  ep_Q1_028_partial_07_0052,
  ep_Q1_028_partial_07_0053,
  ep_Q1_028_partial_07_0054,
  ep_Q1_028_partial_07_0055,
  ep_Q1_028_partial_07_0056,
  ep_Q1_028_partial_07_0057,
  ep_Q1_028_partial_07_0058,
  ep_Q1_028_partial_07_0059,
  ep_Q1_028_partial_07_0060,
  ep_Q1_028_partial_07_0061,
  ep_Q1_028_partial_07_0062,
  ep_Q1_028_partial_07_0063,
  ep_Q1_028_partial_07_0064,
  ep_Q1_028_partial_07_0065,
  ep_Q1_028_partial_07_0066,
  ep_Q1_028_partial_07_0067,
  ep_Q1_028_partial_07_0068,
  ep_Q1_028_partial_07_0069,
  ep_Q1_028_partial_07_0070,
  ep_Q1_028_partial_07_0071,
  ep_Q1_028_partial_07_0072,
  ep_Q1_028_partial_07_0073,
  ep_Q1_028_partial_07_0074,
  ep_Q1_028_partial_07_0075,
  ep_Q1_028_partial_07_0076,
  ep_Q1_028_partial_07_0077,
  ep_Q1_028_partial_07_0078,
  ep_Q1_028_partial_07_0079,
  ep_Q1_028_partial_07_0080,
  ep_Q1_028_partial_07_0081,
  ep_Q1_028_partial_07_0082,
  ep_Q1_028_partial_07_0083,
  ep_Q1_028_partial_07_0084,
  ep_Q1_028_partial_07_0085,
  ep_Q1_028_partial_07_0086,
  ep_Q1_028_partial_07_0087,
  ep_Q1_028_partial_07_0088,
  ep_Q1_028_partial_07_0089,
  ep_Q1_028_partial_07_0090,
  ep_Q1_028_partial_07_0091,
  ep_Q1_028_partial_07_0092,
  ep_Q1_028_partial_07_0093,
  ep_Q1_028_partial_07_0094,
  ep_Q1_028_partial_07_0095,
  ep_Q1_028_partial_07_0096,
  ep_Q1_028_partial_07_0097,
  ep_Q1_028_partial_07_0098,
  ep_Q1_028_partial_07_0099
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_07_0000_0099 : Poly :=
[
  term ((-320 : Rat) / 3) [(0, 1), (3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 1), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((896 : Rat) / 15) [(0, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((10688 : Rat) / 45) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-16544 : Rat) / 45) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term (-320 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-6752 : Rat) / 9) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term (-896 : Rat) [(0, 1), (3, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term ((-5824 : Rat) / 3) [(0, 1), (3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-496 : Rat) / 15) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-416 : Rat) / 15) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((268 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(0, 1), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((352 : Rat) / 3) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((704 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((4576 : Rat) / 15) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (3, 1), (9, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term (-14 : Rat) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-6272 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((128 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((3008 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((640 : Rat) / 3) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-256 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((64 : Rat) / 5) [(0, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-704 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 15) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term (32 : Rat) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term (-88 : Rat) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5056 : Rat) / 3) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((33088 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-77632 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-21376 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-66176 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((16544 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-66176 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((47488 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70792 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((37376 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((50144 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((13304 : Rat) / 45) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(0, 1), (5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-3584 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1184 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (15, 3), (16, 1)],
  term (9856 : Rat) [(0, 1), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((4480 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17920 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12544 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((-8960 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8960 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (11, 2), (16, 1)],
  term ((7168 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6272 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((3584 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (14, 2), (16, 1)],
  term ((7616 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (15, 2), (16, 1)],
  term ((2240 : Rat) / 3) [(0, 1), (5, 2), (7, 2), (16, 1)],
  term ((168 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((928 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 3) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 3) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-244 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((-896 : Rat) / 15) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 3) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((496 : Rat) / 15) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-104 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1984 : Rat) / 15) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 15) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-512 : Rat) / 15) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((232 : Rat) / 15) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 3) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-7744 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((2816 : Rat) / 3) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((9856 : Rat) / 15) [(0, 1), (7, 2), (9, 2), (16, 1)],
  term ((160 : Rat) / 3) [(0, 2), (3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((32 : Rat) / 15) [(0, 2), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 15) [(0, 2), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(0, 2), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5344 : Rat) / 45) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((8272 : Rat) / 45) [(0, 2), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term (160 : Rat) [(0, 2), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((3376 : Rat) / 9) [(0, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((560 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term (448 : Rat) [(0, 2), (3, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term ((2912 : Rat) / 3) [(0, 2), (3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((-224 : Rat) / 15) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 15) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 15) [(0, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-134 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(0, 2), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(0, 2), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-352 : Rat) / 5) [(0, 2), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-2288 : Rat) / 15) [(0, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term (7 : Rat) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1504 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-320 : Rat) / 3) [(0, 2), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((128 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(0, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((352 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(0, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (4, 1), (7, 1), (9, 1), (16, 1)],
  term (-16 : Rat) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term (44 : Rat) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2528 : Rat) / 3) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-16544 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((38816 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((10688 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((33088 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8272 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((33088 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-23744 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((35396 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-18688 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-25072 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6652 : Rat) / 45) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 2), (5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((224 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-592 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(0, 2), (5, 2), (7, 1), (15, 3), (16, 1)],
  term (-4928 : Rat) [(0, 2), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((8960 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((4480 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((4480 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (11, 2), (16, 1)],
  term ((-3584 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (14, 2), (16, 1)],
  term ((-3808 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(0, 2), (5, 2), (7, 2), (16, 1)],
  term ((-84 : Rat) / 5) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-464 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 3) [(0, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((122 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((448 : Rat) / 15) [(0, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 3) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-248 : Rat) / 15) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((52 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((992 : Rat) / 15) [(0, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 15) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-116 : Rat) / 15) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-88 : Rat) / 3) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((3872 : Rat) / 5) [(0, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((352 : Rat) / 3) [(0, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1408 : Rat) / 3) [(0, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(0, 2), (7, 2), (9, 2), (16, 1)],
  term ((160 : Rat) / 3) [(1, 2), (3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 2), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 2), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(1, 2), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5344 : Rat) / 45) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((8272 : Rat) / 45) [(1, 2), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term (160 : Rat) [(1, 2), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((3376 : Rat) / 9) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((560 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term (448 : Rat) [(1, 2), (3, 1), (5, 2), (7, 2), (13, 1), (16, 1)],
  term ((2912 : Rat) / 3) [(1, 2), (3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((-224 : Rat) / 15) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 15) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 15) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-134 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(1, 2), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(1, 2), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-352 : Rat) / 5) [(1, 2), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-2288 : Rat) / 15) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term (7 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1504 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-320 : Rat) / 3) [(1, 2), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((128 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(1, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((352 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(1, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (4, 1), (7, 1), (9, 1), (16, 1)],
  term (-16 : Rat) [(1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term (44 : Rat) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2528 : Rat) / 3) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-16544 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((38816 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((10688 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((33088 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8272 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((33088 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-23744 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((35396 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-18688 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-25072 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6652 : Rat) / 45) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 2), (5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((224 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-592 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(1, 2), (5, 2), (7, 1), (15, 3), (16, 1)],
  term (-4928 : Rat) [(1, 2), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((8960 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((4480 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((4480 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (11, 2), (16, 1)],
  term ((-3584 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (14, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (14, 2), (16, 1)],
  term ((-3808 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(1, 2), (5, 2), (7, 2), (16, 1)],
  term ((-84 : Rat) / 5) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-464 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 3) [(1, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((122 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((448 : Rat) / 15) [(1, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 3) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-248 : Rat) / 15) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((52 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((992 : Rat) / 15) [(1, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 15) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(1, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-116 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-88 : Rat) / 3) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((3872 : Rat) / 5) [(1, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((352 : Rat) / 3) [(1, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1408 : Rat) / 3) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4928 : Rat) / 15) [(1, 2), (7, 2), (9, 2), (16, 1)],
  term ((320 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-160 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-160 : Rat) / 3) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((64 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((64 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-896 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((448 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-10688 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((5344 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((5344 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((16544 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8272 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-8272 : Rat) / 45) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term (320 : Rat) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((6752 : Rat) / 9) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-160 : Rat) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3376 : Rat) / 9) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3376 : Rat) / 9) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-160 : Rat) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((896 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((-560 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (12, 2), (16, 1)],
  term ((-560 : Rat) / 3) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((-6272 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((3136 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (9, 1), (12, 2), (16, 1)],
  term ((3136 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (9, 1), (13, 2), (16, 1)],
  term ((2240 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1120 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (12, 2), (16, 1)],
  term ((-1120 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (11, 1), (13, 2), (16, 1)],
  term (896 : Rat) [(3, 1), (5, 2), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((5824 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (-448 : Rat) [(3, 1), (5, 2), (7, 2), (12, 2), (13, 1), (16, 1)],
  term ((-2912 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-2912 : Rat) / 3) [(3, 1), (5, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term (-448 : Rat) [(3, 1), (5, 2), (7, 2), (13, 3), (16, 1)],
  term ((-448 : Rat) / 15) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 15) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((224 : Rat) / 15) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((496 : Rat) / 15) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-248 : Rat) / 15) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-248 : Rat) / 15) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((416 : Rat) / 15) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-268 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-32 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 15) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((134 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-208 : Rat) / 15) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((134 : Rat) / 5) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((4928 : Rat) / 15) [(3, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((-2464 : Rat) / 15) [(3, 1), (7, 2), (9, 1), (12, 2), (16, 1)],
  term ((-2464 : Rat) / 15) [(3, 1), (7, 2), (9, 1), (13, 2), (16, 1)],
  term ((-352 : Rat) / 3) [(3, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((176 : Rat) / 3) [(3, 1), (7, 2), (11, 1), (12, 2), (16, 1)],
  term ((176 : Rat) / 3) [(3, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((-704 : Rat) / 5) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-4576 : Rat) / 15) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 5) [(3, 1), (7, 2), (12, 2), (13, 1), (16, 1)],
  term ((2288 : Rat) / 15) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((2288 : Rat) / 15) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((352 : Rat) / 5) [(3, 1), (7, 2), (13, 3), (16, 1)],
  term (8 : Rat) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term (-4 : Rat) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term (6 : Rat) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term (-3 : Rat) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term (14 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term (-7 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((6272 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3136 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3136 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3008 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((1504 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1504 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 3), (16, 1)],
  term ((-640 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((320 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((320 : Rat) / 3) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (11, 2), (13, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((704 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((32 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (14, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-128 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((64 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 15) [(4, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((32 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term (-8 : Rat) [(4, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term (-32 : Rat) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term (16 : Rat) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term (88 : Rat) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-44 : Rat) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term (-44 : Rat) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5056 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2528 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((2528 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((77632 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((16544 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-38816 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-38816 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((16544 : Rat) / 45) [(5, 1), (7, 1), (9, 1), (13, 3), (16, 1)],
  term ((21376 : Rat) / 45) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-10688 : Rat) / 45) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((-10688 : Rat) / 45) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((66176 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16544 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((8272 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8272 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((66176 : Rat) / 45) [(5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (11, 2), (12, 2), (16, 1)],
  term ((-33088 : Rat) / 45) [(5, 1), (7, 1), (11, 2), (13, 2), (16, 1)],
  term ((-47488 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((70792 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-37376 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-50144 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13304 : Rat) / 45) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((23744 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35396 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((18688 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (14, 2), (16, 1)],
  term ((25072 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((6652 : Rat) / 45) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-35396 : Rat) / 45) [(5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((18688 : Rat) / 45) [(5, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((25072 : Rat) / 45) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((6652 : Rat) / 45) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((23744 : Rat) / 45) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((3584 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 3) [(5, 2), (7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1184 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 3) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term (496 : Rat) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-448 : Rat) / 3) [(5, 2), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((592 : Rat) / 3) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((448 : Rat) / 3) [(5, 2), (7, 1), (13, 3), (14, 1), (16, 1)],
  term (-9856 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term (4928 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term (4928 : Rat) [(5, 2), (7, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((17920 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-8960 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8960 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2240 : Rat) / 3) [(5, 2), (7, 2), (9, 1), (13, 3), (16, 1)],
  term ((12544 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (12, 1), (16, 1)],
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (12, 2), (16, 1)],
  term ((-6272 : Rat) / 3) [(5, 2), (7, 2), (9, 2), (13, 2), (16, 1)],
  term ((8960 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (11, 1), (13, 3), (16, 1)],
  term ((8960 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (12, 1), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (12, 2), (16, 1)],
  term ((-4480 : Rat) / 3) [(5, 2), (7, 2), (11, 2), (13, 2), (16, 1)],
  term ((-7168 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6272 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3584 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (14, 2), (16, 1)],
  term ((-7616 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2240 : Rat) / 3) [(5, 2), (7, 2), (12, 1), (16, 1)],
  term ((3584 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (14, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (14, 2), (16, 1)],
  term ((3808 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (12, 2), (16, 1)],
  term ((-3136 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1792 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (14, 2), (16, 1)],
  term ((3808 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1120 : Rat) / 3) [(5, 2), (7, 2), (13, 2), (16, 1)],
  term ((3584 : Rat) / 3) [(5, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((84 : Rat) / 5) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-928 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((464 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((464 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 3) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 3) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((244 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((32 : Rat) / 3) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 3) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-122 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((8 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 3) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-122 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((32 : Rat) / 3) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((896 : Rat) / 15) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 15) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 3) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-496 : Rat) / 15) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((104 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-64 : Rat) / 3) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((248 : Rat) / 15) [(7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-52 : Rat) / 5) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term (-12 : Rat) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((248 : Rat) / 15) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-52 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-64 : Rat) / 3) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1984 : Rat) / 15) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-992 : Rat) / 15) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-992 : Rat) / 15) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 15) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((84 : Rat) / 5) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((512 : Rat) / 15) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-232 : Rat) / 15) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-256 : Rat) / 15) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-388 : Rat) / 15) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((88 : Rat) / 3) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((84 : Rat) / 5) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((116 : Rat) / 15) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((88 : Rat) / 3) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-84 : Rat) / 5) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((7744 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3872 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3872 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2816 : Rat) / 3) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((1408 : Rat) / 3) [(7, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1408 : Rat) / 3) [(7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (9, 1), (13, 3), (16, 1)],
  term ((-9856 : Rat) / 15) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((4928 : Rat) / 15) [(7, 2), (9, 2), (12, 2), (16, 1)],
  term ((4928 : Rat) / 15) [(7, 2), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 99. -/
theorem ep_Q1_028_block_07_0000_0099_valid :
    checkProductSumEq ep_Q1_028_partials_07_0000_0099
      ep_Q1_028_block_07_0000_0099 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
