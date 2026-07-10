/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 25:0-16

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 25 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_25_0000_0016 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (12, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0000 : Poly :=
[
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 25. -/
def ep_Q2_074_partial_25_0000 : Poly :=
[
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 3), (7, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (7, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 3), (1, 1), (2, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 25. -/
theorem ep_Q2_074_partial_25_0000_valid :
    mulPoly ep_Q2_074_coefficient_25_0000
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0001 : Poly :=
[
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 25. -/
def ep_Q2_074_partial_25_0001 : Poly :=
[
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 3), (11, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (11, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 3), (1, 1), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 25. -/
theorem ep_Q2_074_partial_25_0001_valid :
    mulPoly ep_Q2_074_coefficient_25_0001
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0002 : Poly :=
[
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

/-- Partial product 2 for generator 25. -/
def ep_Q2_074_partial_25_0002 : Poly :=
[
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 3), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 3), (1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 25. -/
theorem ep_Q2_074_partial_25_0002_valid :
    mulPoly ep_Q2_074_coefficient_25_0002
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0003 : Poly :=
[
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 25. -/
def ep_Q2_074_partial_25_0003 : Poly :=
[
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 2), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 3), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 25. -/
theorem ep_Q2_074_partial_25_0003_valid :
    mulPoly ep_Q2_074_coefficient_25_0003
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0004 : Poly :=
[
  term ((-2997 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)]
]

/-- Partial product 4 for generator 25. -/
def ep_Q2_074_partial_25_0004 : Poly :=
[
  term ((5994 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((2997 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (12, 1), (16, 1)],
  term ((2997 : Rat) / 769) [(0, 1), (2, 3), (4, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 3), (2, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 25. -/
theorem ep_Q2_074_partial_25_0004_valid :
    mulPoly ep_Q2_074_coefficient_25_0004
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0005 : Poly :=
[
  term ((6831 : Rat) / 1538) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 5 for generator 25. -/
def ep_Q2_074_partial_25_0005 : Poly :=
[
  term ((-6831 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((6831 : Rat) / 1538) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((6831 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-6831 : Rat) / 1538) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((6831 : Rat) / 769) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-6831 : Rat) / 1538) [(0, 1), (2, 3), (16, 1)],
  term ((-6831 : Rat) / 769) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((6831 : Rat) / 1538) [(0, 3), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 25. -/
theorem ep_Q2_074_partial_25_0005_valid :
    mulPoly ep_Q2_074_coefficient_25_0005
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0006 : Poly :=
[
  term ((1296 : Rat) / 769) [(0, 1), (2, 2), (16, 1)]
]

/-- Partial product 6 for generator 25. -/
def ep_Q2_074_partial_25_0006 : Poly :=
[
  term ((-2592 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1296 : Rat) / 769) [(0, 1), (2, 2), (3, 2), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 3), (12, 1), (16, 1)],
  term ((-1296 : Rat) / 769) [(0, 1), (2, 4), (16, 1)],
  term ((-2592 : Rat) / 769) [(0, 2), (2, 2), (12, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 3), (2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 25. -/
theorem ep_Q2_074_partial_25_0006_valid :
    mulPoly ep_Q2_074_coefficient_25_0006
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0007 : Poly :=
[
  term ((999 : Rat) / 769) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 7 for generator 25. -/
def ep_Q2_074_partial_25_0007 : Poly :=
[
  term ((-1998 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((999 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((1998 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-999 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((1998 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-999 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((-1998 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((999 : Rat) / 769) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 25. -/
theorem ep_Q2_074_partial_25_0007_valid :
    mulPoly ep_Q2_074_coefficient_25_0007
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0008 : Poly :=
[
  term ((-2565 : Rat) / 1538) [(0, 1), (16, 1)]
]

/-- Partial product 8 for generator 25. -/
def ep_Q2_074_partial_25_0008 : Poly :=
[
  term ((2565 : Rat) / 769) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-2565 : Rat) / 1538) [(0, 1), (1, 2), (16, 1)],
  term ((-2565 : Rat) / 769) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((2565 : Rat) / 1538) [(0, 1), (2, 2), (16, 1)],
  term ((-2565 : Rat) / 769) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((2565 : Rat) / 1538) [(0, 1), (3, 2), (16, 1)],
  term ((2565 : Rat) / 769) [(0, 2), (12, 1), (16, 1)],
  term ((-2565 : Rat) / 1538) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 25. -/
theorem ep_Q2_074_partial_25_0008_valid :
    mulPoly ep_Q2_074_coefficient_25_0008
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0009 : Poly :=
[
  term ((11070 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)]
]

/-- Partial product 9 for generator 25. -/
def ep_Q2_074_partial_25_0009 : Poly :=
[
  term ((-22140 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 1), (3, 2), (4, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (12, 1), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 3), (4, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 3), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 4), (2, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 25. -/
theorem ep_Q2_074_partial_25_0009_valid :
    mulPoly ep_Q2_074_coefficient_25_0009
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0010 : Poly :=
[
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 1), (16, 1)]
]

/-- Partial product 10 for generator 25. -/
def ep_Q2_074_partial_25_0010 : Poly :=
[
  term ((24813 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (1, 2), (2, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 1), (3, 2), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 2), (12, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 3), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 3), (2, 1), (12, 1), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 4), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 25. -/
theorem ep_Q2_074_partial_25_0010_valid :
    mulPoly ep_Q2_074_coefficient_25_0010
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0011 : Poly :=
[
  term ((-3690 : Rat) / 769) [(0, 2), (4, 1), (16, 1)]
]

/-- Partial product 11 for generator 25. -/
def ep_Q2_074_partial_25_0011 : Poly :=
[
  term ((7380 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 3), (4, 1), (12, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 4), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 25. -/
theorem ep_Q2_074_partial_25_0011_valid :
    mulPoly ep_Q2_074_coefficient_25_0011
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0012 : Poly :=
[
  term ((8271 : Rat) / 1538) [(0, 2), (16, 1)]
]

/-- Partial product 12 for generator 25. -/
def ep_Q2_074_partial_25_0012 : Poly :=
[
  term ((-8271 : Rat) / 769) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (1, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (2, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (3, 2), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 3), (12, 1), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 25. -/
theorem ep_Q2_074_partial_25_0012_valid :
    mulPoly ep_Q2_074_coefficient_25_0012
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0013 : Poly :=
[
  term ((22140 : Rat) / 769) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 13 for generator 25. -/
def ep_Q2_074_partial_25_0013 : Poly :=
[
  term ((-44280 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (12, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (2, 1), (3, 2), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (2, 2), (12, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (2, 3), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 3), (2, 1), (13, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 4), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 25. -/
theorem ep_Q2_074_partial_25_0013_valid :
    mulPoly ep_Q2_074_coefficient_25_0013
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0014 : Poly :=
[
  term ((-7380 : Rat) / 769) [(1, 2), (16, 1)]
]

/-- Partial product 14 for generator 25. -/
def ep_Q2_074_partial_25_0014 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (1, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (13, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 25. -/
theorem ep_Q2_074_partial_25_0014_valid :
    mulPoly ep_Q2_074_coefficient_25_0014
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0015 : Poly :=
[
  term ((-63207 : Rat) / 3076) [(2, 1), (16, 1)]
]

/-- Partial product 15 for generator 25. -/
def ep_Q2_074_partial_25_0015 : Poly :=
[
  term ((63207 : Rat) / 1538) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-63207 : Rat) / 3076) [(0, 2), (2, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-63207 : Rat) / 3076) [(1, 2), (2, 1), (16, 1)],
  term ((-63207 : Rat) / 1538) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((63207 : Rat) / 3076) [(2, 1), (3, 2), (16, 1)],
  term ((-63207 : Rat) / 1538) [(2, 2), (12, 1), (16, 1)],
  term ((63207 : Rat) / 3076) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 25. -/
theorem ep_Q2_074_partial_25_0015_valid :
    mulPoly ep_Q2_074_coefficient_25_0015
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 25. -/
def ep_Q2_074_coefficient_25_0016 : Poly :=
[
  term ((21357 : Rat) / 3076) [(16, 1)]
]

/-- Partial product 16 for generator 25. -/
def ep_Q2_074_partial_25_0016 : Poly :=
[
  term ((-21357 : Rat) / 1538) [(0, 1), (12, 1), (16, 1)],
  term ((21357 : Rat) / 3076) [(0, 2), (16, 1)],
  term ((-21357 : Rat) / 1538) [(1, 1), (13, 1), (16, 1)],
  term ((21357 : Rat) / 3076) [(1, 2), (16, 1)],
  term ((21357 : Rat) / 1538) [(2, 1), (12, 1), (16, 1)],
  term ((-21357 : Rat) / 3076) [(2, 2), (16, 1)],
  term ((21357 : Rat) / 1538) [(3, 1), (13, 1), (16, 1)],
  term ((-21357 : Rat) / 3076) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 25. -/
theorem ep_Q2_074_partial_25_0016_valid :
    mulPoly ep_Q2_074_coefficient_25_0016
        ep_Q2_074_generator_25_0000_0016 =
      ep_Q2_074_partial_25_0016 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_25_0000_0016 : List Poly :=
[
  ep_Q2_074_partial_25_0000,
  ep_Q2_074_partial_25_0001,
  ep_Q2_074_partial_25_0002,
  ep_Q2_074_partial_25_0003,
  ep_Q2_074_partial_25_0004,
  ep_Q2_074_partial_25_0005,
  ep_Q2_074_partial_25_0006,
  ep_Q2_074_partial_25_0007,
  ep_Q2_074_partial_25_0008,
  ep_Q2_074_partial_25_0009,
  ep_Q2_074_partial_25_0010,
  ep_Q2_074_partial_25_0011,
  ep_Q2_074_partial_25_0012,
  ep_Q2_074_partial_25_0013,
  ep_Q2_074_partial_25_0014,
  ep_Q2_074_partial_25_0015,
  ep_Q2_074_partial_25_0016
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_25_0000_0016 : Poly :=
[
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6831 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-2592 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 3), (7, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 3), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-1998 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((2565 : Rat) / 769) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(0, 1), (1, 2), (2, 1), (12, 1), (16, 1)],
  term ((6831 : Rat) / 1538) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 1), (1, 2), (2, 2), (16, 1)],
  term ((999 : Rat) / 769) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-2565 : Rat) / 1538) [(0, 1), (1, 2), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (7, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 3), (2, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 3), (7, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((6831 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((2997 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-6831 : Rat) / 1538) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((1998 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((58077 : Rat) / 1538) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1296 : Rat) / 769) [(0, 1), (2, 2), (3, 2), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (12, 1), (16, 1)],
  term ((-999 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((6831 : Rat) / 769) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((2565 : Rat) / 1538) [(0, 1), (2, 2), (16, 1)],
  term ((2997 : Rat) / 769) [(0, 1), (2, 3), (4, 1), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 3), (12, 1), (16, 1)],
  term ((-6831 : Rat) / 1538) [(0, 1), (2, 3), (16, 1)],
  term ((-1296 : Rat) / 769) [(0, 1), (2, 4), (16, 1)],
  term ((1998 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-2565 : Rat) / 769) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((-999 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((2565 : Rat) / 1538) [(0, 1), (3, 2), (16, 1)],
  term ((-21357 : Rat) / 1538) [(0, 1), (12, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 2), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (1, 2), (2, 1), (4, 1), (16, 1)],
  term ((19467 : Rat) / 1538) [(0, 2), (1, 2), (2, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (1, 2), (4, 1), (16, 1)],
  term ((-6489 : Rat) / 1538) [(0, 2), (1, 2), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 1), (3, 2), (4, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 1), (3, 2), (16, 1)],
  term ((-1386 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((1440 : Rat) / 769) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-63207 : Rat) / 3076) [(0, 2), (2, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (12, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (16, 1)],
  term ((-27405 : Rat) / 769) [(0, 2), (2, 2), (12, 1), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (2, 2), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 3), (4, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 3), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (3, 2), (16, 1)],
  term ((-1998 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((2565 : Rat) / 769) [(0, 2), (12, 1), (16, 1)],
  term ((21357 : Rat) / 3076) [(0, 2), (16, 1)],
  term ((594 : Rat) / 769) [(0, 3), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 3), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 3), (1, 1), (7, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 3), (1, 1), (11, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 3), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 3), (2, 1), (4, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 3), (2, 1), (12, 1), (16, 1)],
  term ((6831 : Rat) / 1538) [(0, 3), (2, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 3), (2, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 3), (4, 1), (12, 1), (16, 1)],
  term ((999 : Rat) / 769) [(0, 3), (4, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 3), (12, 1), (16, 1)],
  term ((-2565 : Rat) / 1538) [(0, 3), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 4), (2, 1), (4, 1), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 4), (2, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 4), (4, 1), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 4), (16, 1)],
  term ((63207 : Rat) / 1538) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-21357 : Rat) / 1538) [(1, 1), (13, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (2, 1), (3, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-63207 : Rat) / 3076) [(1, 2), (2, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (2, 2), (12, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (2, 3), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((21357 : Rat) / 3076) [(1, 2), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 3), (2, 1), (13, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (13, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 4), (2, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 4), (16, 1)],
  term ((-63207 : Rat) / 1538) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((63207 : Rat) / 3076) [(2, 1), (3, 2), (16, 1)],
  term ((21357 : Rat) / 1538) [(2, 1), (12, 1), (16, 1)],
  term ((-63207 : Rat) / 1538) [(2, 2), (12, 1), (16, 1)],
  term ((-21357 : Rat) / 3076) [(2, 2), (16, 1)],
  term ((63207 : Rat) / 3076) [(2, 3), (16, 1)],
  term ((21357 : Rat) / 1538) [(3, 1), (13, 1), (16, 1)],
  term ((-21357 : Rat) / 3076) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 0 through 16. -/
theorem ep_Q2_074_block_25_0000_0016_valid :
    checkProductSumEq ep_Q2_074_partials_25_0000_0016
      ep_Q2_074_block_25_0000_0016 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
