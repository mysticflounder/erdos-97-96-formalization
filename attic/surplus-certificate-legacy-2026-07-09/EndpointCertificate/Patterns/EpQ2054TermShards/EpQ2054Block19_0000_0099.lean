/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 19:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 19 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_19_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0000 : Poly :=
[
  term ((-9766885192269 : Rat) / 180133946068) []
]

/-- Partial product 0 for generator 19. -/
def ep_Q2_054_partial_19_0000 : Poly :=
[
  term ((9766885192269 : Rat) / 90066973034) [(0, 1), (8, 1)],
  term ((-9766885192269 : Rat) / 180133946068) [(0, 2)],
  term ((9766885192269 : Rat) / 90066973034) [(1, 1), (9, 1)],
  term ((-9766885192269 : Rat) / 180133946068) [(1, 2)],
  term ((-9766885192269 : Rat) / 90066973034) [(6, 1), (8, 1)],
  term ((9766885192269 : Rat) / 180133946068) [(6, 2)],
  term ((-9766885192269 : Rat) / 90066973034) [(7, 1), (9, 1)],
  term ((9766885192269 : Rat) / 180133946068) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem ep_Q2_054_partial_19_0000_valid :
    mulPoly ep_Q2_054_coefficient_19_0000
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0001 : Poly :=
[
  term ((3146142735261 : Rat) / 45033486517) [(0, 1)]
]

/-- Partial product 1 for generator 19. -/
def ep_Q2_054_partial_19_0001 : Poly :=
[
  term ((-6292285470522 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1)],
  term ((3146142735261 : Rat) / 45033486517) [(0, 1), (1, 2)],
  term ((6292285470522 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1)],
  term ((-3146142735261 : Rat) / 45033486517) [(0, 1), (6, 2)],
  term ((6292285470522 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1)],
  term ((-3146142735261 : Rat) / 45033486517) [(0, 1), (7, 2)],
  term ((-6292285470522 : Rat) / 45033486517) [(0, 2), (8, 1)],
  term ((3146142735261 : Rat) / 45033486517) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem ep_Q2_054_partial_19_0001_valid :
    mulPoly ep_Q2_054_coefficient_19_0001
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0002 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 19. -/
def ep_Q2_054_partial_19_0002 : Poly :=
[
  term ((1270014208992 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (9, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 2)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 3), (9, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (9, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem ep_Q2_054_partial_19_0002_valid :
    mulPoly ep_Q2_054_coefficient_19_0002
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0003 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 3 for generator 19. -/
def ep_Q2_054_partial_19_0003 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (8, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 3), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 3), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem ep_Q2_054_partial_19_0003_valid :
    mulPoly ep_Q2_054_coefficient_19_0003
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0004 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1)]
]

/-- Partial product 4 for generator 19. -/
def ep_Q2_054_partial_19_0004 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 2)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 2), (2, 1), (8, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 3), (2, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem ep_Q2_054_partial_19_0004_valid :
    mulPoly ep_Q2_054_coefficient_19_0004
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0005 : Poly :=
[
  term ((19798169693364 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 5 for generator 19. -/
def ep_Q2_054_partial_19_0005 : Poly :=
[
  term ((-39596339386728 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (9, 1)],
  term ((19798169693364 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((39596339386728 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (8, 1)],
  term ((-19798169693364 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1)],
  term ((39596339386728 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (9, 1)],
  term ((-19798169693364 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3)],
  term ((-39596339386728 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1)],
  term ((19798169693364 : Rat) / 45033486517) [(0, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem ep_Q2_054_partial_19_0005_valid :
    mulPoly ep_Q2_054_coefficient_19_0005
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0006 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 6 for generator 19. -/
def ep_Q2_054_partial_19_0006 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 3), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 19. -/
theorem ep_Q2_054_partial_19_0006_valid :
    mulPoly ep_Q2_054_coefficient_19_0006
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0007 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 7 for generator 19. -/
def ep_Q2_054_partial_19_0007 : Poly :=
[
  term ((30717321786144 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 19. -/
theorem ep_Q2_054_partial_19_0007_valid :
    mulPoly ep_Q2_054_coefficient_19_0007
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0008 : Poly :=
[
  term ((2157080581944 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 8 for generator 19. -/
def ep_Q2_054_partial_19_0008 : Poly :=
[
  term ((-4314161163888 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((2157080581944 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((4314161163888 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-2157080581944 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((4314161163888 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2157080581944 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-4314161163888 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((2157080581944 : Rat) / 45033486517) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 19. -/
theorem ep_Q2_054_partial_19_0008_valid :
    mulPoly ep_Q2_054_coefficient_19_0008
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0009 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 19. -/
def ep_Q2_054_partial_19_0009 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 19. -/
theorem ep_Q2_054_partial_19_0009_valid :
    mulPoly ep_Q2_054_coefficient_19_0009
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0010 : Poly :=
[
  term ((59529693384 : Rat) / 45033486517) [(0, 1), (6, 1)]
]

/-- Partial product 10 for generator 19. -/
def ep_Q2_054_partial_19_0010 : Poly :=
[
  term ((-119059386768 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term ((59529693384 : Rat) / 45033486517) [(0, 1), (1, 2), (6, 1)],
  term ((119059386768 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((-59529693384 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2)],
  term ((119059386768 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((-59529693384 : Rat) / 45033486517) [(0, 1), (6, 3)],
  term ((-119059386768 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((59529693384 : Rat) / 45033486517) [(0, 3), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 19. -/
theorem ep_Q2_054_partial_19_0010_valid :
    mulPoly ep_Q2_054_coefficient_19_0010
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0011 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 11 for generator 19. -/
def ep_Q2_054_partial_19_0011 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (9, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 3), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (8, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 3), (7, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 3), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 19. -/
theorem ep_Q2_054_partial_19_0011_valid :
    mulPoly ep_Q2_054_coefficient_19_0011
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0012 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 12 for generator 19. -/
def ep_Q2_054_partial_19_0012 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 3), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 3), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 19. -/
theorem ep_Q2_054_partial_19_0012_valid :
    mulPoly ep_Q2_054_coefficient_19_0012
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0013 : Poly :=
[
  term ((-10393375720950 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 13 for generator 19. -/
def ep_Q2_054_partial_19_0013 : Poly :=
[
  term ((20786751441900 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 2)],
  term ((-10393375720950 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((-20786751441900 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((10393375720950 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((-20786751441900 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 2)],
  term ((10393375720950 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1)],
  term ((20786751441900 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1)],
  term ((-10393375720950 : Rat) / 45033486517) [(0, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 19. -/
theorem ep_Q2_054_partial_19_0013_valid :
    mulPoly ep_Q2_054_coefficient_19_0013
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0014 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 14 for generator 19. -/
def ep_Q2_054_partial_19_0014 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 3), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 19. -/
theorem ep_Q2_054_partial_19_0014_valid :
    mulPoly ep_Q2_054_coefficient_19_0014
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0015 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 15 for generator 19. -/
def ep_Q2_054_partial_19_0015 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 3), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 19. -/
theorem ep_Q2_054_partial_19_0015_valid :
    mulPoly ep_Q2_054_coefficient_19_0015
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0016 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 16 for generator 19. -/
def ep_Q2_054_partial_19_0016 : Poly :=
[
  term ((-2418172721280 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 3), (11, 1), (13, 1), (15, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 3), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 19. -/
theorem ep_Q2_054_partial_19_0016_valid :
    mulPoly ep_Q2_054_coefficient_19_0016
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0017 : Poly :=
[
  term ((7674796227420 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 17 for generator 19. -/
def ep_Q2_054_partial_19_0017 : Poly :=
[
  term ((-15349592454840 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((7674796227420 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((15349592454840 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-7674796227420 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((15349592454840 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((-7674796227420 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)],
  term ((-15349592454840 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((7674796227420 : Rat) / 45033486517) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 19. -/
theorem ep_Q2_054_partial_19_0017_valid :
    mulPoly ep_Q2_054_coefficient_19_0017
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0018 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 18 for generator 19. -/
def ep_Q2_054_partial_19_0018 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (13, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 3), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 19. -/
theorem ep_Q2_054_partial_19_0018_valid :
    mulPoly ep_Q2_054_coefficient_19_0018
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0019 : Poly :=
[
  term ((834302246859 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 19 for generator 19. -/
def ep_Q2_054_partial_19_0019 : Poly :=
[
  term ((-1668604493718 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((834302246859 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((1668604493718 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-834302246859 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((1668604493718 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-834302246859 : Rat) / 45033486517) [(0, 1), (7, 3), (15, 1)],
  term ((-1668604493718 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((834302246859 : Rat) / 45033486517) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 19. -/
theorem ep_Q2_054_partial_19_0019_valid :
    mulPoly ep_Q2_054_coefficient_19_0019
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0020 : Poly :=
[
  term ((-9761805034182 : Rat) / 45033486517) [(0, 1), (7, 2)]
]

/-- Partial product 20 for generator 19. -/
def ep_Q2_054_partial_19_0020 : Poly :=
[
  term ((19523610068364 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1)],
  term ((-9761805034182 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 2)],
  term ((-19523610068364 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1)],
  term ((9761805034182 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2)],
  term ((-19523610068364 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1)],
  term ((9761805034182 : Rat) / 45033486517) [(0, 1), (7, 4)],
  term ((19523610068364 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1)],
  term ((-9761805034182 : Rat) / 45033486517) [(0, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 19. -/
theorem ep_Q2_054_partial_19_0020_valid :
    mulPoly ep_Q2_054_coefficient_19_0020
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0021 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 21 for generator 19. -/
def ep_Q2_054_partial_19_0021 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 2), (11, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2), (11, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 4), (11, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 3), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 19. -/
theorem ep_Q2_054_partial_19_0021_valid :
    mulPoly ep_Q2_054_coefficient_19_0021
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0022 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)]
]

/-- Partial product 22 for generator 19. -/
def ep_Q2_054_partial_19_0022 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1), (13, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 4), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 3), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 19. -/
theorem ep_Q2_054_partial_19_0022_valid :
    mulPoly ep_Q2_054_coefficient_19_0022
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0023 : Poly :=
[
  term ((4809544634349 : Rat) / 45033486517) [(0, 1), (8, 1)]
]

/-- Partial product 23 for generator 19. -/
def ep_Q2_054_partial_19_0023 : Poly :=
[
  term ((-9619089268698 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1)],
  term ((4809544634349 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1)],
  term ((9619089268698 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2)],
  term ((-4809544634349 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((9619089268698 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((-4809544634349 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1)],
  term ((-9619089268698 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((4809544634349 : Rat) / 45033486517) [(0, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 19. -/
theorem ep_Q2_054_partial_19_0023_valid :
    mulPoly ep_Q2_054_coefficient_19_0023
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0024 : Poly :=
[
  term ((-177407343612 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 24 for generator 19. -/
def ep_Q2_054_partial_19_0024 : Poly :=
[
  term ((354814687224 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-177407343612 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (12, 1), (16, 1)],
  term ((177407343612 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1), (12, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((177407343612 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (12, 1), (16, 1)],
  term ((354814687224 : Rat) / 45033486517) [(0, 2), (8, 2), (12, 1), (16, 1)],
  term ((-177407343612 : Rat) / 45033486517) [(0, 3), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 19. -/
theorem ep_Q2_054_partial_19_0024_valid :
    mulPoly ep_Q2_054_coefficient_19_0024
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0025 : Poly :=
[
  term ((354814687224 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 19. -/
def ep_Q2_054_partial_19_0025 : Poly :=
[
  term ((-709629374448 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((354814687224 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((709629374448 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((709629374448 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-709629374448 : Rat) / 45033486517) [(0, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((354814687224 : Rat) / 45033486517) [(0, 3), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 19. -/
theorem ep_Q2_054_partial_19_0025_valid :
    mulPoly ep_Q2_054_coefficient_19_0025
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0026 : Poly :=
[
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 26 for generator 19. -/
def ep_Q2_054_partial_19_0026 : Poly :=
[
  term ((-236543124816 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (16, 1)],
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (16, 1)],
  term ((-236543124816 : Rat) / 45033486517) [(0, 2), (8, 2), (16, 1)],
  term ((118271562408 : Rat) / 45033486517) [(0, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 19. -/
theorem ep_Q2_054_partial_19_0026_valid :
    mulPoly ep_Q2_054_coefficient_19_0026
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0027 : Poly :=
[
  term ((7842634300512 : Rat) / 45033486517) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 27 for generator 19. -/
def ep_Q2_054_partial_19_0027 : Poly :=
[
  term ((-15685268601024 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((7842634300512 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((15685268601024 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-7842634300512 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((15685268601024 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((-7842634300512 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((-15685268601024 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((7842634300512 : Rat) / 45033486517) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 19. -/
theorem ep_Q2_054_partial_19_0027_valid :
    mulPoly ep_Q2_054_coefficient_19_0027
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0028 : Poly :=
[
  term ((4305136902318 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 28 for generator 19. -/
def ep_Q2_054_partial_19_0028 : Poly :=
[
  term ((-8610273804636 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((4305136902318 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((8610273804636 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-4305136902318 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((8610273804636 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((-4305136902318 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-8610273804636 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((4305136902318 : Rat) / 45033486517) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 19. -/
theorem ep_Q2_054_partial_19_0028_valid :
    mulPoly ep_Q2_054_coefficient_19_0028
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0029 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 19. -/
def ep_Q2_054_partial_19_0029 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 19. -/
theorem ep_Q2_054_partial_19_0029_valid :
    mulPoly ep_Q2_054_coefficient_19_0029
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0030 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (9, 2)]
]

/-- Partial product 30 for generator 19. -/
def ep_Q2_054_partial_19_0030 : Poly :=
[
  term ((653215415904 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 3)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 2)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 2)],
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 2)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 3)],
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 2)],
  term ((653215415904 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 2)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 19. -/
theorem ep_Q2_054_partial_19_0030_valid :
    mulPoly ep_Q2_054_coefficient_19_0030
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0031 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 31 for generator 19. -/
def ep_Q2_054_partial_19_0031 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 19. -/
theorem ep_Q2_054_partial_19_0031_valid :
    mulPoly ep_Q2_054_coefficient_19_0031
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0032 : Poly :=
[
  term ((24639759306 : Rat) / 45033486517) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 32 for generator 19. -/
def ep_Q2_054_partial_19_0032 : Poly :=
[
  term ((-49279518612 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 1), (16, 1)],
  term ((24639759306 : Rat) / 45033486517) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-24639759306 : Rat) / 45033486517) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-24639759306 : Rat) / 45033486517) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-49279518612 : Rat) / 45033486517) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((24639759306 : Rat) / 45033486517) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 19. -/
theorem ep_Q2_054_partial_19_0032_valid :
    mulPoly ep_Q2_054_coefficient_19_0032
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0033 : Poly :=
[
  term ((3740566583448 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 33 for generator 19. -/
def ep_Q2_054_partial_19_0033 : Poly :=
[
  term ((-7481133166896 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((3740566583448 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((7481133166896 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-3740566583448 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((7481133166896 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3740566583448 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-7481133166896 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((3740566583448 : Rat) / 45033486517) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 19. -/
theorem ep_Q2_054_partial_19_0033_valid :
    mulPoly ep_Q2_054_coefficient_19_0033
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0034 : Poly :=
[
  term ((-49279518612 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 19. -/
def ep_Q2_054_partial_19_0034 : Poly :=
[
  term ((98559037224 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49279518612 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-98559037224 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-98559037224 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((98559037224 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49279518612 : Rat) / 45033486517) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 19. -/
theorem ep_Q2_054_partial_19_0034_valid :
    mulPoly ep_Q2_054_coefficient_19_0034
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0035 : Poly :=
[
  term ((-13954652602686 : Rat) / 45033486517) [(0, 1), (15, 2)]
]

/-- Partial product 35 for generator 19. -/
def ep_Q2_054_partial_19_0035 : Poly :=
[
  term ((27909305205372 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((-13954652602686 : Rat) / 45033486517) [(0, 1), (1, 2), (15, 2)],
  term ((-27909305205372 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((13954652602686 : Rat) / 45033486517) [(0, 1), (6, 2), (15, 2)],
  term ((-27909305205372 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((13954652602686 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2)],
  term ((27909305205372 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((-13954652602686 : Rat) / 45033486517) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 19. -/
theorem ep_Q2_054_partial_19_0035_valid :
    mulPoly ep_Q2_054_coefficient_19_0035
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0036 : Poly :=
[
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (16, 1)]
]

/-- Partial product 36 for generator 19. -/
def ep_Q2_054_partial_19_0036 : Poly :=
[
  term ((32853012408 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (1, 2), (16, 1)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (6, 2), (16, 1)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (7, 2), (16, 1)],
  term ((32853012408 : Rat) / 45033486517) [(0, 2), (8, 1), (16, 1)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 19. -/
theorem ep_Q2_054_partial_19_0036_valid :
    mulPoly ep_Q2_054_coefficient_19_0036
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0037 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(0, 2)]
]

/-- Partial product 37 for generator 19. -/
def ep_Q2_054_partial_19_0037 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (1, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (6, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (7, 2)],
  term ((635007104496 : Rat) / 45033486517) [(0, 3), (8, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 19. -/
theorem ep_Q2_054_partial_19_0037_valid :
    mulPoly ep_Q2_054_coefficient_19_0037
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0038 : Poly :=
[
  term ((-384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 38 for generator 19. -/
def ep_Q2_054_partial_19_0038 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1)],
  term ((384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3)],
  term ((768766950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 19. -/
theorem ep_Q2_054_partial_19_0038_valid :
    mulPoly ep_Q2_054_coefficient_19_0038
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0039 : Poly :=
[
  term ((-329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 39 for generator 19. -/
def ep_Q2_054_partial_19_0039 : Poly :=
[
  term ((658943100000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3), (12, 1), (16, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 19. -/
theorem ep_Q2_054_partial_19_0039_valid :
    mulPoly ep_Q2_054_coefficient_19_0039
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0040 : Poly :=
[
  term ((658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 19. -/
def ep_Q2_054_partial_19_0040 : Poly :=
[
  term ((-1317886200000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((658943100000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1317886200000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 19. -/
theorem ep_Q2_054_partial_19_0040_valid :
    mulPoly ep_Q2_054_coefficient_19_0040
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0041 : Poly :=
[
  term ((237951675000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 41 for generator 19. -/
def ep_Q2_054_partial_19_0041 : Poly :=
[
  term ((-475903350000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (16, 1)],
  term ((237951675000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((475903350000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-237951675000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1), (16, 1)],
  term ((475903350000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (9, 1), (16, 1)],
  term ((-237951675000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3), (16, 1)],
  term ((-475903350000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((237951675000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 19. -/
theorem ep_Q2_054_partial_19_0041_valid :
    mulPoly ep_Q2_054_coefficient_19_0041
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0042 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 19. -/
def ep_Q2_054_partial_19_0042 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 3), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 19. -/
theorem ep_Q2_054_partial_19_0042_valid :
    mulPoly ep_Q2_054_coefficient_19_0042
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0043 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 19. -/
def ep_Q2_054_partial_19_0043 : Poly :=
[
  term ((21763554491520 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 3), (2, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 19. -/
theorem ep_Q2_054_partial_19_0043_valid :
    mulPoly ep_Q2_054_coefficient_19_0043
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0044 : Poly :=
[
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 44 for generator 19. -/
def ep_Q2_054_partial_19_0044 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 19. -/
theorem ep_Q2_054_partial_19_0044_valid :
    mulPoly ep_Q2_054_coefficient_19_0044
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0045 : Poly :=
[
  term ((-3148114539915 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 19. -/
def ep_Q2_054_partial_19_0045 : Poly :=
[
  term ((6296229079830 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3148114539915 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-6296229079830 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((3148114539915 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-6296229079830 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3148114539915 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((6296229079830 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3148114539915 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 19. -/
theorem ep_Q2_054_partial_19_0045_valid :
    mulPoly ep_Q2_054_coefficient_19_0045
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0046 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 46 for generator 19. -/
def ep_Q2_054_partial_19_0046 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (8, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 3)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 3), (7, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 19. -/
theorem ep_Q2_054_partial_19_0046_valid :
    mulPoly ep_Q2_054_coefficient_19_0046
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0047 : Poly :=
[
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 47 for generator 19. -/
def ep_Q2_054_partial_19_0047 : Poly :=
[
  term ((-1428765985116 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (8, 1), (9, 1)],
  term ((714382992558 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 2)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (9, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (6, 3), (9, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 2)],
  term ((714382992558 : Rat) / 45033486517) [(1, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 19. -/
theorem ep_Q2_054_partial_19_0047_valid :
    mulPoly ep_Q2_054_coefficient_19_0047
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0048 : Poly :=
[
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 48 for generator 19. -/
def ep_Q2_054_partial_19_0048 : Poly :=
[
  term ((158751776124 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (8, 1), (13, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (13, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (13, 1)],
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 3), (13, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 19. -/
theorem ep_Q2_054_partial_19_0048_valid :
    mulPoly ep_Q2_054_coefficient_19_0048
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0049 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 49 for generator 19. -/
def ep_Q2_054_partial_19_0049 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (6, 3), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 19. -/
theorem ep_Q2_054_partial_19_0049_valid :
    mulPoly ep_Q2_054_coefficient_19_0049
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0050 : Poly :=
[
  term ((-5182918104591 : Rat) / 90066973034) [(1, 1), (7, 1)]
]

/-- Partial product 50 for generator 19. -/
def ep_Q2_054_partial_19_0050 : Poly :=
[
  term ((5182918104591 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1)],
  term ((-5182918104591 : Rat) / 90066973034) [(0, 2), (1, 1), (7, 1)],
  term ((-5182918104591 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((5182918104591 : Rat) / 90066973034) [(1, 1), (6, 2), (7, 1)],
  term ((-5182918104591 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((5182918104591 : Rat) / 90066973034) [(1, 1), (7, 3)],
  term ((5182918104591 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1)],
  term ((-5182918104591 : Rat) / 90066973034) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 19. -/
theorem ep_Q2_054_partial_19_0050_valid :
    mulPoly ep_Q2_054_coefficient_19_0050
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0051 : Poly :=
[
  term ((-27900380790 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 51 for generator 19. -/
def ep_Q2_054_partial_19_0051 : Poly :=
[
  term ((55800761580 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 2)],
  term ((-27900380790 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((-55800761580 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 2)],
  term ((27900380790 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1)],
  term ((-55800761580 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1)],
  term ((27900380790 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1)],
  term ((55800761580 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((-27900380790 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 19. -/
theorem ep_Q2_054_partial_19_0051_valid :
    mulPoly ep_Q2_054_coefficient_19_0051
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0052 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 52 for generator 19. -/
def ep_Q2_054_partial_19_0052 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 19. -/
theorem ep_Q2_054_partial_19_0052_valid :
    mulPoly ep_Q2_054_coefficient_19_0052
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0053 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 53 for generator 19. -/
def ep_Q2_054_partial_19_0053 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (11, 1), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 3), (11, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 3), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 19. -/
theorem ep_Q2_054_partial_19_0053_valid :
    mulPoly ep_Q2_054_coefficient_19_0053
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0054 : Poly :=
[
  term ((114358069116 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 54 for generator 19. -/
def ep_Q2_054_partial_19_0054 : Poly :=
[
  term ((-228716138232 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1)],
  term ((114358069116 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((228716138232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1)],
  term ((-114358069116 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (12, 1)],
  term ((228716138232 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((-114358069116 : Rat) / 45033486517) [(1, 1), (7, 3), (12, 1)],
  term ((-228716138232 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((114358069116 : Rat) / 45033486517) [(1, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 19. -/
theorem ep_Q2_054_partial_19_0054_valid :
    mulPoly ep_Q2_054_coefficient_19_0054
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0055 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 55 for generator 19. -/
def ep_Q2_054_partial_19_0055 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 3), (12, 1), (16, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 19. -/
theorem ep_Q2_054_partial_19_0055_valid :
    mulPoly ep_Q2_054_coefficient_19_0055
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0056 : Poly :=
[
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 56 for generator 19. -/
def ep_Q2_054_partial_19_0056 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (7, 3), (13, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 19. -/
theorem ep_Q2_054_partial_19_0056_valid :
    mulPoly ep_Q2_054_coefficient_19_0056
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0057 : Poly :=
[
  term ((-585727200000 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 19. -/
def ep_Q2_054_partial_19_0057 : Poly :=
[
  term ((1171454400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 19. -/
theorem ep_Q2_054_partial_19_0057_valid :
    mulPoly ep_Q2_054_coefficient_19_0057
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0058 : Poly :=
[
  term ((-195242400000 : Rat) / 45033486517) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 58 for generator 19. -/
def ep_Q2_054_partial_19_0058 : Poly :=
[
  term ((390484800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 3), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 19. -/
theorem ep_Q2_054_partial_19_0058_valid :
    mulPoly ep_Q2_054_coefficient_19_0058
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0059 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 59 for generator 19. -/
def ep_Q2_054_partial_19_0059 : Poly :=
[
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (9, 1)],
  term ((653215415904 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 2), (9, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (9, 1)],
  term ((653215415904 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 2)],
  term ((-326607707952 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 2)],
  term ((326607707952 : Rat) / 45033486517) [(1, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 19. -/
theorem ep_Q2_054_partial_19_0059_valid :
    mulPoly ep_Q2_054_coefficient_19_0059
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0060 : Poly :=
[
  term ((1428765985116 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 60 for generator 19. -/
def ep_Q2_054_partial_19_0060 : Poly :=
[
  term ((-2857531970232 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((2857531970232 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 2), (13, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (13, 1)],
  term ((2857531970232 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (13, 1)],
  term ((-2857531970232 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 19. -/
theorem ep_Q2_054_partial_19_0060_valid :
    mulPoly ep_Q2_054_coefficient_19_0060
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0061 : Poly :=
[
  term ((-8636904778032 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 61 for generator 19. -/
def ep_Q2_054_partial_19_0061 : Poly :=
[
  term ((17273809556064 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((-8636904778032 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-17273809556064 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 2), (15, 1)],
  term ((8636904778032 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((-17273809556064 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((8636904778032 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((17273809556064 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-8636904778032 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 19. -/
theorem ep_Q2_054_partial_19_0061_valid :
    mulPoly ep_Q2_054_coefficient_19_0061
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0062 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 19. -/
def ep_Q2_054_partial_19_0062 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 19. -/
theorem ep_Q2_054_partial_19_0062_valid :
    mulPoly ep_Q2_054_coefficient_19_0062
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0063 : Poly :=
[
  term ((-595319160465 : Rat) / 45033486517) [(1, 1), (9, 1)]
]

/-- Partial product 63 for generator 19. -/
def ep_Q2_054_partial_19_0063 : Poly :=
[
  term ((1190638320930 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1)],
  term ((-595319160465 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1)],
  term ((-1190638320930 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((595319160465 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1)],
  term ((-1190638320930 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2)],
  term ((595319160465 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((1190638320930 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((-595319160465 : Rat) / 45033486517) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 19. -/
theorem ep_Q2_054_partial_19_0063_valid :
    mulPoly ep_Q2_054_coefficient_19_0063
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0064 : Poly :=
[
  term ((-1592069839092 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 64 for generator 19. -/
def ep_Q2_054_partial_19_0064 : Poly :=
[
  term ((3184139678184 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-1592069839092 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((-3184139678184 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((1592069839092 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1), (12, 1)],
  term ((-3184139678184 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (12, 1)],
  term ((1592069839092 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((3184139678184 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((-1592069839092 : Rat) / 45033486517) [(1, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 19. -/
theorem ep_Q2_054_partial_19_0064_valid :
    mulPoly ep_Q2_054_coefficient_19_0064
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0065 : Poly :=
[
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (11, 1)]
]

/-- Partial product 65 for generator 19. -/
def ep_Q2_054_partial_19_0065 : Poly :=
[
  term ((-1309702153023 : Rat) / 90066973034) [(0, 1), (1, 1), (8, 1), (11, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(0, 2), (1, 1), (11, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (6, 2), (11, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (7, 2), (11, 1)],
  term ((-1309702153023 : Rat) / 90066973034) [(1, 2), (9, 1), (11, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 19. -/
theorem ep_Q2_054_partial_19_0065_valid :
    mulPoly ep_Q2_054_coefficient_19_0065
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0066 : Poly :=
[
  term ((-10785565750167 : Rat) / 90066973034) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 66 for generator 19. -/
def ep_Q2_054_partial_19_0066 : Poly :=
[
  term ((10785565750167 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-10785565750167 : Rat) / 90066973034) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-10785565750167 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((10785565750167 : Rat) / 90066973034) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((-10785565750167 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((10785565750167 : Rat) / 90066973034) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((10785565750167 : Rat) / 45033486517) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-10785565750167 : Rat) / 90066973034) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 19. -/
theorem ep_Q2_054_partial_19_0066_valid :
    mulPoly ep_Q2_054_coefficient_19_0066
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0067 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 19. -/
def ep_Q2_054_partial_19_0067 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 19. -/
theorem ep_Q2_054_partial_19_0067_valid :
    mulPoly ep_Q2_054_coefficient_19_0067
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0068 : Poly :=
[
  term ((-2162724007527 : Rat) / 180133946068) [(1, 1), (13, 1)]
]

/-- Partial product 68 for generator 19. -/
def ep_Q2_054_partial_19_0068 : Poly :=
[
  term ((2162724007527 : Rat) / 90066973034) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((-2162724007527 : Rat) / 180133946068) [(0, 2), (1, 1), (13, 1)],
  term ((-2162724007527 : Rat) / 90066973034) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((2162724007527 : Rat) / 180133946068) [(1, 1), (6, 2), (13, 1)],
  term ((-2162724007527 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((2162724007527 : Rat) / 180133946068) [(1, 1), (7, 2), (13, 1)],
  term ((2162724007527 : Rat) / 90066973034) [(1, 2), (9, 1), (13, 1)],
  term ((-2162724007527 : Rat) / 180133946068) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 19. -/
theorem ep_Q2_054_partial_19_0068_valid :
    mulPoly ep_Q2_054_coefficient_19_0068
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0069 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 69 for generator 19. -/
def ep_Q2_054_partial_19_0069 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 19. -/
theorem ep_Q2_054_partial_19_0069_valid :
    mulPoly ep_Q2_054_coefficient_19_0069
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0070 : Poly :=
[
  term ((1060632996291 : Rat) / 180133946068) [(1, 1), (15, 1)]
]

/-- Partial product 70 for generator 19. -/
def ep_Q2_054_partial_19_0070 : Poly :=
[
  term ((-1060632996291 : Rat) / 90066973034) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((1060632996291 : Rat) / 180133946068) [(0, 2), (1, 1), (15, 1)],
  term ((1060632996291 : Rat) / 90066973034) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-1060632996291 : Rat) / 180133946068) [(1, 1), (6, 2), (15, 1)],
  term ((1060632996291 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1060632996291 : Rat) / 180133946068) [(1, 1), (7, 2), (15, 1)],
  term ((-1060632996291 : Rat) / 90066973034) [(1, 2), (9, 1), (15, 1)],
  term ((1060632996291 : Rat) / 180133946068) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 19. -/
theorem ep_Q2_054_partial_19_0070_valid :
    mulPoly ep_Q2_054_coefficient_19_0070
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0071 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 19. -/
def ep_Q2_054_partial_19_0071 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 19. -/
theorem ep_Q2_054_partial_19_0071_valid :
    mulPoly ep_Q2_054_coefficient_19_0071
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0072 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (8, 1)]
]

/-- Partial product 72 for generator 19. -/
def ep_Q2_054_partial_19_0072 : Poly :=
[
  term ((1270014208992 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (1, 2), (8, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 2)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (6, 2), (8, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(1, 3), (8, 1), (9, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 19. -/
theorem ep_Q2_054_partial_19_0072_valid :
    mulPoly ep_Q2_054_coefficient_19_0072
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0073 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (12, 1)]
]

/-- Partial product 73 for generator 19. -/
def ep_Q2_054_partial_19_0073 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (12, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (1, 2), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (12, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (6, 2), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 3), (9, 1), (12, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 19. -/
theorem ep_Q2_054_partial_19_0073_valid :
    mulPoly ep_Q2_054_coefficient_19_0073
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0074 : Poly :=
[
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1)]
]

/-- Partial product 74 for generator 19. -/
def ep_Q2_054_partial_19_0074 : Poly :=
[
  term ((2559776815512 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(0, 2), (2, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(1, 2), (2, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (6, 2)],
  term ((-2559776815512 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 19. -/
theorem ep_Q2_054_partial_19_0074_valid :
    mulPoly ep_Q2_054_coefficient_19_0074
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0075 : Poly :=
[
  term ((2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1)]
]

/-- Partial product 75 for generator 19. -/
def ep_Q2_054_partial_19_0075 : Poly :=
[
  term ((-4806987178158 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(0, 2), (2, 1), (6, 1)],
  term ((-4806987178158 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (9, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(1, 2), (2, 1), (6, 1)],
  term ((4806987178158 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2)],
  term ((4806987178158 : Rat) / 45033486517) [(2, 1), (6, 2), (8, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 19. -/
theorem ep_Q2_054_partial_19_0075_valid :
    mulPoly ep_Q2_054_coefficient_19_0075
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0076 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 76 for generator 19. -/
def ep_Q2_054_partial_19_0076 : Poly :=
[
  term ((1537533900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (9, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 2)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 2)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 19. -/
theorem ep_Q2_054_partial_19_0076_valid :
    mulPoly ep_Q2_054_coefficient_19_0076
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0077 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 77 for generator 19. -/
def ep_Q2_054_partial_19_0077 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 19. -/
theorem ep_Q2_054_partial_19_0077_valid :
    mulPoly ep_Q2_054_coefficient_19_0077
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0078 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 78 for generator 19. -/
def ep_Q2_054_partial_19_0078 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 19. -/
theorem ep_Q2_054_partial_19_0078_valid :
    mulPoly ep_Q2_054_coefficient_19_0078
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0079 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 79 for generator 19. -/
def ep_Q2_054_partial_19_0079 : Poly :=
[
  term ((-1537533900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 19. -/
theorem ep_Q2_054_partial_19_0079_valid :
    mulPoly ep_Q2_054_coefficient_19_0079
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0080 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 19. -/
def ep_Q2_054_partial_19_0080 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 19. -/
theorem ep_Q2_054_partial_19_0080_valid :
    mulPoly ep_Q2_054_coefficient_19_0080
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0081 : Poly :=
[
  term ((12695406786720 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 81 for generator 19. -/
def ep_Q2_054_partial_19_0081 : Poly :=
[
  term ((-25390813573440 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 19. -/
theorem ep_Q2_054_partial_19_0081_valid :
    mulPoly ep_Q2_054_coefficient_19_0081
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0082 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 19. -/
def ep_Q2_054_partial_19_0082 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 19. -/
theorem ep_Q2_054_partial_19_0082_valid :
    mulPoly ep_Q2_054_coefficient_19_0082
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0083 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 19. -/
def ep_Q2_054_partial_19_0083 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 19. -/
theorem ep_Q2_054_partial_19_0083_valid :
    mulPoly ep_Q2_054_coefficient_19_0083
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0084 : Poly :=
[
  term ((781416132165 : Rat) / 90066973034) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 84 for generator 19. -/
def ep_Q2_054_partial_19_0084 : Poly :=
[
  term ((-781416132165 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 19. -/
theorem ep_Q2_054_partial_19_0084_valid :
    mulPoly ep_Q2_054_coefficient_19_0084
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0085 : Poly :=
[
  term ((-781416132165 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 19. -/
def ep_Q2_054_partial_19_0085 : Poly :=
[
  term ((1562832264330 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1562832264330 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 19. -/
theorem ep_Q2_054_partial_19_0085_valid :
    mulPoly ep_Q2_054_coefficient_19_0085
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0086 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (15, 2)]
]

/-- Partial product 86 for generator 19. -/
def ep_Q2_054_partial_19_0086 : Poly :=
[
  term ((25390813573440 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2)],
  term ((25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2)],
  term ((-25390813573440 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((12695406786720 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2)],
  term ((-25390813573440 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((12695406786720 : Rat) / 45033486517) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 19. -/
theorem ep_Q2_054_partial_19_0086_valid :
    mulPoly ep_Q2_054_coefficient_19_0086
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0087 : Poly :=
[
  term ((-1865103854490 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 87 for generator 19. -/
def ep_Q2_054_partial_19_0087 : Poly :=
[
  term ((3730207708980 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1865103854490 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((3730207708980 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1865103854490 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-3730207708980 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((1865103854490 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-3730207708980 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1865103854490 : Rat) / 45033486517) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 19. -/
theorem ep_Q2_054_partial_19_0087_valid :
    mulPoly ep_Q2_054_coefficient_19_0087
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0088 : Poly :=
[
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (16, 1)]
]

/-- Partial product 88 for generator 19. -/
def ep_Q2_054_partial_19_0088 : Poly :=
[
  term ((520944088110 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(0, 2), (2, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(1, 2), (2, 1), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (6, 2), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 19. -/
theorem ep_Q2_054_partial_19_0088_valid :
    mulPoly ep_Q2_054_coefficient_19_0088
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0089 : Poly :=
[
  term ((-9706893109182 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 89 for generator 19. -/
def ep_Q2_054_partial_19_0089 : Poly :=
[
  term ((19413786218364 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (8, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (9, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 3)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (8, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(3, 1), (6, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 19. -/
theorem ep_Q2_054_partial_19_0089_valid :
    mulPoly ep_Q2_054_coefficient_19_0089
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0090 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 90 for generator 19. -/
def ep_Q2_054_partial_19_0090 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 2), (8, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (6, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 19. -/
theorem ep_Q2_054_partial_19_0090_valid :
    mulPoly ep_Q2_054_coefficient_19_0090
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0091 : Poly :=
[
  term ((-4252391987652 : Rat) / 45033486517) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 91 for generator 19. -/
def ep_Q2_054_partial_19_0091 : Poly :=
[
  term ((8504783975304 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(3, 1), (6, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 19. -/
theorem ep_Q2_054_partial_19_0091_valid :
    mulPoly ep_Q2_054_coefficient_19_0091
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0092 : Poly :=
[
  term ((-384383475000 : Rat) / 45033486517) [(3, 1), (7, 1)]
]

/-- Partial product 92 for generator 19. -/
def ep_Q2_054_partial_19_0092 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term ((384383475000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1)],
  term ((384383475000 : Rat) / 45033486517) [(3, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 19. -/
theorem ep_Q2_054_partial_19_0092_valid :
    mulPoly ep_Q2_054_coefficient_19_0092
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0093 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 93 for generator 19. -/
def ep_Q2_054_partial_19_0093 : Poly :=
[
  term ((-1537533900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 2)],
  term ((768766950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (9, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 2)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (8, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (9, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 19. -/
theorem ep_Q2_054_partial_19_0093_valid :
    mulPoly ep_Q2_054_coefficient_19_0093
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0094 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 94 for generator 19. -/
def ep_Q2_054_partial_19_0094 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 19. -/
theorem ep_Q2_054_partial_19_0094_valid :
    mulPoly ep_Q2_054_coefficient_19_0094
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0095 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 95 for generator 19. -/
def ep_Q2_054_partial_19_0095 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 19. -/
theorem ep_Q2_054_partial_19_0095_valid :
    mulPoly ep_Q2_054_coefficient_19_0095
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0096 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 19. -/
def ep_Q2_054_partial_19_0096 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 19. -/
theorem ep_Q2_054_partial_19_0096_valid :
    mulPoly ep_Q2_054_coefficient_19_0096
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0097 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 97 for generator 19. -/
def ep_Q2_054_partial_19_0097 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 19. -/
theorem ep_Q2_054_partial_19_0097_valid :
    mulPoly ep_Q2_054_coefficient_19_0097
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0098 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 98 for generator 19. -/
def ep_Q2_054_partial_19_0098 : Poly :=
[
  term ((25390813573440 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 2), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 19. -/
theorem ep_Q2_054_partial_19_0098_valid :
    mulPoly ep_Q2_054_coefficient_19_0098
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 19. -/
def ep_Q2_054_coefficient_19_0099 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 19. -/
def ep_Q2_054_partial_19_0099 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 19. -/
theorem ep_Q2_054_partial_19_0099_valid :
    mulPoly ep_Q2_054_coefficient_19_0099
        ep_Q2_054_generator_19_0000_0099 =
      ep_Q2_054_partial_19_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_19_0000_0099 : List Poly :=
[
  ep_Q2_054_partial_19_0000,
  ep_Q2_054_partial_19_0001,
  ep_Q2_054_partial_19_0002,
  ep_Q2_054_partial_19_0003,
  ep_Q2_054_partial_19_0004,
  ep_Q2_054_partial_19_0005,
  ep_Q2_054_partial_19_0006,
  ep_Q2_054_partial_19_0007,
  ep_Q2_054_partial_19_0008,
  ep_Q2_054_partial_19_0009,
  ep_Q2_054_partial_19_0010,
  ep_Q2_054_partial_19_0011,
  ep_Q2_054_partial_19_0012,
  ep_Q2_054_partial_19_0013,
  ep_Q2_054_partial_19_0014,
  ep_Q2_054_partial_19_0015,
  ep_Q2_054_partial_19_0016,
  ep_Q2_054_partial_19_0017,
  ep_Q2_054_partial_19_0018,
  ep_Q2_054_partial_19_0019,
  ep_Q2_054_partial_19_0020,
  ep_Q2_054_partial_19_0021,
  ep_Q2_054_partial_19_0022,
  ep_Q2_054_partial_19_0023,
  ep_Q2_054_partial_19_0024,
  ep_Q2_054_partial_19_0025,
  ep_Q2_054_partial_19_0026,
  ep_Q2_054_partial_19_0027,
  ep_Q2_054_partial_19_0028,
  ep_Q2_054_partial_19_0029,
  ep_Q2_054_partial_19_0030,
  ep_Q2_054_partial_19_0031,
  ep_Q2_054_partial_19_0032,
  ep_Q2_054_partial_19_0033,
  ep_Q2_054_partial_19_0034,
  ep_Q2_054_partial_19_0035,
  ep_Q2_054_partial_19_0036,
  ep_Q2_054_partial_19_0037,
  ep_Q2_054_partial_19_0038,
  ep_Q2_054_partial_19_0039,
  ep_Q2_054_partial_19_0040,
  ep_Q2_054_partial_19_0041,
  ep_Q2_054_partial_19_0042,
  ep_Q2_054_partial_19_0043,
  ep_Q2_054_partial_19_0044,
  ep_Q2_054_partial_19_0045,
  ep_Q2_054_partial_19_0046,
  ep_Q2_054_partial_19_0047,
  ep_Q2_054_partial_19_0048,
  ep_Q2_054_partial_19_0049,
  ep_Q2_054_partial_19_0050,
  ep_Q2_054_partial_19_0051,
  ep_Q2_054_partial_19_0052,
  ep_Q2_054_partial_19_0053,
  ep_Q2_054_partial_19_0054,
  ep_Q2_054_partial_19_0055,
  ep_Q2_054_partial_19_0056,
  ep_Q2_054_partial_19_0057,
  ep_Q2_054_partial_19_0058,
  ep_Q2_054_partial_19_0059,
  ep_Q2_054_partial_19_0060,
  ep_Q2_054_partial_19_0061,
  ep_Q2_054_partial_19_0062,
  ep_Q2_054_partial_19_0063,
  ep_Q2_054_partial_19_0064,
  ep_Q2_054_partial_19_0065,
  ep_Q2_054_partial_19_0066,
  ep_Q2_054_partial_19_0067,
  ep_Q2_054_partial_19_0068,
  ep_Q2_054_partial_19_0069,
  ep_Q2_054_partial_19_0070,
  ep_Q2_054_partial_19_0071,
  ep_Q2_054_partial_19_0072,
  ep_Q2_054_partial_19_0073,
  ep_Q2_054_partial_19_0074,
  ep_Q2_054_partial_19_0075,
  ep_Q2_054_partial_19_0076,
  ep_Q2_054_partial_19_0077,
  ep_Q2_054_partial_19_0078,
  ep_Q2_054_partial_19_0079,
  ep_Q2_054_partial_19_0080,
  ep_Q2_054_partial_19_0081,
  ep_Q2_054_partial_19_0082,
  ep_Q2_054_partial_19_0083,
  ep_Q2_054_partial_19_0084,
  ep_Q2_054_partial_19_0085,
  ep_Q2_054_partial_19_0086,
  ep_Q2_054_partial_19_0087,
  ep_Q2_054_partial_19_0088,
  ep_Q2_054_partial_19_0089,
  ep_Q2_054_partial_19_0090,
  ep_Q2_054_partial_19_0091,
  ep_Q2_054_partial_19_0092,
  ep_Q2_054_partial_19_0093,
  ep_Q2_054_partial_19_0094,
  ep_Q2_054_partial_19_0095,
  ep_Q2_054_partial_19_0096,
  ep_Q2_054_partial_19_0097,
  ep_Q2_054_partial_19_0098,
  ep_Q2_054_partial_19_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_19_0000_0099 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1)],
  term ((658943100000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1317886200000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-475903350000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (8, 1), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1)],
  term ((6296229079830 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((-39596339386728 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-4314161163888 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (8, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-476255328372 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (8, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-119059386768 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (13, 1)],
  term ((5182918104591 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-228716138232 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((55800761580 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 2)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 2), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15984599559336 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1668604493718 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((22056765650892 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 2), (16, 1)],
  term ((18888602963868 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((-8428450947768 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1)],
  term ((3184139678184 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1)],
  term ((354814687224 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-709629374448 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-236543124816 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1309702153023 : Rat) / 90066973034) [(0, 1), (1, 1), (8, 1), (11, 1)],
  term ((10785565750167 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((2162724007527 : Rat) / 90066973034) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1060632996291 : Rat) / 90066973034) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((-2857531970232 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((17273809556064 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-6292285470522 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-49279518612 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-7481133166896 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((98559037224 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27909305205372 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((32853012408 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((-15685268601024 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((-8610273804636 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((653215415904 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 3)],
  term ((3146142735261 : Rat) / 45033486517) [(0, 1), (1, 2)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1)],
  term ((19798169693364 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((2157080581944 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((59529693384 : Rat) / 45033486517) [(0, 1), (1, 2), (6, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-10393375720950 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (9, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((7674796227420 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (13, 1), (15, 2)],
  term ((834302246859 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-9761805034182 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 2), (11, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 2), (13, 1), (15, 1)],
  term ((4809544634349 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (12, 1)],
  term ((-177407343612 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (12, 1), (16, 1)],
  term ((354814687224 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (16, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 2)],
  term ((8477641405008 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((4305136902318 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1596621916944 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 2)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((24639759306 : Rat) / 45033486517) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((3740566583448 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-49279518612 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13954652602686 : Rat) / 45033486517) [(0, 1), (1, 2), (15, 2)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (1, 2), (16, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 3), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 3), (13, 1)],
  term ((-12486317624694 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 2)],
  term ((1537533900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (9, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2)],
  term ((2559776815512 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (12, 1), (16, 1)],
  term ((1562832264330 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((3730207708980 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((59010125605092 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (8, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-46075982679216 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((12818945139192 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19798169693364 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((-2157080581944 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 2)],
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 2), (16, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((4314161163888 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((39596339386728 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((-2157080581944 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-19798169693364 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 2), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-20786751441900 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((15349592454840 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((1668604493718 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((119059386768 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-59529693384 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2)],
  term ((-19523610068364 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (9, 1), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (13, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 3), (13, 1)],
  term ((6292285470522 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1)],
  term ((15685268601024 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((8610273804636 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (9, 2)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((7481133166896 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-98559037224 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27909305205372 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((9619089268698 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (12, 1), (16, 1)],
  term ((709629374448 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 2), (16, 1)],
  term ((-3146142735261 : Rat) / 45033486517) [(0, 1), (6, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (8, 1), (13, 1)],
  term ((10393375720950 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (11, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7674796227420 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1), (15, 2)],
  term ((-834302246859 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((9761805034182 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2), (11, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2), (13, 1), (15, 1)],
  term ((-4690485247581 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((177407343612 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1), (12, 1), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1), (16, 1)],
  term ((-7842634300512 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((-4305136902318 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-24639759306 : Rat) / 45033486517) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-3740566583448 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((13954652602686 : Rat) / 45033486517) [(0, 1), (6, 2), (15, 2)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (6, 2), (16, 1)],
  term ((-59529693384 : Rat) / 45033486517) [(0, 1), (6, 3)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 3), (7, 1), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 3), (13, 1), (15, 1)],
  term ((9619089268698 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((709629374448 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((6292285470522 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((7481133166896 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-98559037224 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27909305205372 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((15685268601024 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((8610273804636 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 3)],
  term ((-3146142735261 : Rat) / 45033486517) [(0, 1), (7, 2)],
  term ((-4809544634349 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1)],
  term ((177407343612 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (12, 1), (16, 1)],
  term ((-354814687224 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((7506958154328 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2636532408600 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-20460143733948 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 2)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 2), (16, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((-24639759306 : Rat) / 45033486517) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-3740566583448 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((49279518612 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((13954652602686 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (7, 2), (16, 1)],
  term ((-9130234347414 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 3), (11, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 3), (11, 1), (13, 1), (15, 1)],
  term ((-7674796227420 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1), (15, 2)],
  term ((-834302246859 : Rat) / 45033486517) [(0, 1), (7, 3), (15, 1)],
  term ((9761805034182 : Rat) / 45033486517) [(0, 1), (7, 4)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 4), (11, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 4), (13, 1), (15, 1)],
  term ((9766885192269 : Rat) / 90066973034) [(0, 1), (8, 1)],
  term ((-9766885192269 : Rat) / 180133946068) [(0, 2)],
  term ((-384383475000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((658943100000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((237951675000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-3148114539915 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((714382992558 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((-5182918104591 : Rat) / 90066973034) [(0, 2), (1, 1), (7, 1)],
  term ((-27900380790 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((114358069116 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-943406501040 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (9, 1)],
  term ((2063773089612 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (13, 1)],
  term ((-8636904778032 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((39687944031 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1)],
  term ((-1592069839092 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(0, 2), (1, 1), (11, 1)],
  term ((-10785565750167 : Rat) / 90066973034) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2162724007527 : Rat) / 180133946068) [(0, 2), (1, 1), (13, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1060632996291 : Rat) / 180133946068) [(0, 2), (1, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (1, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (1, 2), (8, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (1, 2), (12, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(0, 2), (2, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(0, 2), (2, 1), (6, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 2), (2, 1), (8, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2)],
  term ((-1865103854490 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(0, 2), (2, 1), (16, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (8, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (13, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-754066491264 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (6, 2)],
  term ((20786751441900 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15349592454840 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1668604493718 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (7, 2)],
  term ((19523610068364 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-6292285470522 : Rat) / 45033486517) [(0, 2), (8, 1)],
  term ((-15685268601024 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((-8610273804636 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((653215415904 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-49279518612 : Rat) / 45033486517) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-7481133166896 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((98559037224 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((27909305205372 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((32853012408 : Rat) / 45033486517) [(0, 2), (8, 1), (16, 1)],
  term ((-9619089268698 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((354814687224 : Rat) / 45033486517) [(0, 2), (8, 2), (12, 1), (16, 1)],
  term ((-709629374448 : Rat) / 45033486517) [(0, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-236543124816 : Rat) / 45033486517) [(0, 2), (8, 2), (16, 1)],
  term ((3146142735261 : Rat) / 45033486517) [(0, 3)],
  term ((635007104496 : Rat) / 45033486517) [(0, 3), (1, 1), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 3), (1, 1), (13, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 3), (2, 1)],
  term ((19798169693364 : Rat) / 45033486517) [(0, 3), (3, 1), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 3), (3, 1), (7, 1), (16, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 3), (3, 1), (13, 1)],
  term ((2157080581944 : Rat) / 45033486517) [(0, 3), (3, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((59529693384 : Rat) / 45033486517) [(0, 3), (6, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 3), (6, 1), (7, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 3), (6, 1), (13, 1), (15, 1)],
  term ((-10393375720950 : Rat) / 45033486517) [(0, 3), (7, 1), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 3), (7, 1), (9, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 3), (7, 1), (11, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 3), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((7674796227420 : Rat) / 45033486517) [(0, 3), (7, 1), (13, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 3), (7, 1), (13, 1), (15, 2)],
  term ((834302246859 : Rat) / 45033486517) [(0, 3), (7, 1), (15, 1)],
  term ((-9761805034182 : Rat) / 45033486517) [(0, 3), (7, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 3), (7, 2), (11, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 3), (7, 2), (13, 1), (15, 1)],
  term ((5444551738845 : Rat) / 45033486517) [(0, 3), (8, 1)],
  term ((-177407343612 : Rat) / 45033486517) [(0, 3), (8, 1), (12, 1), (16, 1)],
  term ((354814687224 : Rat) / 45033486517) [(0, 3), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((118271562408 : Rat) / 45033486517) [(0, 3), (8, 1), (16, 1)],
  term ((7842634300512 : Rat) / 45033486517) [(0, 3), (9, 1), (13, 1)],
  term ((4305136902318 : Rat) / 45033486517) [(0, 3), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 3), (9, 2)],
  term ((302271590160 : Rat) / 45033486517) [(0, 3), (11, 1), (15, 1)],
  term ((24639759306 : Rat) / 45033486517) [(0, 3), (12, 1), (16, 1)],
  term ((3740566583448 : Rat) / 45033486517) [(0, 3), (13, 1), (15, 1)],
  term ((-49279518612 : Rat) / 45033486517) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-13954652602686 : Rat) / 45033486517) [(0, 3), (15, 2)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 3), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 4)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((475903350000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((-6296229079830 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4806987178158 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (9, 1)],
  term ((384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-237951675000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((3148114539915 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21763554491520 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((11157872886720 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6332837029830 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 2)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 2), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((1317886200000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((475903350000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (9, 1), (16, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((3148114539915 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3)],
  term ((329471550000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3), (12, 1), (16, 1)],
  term ((-658943100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-237951675000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3), (16, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (12, 1), (16, 1)],
  term ((1562832264330 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((3730207708980 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (9, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5182918104591 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((228716138232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-55800761580 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 2)],
  term ((-604559142558 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (13, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 3)],
  term ((-1190638320930 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-3184139678184 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-10785565750167 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2162724007527 : Rat) / 90066973034) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1060632996291 : Rat) / 90066973034) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((653215415904 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 2), (9, 1)],
  term ((2857531970232 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 2), (13, 1)],
  term ((-17273809556064 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 2), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((5182918104591 : Rat) / 90066973034) [(1, 1), (6, 2), (7, 1)],
  term ((137724230790 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (11, 1), (13, 1)],
  term ((-114358069116 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (12, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((1102158277164 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (9, 1)],
  term ((-1587517761240 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (13, 1)],
  term ((8939176368192 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((595319160465 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1)],
  term ((1592069839092 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1), (12, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (6, 2), (11, 1)],
  term ((10785565750167 : Rat) / 90066973034) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((2162724007527 : Rat) / 180133946068) [(1, 1), (6, 2), (13, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1060632996291 : Rat) / 180133946068) [(1, 1), (6, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 3), (7, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (6, 3), (9, 1)],
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 3), (13, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (6, 3), (15, 1)],
  term ((2857531970232 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-17273809556064 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((653215415904 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 2)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-10785565750167 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2162724007527 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1060632996291 : Rat) / 90066973034) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1190638320930 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2)],
  term ((-3184139678184 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2), (12, 1)],
  term ((-382408469532 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (13, 1)],
  term ((8636904778032 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-4587598944126 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((6718767444 : Rat) / 166175227) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((-1171454400000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390484800000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (7, 2), (11, 1)],
  term ((10785565750167 : Rat) / 90066973034) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((2162724007527 : Rat) / 180133946068) [(1, 1), (7, 2), (13, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1060632996291 : Rat) / 180133946068) [(1, 1), (7, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((5182918104591 : Rat) / 90066973034) [(1, 1), (7, 3)],
  term ((27900380790 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 3), (11, 1), (13, 1)],
  term ((-114358069116 : Rat) / 45033486517) [(1, 1), (7, 3), (12, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(1, 1), (7, 3), (12, 1), (16, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (7, 3), (13, 1), (15, 1)],
  term ((585727200000 : Rat) / 45033486517) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((195242400000 : Rat) / 45033486517) [(1, 1), (7, 3), (16, 1)],
  term ((9766885192269 : Rat) / 90066973034) [(1, 1), (9, 1)],
  term ((-9766885192269 : Rat) / 180133946068) [(1, 2)],
  term ((-1279888407756 : Rat) / 45033486517) [(1, 2), (2, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(1, 2), (2, 1), (6, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1317886200000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((21763554491520 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-781416132165 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2)],
  term ((-1865103854490 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(1, 2), (2, 1), (16, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (12, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 2)],
  term ((158751776124 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 2)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (6, 2), (8, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (6, 2), (12, 1)],
  term ((-1214213447412 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((5182918104591 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((406290966264 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1171454400000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((390484800000 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((-2857531970232 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((17273809556064 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 2)],
  term ((-1309702153023 : Rat) / 90066973034) [(1, 2), (9, 1), (11, 1)],
  term ((10785565750167 : Rat) / 45033486517) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2162724007527 : Rat) / 90066973034) [(1, 2), (9, 1), (13, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1060632996291 : Rat) / 90066973034) [(1, 2), (9, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1190638320930 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((3184139678184 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((658943100000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((237951675000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (16, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 3), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 3), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1)],
  term ((-3148114539915 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 3), (6, 1), (7, 1)],
  term ((714382992558 : Rat) / 45033486517) [(1, 3), (6, 1), (9, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 3), (6, 1), (13, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 3), (6, 1), (15, 1)],
  term ((-5182918104591 : Rat) / 90066973034) [(1, 3), (7, 1)],
  term ((-27900380790 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (16, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 3), (7, 1), (11, 1), (13, 1)],
  term ((114358069116 : Rat) / 45033486517) [(1, 3), (7, 1), (12, 1)],
  term ((292863600000 : Rat) / 45033486517) [(1, 3), (7, 1), (12, 1), (16, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 3), (7, 1), (13, 1), (15, 1)],
  term ((-585727200000 : Rat) / 45033486517) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-195242400000 : Rat) / 45033486517) [(1, 3), (7, 1), (16, 1)],
  term ((1596621916944 : Rat) / 45033486517) [(1, 3), (8, 1), (9, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 3), (8, 1), (13, 1)],
  term ((-8636904778032 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((-595319160465 : Rat) / 45033486517) [(1, 3), (9, 1)],
  term ((-2227076943588 : Rat) / 45033486517) [(1, 3), (9, 1), (12, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 3), (11, 1)],
  term ((-10785565750167 : Rat) / 90066973034) [(1, 3), (12, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-2162724007527 : Rat) / 180133946068) [(1, 3), (13, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 3), (13, 1), (15, 2), (16, 1)],
  term ((1060632996291 : Rat) / 180133946068) [(1, 3), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 3), (15, 1), (16, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 4), (8, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 4), (12, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((4806987178158 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2)],
  term ((-2559776815512 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((-3730207708980 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (6, 2)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((4806987178158 : Rat) / 45033486517) [(2, 1), (6, 2), (8, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2)],
  term ((1865103854490 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (6, 2), (16, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 3)],
  term ((-2559776815512 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1562832264330 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-3730207708980 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (7, 2)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-11157872886720 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 2)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 2), (9, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((781416132165 : Rat) / 45033486517) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(2, 1), (7, 2), (15, 2)],
  term ((1865103854490 : Rat) / 45033486517) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (7, 2), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (7, 3), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 3), (9, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 3), (11, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (7, 3), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 2)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (9, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 3)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1)],
  term ((-20182553168364 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (8, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 2), (8, 1), (13, 1)],
  term ((4190622811416 : Rat) / 45033486517) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(3, 1), (6, 3), (7, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (6, 3), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(3, 1), (6, 3), (15, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (9, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (12, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(3, 1), (7, 3)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 3), (8, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (8, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 3), (12, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (16, 1)],
  term ((-9766885192269 : Rat) / 90066973034) [(6, 1), (8, 1)],
  term ((9766885192269 : Rat) / 180133946068) [(6, 2)],
  term ((-9766885192269 : Rat) / 90066973034) [(7, 1), (9, 1)],
  term ((9766885192269 : Rat) / 180133946068) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 99. -/
theorem ep_Q2_054_block_19_0000_0099_valid :
    checkProductSumEq ep_Q2_054_partials_19_0000_0099
      ep_Q2_054_block_19_0000_0099 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
