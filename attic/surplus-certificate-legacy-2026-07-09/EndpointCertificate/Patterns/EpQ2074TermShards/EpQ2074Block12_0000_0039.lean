/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 12:0-39

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 12 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_12_0000_0039 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (4, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (5, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0000 : Poly :=
[
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 12. -/
def ep_Q2_074_partial_12_0000 : Poly :=
[
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 3), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 3), (1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem ep_Q2_074_partial_12_0000_valid :
    mulPoly ep_Q2_074_coefficient_12_0000
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0001 : Poly :=
[
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 12. -/
def ep_Q2_074_partial_12_0001 : Poly :=
[
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 3), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem ep_Q2_074_partial_12_0001_valid :
    mulPoly ep_Q2_074_coefficient_12_0001
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0002 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)]
]

/-- Partial product 2 for generator 12. -/
def ep_Q2_074_partial_12_0002 : Poly :=
[
  term ((59040 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 4), (2, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 3), (1, 2), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem ep_Q2_074_partial_12_0002_valid :
    mulPoly ep_Q2_074_coefficient_12_0002
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0003 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)]
]

/-- Partial product 3 for generator 12. -/
def ep_Q2_074_partial_12_0003 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 4), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 2), (1, 2), (4, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 3), (1, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem ep_Q2_074_partial_12_0003_valid :
    mulPoly ep_Q2_074_coefficient_12_0003
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0004 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (10, 1), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def ep_Q2_074_partial_12_0004 : Poly :=
[
  term ((59040 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 4), (10, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 3), (1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem ep_Q2_074_partial_12_0004_valid :
    mulPoly ep_Q2_074_coefficient_12_0004
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0005 : Poly :=
[
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (16, 1)]
]

/-- Partial product 5 for generator 12. -/
def ep_Q2_074_partial_12_0005 : Poly :=
[
  term ((-59040 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 4), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 3), (1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem ep_Q2_074_partial_12_0005_valid :
    mulPoly ep_Q2_074_coefficient_12_0005
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0006 : Poly :=
[
  term ((-39831 : Rat) / 769) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def ep_Q2_074_partial_12_0006 : Poly :=
[
  term ((79662 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((-39831 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-79662 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((39831 : Rat) / 769) [(0, 1), (2, 1), (16, 1)],
  term ((79662 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-39831 : Rat) / 769) [(0, 3), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem ep_Q2_074_partial_12_0006_valid :
    mulPoly ep_Q2_074_coefficient_12_0006
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0007 : Poly :=
[
  term ((22638 : Rat) / 769) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 7 for generator 12. -/
def ep_Q2_074_partial_12_0007 : Poly :=
[
  term ((-45276 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-22638 : Rat) / 769) [(0, 1), (4, 1), (16, 1)],
  term ((45276 : Rat) / 769) [(0, 1), (4, 2), (16, 1)],
  term ((-45276 : Rat) / 769) [(0, 2), (4, 2), (16, 1)],
  term ((22638 : Rat) / 769) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem ep_Q2_074_partial_12_0007_valid :
    mulPoly ep_Q2_074_coefficient_12_0007
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0008 : Poly :=
[
  term ((-27288 : Rat) / 769) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def ep_Q2_074_partial_12_0008 : Poly :=
[
  term ((54576 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((27288 : Rat) / 769) [(0, 1), (10, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(0, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem ep_Q2_074_partial_12_0008_valid :
    mulPoly ep_Q2_074_coefficient_12_0008
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0009 : Poly :=
[
  term ((25860 : Rat) / 769) [(0, 1), (16, 1)]
]

/-- Partial product 9 for generator 12. -/
def ep_Q2_074_partial_12_0009 : Poly :=
[
  term ((-51720 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((25860 : Rat) / 769) [(0, 1), (1, 2), (16, 1)],
  term ((51720 : Rat) / 769) [(0, 1), (4, 1), (16, 1)],
  term ((-25860 : Rat) / 769) [(0, 1), (16, 1)],
  term ((-51720 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((25860 : Rat) / 769) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem ep_Q2_074_partial_12_0009_valid :
    mulPoly ep_Q2_074_coefficient_12_0009
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0010 : Poly :=
[
  term ((2427 : Rat) / 769) [(0, 2), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def ep_Q2_074_partial_12_0010 : Poly :=
[
  term ((-4854 : Rat) / 769) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((2427 : Rat) / 769) [(0, 2), (1, 2), (16, 1)],
  term ((4854 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((-2427 : Rat) / 769) [(0, 2), (16, 1)],
  term ((-4854 : Rat) / 769) [(0, 3), (4, 1), (16, 1)],
  term ((2427 : Rat) / 769) [(0, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem ep_Q2_074_partial_12_0010_valid :
    mulPoly ep_Q2_074_coefficient_12_0010
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0011 : Poly :=
[
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 11 for generator 12. -/
def ep_Q2_074_partial_12_0011 : Poly :=
[
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 3), (2, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem ep_Q2_074_partial_12_0011_valid :
    mulPoly ep_Q2_074_coefficient_12_0011
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0012 : Poly :=
[
  term ((396 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 12. -/
def ep_Q2_074_partial_12_0012 : Poly :=
[
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 3), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem ep_Q2_074_partial_12_0012_valid :
    mulPoly ep_Q2_074_coefficient_12_0012
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0013 : Poly :=
[
  term ((-16419 : Rat) / 769) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 13 for generator 12. -/
def ep_Q2_074_partial_12_0013 : Poly :=
[
  term ((32838 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-16419 : Rat) / 769) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-32838 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((16419 : Rat) / 769) [(1, 1), (3, 1), (16, 1)],
  term ((32838 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-16419 : Rat) / 769) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem ep_Q2_074_partial_12_0013_valid :
    mulPoly ep_Q2_074_coefficient_12_0013
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0014 : Poly :=
[
  term ((-99 : Rat) / 769) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 14 for generator 12. -/
def ep_Q2_074_partial_12_0014 : Poly :=
[
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (7, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem ep_Q2_074_partial_12_0014_valid :
    mulPoly ep_Q2_074_coefficient_12_0014
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0015 : Poly :=
[
  term ((-564 : Rat) / 769) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 12. -/
def ep_Q2_074_partial_12_0015 : Poly :=
[
  term ((1128 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-564 : Rat) / 769) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-1128 : Rat) / 769) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((564 : Rat) / 769) [(1, 1), (15, 1), (16, 1)],
  term ((1128 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-564 : Rat) / 769) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem ep_Q2_074_partial_12_0015_valid :
    mulPoly ep_Q2_074_coefficient_12_0015
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0016 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def ep_Q2_074_partial_12_0016 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 4), (2, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem ep_Q2_074_partial_12_0016_valid :
    mulPoly ep_Q2_074_coefficient_12_0016
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0017 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 17 for generator 12. -/
def ep_Q2_074_partial_12_0017 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 4), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem ep_Q2_074_partial_12_0017_valid :
    mulPoly ep_Q2_074_coefficient_12_0017
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0018 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 18 for generator 12. -/
def ep_Q2_074_partial_12_0018 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 2), (4, 2), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 4), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem ep_Q2_074_partial_12_0018_valid :
    mulPoly ep_Q2_074_coefficient_12_0018
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0019 : Poly :=
[
  term ((14760 : Rat) / 769) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 19 for generator 12. -/
def ep_Q2_074_partial_12_0019 : Poly :=
[
  term ((-29520 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 2), (4, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 4), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem ep_Q2_074_partial_12_0019_valid :
    mulPoly ep_Q2_074_coefficient_12_0019
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0020 : Poly :=
[
  term ((7380 : Rat) / 769) [(1, 2), (4, 2), (16, 1)]
]

/-- Partial product 20 for generator 12. -/
def ep_Q2_074_partial_12_0020 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 3), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (1, 2), (4, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (4, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (4, 3), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (4, 2), (5, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 4), (4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem ep_Q2_074_partial_12_0020_valid :
    mulPoly ep_Q2_074_coefficient_12_0020
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0021 : Poly :=
[
  term ((7380 : Rat) / 769) [(1, 2), (5, 2), (16, 1)]
]

/-- Partial product 21 for generator 12. -/
def ep_Q2_074_partial_12_0021 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (5, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (1, 2), (5, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (5, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (5, 3), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 4), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem ep_Q2_074_partial_12_0021_valid :
    mulPoly ep_Q2_074_coefficient_12_0021
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0022 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 2), (10, 1), (16, 1)]
]

/-- Partial product 22 for generator 12. -/
def ep_Q2_074_partial_12_0022 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 2), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem ep_Q2_074_partial_12_0022_valid :
    mulPoly ep_Q2_074_coefficient_12_0022
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0023 : Poly :=
[
  term ((-7380 : Rat) / 769) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 12. -/
def ep_Q2_074_partial_12_0023 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (15, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (5, 1), (15, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem ep_Q2_074_partial_12_0023_valid :
    mulPoly ep_Q2_074_coefficient_12_0023
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0024 : Poly :=
[
  term ((12915 : Rat) / 769) [(1, 2), (16, 1)]
]

/-- Partial product 24 for generator 12. -/
def ep_Q2_074_partial_12_0024 : Poly :=
[
  term ((-25830 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((12915 : Rat) / 769) [(0, 2), (1, 2), (16, 1)],
  term ((25830 : Rat) / 769) [(1, 2), (4, 1), (16, 1)],
  term ((-12915 : Rat) / 769) [(1, 2), (16, 1)],
  term ((-25830 : Rat) / 769) [(1, 3), (5, 1), (16, 1)],
  term ((12915 : Rat) / 769) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem ep_Q2_074_partial_12_0024_valid :
    mulPoly ep_Q2_074_coefficient_12_0024
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0025 : Poly :=
[
  term ((14760 : Rat) / 769) [(1, 3), (3, 1), (16, 1)]
]

/-- Partial product 25 for generator 12. -/
def ep_Q2_074_partial_12_0025 : Poly :=
[
  term ((-29520 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (4, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 2), (1, 3), (3, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (3, 1), (4, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (3, 1), (5, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 5), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem ep_Q2_074_partial_12_0025_valid :
    mulPoly ep_Q2_074_coefficient_12_0025
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0026 : Poly :=
[
  term ((13566 : Rat) / 769) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 26 for generator 12. -/
def ep_Q2_074_partial_12_0026 : Poly :=
[
  term ((-27132 : Rat) / 769) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((13566 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-27132 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(2, 1), (4, 1), (16, 1)],
  term ((27132 : Rat) / 769) [(2, 1), (4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem ep_Q2_074_partial_12_0026_valid :
    mulPoly ep_Q2_074_coefficient_12_0026
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0027 : Poly :=
[
  term ((13983 : Rat) / 769) [(2, 1), (16, 1)]
]

/-- Partial product 27 for generator 12. -/
def ep_Q2_074_partial_12_0027 : Poly :=
[
  term ((-27966 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((13983 : Rat) / 769) [(0, 2), (2, 1), (16, 1)],
  term ((-27966 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term ((13983 : Rat) / 769) [(1, 2), (2, 1), (16, 1)],
  term ((27966 : Rat) / 769) [(2, 1), (4, 1), (16, 1)],
  term ((-13983 : Rat) / 769) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem ep_Q2_074_partial_12_0027_valid :
    mulPoly ep_Q2_074_coefficient_12_0027
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0028 : Poly :=
[
  term ((-864 : Rat) / 769) [(2, 2), (16, 1)]
]

/-- Partial product 28 for generator 12. -/
def ep_Q2_074_partial_12_0028 : Poly :=
[
  term ((1728 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 2), (2, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(2, 2), (4, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem ep_Q2_074_partial_12_0028_valid :
    mulPoly ep_Q2_074_coefficient_12_0028
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0029 : Poly :=
[
  term ((13566 : Rat) / 769) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 29 for generator 12. -/
def ep_Q2_074_partial_12_0029 : Poly :=
[
  term ((-27132 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-27132 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((13566 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((27132 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem ep_Q2_074_partial_12_0029_valid :
    mulPoly ep_Q2_074_coefficient_12_0029
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0030 : Poly :=
[
  term ((864 : Rat) / 769) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 12. -/
def ep_Q2_074_partial_12_0030 : Poly :=
[
  term ((-1728 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 769) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem ep_Q2_074_partial_12_0030_valid :
    mulPoly ep_Q2_074_coefficient_12_0030
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0031 : Poly :=
[
  term ((-864 : Rat) / 769) [(3, 2), (16, 1)]
]

/-- Partial product 31 for generator 12. -/
def ep_Q2_074_partial_12_0031 : Poly :=
[
  term ((1728 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 2), (3, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(3, 2), (4, 1), (16, 1)],
  term ((864 : Rat) / 769) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem ep_Q2_074_partial_12_0031_valid :
    mulPoly ep_Q2_074_coefficient_12_0031
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0032 : Poly :=
[
  term ((11232 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 32 for generator 12. -/
def ep_Q2_074_partial_12_0032 : Poly :=
[
  term ((-22464 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((11232 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((11232 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-11232 : Rat) / 769) [(4, 1), (10, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(4, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem ep_Q2_074_partial_12_0032_valid :
    mulPoly ep_Q2_074_coefficient_12_0032
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0033 : Poly :=
[
  term ((-16935 : Rat) / 769) [(4, 1), (16, 1)]
]

/-- Partial product 33 for generator 12. -/
def ep_Q2_074_partial_12_0033 : Poly :=
[
  term ((33870 : Rat) / 769) [(0, 1), (4, 2), (16, 1)],
  term ((-16935 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((33870 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-16935 : Rat) / 769) [(1, 2), (4, 1), (16, 1)],
  term ((16935 : Rat) / 769) [(4, 1), (16, 1)],
  term ((-33870 : Rat) / 769) [(4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem ep_Q2_074_partial_12_0033_valid :
    mulPoly ep_Q2_074_coefficient_12_0033
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0034 : Poly :=
[
  term ((-12399 : Rat) / 1538) [(4, 2), (16, 1)]
]

/-- Partial product 34 for generator 12. -/
def ep_Q2_074_partial_12_0034 : Poly :=
[
  term ((12399 : Rat) / 769) [(0, 1), (4, 3), (16, 1)],
  term ((-12399 : Rat) / 1538) [(0, 2), (4, 2), (16, 1)],
  term ((12399 : Rat) / 769) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-12399 : Rat) / 1538) [(1, 2), (4, 2), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem ep_Q2_074_partial_12_0034_valid :
    mulPoly ep_Q2_074_coefficient_12_0034
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0035 : Poly :=
[
  term ((-12399 : Rat) / 1538) [(5, 2), (16, 1)]
]

/-- Partial product 35 for generator 12. -/
def ep_Q2_074_partial_12_0035 : Poly :=
[
  term ((12399 : Rat) / 769) [(0, 1), (4, 1), (5, 2), (16, 1)],
  term ((-12399 : Rat) / 1538) [(0, 2), (5, 2), (16, 1)],
  term ((12399 : Rat) / 769) [(1, 1), (5, 3), (16, 1)],
  term ((-12399 : Rat) / 1538) [(1, 2), (5, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 1), (5, 2), (16, 1)],
  term ((12399 : Rat) / 1538) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem ep_Q2_074_partial_12_0035_valid :
    mulPoly ep_Q2_074_coefficient_12_0035
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0036 : Poly :=
[
  term ((16056 : Rat) / 769) [(10, 1), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def ep_Q2_074_partial_12_0036 : Poly :=
[
  term ((-32112 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((16056 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((-32112 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((16056 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((32112 : Rat) / 769) [(4, 1), (10, 1), (16, 1)],
  term ((-16056 : Rat) / 769) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem ep_Q2_074_partial_12_0036_valid :
    mulPoly ep_Q2_074_coefficient_12_0036
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0037 : Poly :=
[
  term ((63 : Rat) / 769) [(12, 1), (16, 1)]
]

/-- Partial product 37 for generator 12. -/
def ep_Q2_074_partial_12_0037 : Poly :=
[
  term ((-126 : Rat) / 769) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((63 : Rat) / 769) [(0, 2), (12, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((63 : Rat) / 769) [(1, 2), (12, 1), (16, 1)],
  term ((126 : Rat) / 769) [(4, 1), (12, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem ep_Q2_074_partial_12_0037_valid :
    mulPoly ep_Q2_074_coefficient_12_0037
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0038 : Poly :=
[
  term ((11859 : Rat) / 1538) [(15, 2), (16, 1)]
]

/-- Partial product 38 for generator 12. -/
def ep_Q2_074_partial_12_0038 : Poly :=
[
  term ((-11859 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((11859 : Rat) / 1538) [(0, 2), (15, 2), (16, 1)],
  term ((-11859 : Rat) / 769) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((11859 : Rat) / 1538) [(1, 2), (15, 2), (16, 1)],
  term ((11859 : Rat) / 769) [(4, 1), (15, 2), (16, 1)],
  term ((-11859 : Rat) / 1538) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem ep_Q2_074_partial_12_0038_valid :
    mulPoly ep_Q2_074_coefficient_12_0038
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def ep_Q2_074_coefficient_12_0039 : Poly :=
[
  term ((-107661 : Rat) / 6152) [(16, 1)]
]

/-- Partial product 39 for generator 12. -/
def ep_Q2_074_partial_12_0039 : Poly :=
[
  term ((107661 : Rat) / 3076) [(0, 1), (4, 1), (16, 1)],
  term ((-107661 : Rat) / 6152) [(0, 2), (16, 1)],
  term ((107661 : Rat) / 3076) [(1, 1), (5, 1), (16, 1)],
  term ((-107661 : Rat) / 6152) [(1, 2), (16, 1)],
  term ((-107661 : Rat) / 3076) [(4, 1), (16, 1)],
  term ((107661 : Rat) / 6152) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem ep_Q2_074_partial_12_0039_valid :
    mulPoly ep_Q2_074_coefficient_12_0039
        ep_Q2_074_generator_12_0000_0039 =
      ep_Q2_074_partial_12_0039 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_12_0000_0039 : List Poly :=
[
  ep_Q2_074_partial_12_0000,
  ep_Q2_074_partial_12_0001,
  ep_Q2_074_partial_12_0002,
  ep_Q2_074_partial_12_0003,
  ep_Q2_074_partial_12_0004,
  ep_Q2_074_partial_12_0005,
  ep_Q2_074_partial_12_0006,
  ep_Q2_074_partial_12_0007,
  ep_Q2_074_partial_12_0008,
  ep_Q2_074_partial_12_0009,
  ep_Q2_074_partial_12_0010,
  ep_Q2_074_partial_12_0011,
  ep_Q2_074_partial_12_0012,
  ep_Q2_074_partial_12_0013,
  ep_Q2_074_partial_12_0014,
  ep_Q2_074_partial_12_0015,
  ep_Q2_074_partial_12_0016,
  ep_Q2_074_partial_12_0017,
  ep_Q2_074_partial_12_0018,
  ep_Q2_074_partial_12_0019,
  ep_Q2_074_partial_12_0020,
  ep_Q2_074_partial_12_0021,
  ep_Q2_074_partial_12_0022,
  ep_Q2_074_partial_12_0023,
  ep_Q2_074_partial_12_0024,
  ep_Q2_074_partial_12_0025,
  ep_Q2_074_partial_12_0026,
  ep_Q2_074_partial_12_0027,
  ep_Q2_074_partial_12_0028,
  ep_Q2_074_partial_12_0029,
  ep_Q2_074_partial_12_0030,
  ep_Q2_074_partial_12_0031,
  ep_Q2_074_partial_12_0032,
  ep_Q2_074_partial_12_0033,
  ep_Q2_074_partial_12_0034,
  ep_Q2_074_partial_12_0035,
  ep_Q2_074_partial_12_0036,
  ep_Q2_074_partial_12_0037,
  ep_Q2_074_partial_12_0038,
  ep_Q2_074_partial_12_0039
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_12_0000_0039 : Poly :=
[
  term ((792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((79662 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((32838 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-45276 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((990 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((1128 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-51720 : Rat) / 769) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 2), (16, 1)],
  term ((-69351 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (5, 2), (16, 1)],
  term ((88560 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-47472 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (10, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 2), (4, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 2), (4, 3), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-56808 : Rat) / 769) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((55380 : Rat) / 769) [(0, 1), (1, 2), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 3), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 4), (2, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 4), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 4), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 4), (16, 1)],
  term ((-107628 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-27132 : Rat) / 769) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((39831 : Rat) / 769) [(0, 1), (2, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((-27132 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((12399 : Rat) / 769) [(0, 1), (4, 1), (5, 2), (16, 1)],
  term ((-86688 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-11859 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((223989 : Rat) / 3076) [(0, 1), (4, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((79146 : Rat) / 769) [(0, 1), (4, 2), (16, 1)],
  term ((12399 : Rat) / 769) [(0, 1), (4, 3), (16, 1)],
  term ((27288 : Rat) / 769) [(0, 1), (10, 1), (16, 1)],
  term ((-25860 : Rat) / 769) [(0, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-16419 : Rat) / 769) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-4854 : Rat) / 769) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-564 : Rat) / 769) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-73800 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-73800 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (10, 1), (16, 1)],
  term ((73800 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)],
  term ((36900 : Rat) / 769) [(0, 2), (1, 2), (4, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (1, 2), (5, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 2), (10, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((15342 : Rat) / 769) [(0, 2), (1, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 2), (1, 3), (3, 1), (16, 1)],
  term ((93228 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((13983 : Rat) / 769) [(0, 2), (2, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 2), (2, 2), (16, 1)],
  term ((13566 : Rat) / 769) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 2), (3, 2), (16, 1)],
  term ((65808 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-63801 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((-102951 : Rat) / 1538) [(0, 2), (4, 2), (16, 1)],
  term ((-12399 : Rat) / 1538) [(0, 2), (5, 2), (16, 1)],
  term ((16056 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((63 : Rat) / 769) [(0, 2), (12, 1), (16, 1)],
  term ((11859 : Rat) / 1538) [(0, 2), (15, 2), (16, 1)],
  term ((-127077 : Rat) / 6152) [(0, 2), (16, 1)],
  term ((396 : Rat) / 769) [(0, 3), (1, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 3), (1, 1), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 3), (1, 2), (2, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 3), (1, 2), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 3), (1, 2), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 3), (1, 2), (16, 1)],
  term ((-39831 : Rat) / 769) [(0, 3), (2, 1), (16, 1)],
  term ((17784 : Rat) / 769) [(0, 3), (4, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(0, 3), (10, 1), (16, 1)],
  term ((25860 : Rat) / 769) [(0, 3), (16, 1)],
  term ((2427 : Rat) / 769) [(0, 4), (16, 1)],
  term ((-27132 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-27966 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-32838 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-27132 : Rat) / 769) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((16419 : Rat) / 769) [(1, 1), (3, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((33870 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-1128 : Rat) / 769) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((12399 : Rat) / 769) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-32112 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-11859 : Rat) / 769) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((107661 : Rat) / 3076) [(1, 1), (5, 1), (16, 1)],
  term ((12399 : Rat) / 769) [(1, 1), (5, 3), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (7, 1), (16, 1)],
  term ((564 : Rat) / 769) [(1, 1), (15, 1), (16, 1)],
  term ((28326 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((13983 : Rat) / 769) [(1, 2), (2, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((61164 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((864 : Rat) / 769) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((-3528 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-5865 : Rat) / 769) [(1, 2), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 2), (4, 2), (10, 1), (16, 1)],
  term ((31881 : Rat) / 1538) [(1, 2), (4, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (4, 3), (16, 1)],
  term ((198 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((1128 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-27159 : Rat) / 1538) [(1, 2), (5, 2), (16, 1)],
  term ((30816 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((63 : Rat) / 769) [(1, 2), (12, 1), (16, 1)],
  term ((26619 : Rat) / 1538) [(1, 2), (15, 2), (16, 1)],
  term ((-210981 : Rat) / 6152) [(1, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 3), (2, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 3), (2, 1), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (3, 1), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((-31179 : Rat) / 769) [(1, 3), (3, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (4, 2), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (5, 1), (15, 2), (16, 1)],
  term ((-25830 : Rat) / 769) [(1, 3), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (5, 3), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 3), (7, 1), (16, 1)],
  term ((-564 : Rat) / 769) [(1, 3), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 4), (2, 1), (4, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 4), (3, 1), (5, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 4), (4, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 4), (4, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 4), (4, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 4), (5, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 4), (10, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 4), (15, 2), (16, 1)],
  term ((12915 : Rat) / 769) [(1, 4), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 5), (3, 1), (16, 1)],
  term ((14400 : Rat) / 769) [(2, 1), (4, 1), (16, 1)],
  term ((27132 : Rat) / 769) [(2, 1), (4, 2), (16, 1)],
  term ((-13983 : Rat) / 769) [(2, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(2, 2), (4, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 2), (16, 1)],
  term ((27132 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(3, 1), (5, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(3, 2), (4, 1), (16, 1)],
  term ((864 : Rat) / 769) [(3, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 1), (5, 2), (16, 1)],
  term ((20880 : Rat) / 769) [(4, 1), (10, 1), (16, 1)],
  term ((126 : Rat) / 769) [(4, 1), (12, 1), (16, 1)],
  term ((11859 : Rat) / 769) [(4, 1), (15, 2), (16, 1)],
  term ((-39921 : Rat) / 3076) [(4, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(4, 2), (10, 1), (16, 1)],
  term ((-55341 : Rat) / 1538) [(4, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 3), (16, 1)],
  term ((12399 : Rat) / 1538) [(5, 2), (16, 1)],
  term ((-16056 : Rat) / 769) [(10, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(12, 1), (16, 1)],
  term ((-11859 : Rat) / 1538) [(15, 2), (16, 1)],
  term ((107661 : Rat) / 6152) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 39. -/
theorem ep_Q2_074_block_12_0000_0039_valid :
    checkProductSumEq ep_Q2_074_partials_12_0000_0039
      ep_Q2_074_block_12_0000_0039 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
