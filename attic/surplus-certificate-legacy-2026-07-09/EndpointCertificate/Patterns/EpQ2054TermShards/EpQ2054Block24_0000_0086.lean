/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 24:0-86

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 24 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_24_0000_0086 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0000 : Poly :=
[
  term ((-790871210541 : Rat) / 90066973034) []
]

/-- Partial product 0 for generator 24. -/
def ep_Q2_054_partial_24_0000 : Poly :=
[
  term ((790871210541 : Rat) / 45033486517) [(0, 1), (12, 1)],
  term ((-790871210541 : Rat) / 90066973034) [(0, 2)],
  term ((790871210541 : Rat) / 45033486517) [(1, 1), (13, 1)],
  term ((-790871210541 : Rat) / 90066973034) [(1, 2)],
  term ((-790871210541 : Rat) / 45033486517) [(6, 1), (12, 1)],
  term ((790871210541 : Rat) / 90066973034) [(6, 2)],
  term ((-790871210541 : Rat) / 45033486517) [(7, 1), (13, 1)],
  term ((790871210541 : Rat) / 90066973034) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem ep_Q2_054_partial_24_0000_valid :
    mulPoly ep_Q2_054_coefficient_24_0000
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0001 : Poly :=
[
  term ((891966653487 : Rat) / 45033486517) [(0, 1)]
]

/-- Partial product 1 for generator 24. -/
def ep_Q2_054_partial_24_0001 : Poly :=
[
  term ((-1783933306974 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1)],
  term ((891966653487 : Rat) / 45033486517) [(0, 1), (1, 2)],
  term ((1783933306974 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1)],
  term ((-891966653487 : Rat) / 45033486517) [(0, 1), (6, 2)],
  term ((1783933306974 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1)],
  term ((-891966653487 : Rat) / 45033486517) [(0, 1), (7, 2)],
  term ((-1783933306974 : Rat) / 45033486517) [(0, 2), (12, 1)],
  term ((891966653487 : Rat) / 45033486517) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem ep_Q2_054_partial_24_0001_valid :
    mulPoly ep_Q2_054_coefficient_24_0001
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0002 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 2 for generator 24. -/
def ep_Q2_054_partial_24_0002 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (7, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 3)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 3), (7, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 3), (1, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem ep_Q2_054_partial_24_0002_valid :
    mulPoly ep_Q2_054_coefficient_24_0002
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0003 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 3 for generator 24. -/
def ep_Q2_054_partial_24_0003 : Poly :=
[
  term ((-1270014208992 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (9, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 3), (9, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem ep_Q2_054_partial_24_0003_valid :
    mulPoly ep_Q2_054_coefficient_24_0003
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0004 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 4 for generator 24. -/
def ep_Q2_054_partial_24_0004 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 2)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 3), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 3), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem ep_Q2_054_partial_24_0004_valid :
    mulPoly ep_Q2_054_coefficient_24_0004
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0005 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 5 for generator 24. -/
def ep_Q2_054_partial_24_0005 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 3), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem ep_Q2_054_partial_24_0005_valid :
    mulPoly ep_Q2_054_coefficient_24_0005
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0006 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1)]
]

/-- Partial product 6 for generator 24. -/
def ep_Q2_054_partial_24_0006 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (12, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 2)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 2), (2, 1), (12, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 3), (2, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem ep_Q2_054_partial_24_0006_valid :
    mulPoly ep_Q2_054_coefficient_24_0006
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0007 : Poly :=
[
  term ((-384383475000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 7 for generator 24. -/
def ep_Q2_054_partial_24_0007 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (12, 1)],
  term ((384383475000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((384383475000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3)],
  term ((768766950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(0, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem ep_Q2_054_partial_24_0007_valid :
    mulPoly ep_Q2_054_coefficient_24_0007
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0008 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 8 for generator 24. -/
def ep_Q2_054_partial_24_0008 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (7, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 3), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem ep_Q2_054_partial_24_0008_valid :
    mulPoly ep_Q2_054_coefficient_24_0008
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0009 : Poly :=
[
  term ((6347703393360 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 9 for generator 24. -/
def ep_Q2_054_partial_24_0009 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem ep_Q2_054_partial_24_0009_valid :
    mulPoly ep_Q2_054_coefficient_24_0009
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0010 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def ep_Q2_054_partial_24_0010 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem ep_Q2_054_partial_24_0010_valid :
    mulPoly ep_Q2_054_coefficient_24_0010
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0011 : Poly :=
[
  term ((-59529693384 : Rat) / 45033486517) [(0, 1), (6, 1)]
]

/-- Partial product 11 for generator 24. -/
def ep_Q2_054_partial_24_0011 : Poly :=
[
  term ((119059386768 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (13, 1)],
  term ((-59529693384 : Rat) / 45033486517) [(0, 1), (1, 2), (6, 1)],
  term ((-119059386768 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((59529693384 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2)],
  term ((-119059386768 : Rat) / 45033486517) [(0, 1), (6, 2), (12, 1)],
  term ((59529693384 : Rat) / 45033486517) [(0, 1), (6, 3)],
  term ((119059386768 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1)],
  term ((-59529693384 : Rat) / 45033486517) [(0, 3), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem ep_Q2_054_partial_24_0011_valid :
    mulPoly ep_Q2_054_coefficient_24_0011
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0012 : Poly :=
[
  term ((320403111768 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 12 for generator 24. -/
def ep_Q2_054_partial_24_0012 : Poly :=
[
  term ((-640806223536 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((320403111768 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((640806223536 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-320403111768 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((640806223536 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((-320403111768 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1)],
  term ((-640806223536 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((320403111768 : Rat) / 45033486517) [(0, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem ep_Q2_054_partial_24_0012_valid :
    mulPoly ep_Q2_054_coefficient_24_0012
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0013 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 13 for generator 24. -/
def ep_Q2_054_partial_24_0013 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 3), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem ep_Q2_054_partial_24_0013_valid :
    mulPoly ep_Q2_054_coefficient_24_0013
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0014 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 14 for generator 24. -/
def ep_Q2_054_partial_24_0014 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (7, 3), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem ep_Q2_054_partial_24_0014_valid :
    mulPoly ep_Q2_054_coefficient_24_0014
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0015 : Poly :=
[
  term ((114358069116 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 15 for generator 24. -/
def ep_Q2_054_partial_24_0015 : Poly :=
[
  term ((-228716138232 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((114358069116 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((228716138232 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-114358069116 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((228716138232 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 2)],
  term ((-114358069116 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)],
  term ((-228716138232 : Rat) / 45033486517) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((114358069116 : Rat) / 45033486517) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem ep_Q2_054_partial_24_0015_valid :
    mulPoly ep_Q2_054_coefficient_24_0015
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0016 : Poly :=
[
  term ((-246847659840 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 16 for generator 24. -/
def ep_Q2_054_partial_24_0016 : Poly :=
[
  term ((493695319680 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-246847659840 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-493695319680 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((246847659840 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((-493695319680 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((246847659840 : Rat) / 45033486517) [(0, 1), (7, 3), (15, 1)],
  term ((493695319680 : Rat) / 45033486517) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-246847659840 : Rat) / 45033486517) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem ep_Q2_054_partial_24_0016_valid :
    mulPoly ep_Q2_054_coefficient_24_0016
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0017 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (7, 2)]
]

/-- Partial product 17 for generator 24. -/
def ep_Q2_054_partial_24_0017 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 2)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (12, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 4)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (7, 2), (12, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem ep_Q2_054_partial_24_0017_valid :
    mulPoly ep_Q2_054_coefficient_24_0017
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0018 : Poly :=
[
  term ((-4965827860782 : Rat) / 45033486517) [(0, 1), (8, 1)]
]

/-- Partial product 18 for generator 24. -/
def ep_Q2_054_partial_24_0018 : Poly :=
[
  term ((9931655721564 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((-4965827860782 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1)],
  term ((-9931655721564 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (12, 1)],
  term ((4965827860782 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((-9931655721564 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((4965827860782 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1)],
  term ((9931655721564 : Rat) / 45033486517) [(0, 2), (8, 1), (12, 1)],
  term ((-4965827860782 : Rat) / 45033486517) [(0, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem ep_Q2_054_partial_24_0018_valid :
    mulPoly ep_Q2_054_coefficient_24_0018
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0019 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 19 for generator 24. -/
def ep_Q2_054_partial_24_0019 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-163303853976 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((163303853976 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem ep_Q2_054_partial_24_0019_valid :
    mulPoly ep_Q2_054_coefficient_24_0019
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0020 : Poly :=
[
  term ((-4114105310430 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 20 for generator 24. -/
def ep_Q2_054_partial_24_0020 : Poly :=
[
  term ((8228210620860 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4114105310430 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-8228210620860 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((4114105310430 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-8228210620860 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((4114105310430 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((8228210620860 : Rat) / 45033486517) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4114105310430 : Rat) / 45033486517) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem ep_Q2_054_partial_24_0020_valid :
    mulPoly ep_Q2_054_coefficient_24_0020
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0021 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 24. -/
def ep_Q2_054_partial_24_0021 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem ep_Q2_054_partial_24_0021_valid :
    mulPoly ep_Q2_054_coefficient_24_0021
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0022 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (9, 2)]
]

/-- Partial product 22 for generator 24. -/
def ep_Q2_054_partial_24_0022 : Poly :=
[
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 2)],
  term ((653215415904 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 2)],
  term ((653215415904 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 2)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem ep_Q2_054_partial_24_0022_valid :
    mulPoly ep_Q2_054_coefficient_24_0022
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0023 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 23 for generator 24. -/
def ep_Q2_054_partial_24_0023 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem ep_Q2_054_partial_24_0023_valid :
    mulPoly ep_Q2_054_coefficient_24_0023
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0024 : Poly :=
[
  term ((-7277960216556 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 24 for generator 24. -/
def ep_Q2_054_partial_24_0024 : Poly :=
[
  term ((14555920433112 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-7277960216556 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-14555920433112 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((7277960216556 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-14555920433112 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((7277960216556 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((14555920433112 : Rat) / 45033486517) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-7277960216556 : Rat) / 45033486517) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem ep_Q2_054_partial_24_0024_valid :
    mulPoly ep_Q2_054_coefficient_24_0024
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0025 : Poly :=
[
  term ((18801292907952 : Rat) / 45033486517) [(0, 1), (15, 2)]
]

/-- Partial product 25 for generator 24. -/
def ep_Q2_054_partial_24_0025 : Poly :=
[
  term ((-37602585815904 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((18801292907952 : Rat) / 45033486517) [(0, 1), (1, 2), (15, 2)],
  term ((37602585815904 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((-18801292907952 : Rat) / 45033486517) [(0, 1), (6, 2), (15, 2)],
  term ((37602585815904 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-18801292907952 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2)],
  term ((-37602585815904 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((18801292907952 : Rat) / 45033486517) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem ep_Q2_054_partial_24_0025_valid :
    mulPoly ep_Q2_054_coefficient_24_0025
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0026 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(0, 2)]
]

/-- Partial product 26 for generator 24. -/
def ep_Q2_054_partial_24_0026 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (1, 2)],
  term ((635007104496 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (6, 2)],
  term ((635007104496 : Rat) / 45033486517) [(0, 2), (7, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (7, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 3), (12, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem ep_Q2_054_partial_24_0026_valid :
    mulPoly ep_Q2_054_coefficient_24_0026
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0027 : Poly :=
[
  term ((384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 27 for generator 24. -/
def ep_Q2_054_partial_24_0027 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term ((384383475000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((384383475000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 24. -/
theorem ep_Q2_054_partial_24_0027_valid :
    mulPoly ep_Q2_054_coefficient_24_0027
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0028 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 28 for generator 24. -/
def ep_Q2_054_partial_24_0028 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (13, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 24. -/
theorem ep_Q2_054_partial_24_0028_valid :
    mulPoly ep_Q2_054_coefficient_24_0028
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0029 : Poly :=
[
  term ((-6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 29 for generator 24. -/
def ep_Q2_054_partial_24_0029 : Poly :=
[
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 24. -/
theorem ep_Q2_054_partial_24_0029_valid :
    mulPoly ep_Q2_054_coefficient_24_0029
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0030 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 24. -/
def ep_Q2_054_partial_24_0030 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 24. -/
theorem ep_Q2_054_partial_24_0030_valid :
    mulPoly ep_Q2_054_coefficient_24_0030
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0031 : Poly :=
[
  term ((-714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 31 for generator 24. -/
def ep_Q2_054_partial_24_0031 : Poly :=
[
  term ((1428765985116 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((-1428765985116 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1), (12, 1)],
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 3), (9, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 24. -/
theorem ep_Q2_054_partial_24_0031_valid :
    mulPoly ep_Q2_054_coefficient_24_0031
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0032 : Poly :=
[
  term ((-27455962500 : Rat) / 45033486517) [(1, 1), (7, 1)]
]

/-- Partial product 32 for generator 24. -/
def ep_Q2_054_partial_24_0032 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1)],
  term ((27455962500 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (7, 2), (13, 1)],
  term ((27455962500 : Rat) / 45033486517) [(1, 1), (7, 3)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 24. -/
theorem ep_Q2_054_partial_24_0032_valid :
    mulPoly ep_Q2_054_coefficient_24_0032
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0033 : Poly :=
[
  term ((393979880790 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 33 for generator 24. -/
def ep_Q2_054_partial_24_0033 : Poly :=
[
  term ((-787959761580 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1)],
  term ((393979880790 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((787959761580 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1)],
  term ((-393979880790 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1)],
  term ((787959761580 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (13, 1)],
  term ((-393979880790 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1)],
  term ((-787959761580 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((393979880790 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 24. -/
theorem ep_Q2_054_partial_24_0033_valid :
    mulPoly ep_Q2_054_coefficient_24_0033
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0034 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 34 for generator 24. -/
def ep_Q2_054_partial_24_0034 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 24. -/
theorem ep_Q2_054_partial_24_0034_valid :
    mulPoly ep_Q2_054_coefficient_24_0034
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0035 : Poly :=
[
  term ((-114358069116 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 35 for generator 24. -/
def ep_Q2_054_partial_24_0035 : Poly :=
[
  term ((228716138232 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-114358069116 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((-228716138232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 2)],
  term ((114358069116 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (12, 1)],
  term ((-228716138232 : Rat) / 45033486517) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((114358069116 : Rat) / 45033486517) [(1, 1), (7, 3), (12, 1)],
  term ((228716138232 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-114358069116 : Rat) / 45033486517) [(1, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 24. -/
theorem ep_Q2_054_partial_24_0035_valid :
    mulPoly ep_Q2_054_coefficient_24_0035
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0036 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 36 for generator 24. -/
def ep_Q2_054_partial_24_0036 : Poly :=
[
  term ((653215415904 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (9, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (9, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1)],
  term ((653215415904 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(1, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 24. -/
theorem ep_Q2_054_partial_24_0036_valid :
    mulPoly ep_Q2_054_coefficient_24_0036
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0037 : Poly :=
[
  term ((4193481198492 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 37 for generator 24. -/
def ep_Q2_054_partial_24_0037 : Poly :=
[
  term ((-8386962396984 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((4193481198492 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((8386962396984 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4193481198492 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((8386962396984 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-4193481198492 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((-8386962396984 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((4193481198492 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 24. -/
theorem ep_Q2_054_partial_24_0037_valid :
    mulPoly ep_Q2_054_coefficient_24_0037
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0038 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 24. -/
def ep_Q2_054_partial_24_0038 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 24. -/
theorem ep_Q2_054_partial_24_0038_valid :
    mulPoly ep_Q2_054_coefficient_24_0038
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0039 : Poly :=
[
  term ((-39687944031 : Rat) / 45033486517) [(1, 1), (9, 1)]
]

/-- Partial product 39 for generator 24. -/
def ep_Q2_054_partial_24_0039 : Poly :=
[
  term ((79375888062 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((-39687944031 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((39687944031 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((39687944031 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((79375888062 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 1)],
  term ((-39687944031 : Rat) / 45033486517) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 24. -/
theorem ep_Q2_054_partial_24_0039_valid :
    mulPoly ep_Q2_054_coefficient_24_0039
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0040 : Poly :=
[
  term ((163303853976 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 40 for generator 24. -/
def ep_Q2_054_partial_24_0040 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((163303853976 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1), (12, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(1, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 24. -/
theorem ep_Q2_054_partial_24_0040_valid :
    mulPoly ep_Q2_054_coefficient_24_0040
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0041 : Poly :=
[
  term ((-1309702153023 : Rat) / 180133946068) [(1, 1), (11, 1)]
]

/-- Partial product 41 for generator 24. -/
def ep_Q2_054_partial_24_0041 : Poly :=
[
  term ((1309702153023 : Rat) / 90066973034) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(0, 2), (1, 1), (11, 1)],
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (6, 2), (11, 1)],
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (7, 2), (11, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 2), (11, 1), (13, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 24. -/
theorem ep_Q2_054_partial_24_0041_valid :
    mulPoly ep_Q2_054_coefficient_24_0041
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0042 : Poly :=
[
  term ((10785565750167 : Rat) / 90066973034) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 42 for generator 24. -/
def ep_Q2_054_partial_24_0042 : Poly :=
[
  term ((-10785565750167 : Rat) / 45033486517) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((10785565750167 : Rat) / 90066973034) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((10785565750167 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-10785565750167 : Rat) / 90066973034) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((10785565750167 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10785565750167 : Rat) / 90066973034) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((-10785565750167 : Rat) / 45033486517) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((10785565750167 : Rat) / 90066973034) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 24. -/
theorem ep_Q2_054_partial_24_0042_valid :
    mulPoly ep_Q2_054_coefficient_24_0042
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0043 : Poly :=
[
  term ((-5040368891937 : Rat) / 180133946068) [(1, 1), (13, 1)]
]

/-- Partial product 43 for generator 24. -/
def ep_Q2_054_partial_24_0043 : Poly :=
[
  term ((5040368891937 : Rat) / 90066973034) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-5040368891937 : Rat) / 180133946068) [(0, 2), (1, 1), (13, 1)],
  term ((-5040368891937 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((5040368891937 : Rat) / 180133946068) [(1, 1), (6, 2), (13, 1)],
  term ((-5040368891937 : Rat) / 90066973034) [(1, 1), (7, 1), (13, 2)],
  term ((5040368891937 : Rat) / 180133946068) [(1, 1), (7, 2), (13, 1)],
  term ((5040368891937 : Rat) / 90066973034) [(1, 2), (13, 2)],
  term ((-5040368891937 : Rat) / 180133946068) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 24. -/
theorem ep_Q2_054_partial_24_0043_valid :
    mulPoly ep_Q2_054_coefficient_24_0043
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0044 : Poly :=
[
  term ((3150579540537 : Rat) / 180133946068) [(1, 1), (15, 1)]
]

/-- Partial product 44 for generator 24. -/
def ep_Q2_054_partial_24_0044 : Poly :=
[
  term ((-3150579540537 : Rat) / 90066973034) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((3150579540537 : Rat) / 180133946068) [(0, 2), (1, 1), (15, 1)],
  term ((3150579540537 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-3150579540537 : Rat) / 180133946068) [(1, 1), (6, 2), (15, 1)],
  term ((3150579540537 : Rat) / 90066973034) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3150579540537 : Rat) / 180133946068) [(1, 1), (7, 2), (15, 1)],
  term ((-3150579540537 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((3150579540537 : Rat) / 180133946068) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 24. -/
theorem ep_Q2_054_partial_24_0044_valid :
    mulPoly ep_Q2_054_coefficient_24_0044
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0045 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(1, 2), (8, 1)]
]

/-- Partial product 45 for generator 24. -/
def ep_Q2_054_partial_24_0045 : Poly :=
[
  term ((-1270014208992 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 2), (1, 2), (8, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (12, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (6, 2), (8, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 3), (8, 1), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 24. -/
theorem ep_Q2_054_partial_24_0045_valid :
    mulPoly ep_Q2_054_coefficient_24_0045
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0046 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (12, 1)]
]

/-- Partial product 46 for generator 24. -/
def ep_Q2_054_partial_24_0046 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (12, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (1, 2), (12, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (6, 1), (12, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (6, 2), (12, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 3), (12, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 24. -/
theorem ep_Q2_054_partial_24_0046_valid :
    mulPoly ep_Q2_054_coefficient_24_0046
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0047 : Poly :=
[
  term ((1279888407756 : Rat) / 45033486517) [(2, 1)]
]

/-- Partial product 47 for generator 24. -/
def ep_Q2_054_partial_24_0047 : Poly :=
[
  term ((-2559776815512 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(0, 2), (2, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(1, 2), (2, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1), (6, 2)],
  term ((2559776815512 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 24. -/
theorem ep_Q2_054_partial_24_0047_valid :
    mulPoly ep_Q2_054_coefficient_24_0047
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0048 : Poly :=
[
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1)]
]

/-- Partial product 48 for generator 24. -/
def ep_Q2_054_partial_24_0048 : Poly :=
[
  term ((4806987178158 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (12, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(0, 2), (2, 1), (6, 1)],
  term ((4806987178158 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(1, 2), (2, 1), (6, 1)],
  term ((-4806987178158 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2)],
  term ((-4806987178158 : Rat) / 45033486517) [(2, 1), (6, 2), (12, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(2, 1), (6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 24. -/
theorem ep_Q2_054_partial_24_0048_valid :
    mulPoly ep_Q2_054_coefficient_24_0048
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0049 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 49 for generator 24. -/
def ep_Q2_054_partial_24_0049 : Poly :=
[
  term ((1537533900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 24. -/
theorem ep_Q2_054_partial_24_0049_valid :
    mulPoly ep_Q2_054_coefficient_24_0049
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0050 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 24. -/
def ep_Q2_054_partial_24_0050 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 24. -/
theorem ep_Q2_054_partial_24_0050_valid :
    mulPoly ep_Q2_054_coefficient_24_0050
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0051 : Poly :=
[
  term ((12695406786720 : Rat) / 45033486517) [(2, 1), (15, 2)]
]

/-- Partial product 51 for generator 24. -/
def ep_Q2_054_partial_24_0051 : Poly :=
[
  term ((-25390813573440 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2)],
  term ((-25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 24. -/
theorem ep_Q2_054_partial_24_0051_valid :
    mulPoly ep_Q2_054_coefficient_24_0051
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0052 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 24. -/
def ep_Q2_054_partial_24_0052 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 24. -/
theorem ep_Q2_054_partial_24_0052_valid :
    mulPoly ep_Q2_054_coefficient_24_0052
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0053 : Poly :=
[
  term ((-915269035779 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 53 for generator 24. -/
def ep_Q2_054_partial_24_0053 : Poly :=
[
  term ((1830538071558 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1)],
  term ((-915269035779 : Rat) / 45033486517) [(0, 2), (6, 1)],
  term ((1830538071558 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1)],
  term ((-915269035779 : Rat) / 45033486517) [(1, 2), (6, 1)],
  term ((-1830538071558 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)],
  term ((915269035779 : Rat) / 45033486517) [(6, 1), (7, 2)],
  term ((-1830538071558 : Rat) / 45033486517) [(6, 2), (12, 1)],
  term ((915269035779 : Rat) / 45033486517) [(6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 24. -/
theorem ep_Q2_054_partial_24_0053_valid :
    mulPoly ep_Q2_054_coefficient_24_0053
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0054 : Poly :=
[
  term ((207157710114 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 54 for generator 24. -/
def ep_Q2_054_partial_24_0054 : Poly :=
[
  term ((-414315420228 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((207157710114 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-414315420228 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((207157710114 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((414315420228 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((-207157710114 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1)],
  term ((414315420228 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (12, 1)],
  term ((-207157710114 : Rat) / 45033486517) [(6, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 24. -/
theorem ep_Q2_054_partial_24_0054_valid :
    mulPoly ep_Q2_054_coefficient_24_0054
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0055 : Poly :=
[
  term ((-233375681250 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 55 for generator 24. -/
def ep_Q2_054_partial_24_0055 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((-233375681250 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 2)],
  term ((233375681250 : Rat) / 45033486517) [(6, 1), (7, 3), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((233375681250 : Rat) / 45033486517) [(6, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 24. -/
theorem ep_Q2_054_partial_24_0055_valid :
    mulPoly ep_Q2_054_coefficient_24_0055
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0056 : Poly :=
[
  term ((3623852303451 : Rat) / 45033486517) [(6, 1), (8, 1)]
]

/-- Partial product 56 for generator 24. -/
def ep_Q2_054_partial_24_0056 : Poly :=
[
  term ((-7247704606902 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (12, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((-7247704606902 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-3623852303451 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(6, 2), (8, 1), (12, 1)],
  term ((-3623852303451 : Rat) / 45033486517) [(6, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 24. -/
theorem ep_Q2_054_partial_24_0056_valid :
    mulPoly ep_Q2_054_coefficient_24_0056
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0057 : Poly :=
[
  term ((-2332214402220 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 57 for generator 24. -/
def ep_Q2_054_partial_24_0057 : Poly :=
[
  term ((4664428804440 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2332214402220 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((4664428804440 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2332214402220 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-4664428804440 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((2332214402220 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((-4664428804440 : Rat) / 45033486517) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((2332214402220 : Rat) / 45033486517) [(6, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 24. -/
theorem ep_Q2_054_partial_24_0057_valid :
    mulPoly ep_Q2_054_coefficient_24_0057
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0058 : Poly :=
[
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 2)]
]

/-- Partial product 58 for generator 24. -/
def ep_Q2_054_partial_24_0058 : Poly :=
[
  term ((-734867342892 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((367433671446 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((367433671446 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 2)],
  term ((734867342892 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)],
  term ((734867342892 : Rat) / 45033486517) [(6, 2), (9, 2), (12, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 24. -/
theorem ep_Q2_054_partial_24_0058_valid :
    mulPoly ep_Q2_054_coefficient_24_0058
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0059 : Poly :=
[
  term ((3377885020038 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 59 for generator 24. -/
def ep_Q2_054_partial_24_0059 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-3377885020038 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3377885020038 : Rat) / 45033486517) [(6, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 24. -/
theorem ep_Q2_054_partial_24_0059_valid :
    mulPoly ep_Q2_054_coefficient_24_0059
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0060 : Poly :=
[
  term ((-523017458946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 60 for generator 24. -/
def ep_Q2_054_partial_24_0060 : Poly :=
[
  term ((1046034917892 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((-523017458946 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1)],
  term ((1046034917892 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-523017458946 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1046034917892 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((523017458946 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1046034917892 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((523017458946 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 24. -/
theorem ep_Q2_054_partial_24_0060_valid :
    mulPoly ep_Q2_054_coefficient_24_0060
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0061 : Poly :=
[
  term ((-1715997656250 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 61 for generator 24. -/
def ep_Q2_054_partial_24_0061 : Poly :=
[
  term ((3431995312500 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (11, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(7, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 24. -/
theorem ep_Q2_054_partial_24_0061_valid :
    mulPoly ep_Q2_054_coefficient_24_0061
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0062 : Poly :=
[
  term ((-3505191338862 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 62 for generator 24. -/
def ep_Q2_054_partial_24_0062 : Poly :=
[
  term ((7010382677724 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-3505191338862 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((7010382677724 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-3505191338862 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-7010382677724 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((3505191338862 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((-7010382677724 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((3505191338862 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 24. -/
theorem ep_Q2_054_partial_24_0062_valid :
    mulPoly ep_Q2_054_coefficient_24_0062
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0063 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 24. -/
def ep_Q2_054_partial_24_0063 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 24. -/
theorem ep_Q2_054_partial_24_0063_valid :
    mulPoly ep_Q2_054_coefficient_24_0063
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0064 : Poly :=
[
  term ((-175598538327 : Rat) / 45033486517) [(7, 1), (9, 1)]
]

/-- Partial product 64 for generator 24. -/
def ep_Q2_054_partial_24_0064 : Poly :=
[
  term ((351197076654 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-175598538327 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1)],
  term ((351197076654 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-175598538327 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1)],
  term ((-351197076654 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((175598538327 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1)],
  term ((-351197076654 : Rat) / 45033486517) [(7, 2), (9, 1), (13, 1)],
  term ((175598538327 : Rat) / 45033486517) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 24. -/
theorem ep_Q2_054_partial_24_0064_valid :
    mulPoly ep_Q2_054_coefficient_24_0064
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0065 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 65 for generator 24. -/
def ep_Q2_054_partial_24_0065 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((466751362500 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((933502725000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 2)],
  term ((-466751362500 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (12, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 24. -/
theorem ep_Q2_054_partial_24_0065_valid :
    mulPoly ep_Q2_054_coefficient_24_0065
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0066 : Poly :=
[
  term ((-498508128135 : Rat) / 180133946068) [(7, 1), (11, 1)]
]

/-- Partial product 66 for generator 24. -/
def ep_Q2_054_partial_24_0066 : Poly :=
[
  term ((498508128135 : Rat) / 90066973034) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-498508128135 : Rat) / 180133946068) [(0, 2), (7, 1), (11, 1)],
  term ((498508128135 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-498508128135 : Rat) / 180133946068) [(1, 2), (7, 1), (11, 1)],
  term ((-498508128135 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((498508128135 : Rat) / 180133946068) [(6, 2), (7, 1), (11, 1)],
  term ((-498508128135 : Rat) / 90066973034) [(7, 2), (11, 1), (13, 1)],
  term ((498508128135 : Rat) / 180133946068) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 24. -/
theorem ep_Q2_054_partial_24_0066_valid :
    mulPoly ep_Q2_054_coefficient_24_0066
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0067 : Poly :=
[
  term ((7023389749011 : Rat) / 90066973034) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 67 for generator 24. -/
def ep_Q2_054_partial_24_0067 : Poly :=
[
  term ((-7023389749011 : Rat) / 45033486517) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((7023389749011 : Rat) / 90066973034) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-7023389749011 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((7023389749011 : Rat) / 90066973034) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((7023389749011 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-7023389749011 : Rat) / 90066973034) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((7023389749011 : Rat) / 45033486517) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-7023389749011 : Rat) / 90066973034) [(7, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 24. -/
theorem ep_Q2_054_partial_24_0067_valid :
    mulPoly ep_Q2_054_coefficient_24_0067
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0068 : Poly :=
[
  term ((743690157471 : Rat) / 180133946068) [(7, 1), (13, 1)]
]

/-- Partial product 68 for generator 24. -/
def ep_Q2_054_partial_24_0068 : Poly :=
[
  term ((-743690157471 : Rat) / 90066973034) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((743690157471 : Rat) / 180133946068) [(0, 2), (7, 1), (13, 1)],
  term ((-743690157471 : Rat) / 90066973034) [(1, 1), (7, 1), (13, 2)],
  term ((743690157471 : Rat) / 180133946068) [(1, 2), (7, 1), (13, 1)],
  term ((743690157471 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-743690157471 : Rat) / 180133946068) [(6, 2), (7, 1), (13, 1)],
  term ((743690157471 : Rat) / 90066973034) [(7, 2), (13, 2)],
  term ((-743690157471 : Rat) / 180133946068) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 24. -/
theorem ep_Q2_054_partial_24_0068_valid :
    mulPoly ep_Q2_054_coefficient_24_0068
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0069 : Poly :=
[
  term ((1064036246949 : Rat) / 180133946068) [(7, 1), (15, 1)]
]

/-- Partial product 69 for generator 24. -/
def ep_Q2_054_partial_24_0069 : Poly :=
[
  term ((-1064036246949 : Rat) / 90066973034) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((1064036246949 : Rat) / 180133946068) [(0, 2), (7, 1), (15, 1)],
  term ((-1064036246949 : Rat) / 90066973034) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((1064036246949 : Rat) / 180133946068) [(1, 2), (7, 1), (15, 1)],
  term ((1064036246949 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1064036246949 : Rat) / 180133946068) [(6, 2), (7, 1), (15, 1)],
  term ((1064036246949 : Rat) / 90066973034) [(7, 2), (13, 1), (15, 1)],
  term ((-1064036246949 : Rat) / 180133946068) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 24. -/
theorem ep_Q2_054_partial_24_0069_valid :
    mulPoly ep_Q2_054_coefficient_24_0069
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0070 : Poly :=
[
  term ((149769802386 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 70 for generator 24. -/
def ep_Q2_054_partial_24_0070 : Poly :=
[
  term ((-299539604772 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (12, 1)],
  term ((149769802386 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1)],
  term ((-299539604772 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (13, 1)],
  term ((149769802386 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((299539604772 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (12, 1)],
  term ((-149769802386 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1)],
  term ((299539604772 : Rat) / 45033486517) [(7, 3), (8, 1), (13, 1)],
  term ((-149769802386 : Rat) / 45033486517) [(7, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 24. -/
theorem ep_Q2_054_partial_24_0070_valid :
    mulPoly ep_Q2_054_coefficient_24_0070
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0071 : Poly :=
[
  term ((-233375681250 : Rat) / 45033486517) [(7, 2), (12, 1)]
]

/-- Partial product 71 for generator 24. -/
def ep_Q2_054_partial_24_0071 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(0, 1), (7, 2), (12, 2)],
  term ((-233375681250 : Rat) / 45033486517) [(0, 2), (7, 2), (12, 1)],
  term ((466751362500 : Rat) / 45033486517) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(6, 1), (7, 2), (12, 2)],
  term ((233375681250 : Rat) / 45033486517) [(6, 2), (7, 2), (12, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 3), (12, 1), (13, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 24. -/
theorem ep_Q2_054_partial_24_0071_valid :
    mulPoly ep_Q2_054_coefficient_24_0071
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0072 : Poly :=
[
  term ((-777649028625 : Rat) / 45033486517) [(8, 1)]
]

/-- Partial product 72 for generator 24. -/
def ep_Q2_054_partial_24_0072 : Poly :=
[
  term ((1555298057250 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1)],
  term ((-777649028625 : Rat) / 45033486517) [(0, 2), (8, 1)],
  term ((1555298057250 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)],
  term ((-777649028625 : Rat) / 45033486517) [(1, 2), (8, 1)],
  term ((-1555298057250 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)],
  term ((777649028625 : Rat) / 45033486517) [(6, 2), (8, 1)],
  term ((-1555298057250 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)],
  term ((777649028625 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 24. -/
theorem ep_Q2_054_partial_24_0072_valid :
    mulPoly ep_Q2_054_coefficient_24_0072
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0073 : Poly :=
[
  term ((-610104124962 : Rat) / 45033486517) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 73 for generator 24. -/
def ep_Q2_054_partial_24_0073 : Poly :=
[
  term ((1220208249924 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-610104124962 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((1220208249924 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610104124962 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1220208249924 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((610104124962 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1220208249924 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((610104124962 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 24. -/
theorem ep_Q2_054_partial_24_0073_valid :
    mulPoly ep_Q2_054_coefficient_24_0073
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0074 : Poly :=
[
  term ((45952838494074 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 74 for generator 24. -/
def ep_Q2_054_partial_24_0074 : Poly :=
[
  term ((-91905676988148 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 24. -/
theorem ep_Q2_054_partial_24_0074_valid :
    mulPoly ep_Q2_054_coefficient_24_0074
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0075 : Poly :=
[
  term ((-19311273412956 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 75 for generator 24. -/
def ep_Q2_054_partial_24_0075 : Poly :=
[
  term ((38622546825912 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-19311273412956 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((38622546825912 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-19311273412956 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((-38622546825912 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2)],
  term ((19311273412956 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2)],
  term ((-38622546825912 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((19311273412956 : Rat) / 45033486517) [(7, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 24. -/
theorem ep_Q2_054_partial_24_0075_valid :
    mulPoly ep_Q2_054_coefficient_24_0075
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0076 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 76 for generator 24. -/
def ep_Q2_054_partial_24_0076 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(7, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 24. -/
theorem ep_Q2_054_partial_24_0076_valid :
    mulPoly ep_Q2_054_coefficient_24_0076
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0077 : Poly :=
[
  term ((311355318438 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 77 for generator 24. -/
def ep_Q2_054_partial_24_0077 : Poly :=
[
  term ((-622710636876 : Rat) / 45033486517) [(0, 1), (8, 2), (12, 1)],
  term ((311355318438 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((-622710636876 : Rat) / 45033486517) [(1, 1), (8, 2), (13, 1)],
  term ((311355318438 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((622710636876 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(6, 2), (8, 2)],
  term ((622710636876 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(7, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 24. -/
theorem ep_Q2_054_partial_24_0077_valid :
    mulPoly ep_Q2_054_coefficient_24_0077
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0078 : Poly :=
[
  term ((673628397651 : Rat) / 180133946068) [(9, 1), (11, 1)]
]

/-- Partial product 78 for generator 24. -/
def ep_Q2_054_partial_24_0078 : Poly :=
[
  term ((-673628397651 : Rat) / 90066973034) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((673628397651 : Rat) / 180133946068) [(0, 2), (9, 1), (11, 1)],
  term ((-673628397651 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((673628397651 : Rat) / 180133946068) [(1, 2), (9, 1), (11, 1)],
  term ((673628397651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(6, 2), (9, 1), (11, 1)],
  term ((673628397651 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 24. -/
theorem ep_Q2_054_partial_24_0078_valid :
    mulPoly ep_Q2_054_coefficient_24_0078
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0079 : Poly :=
[
  term ((-11572306814187 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 79 for generator 24. -/
def ep_Q2_054_partial_24_0079 : Poly :=
[
  term ((11572306814187 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-11572306814187 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((11572306814187 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11572306814187 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-11572306814187 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((11572306814187 : Rat) / 90066973034) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-11572306814187 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((11572306814187 : Rat) / 90066973034) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 24. -/
theorem ep_Q2_054_partial_24_0079_valid :
    mulPoly ep_Q2_054_coefficient_24_0079
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0080 : Poly :=
[
  term ((2592448681869 : Rat) / 180133946068) [(9, 1), (13, 1)]
]

/-- Partial product 80 for generator 24. -/
def ep_Q2_054_partial_24_0080 : Poly :=
[
  term ((-2592448681869 : Rat) / 90066973034) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((2592448681869 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((-2592448681869 : Rat) / 90066973034) [(1, 1), (9, 1), (13, 2)],
  term ((2592448681869 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((2592448681869 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2592448681869 : Rat) / 180133946068) [(6, 2), (9, 1), (13, 1)],
  term ((2592448681869 : Rat) / 90066973034) [(7, 1), (9, 1), (13, 2)],
  term ((-2592448681869 : Rat) / 180133946068) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 24. -/
theorem ep_Q2_054_partial_24_0080_valid :
    mulPoly ep_Q2_054_coefficient_24_0080
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0081 : Poly :=
[
  term ((10640556568827 : Rat) / 180133946068) [(9, 1), (15, 1)]
]

/-- Partial product 81 for generator 24. -/
def ep_Q2_054_partial_24_0081 : Poly :=
[
  term ((-10640556568827 : Rat) / 90066973034) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((10640556568827 : Rat) / 180133946068) [(0, 2), (9, 1), (15, 1)],
  term ((-10640556568827 : Rat) / 90066973034) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((10640556568827 : Rat) / 180133946068) [(1, 2), (9, 1), (15, 1)],
  term ((10640556568827 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-10640556568827 : Rat) / 180133946068) [(6, 2), (9, 1), (15, 1)],
  term ((10640556568827 : Rat) / 90066973034) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-10640556568827 : Rat) / 180133946068) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 24. -/
theorem ep_Q2_054_partial_24_0081_valid :
    mulPoly ep_Q2_054_coefficient_24_0081
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0082 : Poly :=
[
  term ((20412981747 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 82 for generator 24. -/
def ep_Q2_054_partial_24_0082 : Poly :=
[
  term ((-40825963494 : Rat) / 45033486517) [(0, 1), (9, 2), (12, 1)],
  term ((20412981747 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((-40825963494 : Rat) / 45033486517) [(1, 1), (9, 2), (13, 1)],
  term ((20412981747 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)],
  term ((-20412981747 : Rat) / 45033486517) [(6, 2), (9, 2)],
  term ((40825963494 : Rat) / 45033486517) [(7, 1), (9, 2), (13, 1)],
  term ((-20412981747 : Rat) / 45033486517) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 24. -/
theorem ep_Q2_054_partial_24_0082_valid :
    mulPoly ep_Q2_054_coefficient_24_0082
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0083 : Poly :=
[
  term ((-38302062349617 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 83 for generator 24. -/
def ep_Q2_054_partial_24_0083 : Poly :=
[
  term ((38302062349617 : Rat) / 45033486517) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-38302062349617 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1)],
  term ((38302062349617 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38302062349617 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((-38302062349617 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((38302062349617 : Rat) / 90066973034) [(6, 2), (11, 1), (15, 1)],
  term ((-38302062349617 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((38302062349617 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 24. -/
theorem ep_Q2_054_partial_24_0083_valid :
    mulPoly ep_Q2_054_coefficient_24_0083
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0084 : Poly :=
[
  term ((-1859887110627 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 84 for generator 24. -/
def ep_Q2_054_partial_24_0084 : Poly :=
[
  term ((3719774221254 : Rat) / 45033486517) [(0, 1), (12, 2), (15, 2)],
  term ((-1859887110627 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((3719774221254 : Rat) / 45033486517) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1859887110627 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((-3719774221254 : Rat) / 45033486517) [(6, 1), (12, 2), (15, 2)],
  term ((1859887110627 : Rat) / 45033486517) [(6, 2), (12, 1), (15, 2)],
  term ((-3719774221254 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((1859887110627 : Rat) / 45033486517) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 24. -/
theorem ep_Q2_054_partial_24_0084_valid :
    mulPoly ep_Q2_054_coefficient_24_0084
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0085 : Poly :=
[
  term ((5940263282409 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 85 for generator 24. -/
def ep_Q2_054_partial_24_0085 : Poly :=
[
  term ((-5940263282409 : Rat) / 45033486517) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((5940263282409 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((-5940263282409 : Rat) / 45033486517) [(1, 1), (13, 2), (15, 1)],
  term ((5940263282409 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((5940263282409 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5940263282409 : Rat) / 90066973034) [(6, 2), (13, 1), (15, 1)],
  term ((5940263282409 : Rat) / 45033486517) [(7, 1), (13, 2), (15, 1)],
  term ((-5940263282409 : Rat) / 90066973034) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 24. -/
theorem ep_Q2_054_partial_24_0085_valid :
    mulPoly ep_Q2_054_coefficient_24_0085
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 24. -/
def ep_Q2_054_coefficient_24_0086 : Poly :=
[
  term ((-19006265824911 : Rat) / 90066973034) [(15, 2)]
]

/-- Partial product 86 for generator 24. -/
def ep_Q2_054_partial_24_0086 : Poly :=
[
  term ((19006265824911 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)],
  term ((-19006265824911 : Rat) / 90066973034) [(0, 2), (15, 2)],
  term ((19006265824911 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)],
  term ((-19006265824911 : Rat) / 90066973034) [(1, 2), (15, 2)],
  term ((-19006265824911 : Rat) / 45033486517) [(6, 1), (12, 1), (15, 2)],
  term ((19006265824911 : Rat) / 90066973034) [(6, 2), (15, 2)],
  term ((-19006265824911 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)],
  term ((19006265824911 : Rat) / 90066973034) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 24. -/
theorem ep_Q2_054_partial_24_0086_valid :
    mulPoly ep_Q2_054_coefficient_24_0086
        ep_Q2_054_generator_24_0000_0086 =
      ep_Q2_054_partial_24_0086 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_24_0000_0086 : List Poly :=
[
  ep_Q2_054_partial_24_0000,
  ep_Q2_054_partial_24_0001,
  ep_Q2_054_partial_24_0002,
  ep_Q2_054_partial_24_0003,
  ep_Q2_054_partial_24_0004,
  ep_Q2_054_partial_24_0005,
  ep_Q2_054_partial_24_0006,
  ep_Q2_054_partial_24_0007,
  ep_Q2_054_partial_24_0008,
  ep_Q2_054_partial_24_0009,
  ep_Q2_054_partial_24_0010,
  ep_Q2_054_partial_24_0011,
  ep_Q2_054_partial_24_0012,
  ep_Q2_054_partial_24_0013,
  ep_Q2_054_partial_24_0014,
  ep_Q2_054_partial_24_0015,
  ep_Q2_054_partial_24_0016,
  ep_Q2_054_partial_24_0017,
  ep_Q2_054_partial_24_0018,
  ep_Q2_054_partial_24_0019,
  ep_Q2_054_partial_24_0020,
  ep_Q2_054_partial_24_0021,
  ep_Q2_054_partial_24_0022,
  ep_Q2_054_partial_24_0023,
  ep_Q2_054_partial_24_0024,
  ep_Q2_054_partial_24_0025,
  ep_Q2_054_partial_24_0026,
  ep_Q2_054_partial_24_0027,
  ep_Q2_054_partial_24_0028,
  ep_Q2_054_partial_24_0029,
  ep_Q2_054_partial_24_0030,
  ep_Q2_054_partial_24_0031,
  ep_Q2_054_partial_24_0032,
  ep_Q2_054_partial_24_0033,
  ep_Q2_054_partial_24_0034,
  ep_Q2_054_partial_24_0035,
  ep_Q2_054_partial_24_0036,
  ep_Q2_054_partial_24_0037,
  ep_Q2_054_partial_24_0038,
  ep_Q2_054_partial_24_0039,
  ep_Q2_054_partial_24_0040,
  ep_Q2_054_partial_24_0041,
  ep_Q2_054_partial_24_0042,
  ep_Q2_054_partial_24_0043,
  ep_Q2_054_partial_24_0044,
  ep_Q2_054_partial_24_0045,
  ep_Q2_054_partial_24_0046,
  ep_Q2_054_partial_24_0047,
  ep_Q2_054_partial_24_0048,
  ep_Q2_054_partial_24_0049,
  ep_Q2_054_partial_24_0050,
  ep_Q2_054_partial_24_0051,
  ep_Q2_054_partial_24_0052,
  ep_Q2_054_partial_24_0053,
  ep_Q2_054_partial_24_0054,
  ep_Q2_054_partial_24_0055,
  ep_Q2_054_partial_24_0056,
  ep_Q2_054_partial_24_0057,
  ep_Q2_054_partial_24_0058,
  ep_Q2_054_partial_24_0059,
  ep_Q2_054_partial_24_0060,
  ep_Q2_054_partial_24_0061,
  ep_Q2_054_partial_24_0062,
  ep_Q2_054_partial_24_0063,
  ep_Q2_054_partial_24_0064,
  ep_Q2_054_partial_24_0065,
  ep_Q2_054_partial_24_0066,
  ep_Q2_054_partial_24_0067,
  ep_Q2_054_partial_24_0068,
  ep_Q2_054_partial_24_0069,
  ep_Q2_054_partial_24_0070,
  ep_Q2_054_partial_24_0071,
  ep_Q2_054_partial_24_0072,
  ep_Q2_054_partial_24_0073,
  ep_Q2_054_partial_24_0074,
  ep_Q2_054_partial_24_0075,
  ep_Q2_054_partial_24_0076,
  ep_Q2_054_partial_24_0077,
  ep_Q2_054_partial_24_0078,
  ep_Q2_054_partial_24_0079,
  ep_Q2_054_partial_24_0080,
  ep_Q2_054_partial_24_0081,
  ep_Q2_054_partial_24_0082,
  ep_Q2_054_partial_24_0083,
  ep_Q2_054_partial_24_0084,
  ep_Q2_054_partial_24_0085,
  ep_Q2_054_partial_24_0086
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_24_0000_0086 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((158751776124 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((119059386768 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (7, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term ((-787959761580 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1910820432528 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((228716138232 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-110847860640 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((406290966264 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (9, 1)],
  term ((-756798952248 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 3)],
  term ((653215415904 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-8386962396984 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9931655721564 : Rat) / 45033486517) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((79375888062 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((8228210620860 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((1309702153023 : Rat) / 90066973034) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((5040368891937 : Rat) / 90066973034) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-3150579540537 : Rat) / 90066973034) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-10785565750167 : Rat) / 45033486517) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-1783933306974 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1)],
  term ((-37602585815904 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((14555920433112 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((891966653487 : Rat) / 45033486517) [(0, 1), (1, 2)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (7, 1), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-59529693384 : Rat) / 45033486517) [(0, 1), (1, 2), (6, 1)],
  term ((320403111768 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((334005769116 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-246847659840 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 2)],
  term ((-4965827860782 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (12, 1)],
  term ((1106710355016 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-4114105310430 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (1, 2), (9, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (12, 2)],
  term ((-6673417036236 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 2)],
  term ((18801292907952 : Rat) / 45033486517) [(0, 1), (1, 2), (15, 2)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 3), (7, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 3), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 3), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 3), (15, 1)],
  term ((12486317624694 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (12, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 2)],
  term ((1537533900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2)],
  term ((-2559776815512 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-1916578168020 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (12, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3), (16, 1)],
  term ((226490803308 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((695467500732 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-493695319680 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-119059386768 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((59529693384 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (12, 1)],
  term ((-17179360328466 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1), (12, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-3563781816420 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((3614471378532 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1)],
  term ((-21311690473188 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((37602585815904 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((-891966653487 : Rat) / 45033486517) [(0, 1), (6, 2)],
  term ((-320403111768 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (11, 1)],
  term ((-114358069116 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((246847659840 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2)],
  term ((4965827860782 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((163303853976 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((4114105310430 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 2)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-119059386768 : Rat) / 45033486517) [(0, 1), (6, 2), (12, 1)],
  term ((7277960216556 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-18801292907952 : Rat) / 45033486517) [(0, 1), (6, 2), (15, 2)],
  term ((59529693384 : Rat) / 45033486517) [(0, 1), (6, 3)],
  term ((1046034917892 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((7010382677724 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9931655721564 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((351197076654 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((-8228210620860 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((653215415904 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((498508128135 : Rat) / 90066973034) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-743690157471 : Rat) / 90066973034) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1064036246949 : Rat) / 90066973034) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-7023389749011 : Rat) / 45033486517) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((1783933306974 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1)],
  term ((37602585815904 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-14555920433112 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-891966653487 : Rat) / 45033486517) [(0, 1), (7, 2)],
  term ((4965827860782 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1)],
  term ((-299539604772 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (12, 1)],
  term ((804110077512 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((4114105310430 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((466751362500 : Rat) / 45033486517) [(0, 1), (7, 2), (12, 2)],
  term ((6784264896876 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((228716138232 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 2)],
  term ((-18801292907952 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2)],
  term ((-320403111768 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (7, 3), (11, 1)],
  term ((105289630884 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)],
  term ((246847659840 : Rat) / 45033486517) [(0, 1), (7, 3), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 4)],
  term ((1220208249924 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1555298057250 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1)],
  term ((38622546825912 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-622710636876 : Rat) / 45033486517) [(0, 1), (8, 2), (12, 1)],
  term ((-673628397651 : Rat) / 90066973034) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-2592448681869 : Rat) / 90066973034) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-10640556568827 : Rat) / 90066973034) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((11572306814187 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(0, 1), (9, 2), (12, 1)],
  term ((38302062349617 : Rat) / 45033486517) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((790871210541 : Rat) / 45033486517) [(0, 1), (12, 1)],
  term ((-5940263282409 : Rat) / 45033486517) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((19006265824911 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)],
  term ((3719774221254 : Rat) / 45033486517) [(0, 1), (12, 2), (15, 2)],
  term ((-790871210541 : Rat) / 90066973034) [(0, 2)],
  term ((384383475000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1)],
  term ((393979880790 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((105289630884 : Rat) / 45033486517) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (9, 1)],
  term ((4193481198492 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-39687944031 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1)],
  term ((1433318062968 : Rat) / 45033486517) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(0, 2), (1, 1), (11, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((11994652110807 : Rat) / 90066973034) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-7580397309921 : Rat) / 180133946068) [(0, 2), (1, 1), (13, 1)],
  term ((3150579540537 : Rat) / 180133946068) [(0, 2), (1, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 2), (1, 2)],
  term ((635007104496 : Rat) / 45033486517) [(0, 2), (1, 2), (8, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (1, 2), (12, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(0, 2), (2, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(0, 2), (2, 1), (6, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 2), (2, 1), (12, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-915269035779 : Rat) / 45033486517) [(0, 2), (6, 1)],
  term ((207157710114 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(0, 2), (6, 1), (8, 1)],
  term ((-2332214402220 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((367433671446 : Rat) / 45033486517) [(0, 2), (6, 1), (9, 2)],
  term ((754066491264 : Rat) / 45033486517) [(0, 2), (6, 1), (12, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (6, 2)],
  term ((-523017458946 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((-3505191338862 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-175598538327 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1)],
  term ((-174054861036 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-498508128135 : Rat) / 180133946068) [(0, 2), (7, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-228716138232 : Rat) / 45033486517) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((8010780388371 : Rat) / 90066973034) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((3283718575455 : Rat) / 180133946068) [(0, 2), (7, 1), (13, 1)],
  term ((1064036246949 : Rat) / 180133946068) [(0, 2), (7, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 2), (7, 2)],
  term ((149769802386 : Rat) / 45033486517) [(0, 2), (7, 2), (8, 1)],
  term ((-453023381250 : Rat) / 45033486517) [(0, 2), (7, 2), (12, 1)],
  term ((-777649028625 : Rat) / 45033486517) [(0, 2), (8, 1)],
  term ((-610104124962 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((9931655721564 : Rat) / 45033486517) [(0, 2), (8, 1), (12, 1)],
  term ((-19311273412956 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((311355318438 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((673628397651 : Rat) / 180133946068) [(0, 2), (9, 1), (11, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((4884114427533 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2592448681869 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((10640556568827 : Rat) / 180133946068) [(0, 2), (9, 1), (15, 1)],
  term ((20412981747 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-38302062349617 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1)],
  term ((-1783933306974 : Rat) / 45033486517) [(0, 2), (12, 1)],
  term ((14555920433112 : Rat) / 45033486517) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-39462472926531 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((5940263282409 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((-19006265824911 : Rat) / 90066973034) [(0, 2), (15, 2)],
  term ((891966653487 : Rat) / 45033486517) [(0, 3)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 3), (1, 1), (7, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 3), (1, 1), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 3), (1, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 3), (1, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 3), (2, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(0, 3), (3, 1), (7, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 3), (3, 1), (7, 1), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(0, 3), (3, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-59529693384 : Rat) / 45033486517) [(0, 3), (6, 1)],
  term ((320403111768 : Rat) / 45033486517) [(0, 3), (7, 1), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 3), (7, 1), (9, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 3), (7, 1), (11, 1)],
  term ((114358069116 : Rat) / 45033486517) [(0, 3), (7, 1), (13, 1)],
  term ((-246847659840 : Rat) / 45033486517) [(0, 3), (7, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 3), (7, 2)],
  term ((-4965827860782 : Rat) / 45033486517) [(0, 3), (8, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(0, 3), (9, 1), (13, 1)],
  term ((-4114105310430 : Rat) / 45033486517) [(0, 3), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 3), (9, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 3), (11, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 3), (12, 1)],
  term ((-7277960216556 : Rat) / 45033486517) [(0, 3), (13, 1), (15, 1)],
  term ((18801292907952 : Rat) / 45033486517) [(0, 3), (15, 2)],
  term ((317503552248 : Rat) / 45033486517) [(0, 4)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((4806987178158 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (7, 1), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-11157872886720 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1031504984010 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (13, 1), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 3), (16, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-1916578168020 : Rat) / 45033486517) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((787959761580 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1843081405344 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 1)],
  term ((-228716138232 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (12, 2)],
  term ((466751362500 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((-653215415904 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((8386962396984 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7247704606902 : Rat) / 45033486517) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((4664428804440 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((-1309702153023 : Rat) / 90066973034) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-5040368891937 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((3150579540537 : Rat) / 90066973034) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((10785565750167 : Rat) / 45033486517) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((1830538071558 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1)],
  term ((-393979880790 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((114358069116 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (12, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (9, 1)],
  term ((-4193481198492 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((39687944031 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1)],
  term ((-1592069839092 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1), (12, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (6, 2), (11, 1)],
  term ((-10785565750167 : Rat) / 90066973034) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((5040368891937 : Rat) / 180133946068) [(1, 1), (6, 2), (13, 1)],
  term ((-3150579540537 : Rat) / 180133946068) [(1, 1), (6, 2), (15, 1)],
  term ((714382992558 : Rat) / 45033486517) [(1, 1), (6, 3), (9, 1)],
  term ((392819501988 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((15397345074708 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((1031504984010 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-606895017048 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((271821188592 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-405597012444 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((3762176001156 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((1043271646794 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2892029524704 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 2)],
  term ((326607707952 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (9, 1)],
  term ((488420156808 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-4193481198492 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((39687944031 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((1309702153023 : Rat) / 180133946068) [(1, 1), (7, 2), (11, 1)],
  term ((238035224268 : Rat) / 45033486517) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-10785565750167 : Rat) / 90066973034) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((4820721191937 : Rat) / 180133946068) [(1, 1), (7, 2), (13, 1)],
  term ((-3150579540537 : Rat) / 180133946068) [(1, 1), (7, 2), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(1, 1), (7, 3)],
  term ((-393979880790 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1), (16, 1)],
  term ((114358069116 : Rat) / 45033486517) [(1, 1), (7, 3), (12, 1)],
  term ((1220208249924 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1555298057250 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1)],
  term ((38622546825912 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((1916578168020 : Rat) / 45033486517) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-622710636876 : Rat) / 45033486517) [(1, 1), (8, 2), (13, 1)],
  term ((-673628397651 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((11572306814187 : Rat) / 45033486517) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10640556568827 : Rat) / 90066973034) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2592448681869 : Rat) / 90066973034) [(1, 1), (9, 1), (13, 2)],
  term ((-40825963494 : Rat) / 45033486517) [(1, 1), (9, 2), (13, 1)],
  term ((38302062349617 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((3719774221254 : Rat) / 45033486517) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((790871210541 : Rat) / 45033486517) [(1, 1), (13, 1)],
  term ((19006265824911 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)],
  term ((-5940263282409 : Rat) / 45033486517) [(1, 1), (13, 2), (15, 1)],
  term ((-790871210541 : Rat) / 90066973034) [(1, 2)],
  term ((1279888407756 : Rat) / 45033486517) [(1, 2), (2, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(1, 2), (2, 1), (6, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-915269035779 : Rat) / 45033486517) [(1, 2), (6, 1)],
  term ((207157710114 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((3623852303451 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(1, 2), (6, 1), (8, 1), (12, 1)],
  term ((1428765985116 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-2332214402220 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((367433671446 : Rat) / 45033486517) [(1, 2), (6, 1), (9, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (6, 1), (12, 2)],
  term ((3377885020038 : Rat) / 45033486517) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 2), (6, 2), (8, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (6, 2), (12, 1)],
  term ((-523017458946 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((482054447412 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3505191338862 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-175598538327 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1)],
  term ((466751362500 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-498508128135 : Rat) / 180133946068) [(1, 2), (7, 1), (11, 1)],
  term ((-406290966264 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((7023389749011 : Rat) / 90066973034) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((963337857471 : Rat) / 180133946068) [(1, 2), (7, 1), (13, 1)],
  term ((1064036246949 : Rat) / 180133946068) [(1, 2), (7, 1), (15, 1)],
  term ((-485237302110 : Rat) / 45033486517) [(1, 2), (7, 2), (8, 1)],
  term ((84127870998 : Rat) / 45033486517) [(1, 2), (7, 2), (12, 1)],
  term ((-777649028625 : Rat) / 45033486517) [(1, 2), (8, 1)],
  term ((653215415904 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((-610104124962 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-8386962396984 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19311273412956 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((311355318438 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((673628397651 : Rat) / 180133946068) [(1, 2), (9, 1), (11, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-11572306814187 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((2909952234117 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((10640556568827 : Rat) / 180133946068) [(1, 2), (9, 1), (15, 1)],
  term ((20412981747 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((1309702153023 : Rat) / 90066973034) [(1, 2), (11, 1), (13, 1)],
  term ((-38302062349617 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((-10785565750167 : Rat) / 45033486517) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1859887110627 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((1394841870936 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1)],
  term ((5040368891937 : Rat) / 90066973034) [(1, 2), (13, 2)],
  term ((-19006265824911 : Rat) / 90066973034) [(1, 2), (15, 2)],
  term ((384383475000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 3), (2, 1), (7, 1), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((-714382992558 : Rat) / 45033486517) [(1, 3), (6, 1), (9, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(1, 3), (7, 1)],
  term ((393979880790 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 3), (7, 1), (8, 1), (16, 1)],
  term ((-114358069116 : Rat) / 45033486517) [(1, 3), (7, 1), (12, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(1, 3), (8, 1), (9, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 3), (8, 1), (13, 1)],
  term ((4193481198492 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((-39687944031 : Rat) / 45033486517) [(1, 3), (9, 1)],
  term ((163303853976 : Rat) / 45033486517) [(1, 3), (9, 1), (12, 1)],
  term ((-1309702153023 : Rat) / 180133946068) [(1, 3), (11, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 3), (12, 1), (13, 1)],
  term ((10785565750167 : Rat) / 90066973034) [(1, 3), (12, 1), (15, 1)],
  term ((-5040368891937 : Rat) / 180133946068) [(1, 3), (13, 1)],
  term ((3150579540537 : Rat) / 180133946068) [(1, 3), (15, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 4), (8, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 4), (12, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4806987178158 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2)],
  term ((2559776815512 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1), (6, 2)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4806987178158 : Rat) / 45033486517) [(2, 1), (6, 2), (12, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(2, 1), (6, 3)],
  term ((2559776815512 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1), (7, 2)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(2, 1), (7, 2), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (7, 3), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-1046034917892 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-7010382677724 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-351197076654 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((933502725000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 2)],
  term ((-4664428804440 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((734867342892 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((-498508128135 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((743690157471 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((1064036246949 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((7023389749011 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-1830538071558 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((915269035779 : Rat) / 45033486517) [(6, 1), (7, 2)],
  term ((-3623852303451 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1)],
  term ((299539604772 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (12, 1)],
  term ((414315420228 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((2332214402220 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)],
  term ((-466751362500 : Rat) / 45033486517) [(6, 1), (7, 2), (12, 2)],
  term ((-3377885020038 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 2)],
  term ((-207157710114 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1)],
  term ((233375681250 : Rat) / 45033486517) [(6, 1), (7, 3), (13, 1)],
  term ((-1220208249924 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1555298057250 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)],
  term ((-38622546825912 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-1916578168020 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((622710636876 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1)],
  term ((673628397651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((2592448681869 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((10640556568827 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-11572306814187 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)],
  term ((-38302062349617 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-790871210541 : Rat) / 45033486517) [(6, 1), (12, 1)],
  term ((5940263282409 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-19006265824911 : Rat) / 45033486517) [(6, 1), (12, 1), (15, 2)],
  term ((-3719774221254 : Rat) / 45033486517) [(6, 1), (12, 2), (15, 2)],
  term ((790871210541 : Rat) / 90066973034) [(6, 2)],
  term ((523017458946 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (9, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (11, 1)],
  term ((3505191338862 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((175598538327 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (12, 1)],
  term ((498508128135 : Rat) / 180133946068) [(6, 2), (7, 1), (11, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((-7023389749011 : Rat) / 90066973034) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((-743690157471 : Rat) / 180133946068) [(6, 2), (7, 1), (13, 1)],
  term ((-1064036246949 : Rat) / 180133946068) [(6, 2), (7, 1), (15, 1)],
  term ((-149769802386 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1)],
  term ((233375681250 : Rat) / 45033486517) [(6, 2), (7, 2), (12, 1)],
  term ((777649028625 : Rat) / 45033486517) [(6, 2), (8, 1)],
  term ((610104124962 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((7247704606902 : Rat) / 45033486517) [(6, 2), (8, 1), (12, 1)],
  term ((19311273412956 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(6, 2), (8, 2)],
  term ((-673628397651 : Rat) / 180133946068) [(6, 2), (9, 1), (11, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2592448681869 : Rat) / 180133946068) [(6, 2), (9, 1), (13, 1)],
  term ((-10640556568827 : Rat) / 180133946068) [(6, 2), (9, 1), (15, 1)],
  term ((-20412981747 : Rat) / 45033486517) [(6, 2), (9, 2)],
  term ((734867342892 : Rat) / 45033486517) [(6, 2), (9, 2), (12, 1)],
  term ((38302062349617 : Rat) / 90066973034) [(6, 2), (11, 1), (15, 1)],
  term ((-1830538071558 : Rat) / 45033486517) [(6, 2), (12, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((1859887110627 : Rat) / 45033486517) [(6, 2), (12, 1), (15, 2)],
  term ((-5940263282409 : Rat) / 90066973034) [(6, 2), (13, 1), (15, 1)],
  term ((19006265824911 : Rat) / 90066973034) [(6, 2), (15, 2)],
  term ((915269035779 : Rat) / 45033486517) [(6, 3)],
  term ((-207157710114 : Rat) / 45033486517) [(6, 3), (7, 1), (9, 1)],
  term ((233375681250 : Rat) / 45033486517) [(6, 3), (7, 1), (13, 1)],
  term ((-3623852303451 : Rat) / 45033486517) [(6, 3), (8, 1)],
  term ((2332214402220 : Rat) / 45033486517) [(6, 3), (9, 1), (15, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 3), (9, 2)],
  term ((-3377885020038 : Rat) / 45033486517) [(6, 3), (13, 1), (15, 1)],
  term ((-1220208249924 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1555298057250 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)],
  term ((-38622546825912 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1916578168020 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((622710636876 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1)],
  term ((673628397651 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-11572306814187 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((10640556568827 : Rat) / 90066973034) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((2592448681869 : Rat) / 90066973034) [(7, 1), (9, 1), (13, 2)],
  term ((40825963494 : Rat) / 45033486517) [(7, 1), (9, 2), (13, 1)],
  term ((-38302062349617 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3719774221254 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-790871210541 : Rat) / 45033486517) [(7, 1), (13, 1)],
  term ((-19006265824911 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)],
  term ((5940263282409 : Rat) / 45033486517) [(7, 1), (13, 2), (15, 1)],
  term ((790871210541 : Rat) / 90066973034) [(7, 2)],
  term ((777649028625 : Rat) / 45033486517) [(7, 2), (8, 1)],
  term ((-1046034917892 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((610104124962 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-7010382677724 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((19311273412956 : Rat) / 45033486517) [(7, 2), (8, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(7, 2), (8, 2)],
  term ((-673628397651 : Rat) / 180133946068) [(7, 2), (9, 1), (11, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((11572306814187 : Rat) / 90066973034) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-3997236988485 : Rat) / 180133946068) [(7, 2), (9, 1), (13, 1)],
  term ((-10640556568827 : Rat) / 180133946068) [(7, 2), (9, 1), (15, 1)],
  term ((-20412981747 : Rat) / 45033486517) [(7, 2), (9, 2)],
  term ((-498508128135 : Rat) / 90066973034) [(7, 2), (11, 1), (13, 1)],
  term ((38302062349617 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1)],
  term ((7023389749011 : Rat) / 45033486517) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((1859887110627 : Rat) / 45033486517) [(7, 2), (12, 1), (15, 2)],
  term ((-2438113517730 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)],
  term ((743690157471 : Rat) / 90066973034) [(7, 2), (13, 2)],
  term ((19006265824911 : Rat) / 90066973034) [(7, 2), (15, 2)],
  term ((523017458946 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(7, 3), (8, 1), (11, 1)],
  term ((299539604772 : Rat) / 45033486517) [(7, 3), (8, 1), (13, 1)],
  term ((3505191338862 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1), (16, 1)],
  term ((175598538327 : Rat) / 45033486517) [(7, 3), (9, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 3), (9, 1), (12, 1)],
  term ((498508128135 : Rat) / 180133946068) [(7, 3), (11, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 3), (12, 1), (13, 1)],
  term ((-7023389749011 : Rat) / 90066973034) [(7, 3), (12, 1), (15, 1)],
  term ((-743690157471 : Rat) / 180133946068) [(7, 3), (13, 1)],
  term ((-1064036246949 : Rat) / 180133946068) [(7, 3), (15, 1)],
  term ((-149769802386 : Rat) / 45033486517) [(7, 4), (8, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 86. -/
theorem ep_Q2_054_block_24_0000_0086_valid :
    checkProductSumEq ep_Q2_054_partials_24_0000_0086
      ep_Q2_054_block_24_0000_0086 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
