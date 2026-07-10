/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 13:0-22

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 13 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_13_0000_0022 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (5, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0000 : Poly :=
[
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 13. -/
def ep_Q2_074_partial_13_0000 : Poly :=
[
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 3), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 3), (1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem ep_Q2_074_partial_13_0000_valid :
    mulPoly ep_Q2_074_coefficient_13_0000
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0001 : Poly :=
[
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 13. -/
def ep_Q2_074_partial_13_0001 : Poly :=
[
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 3), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem ep_Q2_074_partial_13_0001_valid :
    mulPoly ep_Q2_074_coefficient_13_0001
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0002 : Poly :=
[
  term ((-864 : Rat) / 769) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 2 for generator 13. -/
def ep_Q2_074_partial_13_0002 : Poly :=
[
  term ((1728 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 1), (2, 3), (16, 1)],
  term ((1728 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 3), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem ep_Q2_074_partial_13_0002_valid :
    mulPoly ep_Q2_074_coefficient_13_0002
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0003 : Poly :=
[
  term ((-9072 : Rat) / 769) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 3 for generator 13. -/
def ep_Q2_074_partial_13_0003 : Poly :=
[
  term ((18144 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((9072 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((9072 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(0, 2), (4, 2), (16, 1)],
  term ((-9072 : Rat) / 769) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem ep_Q2_074_partial_13_0003_valid :
    mulPoly ep_Q2_074_coefficient_13_0003
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0004 : Poly :=
[
  term ((-63 : Rat) / 769) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 4 for generator 13. -/
def ep_Q2_074_partial_13_0004 : Poly :=
[
  term ((126 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((63 : Rat) / 769) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((63 : Rat) / 769) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((126 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem ep_Q2_074_partial_13_0004_valid :
    mulPoly ep_Q2_074_coefficient_13_0004
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0005 : Poly :=
[
  term ((19683 : Rat) / 1538) [(0, 1), (16, 1)]
]

/-- Partial product 5 for generator 13. -/
def ep_Q2_074_partial_13_0005 : Poly :=
[
  term ((-19683 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((19683 : Rat) / 1538) [(0, 1), (1, 2), (16, 1)],
  term ((19683 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-19683 : Rat) / 1538) [(0, 1), (2, 2), (16, 1)],
  term ((19683 : Rat) / 769) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-19683 : Rat) / 1538) [(0, 1), (3, 2), (16, 1)],
  term ((-19683 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((19683 : Rat) / 1538) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem ep_Q2_074_partial_13_0005_valid :
    mulPoly ep_Q2_074_coefficient_13_0005
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0006 : Poly :=
[
  term ((63 : Rat) / 769) [(0, 2), (16, 1)]
]

/-- Partial product 6 for generator 13. -/
def ep_Q2_074_partial_13_0006 : Poly :=
[
  term ((-126 : Rat) / 769) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((63 : Rat) / 769) [(0, 2), (1, 2), (16, 1)],
  term ((126 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 2), (2, 2), (16, 1)],
  term ((126 : Rat) / 769) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 2), (3, 2), (16, 1)],
  term ((-126 : Rat) / 769) [(0, 3), (4, 1), (16, 1)],
  term ((63 : Rat) / 769) [(0, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem ep_Q2_074_partial_13_0006_valid :
    mulPoly ep_Q2_074_coefficient_13_0006
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0007 : Poly :=
[
  term ((13566 : Rat) / 769) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 7 for generator 13. -/
def ep_Q2_074_partial_13_0007 : Poly :=
[
  term ((-27132 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((27132 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((27132 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-13566 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-27132 : Rat) / 769) [(1, 2), (5, 2), (16, 1)],
  term ((13566 : Rat) / 769) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem ep_Q2_074_partial_13_0007_valid :
    mulPoly ep_Q2_074_coefficient_13_0007
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0008 : Poly :=
[
  term ((396 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 8 for generator 13. -/
def ep_Q2_074_partial_13_0008 : Poly :=
[
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (10, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 2), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (10, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem ep_Q2_074_partial_13_0008_valid :
    mulPoly ep_Q2_074_coefficient_13_0008
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0009 : Poly :=
[
  term ((-396 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 13. -/
def ep_Q2_074_partial_13_0009 : Poly :=
[
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 2), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem ep_Q2_074_partial_13_0009_valid :
    mulPoly ep_Q2_074_coefficient_13_0009
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0010 : Poly :=
[
  term ((-198 : Rat) / 769) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 13. -/
def ep_Q2_074_partial_13_0010 : Poly :=
[
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem ep_Q2_074_partial_13_0010_valid :
    mulPoly ep_Q2_074_coefficient_13_0010
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0011 : Poly :=
[
  term ((99 : Rat) / 769) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 13. -/
def ep_Q2_074_partial_13_0011 : Poly :=
[
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 769) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 769) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem ep_Q2_074_partial_13_0011_valid :
    mulPoly ep_Q2_074_coefficient_13_0011
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0012 : Poly :=
[
  term ((7380 : Rat) / 769) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 12 for generator 13. -/
def ep_Q2_074_partial_13_0012 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 4), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem ep_Q2_074_partial_13_0012_valid :
    mulPoly ep_Q2_074_coefficient_13_0012
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0013 : Poly :=
[
  term ((-15156 : Rat) / 769) [(1, 2), (10, 1), (16, 1)]
]

/-- Partial product 13 for generator 13. -/
def ep_Q2_074_partial_13_0013 : Poly :=
[
  term ((30312 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-15156 : Rat) / 769) [(0, 2), (1, 2), (10, 1), (16, 1)],
  term ((-30312 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((15156 : Rat) / 769) [(1, 2), (2, 2), (10, 1), (16, 1)],
  term ((-30312 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((15156 : Rat) / 769) [(1, 2), (3, 2), (10, 1), (16, 1)],
  term ((30312 : Rat) / 769) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-15156 : Rat) / 769) [(1, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem ep_Q2_074_partial_13_0013_valid :
    mulPoly ep_Q2_074_coefficient_13_0013
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0014 : Poly :=
[
  term ((7380 : Rat) / 769) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 13. -/
def ep_Q2_074_partial_13_0014 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (2, 2), (15, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (5, 1), (15, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem ep_Q2_074_partial_13_0014_valid :
    mulPoly ep_Q2_074_coefficient_13_0014
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0015 : Poly :=
[
  term ((1215 : Rat) / 769) [(1, 2), (16, 1)]
]

/-- Partial product 15 for generator 13. -/
def ep_Q2_074_partial_13_0015 : Poly :=
[
  term ((-2430 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((1215 : Rat) / 769) [(0, 2), (1, 2), (16, 1)],
  term ((2430 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-1215 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((2430 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-1215 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((-2430 : Rat) / 769) [(1, 3), (5, 1), (16, 1)],
  term ((1215 : Rat) / 769) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem ep_Q2_074_partial_13_0015_valid :
    mulPoly ep_Q2_074_coefficient_13_0015
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0016 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 3), (5, 1), (16, 1)]
]

/-- Partial product 16 for generator 13. -/
def ep_Q2_074_partial_13_0016 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 3), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (2, 2), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 2), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 4), (5, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 5), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem ep_Q2_074_partial_13_0016_valid :
    mulPoly ep_Q2_074_coefficient_13_0016
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0017 : Poly :=
[
  term ((864 : Rat) / 769) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 17 for generator 13. -/
def ep_Q2_074_partial_13_0017 : Poly :=
[
  term ((-1728 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 2), (2, 1), (10, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (10, 1), (16, 1)],
  term ((864 : Rat) / 769) [(1, 2), (2, 1), (10, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(2, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem ep_Q2_074_partial_13_0017_valid :
    mulPoly ep_Q2_074_coefficient_13_0017
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0018 : Poly :=
[
  term ((9072 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 18 for generator 13. -/
def ep_Q2_074_partial_13_0018 : Poly :=
[
  term ((-18144 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((9072 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((9072 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(2, 1), (4, 2), (10, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(3, 2), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem ep_Q2_074_partial_13_0018_valid :
    mulPoly ep_Q2_074_coefficient_13_0018
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0019 : Poly :=
[
  term ((-6783 : Rat) / 769) [(4, 1), (16, 1)]
]

/-- Partial product 19 for generator 13. -/
def ep_Q2_074_partial_13_0019 : Poly :=
[
  term ((13566 : Rat) / 769) [(0, 1), (4, 2), (16, 1)],
  term ((-6783 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-6783 : Rat) / 769) [(1, 2), (4, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(2, 1), (4, 2), (16, 1)],
  term ((6783 : Rat) / 769) [(2, 2), (4, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((6783 : Rat) / 769) [(3, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem ep_Q2_074_partial_13_0019_valid :
    mulPoly ep_Q2_074_coefficient_13_0019
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0020 : Poly :=
[
  term ((4569 : Rat) / 769) [(10, 1), (16, 1)]
]

/-- Partial product 20 for generator 13. -/
def ep_Q2_074_partial_13_0020 : Poly :=
[
  term ((-9138 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((4569 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((-9138 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((4569 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(2, 2), (10, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem ep_Q2_074_partial_13_0020_valid :
    mulPoly ep_Q2_074_coefficient_13_0020
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0021 : Poly :=
[
  term ((-6801 : Rat) / 769) [(15, 2), (16, 1)]
]

/-- Partial product 21 for generator 13. -/
def ep_Q2_074_partial_13_0021 : Poly :=
[
  term ((13602 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-6801 : Rat) / 769) [(0, 2), (15, 2), (16, 1)],
  term ((13602 : Rat) / 769) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-6801 : Rat) / 769) [(1, 2), (15, 2), (16, 1)],
  term ((-13602 : Rat) / 769) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((6801 : Rat) / 769) [(2, 2), (15, 2), (16, 1)],
  term ((-13602 : Rat) / 769) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((6801 : Rat) / 769) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem ep_Q2_074_partial_13_0021_valid :
    mulPoly ep_Q2_074_coefficient_13_0021
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def ep_Q2_074_coefficient_13_0022 : Poly :=
[
  term ((-9417 : Rat) / 3076) [(16, 1)]
]

/-- Partial product 22 for generator 13. -/
def ep_Q2_074_partial_13_0022 : Poly :=
[
  term ((9417 : Rat) / 1538) [(0, 1), (4, 1), (16, 1)],
  term ((-9417 : Rat) / 3076) [(0, 2), (16, 1)],
  term ((9417 : Rat) / 1538) [(1, 1), (5, 1), (16, 1)],
  term ((-9417 : Rat) / 3076) [(1, 2), (16, 1)],
  term ((-9417 : Rat) / 1538) [(2, 1), (4, 1), (16, 1)],
  term ((9417 : Rat) / 3076) [(2, 2), (16, 1)],
  term ((-9417 : Rat) / 1538) [(3, 1), (5, 1), (16, 1)],
  term ((9417 : Rat) / 3076) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem ep_Q2_074_partial_13_0022_valid :
    mulPoly ep_Q2_074_coefficient_13_0022
        ep_Q2_074_generator_13_0000_0022 =
      ep_Q2_074_partial_13_0022 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_13_0000_0022 : List Poly :=
[
  ep_Q2_074_partial_13_0000,
  ep_Q2_074_partial_13_0001,
  ep_Q2_074_partial_13_0002,
  ep_Q2_074_partial_13_0003,
  ep_Q2_074_partial_13_0004,
  ep_Q2_074_partial_13_0005,
  ep_Q2_074_partial_13_0006,
  ep_Q2_074_partial_13_0007,
  ep_Q2_074_partial_13_0008,
  ep_Q2_074_partial_13_0009,
  ep_Q2_074_partial_13_0010,
  ep_Q2_074_partial_13_0011,
  ep_Q2_074_partial_13_0012,
  ep_Q2_074_partial_13_0013,
  ep_Q2_074_partial_13_0014,
  ep_Q2_074_partial_13_0015,
  ep_Q2_074_partial_13_0016,
  ep_Q2_074_partial_13_0017,
  ep_Q2_074_partial_13_0018,
  ep_Q2_074_partial_13_0019,
  ep_Q2_074_partial_13_0020,
  ep_Q2_074_partial_13_0021,
  ep_Q2_074_partial_13_0022
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_13_0000_0022 : Poly :=
[
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-8988 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (10, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-19683 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((30312 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-11502 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((19683 : Rat) / 1538) [(0, 1), (1, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 3), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-1854 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((19683 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((7344 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((63 : Rat) / 769) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((-19683 : Rat) / 1538) [(0, 1), (2, 2), (16, 1)],
  term ((864 : Rat) / 769) [(0, 1), (2, 3), (16, 1)],
  term ((-18144 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((19683 : Rat) / 769) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((9072 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((63 : Rat) / 769) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((-19683 : Rat) / 1538) [(0, 1), (3, 2), (16, 1)],
  term ((-9138 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((13602 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((9417 : Rat) / 1538) [(0, 1), (4, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(0, 1), (4, 2), (16, 1)],
  term ((792 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((13440 : Rat) / 769) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 2), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 2), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((99 : Rat) / 769) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)],
  term ((-15156 : Rat) / 769) [(0, 2), (1, 2), (10, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((1278 : Rat) / 769) [(0, 2), (1, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 3), (5, 1), (16, 1)],
  term ((1854 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 2), (2, 1), (10, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 2), (2, 2), (16, 1)],
  term ((126 : Rat) / 769) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 2), (3, 2), (16, 1)],
  term ((9198 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-26466 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(0, 2), (4, 2), (16, 1)],
  term ((4569 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((-6801 : Rat) / 769) [(0, 2), (15, 2), (16, 1)],
  term ((-9417 : Rat) / 3076) [(0, 2), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 3), (1, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 3), (1, 1), (11, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 3), (2, 1), (16, 1)],
  term ((-9198 : Rat) / 769) [(0, 3), (4, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 3), (10, 1), (16, 1)],
  term ((19683 : Rat) / 1538) [(0, 3), (16, 1)],
  term ((63 : Rat) / 769) [(0, 4), (16, 1)],
  term ((27132 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (10, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (10, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((27132 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-13566 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-9138 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((13602 : Rat) / 769) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((9417 : Rat) / 1538) [(1, 1), (5, 1), (16, 1)],
  term ((-30312 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((2430 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((864 : Rat) / 769) [(1, 2), (2, 1), (10, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((15156 : Rat) / 769) [(1, 2), (2, 2), (10, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (2, 2), (15, 2), (16, 1)],
  term ((-1215 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-30312 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((2430 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((15156 : Rat) / 769) [(1, 2), (3, 2), (10, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-1215 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((9072 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-6783 : Rat) / 769) [(1, 2), (4, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-27132 : Rat) / 769) [(1, 2), (5, 2), (16, 1)],
  term ((4569 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((-6801 : Rat) / 769) [(1, 2), (15, 2), (16, 1)],
  term ((-9417 : Rat) / 3076) [(1, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (2, 2), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 2), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)],
  term ((30312 : Rat) / 769) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (5, 1), (15, 2), (16, 1)],
  term ((11136 : Rat) / 769) [(1, 3), (5, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 3), (7, 1), (10, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 3), (10, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 3), (11, 1), (16, 1)],
  term ((99 : Rat) / 769) [(1, 3), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 4), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 4), (5, 2), (16, 1)],
  term ((-15156 : Rat) / 769) [(1, 4), (10, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 4), (15, 2), (16, 1)],
  term ((1215 : Rat) / 769) [(1, 4), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 5), (5, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(2, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-13602 : Rat) / 769) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-9417 : Rat) / 1538) [(2, 1), (4, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(2, 1), (4, 2), (10, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(2, 1), (4, 2), (16, 1)],
  term ((-7344 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((6783 : Rat) / 769) [(2, 2), (4, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(2, 2), (10, 1), (16, 1)],
  term ((6801 : Rat) / 769) [(2, 2), (15, 2), (16, 1)],
  term ((9417 : Rat) / 3076) [(2, 2), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 3), (10, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-13602 : Rat) / 769) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-9417 : Rat) / 1538) [(3, 1), (5, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((6783 : Rat) / 769) [(3, 2), (4, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(3, 2), (10, 1), (16, 1)],
  term ((6801 : Rat) / 769) [(3, 2), (15, 2), (16, 1)],
  term ((9417 : Rat) / 3076) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 22. -/
theorem ep_Q2_074_block_13_0000_0022_valid :
    checkProductSumEq ep_Q2_074_partials_13_0000_0022
      ep_Q2_074_block_13_0000_0022 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
