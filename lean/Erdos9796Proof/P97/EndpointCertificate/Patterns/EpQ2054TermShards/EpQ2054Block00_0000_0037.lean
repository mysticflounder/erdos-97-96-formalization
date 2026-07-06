/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 0:0-37

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 0 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_00_0000_0037 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0000 : Poly :=
[
  term ((1541051357337 : Rat) / 180133946068) []
]

/-- Partial product 0 for generator 0. -/
def ep_Q2_054_partial_00_0000 : Poly :=
[
  term ((-1541051357337 : Rat) / 90066973034) [(0, 1), (2, 1)],
  term ((1541051357337 : Rat) / 90066973034) [(0, 1), (6, 1)],
  term ((-1541051357337 : Rat) / 90066973034) [(1, 1), (3, 1)],
  term ((1541051357337 : Rat) / 90066973034) [(1, 1), (7, 1)],
  term ((1541051357337 : Rat) / 180133946068) [(2, 2)],
  term ((1541051357337 : Rat) / 180133946068) [(3, 2)],
  term ((-1541051357337 : Rat) / 180133946068) [(6, 2)],
  term ((-1541051357337 : Rat) / 180133946068) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 0. -/
theorem ep_Q2_054_partial_00_0000_valid :
    mulPoly ep_Q2_054_coefficient_00_0000
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0001 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(0, 1)]
]

/-- Partial product 1 for generator 0. -/
def ep_Q2_054_partial_00_0001 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (2, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (3, 2)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (6, 2)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (7, 2)],
  term ((635007104496 : Rat) / 45033486517) [(0, 2), (2, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 0. -/
theorem ep_Q2_054_partial_00_0001_valid :
    mulPoly ep_Q2_054_coefficient_00_0001
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0002 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 2 for generator 0. -/
def ep_Q2_054_partial_00_0002 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 0. -/
theorem ep_Q2_054_partial_00_0002_valid :
    mulPoly ep_Q2_054_coefficient_00_0002
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0003 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 3 for generator 0. -/
def ep_Q2_054_partial_00_0003 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 1), (7, 3), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 0. -/
theorem ep_Q2_054_partial_00_0003_valid :
    mulPoly ep_Q2_054_coefficient_00_0003
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0004 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (7, 2)]
]

/-- Partial product 4 for generator 0. -/
def ep_Q2_054_partial_00_0004 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 2)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 3)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 2)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (7, 4)],
  term ((109823850000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 2)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 0. -/
theorem ep_Q2_054_partial_00_0004_valid :
    mulPoly ep_Q2_054_coefficient_00_0004
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0005 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 5 for generator 0. -/
def ep_Q2_054_partial_00_0005 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 0. -/
theorem ep_Q2_054_partial_00_0005_valid :
    mulPoly ep_Q2_054_coefficient_00_0005
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0006 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 6 for generator 0. -/
def ep_Q2_054_partial_00_0006 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (7, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 3)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (6, 3), (7, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 0. -/
theorem ep_Q2_054_partial_00_0006_valid :
    mulPoly ep_Q2_054_coefficient_00_0006
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0007 : Poly :=
[
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 7 for generator 0. -/
def ep_Q2_054_partial_00_0007 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (6, 3), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 0. -/
theorem ep_Q2_054_partial_00_0007_valid :
    mulPoly ep_Q2_054_coefficient_00_0007
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0008 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (7, 1)]
]

/-- Partial product 8 for generator 0. -/
def ep_Q2_054_partial_00_0008 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (7, 3)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 0. -/
theorem ep_Q2_054_partial_00_0008_valid :
    mulPoly ep_Q2_054_coefficient_00_0008
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0009 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (9, 1)]
]

/-- Partial product 9 for generator 0. -/
def ep_Q2_054_partial_00_0009 : Poly :=
[
  term ((-1270014208992 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 0. -/
theorem ep_Q2_054_partial_00_0009_valid :
    mulPoly ep_Q2_054_coefficient_00_0009
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0010 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (15, 1)]
]

/-- Partial product 10 for generator 0. -/
def ep_Q2_054_partial_00_0010 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (6, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (7, 2), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 0. -/
theorem ep_Q2_054_partial_00_0010_valid :
    mulPoly ep_Q2_054_coefficient_00_0010
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0011 : Poly :=
[
  term ((9706893109182 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 11 for generator 0. -/
def ep_Q2_054_partial_00_0011 : Poly :=
[
  term ((-19413786218364 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 2)],
  term ((-19413786218364 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 3)],
  term ((-9706893109182 : Rat) / 45033486517) [(3, 1), (6, 3), (7, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(3, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 0. -/
theorem ep_Q2_054_partial_00_0011_valid :
    mulPoly ep_Q2_054_coefficient_00_0011
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0012 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 12 for generator 0. -/
def ep_Q2_054_partial_00_0012 : Poly :=
[
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (6, 3), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 0. -/
theorem ep_Q2_054_partial_00_0012_valid :
    mulPoly ep_Q2_054_coefficient_00_0012
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0013 : Poly :=
[
  term ((4252391987652 : Rat) / 45033486517) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 13 for generator 0. -/
def ep_Q2_054_partial_00_0013 : Poly :=
[
  term ((-8504783975304 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(3, 1), (6, 3), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 0. -/
theorem ep_Q2_054_partial_00_0013_valid :
    mulPoly ep_Q2_054_coefficient_00_0013
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0014 : Poly :=
[
  term ((384383475000 : Rat) / 45033486517) [(3, 1), (7, 1)]
]

/-- Partial product 14 for generator 0. -/
def ep_Q2_054_partial_00_0014 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1)],
  term ((384383475000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(3, 1), (7, 3)],
  term ((384383475000 : Rat) / 45033486517) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 0. -/
theorem ep_Q2_054_partial_00_0014_valid :
    mulPoly ep_Q2_054_coefficient_00_0014
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0015 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 15 for generator 0. -/
def ep_Q2_054_partial_00_0015 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 3), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 0. -/
theorem ep_Q2_054_partial_00_0015_valid :
    mulPoly ep_Q2_054_coefficient_00_0015
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0016 : Poly :=
[
  term ((-6347703393360 : Rat) / 45033486517) [(3, 1), (15, 1)]
]

/-- Partial product 16 for generator 0. -/
def ep_Q2_054_partial_00_0016 : Poly :=
[
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(2, 2), (3, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(3, 1), (6, 2), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 0. -/
theorem ep_Q2_054_partial_00_0016_valid :
    mulPoly ep_Q2_054_coefficient_00_0016
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0017 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 0. -/
def ep_Q2_054_partial_00_0017 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 0. -/
theorem ep_Q2_054_partial_00_0017_valid :
    mulPoly ep_Q2_054_coefficient_00_0017
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0018 : Poly :=
[
  term ((-9889932859182 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 18 for generator 0. -/
def ep_Q2_054_partial_00_0018 : Poly :=
[
  term ((19779865718364 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-19779865718364 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((19779865718364 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-19779865718364 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((-9889932859182 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((-9889932859182 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (9, 1)],
  term ((9889932859182 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1)],
  term ((9889932859182 : Rat) / 45033486517) [(6, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 0. -/
theorem ep_Q2_054_partial_00_0018_valid :
    mulPoly ep_Q2_054_coefficient_00_0018
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0019 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 19 for generator 0. -/
def ep_Q2_054_partial_00_0019 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(6, 1), (7, 3), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(6, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 0. -/
theorem ep_Q2_054_partial_00_0019_valid :
    mulPoly ep_Q2_054_coefficient_00_0019
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0020 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 20 for generator 0. -/
def ep_Q2_054_partial_00_0020 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(6, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 0. -/
theorem ep_Q2_054_partial_00_0020_valid :
    mulPoly ep_Q2_054_coefficient_00_0020
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0021 : Poly :=
[
  term ((-2030680197882 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 21 for generator 0. -/
def ep_Q2_054_partial_00_0021 : Poly :=
[
  term ((4061360395764 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-4061360395764 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((4061360395764 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-4061360395764 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2030680197882 : Rat) / 45033486517) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-2030680197882 : Rat) / 45033486517) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((2030680197882 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((2030680197882 : Rat) / 45033486517) [(6, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 0. -/
theorem ep_Q2_054_partial_00_0021_valid :
    mulPoly ep_Q2_054_coefficient_00_0021
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0022 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 22 for generator 0. -/
def ep_Q2_054_partial_00_0022 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(6, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 0. -/
theorem ep_Q2_054_partial_00_0022_valid :
    mulPoly ep_Q2_054_coefficient_00_0022
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0023 : Poly :=
[
  term ((-2221711789770 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 23 for generator 0. -/
def ep_Q2_054_partial_00_0023 : Poly :=
[
  term ((4443423579540 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-4443423579540 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((4443423579540 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((-4443423579540 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((-2221711789770 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-2221711789770 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((2221711789770 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((2221711789770 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 0. -/
theorem ep_Q2_054_partial_00_0023_valid :
    mulPoly ep_Q2_054_coefficient_00_0023
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0024 : Poly :=
[
  term ((-631570686768 : Rat) / 45033486517) [(7, 1), (9, 1)]
]

/-- Partial product 24 for generator 0. -/
def ep_Q2_054_partial_00_0024 : Poly :=
[
  term ((1263141373536 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1)],
  term ((-1263141373536 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((1263141373536 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((-1263141373536 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((-631570686768 : Rat) / 45033486517) [(2, 2), (7, 1), (9, 1)],
  term ((-631570686768 : Rat) / 45033486517) [(3, 2), (7, 1), (9, 1)],
  term ((631570686768 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1)],
  term ((631570686768 : Rat) / 45033486517) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 0. -/
theorem ep_Q2_054_partial_00_0024_valid :
    mulPoly ep_Q2_054_coefficient_00_0024
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0025 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 25 for generator 0. -/
def ep_Q2_054_partial_00_0025 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 0. -/
theorem ep_Q2_054_partial_00_0025_valid :
    mulPoly ep_Q2_054_coefficient_00_0025
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0026 : Poly :=
[
  term ((384383475000 : Rat) / 45033486517) [(7, 1), (11, 1)]
]

/-- Partial product 26 for generator 0. -/
def ep_Q2_054_partial_00_0026 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1)],
  term ((384383475000 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1)],
  term ((384383475000 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 0. -/
theorem ep_Q2_054_partial_00_0026_valid :
    mulPoly ep_Q2_054_coefficient_00_0026
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0027 : Poly :=
[
  term ((-247020113232 : Rat) / 45033486517) [(7, 1), (13, 1)]
]

/-- Partial product 27 for generator 0. -/
def ep_Q2_054_partial_00_0027 : Poly :=
[
  term ((494040226464 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((-494040226464 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((494040226464 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-494040226464 : Rat) / 45033486517) [(1, 1), (7, 2), (13, 1)],
  term ((-247020113232 : Rat) / 45033486517) [(2, 2), (7, 1), (13, 1)],
  term ((-247020113232 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1)],
  term ((247020113232 : Rat) / 45033486517) [(6, 2), (7, 1), (13, 1)],
  term ((247020113232 : Rat) / 45033486517) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 0. -/
theorem ep_Q2_054_partial_00_0027_valid :
    mulPoly ep_Q2_054_coefficient_00_0027
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0028 : Poly :=
[
  term ((183039750000 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 28 for generator 0. -/
def ep_Q2_054_partial_00_0028 : Poly :=
[
  term ((-366079500000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1)],
  term ((366079500000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1)],
  term ((183039750000 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1)],
  term ((183039750000 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(7, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 0. -/
theorem ep_Q2_054_partial_00_0028_valid :
    mulPoly ep_Q2_054_coefficient_00_0028
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0029 : Poly :=
[
  term ((-421821603468 : Rat) / 45033486517) [(8, 1)]
]

/-- Partial product 29 for generator 0. -/
def ep_Q2_054_partial_00_0029 : Poly :=
[
  term ((843643206936 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1)],
  term ((-843643206936 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1)],
  term ((843643206936 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1)],
  term ((-843643206936 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)],
  term ((-421821603468 : Rat) / 45033486517) [(2, 2), (8, 1)],
  term ((-421821603468 : Rat) / 45033486517) [(3, 2), (8, 1)],
  term ((421821603468 : Rat) / 45033486517) [(6, 2), (8, 1)],
  term ((421821603468 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 0. -/
theorem ep_Q2_054_partial_00_0029_valid :
    mulPoly ep_Q2_054_coefficient_00_0029
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0030 : Poly :=
[
  term ((-1716925274802 : Rat) / 45033486517) [(9, 1), (13, 1)]
]

/-- Partial product 30 for generator 0. -/
def ep_Q2_054_partial_00_0030 : Poly :=
[
  term ((3433850549604 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-3433850549604 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((3433850549604 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-3433850549604 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1716925274802 : Rat) / 45033486517) [(2, 2), (9, 1), (13, 1)],
  term ((-1716925274802 : Rat) / 45033486517) [(3, 2), (9, 1), (13, 1)],
  term ((1716925274802 : Rat) / 45033486517) [(6, 2), (9, 1), (13, 1)],
  term ((1716925274802 : Rat) / 45033486517) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 0. -/
theorem ep_Q2_054_partial_00_0030_valid :
    mulPoly ep_Q2_054_coefficient_00_0030
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0031 : Poly :=
[
  term ((8388878586660 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 31 for generator 0. -/
def ep_Q2_054_partial_00_0031 : Poly :=
[
  term ((-16777757173320 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((16777757173320 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-16777757173320 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((16777757173320 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((8388878586660 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1)],
  term ((8388878586660 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1)],
  term ((-8388878586660 : Rat) / 45033486517) [(6, 2), (9, 1), (15, 1)],
  term ((-8388878586660 : Rat) / 45033486517) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 0. -/
theorem ep_Q2_054_partial_00_0031_valid :
    mulPoly ep_Q2_054_coefficient_00_0031
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0032 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 0. -/
def ep_Q2_054_partial_00_0032 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 0. -/
theorem ep_Q2_054_partial_00_0032_valid :
    mulPoly ep_Q2_054_coefficient_00_0032
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0033 : Poly :=
[
  term ((-947417367528 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 33 for generator 0. -/
def ep_Q2_054_partial_00_0033 : Poly :=
[
  term ((1894834735056 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 2)],
  term ((-1894834735056 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 2)],
  term ((1894834735056 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 2)],
  term ((-1894834735056 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2)],
  term ((-947417367528 : Rat) / 45033486517) [(2, 2), (9, 2)],
  term ((-947417367528 : Rat) / 45033486517) [(3, 2), (9, 2)],
  term ((947417367528 : Rat) / 45033486517) [(6, 2), (9, 2)],
  term ((947417367528 : Rat) / 45033486517) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 0. -/
theorem ep_Q2_054_partial_00_0033_valid :
    mulPoly ep_Q2_054_coefficient_00_0033
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0034 : Poly :=
[
  term ((-9098374863816 : Rat) / 45033486517) [(11, 1), (15, 1)]
]

/-- Partial product 34 for generator 0. -/
def ep_Q2_054_partial_00_0034 : Poly :=
[
  term ((18196749727632 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-18196749727632 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((18196749727632 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-18196749727632 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-9098374863816 : Rat) / 45033486517) [(2, 2), (11, 1), (15, 1)],
  term ((-9098374863816 : Rat) / 45033486517) [(3, 2), (11, 1), (15, 1)],
  term ((9098374863816 : Rat) / 45033486517) [(6, 2), (11, 1), (15, 1)],
  term ((9098374863816 : Rat) / 45033486517) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 0. -/
theorem ep_Q2_054_partial_00_0034_valid :
    mulPoly ep_Q2_054_coefficient_00_0034
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0035 : Poly :=
[
  term ((-341281427085 : Rat) / 45033486517) [(12, 1)]
]

/-- Partial product 35 for generator 0. -/
def ep_Q2_054_partial_00_0035 : Poly :=
[
  term ((682562854170 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1)],
  term ((-682562854170 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1)],
  term ((682562854170 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1)],
  term ((-682562854170 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1)],
  term ((-341281427085 : Rat) / 45033486517) [(2, 2), (12, 1)],
  term ((-341281427085 : Rat) / 45033486517) [(3, 2), (12, 1)],
  term ((341281427085 : Rat) / 45033486517) [(6, 2), (12, 1)],
  term ((341281427085 : Rat) / 45033486517) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 0. -/
theorem ep_Q2_054_partial_00_0035_valid :
    mulPoly ep_Q2_054_coefficient_00_0035
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0036 : Poly :=
[
  term ((6748984933776 : Rat) / 45033486517) [(13, 1), (15, 1)]
]

/-- Partial product 36 for generator 0. -/
def ep_Q2_054_partial_00_0036 : Poly :=
[
  term ((-13497969867552 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((13497969867552 : Rat) / 45033486517) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-13497969867552 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((13497969867552 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((6748984933776 : Rat) / 45033486517) [(2, 2), (13, 1), (15, 1)],
  term ((6748984933776 : Rat) / 45033486517) [(3, 2), (13, 1), (15, 1)],
  term ((-6748984933776 : Rat) / 45033486517) [(6, 2), (13, 1), (15, 1)],
  term ((-6748984933776 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 0. -/
theorem ep_Q2_054_partial_00_0036_valid :
    mulPoly ep_Q2_054_coefficient_00_0036
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 0. -/
def ep_Q2_054_coefficient_00_0037 : Poly :=
[
  term ((1372407601149 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 37 for generator 0. -/
def ep_Q2_054_partial_00_0037 : Poly :=
[
  term ((-2744815202298 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2)],
  term ((2744815202298 : Rat) / 45033486517) [(0, 1), (6, 1), (15, 2)],
  term ((-2744815202298 : Rat) / 45033486517) [(1, 1), (3, 1), (15, 2)],
  term ((2744815202298 : Rat) / 45033486517) [(1, 1), (7, 1), (15, 2)],
  term ((1372407601149 : Rat) / 45033486517) [(2, 2), (15, 2)],
  term ((1372407601149 : Rat) / 45033486517) [(3, 2), (15, 2)],
  term ((-1372407601149 : Rat) / 45033486517) [(6, 2), (15, 2)],
  term ((-1372407601149 : Rat) / 45033486517) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 0. -/
theorem ep_Q2_054_partial_00_0037_valid :
    mulPoly ep_Q2_054_coefficient_00_0037
        ep_Q2_054_generator_00_0000_0037 =
      ep_Q2_054_partial_00_0037 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_00_0000_0037 : List Poly :=
[
  ep_Q2_054_partial_00_0000,
  ep_Q2_054_partial_00_0001,
  ep_Q2_054_partial_00_0002,
  ep_Q2_054_partial_00_0003,
  ep_Q2_054_partial_00_0004,
  ep_Q2_054_partial_00_0005,
  ep_Q2_054_partial_00_0006,
  ep_Q2_054_partial_00_0007,
  ep_Q2_054_partial_00_0008,
  ep_Q2_054_partial_00_0009,
  ep_Q2_054_partial_00_0010,
  ep_Q2_054_partial_00_0011,
  ep_Q2_054_partial_00_0012,
  ep_Q2_054_partial_00_0013,
  ep_Q2_054_partial_00_0014,
  ep_Q2_054_partial_00_0015,
  ep_Q2_054_partial_00_0016,
  ep_Q2_054_partial_00_0017,
  ep_Q2_054_partial_00_0018,
  ep_Q2_054_partial_00_0019,
  ep_Q2_054_partial_00_0020,
  ep_Q2_054_partial_00_0021,
  ep_Q2_054_partial_00_0022,
  ep_Q2_054_partial_00_0023,
  ep_Q2_054_partial_00_0024,
  ep_Q2_054_partial_00_0025,
  ep_Q2_054_partial_00_0026,
  ep_Q2_054_partial_00_0027,
  ep_Q2_054_partial_00_0028,
  ep_Q2_054_partial_00_0029,
  ep_Q2_054_partial_00_0030,
  ep_Q2_054_partial_00_0031,
  ep_Q2_054_partial_00_0032,
  ep_Q2_054_partial_00_0033,
  ep_Q2_054_partial_00_0034,
  ep_Q2_054_partial_00_0035,
  ep_Q2_054_partial_00_0036,
  ep_Q2_054_partial_00_0037
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_00_0000_0037 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (7, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (7, 1)],
  term ((1270014208992 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (7, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 3)],
  term ((-1541051357337 : Rat) / 90066973034) [(0, 1), (2, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((19779865718364 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((4061360395764 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((4443423579540 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term ((1263141373536 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((494040226464 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((-366079500000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1)],
  term ((843643206936 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1)],
  term ((3433850549604 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-16777757173320 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((1894834735056 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 2)],
  term ((18196749727632 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((682562854170 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1)],
  term ((-13497969867552 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-2744815202298 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (2, 2)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 2)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (7, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (3, 2)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 2)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((1541051357337 : Rat) / 90066973034) [(0, 1), (6, 1)],
  term ((-4443423579540 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1263141373536 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-494040226464 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((366079500000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (8, 1)],
  term ((-843643206936 : Rat) / 45033486517) [(0, 1), (6, 1), (8, 1)],
  term ((-3433850549604 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((16777757173320 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1894834735056 : Rat) / 45033486517) [(0, 1), (6, 1), (9, 2)],
  term ((-18196749727632 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-682562854170 : Rat) / 45033486517) [(0, 1), (6, 1), (12, 1)],
  term ((13497969867552 : Rat) / 45033486517) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((2744815202298 : Rat) / 45033486517) [(0, 1), (6, 1), (15, 2)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (6, 2)],
  term ((-19779865718364 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((-4061360395764 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (7, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 1), (7, 3), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (7, 4)],
  term ((635007104496 : Rat) / 45033486517) [(0, 2), (2, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 2), (2, 1), (7, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 2), (6, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 2), (6, 1), (7, 2)],
  term ((604543180320 : Rat) / 45033486517) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (2, 2), (7, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (2, 2), (9, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1)],
  term ((-1541051357337 : Rat) / 90066973034) [(1, 1), (3, 1)],
  term ((19779865718364 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-15578308593072 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 2)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((4061360395764 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((4443423579540 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((1263141373536 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((494040226464 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2)],
  term ((-366079500000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((843643206936 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1)],
  term ((3433850549604 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-16777757173320 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((1894834735056 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 2)],
  term ((18196749727632 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((682562854170 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1)],
  term ((-13497969867552 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-2744815202298 : Rat) / 45033486517) [(1, 1), (3, 1), (15, 2)],
  term ((-19468698143364 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-8655919770384 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-713855025000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1)],
  term ((12846542581800 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-4061360395764 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-19779865718364 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (9, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (13, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 3)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (6, 2), (9, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (6, 2), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (6, 3), (7, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (6, 3), (15, 1)],
  term ((1541051357337 : Rat) / 90066973034) [(1, 1), (7, 1)],
  term ((-843643206936 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1)],
  term ((-3433850549604 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((16777757173320 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1894834735056 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 2)],
  term ((-18196749727632 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-682562854170 : Rat) / 45033486517) [(1, 1), (7, 1), (12, 1)],
  term ((13497969867552 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((2744815202298 : Rat) / 45033486517) [(1, 1), (7, 1), (15, 2)],
  term ((-4443423579540 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (15, 1)],
  term ((-1898148478032 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1)],
  term ((-494040226464 : Rat) / 45033486517) [(1, 1), (7, 2), (13, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (7, 2), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (7, 3)],
  term ((366079500000 : Rat) / 45033486517) [(1, 1), (7, 3), (8, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 2), (3, 1), (7, 1)],
  term ((-1270014208992 : Rat) / 45033486517) [(1, 2), (3, 1), (9, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 2), (6, 1), (7, 2)],
  term ((1270014208992 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 2), (7, 2)],
  term ((1541051357337 : Rat) / 180133946068) [(2, 2)],
  term ((9706893109182 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((384383475000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(2, 2), (3, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-9889932859182 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((-2030680197882 : Rat) / 45033486517) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2221711789770 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-631570686768 : Rat) / 45033486517) [(2, 2), (7, 1), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1)],
  term ((-247020113232 : Rat) / 45033486517) [(2, 2), (7, 1), (13, 1)],
  term ((183039750000 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1)],
  term ((-421821603468 : Rat) / 45033486517) [(2, 2), (8, 1)],
  term ((-1716925274802 : Rat) / 45033486517) [(2, 2), (9, 1), (13, 1)],
  term ((8388878586660 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-947417367528 : Rat) / 45033486517) [(2, 2), (9, 2)],
  term ((-9098374863816 : Rat) / 45033486517) [(2, 2), (11, 1), (15, 1)],
  term ((-341281427085 : Rat) / 45033486517) [(2, 2), (12, 1)],
  term ((6748984933776 : Rat) / 45033486517) [(2, 2), (13, 1), (15, 1)],
  term ((1372407601149 : Rat) / 45033486517) [(2, 2), (15, 2)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 3)],
  term ((-384383475000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(3, 1), (6, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(3, 1), (6, 3), (7, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (6, 3), (13, 1)],
  term ((-4252391987652 : Rat) / 45033486517) [(3, 1), (6, 3), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(3, 1), (7, 3)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 3), (16, 1)],
  term ((1541051357337 : Rat) / 180133946068) [(3, 2)],
  term ((-9889932859182 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (9, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 2), (6, 1), (7, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-2030680197882 : Rat) / 45033486517) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2221711789770 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((-631570686768 : Rat) / 45033486517) [(3, 2), (7, 1), (9, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1)],
  term ((-247020113232 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1)],
  term ((183039750000 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1)],
  term ((-421821603468 : Rat) / 45033486517) [(3, 2), (8, 1)],
  term ((-1716925274802 : Rat) / 45033486517) [(3, 2), (9, 1), (13, 1)],
  term ((8388878586660 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-947417367528 : Rat) / 45033486517) [(3, 2), (9, 2)],
  term ((-9098374863816 : Rat) / 45033486517) [(3, 2), (11, 1), (15, 1)],
  term ((-341281427085 : Rat) / 45033486517) [(3, 2), (12, 1)],
  term ((6748984933776 : Rat) / 45033486517) [(3, 2), (13, 1), (15, 1)],
  term ((1372407601149 : Rat) / 45033486517) [(3, 2), (15, 2)],
  term ((9706893109182 : Rat) / 45033486517) [(3, 3), (6, 1), (7, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 3), (6, 1), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(3, 3), (6, 1), (15, 1)],
  term ((384383475000 : Rat) / 45033486517) [(3, 3), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 3), (7, 1), (16, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(3, 3), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(3, 3), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((2030680197882 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((9889932859182 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(6, 1), (7, 3), (13, 1)],
  term ((-1541051357337 : Rat) / 180133946068) [(6, 2)],
  term ((2221711789770 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((631570686768 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1)],
  term ((247020113232 : Rat) / 45033486517) [(6, 2), (7, 1), (13, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1)],
  term ((421821603468 : Rat) / 45033486517) [(6, 2), (8, 1)],
  term ((1716925274802 : Rat) / 45033486517) [(6, 2), (9, 1), (13, 1)],
  term ((-8388878586660 : Rat) / 45033486517) [(6, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((947417367528 : Rat) / 45033486517) [(6, 2), (9, 2)],
  term ((9098374863816 : Rat) / 45033486517) [(6, 2), (11, 1), (15, 1)],
  term ((341281427085 : Rat) / 45033486517) [(6, 2), (12, 1)],
  term ((-6748984933776 : Rat) / 45033486517) [(6, 2), (13, 1), (15, 1)],
  term ((-1372407601149 : Rat) / 45033486517) [(6, 2), (15, 2)],
  term ((9889932859182 : Rat) / 45033486517) [(6, 3), (7, 1), (9, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(6, 3), (7, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(6, 3), (9, 1), (13, 1)],
  term ((2030680197882 : Rat) / 45033486517) [(6, 3), (9, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(6, 3), (13, 1), (15, 1)],
  term ((-1541051357337 : Rat) / 180133946068) [(7, 2)],
  term ((421821603468 : Rat) / 45033486517) [(7, 2), (8, 1)],
  term ((1716925274802 : Rat) / 45033486517) [(7, 2), (9, 1), (13, 1)],
  term ((-8388878586660 : Rat) / 45033486517) [(7, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((947417367528 : Rat) / 45033486517) [(7, 2), (9, 2)],
  term ((9098374863816 : Rat) / 45033486517) [(7, 2), (11, 1), (15, 1)],
  term ((341281427085 : Rat) / 45033486517) [(7, 2), (12, 1)],
  term ((-6748984933776 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)],
  term ((-1372407601149 : Rat) / 45033486517) [(7, 2), (15, 2)],
  term ((2221711789770 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1)],
  term ((631570686768 : Rat) / 45033486517) [(7, 3), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 3), (9, 1), (16, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(7, 3), (11, 1)],
  term ((247020113232 : Rat) / 45033486517) [(7, 3), (13, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(7, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 0 through 37. -/
theorem ep_Q2_054_block_00_0000_0037_valid :
    checkProductSumEq ep_Q2_054_partials_00_0000_0037
      ep_Q2_054_block_00_0000_0037 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
