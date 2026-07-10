/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_064, term block 15:0-39

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_064`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2064TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_064`. -/
def ep_Q2_064_generator_15_0000_0039 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0000 : Poly :=
[
  term (-81 : Rat) []
]

/-- Partial product 0 for generator 15. -/
def ep_Q2_064_partial_15_0000 : Poly :=
[
  term (-81 : Rat) [],
  term (-162 : Rat) [(2, 1), (6, 1)],
  term (81 : Rat) [(2, 2)],
  term (-162 : Rat) [(3, 1), (7, 1)],
  term (81 : Rat) [(3, 2)],
  term (162 : Rat) [(6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem ep_Q2_064_partial_15_0000_valid :
    mulPoly ep_Q2_064_coefficient_15_0000
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0001 : Poly :=
[
  term ((135 : Rat) / 2) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 1 for generator 15. -/
def ep_Q2_064_partial_15_0001 : Poly :=
[
  term (135 : Rat) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-135 : Rat) / 2) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term (135 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-135 : Rat) / 2) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term (-135 : Rat) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((135 : Rat) / 2) [(0, 1), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem ep_Q2_064_partial_15_0001_valid :
    mulPoly ep_Q2_064_coefficient_15_0001
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0002 : Poly :=
[
  term (-72 : Rat) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 2 for generator 15. -/
def ep_Q2_064_partial_15_0002 : Poly :=
[
  term (-144 : Rat) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term (72 : Rat) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term (-144 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term (72 : Rat) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term (144 : Rat) [(0, 1), (1, 1), (6, 1), (13, 1)],
  term (-72 : Rat) [(0, 1), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem ep_Q2_064_partial_15_0002_valid :
    mulPoly ep_Q2_064_coefficient_15_0002
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0003 : Poly :=
[
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 3 for generator 15. -/
def ep_Q2_064_partial_15_0003 : Poly :=
[
  term (9 : Rat) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term (9 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term (-9 : Rat) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem ep_Q2_064_partial_15_0003_valid :
    mulPoly ep_Q2_064_coefficient_15_0003
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0004 : Poly :=
[
  term ((-405 : Rat) / 4) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 4 for generator 15. -/
def ep_Q2_064_partial_15_0004 : Poly :=
[
  term ((-405 : Rat) / 2) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 1)],
  term ((405 : Rat) / 4) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((-405 : Rat) / 2) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((405 : Rat) / 4) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((405 : Rat) / 2) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((-405 : Rat) / 4) [(0, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem ep_Q2_064_partial_15_0004_valid :
    mulPoly ep_Q2_064_coefficient_15_0004
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0005 : Poly :=
[
  term (108 : Rat) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 5 for generator 15. -/
def ep_Q2_064_partial_15_0005 : Poly :=
[
  term (216 : Rat) [(0, 1), (2, 1), (5, 1), (6, 1), (13, 1)],
  term (-108 : Rat) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term (216 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term (-108 : Rat) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term (-216 : Rat) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term (108 : Rat) [(0, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem ep_Q2_064_partial_15_0005_valid :
    mulPoly ep_Q2_064_coefficient_15_0005
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0006 : Poly :=
[
  term ((-27 : Rat) / 4) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 6 for generator 15. -/
def ep_Q2_064_partial_15_0006 : Poly :=
[
  term ((-27 : Rat) / 2) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1)],
  term ((27 : Rat) / 4) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((27 : Rat) / 4) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((27 : Rat) / 2) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-27 : Rat) / 4) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem ep_Q2_064_partial_15_0006_valid :
    mulPoly ep_Q2_064_coefficient_15_0006
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0007 : Poly :=
[
  term (18 : Rat) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def ep_Q2_064_partial_15_0007 : Poly :=
[
  term (36 : Rat) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem ep_Q2_064_partial_15_0007_valid :
    mulPoly ep_Q2_064_coefficient_15_0007
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0008 : Poly :=
[
  term (18 : Rat) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 15. -/
def ep_Q2_064_partial_15_0008 : Poly :=
[
  term (36 : Rat) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem ep_Q2_064_partial_15_0008_valid :
    mulPoly ep_Q2_064_coefficient_15_0008
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0009 : Poly :=
[
  term (9 : Rat) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def ep_Q2_064_partial_15_0009 : Poly :=
[
  term (18 : Rat) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term (18 : Rat) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem ep_Q2_064_partial_15_0009_valid :
    mulPoly ep_Q2_064_coefficient_15_0009
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0010 : Poly :=
[
  term ((405 : Rat) / 4) [(1, 1), (11, 1)]
]

/-- Partial product 10 for generator 15. -/
def ep_Q2_064_partial_15_0010 : Poly :=
[
  term ((405 : Rat) / 2) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-405 : Rat) / 4) [(1, 1), (2, 2), (11, 1)],
  term ((405 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-405 : Rat) / 4) [(1, 1), (3, 2), (11, 1)],
  term ((-405 : Rat) / 2) [(1, 1), (6, 1), (11, 1)],
  term ((405 : Rat) / 4) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem ep_Q2_064_partial_15_0010_valid :
    mulPoly ep_Q2_064_coefficient_15_0010
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0011 : Poly :=
[
  term (-90 : Rat) [(1, 1), (13, 1)]
]

/-- Partial product 11 for generator 15. -/
def ep_Q2_064_partial_15_0011 : Poly :=
[
  term (-180 : Rat) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term (90 : Rat) [(1, 1), (2, 2), (13, 1)],
  term (-180 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term (90 : Rat) [(1, 1), (3, 2), (13, 1)],
  term (180 : Rat) [(1, 1), (6, 1), (13, 1)],
  term (-90 : Rat) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem ep_Q2_064_partial_15_0011_valid :
    mulPoly ep_Q2_064_coefficient_15_0011
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0012 : Poly :=
[
  term ((27 : Rat) / 4) [(1, 1), (15, 1)]
]

/-- Partial product 12 for generator 15. -/
def ep_Q2_064_partial_15_0012 : Poly :=
[
  term ((27 : Rat) / 2) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-27 : Rat) / 4) [(1, 1), (2, 2), (15, 1)],
  term ((27 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-27 : Rat) / 4) [(1, 1), (3, 2), (15, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (6, 1), (15, 1)],
  term ((27 : Rat) / 4) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem ep_Q2_064_partial_15_0012_valid :
    mulPoly ep_Q2_064_coefficient_15_0012
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0013 : Poly :=
[
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def ep_Q2_064_partial_15_0013 : Poly :=
[
  term (18 : Rat) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term (18 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem ep_Q2_064_partial_15_0013_valid :
    mulPoly ep_Q2_064_coefficient_15_0013
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0014 : Poly :=
[
  term ((39645 : Rat) / 16) [(3, 1), (11, 1)]
]

/-- Partial product 14 for generator 15. -/
def ep_Q2_064_partial_15_0014 : Poly :=
[
  term ((39645 : Rat) / 8) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-39645 : Rat) / 16) [(2, 2), (3, 1), (11, 1)],
  term ((-39645 : Rat) / 8) [(3, 1), (6, 1), (11, 1)],
  term ((39645 : Rat) / 16) [(3, 1), (11, 1)],
  term ((39645 : Rat) / 8) [(3, 2), (7, 1), (11, 1)],
  term ((-39645 : Rat) / 16) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem ep_Q2_064_partial_15_0014_valid :
    mulPoly ep_Q2_064_coefficient_15_0014
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0015 : Poly :=
[
  term (-2643 : Rat) [(3, 1), (13, 1)]
]

/-- Partial product 15 for generator 15. -/
def ep_Q2_064_partial_15_0015 : Poly :=
[
  term (-5286 : Rat) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term (2643 : Rat) [(2, 2), (3, 1), (13, 1)],
  term (5286 : Rat) [(3, 1), (6, 1), (13, 1)],
  term (-2643 : Rat) [(3, 1), (13, 1)],
  term (-5286 : Rat) [(3, 2), (7, 1), (13, 1)],
  term (2643 : Rat) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem ep_Q2_064_partial_15_0015_valid :
    mulPoly ep_Q2_064_coefficient_15_0015
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0016 : Poly :=
[
  term ((70827 : Rat) / 16) [(3, 1), (15, 1)]
]

/-- Partial product 16 for generator 15. -/
def ep_Q2_064_partial_15_0016 : Poly :=
[
  term ((70827 : Rat) / 8) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-70827 : Rat) / 16) [(2, 2), (3, 1), (15, 1)],
  term ((-70827 : Rat) / 8) [(3, 1), (6, 1), (15, 1)],
  term ((70827 : Rat) / 16) [(3, 1), (15, 1)],
  term ((70827 : Rat) / 8) [(3, 2), (7, 1), (15, 1)],
  term ((-70827 : Rat) / 16) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem ep_Q2_064_partial_15_0016_valid :
    mulPoly ep_Q2_064_coefficient_15_0016
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0017 : Poly :=
[
  term ((-122445 : Rat) / 16) [(5, 1), (11, 1)]
]

/-- Partial product 17 for generator 15. -/
def ep_Q2_064_partial_15_0017 : Poly :=
[
  term ((-122445 : Rat) / 8) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((122445 : Rat) / 16) [(2, 2), (5, 1), (11, 1)],
  term ((-122445 : Rat) / 8) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((122445 : Rat) / 16) [(3, 2), (5, 1), (11, 1)],
  term ((122445 : Rat) / 8) [(5, 1), (6, 1), (11, 1)],
  term ((-122445 : Rat) / 16) [(5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem ep_Q2_064_partial_15_0017_valid :
    mulPoly ep_Q2_064_coefficient_15_0017
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0018 : Poly :=
[
  term (8163 : Rat) [(5, 1), (13, 1)]
]

/-- Partial product 18 for generator 15. -/
def ep_Q2_064_partial_15_0018 : Poly :=
[
  term (16326 : Rat) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term (-8163 : Rat) [(2, 2), (5, 1), (13, 1)],
  term (16326 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term (-8163 : Rat) [(3, 2), (5, 1), (13, 1)],
  term (-16326 : Rat) [(5, 1), (6, 1), (13, 1)],
  term (8163 : Rat) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem ep_Q2_064_partial_15_0018_valid :
    mulPoly ep_Q2_064_coefficient_15_0018
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0019 : Poly :=
[
  term ((-9603 : Rat) / 16) [(5, 1), (15, 1)]
]

/-- Partial product 19 for generator 15. -/
def ep_Q2_064_partial_15_0019 : Poly :=
[
  term ((-9603 : Rat) / 8) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((9603 : Rat) / 16) [(2, 2), (5, 1), (15, 1)],
  term ((-9603 : Rat) / 8) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((9603 : Rat) / 16) [(3, 2), (5, 1), (15, 1)],
  term ((9603 : Rat) / 8) [(5, 1), (6, 1), (15, 1)],
  term ((-9603 : Rat) / 16) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem ep_Q2_064_partial_15_0019_valid :
    mulPoly ep_Q2_064_coefficient_15_0019
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0020 : Poly :=
[
  term (-16 : Rat) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 15. -/
def ep_Q2_064_partial_15_0020 : Poly :=
[
  term (-32 : Rat) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem ep_Q2_064_partial_15_0020_valid :
    mulPoly ep_Q2_064_coefficient_15_0020
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0021 : Poly :=
[
  term ((42615 : Rat) / 4) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 21 for generator 15. -/
def ep_Q2_064_partial_15_0021 : Poly :=
[
  term ((42615 : Rat) / 2) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 4) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((42615 : Rat) / 2) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 4) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((42615 : Rat) / 4) [(6, 1), (11, 1), (15, 1)],
  term ((-42615 : Rat) / 2) [(6, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem ep_Q2_064_partial_15_0021_valid :
    mulPoly ep_Q2_064_coefficient_15_0021
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0022 : Poly :=
[
  term (-11364 : Rat) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 22 for generator 15. -/
def ep_Q2_064_partial_15_0022 : Poly :=
[
  term (-22728 : Rat) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term (11364 : Rat) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term (-22728 : Rat) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term (11364 : Rat) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term (-11364 : Rat) [(6, 1), (13, 1), (15, 1)],
  term (22728 : Rat) [(6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem ep_Q2_064_partial_15_0022_valid :
    mulPoly ep_Q2_064_coefficient_15_0022
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0023 : Poly :=
[
  term ((2841 : Rat) / 4) [(6, 1), (15, 2)]
]

/-- Partial product 23 for generator 15. -/
def ep_Q2_064_partial_15_0023 : Poly :=
[
  term ((2841 : Rat) / 2) [(2, 1), (6, 2), (15, 2)],
  term ((-2841 : Rat) / 4) [(2, 2), (6, 1), (15, 2)],
  term ((2841 : Rat) / 2) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-2841 : Rat) / 4) [(3, 2), (6, 1), (15, 2)],
  term ((2841 : Rat) / 4) [(6, 1), (15, 2)],
  term ((-2841 : Rat) / 2) [(6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem ep_Q2_064_partial_15_0023_valid :
    mulPoly ep_Q2_064_coefficient_15_0023
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0024 : Poly :=
[
  term (405 : Rat) [(7, 1), (11, 1)]
]

/-- Partial product 24 for generator 15. -/
def ep_Q2_064_partial_15_0024 : Poly :=
[
  term (810 : Rat) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term (-405 : Rat) [(2, 2), (7, 1), (11, 1)],
  term (810 : Rat) [(3, 1), (7, 2), (11, 1)],
  term (-405 : Rat) [(3, 2), (7, 1), (11, 1)],
  term (-810 : Rat) [(6, 1), (7, 1), (11, 1)],
  term (405 : Rat) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem ep_Q2_064_partial_15_0024_valid :
    mulPoly ep_Q2_064_coefficient_15_0024
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0025 : Poly :=
[
  term (-432 : Rat) [(7, 1), (13, 1)]
]

/-- Partial product 25 for generator 15. -/
def ep_Q2_064_partial_15_0025 : Poly :=
[
  term (-864 : Rat) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term (432 : Rat) [(2, 2), (7, 1), (13, 1)],
  term (-864 : Rat) [(3, 1), (7, 2), (13, 1)],
  term (432 : Rat) [(3, 2), (7, 1), (13, 1)],
  term (864 : Rat) [(6, 1), (7, 1), (13, 1)],
  term (-432 : Rat) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem ep_Q2_064_partial_15_0025_valid :
    mulPoly ep_Q2_064_coefficient_15_0025
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0026 : Poly :=
[
  term (27 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 26 for generator 15. -/
def ep_Q2_064_partial_15_0026 : Poly :=
[
  term (54 : Rat) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term (-27 : Rat) [(2, 2), (7, 1), (15, 1)],
  term (54 : Rat) [(3, 1), (7, 2), (15, 1)],
  term (-27 : Rat) [(3, 2), (7, 1), (15, 1)],
  term (-54 : Rat) [(6, 1), (7, 1), (15, 1)],
  term (27 : Rat) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem ep_Q2_064_partial_15_0026_valid :
    mulPoly ep_Q2_064_coefficient_15_0026
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0027 : Poly :=
[
  term ((13215 : Rat) / 8) [(9, 1), (11, 1)]
]

/-- Partial product 27 for generator 15. -/
def ep_Q2_064_partial_15_0027 : Poly :=
[
  term ((13215 : Rat) / 4) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-13215 : Rat) / 8) [(2, 2), (9, 1), (11, 1)],
  term ((13215 : Rat) / 4) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-13215 : Rat) / 8) [(3, 2), (9, 1), (11, 1)],
  term ((-13215 : Rat) / 4) [(6, 1), (9, 1), (11, 1)],
  term ((13215 : Rat) / 8) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem ep_Q2_064_partial_15_0027_valid :
    mulPoly ep_Q2_064_coefficient_15_0027
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0028 : Poly :=
[
  term (-1762 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 28 for generator 15. -/
def ep_Q2_064_partial_15_0028 : Poly :=
[
  term (-3524 : Rat) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term (1762 : Rat) [(2, 2), (9, 1), (13, 1)],
  term (-3524 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term (1762 : Rat) [(3, 2), (9, 1), (13, 1)],
  term (3524 : Rat) [(6, 1), (9, 1), (13, 1)],
  term (-1762 : Rat) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem ep_Q2_064_partial_15_0028_valid :
    mulPoly ep_Q2_064_coefficient_15_0028
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0029 : Poly :=
[
  term ((881 : Rat) / 8) [(9, 1), (15, 1)]
]

/-- Partial product 29 for generator 15. -/
def ep_Q2_064_partial_15_0029 : Poly :=
[
  term ((881 : Rat) / 4) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-881 : Rat) / 8) [(2, 2), (9, 1), (15, 1)],
  term ((881 : Rat) / 4) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-881 : Rat) / 8) [(3, 2), (9, 1), (15, 1)],
  term ((-881 : Rat) / 4) [(6, 1), (9, 1), (15, 1)],
  term ((881 : Rat) / 8) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem ep_Q2_064_partial_15_0029_valid :
    mulPoly ep_Q2_064_coefficient_15_0029
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0030 : Poly :=
[
  term ((-42975 : Rat) / 4) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 30 for generator 15. -/
def ep_Q2_064_partial_15_0030 : Poly :=
[
  term ((-42975 : Rat) / 2) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((42975 : Rat) / 2) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem ep_Q2_064_partial_15_0030_valid :
    mulPoly ep_Q2_064_coefficient_15_0030
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0031 : Poly :=
[
  term ((7095 : Rat) / 4) [(11, 1), (13, 1)]
]

/-- Partial product 31 for generator 15. -/
def ep_Q2_064_partial_15_0031 : Poly :=
[
  term ((7095 : Rat) / 2) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-7095 : Rat) / 4) [(2, 2), (11, 1), (13, 1)],
  term ((7095 : Rat) / 2) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-7095 : Rat) / 4) [(3, 2), (11, 1), (13, 1)],
  term ((-7095 : Rat) / 2) [(6, 1), (11, 1), (13, 1)],
  term ((7095 : Rat) / 4) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem ep_Q2_064_partial_15_0031_valid :
    mulPoly ep_Q2_064_coefficient_15_0031
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0032 : Poly :=
[
  term ((-87687 : Rat) / 16) [(11, 1), (15, 1)]
]

/-- Partial product 32 for generator 15. -/
def ep_Q2_064_partial_15_0032 : Poly :=
[
  term ((-87687 : Rat) / 8) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((87687 : Rat) / 16) [(2, 2), (11, 1), (15, 1)],
  term ((-87687 : Rat) / 8) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((87687 : Rat) / 16) [(3, 2), (11, 1), (15, 1)],
  term ((87687 : Rat) / 8) [(6, 1), (11, 1), (15, 1)],
  term ((-87687 : Rat) / 16) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem ep_Q2_064_partial_15_0032_valid :
    mulPoly ep_Q2_064_coefficient_15_0032
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0033 : Poly :=
[
  term ((27 : Rat) / 2) [(11, 2)]
]

/-- Partial product 33 for generator 15. -/
def ep_Q2_064_partial_15_0033 : Poly :=
[
  term (27 : Rat) [(2, 1), (6, 1), (11, 2)],
  term ((-27 : Rat) / 2) [(2, 2), (11, 2)],
  term (27 : Rat) [(3, 1), (7, 1), (11, 2)],
  term ((-27 : Rat) / 2) [(3, 2), (11, 2)],
  term (-27 : Rat) [(6, 1), (11, 2)],
  term ((27 : Rat) / 2) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem ep_Q2_064_partial_15_0033_valid :
    mulPoly ep_Q2_064_coefficient_15_0033
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0034 : Poly :=
[
  term (11460 : Rat) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 34 for generator 15. -/
def ep_Q2_064_partial_15_0034 : Poly :=
[
  term (22920 : Rat) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term (-11460 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term (22920 : Rat) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term (-11460 : Rat) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term (-22920 : Rat) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term (11460 : Rat) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem ep_Q2_064_partial_15_0034_valid :
    mulPoly ep_Q2_064_coefficient_15_0034
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0035 : Poly :=
[
  term ((-2865 : Rat) / 4) [(12, 1), (15, 2)]
]

/-- Partial product 35 for generator 15. -/
def ep_Q2_064_partial_15_0035 : Poly :=
[
  term ((-2865 : Rat) / 2) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((2865 : Rat) / 4) [(2, 2), (12, 1), (15, 2)],
  term ((-2865 : Rat) / 2) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((2865 : Rat) / 4) [(3, 2), (12, 1), (15, 2)],
  term ((2865 : Rat) / 2) [(6, 1), (12, 1), (15, 2)],
  term ((-2865 : Rat) / 4) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem ep_Q2_064_partial_15_0035_valid :
    mulPoly ep_Q2_064_coefficient_15_0035
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0036 : Poly :=
[
  term ((-17893 : Rat) / 4) [(13, 1), (15, 1)]
]

/-- Partial product 36 for generator 15. -/
def ep_Q2_064_partial_15_0036 : Poly :=
[
  term ((-17893 : Rat) / 2) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((17893 : Rat) / 4) [(2, 2), (13, 1), (15, 1)],
  term ((-17893 : Rat) / 2) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((17893 : Rat) / 4) [(3, 2), (13, 1), (15, 1)],
  term ((17893 : Rat) / 2) [(6, 1), (13, 1), (15, 1)],
  term ((-17893 : Rat) / 4) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem ep_Q2_064_partial_15_0036_valid :
    mulPoly ep_Q2_064_coefficient_15_0036
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0037 : Poly :=
[
  term ((-15819 : Rat) / 8) [(13, 2)]
]

/-- Partial product 37 for generator 15. -/
def ep_Q2_064_partial_15_0037 : Poly :=
[
  term ((-15819 : Rat) / 4) [(2, 1), (6, 1), (13, 2)],
  term ((15819 : Rat) / 8) [(2, 2), (13, 2)],
  term ((-15819 : Rat) / 4) [(3, 1), (7, 1), (13, 2)],
  term ((15819 : Rat) / 8) [(3, 2), (13, 2)],
  term ((15819 : Rat) / 4) [(6, 1), (13, 2)],
  term ((-15819 : Rat) / 8) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem ep_Q2_064_partial_15_0037_valid :
    mulPoly ep_Q2_064_coefficient_15_0037
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0038 : Poly :=
[
  term ((15721 : Rat) / 16) [(15, 2)]
]

/-- Partial product 38 for generator 15. -/
def ep_Q2_064_partial_15_0038 : Poly :=
[
  term ((15721 : Rat) / 8) [(2, 1), (6, 1), (15, 2)],
  term ((-15721 : Rat) / 16) [(2, 2), (15, 2)],
  term ((15721 : Rat) / 8) [(3, 1), (7, 1), (15, 2)],
  term ((-15721 : Rat) / 16) [(3, 2), (15, 2)],
  term ((-15721 : Rat) / 8) [(6, 1), (15, 2)],
  term ((15721 : Rat) / 16) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem ep_Q2_064_partial_15_0038_valid :
    mulPoly ep_Q2_064_coefficient_15_0038
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def ep_Q2_064_coefficient_15_0039 : Poly :=
[
  term (-16 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 39 for generator 15. -/
def ep_Q2_064_partial_15_0039 : Poly :=
[
  term (-32 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(2, 2), (15, 2), (16, 1)],
  term (-32 : Rat) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 2), (15, 2), (16, 1)],
  term (32 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem ep_Q2_064_partial_15_0039_valid :
    mulPoly ep_Q2_064_coefficient_15_0039
        ep_Q2_064_generator_15_0000_0039 =
      ep_Q2_064_partial_15_0039 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_064_partials_15_0000_0039 : List Poly :=
[
  ep_Q2_064_partial_15_0000,
  ep_Q2_064_partial_15_0001,
  ep_Q2_064_partial_15_0002,
  ep_Q2_064_partial_15_0003,
  ep_Q2_064_partial_15_0004,
  ep_Q2_064_partial_15_0005,
  ep_Q2_064_partial_15_0006,
  ep_Q2_064_partial_15_0007,
  ep_Q2_064_partial_15_0008,
  ep_Q2_064_partial_15_0009,
  ep_Q2_064_partial_15_0010,
  ep_Q2_064_partial_15_0011,
  ep_Q2_064_partial_15_0012,
  ep_Q2_064_partial_15_0013,
  ep_Q2_064_partial_15_0014,
  ep_Q2_064_partial_15_0015,
  ep_Q2_064_partial_15_0016,
  ep_Q2_064_partial_15_0017,
  ep_Q2_064_partial_15_0018,
  ep_Q2_064_partial_15_0019,
  ep_Q2_064_partial_15_0020,
  ep_Q2_064_partial_15_0021,
  ep_Q2_064_partial_15_0022,
  ep_Q2_064_partial_15_0023,
  ep_Q2_064_partial_15_0024,
  ep_Q2_064_partial_15_0025,
  ep_Q2_064_partial_15_0026,
  ep_Q2_064_partial_15_0027,
  ep_Q2_064_partial_15_0028,
  ep_Q2_064_partial_15_0029,
  ep_Q2_064_partial_15_0030,
  ep_Q2_064_partial_15_0031,
  ep_Q2_064_partial_15_0032,
  ep_Q2_064_partial_15_0033,
  ep_Q2_064_partial_15_0034,
  ep_Q2_064_partial_15_0035,
  ep_Q2_064_partial_15_0036,
  ep_Q2_064_partial_15_0037,
  ep_Q2_064_partial_15_0038,
  ep_Q2_064_partial_15_0039
]

/-- Sum of partial products in this block. -/
def ep_Q2_064_block_15_0000_0039 : Poly :=
[
  term (-81 : Rat) [],
  term (135 : Rat) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term (-144 : Rat) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term (9 : Rat) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-135 : Rat) / 2) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term (72 : Rat) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term (135 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term (-144 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term (9 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-135 : Rat) / 2) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term (72 : Rat) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-9 : Rat) / 2) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term (-135 : Rat) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term (144 : Rat) [(0, 1), (1, 1), (6, 1), (13, 1)],
  term (-9 : Rat) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((135 : Rat) / 2) [(0, 1), (1, 1), (11, 1)],
  term (-72 : Rat) [(0, 1), (1, 1), (13, 1)],
  term ((9 : Rat) / 2) [(0, 1), (1, 1), (15, 1)],
  term ((-405 : Rat) / 2) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 1)],
  term (216 : Rat) [(0, 1), (2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-27 : Rat) / 2) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1)],
  term (36 : Rat) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((405 : Rat) / 4) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term (-108 : Rat) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((27 : Rat) / 4) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term (-18 : Rat) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-405 : Rat) / 2) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term (216 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-27 : Rat) / 2) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term (36 : Rat) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((405 : Rat) / 4) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term (-108 : Rat) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((27 : Rat) / 4) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term (-18 : Rat) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((405 : Rat) / 2) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term (-216 : Rat) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((27 : Rat) / 2) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term (-36 : Rat) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-405 : Rat) / 4) [(0, 1), (5, 1), (11, 1)],
  term (108 : Rat) [(0, 1), (5, 1), (13, 1)],
  term ((-27 : Rat) / 4) [(0, 1), (5, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term ((405 : Rat) / 2) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term (-180 : Rat) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((27 : Rat) / 2) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term (18 : Rat) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-405 : Rat) / 4) [(1, 1), (2, 2), (11, 1)],
  term (90 : Rat) [(1, 1), (2, 2), (13, 1)],
  term ((-27 : Rat) / 4) [(1, 1), (2, 2), (15, 1)],
  term (-9 : Rat) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term (18 : Rat) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((405 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term (-180 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((27 : Rat) / 2) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (18 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-405 : Rat) / 4) [(1, 1), (3, 2), (11, 1)],
  term (90 : Rat) [(1, 1), (3, 2), (13, 1)],
  term ((-27 : Rat) / 4) [(1, 1), (3, 2), (15, 1)],
  term (-9 : Rat) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (5, 1), (16, 1)],
  term ((-405 : Rat) / 2) [(1, 1), (6, 1), (11, 1)],
  term (180 : Rat) [(1, 1), (6, 1), (13, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (6, 1), (15, 1)],
  term (-18 : Rat) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((405 : Rat) / 4) [(1, 1), (11, 1)],
  term (-90 : Rat) [(1, 1), (13, 1)],
  term ((27 : Rat) / 4) [(1, 1), (15, 1)],
  term (9 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((39645 : Rat) / 8) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term (-5286 : Rat) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((70827 : Rat) / 8) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-122445 : Rat) / 8) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term (16326 : Rat) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-9603 : Rat) / 8) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term (-32 : Rat) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term (-162 : Rat) [(2, 1), (6, 1)],
  term (810 : Rat) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term (-864 : Rat) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term (54 : Rat) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((13215 : Rat) / 4) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term (-3524 : Rat) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((881 : Rat) / 4) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((7095 : Rat) / 2) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-87687 : Rat) / 8) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term (27 : Rat) [(2, 1), (6, 1), (11, 2)],
  term (22920 : Rat) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-17893 : Rat) / 2) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(2, 1), (6, 1), (13, 2)],
  term ((15721 : Rat) / 8) [(2, 1), (6, 1), (15, 2)],
  term (-32 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((42615 : Rat) / 2) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term (-22728 : Rat) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(2, 1), (6, 2), (15, 2)],
  term (81 : Rat) [(2, 2)],
  term ((-39645 : Rat) / 16) [(2, 2), (3, 1), (11, 1)],
  term (2643 : Rat) [(2, 2), (3, 1), (13, 1)],
  term ((-70827 : Rat) / 16) [(2, 2), (3, 1), (15, 1)],
  term ((122445 : Rat) / 16) [(2, 2), (5, 1), (11, 1)],
  term (-8163 : Rat) [(2, 2), (5, 1), (13, 1)],
  term ((9603 : Rat) / 16) [(2, 2), (5, 1), (15, 1)],
  term (16 : Rat) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-42615 : Rat) / 4) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term (11364 : Rat) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(2, 2), (6, 1), (15, 2)],
  term (-405 : Rat) [(2, 2), (7, 1), (11, 1)],
  term (432 : Rat) [(2, 2), (7, 1), (13, 1)],
  term (-27 : Rat) [(2, 2), (7, 1), (15, 1)],
  term ((-13215 : Rat) / 8) [(2, 2), (9, 1), (11, 1)],
  term (1762 : Rat) [(2, 2), (9, 1), (13, 1)],
  term ((-881 : Rat) / 8) [(2, 2), (9, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-7095 : Rat) / 4) [(2, 2), (11, 1), (13, 1)],
  term ((87687 : Rat) / 16) [(2, 2), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(2, 2), (11, 2)],
  term (-11460 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(2, 2), (12, 1), (15, 2)],
  term ((17893 : Rat) / 4) [(2, 2), (13, 1), (15, 1)],
  term ((15819 : Rat) / 8) [(2, 2), (13, 2)],
  term ((-15721 : Rat) / 16) [(2, 2), (15, 2)],
  term (16 : Rat) [(2, 2), (15, 2), (16, 1)],
  term ((-122445 : Rat) / 8) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term (16326 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-9603 : Rat) / 8) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term (-32 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((42615 : Rat) / 2) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term (-22728 : Rat) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((2841 : Rat) / 2) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-39645 : Rat) / 8) [(3, 1), (6, 1), (11, 1)],
  term (5286 : Rat) [(3, 1), (6, 1), (13, 1)],
  term ((-70827 : Rat) / 8) [(3, 1), (6, 1), (15, 1)],
  term (-162 : Rat) [(3, 1), (7, 1)],
  term ((13215 : Rat) / 4) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term (-3524 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((881 : Rat) / 4) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-42975 : Rat) / 2) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((7095 : Rat) / 2) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-87687 : Rat) / 8) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term (27 : Rat) [(3, 1), (7, 1), (11, 2)],
  term (22920 : Rat) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 2) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-17893 : Rat) / 2) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-15819 : Rat) / 4) [(3, 1), (7, 1), (13, 2)],
  term ((15721 : Rat) / 8) [(3, 1), (7, 1), (15, 2)],
  term (-32 : Rat) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term (810 : Rat) [(3, 1), (7, 2), (11, 1)],
  term (-864 : Rat) [(3, 1), (7, 2), (13, 1)],
  term (54 : Rat) [(3, 1), (7, 2), (15, 1)],
  term ((39645 : Rat) / 16) [(3, 1), (11, 1)],
  term (-2643 : Rat) [(3, 1), (13, 1)],
  term ((70827 : Rat) / 16) [(3, 1), (15, 1)],
  term (81 : Rat) [(3, 2)],
  term ((122445 : Rat) / 16) [(3, 2), (5, 1), (11, 1)],
  term (-8163 : Rat) [(3, 2), (5, 1), (13, 1)],
  term ((9603 : Rat) / 16) [(3, 2), (5, 1), (15, 1)],
  term (16 : Rat) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-42615 : Rat) / 4) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term (11364 : Rat) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 4) [(3, 2), (6, 1), (15, 2)],
  term ((36405 : Rat) / 8) [(3, 2), (7, 1), (11, 1)],
  term (-4854 : Rat) [(3, 2), (7, 1), (13, 1)],
  term ((70611 : Rat) / 8) [(3, 2), (7, 1), (15, 1)],
  term ((-13215 : Rat) / 8) [(3, 2), (9, 1), (11, 1)],
  term (1762 : Rat) [(3, 2), (9, 1), (13, 1)],
  term ((-881 : Rat) / 8) [(3, 2), (9, 1), (15, 1)],
  term ((42975 : Rat) / 4) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-7095 : Rat) / 4) [(3, 2), (11, 1), (13, 1)],
  term ((87687 : Rat) / 16) [(3, 2), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(3, 2), (11, 2)],
  term (-11460 : Rat) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 4) [(3, 2), (12, 1), (15, 2)],
  term ((17893 : Rat) / 4) [(3, 2), (13, 1), (15, 1)],
  term ((15819 : Rat) / 8) [(3, 2), (13, 2)],
  term ((-15721 : Rat) / 16) [(3, 2), (15, 2)],
  term (16 : Rat) [(3, 2), (15, 2), (16, 1)],
  term ((-39645 : Rat) / 16) [(3, 3), (11, 1)],
  term (2643 : Rat) [(3, 3), (13, 1)],
  term ((-70827 : Rat) / 16) [(3, 3), (15, 1)],
  term ((122445 : Rat) / 8) [(5, 1), (6, 1), (11, 1)],
  term (-16326 : Rat) [(5, 1), (6, 1), (13, 1)],
  term ((9603 : Rat) / 8) [(5, 1), (6, 1), (15, 1)],
  term (32 : Rat) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-122445 : Rat) / 16) [(5, 1), (11, 1)],
  term (8163 : Rat) [(5, 1), (13, 1)],
  term ((-9603 : Rat) / 16) [(5, 1), (15, 1)],
  term (-16 : Rat) [(5, 1), (15, 1), (16, 1)],
  term (162 : Rat) [(6, 1)],
  term (-810 : Rat) [(6, 1), (7, 1), (11, 1)],
  term (864 : Rat) [(6, 1), (7, 1), (13, 1)],
  term (-54 : Rat) [(6, 1), (7, 1), (15, 1)],
  term ((-13215 : Rat) / 4) [(6, 1), (9, 1), (11, 1)],
  term (3524 : Rat) [(6, 1), (9, 1), (13, 1)],
  term ((-881 : Rat) / 4) [(6, 1), (9, 1), (15, 1)],
  term ((42975 : Rat) / 2) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7095 : Rat) / 2) [(6, 1), (11, 1), (13, 1)],
  term ((172917 : Rat) / 8) [(6, 1), (11, 1), (15, 1)],
  term (-27 : Rat) [(6, 1), (11, 2)],
  term (-22920 : Rat) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2865 : Rat) / 2) [(6, 1), (12, 1), (15, 2)],
  term ((-4835 : Rat) / 2) [(6, 1), (13, 1), (15, 1)],
  term ((15819 : Rat) / 4) [(6, 1), (13, 2)],
  term ((-10039 : Rat) / 8) [(6, 1), (15, 2)],
  term (32 : Rat) [(6, 1), (15, 2), (16, 1)],
  term ((-42615 : Rat) / 2) [(6, 2), (11, 1), (15, 1)],
  term (22728 : Rat) [(6, 2), (13, 1), (15, 1)],
  term ((-2841 : Rat) / 2) [(6, 2), (15, 2)],
  term (405 : Rat) [(7, 1), (11, 1)],
  term (-432 : Rat) [(7, 1), (13, 1)],
  term (27 : Rat) [(7, 1), (15, 1)],
  term ((13215 : Rat) / 8) [(9, 1), (11, 1)],
  term (-1762 : Rat) [(9, 1), (13, 1)],
  term ((881 : Rat) / 8) [(9, 1), (15, 1)],
  term ((-42975 : Rat) / 4) [(11, 1), (12, 1), (15, 1)],
  term ((7095 : Rat) / 4) [(11, 1), (13, 1)],
  term ((-87687 : Rat) / 16) [(11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(11, 2)],
  term (11460 : Rat) [(12, 1), (13, 1), (15, 1)],
  term ((-2865 : Rat) / 4) [(12, 1), (15, 2)],
  term ((-17893 : Rat) / 4) [(13, 1), (15, 1)],
  term ((-15819 : Rat) / 8) [(13, 2)],
  term ((15721 : Rat) / 16) [(15, 2)],
  term (-16 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 39. -/
theorem ep_Q2_064_block_15_0000_0039_valid :
    checkProductSumEq ep_Q2_064_partials_15_0000_0039
      ep_Q2_064_block_15_0000_0039 = true := by
  native_decide

end EpQ2064TermShards

end Patterns

end EndpointCertificate

end Problem97
