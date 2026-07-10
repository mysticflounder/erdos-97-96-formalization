/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 27:0-55

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_27_0000_0055 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0000 : Poly :=
[
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 27. -/
def ep_Q2_074_partial_27_0000 : Poly :=
[
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (14, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 27. -/
theorem ep_Q2_074_partial_27_0000_valid :
    mulPoly ep_Q2_074_coefficient_27_0000
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0001 : Poly :=
[
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 27. -/
def ep_Q2_074_partial_27_0001 : Poly :=
[
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 27. -/
theorem ep_Q2_074_partial_27_0001_valid :
    mulPoly ep_Q2_074_coefficient_27_0001
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0002 : Poly :=
[
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 27. -/
def ep_Q2_074_partial_27_0002 : Poly :=
[
  term ((-2376 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((2376 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2376 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (3, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 27. -/
theorem ep_Q2_074_partial_27_0002_valid :
    mulPoly ep_Q2_074_coefficient_27_0002
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0003 : Poly :=
[
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 27. -/
def ep_Q2_074_partial_27_0003 : Poly :=
[
  term ((2376 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2376 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((2376 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (3, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 27. -/
theorem ep_Q2_074_partial_27_0003_valid :
    mulPoly ep_Q2_074_coefficient_27_0003
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0004 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 4 for generator 27. -/
def ep_Q2_074_partial_27_0004 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (4, 1), (7, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (4, 1), (7, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 27. -/
theorem ep_Q2_074_partial_27_0004_valid :
    mulPoly ep_Q2_074_coefficient_27_0004
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0005 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 27. -/
def ep_Q2_074_partial_27_0005 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (4, 1), (13, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (4, 1), (13, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 27. -/
theorem ep_Q2_074_partial_27_0005_valid :
    mulPoly ep_Q2_074_coefficient_27_0005
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0006 : Poly :=
[
  term ((-16740 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

/-- Partial product 6 for generator 27. -/
def ep_Q2_074_partial_27_0006 : Poly :=
[
  term ((-33480 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((16740 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-33480 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((16740 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (7, 1), (16, 1)],
  term ((33480 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-16740 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 27. -/
theorem ep_Q2_074_partial_27_0006_valid :
    mulPoly ep_Q2_074_coefficient_27_0006
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0007 : Poly :=
[
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 27. -/
def ep_Q2_074_partial_27_0007 : Poly :=
[
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 27. -/
theorem ep_Q2_074_partial_27_0007_valid :
    mulPoly ep_Q2_074_coefficient_27_0007
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0008 : Poly :=
[
  term ((-16542 : Rat) / 769) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 27. -/
def ep_Q2_074_partial_27_0008 : Poly :=
[
  term ((-33084 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((16542 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-33084 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((16542 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((33084 : Rat) / 769) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16542 : Rat) / 769) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 27. -/
theorem ep_Q2_074_partial_27_0008_valid :
    mulPoly ep_Q2_074_coefficient_27_0008
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0009 : Poly :=
[
  term ((-2592 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 27. -/
def ep_Q2_074_partial_27_0009 : Poly :=
[
  term ((5184 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2592 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-5184 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 1), (3, 3), (13, 1), (16, 1)],
  term ((-5184 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 27. -/
theorem ep_Q2_074_partial_27_0009_valid :
    mulPoly ep_Q2_074_coefficient_27_0009
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0010 : Poly :=
[
  term ((2997 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)]
]

/-- Partial product 10 for generator 27. -/
def ep_Q2_074_partial_27_0010 : Poly :=
[
  term ((5994 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((2997 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (14, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 1), (2, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 27. -/
theorem ep_Q2_074_partial_27_0010_valid :
    mulPoly ep_Q2_074_coefficient_27_0010
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0011 : Poly :=
[
  term ((-6831 : Rat) / 1538) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 11 for generator 27. -/
def ep_Q2_074_partial_27_0011 : Poly :=
[
  term ((-6831 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((6831 : Rat) / 1538) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((6831 : Rat) / 769) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-6831 : Rat) / 1538) [(0, 1), (2, 1), (16, 1)],
  term ((-6831 : Rat) / 769) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((6831 : Rat) / 1538) [(0, 1), (2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 27. -/
theorem ep_Q2_074_partial_27_0011_valid :
    mulPoly ep_Q2_074_coefficient_27_0011
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0012 : Poly :=
[
  term ((-1296 : Rat) / 769) [(0, 1), (2, 2), (16, 1)]
]

/-- Partial product 12 for generator 27. -/
def ep_Q2_074_partial_27_0012 : Poly :=
[
  term ((-2592 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 1), (2, 2), (3, 2), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-1296 : Rat) / 769) [(0, 1), (2, 2), (16, 1)],
  term ((-2592 : Rat) / 769) [(0, 1), (2, 3), (14, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 1), (2, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 27. -/
theorem ep_Q2_074_partial_27_0012_valid :
    mulPoly ep_Q2_074_coefficient_27_0012
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0013 : Poly :=
[
  term ((5994 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 27. -/
def ep_Q2_074_partial_27_0013 : Poly :=
[
  term ((11988 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-11988 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((11988 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (3, 3), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 27. -/
theorem ep_Q2_074_partial_27_0013_valid :
    mulPoly ep_Q2_074_coefficient_27_0013
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0014 : Poly :=
[
  term ((-7695 : Rat) / 769) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 27. -/
def ep_Q2_074_partial_27_0014 : Poly :=
[
  term ((-15390 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((7695 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((15390 : Rat) / 769) [(0, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((-15390 : Rat) / 769) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((7695 : Rat) / 769) [(0, 1), (3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 27. -/
theorem ep_Q2_074_partial_27_0014_valid :
    mulPoly ep_Q2_074_coefficient_27_0014
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0015 : Poly :=
[
  term ((-7380 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 27. -/
def ep_Q2_074_partial_27_0015 : Poly :=
[
  term ((-14760 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 27. -/
theorem ep_Q2_074_partial_27_0015_valid :
    mulPoly ep_Q2_074_coefficient_27_0015
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0016 : Poly :=
[
  term ((-2844 : Rat) / 769) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 16 for generator 27. -/
def ep_Q2_074_partial_27_0016 : Poly :=
[
  term ((-5688 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((2844 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((-5688 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((2844 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((5688 : Rat) / 769) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-2844 : Rat) / 769) [(0, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 27. -/
theorem ep_Q2_074_partial_27_0016_valid :
    mulPoly ep_Q2_074_coefficient_27_0016
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0017 : Poly :=
[
  term ((8208 : Rat) / 769) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 27. -/
def ep_Q2_074_partial_27_0017 : Poly :=
[
  term ((16416 : Rat) / 769) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8208 : Rat) / 769) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((16416 : Rat) / 769) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8208 : Rat) / 769) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-16416 : Rat) / 769) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8208 : Rat) / 769) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 27. -/
theorem ep_Q2_074_partial_27_0017_valid :
    mulPoly ep_Q2_074_coefficient_27_0017
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0018 : Poly :=
[
  term ((6669 : Rat) / 1538) [(0, 1), (16, 1)]
]

/-- Partial product 18 for generator 27. -/
def ep_Q2_074_partial_27_0018 : Poly :=
[
  term ((6669 : Rat) / 769) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-6669 : Rat) / 1538) [(0, 1), (2, 2), (16, 1)],
  term ((6669 : Rat) / 769) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-6669 : Rat) / 1538) [(0, 1), (3, 2), (16, 1)],
  term ((-6669 : Rat) / 769) [(0, 1), (14, 1), (16, 1)],
  term ((6669 : Rat) / 1538) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 27. -/
theorem ep_Q2_074_partial_27_0018_valid :
    mulPoly ep_Q2_074_coefficient_27_0018
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0019 : Poly :=
[
  term ((-11070 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)]
]

/-- Partial product 19 for generator 27. -/
def ep_Q2_074_partial_27_0019 : Poly :=
[
  term ((-22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (2, 1), (3, 2), (4, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (14, 1), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (2, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 27. -/
theorem ep_Q2_074_partial_27_0019_valid :
    mulPoly ep_Q2_074_coefficient_27_0019
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0020 : Poly :=
[
  term ((24813 : Rat) / 1538) [(0, 2), (2, 1), (16, 1)]
]

/-- Partial product 20 for generator 27. -/
def ep_Q2_074_partial_27_0020 : Poly :=
[
  term ((24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 1), (3, 2), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (2, 2), (14, 1), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 27. -/
theorem ep_Q2_074_partial_27_0020_valid :
    mulPoly ep_Q2_074_coefficient_27_0020
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0021 : Poly :=
[
  term ((-22140 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 27. -/
def ep_Q2_074_partial_27_0021 : Poly :=
[
  term ((-44280 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (3, 3), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 27. -/
theorem ep_Q2_074_partial_27_0021_valid :
    mulPoly ep_Q2_074_coefficient_27_0021
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0022 : Poly :=
[
  term ((24813 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 22 for generator 27. -/
def ep_Q2_074_partial_27_0022 : Poly :=
[
  term ((49626 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-49626 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((49626 : Rat) / 769) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 27. -/
theorem ep_Q2_074_partial_27_0022_valid :
    mulPoly ep_Q2_074_coefficient_27_0022
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0023 : Poly :=
[
  term ((3690 : Rat) / 769) [(0, 2), (4, 1), (16, 1)]
]

/-- Partial product 23 for generator 27. -/
def ep_Q2_074_partial_27_0023 : Poly :=
[
  term ((7380 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 27. -/
theorem ep_Q2_074_partial_27_0023_valid :
    mulPoly ep_Q2_074_coefficient_27_0023
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0024 : Poly :=
[
  term ((-8271 : Rat) / 1538) [(0, 2), (16, 1)]
]

/-- Partial product 24 for generator 27. -/
def ep_Q2_074_partial_27_0024 : Poly :=
[
  term ((-8271 : Rat) / 769) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (2, 2), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (3, 2), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (14, 1), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 27. -/
theorem ep_Q2_074_partial_27_0024_valid :
    mulPoly ep_Q2_074_coefficient_27_0024
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0025 : Poly :=
[
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 25 for generator 27. -/
def ep_Q2_074_partial_27_0025 : Poly :=
[
  term ((3456 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((-3456 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((3456 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 27. -/
theorem ep_Q2_074_partial_27_0025_valid :
    mulPoly ep_Q2_074_coefficient_27_0025
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0026 : Poly :=
[
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 27. -/
def ep_Q2_074_partial_27_0026 : Poly :=
[
  term ((3456 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 27. -/
theorem ep_Q2_074_partial_27_0026_valid :
    mulPoly ep_Q2_074_coefficient_27_0026
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0027 : Poly :=
[
  term ((-3600 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 27 for generator 27. -/
def ep_Q2_074_partial_27_0027 : Poly :=
[
  term ((-7200 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((3600 : Rat) / 769) [(1, 1), (2, 2), (4, 1), (7, 1), (16, 1)],
  term ((-7200 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 769) [(1, 1), (3, 2), (4, 1), (7, 1), (16, 1)],
  term ((7200 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 27. -/
theorem ep_Q2_074_partial_27_0027_valid :
    mulPoly ep_Q2_074_coefficient_27_0027
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0028 : Poly :=
[
  term ((-3996 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 27. -/
def ep_Q2_074_partial_27_0028 : Poly :=
[
  term ((-7992 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (2, 2), (4, 1), (13, 1), (16, 1)],
  term ((-7992 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (3, 2), (4, 1), (13, 1), (16, 1)],
  term ((7992 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 27. -/
theorem ep_Q2_074_partial_27_0028_valid :
    mulPoly ep_Q2_074_coefficient_27_0028
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0029 : Poly :=
[
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 27. -/
def ep_Q2_074_partial_27_0029 : Poly :=
[
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 27. -/
theorem ep_Q2_074_partial_27_0029_valid :
    mulPoly ep_Q2_074_coefficient_27_0029
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0030 : Poly :=
[
  term ((-99 : Rat) / 769) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 30 for generator 27. -/
def ep_Q2_074_partial_27_0030 : Poly :=
[
  term ((-198 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 27. -/
theorem ep_Q2_074_partial_27_0030_valid :
    mulPoly ep_Q2_074_coefficient_27_0030
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0031 : Poly :=
[
  term ((7974 : Rat) / 769) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 31 for generator 27. -/
def ep_Q2_074_partial_27_0031 : Poly :=
[
  term ((15948 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-7974 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((15948 : Rat) / 769) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7974 : Rat) / 769) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-15948 : Rat) / 769) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((7974 : Rat) / 769) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 27. -/
theorem ep_Q2_074_partial_27_0031_valid :
    mulPoly ep_Q2_074_coefficient_27_0031
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0032 : Poly :=
[
  term ((5526 : Rat) / 769) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 27. -/
def ep_Q2_074_partial_27_0032 : Poly :=
[
  term ((11052 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5526 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((11052 : Rat) / 769) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5526 : Rat) / 769) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-11052 : Rat) / 769) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((5526 : Rat) / 769) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 27. -/
theorem ep_Q2_074_partial_27_0032_valid :
    mulPoly ep_Q2_074_coefficient_27_0032
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0033 : Poly :=
[
  term ((-19947 : Rat) / 769) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 27. -/
def ep_Q2_074_partial_27_0033 : Poly :=
[
  term ((-39894 : Rat) / 769) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((19947 : Rat) / 769) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-39894 : Rat) / 769) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((19947 : Rat) / 769) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((39894 : Rat) / 769) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19947 : Rat) / 769) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 27. -/
theorem ep_Q2_074_partial_27_0033_valid :
    mulPoly ep_Q2_074_coefficient_27_0033
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0034 : Poly :=
[
  term ((-22140 : Rat) / 769) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 34 for generator 27. -/
def ep_Q2_074_partial_27_0034 : Poly :=
[
  term ((-44280 : Rat) / 769) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (2, 1), (3, 2), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (2, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (2, 2), (14, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 27. -/
theorem ep_Q2_074_partial_27_0034_valid :
    mulPoly ep_Q2_074_coefficient_27_0034
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0035 : Poly :=
[
  term ((-44280 : Rat) / 769) [(1, 2), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 27. -/
def ep_Q2_074_partial_27_0035 : Poly :=
[
  term ((-88560 : Rat) / 769) [(1, 2), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((88560 : Rat) / 769) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-88560 : Rat) / 769) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 27. -/
theorem ep_Q2_074_partial_27_0035_valid :
    mulPoly ep_Q2_074_coefficient_27_0035
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0036 : Poly :=
[
  term ((22140 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 36 for generator 27. -/
def ep_Q2_074_partial_27_0036 : Poly :=
[
  term ((44280 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (2, 2), (5, 1), (7, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 27. -/
theorem ep_Q2_074_partial_27_0036_valid :
    mulPoly ep_Q2_074_coefficient_27_0036
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0037 : Poly :=
[
  term ((-7380 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 27. -/
def ep_Q2_074_partial_27_0037 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 27. -/
theorem ep_Q2_074_partial_27_0037_valid :
    mulPoly ep_Q2_074_coefficient_27_0037
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0038 : Poly :=
[
  term ((-792 : Rat) / 769) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 27. -/
def ep_Q2_074_partial_27_0038 : Poly :=
[
  term ((-1584 : Rat) / 769) [(1, 2), (2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 27. -/
theorem ep_Q2_074_partial_27_0038_valid :
    mulPoly ep_Q2_074_coefficient_27_0038
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0039 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 39 for generator 27. -/
def ep_Q2_074_partial_27_0039 : Poly :=
[
  term ((1584 : Rat) / 769) [(1, 2), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 27. -/
theorem ep_Q2_074_partial_27_0039_valid :
    mulPoly ep_Q2_074_coefficient_27_0039
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0040 : Poly :=
[
  term ((-22140 : Rat) / 769) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 27. -/
def ep_Q2_074_partial_27_0040 : Poly :=
[
  term ((-44280 : Rat) / 769) [(1, 2), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 27. -/
theorem ep_Q2_074_partial_27_0040_valid :
    mulPoly ep_Q2_074_coefficient_27_0040
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0041 : Poly :=
[
  term ((792 : Rat) / 769) [(1, 2), (7, 2), (16, 1)]
]

/-- Partial product 41 for generator 27. -/
def ep_Q2_074_partial_27_0041 : Poly :=
[
  term ((1584 : Rat) / 769) [(1, 2), (2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (2, 2), (7, 2), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (3, 2), (7, 2), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 27. -/
theorem ep_Q2_074_partial_27_0041_valid :
    mulPoly ep_Q2_074_coefficient_27_0041
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0042 : Poly :=
[
  term ((-792 : Rat) / 769) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 42 for generator 27. -/
def ep_Q2_074_partial_27_0042 : Poly :=
[
  term ((-1584 : Rat) / 769) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 27. -/
theorem ep_Q2_074_partial_27_0042_valid :
    mulPoly ep_Q2_074_coefficient_27_0042
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0043 : Poly :=
[
  term ((5733 : Rat) / 769) [(1, 2), (16, 1)]
]

/-- Partial product 43 for generator 27. -/
def ep_Q2_074_partial_27_0043 : Poly :=
[
  term ((11466 : Rat) / 769) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-5733 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((11466 : Rat) / 769) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-5733 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((-11466 : Rat) / 769) [(1, 2), (14, 1), (16, 1)],
  term ((5733 : Rat) / 769) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 27. -/
theorem ep_Q2_074_partial_27_0043_valid :
    mulPoly ep_Q2_074_coefficient_27_0043
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0044 : Poly :=
[
  term ((14760 : Rat) / 769) [(1, 3), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 27. -/
def ep_Q2_074_partial_27_0044 : Poly :=
[
  term ((29520 : Rat) / 769) [(1, 3), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (2, 2), (15, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (3, 1), (15, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 2), (15, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 27. -/
theorem ep_Q2_074_partial_27_0044_valid :
    mulPoly ep_Q2_074_coefficient_27_0044
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0045 : Poly :=
[
  term ((63207 : Rat) / 3076) [(2, 1), (16, 1)]
]

/-- Partial product 45 for generator 27. -/
def ep_Q2_074_partial_27_0045 : Poly :=
[
  term ((63207 : Rat) / 1538) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-63207 : Rat) / 3076) [(2, 1), (3, 2), (16, 1)],
  term ((-63207 : Rat) / 1538) [(2, 1), (14, 1), (16, 1)],
  term ((63207 : Rat) / 3076) [(2, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(2, 2), (14, 1), (16, 1)],
  term ((-63207 : Rat) / 3076) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 27. -/
theorem ep_Q2_074_partial_27_0045_valid :
    mulPoly ep_Q2_074_coefficient_27_0045
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0046 : Poly :=
[
  term ((-864 : Rat) / 769) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 46 for generator 27. -/
def ep_Q2_074_partial_27_0046 : Poly :=
[
  term ((-1728 : Rat) / 769) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 1), (7, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 769) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 27. -/
theorem ep_Q2_074_partial_27_0046_valid :
    mulPoly ep_Q2_074_coefficient_27_0046
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0047 : Poly :=
[
  term ((63207 : Rat) / 1538) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 27. -/
def ep_Q2_074_partial_27_0047 : Poly :=
[
  term ((63207 : Rat) / 769) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-63207 : Rat) / 1538) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-63207 : Rat) / 769) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(3, 1), (13, 1), (16, 1)],
  term ((63207 : Rat) / 769) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-63207 : Rat) / 1538) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 27. -/
theorem ep_Q2_074_partial_27_0047_valid :
    mulPoly ep_Q2_074_coefficient_27_0047
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0048 : Poly :=
[
  term ((-3690 : Rat) / 769) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 27. -/
def ep_Q2_074_partial_27_0048 : Poly :=
[
  term ((-7380 : Rat) / 769) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((3690 : Rat) / 769) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 27. -/
theorem ep_Q2_074_partial_27_0048_valid :
    mulPoly ep_Q2_074_coefficient_27_0048
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0049 : Poly :=
[
  term ((-126 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 49 for generator 27. -/
def ep_Q2_074_partial_27_0049 : Poly :=
[
  term ((-252 : Rat) / 769) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((126 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((-252 : Rat) / 769) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 769) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((252 : Rat) / 769) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 27. -/
theorem ep_Q2_074_partial_27_0049_valid :
    mulPoly ep_Q2_074_coefficient_27_0049
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0050 : Poly :=
[
  term ((-2583 : Rat) / 1538) [(4, 1), (16, 1)]
]

/-- Partial product 50 for generator 27. -/
def ep_Q2_074_partial_27_0050 : Poly :=
[
  term ((-2583 : Rat) / 769) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((2583 : Rat) / 1538) [(2, 2), (4, 1), (16, 1)],
  term ((-2583 : Rat) / 769) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((2583 : Rat) / 1538) [(3, 2), (4, 1), (16, 1)],
  term ((2583 : Rat) / 769) [(4, 1), (14, 1), (16, 1)],
  term ((-2583 : Rat) / 1538) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 27. -/
theorem ep_Q2_074_partial_27_0050_valid :
    mulPoly ep_Q2_074_coefficient_27_0050
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0051 : Poly :=
[
  term ((5901 : Rat) / 769) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 51 for generator 27. -/
def ep_Q2_074_partial_27_0051 : Poly :=
[
  term ((11802 : Rat) / 769) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5901 : Rat) / 769) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((11802 : Rat) / 769) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5901 : Rat) / 769) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-11802 : Rat) / 769) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((5901 : Rat) / 769) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 27. -/
theorem ep_Q2_074_partial_27_0051_valid :
    mulPoly ep_Q2_074_coefficient_27_0051
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0052 : Poly :=
[
  term ((-126 : Rat) / 769) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 52 for generator 27. -/
def ep_Q2_074_partial_27_0052 : Poly :=
[
  term ((-252 : Rat) / 769) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((126 : Rat) / 769) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-252 : Rat) / 769) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 769) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((252 : Rat) / 769) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 27. -/
theorem ep_Q2_074_partial_27_0052_valid :
    mulPoly ep_Q2_074_coefficient_27_0052
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0053 : Poly :=
[
  term ((6801 : Rat) / 769) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 27. -/
def ep_Q2_074_partial_27_0053 : Poly :=
[
  term ((13602 : Rat) / 769) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6801 : Rat) / 769) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((13602 : Rat) / 769) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-6801 : Rat) / 769) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-13602 : Rat) / 769) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((6801 : Rat) / 769) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 27. -/
theorem ep_Q2_074_partial_27_0053_valid :
    mulPoly ep_Q2_074_coefficient_27_0053
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0054 : Poly :=
[
  term ((52359 : Rat) / 1538) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 27. -/
def ep_Q2_074_partial_27_0054 : Poly :=
[
  term ((52359 : Rat) / 769) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52359 : Rat) / 1538) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((52359 : Rat) / 769) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-52359 : Rat) / 1538) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-52359 : Rat) / 769) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((52359 : Rat) / 1538) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 27. -/
theorem ep_Q2_074_partial_27_0054_valid :
    mulPoly ep_Q2_074_coefficient_27_0054
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 27. -/
def ep_Q2_074_coefficient_27_0055 : Poly :=
[
  term ((-33261 : Rat) / 6152) [(16, 1)]
]

/-- Partial product 55 for generator 27. -/
def ep_Q2_074_partial_27_0055 : Poly :=
[
  term ((-33261 : Rat) / 3076) [(2, 1), (14, 1), (16, 1)],
  term ((33261 : Rat) / 6152) [(2, 2), (16, 1)],
  term ((-33261 : Rat) / 3076) [(3, 1), (15, 1), (16, 1)],
  term ((33261 : Rat) / 6152) [(3, 2), (16, 1)],
  term ((33261 : Rat) / 3076) [(14, 1), (16, 1)],
  term ((-33261 : Rat) / 6152) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 27. -/
theorem ep_Q2_074_partial_27_0055_valid :
    mulPoly ep_Q2_074_coefficient_27_0055
        ep_Q2_074_generator_27_0000_0055 =
      ep_Q2_074_partial_27_0055 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_27_0000_0055 : List Poly :=
[
  ep_Q2_074_partial_27_0000,
  ep_Q2_074_partial_27_0001,
  ep_Q2_074_partial_27_0002,
  ep_Q2_074_partial_27_0003,
  ep_Q2_074_partial_27_0004,
  ep_Q2_074_partial_27_0005,
  ep_Q2_074_partial_27_0006,
  ep_Q2_074_partial_27_0007,
  ep_Q2_074_partial_27_0008,
  ep_Q2_074_partial_27_0009,
  ep_Q2_074_partial_27_0010,
  ep_Q2_074_partial_27_0011,
  ep_Q2_074_partial_27_0012,
  ep_Q2_074_partial_27_0013,
  ep_Q2_074_partial_27_0014,
  ep_Q2_074_partial_27_0015,
  ep_Q2_074_partial_27_0016,
  ep_Q2_074_partial_27_0017,
  ep_Q2_074_partial_27_0018,
  ep_Q2_074_partial_27_0019,
  ep_Q2_074_partial_27_0020,
  ep_Q2_074_partial_27_0021,
  ep_Q2_074_partial_27_0022,
  ep_Q2_074_partial_27_0023,
  ep_Q2_074_partial_27_0024,
  ep_Q2_074_partial_27_0025,
  ep_Q2_074_partial_27_0026,
  ep_Q2_074_partial_27_0027,
  ep_Q2_074_partial_27_0028,
  ep_Q2_074_partial_27_0029,
  ep_Q2_074_partial_27_0030,
  ep_Q2_074_partial_27_0031,
  ep_Q2_074_partial_27_0032,
  ep_Q2_074_partial_27_0033,
  ep_Q2_074_partial_27_0034,
  ep_Q2_074_partial_27_0035,
  ep_Q2_074_partial_27_0036,
  ep_Q2_074_partial_27_0037,
  ep_Q2_074_partial_27_0038,
  ep_Q2_074_partial_27_0039,
  ep_Q2_074_partial_27_0040,
  ep_Q2_074_partial_27_0041,
  ep_Q2_074_partial_27_0042,
  ep_Q2_074_partial_27_0043,
  ep_Q2_074_partial_27_0044,
  ep_Q2_074_partial_27_0045,
  ep_Q2_074_partial_27_0046,
  ep_Q2_074_partial_27_0047,
  ep_Q2_074_partial_27_0048,
  ep_Q2_074_partial_27_0049,
  ep_Q2_074_partial_27_0050,
  ep_Q2_074_partial_27_0051,
  ep_Q2_074_partial_27_0052,
  ep_Q2_074_partial_27_0053,
  ep_Q2_074_partial_27_0054,
  ep_Q2_074_partial_27_0055
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_27_0000_0055 : Poly :=
[
  term ((-2376 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((2376 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32292 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-33084 : Rat) / 769) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (4, 1), (7, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (4, 1), (13, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (14, 1), (16, 1)],
  term ((16740 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (7, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((16542 : Rat) / 769) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((594 : Rat) / 769) [(0, 1), (1, 1), (2, 3), (7, 1), (16, 1)],
  term ((-594 : Rat) / 769) [(0, 1), (1, 1), (2, 3), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2376 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-33480 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2376 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33084 : Rat) / 769) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (4, 1), (7, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (4, 1), (13, 1), (16, 1)],
  term ((-2376 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((16740 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (7, 1), (16, 1)],
  term ((2376 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((16542 : Rat) / 769) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((1188 : Rat) / 769) [(0, 1), (1, 1), (3, 3), (7, 1), (13, 1), (16, 1)],
  term ((-1188 : Rat) / 769) [(0, 1), (1, 1), (3, 3), (11, 1), (13, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((33480 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-16740 : Rat) / 769) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((396 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((33084 : Rat) / 769) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16542 : Rat) / 769) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((11988 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-10206 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2592 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-6831 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-5184 : Rat) / 769) [(0, 1), (2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((6831 : Rat) / 1538) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 1), (3, 3), (13, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11682 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((2997 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((16416 : Rat) / 769) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((13500 : Rat) / 769) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-6831 : Rat) / 1538) [(0, 1), (2, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-5184 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((7695 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-2592 : Rat) / 769) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 1), (2, 2), (3, 2), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (14, 1), (16, 1)],
  term ((2844 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (16, 1)],
  term ((-8208 : Rat) / 769) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4239 : Rat) / 769) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-9261 : Rat) / 1538) [(0, 1), (2, 2), (16, 1)],
  term ((2592 : Rat) / 769) [(0, 1), (2, 3), (3, 1), (13, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 1), (2, 3), (4, 1), (16, 1)],
  term ((-2592 : Rat) / 769) [(0, 1), (2, 3), (14, 1), (16, 1)],
  term ((6831 : Rat) / 1538) [(0, 1), (2, 3), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 1), (2, 4), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-11988 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-5688 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((16416 : Rat) / 769) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((15390 : Rat) / 769) [(0, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((6669 : Rat) / 769) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((11988 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2844 : Rat) / 769) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((-8208 : Rat) / 769) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-15390 : Rat) / 769) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6669 : Rat) / 1538) [(0, 1), (3, 2), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 1), (3, 3), (4, 1), (13, 1), (16, 1)],
  term ((7695 : Rat) / 769) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5688 : Rat) / 769) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-2844 : Rat) / 769) [(0, 1), (4, 1), (16, 1)],
  term ((-16416 : Rat) / 769) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8208 : Rat) / 769) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6669 : Rat) / 769) [(0, 1), (14, 1), (16, 1)],
  term ((6669 : Rat) / 1538) [(0, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((49626 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 1), (3, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-11070 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-33084 : Rat) / 769) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((24813 : Rat) / 1538) [(0, 2), (2, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (14, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (2, 2), (14, 1), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (2, 2), (16, 1)],
  term ((11070 : Rat) / 769) [(0, 2), (2, 3), (4, 1), (16, 1)],
  term ((-24813 : Rat) / 1538) [(0, 2), (2, 3), (16, 1)],
  term ((44280 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-49626 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((24813 : Rat) / 769) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-8271 : Rat) / 769) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(0, 2), (3, 2), (4, 1), (16, 1)],
  term ((49626 : Rat) / 769) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((8271 : Rat) / 1538) [(0, 2), (3, 2), (16, 1)],
  term ((22140 : Rat) / 769) [(0, 2), (3, 3), (4, 1), (13, 1), (16, 1)],
  term ((-24813 : Rat) / 769) [(0, 2), (3, 3), (13, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(0, 2), (4, 1), (16, 1)],
  term ((8271 : Rat) / 769) [(0, 2), (14, 1), (16, 1)],
  term ((-8271 : Rat) / 1538) [(0, 2), (16, 1)],
  term ((3456 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-7200 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-7992 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((12492 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((7596 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-39894 : Rat) / 769) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 769) [(1, 1), (2, 2), (4, 1), (7, 1), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (2, 2), (4, 1), (13, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((3456 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (14, 1), (16, 1)],
  term ((-7974 : Rat) / 769) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((3456 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5526 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((19947 : Rat) / 769) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 3), (7, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((-7200 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7992 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-396 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((15948 : Rat) / 769) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((11052 : Rat) / 769) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39894 : Rat) / 769) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((3600 : Rat) / 769) [(1, 1), (3, 2), (4, 1), (7, 1), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (3, 2), (4, 1), (13, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 769) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-7974 : Rat) / 769) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-5526 : Rat) / 769) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((19947 : Rat) / 769) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((7200 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((7992 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3996 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((396 : Rat) / 769) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-198 : Rat) / 769) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((198 : Rat) / 769) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-99 : Rat) / 769) [(1, 1), (5, 1), (16, 1)],
  term ((-15948 : Rat) / 769) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((7974 : Rat) / 769) [(1, 1), (7, 1), (16, 1)],
  term ((-11052 : Rat) / 769) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((5526 : Rat) / 769) [(1, 1), (13, 1), (16, 1)],
  term ((39894 : Rat) / 769) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19947 : Rat) / 769) [(1, 1), (15, 1), (16, 1)],
  term ((-88560 : Rat) / 769) [(1, 2), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (2, 1), (3, 2), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((55746 : Rat) / 769) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (2, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (2, 2), (5, 1), (7, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (2, 2), (7, 2), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (2, 2), (14, 1), (16, 1)],
  term ((-5733 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (2, 3), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((88560 : Rat) / 769) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((11466 : Rat) / 769) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (3, 2), (5, 1), (7, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (3, 2), (7, 2), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-88560 : Rat) / 769) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5733 : Rat) / 769) [(1, 2), (3, 2), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (3, 3), (13, 1), (16, 1)],
  term ((-44280 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((22140 : Rat) / 769) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((44280 : Rat) / 769) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22140 : Rat) / 769) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 769) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((792 : Rat) / 769) [(1, 2), (7, 2), (16, 1)],
  term ((1584 : Rat) / 769) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-792 : Rat) / 769) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11466 : Rat) / 769) [(1, 2), (14, 1), (16, 1)],
  term ((5733 : Rat) / 769) [(1, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (2, 2), (15, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 3), (3, 1), (15, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 2), (15, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((63207 : Rat) / 769) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-63207 : Rat) / 3076) [(2, 1), (3, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 769) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2583 : Rat) / 769) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((11802 : Rat) / 769) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-252 : Rat) / 769) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((13602 : Rat) / 769) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((52359 : Rat) / 769) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-159675 : Rat) / 3076) [(2, 1), (14, 1), (16, 1)],
  term ((63207 : Rat) / 3076) [(2, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-63207 : Rat) / 1538) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((2583 : Rat) / 1538) [(2, 2), (4, 1), (16, 1)],
  term ((-5901 : Rat) / 769) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((126 : Rat) / 769) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-6801 : Rat) / 769) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-52359 : Rat) / 1538) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(2, 2), (14, 1), (16, 1)],
  term ((33261 : Rat) / 6152) [(2, 2), (16, 1)],
  term ((-63207 : Rat) / 3076) [(2, 3), (16, 1)],
  term ((-7380 : Rat) / 769) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-252 : Rat) / 769) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2583 : Rat) / 769) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((11802 : Rat) / 769) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 769) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((13602 : Rat) / 769) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((52359 : Rat) / 769) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-864 : Rat) / 769) [(3, 1), (7, 1), (16, 1)],
  term ((-63207 : Rat) / 769) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(3, 1), (13, 1), (16, 1)],
  term ((-33261 : Rat) / 3076) [(3, 1), (15, 1), (16, 1)],
  term ((3690 : Rat) / 769) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 769) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((2583 : Rat) / 1538) [(3, 2), (4, 1), (16, 1)],
  term ((-5901 : Rat) / 769) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((126 : Rat) / 769) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-6801 : Rat) / 769) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-55815 : Rat) / 1538) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((63207 : Rat) / 769) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((33261 : Rat) / 6152) [(3, 2), (16, 1)],
  term ((864 : Rat) / 769) [(3, 3), (7, 1), (16, 1)],
  term ((-63207 : Rat) / 1538) [(3, 3), (13, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3690 : Rat) / 769) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 769) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(4, 1), (10, 1), (16, 1)],
  term ((2583 : Rat) / 769) [(4, 1), (14, 1), (16, 1)],
  term ((-2583 : Rat) / 1538) [(4, 1), (16, 1)],
  term ((-11802 : Rat) / 769) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((5901 : Rat) / 769) [(5, 1), (7, 1), (16, 1)],
  term ((252 : Rat) / 769) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(5, 1), (11, 1), (16, 1)],
  term ((-13602 : Rat) / 769) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((6801 : Rat) / 769) [(5, 1), (15, 1), (16, 1)],
  term ((-52359 : Rat) / 769) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((52359 : Rat) / 1538) [(7, 1), (15, 1), (16, 1)],
  term ((33261 : Rat) / 3076) [(14, 1), (16, 1)],
  term ((-33261 : Rat) / 6152) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 0 through 55. -/
theorem ep_Q2_074_block_27_0000_0055_valid :
    checkProductSumEq ep_Q2_074_partials_27_0000_0055
      ep_Q2_074_block_27_0000_0055 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
