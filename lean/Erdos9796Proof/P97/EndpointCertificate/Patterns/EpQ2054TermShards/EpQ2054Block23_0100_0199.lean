/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 23:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_23_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0100 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 100 for generator 23. -/
def ep_Q2_054_partial_23_0100 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 2), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 23. -/
theorem ep_Q2_054_partial_23_0100_valid :
    mulPoly ep_Q2_054_coefficient_23_0100
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0101 : Poly :=
[
  term ((4105763264079 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 101 for generator 23. -/
def ep_Q2_054_partial_23_0101 : Poly :=
[
  term ((-8211526528158 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((4105763264079 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-8211526528158 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((4105763264079 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((8211526528158 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-4105763264079 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 2), (15, 1)],
  term ((8211526528158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4105763264079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 23. -/
theorem ep_Q2_054_partial_23_0101_valid :
    mulPoly ep_Q2_054_coefficient_23_0101
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0102 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 23. -/
def ep_Q2_054_partial_23_0102 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 23. -/
theorem ep_Q2_054_partial_23_0102_valid :
    mulPoly ep_Q2_054_coefficient_23_0102
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0103 : Poly :=
[
  term ((12695406786720 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 103 for generator 23. -/
def ep_Q2_054_partial_23_0103 : Poly :=
[
  term ((-25390813573440 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 23. -/
theorem ep_Q2_054_partial_23_0103_valid :
    mulPoly ep_Q2_054_coefficient_23_0103
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0104 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 23. -/
def ep_Q2_054_partial_23_0104 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 23. -/
theorem ep_Q2_054_partial_23_0104_valid :
    mulPoly ep_Q2_054_coefficient_23_0104
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0105 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 105 for generator 23. -/
def ep_Q2_054_partial_23_0105 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(2, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 23. -/
theorem ep_Q2_054_partial_23_0105_valid :
    mulPoly ep_Q2_054_coefficient_23_0105
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0106 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 23. -/
def ep_Q2_054_partial_23_0106 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 23. -/
theorem ep_Q2_054_partial_23_0106_valid :
    mulPoly ep_Q2_054_coefficient_23_0106
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0107 : Poly :=
[
  term ((781416132165 : Rat) / 90066973034) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 107 for generator 23. -/
def ep_Q2_054_partial_23_0107 : Poly :=
[
  term ((-781416132165 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (8, 2), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 23. -/
theorem ep_Q2_054_partial_23_0107_valid :
    mulPoly ep_Q2_054_coefficient_23_0107
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0108 : Poly :=
[
  term ((-4746479993748 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 108 for generator 23. -/
def ep_Q2_054_partial_23_0108 : Poly :=
[
  term ((9492959987496 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4746479993748 : Rat) / 45033486517) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((9492959987496 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4746479993748 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-9492959987496 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((4746479993748 : Rat) / 45033486517) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((-9492959987496 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((4746479993748 : Rat) / 45033486517) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 23. -/
theorem ep_Q2_054_partial_23_0108_valid :
    mulPoly ep_Q2_054_coefficient_23_0108
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0109 : Poly :=
[
  term ((-781416132165 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 23. -/
def ep_Q2_054_partial_23_0109 : Poly :=
[
  term ((1562832264330 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1562832264330 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 23. -/
theorem ep_Q2_054_partial_23_0109_valid :
    mulPoly ep_Q2_054_coefficient_23_0109
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0110 : Poly :=
[
  term ((-28111257884880 : Rat) / 45033486517) [(2, 1), (15, 2)]
]

/-- Partial product 110 for generator 23. -/
def ep_Q2_054_partial_23_0110 : Poly :=
[
  term ((56222515769760 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-28111257884880 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2)],
  term ((56222515769760 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-28111257884880 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2)],
  term ((-56222515769760 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((28111257884880 : Rat) / 45033486517) [(2, 1), (8, 2), (15, 2)],
  term ((-56222515769760 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((28111257884880 : Rat) / 45033486517) [(2, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 23. -/
theorem ep_Q2_054_partial_23_0110_valid :
    mulPoly ep_Q2_054_coefficient_23_0110
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0111 : Poly :=
[
  term ((-3302537480505 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 23. -/
def ep_Q2_054_partial_23_0111 : Poly :=
[
  term ((6605074961010 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3302537480505 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((6605074961010 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3302537480505 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-6605074961010 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((3302537480505 : Rat) / 45033486517) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-6605074961010 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3302537480505 : Rat) / 45033486517) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 23. -/
theorem ep_Q2_054_partial_23_0111_valid :
    mulPoly ep_Q2_054_coefficient_23_0111
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0112 : Poly :=
[
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (16, 1)]
]

/-- Partial product 112 for generator 23. -/
def ep_Q2_054_partial_23_0112 : Poly :=
[
  term ((520944088110 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(0, 2), (2, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(1, 2), (2, 1), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (8, 2), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 23. -/
theorem ep_Q2_054_partial_23_0112_valid :
    mulPoly ep_Q2_054_coefficient_23_0112
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0113 : Poly :=
[
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 113 for generator 23. -/
def ep_Q2_054_partial_23_0113 : Poly :=
[
  term ((38827572436728 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (10, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 2)],
  term ((-38827572436728 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 23. -/
theorem ep_Q2_054_partial_23_0113_valid :
    mulPoly ep_Q2_054_coefficient_23_0113
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0114 : Poly :=
[
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 114 for generator 23. -/
def ep_Q2_054_partial_23_0114 : Poly :=
[
  term ((-30717321786144 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (13, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 23. -/
theorem ep_Q2_054_partial_23_0114_valid :
    mulPoly ep_Q2_054_coefficient_23_0114
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0115 : Poly :=
[
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 115 for generator 23. -/
def ep_Q2_054_partial_23_0115 : Poly :=
[
  term ((17009567950608 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((17009567950608 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 23. -/
theorem ep_Q2_054_partial_23_0115_valid :
    mulPoly ep_Q2_054_coefficient_23_0115
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0116 : Poly :=
[
  term ((1093360498713 : Rat) / 90066973034) [(3, 1), (7, 1)]
]

/-- Partial product 116 for generator 23. -/
def ep_Q2_054_partial_23_0116 : Poly :=
[
  term ((-1093360498713 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((1093360498713 : Rat) / 90066973034) [(0, 2), (3, 1), (7, 1)],
  term ((-1093360498713 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((1093360498713 : Rat) / 90066973034) [(1, 2), (3, 1), (7, 1)],
  term ((1093360498713 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-1093360498713 : Rat) / 90066973034) [(3, 1), (7, 1), (8, 2)],
  term ((1093360498713 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1093360498713 : Rat) / 90066973034) [(3, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 23. -/
theorem ep_Q2_054_partial_23_0116_valid :
    mulPoly ep_Q2_054_coefficient_23_0116
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0117 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 117 for generator 23. -/
def ep_Q2_054_partial_23_0117 : Poly :=
[
  term ((-1537533900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 2)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (10, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 23. -/
theorem ep_Q2_054_partial_23_0117_valid :
    mulPoly ep_Q2_054_coefficient_23_0117
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0118 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 118 for generator 23. -/
def ep_Q2_054_partial_23_0118 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 23. -/
theorem ep_Q2_054_partial_23_0118_valid :
    mulPoly ep_Q2_054_coefficient_23_0118
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0119 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 119 for generator 23. -/
def ep_Q2_054_partial_23_0119 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 23. -/
theorem ep_Q2_054_partial_23_0119_valid :
    mulPoly ep_Q2_054_coefficient_23_0119
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0120 : Poly :=
[
  term ((-64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 120 for generator 23. -/
def ep_Q2_054_partial_23_0120 : Poly :=
[
  term ((128127825000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((128127825000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 23. -/
theorem ep_Q2_054_partial_23_0120_valid :
    mulPoly ep_Q2_054_coefficient_23_0120
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0121 : Poly :=
[
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)]
]

/-- Partial product 121 for generator 23. -/
def ep_Q2_054_partial_23_0121 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 2)],
  term ((27455962500 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (11, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 3)],
  term ((27455962500 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 2)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (11, 2)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 3)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 23. -/
theorem ep_Q2_054_partial_23_0121_valid :
    mulPoly ep_Q2_054_coefficient_23_0121
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0122 : Poly :=
[
  term ((-4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 122 for generator 23. -/
def ep_Q2_054_partial_23_0122 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-4575993750 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1)],
  term ((9151987500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-4575993750 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (12, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (12, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 23. -/
theorem ep_Q2_054_partial_23_0122_valid :
    mulPoly ep_Q2_054_coefficient_23_0122
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0123 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 123 for generator 23. -/
def ep_Q2_054_partial_23_0123 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 23. -/
theorem ep_Q2_054_partial_23_0123_valid :
    mulPoly ep_Q2_054_coefficient_23_0123
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0124 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 124 for generator 23. -/
def ep_Q2_054_partial_23_0124 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 23. -/
theorem ep_Q2_054_partial_23_0124_valid :
    mulPoly ep_Q2_054_coefficient_23_0124
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0125 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 23. -/
def ep_Q2_054_partial_23_0125 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 23. -/
theorem ep_Q2_054_partial_23_0125_valid :
    mulPoly ep_Q2_054_coefficient_23_0125
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0126 : Poly :=
[
  term ((45759937500 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 126 for generator 23. -/
def ep_Q2_054_partial_23_0126 : Poly :=
[
  term ((-91519875000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((45759937500 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-91519875000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((45759937500 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((91519875000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-45759937500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((91519875000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-45759937500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 23. -/
theorem ep_Q2_054_partial_23_0126_valid :
    mulPoly ep_Q2_054_coefficient_23_0126
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0127 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 127 for generator 23. -/
def ep_Q2_054_partial_23_0127 : Poly :=
[
  term ((25390813573440 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (8, 2), (10, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 23. -/
theorem ep_Q2_054_partial_23_0127_valid :
    mulPoly ep_Q2_054_coefficient_23_0127
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0128 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 23. -/
def ep_Q2_054_partial_23_0128 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 23. -/
theorem ep_Q2_054_partial_23_0128_valid :
    mulPoly ep_Q2_054_coefficient_23_0128
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0129 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 129 for generator 23. -/
def ep_Q2_054_partial_23_0129 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 23. -/
theorem ep_Q2_054_partial_23_0129_valid :
    mulPoly ep_Q2_054_coefficient_23_0129
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0130 : Poly :=
[
  term ((1057950565560 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 130 for generator 23. -/
def ep_Q2_054_partial_23_0130 : Poly :=
[
  term ((-2115901131120 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((1057950565560 : Rat) / 45033486517) [(0, 2), (3, 1), (11, 1), (15, 2)],
  term ((-2115901131120 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((1057950565560 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (8, 2), (11, 1), (15, 2)],
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 2), (15, 2)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 23. -/
theorem ep_Q2_054_partial_23_0130_valid :
    mulPoly ep_Q2_054_coefficient_23_0130
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0131 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 131 for generator 23. -/
def ep_Q2_054_partial_23_0131 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(0, 2), (3, 1), (11, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (8, 2), (11, 2), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 3), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 23. -/
theorem ep_Q2_054_partial_23_0131_valid :
    mulPoly ep_Q2_054_coefficient_23_0131
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0132 : Poly :=
[
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 132 for generator 23. -/
def ep_Q2_054_partial_23_0132 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (8, 2), (12, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 23. -/
theorem ep_Q2_054_partial_23_0132_valid :
    mulPoly ep_Q2_054_coefficient_23_0132
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0133 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 23. -/
def ep_Q2_054_partial_23_0133 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 23. -/
theorem ep_Q2_054_partial_23_0133_valid :
    mulPoly ep_Q2_054_coefficient_23_0133
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0134 : Poly :=
[
  term ((-1108793883177 : Rat) / 45033486517) [(3, 1), (13, 1)]
]

/-- Partial product 134 for generator 23. -/
def ep_Q2_054_partial_23_0134 : Poly :=
[
  term ((2217587766354 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((-1108793883177 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1)],
  term ((2217587766354 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-1108793883177 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1)],
  term ((-2217587766354 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((1108793883177 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1)],
  term ((-2217587766354 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((1108793883177 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 23. -/
theorem ep_Q2_054_partial_23_0134_valid :
    mulPoly ep_Q2_054_coefficient_23_0134
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0135 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 135 for generator 23. -/
def ep_Q2_054_partial_23_0135 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 23. -/
theorem ep_Q2_054_partial_23_0135_valid :
    mulPoly ep_Q2_054_coefficient_23_0135
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0136 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 136 for generator 23. -/
def ep_Q2_054_partial_23_0136 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 23. -/
theorem ep_Q2_054_partial_23_0136_valid :
    mulPoly ep_Q2_054_coefficient_23_0136
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0137 : Poly :=
[
  term ((8236900831860 : Rat) / 45033486517) [(3, 1), (15, 1)]
]

/-- Partial product 137 for generator 23. -/
def ep_Q2_054_partial_23_0137 : Poly :=
[
  term ((-16473801663720 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((8236900831860 : Rat) / 45033486517) [(0, 2), (3, 1), (15, 1)],
  term ((-16473801663720 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((8236900831860 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1)],
  term ((16473801663720 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-8236900831860 : Rat) / 45033486517) [(3, 1), (8, 2), (15, 1)],
  term ((16473801663720 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-8236900831860 : Rat) / 45033486517) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 23. -/
theorem ep_Q2_054_partial_23_0137_valid :
    mulPoly ep_Q2_054_coefficient_23_0137
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0138 : Poly :=
[
  term ((1353834533805 : Rat) / 90066973034) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 23. -/
def ep_Q2_054_partial_23_0138 : Poly :=
[
  term ((-1353834533805 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1353834533805 : Rat) / 90066973034) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1353834533805 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((1353834533805 : Rat) / 90066973034) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1353834533805 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1353834533805 : Rat) / 90066973034) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((1353834533805 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1353834533805 : Rat) / 90066973034) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 23. -/
theorem ep_Q2_054_partial_23_0138_valid :
    mulPoly ep_Q2_054_coefficient_23_0138
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0139 : Poly :=
[
  term ((892390537101 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 139 for generator 23. -/
def ep_Q2_054_partial_23_0139 : Poly :=
[
  term ((-1784781074202 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1)],
  term ((892390537101 : Rat) / 45033486517) [(0, 2), (6, 1)],
  term ((-1784781074202 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1)],
  term ((892390537101 : Rat) / 45033486517) [(1, 2), (6, 1)],
  term ((1784781074202 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1)],
  term ((-892390537101 : Rat) / 45033486517) [(6, 1), (8, 2)],
  term ((1784781074202 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1)],
  term ((-892390537101 : Rat) / 45033486517) [(6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 23. -/
theorem ep_Q2_054_partial_23_0139_valid :
    mulPoly ep_Q2_054_coefficient_23_0139
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0140 : Poly :=
[
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 140 for generator 23. -/
def ep_Q2_054_partial_23_0140 : Poly :=
[
  term ((3431995312500 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (10, 1), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 23. -/
theorem ep_Q2_054_partial_23_0140_valid :
    mulPoly ep_Q2_054_coefficient_23_0140
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0141 : Poly :=
[
  term ((232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 141 for generator 23. -/
def ep_Q2_054_partial_23_0141 : Poly :=
[
  term ((-464275379772 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((232137689886 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-464275379772 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((232137689886 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((464275379772 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((464275379772 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)],
  term ((-232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 23. -/
theorem ep_Q2_054_partial_23_0141_valid :
    mulPoly ep_Q2_054_coefficient_23_0141
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0142 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 142 for generator 23. -/
def ep_Q2_054_partial_23_0142 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 23. -/
theorem ep_Q2_054_partial_23_0142_valid :
    mulPoly ep_Q2_054_coefficient_23_0142
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0143 : Poly :=
[
  term ((2791136035008 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 143 for generator 23. -/
def ep_Q2_054_partial_23_0143 : Poly :=
[
  term ((-5582272070016 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((2791136035008 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((-5582272070016 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((2791136035008 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((5582272070016 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2791136035008 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((5582272070016 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-2791136035008 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 23. -/
theorem ep_Q2_054_partial_23_0143_valid :
    mulPoly ep_Q2_054_coefficient_23_0143
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0144 : Poly :=
[
  term ((-17504336801187 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 144 for generator 23. -/
def ep_Q2_054_partial_23_0144 : Poly :=
[
  term ((35008673602374 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-17504336801187 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((35008673602374 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-17504336801187 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-35008673602374 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((17504336801187 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((-35008673602374 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((17504336801187 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 23. -/
theorem ep_Q2_054_partial_23_0144_valid :
    mulPoly ep_Q2_054_coefficient_23_0144
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0145 : Poly :=
[
  term ((7241919776550 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 145 for generator 23. -/
def ep_Q2_054_partial_23_0145 : Poly :=
[
  term ((-14483839553100 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((7241919776550 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-14483839553100 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((7241919776550 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((14483839553100 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-7241919776550 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((14483839553100 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-7241919776550 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 23. -/
theorem ep_Q2_054_partial_23_0145_valid :
    mulPoly ep_Q2_054_coefficient_23_0145
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0146 : Poly :=
[
  term ((19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2)]
]

/-- Partial product 146 for generator 23. -/
def ep_Q2_054_partial_23_0146 : Poly :=
[
  term ((-38827572436728 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (10, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 2)],
  term ((-38827572436728 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (11, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 2)],
  term ((38827572436728 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (10, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2)],
  term ((38827572436728 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (11, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 23. -/
theorem ep_Q2_054_partial_23_0146_valid :
    mulPoly ep_Q2_054_coefficient_23_0146
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0147 : Poly :=
[
  term ((-3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1)]
]

/-- Partial product 147 for generator 23. -/
def ep_Q2_054_partial_23_0147 : Poly :=
[
  term ((7247704606902 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1)],
  term ((-3623852303451 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-3623852303451 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1)],
  term ((-7247704606902 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2)],
  term ((-7247704606902 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(6, 1), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 23. -/
theorem ep_Q2_054_partial_23_0147_valid :
    mulPoly ep_Q2_054_coefficient_23_0147
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0148 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 148 for generator 23. -/
def ep_Q2_054_partial_23_0148 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (8, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 23. -/
theorem ep_Q2_054_partial_23_0148_valid :
    mulPoly ep_Q2_054_coefficient_23_0148
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0149 : Poly :=
[
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 149 for generator 23. -/
def ep_Q2_054_partial_23_0149 : Poly :=
[
  term ((-91905676988148 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 23. -/
theorem ep_Q2_054_partial_23_0149_valid :
    mulPoly ep_Q2_054_coefficient_23_0149
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0150 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 23. -/
def ep_Q2_054_partial_23_0150 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 23. -/
theorem ep_Q2_054_partial_23_0150_valid :
    mulPoly ep_Q2_054_coefficient_23_0150
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0151 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 151 for generator 23. -/
def ep_Q2_054_partial_23_0151 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 23. -/
theorem ep_Q2_054_partial_23_0151_valid :
    mulPoly ep_Q2_054_coefficient_23_0151
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0152 : Poly :=
[
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 152 for generator 23. -/
def ep_Q2_054_partial_23_0152 : Poly :=
[
  term ((-81651926988 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((40825963494 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((40825963494 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((81651926988 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((81651926988 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 23. -/
theorem ep_Q2_054_partial_23_0152_valid :
    mulPoly ep_Q2_054_coefficient_23_0152
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0153 : Poly :=
[
  term ((-4184139294450 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 153 for generator 23. -/
def ep_Q2_054_partial_23_0153 : Poly :=
[
  term ((8368278588900 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-4184139294450 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((8368278588900 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4184139294450 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-8368278588900 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((4184139294450 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((-8368278588900 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((4184139294450 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 23. -/
theorem ep_Q2_054_partial_23_0153_valid :
    mulPoly ep_Q2_054_coefficient_23_0153
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0154 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 23. -/
def ep_Q2_054_partial_23_0154 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 23. -/
theorem ep_Q2_054_partial_23_0154_valid :
    mulPoly ep_Q2_054_coefficient_23_0154
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0155 : Poly :=
[
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 2)]
]

/-- Partial product 155 for generator 23. -/
def ep_Q2_054_partial_23_0155 : Poly :=
[
  term ((734867342892 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 2), (10, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 2)],
  term ((734867342892 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (10, 1)],
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(6, 1), (9, 3), (11, 1)],
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 23. -/
theorem ep_Q2_054_partial_23_0155_valid :
    mulPoly ep_Q2_054_coefficient_23_0155
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0156 : Poly :=
[
  term ((3650321450772 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 156 for generator 23. -/
def ep_Q2_054_partial_23_0156 : Poly :=
[
  term ((-7300642901544 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((3650321450772 : Rat) / 45033486517) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-7300642901544 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((3650321450772 : Rat) / 45033486517) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((7300642901544 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3650321450772 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((7300642901544 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3650321450772 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 23. -/
theorem ep_Q2_054_partial_23_0156_valid :
    mulPoly ep_Q2_054_coefficient_23_0156
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0157 : Poly :=
[
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 23. -/
def ep_Q2_054_partial_23_0157 : Poly :=
[
  term ((1269540678672 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 23. -/
theorem ep_Q2_054_partial_23_0157_valid :
    mulPoly ep_Q2_054_coefficient_23_0157
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0158 : Poly :=
[
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (12, 1)]
]

/-- Partial product 158 for generator 23. -/
def ep_Q2_054_partial_23_0158 : Poly :=
[
  term ((-8135100000 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (12, 1)],
  term ((4067550000 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1)],
  term ((-8135100000 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((4067550000 : Rat) / 45033486517) [(1, 2), (6, 1), (12, 1)],
  term ((8135100000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1)],
  term ((8135100000 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 23. -/
theorem ep_Q2_054_partial_23_0158_valid :
    mulPoly ep_Q2_054_coefficient_23_0158
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0159 : Poly :=
[
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 159 for generator 23. -/
def ep_Q2_054_partial_23_0159 : Poly :=
[
  term ((2841856333470 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 23. -/
theorem ep_Q2_054_partial_23_0159_valid :
    mulPoly ep_Q2_054_coefficient_23_0159
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0160 : Poly :=
[
  term ((29407558472433 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 160 for generator 23. -/
def ep_Q2_054_partial_23_0160 : Poly :=
[
  term ((-58815116944866 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((29407558472433 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-58815116944866 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((29407558472433 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((58815116944866 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-29407558472433 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((58815116944866 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-29407558472433 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 23. -/
theorem ep_Q2_054_partial_23_0160_valid :
    mulPoly ep_Q2_054_coefficient_23_0160
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0161 : Poly :=
[
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 23. -/
def ep_Q2_054_partial_23_0161 : Poly :=
[
  term ((-5683712666940 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 23. -/
theorem ep_Q2_054_partial_23_0161_valid :
    mulPoly ep_Q2_054_coefficient_23_0161
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0162 : Poly :=
[
  term ((-3482915455692 : Rat) / 45033486517) [(6, 1), (15, 2)]
]

/-- Partial product 162 for generator 23. -/
def ep_Q2_054_partial_23_0162 : Poly :=
[
  term ((6965830911384 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((-3482915455692 : Rat) / 45033486517) [(0, 2), (6, 1), (15, 2)],
  term ((6965830911384 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((-3482915455692 : Rat) / 45033486517) [(1, 2), (6, 1), (15, 2)],
  term ((-6965830911384 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term ((3482915455692 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2)],
  term ((-6965830911384 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((3482915455692 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 23. -/
theorem ep_Q2_054_partial_23_0162_valid :
    mulPoly ep_Q2_054_coefficient_23_0162
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0163 : Poly :=
[
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 163 for generator 23. -/
def ep_Q2_054_partial_23_0163 : Poly :=
[
  term ((1269540678672 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 23. -/
theorem ep_Q2_054_partial_23_0163_valid :
    mulPoly ep_Q2_054_coefficient_23_0163
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0164 : Poly :=
[
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (16, 1)]
]

/-- Partial product 164 for generator 23. -/
def ep_Q2_054_partial_23_0164 : Poly :=
[
  term ((-1894570888980 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(0, 2), (6, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(1, 2), (6, 1), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (8, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 23. -/
theorem ep_Q2_054_partial_23_0164_valid :
    mulPoly ep_Q2_054_coefficient_23_0164
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0165 : Poly :=
[
  term ((-736679955627 : Rat) / 45033486517) [(6, 2)]
]

/-- Partial product 165 for generator 23. -/
def ep_Q2_054_partial_23_0165 : Poly :=
[
  term ((1473359911254 : Rat) / 45033486517) [(0, 1), (6, 2), (10, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(0, 2), (6, 2)],
  term ((1473359911254 : Rat) / 45033486517) [(1, 1), (6, 2), (11, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(1, 2), (6, 2)],
  term ((-1473359911254 : Rat) / 45033486517) [(6, 2), (8, 1), (10, 1)],
  term ((736679955627 : Rat) / 45033486517) [(6, 2), (8, 2)],
  term ((-1473359911254 : Rat) / 45033486517) [(6, 2), (9, 1), (11, 1)],
  term ((736679955627 : Rat) / 45033486517) [(6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 23. -/
theorem ep_Q2_054_partial_23_0165_valid :
    mulPoly ep_Q2_054_coefficient_23_0165
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0166 : Poly :=
[
  term ((632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 166 for generator 23. -/
def ep_Q2_054_partial_23_0166 : Poly :=
[
  term ((-1265682617892 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((632841308946 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1265682617892 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((632841308946 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((1265682617892 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 3)],
  term ((1265682617892 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((-632841308946 : Rat) / 45033486517) [(7, 1), (8, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 23. -/
theorem ep_Q2_054_partial_23_0166_valid :
    mulPoly ep_Q2_054_coefficient_23_0166
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0167 : Poly :=
[
  term ((1693117687500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 167 for generator 23. -/
def ep_Q2_054_partial_23_0167 : Poly :=
[
  term ((-3386235375000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((1693117687500 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((-3386235375000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((1693117687500 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((3386235375000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-1693117687500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((3386235375000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((-1693117687500 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 23. -/
theorem ep_Q2_054_partial_23_0167_valid :
    mulPoly ep_Q2_054_coefficient_23_0167
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0168 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 168 for generator 23. -/
def ep_Q2_054_partial_23_0168 : Poly :=
[
  term ((367622707952592 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 23. -/
theorem ep_Q2_054_partial_23_0168_valid :
    mulPoly ep_Q2_054_coefficient_23_0168
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0169 : Poly :=
[
  term ((217171717272 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 169 for generator 23. -/
def ep_Q2_054_partial_23_0169 : Poly :=
[
  term ((-434343434544 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((217171717272 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((-434343434544 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((217171717272 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((434343434544 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-217171717272 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((434343434544 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-217171717272 : Rat) / 45033486517) [(7, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 23. -/
theorem ep_Q2_054_partial_23_0169_valid :
    mulPoly ep_Q2_054_coefficient_23_0169
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0170 : Poly :=
[
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 170 for generator 23. -/
def ep_Q2_054_partial_23_0170 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-183811353976296 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1), (15, 2)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 23. -/
theorem ep_Q2_054_partial_23_0170_valid :
    mulPoly ep_Q2_054_coefficient_23_0170
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0171 : Poly :=
[
  term ((13454637218361 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 171 for generator 23. -/
def ep_Q2_054_partial_23_0171 : Poly :=
[
  term ((-26909274436722 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((13454637218361 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-26909274436722 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((13454637218361 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((26909274436722 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-13454637218361 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((26909274436722 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((-13454637218361 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 23. -/
theorem ep_Q2_054_partial_23_0171_valid :
    mulPoly ep_Q2_054_coefficient_23_0171
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0172 : Poly :=
[
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 23. -/
def ep_Q2_054_partial_23_0172 : Poly :=
[
  term ((-921681134010 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((460840567005 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((460840567005 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((921681134010 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((921681134010 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-460840567005 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 23. -/
theorem ep_Q2_054_partial_23_0172_valid :
    mulPoly ep_Q2_054_coefficient_23_0172
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0173 : Poly :=
[
  term ((5481124483959 : Rat) / 90066973034) [(7, 1), (9, 1)]
]

/-- Partial product 173 for generator 23. -/
def ep_Q2_054_partial_23_0173 : Poly :=
[
  term ((-5481124483959 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((5481124483959 : Rat) / 90066973034) [(0, 2), (7, 1), (9, 1)],
  term ((-5481124483959 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((5481124483959 : Rat) / 90066973034) [(1, 2), (7, 1), (9, 1)],
  term ((5481124483959 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-5481124483959 : Rat) / 90066973034) [(7, 1), (8, 2), (9, 1)],
  term ((5481124483959 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1)],
  term ((-5481124483959 : Rat) / 90066973034) [(7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 23. -/
theorem ep_Q2_054_partial_23_0173_valid :
    mulPoly ep_Q2_054_coefficient_23_0173
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0174 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 174 for generator 23. -/
def ep_Q2_054_partial_23_0174 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 2), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 23. -/
theorem ep_Q2_054_partial_23_0174_valid :
    mulPoly ep_Q2_054_coefficient_23_0174
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0175 : Poly :=
[
  term ((-52435942272 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 175 for generator 23. -/
def ep_Q2_054_partial_23_0175 : Poly :=
[
  term ((104871884544 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((104871884544 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-104871884544 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((52435942272 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((-104871884544 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((52435942272 : Rat) / 45033486517) [(7, 1), (9, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 23. -/
theorem ep_Q2_054_partial_23_0175_valid :
    mulPoly ep_Q2_054_coefficient_23_0175
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0176 : Poly :=
[
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 176 for generator 23. -/
def ep_Q2_054_partial_23_0176 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 23. -/
theorem ep_Q2_054_partial_23_0176_valid :
    mulPoly ep_Q2_054_coefficient_23_0176
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0177 : Poly :=
[
  term ((-15253312500 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 177 for generator 23. -/
def ep_Q2_054_partial_23_0177 : Poly :=
[
  term ((30506625000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 23. -/
theorem ep_Q2_054_partial_23_0177_valid :
    mulPoly ep_Q2_054_coefficient_23_0177
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0178 : Poly :=
[
  term ((24065900454417 : Rat) / 180133946068) [(7, 1), (11, 1)]
]

/-- Partial product 178 for generator 23. -/
def ep_Q2_054_partial_23_0178 : Poly :=
[
  term ((-24065900454417 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((24065900454417 : Rat) / 180133946068) [(0, 2), (7, 1), (11, 1)],
  term ((-24065900454417 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 2)],
  term ((24065900454417 : Rat) / 180133946068) [(1, 2), (7, 1), (11, 1)],
  term ((24065900454417 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-24065900454417 : Rat) / 180133946068) [(7, 1), (8, 2), (11, 1)],
  term ((24065900454417 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)],
  term ((-24065900454417 : Rat) / 180133946068) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 23. -/
theorem ep_Q2_054_partial_23_0178_valid :
    mulPoly ep_Q2_054_coefficient_23_0178
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0179 : Poly :=
[
  term ((700127043750 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 179 for generator 23. -/
def ep_Q2_054_partial_23_0179 : Poly :=
[
  term ((-1400254087500 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((700127043750 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-1400254087500 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((700127043750 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((1400254087500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-700127043750 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((1400254087500 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-700127043750 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 23. -/
theorem ep_Q2_054_partial_23_0179_valid :
    mulPoly ep_Q2_054_coefficient_23_0179
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0180 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 180 for generator 23. -/
def ep_Q2_054_partial_23_0180 : Poly :=
[
  term ((-159038119382616 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 23. -/
theorem ep_Q2_054_partial_23_0180_valid :
    mulPoly ep_Q2_054_coefficient_23_0180
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0181 : Poly :=
[
  term ((-211169477577 : Rat) / 45033486517) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 181 for generator 23. -/
def ep_Q2_054_partial_23_0181 : Poly :=
[
  term ((422338955154 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-211169477577 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((422338955154 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-211169477577 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-422338955154 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((211169477577 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-422338955154 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((211169477577 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 23. -/
theorem ep_Q2_054_partial_23_0181_valid :
    mulPoly ep_Q2_054_coefficient_23_0181
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0182 : Poly :=
[
  term ((-2987113727925 : Rat) / 90066973034) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 182 for generator 23. -/
def ep_Q2_054_partial_23_0182 : Poly :=
[
  term ((2987113727925 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2987113727925 : Rat) / 90066973034) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((2987113727925 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2987113727925 : Rat) / 90066973034) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-2987113727925 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((2987113727925 : Rat) / 90066973034) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-2987113727925 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2987113727925 : Rat) / 90066973034) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 23. -/
theorem ep_Q2_054_partial_23_0182_valid :
    mulPoly ep_Q2_054_coefficient_23_0182
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0183 : Poly :=
[
  term ((41543596207539 : Rat) / 180133946068) [(7, 1), (13, 1)]
]

/-- Partial product 183 for generator 23. -/
def ep_Q2_054_partial_23_0183 : Poly :=
[
  term ((-41543596207539 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((41543596207539 : Rat) / 180133946068) [(0, 2), (7, 1), (13, 1)],
  term ((-41543596207539 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((41543596207539 : Rat) / 180133946068) [(1, 2), (7, 1), (13, 1)],
  term ((41543596207539 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-41543596207539 : Rat) / 180133946068) [(7, 1), (8, 2), (13, 1)],
  term ((41543596207539 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-41543596207539 : Rat) / 180133946068) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 23. -/
theorem ep_Q2_054_partial_23_0183_valid :
    mulPoly ep_Q2_054_coefficient_23_0183
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0184 : Poly :=
[
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 184 for generator 23. -/
def ep_Q2_054_partial_23_0184 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 23. -/
theorem ep_Q2_054_partial_23_0184_valid :
    mulPoly ep_Q2_054_coefficient_23_0184
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0185 : Poly :=
[
  term ((-113810323827747 : Rat) / 180133946068) [(7, 1), (15, 1)]
]

/-- Partial product 185 for generator 23. -/
def ep_Q2_054_partial_23_0185 : Poly :=
[
  term ((113810323827747 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-113810323827747 : Rat) / 180133946068) [(0, 2), (7, 1), (15, 1)],
  term ((113810323827747 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-113810323827747 : Rat) / 180133946068) [(1, 2), (7, 1), (15, 1)],
  term ((-113810323827747 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((113810323827747 : Rat) / 180133946068) [(7, 1), (8, 2), (15, 1)],
  term ((-113810323827747 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((113810323827747 : Rat) / 180133946068) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 23. -/
theorem ep_Q2_054_partial_23_0185_valid :
    mulPoly ep_Q2_054_coefficient_23_0185
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0186 : Poly :=
[
  term ((-1084040011587 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 23. -/
def ep_Q2_054_partial_23_0186 : Poly :=
[
  term ((2168080023174 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1084040011587 : Rat) / 45033486517) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((2168080023174 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1084040011587 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2168080023174 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1084040011587 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2168080023174 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1084040011587 : Rat) / 45033486517) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 23. -/
theorem ep_Q2_054_partial_23_0186_valid :
    mulPoly ep_Q2_054_coefficient_23_0186
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0187 : Poly :=
[
  term ((1253905836768 : Rat) / 45033486517) [(7, 2)]
]

/-- Partial product 187 for generator 23. -/
def ep_Q2_054_partial_23_0187 : Poly :=
[
  term ((-2507811673536 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1)],
  term ((1253905836768 : Rat) / 45033486517) [(0, 2), (7, 2)],
  term ((-2507811673536 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1)],
  term ((1253905836768 : Rat) / 45033486517) [(1, 2), (7, 2)],
  term ((2507811673536 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1)],
  term ((-1253905836768 : Rat) / 45033486517) [(7, 2), (8, 2)],
  term ((2507811673536 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1)],
  term ((-1253905836768 : Rat) / 45033486517) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 23. -/
theorem ep_Q2_054_partial_23_0187_valid :
    mulPoly ep_Q2_054_coefficient_23_0187
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0188 : Poly :=
[
  term ((-589065202386 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 188 for generator 23. -/
def ep_Q2_054_partial_23_0188 : Poly :=
[
  term ((1178130404772 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1)],
  term ((-589065202386 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1)],
  term ((1178130404772 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1)],
  term ((-589065202386 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((-1178130404772 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((589065202386 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2)],
  term ((-1178130404772 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1)],
  term ((589065202386 : Rat) / 45033486517) [(7, 2), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 23. -/
theorem ep_Q2_054_partial_23_0188_valid :
    mulPoly ep_Q2_054_coefficient_23_0188
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0189 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 189 for generator 23. -/
def ep_Q2_054_partial_23_0189 : Poly :=
[
  term ((-13727981250000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 2), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 23. -/
theorem ep_Q2_054_partial_23_0189_valid :
    mulPoly ep_Q2_054_coefficient_23_0189
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0190 : Poly :=
[
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 190 for generator 23. -/
def ep_Q2_054_partial_23_0190 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 23. -/
theorem ep_Q2_054_partial_23_0190_valid :
    mulPoly ep_Q2_054_coefficient_23_0190
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0191 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 191 for generator 23. -/
def ep_Q2_054_partial_23_0191 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 23. -/
theorem ep_Q2_054_partial_23_0191_valid :
    mulPoly ep_Q2_054_coefficient_23_0191
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0192 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 192 for generator 23. -/
def ep_Q2_054_partial_23_0192 : Poly :=
[
  term ((-1057909264920 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (11, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(0, 2), (7, 2), (11, 1), (13, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 2), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(1, 2), (7, 2), (11, 1), (13, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 23. -/
theorem ep_Q2_054_partial_23_0192_valid :
    mulPoly ep_Q2_054_coefficient_23_0192
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0193 : Poly :=
[
  term ((233375681250 : Rat) / 45033486517) [(7, 2), (12, 1)]
]

/-- Partial product 193 for generator 23. -/
def ep_Q2_054_partial_23_0193 : Poly :=
[
  term ((-466751362500 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (12, 1)],
  term ((233375681250 : Rat) / 45033486517) [(0, 2), (7, 2), (12, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term ((233375681250 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (12, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(7, 2), (8, 2), (12, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(7, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 23. -/
theorem ep_Q2_054_partial_23_0193_valid :
    mulPoly ep_Q2_054_coefficient_23_0193
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0194 : Poly :=
[
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 194 for generator 23. -/
def ep_Q2_054_partial_23_0194 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (8, 2), (13, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 23. -/
theorem ep_Q2_054_partial_23_0194_valid :
    mulPoly ep_Q2_054_coefficient_23_0194
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0195 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (16, 1)]
]

/-- Partial product 195 for generator 23. -/
def ep_Q2_054_partial_23_0195 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (7, 2), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (7, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (8, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 23. -/
theorem ep_Q2_054_partial_23_0195_valid :
    mulPoly ep_Q2_054_coefficient_23_0195
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0196 : Poly :=
[
  term ((3510658547211 : Rat) / 90066973034) [(8, 1)]
]

/-- Partial product 196 for generator 23. -/
def ep_Q2_054_partial_23_0196 : Poly :=
[
  term ((-3510658547211 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1)],
  term ((3510658547211 : Rat) / 90066973034) [(0, 2), (8, 1)],
  term ((-3510658547211 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)],
  term ((3510658547211 : Rat) / 90066973034) [(1, 2), (8, 1)],
  term ((3510658547211 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)],
  term ((-3510658547211 : Rat) / 90066973034) [(8, 1), (9, 2)],
  term ((3510658547211 : Rat) / 45033486517) [(8, 2), (10, 1)],
  term ((-3510658547211 : Rat) / 90066973034) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 23. -/
theorem ep_Q2_054_partial_23_0196_valid :
    mulPoly ep_Q2_054_coefficient_23_0196
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0197 : Poly :=
[
  term ((-734867342892 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 197 for generator 23. -/
def ep_Q2_054_partial_23_0197 : Poly :=
[
  term ((1469734685784 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((734867342892 : Rat) / 45033486517) [(8, 1), (9, 3), (13, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((734867342892 : Rat) / 45033486517) [(8, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 23. -/
theorem ep_Q2_054_partial_23_0197_valid :
    mulPoly ep_Q2_054_coefficient_23_0197
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0198 : Poly :=
[
  term ((912375715122 : Rat) / 45033486517) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 198 for generator 23. -/
def ep_Q2_054_partial_23_0198 : Poly :=
[
  term ((-1824751430244 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((912375715122 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1824751430244 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((912375715122 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((1824751430244 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-912375715122 : Rat) / 45033486517) [(8, 1), (9, 3), (15, 1)],
  term ((1824751430244 : Rat) / 45033486517) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-912375715122 : Rat) / 45033486517) [(8, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 23. -/
theorem ep_Q2_054_partial_23_0198_valid :
    mulPoly ep_Q2_054_coefficient_23_0198
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0199 : Poly :=
[
  term ((89484995937 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 199 for generator 23. -/
def ep_Q2_054_partial_23_0199 : Poly :=
[
  term ((-178969991874 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((89484995937 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((89484995937 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((178969991874 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((178969991874 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 23. -/
theorem ep_Q2_054_partial_23_0199_valid :
    mulPoly ep_Q2_054_coefficient_23_0199
        ep_Q2_054_generator_23_0100_0199 =
      ep_Q2_054_partial_23_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_23_0100_0199 : List Poly :=
[
  ep_Q2_054_partial_23_0100,
  ep_Q2_054_partial_23_0101,
  ep_Q2_054_partial_23_0102,
  ep_Q2_054_partial_23_0103,
  ep_Q2_054_partial_23_0104,
  ep_Q2_054_partial_23_0105,
  ep_Q2_054_partial_23_0106,
  ep_Q2_054_partial_23_0107,
  ep_Q2_054_partial_23_0108,
  ep_Q2_054_partial_23_0109,
  ep_Q2_054_partial_23_0110,
  ep_Q2_054_partial_23_0111,
  ep_Q2_054_partial_23_0112,
  ep_Q2_054_partial_23_0113,
  ep_Q2_054_partial_23_0114,
  ep_Q2_054_partial_23_0115,
  ep_Q2_054_partial_23_0116,
  ep_Q2_054_partial_23_0117,
  ep_Q2_054_partial_23_0118,
  ep_Q2_054_partial_23_0119,
  ep_Q2_054_partial_23_0120,
  ep_Q2_054_partial_23_0121,
  ep_Q2_054_partial_23_0122,
  ep_Q2_054_partial_23_0123,
  ep_Q2_054_partial_23_0124,
  ep_Q2_054_partial_23_0125,
  ep_Q2_054_partial_23_0126,
  ep_Q2_054_partial_23_0127,
  ep_Q2_054_partial_23_0128,
  ep_Q2_054_partial_23_0129,
  ep_Q2_054_partial_23_0130,
  ep_Q2_054_partial_23_0131,
  ep_Q2_054_partial_23_0132,
  ep_Q2_054_partial_23_0133,
  ep_Q2_054_partial_23_0134,
  ep_Q2_054_partial_23_0135,
  ep_Q2_054_partial_23_0136,
  ep_Q2_054_partial_23_0137,
  ep_Q2_054_partial_23_0138,
  ep_Q2_054_partial_23_0139,
  ep_Q2_054_partial_23_0140,
  ep_Q2_054_partial_23_0141,
  ep_Q2_054_partial_23_0142,
  ep_Q2_054_partial_23_0143,
  ep_Q2_054_partial_23_0144,
  ep_Q2_054_partial_23_0145,
  ep_Q2_054_partial_23_0146,
  ep_Q2_054_partial_23_0147,
  ep_Q2_054_partial_23_0148,
  ep_Q2_054_partial_23_0149,
  ep_Q2_054_partial_23_0150,
  ep_Q2_054_partial_23_0151,
  ep_Q2_054_partial_23_0152,
  ep_Q2_054_partial_23_0153,
  ep_Q2_054_partial_23_0154,
  ep_Q2_054_partial_23_0155,
  ep_Q2_054_partial_23_0156,
  ep_Q2_054_partial_23_0157,
  ep_Q2_054_partial_23_0158,
  ep_Q2_054_partial_23_0159,
  ep_Q2_054_partial_23_0160,
  ep_Q2_054_partial_23_0161,
  ep_Q2_054_partial_23_0162,
  ep_Q2_054_partial_23_0163,
  ep_Q2_054_partial_23_0164,
  ep_Q2_054_partial_23_0165,
  ep_Q2_054_partial_23_0166,
  ep_Q2_054_partial_23_0167,
  ep_Q2_054_partial_23_0168,
  ep_Q2_054_partial_23_0169,
  ep_Q2_054_partial_23_0170,
  ep_Q2_054_partial_23_0171,
  ep_Q2_054_partial_23_0172,
  ep_Q2_054_partial_23_0173,
  ep_Q2_054_partial_23_0174,
  ep_Q2_054_partial_23_0175,
  ep_Q2_054_partial_23_0176,
  ep_Q2_054_partial_23_0177,
  ep_Q2_054_partial_23_0178,
  ep_Q2_054_partial_23_0179,
  ep_Q2_054_partial_23_0180,
  ep_Q2_054_partial_23_0181,
  ep_Q2_054_partial_23_0182,
  ep_Q2_054_partial_23_0183,
  ep_Q2_054_partial_23_0184,
  ep_Q2_054_partial_23_0185,
  ep_Q2_054_partial_23_0186,
  ep_Q2_054_partial_23_0187,
  ep_Q2_054_partial_23_0188,
  ep_Q2_054_partial_23_0189,
  ep_Q2_054_partial_23_0190,
  ep_Q2_054_partial_23_0191,
  ep_Q2_054_partial_23_0192,
  ep_Q2_054_partial_23_0193,
  ep_Q2_054_partial_23_0194,
  ep_Q2_054_partial_23_0195,
  ep_Q2_054_partial_23_0196,
  ep_Q2_054_partial_23_0197,
  ep_Q2_054_partial_23_0198,
  ep_Q2_054_partial_23_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_23_0100_0199 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-8211526528158 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((9492959987496 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((1562832264330 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((56222515769760 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((6605074961010 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((17009567950608 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1093360498713 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((128127825000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 2)],
  term ((9151987500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91519875000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2115901131120 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2217587766354 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16473801663720 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-1353834533805 : Rat) / 45033486517) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-464275379772 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-5582272070016 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((35008673602374 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-14483839553100 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (10, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((8368278588900 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((734867342892 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 2), (10, 1)],
  term ((-1784781074202 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1)],
  term ((-7300642901544 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8135100000 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (12, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-58815116944866 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6965830911384 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((1269540678672 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(0, 1), (6, 2), (10, 1)],
  term ((-1265682617892 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-3386235375000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-434343434544 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-26909274436722 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5481124483959 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((104871884544 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((30506625000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-24065900454417 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-1400254087500 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((422338955154 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((2987113727925 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-41543596207539 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((113810323827747 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((2168080023174 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1178130404772 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-2507811673536 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (11, 1), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (12, 1)],
  term ((528954632460 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1824751430244 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3510658547211 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((4105763264079 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-4746479993748 : Rat) / 45033486517) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28111257884880 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2)],
  term ((-3302537480505 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(0, 2), (2, 1), (16, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((1093360498713 : Rat) / 90066973034) [(0, 2), (3, 1), (7, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (11, 2)],
  term ((-4575993750 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((45759937500 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((1057950565560 : Rat) / 45033486517) [(0, 2), (3, 1), (11, 1), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(0, 2), (3, 1), (11, 2), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1108793883177 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8236900831860 : Rat) / 45033486517) [(0, 2), (3, 1), (15, 1)],
  term ((1353834533805 : Rat) / 90066973034) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((892390537101 : Rat) / 45033486517) [(0, 2), (6, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((232137689886 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((2791136035008 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((-17504336801187 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((7241919776550 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 2)],
  term ((-3623852303451 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((40825963494 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-4184139294450 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 2)],
  term ((3650321450772 : Rat) / 45033486517) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4067550000 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((29407558472433 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3482915455692 : Rat) / 45033486517) [(0, 2), (6, 1), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(0, 2), (6, 1), (16, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(0, 2), (6, 2)],
  term ((632841308946 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1)],
  term ((1693117687500 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((217171717272 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((13454637218361 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((460840567005 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((5481124483959 : Rat) / 90066973034) [(0, 2), (7, 1), (9, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((24065900454417 : Rat) / 180133946068) [(0, 2), (7, 1), (11, 1)],
  term ((700127043750 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-211169477577 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-2987113727925 : Rat) / 90066973034) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((41543596207539 : Rat) / 180133946068) [(0, 2), (7, 1), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((-113810323827747 : Rat) / 180133946068) [(0, 2), (7, 1), (15, 1)],
  term ((-1084040011587 : Rat) / 45033486517) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((1253905836768 : Rat) / 45033486517) [(0, 2), (7, 2)],
  term ((-589065202386 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (16, 1)],
  term ((528954632460 : Rat) / 45033486517) [(0, 2), (7, 2), (11, 1), (13, 1)],
  term ((233375681250 : Rat) / 45033486517) [(0, 2), (7, 2), (12, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (7, 2), (16, 1)],
  term ((3510658547211 : Rat) / 90066973034) [(0, 2), (8, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((912375715122 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((89484995937 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-8211526528158 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((9492959987496 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((1562832264330 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((56222515769760 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((6605074961010 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((17009567950608 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1093360498713 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((9151987500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91519875000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (13, 1)],
  term ((128127825000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 3)],
  term ((25390813573440 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2217587766354 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16473801663720 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-1353834533805 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2115901131120 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-464275379772 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((35008673602374 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-14483839553100 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-5582272070016 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((-38827572436728 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (11, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((8368278588900 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((734867342892 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((-1784781074202 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1)],
  term ((-8135100000 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-58815116944866 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6965830911384 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((1269540678672 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7300642901544 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(1, 1), (6, 2), (11, 1)],
  term ((-1265682617892 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-434343434544 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-26909274436722 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3386235375000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((367622707952592 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5481124483959 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((104871884544 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((30506625000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((2987113727925 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-41543596207539 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((113810323827747 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((2168080023174 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24065900454417 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 2)],
  term ((-1400254087500 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((422338955154 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((1178130404772 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 2), (13, 1)],
  term ((-2507811673536 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term ((528954632460 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 2), (13, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1824751430244 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3510658547211 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((4105763264079 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-4746479993748 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28111257884880 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2)],
  term ((-3302537480505 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(1, 2), (2, 1), (16, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((1093360498713 : Rat) / 90066973034) [(1, 2), (3, 1), (7, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-64063912500 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (11, 2)],
  term ((-4575993750 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (12, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((45759937500 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((1057950565560 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1108793883177 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8236900831860 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1)],
  term ((1353834533805 : Rat) / 90066973034) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((892390537101 : Rat) / 45033486517) [(1, 2), (6, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((232137689886 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((2791136035008 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-17504336801187 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((7241919776550 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 2)],
  term ((-3623852303451 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((40825963494 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-4184139294450 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 2)],
  term ((3650321450772 : Rat) / 45033486517) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4067550000 : Rat) / 45033486517) [(1, 2), (6, 1), (12, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((29407558472433 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3482915455692 : Rat) / 45033486517) [(1, 2), (6, 1), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(1, 2), (6, 1), (16, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(1, 2), (6, 2)],
  term ((632841308946 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((1693117687500 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((217171717272 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((13454637218361 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((460840567005 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((5481124483959 : Rat) / 90066973034) [(1, 2), (7, 1), (9, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((24065900454417 : Rat) / 180133946068) [(1, 2), (7, 1), (11, 1)],
  term ((700127043750 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-211169477577 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-2987113727925 : Rat) / 90066973034) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((41543596207539 : Rat) / 180133946068) [(1, 2), (7, 1), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((-113810323827747 : Rat) / 180133946068) [(1, 2), (7, 1), (15, 1)],
  term ((-1084040011587 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((1253905836768 : Rat) / 45033486517) [(1, 2), (7, 2)],
  term ((-589065202386 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1), (16, 1)],
  term ((528954632460 : Rat) / 45033486517) [(1, 2), (7, 2), (11, 1), (13, 1)],
  term ((233375681250 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (7, 2), (16, 1)],
  term ((3510658547211 : Rat) / 90066973034) [(1, 2), (8, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((912375715122 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((89484995937 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((8211526528158 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 2), (13, 1)],
  term ((-4105763264079 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 2), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((8211526528158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (13, 1)],
  term ((-4105763264079 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-9492959987496 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56222515769760 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-6605074961010 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (8, 2), (12, 1), (16, 1)],
  term ((4746479993748 : Rat) / 45033486517) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((28111257884880 : Rat) / 45033486517) [(2, 1), (8, 2), (15, 2)],
  term ((3302537480505 : Rat) / 45033486517) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (8, 2), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-9492959987496 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56222515769760 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-6605074961010 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((28111257884880 : Rat) / 45033486517) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((2823392938500 : Rat) / 45033486517) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (9, 2), (12, 1), (16, 1)],
  term ((4746479993748 : Rat) / 45033486517) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((28111257884880 : Rat) / 45033486517) [(2, 1), (9, 2), (15, 2)],
  term ((3302537480505 : Rat) / 45033486517) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (9, 2), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (9, 3), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (9, 3), (15, 1), (16, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (10, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 2)],
  term ((-38827572436728 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 2)],
  term ((30717321786144 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (9, 2), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (9, 2), (15, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 2)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((1093360498713 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((91519875000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1093360498713 : Rat) / 90066973034) [(3, 1), (7, 1), (8, 2)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (10, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (11, 2)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (12, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-45759937500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 3)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 3), (16, 1)],
  term ((1093360498713 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((91519875000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 3)],
  term ((-1093360498713 : Rat) / 90066973034) [(3, 1), (7, 1), (9, 2)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (11, 2)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (12, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-45759937500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2217587766354 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((16473801663720 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((1353834533805 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (8, 2), (10, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (8, 2), (11, 1), (15, 2)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (8, 2), (11, 2), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (8, 2), (12, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((1108793883177 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8236900831860 : Rat) / 45033486517) [(3, 1), (8, 2), (15, 1)],
  term ((-1353834533805 : Rat) / 90066973034) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (8, 3), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 3), (15, 1), (16, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2217587766354 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((16473801663720 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((1353834533805 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2115901131120 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 2), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 3), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1057950565560 : Rat) / 45033486517) [(3, 1), (9, 2), (11, 1), (15, 2)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 2), (11, 2), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (9, 2), (12, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1108793883177 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8236900831860 : Rat) / 45033486517) [(3, 1), (9, 2), (15, 1)],
  term ((-1353834533805 : Rat) / 90066973034) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((464275379772 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 2), (13, 1)],
  term ((5582272070016 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-35008673602374 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((14483839553100 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-2791136035008 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((17504336801187 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((-7241919776550 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 3), (13, 1)],
  term ((-35008673602374 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((14483839553100 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((5582272070016 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-2326860655236 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((17504336801187 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((-7241919776550 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1)],
  term ((-232137689886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3)],
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3), (16, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (10, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2)],
  term ((38827572436728 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (11, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)],
  term ((81651926988 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-8368278588900 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7247704606902 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (10, 1)],
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (16, 1)],
  term ((1784781074202 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1)],
  term ((7300642901544 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8135100000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((58815116944866 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6965830911384 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-892390537101 : Rat) / 45033486517) [(6, 1), (8, 2)],
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((4184139294450 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 2)],
  term ((-7247704606902 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 2), (10, 1), (16, 1)],
  term ((-3650321450772 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1), (16, 1)],
  term ((-29407558472433 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((3482915455692 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (8, 2), (16, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(6, 1), (8, 3)],
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (8, 3), (12, 1), (16, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 3), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 3), (16, 1)],
  term ((1784781074202 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1)],
  term ((8135100000 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((58815116944866 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((5683712666940 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6965830911384 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((7300642901544 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-892390537101 : Rat) / 45033486517) [(6, 1), (9, 2)],
  term ((81651926988 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-12018600039672 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-323518744674 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)],
  term ((1420928166735 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-29407558472433 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3482915455692 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (9, 2), (16, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(6, 1), (9, 3), (11, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (9, 3), (13, 1)],
  term ((4184139294450 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 4)],
  term ((-1473359911254 : Rat) / 45033486517) [(6, 2), (8, 1), (10, 1)],
  term ((736679955627 : Rat) / 45033486517) [(6, 2), (8, 2)],
  term ((-1473359911254 : Rat) / 45033486517) [(6, 2), (9, 1), (11, 1)],
  term ((736679955627 : Rat) / 45033486517) [(6, 2), (9, 2)],
  term ((5481124483959 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-104871884544 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((434343434544 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((26909274436722 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((921681134010 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3386235375000 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-427435069608 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-217171717272 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1), (15, 2)],
  term ((-13454637218361 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((-460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 3)],
  term ((24065900454417 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((1400254087500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-422338955154 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2987113727925 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((41543596207539 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-113810323827747 : Rat) / 90066973034) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2168080023174 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5481124483959 : Rat) / 90066973034) [(7, 1), (8, 2), (9, 1)],
  term ((1265682617892 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((52435942272 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((15253312500 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((3386235375000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((434343434544 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1), (15, 2)],
  term ((26909274436722 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((921681134010 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-24065900454417 : Rat) / 180133946068) [(7, 1), (8, 2), (11, 1)],
  term ((-700127043750 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((211169477577 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((2987113727925 : Rat) / 90066973034) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-41543596207539 : Rat) / 180133946068) [(7, 1), (8, 2), (13, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((113810323827747 : Rat) / 180133946068) [(7, 1), (8, 2), (15, 1)],
  term ((1084040011587 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-632841308946 : Rat) / 45033486517) [(7, 1), (8, 3), (9, 1)],
  term ((-1693117687500 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1), (13, 1), (15, 1)],
  term ((-217171717272 : Rat) / 45033486517) [(7, 1), (8, 3), (13, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 3), (13, 1), (15, 2)],
  term ((-13454637218361 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1)],
  term ((-460840567005 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1), (16, 1)],
  term ((-2987113727925 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((41543596207539 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-113810323827747 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2168080023174 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((24065900454417 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)],
  term ((1400254087500 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-422338955154 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2141402518581 : Rat) / 180133946068) [(7, 1), (9, 2), (11, 1)],
  term ((-804998928294 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((-79355755837332 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((180662852577 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 2), (13, 1)],
  term ((2987113727925 : Rat) / 90066973034) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-41543596207539 : Rat) / 180133946068) [(7, 1), (9, 2), (13, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((113810323827747 : Rat) / 180133946068) [(7, 1), (9, 2), (15, 1)],
  term ((1084040011587 : Rat) / 45033486517) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5481124483959 : Rat) / 90066973034) [(7, 1), (9, 3)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 3), (11, 1), (13, 1)],
  term ((52435942272 : Rat) / 45033486517) [(7, 1), (9, 3), (12, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((15253312500 : Rat) / 45033486517) [(7, 1), (9, 3), (16, 1)],
  term ((-1178130404772 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((589065202386 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((2507811673536 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (12, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-1253905836768 : Rat) / 45033486517) [(7, 2), (8, 2)],
  term ((-1178130404772 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(7, 2), (8, 2), (12, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (8, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (8, 2), (16, 1)],
  term ((589065202386 : Rat) / 45033486517) [(7, 2), (8, 3)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 3), (11, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 3), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 3), (16, 1)],
  term ((2507811673536 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-1253905836768 : Rat) / 45033486517) [(7, 2), (9, 2)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(7, 2), (9, 2), (12, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (9, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (9, 2), (16, 1)],
  term ((3510658547211 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)],
  term ((178969991874 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-3510658547211 : Rat) / 90066973034) [(8, 1), (9, 2)],
  term ((-1559219681721 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((1824751430244 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((734867342892 : Rat) / 45033486517) [(8, 1), (9, 3), (13, 1)],
  term ((-912375715122 : Rat) / 45033486517) [(8, 1), (9, 3), (15, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((1824751430244 : Rat) / 45033486517) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((3510658547211 : Rat) / 45033486517) [(8, 2), (10, 1)],
  term ((178969991874 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3510658547211 : Rat) / 90066973034) [(8, 3)],
  term ((734867342892 : Rat) / 45033486517) [(8, 3), (9, 1), (13, 1)],
  term ((-912375715122 : Rat) / 45033486517) [(8, 3), (9, 1), (15, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 100 through 199. -/
theorem ep_Q2_054_block_23_0100_0199_valid :
    checkProductSumEq ep_Q2_054_partials_23_0100_0199
      ep_Q2_054_block_23_0100_0199 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
