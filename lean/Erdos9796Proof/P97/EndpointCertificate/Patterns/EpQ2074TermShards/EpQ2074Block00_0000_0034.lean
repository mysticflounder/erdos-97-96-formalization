/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 0:0-34

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 0 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_00_0000_0034 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (4, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0000 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)]
]

/-- Partial product 0 for generator 0. -/
def ep_Q2_074_partial_00_0000 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (3, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (5, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 3), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (3, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (5, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 2), (1, 2), (2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 0. -/
theorem ep_Q2_074_partial_00_0000_valid :
    mulPoly ep_Q2_074_coefficient_00_0000
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0001 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)]
]

/-- Partial product 1 for generator 0. -/
def ep_Q2_074_partial_00_0001 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (4, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (3, 2), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (5, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 3), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 2), (1, 2), (4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 0. -/
theorem ep_Q2_074_partial_00_0001_valid :
    mulPoly ep_Q2_074_coefficient_00_0001
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0002 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (10, 1), (16, 1)]
]

/-- Partial product 2 for generator 0. -/
def ep_Q2_074_partial_00_0002 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (3, 2), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 0. -/
theorem ep_Q2_074_partial_00_0002_valid :
    mulPoly ep_Q2_074_coefficient_00_0002
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0003 : Poly :=
[
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (16, 1)]
]

/-- Partial product 3 for generator 0. -/
def ep_Q2_074_partial_00_0003 : Poly :=
[
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (3, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (5, 2), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 0. -/
theorem ep_Q2_074_partial_00_0003_valid :
    mulPoly ep_Q2_074_coefficient_00_0003
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0004 : Poly :=
[
  term ((-45276 : Rat) / 769) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 4 for generator 0. -/
def ep_Q2_074_partial_00_0004 : Poly :=
[
  term ((90552 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-90552 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((-45276 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((45276 : Rat) / 769) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((45276 : Rat) / 769) [(0, 1), (2, 1), (5, 2), (16, 1)],
  term ((-45276 : Rat) / 769) [(0, 1), (2, 3), (16, 1)],
  term ((-90552 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((90552 : Rat) / 769) [(0, 2), (2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 0. -/
theorem ep_Q2_074_partial_00_0004_valid :
    mulPoly ep_Q2_074_coefficient_00_0004
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0005 : Poly :=
[
  term ((12399 : Rat) / 769) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 5 for generator 0. -/
def ep_Q2_074_partial_00_0005 : Poly :=
[
  term ((-24798 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((24798 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((12399 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((12399 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((-12399 : Rat) / 769) [(0, 1), (4, 1), (5, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(0, 1), (4, 3), (16, 1)],
  term ((-24798 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((24798 : Rat) / 769) [(0, 2), (4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 0. -/
theorem ep_Q2_074_partial_00_0005_valid :
    mulPoly ep_Q2_074_coefficient_00_0005
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0006 : Poly :=
[
  term ((-22527 : Rat) / 769) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 6 for generator 0. -/
def ep_Q2_074_partial_00_0006 : Poly :=
[
  term ((45054 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-45054 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-22527 : Rat) / 769) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((-22527 : Rat) / 769) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((22527 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((22527 : Rat) / 769) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((45054 : Rat) / 769) [(0, 2), (2, 1), (10, 1), (16, 1)],
  term ((-45054 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 0. -/
theorem ep_Q2_074_partial_00_0006_valid :
    mulPoly ep_Q2_074_coefficient_00_0006
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0007 : Poly :=
[
  term ((85761 : Rat) / 1538) [(0, 1), (16, 1)]
]

/-- Partial product 7 for generator 0. -/
def ep_Q2_074_partial_00_0007 : Poly :=
[
  term ((-85761 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((85761 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((85761 : Rat) / 1538) [(0, 1), (2, 2), (16, 1)],
  term ((85761 : Rat) / 1538) [(0, 1), (3, 2), (16, 1)],
  term ((-85761 : Rat) / 1538) [(0, 1), (4, 2), (16, 1)],
  term ((-85761 : Rat) / 1538) [(0, 1), (5, 2), (16, 1)],
  term ((-85761 : Rat) / 769) [(0, 2), (2, 1), (16, 1)],
  term ((85761 : Rat) / 769) [(0, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 0. -/
theorem ep_Q2_074_partial_00_0007_valid :
    mulPoly ep_Q2_074_coefficient_00_0007
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0008 : Poly :=
[
  term ((-537 : Rat) / 769) [(0, 2), (16, 1)]
]

/-- Partial product 8 for generator 0. -/
def ep_Q2_074_partial_00_0008 : Poly :=
[
  term ((1074 : Rat) / 769) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-1074 : Rat) / 769) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-537 : Rat) / 769) [(0, 2), (2, 2), (16, 1)],
  term ((-537 : Rat) / 769) [(0, 2), (3, 2), (16, 1)],
  term ((537 : Rat) / 769) [(0, 2), (4, 2), (16, 1)],
  term ((537 : Rat) / 769) [(0, 2), (5, 2), (16, 1)],
  term ((1074 : Rat) / 769) [(0, 3), (2, 1), (16, 1)],
  term ((-1074 : Rat) / 769) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 0. -/
theorem ep_Q2_074_partial_00_0008_valid :
    mulPoly ep_Q2_074_coefficient_00_0008
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0009 : Poly :=
[
  term ((-16419 : Rat) / 769) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 9 for generator 0. -/
def ep_Q2_074_partial_00_0009 : Poly :=
[
  term ((32838 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-32838 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-16419 : Rat) / 769) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((16419 : Rat) / 769) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((16419 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-16419 : Rat) / 769) [(1, 1), (3, 3), (16, 1)],
  term ((-32838 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((32838 : Rat) / 769) [(1, 2), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 0. -/
theorem ep_Q2_074_partial_00_0009_valid :
    mulPoly ep_Q2_074_coefficient_00_0009
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0010 : Poly :=
[
  term ((14733 : Rat) / 769) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 10 for generator 0. -/
def ep_Q2_074_partial_00_0010 : Poly :=
[
  term ((-29466 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((29466 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((14733 : Rat) / 769) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((14733 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-14733 : Rat) / 769) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-14733 : Rat) / 769) [(1, 1), (5, 3), (16, 1)],
  term ((-29466 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((29466 : Rat) / 769) [(1, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 0. -/
theorem ep_Q2_074_partial_00_0010_valid :
    mulPoly ep_Q2_074_coefficient_00_0010
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0011 : Poly :=
[
  term ((396 : Rat) / 769) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 11 for generator 0. -/
def ep_Q2_074_partial_00_0011 : Poly :=
[
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (10, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 0. -/
theorem ep_Q2_074_partial_00_0011_valid :
    mulPoly ep_Q2_074_coefficient_00_0011
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0012 : Poly :=
[
  term ((-495 : Rat) / 769) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 12 for generator 0. -/
def ep_Q2_074_partial_00_0012 : Poly :=
[
  term ((990 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-990 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-495 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-495 : Rat) / 769) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((495 : Rat) / 769) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((495 : Rat) / 769) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((990 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-990 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 0. -/
theorem ep_Q2_074_partial_00_0012_valid :
    mulPoly ep_Q2_074_coefficient_00_0012
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0013 : Poly :=
[
  term ((-396 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 0. -/
def ep_Q2_074_partial_00_0013 : Poly :=
[
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 0. -/
theorem ep_Q2_074_partial_00_0013_valid :
    mulPoly ep_Q2_074_coefficient_00_0013
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0014 : Poly :=
[
  term ((198 : Rat) / 769) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 0. -/
def ep_Q2_074_partial_00_0014 : Poly :=
[
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 0. -/
theorem ep_Q2_074_partial_00_0014_valid :
    mulPoly ep_Q2_074_coefficient_00_0014
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0015 : Poly :=
[
  term ((-1695 : Rat) / 769) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 0. -/
def ep_Q2_074_partial_00_0015 : Poly :=
[
  term ((3390 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-3390 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1695 : Rat) / 769) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1695 : Rat) / 769) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((1695 : Rat) / 769) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((1695 : Rat) / 769) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((3390 : Rat) / 769) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-3390 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 0. -/
theorem ep_Q2_074_partial_00_0015_valid :
    mulPoly ep_Q2_074_coefficient_00_0015
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0016 : Poly :=
[
  term ((-7380 : Rat) / 769) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 16 for generator 0. -/
def ep_Q2_074_partial_00_0016 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (2, 1), (3, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 1), (5, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (2, 3), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (2, 1), (3, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (2, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 0. -/
theorem ep_Q2_074_partial_00_0016_valid :
    mulPoly ep_Q2_074_coefficient_00_0016
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0017 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 17 for generator 0. -/
def ep_Q2_074_partial_00_0017 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (2, 2), (3, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (4, 2), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (5, 3), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 3), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (3, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 0. -/
theorem ep_Q2_074_partial_00_0017_valid :
    mulPoly ep_Q2_074_coefficient_00_0017
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0018 : Poly :=
[
  term ((14760 : Rat) / 769) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 18 for generator 0. -/
def ep_Q2_074_partial_00_0018 : Poly :=
[
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (4, 3), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 0. -/
theorem ep_Q2_074_partial_00_0018_valid :
    mulPoly ep_Q2_074_coefficient_00_0018
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0019 : Poly :=
[
  term ((-44676 : Rat) / 769) [(1, 2), (10, 1), (16, 1)]
]

/-- Partial product 19 for generator 0. -/
def ep_Q2_074_partial_00_0019 : Poly :=
[
  term ((89352 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (10, 1), (16, 1)],
  term ((-89352 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-44676 : Rat) / 769) [(1, 2), (2, 2), (10, 1), (16, 1)],
  term ((-44676 : Rat) / 769) [(1, 2), (3, 2), (10, 1), (16, 1)],
  term ((44676 : Rat) / 769) [(1, 2), (4, 2), (10, 1), (16, 1)],
  term ((44676 : Rat) / 769) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((89352 : Rat) / 769) [(1, 3), (3, 1), (10, 1), (16, 1)],
  term ((-89352 : Rat) / 769) [(1, 3), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 0. -/
theorem ep_Q2_074_partial_00_0019_valid :
    mulPoly ep_Q2_074_coefficient_00_0019
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0020 : Poly :=
[
  term ((7380 : Rat) / 769) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 0. -/
def ep_Q2_074_partial_00_0020 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (15, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 2), (15, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (4, 2), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (5, 2), (15, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (15, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 0. -/
theorem ep_Q2_074_partial_00_0020_valid :
    mulPoly ep_Q2_074_coefficient_00_0020
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0021 : Poly :=
[
  term ((20328 : Rat) / 769) [(1, 2), (16, 1)]
]

/-- Partial product 21 for generator 0. -/
def ep_Q2_074_partial_00_0021 : Poly :=
[
  term ((-40656 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((40656 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((20328 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((20328 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((-20328 : Rat) / 769) [(1, 2), (4, 2), (16, 1)],
  term ((-20328 : Rat) / 769) [(1, 2), (5, 2), (16, 1)],
  term ((-40656 : Rat) / 769) [(1, 3), (3, 1), (16, 1)],
  term ((40656 : Rat) / 769) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 0. -/
theorem ep_Q2_074_partial_00_0021_valid :
    mulPoly ep_Q2_074_coefficient_00_0021
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0022 : Poly :=
[
  term ((14760 : Rat) / 769) [(1, 3), (3, 1), (16, 1)]
]

/-- Partial product 22 for generator 0. -/
def ep_Q2_074_partial_00_0022 : Poly :=
[
  term ((-29520 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (3, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (2, 2), (3, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (4, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 3), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 4), (3, 1), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 0. -/
theorem ep_Q2_074_partial_00_0022_valid :
    mulPoly ep_Q2_074_coefficient_00_0022
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0023 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 3), (5, 1), (16, 1)]
]

/-- Partial product 23 for generator 0. -/
def ep_Q2_074_partial_00_0023 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (2, 2), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 2), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (4, 2), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (5, 3), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 4), (3, 1), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 0. -/
theorem ep_Q2_074_partial_00_0023_valid :
    mulPoly ep_Q2_074_coefficient_00_0023
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0024 : Poly :=
[
  term ((864 : Rat) / 769) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 24 for generator 0. -/
def ep_Q2_074_partial_00_0024 : Poly :=
[
  term ((1728 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (10, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 1), (4, 2), (10, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 1), (5, 2), (10, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 0. -/
theorem ep_Q2_074_partial_00_0024_valid :
    mulPoly ep_Q2_074_coefficient_00_0024
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0025 : Poly :=
[
  term ((22143 : Rat) / 769) [(2, 1), (16, 1)]
]

/-- Partial product 25 for generator 0. -/
def ep_Q2_074_partial_00_0025 : Poly :=
[
  term ((44286 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-44286 : Rat) / 769) [(0, 1), (2, 2), (16, 1)],
  term ((-44286 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((44286 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term ((22143 : Rat) / 769) [(2, 1), (3, 2), (16, 1)],
  term ((-22143 : Rat) / 769) [(2, 1), (4, 2), (16, 1)],
  term ((-22143 : Rat) / 769) [(2, 1), (5, 2), (16, 1)],
  term ((22143 : Rat) / 769) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 0. -/
theorem ep_Q2_074_partial_00_0025_valid :
    mulPoly ep_Q2_074_coefficient_00_0025
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0026 : Poly :=
[
  term ((22638 : Rat) / 769) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 26 for generator 0. -/
def ep_Q2_074_partial_00_0026 : Poly :=
[
  term ((-45276 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((45276 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((45276 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-45276 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-22638 : Rat) / 769) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((-22638 : Rat) / 769) [(3, 1), (5, 3), (16, 1)],
  term ((22638 : Rat) / 769) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 0. -/
theorem ep_Q2_074_partial_00_0026_valid :
    mulPoly ep_Q2_074_coefficient_00_0026
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0027 : Poly :=
[
  term ((864 : Rat) / 769) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 0. -/
def ep_Q2_074_partial_00_0027 : Poly :=
[
  term ((-1728 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((864 : Rat) / 769) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 0. -/
theorem ep_Q2_074_partial_00_0027_valid :
    mulPoly ep_Q2_074_coefficient_00_0027
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0028 : Poly :=
[
  term ((-864 : Rat) / 769) [(3, 2), (16, 1)]
]

/-- Partial product 28 for generator 0. -/
def ep_Q2_074_partial_00_0028 : Poly :=
[
  term ((1728 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (3, 3), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 2), (3, 2), (16, 1)],
  term ((864 : Rat) / 769) [(3, 2), (4, 2), (16, 1)],
  term ((864 : Rat) / 769) [(3, 2), (5, 2), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 0. -/
theorem ep_Q2_074_partial_00_0028_valid :
    mulPoly ep_Q2_074_coefficient_00_0028
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0029 : Poly :=
[
  term ((9072 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 29 for generator 0. -/
def ep_Q2_074_partial_00_0029 : Poly :=
[
  term ((-18144 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((9072 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((9072 : Rat) / 769) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(4, 1), (5, 2), (10, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(4, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 0. -/
theorem ep_Q2_074_partial_00_0029_valid :
    mulPoly ep_Q2_074_coefficient_00_0029
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0030 : Poly :=
[
  term ((-16935 : Rat) / 769) [(4, 1), (16, 1)]
]

/-- Partial product 30 for generator 0. -/
def ep_Q2_074_partial_00_0030 : Poly :=
[
  term ((33870 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-33870 : Rat) / 769) [(0, 1), (4, 2), (16, 1)],
  term ((33870 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-33870 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-16935 : Rat) / 769) [(2, 2), (4, 1), (16, 1)],
  term ((-16935 : Rat) / 769) [(3, 2), (4, 1), (16, 1)],
  term ((16935 : Rat) / 769) [(4, 1), (5, 2), (16, 1)],
  term ((16935 : Rat) / 769) [(4, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 0. -/
theorem ep_Q2_074_partial_00_0030_valid :
    mulPoly ep_Q2_074_coefficient_00_0030
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0031 : Poly :=
[
  term ((27033 : Rat) / 769) [(10, 1), (16, 1)]
]

/-- Partial product 31 for generator 0. -/
def ep_Q2_074_partial_00_0031 : Poly :=
[
  term ((-54066 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((54066 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-54066 : Rat) / 769) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((54066 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((27033 : Rat) / 769) [(2, 2), (10, 1), (16, 1)],
  term ((27033 : Rat) / 769) [(3, 2), (10, 1), (16, 1)],
  term ((-27033 : Rat) / 769) [(4, 2), (10, 1), (16, 1)],
  term ((-27033 : Rat) / 769) [(5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 0. -/
theorem ep_Q2_074_partial_00_0031_valid :
    mulPoly ep_Q2_074_coefficient_00_0031
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0032 : Poly :=
[
  term ((63 : Rat) / 769) [(12, 1), (16, 1)]
]

/-- Partial product 32 for generator 0. -/
def ep_Q2_074_partial_00_0032 : Poly :=
[
  term ((-126 : Rat) / 769) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((126 : Rat) / 769) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((126 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((63 : Rat) / 769) [(2, 2), (12, 1), (16, 1)],
  term ((63 : Rat) / 769) [(3, 2), (12, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(4, 2), (12, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 0. -/
theorem ep_Q2_074_partial_00_0032_valid :
    mulPoly ep_Q2_074_coefficient_00_0032
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0033 : Poly :=
[
  term ((-15867 : Rat) / 1538) [(15, 2), (16, 1)]
]

/-- Partial product 33 for generator 0. -/
def ep_Q2_074_partial_00_0033 : Poly :=
[
  term ((15867 : Rat) / 769) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-15867 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((15867 : Rat) / 769) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-15867 : Rat) / 769) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-15867 : Rat) / 1538) [(2, 2), (15, 2), (16, 1)],
  term ((-15867 : Rat) / 1538) [(3, 2), (15, 2), (16, 1)],
  term ((15867 : Rat) / 1538) [(4, 2), (15, 2), (16, 1)],
  term ((15867 : Rat) / 1538) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 0. -/
theorem ep_Q2_074_partial_00_0033_valid :
    mulPoly ep_Q2_074_coefficient_00_0033
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 0. -/
def ep_Q2_074_coefficient_00_0034 : Poly :=
[
  term ((-191787 : Rat) / 6152) [(16, 1)]
]

/-- Partial product 34 for generator 0. -/
def ep_Q2_074_partial_00_0034 : Poly :=
[
  term ((191787 : Rat) / 3076) [(0, 1), (2, 1), (16, 1)],
  term ((-191787 : Rat) / 3076) [(0, 1), (4, 1), (16, 1)],
  term ((191787 : Rat) / 3076) [(1, 1), (3, 1), (16, 1)],
  term ((-191787 : Rat) / 3076) [(1, 1), (5, 1), (16, 1)],
  term ((-191787 : Rat) / 6152) [(2, 2), (16, 1)],
  term ((-191787 : Rat) / 6152) [(3, 2), (16, 1)],
  term ((191787 : Rat) / 6152) [(4, 2), (16, 1)],
  term ((191787 : Rat) / 6152) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 0. -/
theorem ep_Q2_074_partial_00_0034_valid :
    mulPoly ep_Q2_074_coefficient_00_0034
        ep_Q2_074_generator_00_0000_0034 =
      ep_Q2_074_partial_00_0034 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_00_0000_0034 : List Poly :=
[
  ep_Q2_074_partial_00_0000,
  ep_Q2_074_partial_00_0001,
  ep_Q2_074_partial_00_0002,
  ep_Q2_074_partial_00_0003,
  ep_Q2_074_partial_00_0004,
  ep_Q2_074_partial_00_0005,
  ep_Q2_074_partial_00_0006,
  ep_Q2_074_partial_00_0007,
  ep_Q2_074_partial_00_0008,
  ep_Q2_074_partial_00_0009,
  ep_Q2_074_partial_00_0010,
  ep_Q2_074_partial_00_0011,
  ep_Q2_074_partial_00_0012,
  ep_Q2_074_partial_00_0013,
  ep_Q2_074_partial_00_0014,
  ep_Q2_074_partial_00_0015,
  ep_Q2_074_partial_00_0016,
  ep_Q2_074_partial_00_0017,
  ep_Q2_074_partial_00_0018,
  ep_Q2_074_partial_00_0019,
  ep_Q2_074_partial_00_0020,
  ep_Q2_074_partial_00_0021,
  ep_Q2_074_partial_00_0022,
  ep_Q2_074_partial_00_0023,
  ep_Q2_074_partial_00_0024,
  ep_Q2_074_partial_00_0025,
  ep_Q2_074_partial_00_0026,
  ep_Q2_074_partial_00_0027,
  ep_Q2_074_partial_00_0028,
  ep_Q2_074_partial_00_0029,
  ep_Q2_074_partial_00_0030,
  ep_Q2_074_partial_00_0031,
  ep_Q2_074_partial_00_0032,
  ep_Q2_074_partial_00_0033,
  ep_Q2_074_partial_00_0034
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_00_0000_0034 : Poly :=
[
  term ((123390 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-120018 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1), (16, 1)],
  term ((990 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((3390 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-57636 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((45054 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-85761 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((54264 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (10, 1), (16, 1)],
  term ((-990 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-3390 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-45054 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((85761 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (3, 2), (16, 1)],
  term ((-44280 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (5, 2), (16, 1)],
  term ((89352 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-40656 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 3), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (3, 2), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (3, 2), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (3, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (5, 2), (16, 1)],
  term ((-89352 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((40656 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 3), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (5, 2), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (5, 2), (16, 1)],
  term ((-88560 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (3, 1), (16, 1)],
  term ((88560 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (5, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (4, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((-45276 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-43548 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-16416 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((78156 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((45276 : Rat) / 769) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((45276 : Rat) / 769) [(0, 1), (2, 1), (5, 2), (16, 1)],
  term ((-54066 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((15867 : Rat) / 769) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((191787 : Rat) / 3076) [(0, 1), (2, 1), (16, 1)],
  term ((12399 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((-24255 : Rat) / 769) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((-2811 : Rat) / 1538) [(0, 1), (2, 2), (16, 1)],
  term ((-45276 : Rat) / 769) [(0, 1), (2, 3), (16, 1)],
  term ((45276 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((10671 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((-22527 : Rat) / 769) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((85761 : Rat) / 1538) [(0, 1), (3, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(0, 1), (4, 1), (5, 2), (16, 1)],
  term ((54066 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((126 : Rat) / 769) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-15867 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-191787 : Rat) / 3076) [(0, 1), (4, 1), (16, 1)],
  term ((40671 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-153501 : Rat) / 1538) [(0, 1), (4, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(0, 1), (4, 3), (16, 1)],
  term ((22527 : Rat) / 769) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((-85761 : Rat) / 1538) [(0, 1), (5, 2), (16, 1)],
  term ((1074 : Rat) / 769) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-1074 : Rat) / 769) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((88560 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 2), (1, 2), (2, 2), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 2), (1, 2), (4, 2), (16, 1)],
  term (-150 : Rat) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((45054 : Rat) / 769) [(0, 2), (2, 1), (10, 1), (16, 1)],
  term ((-85761 : Rat) / 769) [(0, 2), (2, 1), (16, 1)],
  term ((90015 : Rat) / 769) [(0, 2), (2, 2), (16, 1)],
  term ((-537 : Rat) / 769) [(0, 2), (3, 2), (16, 1)],
  term ((-45054 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((85761 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((25335 : Rat) / 769) [(0, 2), (4, 2), (16, 1)],
  term ((537 : Rat) / 769) [(0, 2), (5, 2), (16, 1)],
  term ((1074 : Rat) / 769) [(0, 3), (2, 1), (16, 1)],
  term ((-1074 : Rat) / 769) [(0, 3), (4, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((-44286 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (10, 1), (16, 1)],
  term ((44286 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term ((-16419 : Rat) / 769) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((14733 : Rat) / 769) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((-495 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-1695 : Rat) / 769) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((33870 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((16419 : Rat) / 769) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((61695 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-54066 : Rat) / 769) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((15867 : Rat) / 769) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((191787 : Rat) / 3076) [(1, 1), (3, 1), (16, 1)],
  term ((-32271 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((-495 : Rat) / 769) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-3423 : Rat) / 769) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-14691 : Rat) / 769) [(1, 1), (3, 3), (16, 1)],
  term ((18144 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-33870 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-14733 : Rat) / 769) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term ((495 : Rat) / 769) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((1695 : Rat) / 769) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((54066 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((126 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-15867 : Rat) / 769) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-191787 : Rat) / 3076) [(1, 1), (5, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((495 : Rat) / 769) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((1695 : Rat) / 769) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-14733 : Rat) / 769) [(1, 1), (5, 3), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (2, 1), (3, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 1), (5, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (2, 2), (3, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((-44676 : Rat) / 769) [(1, 2), (2, 2), (10, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 2), (15, 2), (16, 1)],
  term ((20328 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (2, 3), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (4, 2), (5, 1), (16, 1)],
  term ((-62304 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (5, 3), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((990 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((3390 : Rat) / 769) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((-44676 : Rat) / 769) [(1, 2), (3, 2), (10, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((53166 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 3), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((44676 : Rat) / 769) [(1, 2), (4, 2), (10, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (4, 2), (15, 2), (16, 1)],
  term ((-20328 : Rat) / 769) [(1, 2), (4, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (4, 3), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-990 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-3390 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((44676 : Rat) / 769) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (5, 2), (15, 2), (16, 1)],
  term ((9138 : Rat) / 769) [(1, 2), (5, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (2, 1), (3, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (2, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (2, 2), (3, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (2, 2), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (3, 1), (4, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (4, 2), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((89352 : Rat) / 769) [(1, 3), (3, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (15, 2), (16, 1)],
  term ((-40656 : Rat) / 769) [(1, 3), (3, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 2), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (3, 3), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (4, 2), (5, 1), (16, 1)],
  term ((-89352 : Rat) / 769) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (5, 1), (15, 2), (16, 1)],
  term ((40656 : Rat) / 769) [(1, 3), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (5, 3), (16, 1)],
  term ((59040 : Rat) / 769) [(1, 4), (3, 1), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (3, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (5, 2), (16, 1)],
  term ((864 : Rat) / 769) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((22143 : Rat) / 769) [(2, 1), (3, 2), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 1), (4, 2), (10, 1), (16, 1)],
  term ((-22143 : Rat) / 769) [(2, 1), (4, 2), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 1), (5, 2), (10, 1), (16, 1)],
  term ((-22143 : Rat) / 769) [(2, 1), (5, 2), (16, 1)],
  term ((22638 : Rat) / 769) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(2, 2), (3, 2), (16, 1)],
  term ((9072 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((-16935 : Rat) / 769) [(2, 2), (4, 1), (16, 1)],
  term ((27033 : Rat) / 769) [(2, 2), (10, 1), (16, 1)],
  term ((63 : Rat) / 769) [(2, 2), (12, 1), (16, 1)],
  term ((-15867 : Rat) / 1538) [(2, 2), (15, 2), (16, 1)],
  term ((-191787 : Rat) / 6152) [(2, 2), (16, 1)],
  term ((864 : Rat) / 769) [(2, 3), (10, 1), (16, 1)],
  term ((22143 : Rat) / 769) [(2, 3), (16, 1)],
  term ((-22638 : Rat) / 769) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-22638 : Rat) / 769) [(3, 1), (5, 3), (16, 1)],
  term ((9072 : Rat) / 769) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-16935 : Rat) / 769) [(3, 2), (4, 1), (16, 1)],
  term ((864 : Rat) / 769) [(3, 2), (4, 2), (16, 1)],
  term ((864 : Rat) / 769) [(3, 2), (5, 2), (16, 1)],
  term ((27033 : Rat) / 769) [(3, 2), (10, 1), (16, 1)],
  term ((63 : Rat) / 769) [(3, 2), (12, 1), (16, 1)],
  term ((-15867 : Rat) / 1538) [(3, 2), (15, 2), (16, 1)],
  term ((-191787 : Rat) / 6152) [(3, 2), (16, 1)],
  term ((22638 : Rat) / 769) [(3, 3), (5, 1), (16, 1)],
  term ((864 : Rat) / 769) [(3, 3), (15, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 4), (16, 1)],
  term ((-9072 : Rat) / 769) [(4, 1), (5, 2), (10, 1), (16, 1)],
  term ((16935 : Rat) / 769) [(4, 1), (5, 2), (16, 1)],
  term ((-27033 : Rat) / 769) [(4, 2), (10, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(4, 2), (12, 1), (16, 1)],
  term ((15867 : Rat) / 1538) [(4, 2), (15, 2), (16, 1)],
  term ((191787 : Rat) / 6152) [(4, 2), (16, 1)],
  term ((-9072 : Rat) / 769) [(4, 3), (10, 1), (16, 1)],
  term ((16935 : Rat) / 769) [(4, 3), (16, 1)],
  term ((-27033 : Rat) / 769) [(5, 2), (10, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(5, 2), (12, 1), (16, 1)],
  term ((15867 : Rat) / 1538) [(5, 2), (15, 2), (16, 1)],
  term ((191787 : Rat) / 6152) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 0 through 34. -/
theorem ep_Q2_074_block_00_0000_0034_valid :
    checkProductSumEq ep_Q2_074_partials_00_0000_0034
      ep_Q2_074_block_00_0000_0034 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
