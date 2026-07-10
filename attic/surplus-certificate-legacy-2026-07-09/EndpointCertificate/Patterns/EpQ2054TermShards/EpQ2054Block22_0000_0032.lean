/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 22:0-32

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_22_0000_0032 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (10, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (11, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0000 : Poly :=
[
  term ((2924437677189 : Rat) / 180133946068) []
]

/-- Partial product 0 for generator 22. -/
def ep_Q2_054_partial_22_0000 : Poly :=
[
  term ((-2924437677189 : Rat) / 90066973034) [(0, 1), (10, 1)],
  term ((2924437677189 : Rat) / 180133946068) [(0, 2)],
  term ((-2924437677189 : Rat) / 90066973034) [(1, 1), (11, 1)],
  term ((2924437677189 : Rat) / 180133946068) [(1, 2)],
  term ((2924437677189 : Rat) / 90066973034) [(2, 1), (10, 1)],
  term ((-2924437677189 : Rat) / 180133946068) [(2, 2)],
  term ((2924437677189 : Rat) / 90066973034) [(3, 1), (11, 1)],
  term ((-2924437677189 : Rat) / 180133946068) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem ep_Q2_054_partial_22_0000_valid :
    mulPoly ep_Q2_054_coefficient_22_0000
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0001 : Poly :=
[
  term ((-4688710779591 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 1 for generator 22. -/
def ep_Q2_054_partial_22_0001 : Poly :=
[
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4688710779591 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((4688710779591 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-9377421559182 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((4688710779591 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((9377421559182 : Rat) / 45033486517) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-4688710779591 : Rat) / 45033486517) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem ep_Q2_054_partial_22_0001_valid :
    mulPoly ep_Q2_054_coefficient_22_0001
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0002 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 2 for generator 22. -/
def ep_Q2_054_partial_22_0002 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem ep_Q2_054_partial_22_0002_valid :
    mulPoly ep_Q2_054_coefficient_22_0002
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0003 : Poly :=
[
  term ((-4846640305266 : Rat) / 45033486517) [(0, 1), (15, 2)]
]

/-- Partial product 3 for generator 22. -/
def ep_Q2_054_partial_22_0003 : Poly :=
[
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-4846640305266 : Rat) / 45033486517) [(0, 1), (1, 2), (15, 2)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (2, 2), (15, 2)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (3, 2), (15, 2)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 2), (10, 1), (15, 2)],
  term ((-4846640305266 : Rat) / 45033486517) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem ep_Q2_054_partial_22_0003_valid :
    mulPoly ep_Q2_054_coefficient_22_0003
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0004 : Poly :=
[
  term ((5128006179591 : Rat) / 90066973034) [(1, 1), (7, 1)]
]

/-- Partial product 4 for generator 22. -/
def ep_Q2_054_partial_22_0004 : Poly :=
[
  term ((-5128006179591 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((5128006179591 : Rat) / 90066973034) [(0, 2), (1, 1), (7, 1)],
  term ((5128006179591 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (2, 2), (7, 1)],
  term ((5128006179591 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (3, 2), (7, 1)],
  term ((-5128006179591 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1)],
  term ((5128006179591 : Rat) / 90066973034) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem ep_Q2_054_partial_22_0004_valid :
    mulPoly ep_Q2_054_coefficient_22_0004
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0005 : Poly :=
[
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (13, 1)]
]

/-- Partial product 5 for generator 22. -/
def ep_Q2_054_partial_22_0005 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((1919832611634 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((1919832611634 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem ep_Q2_054_partial_22_0005_valid :
    mulPoly ep_Q2_054_coefficient_22_0005
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0006 : Poly :=
[
  term ((-1203938929287 : Rat) / 45033486517) [(1, 1), (15, 1)]
]

/-- Partial product 6 for generator 22. -/
def ep_Q2_054_partial_22_0006 : Poly :=
[
  term ((2407877858574 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-1203938929287 : Rat) / 45033486517) [(0, 2), (1, 1), (15, 1)],
  term ((-2407877858574 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1)],
  term ((-2407877858574 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1)],
  term ((2407877858574 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1)],
  term ((-1203938929287 : Rat) / 45033486517) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem ep_Q2_054_partial_22_0006_valid :
    mulPoly ep_Q2_054_coefficient_22_0006
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0007 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 7 for generator 22. -/
def ep_Q2_054_partial_22_0007 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)],
  term ((109823850000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem ep_Q2_054_partial_22_0007_valid :
    mulPoly ep_Q2_054_coefficient_22_0007
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0008 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 8 for generator 22. -/
def ep_Q2_054_partial_22_0008 : Poly :=
[
  term ((146431800000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem ep_Q2_054_partial_22_0008_valid :
    mulPoly ep_Q2_054_coefficient_22_0008
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0009 : Poly :=
[
  term ((-3355300289079 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 9 for generator 22. -/
def ep_Q2_054_partial_22_0009 : Poly :=
[
  term ((6710600578158 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-3355300289079 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((6710600578158 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3355300289079 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-6710600578158 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((3355300289079 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-6710600578158 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((3355300289079 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 22. -/
theorem ep_Q2_054_partial_22_0009_valid :
    mulPoly ep_Q2_054_coefficient_22_0009
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0010 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 22. -/
def ep_Q2_054_partial_22_0010 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 22. -/
theorem ep_Q2_054_partial_22_0010_valid :
    mulPoly ep_Q2_054_coefficient_22_0010
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0011 : Poly :=
[
  term ((-7869423867237 : Rat) / 90066973034) [(7, 1), (9, 1)]
]

/-- Partial product 11 for generator 22. -/
def ep_Q2_054_partial_22_0011 : Poly :=
[
  term ((7869423867237 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-7869423867237 : Rat) / 90066973034) [(0, 2), (7, 1), (9, 1)],
  term ((7869423867237 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-7869423867237 : Rat) / 90066973034) [(1, 2), (7, 1), (9, 1)],
  term ((-7869423867237 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1)],
  term ((7869423867237 : Rat) / 90066973034) [(2, 2), (7, 1), (9, 1)],
  term ((-7869423867237 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((7869423867237 : Rat) / 90066973034) [(3, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 22. -/
theorem ep_Q2_054_partial_22_0011_valid :
    mulPoly ep_Q2_054_coefficient_22_0011
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0012 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 22. -/
def ep_Q2_054_partial_22_0012 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 22. -/
theorem ep_Q2_054_partial_22_0012_valid :
    mulPoly ep_Q2_054_coefficient_22_0012
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0013 : Poly :=
[
  term ((-4488761414646 : Rat) / 45033486517) [(7, 1), (11, 1)]
]

/-- Partial product 13 for generator 22. -/
def ep_Q2_054_partial_22_0013 : Poly :=
[
  term ((8977522829292 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)],
  term ((-4488761414646 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)],
  term ((4488761414646 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 22. -/
theorem ep_Q2_054_partial_22_0013_valid :
    mulPoly ep_Q2_054_coefficient_22_0013
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0014 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 22. -/
def ep_Q2_054_partial_22_0014 : Poly :=
[
  term ((-6101325000 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 22. -/
theorem ep_Q2_054_partial_22_0014_valid :
    mulPoly ep_Q2_054_coefficient_22_0014
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0015 : Poly :=
[
  term ((-1279888407756 : Rat) / 45033486517) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 15 for generator 22. -/
def ep_Q2_054_partial_22_0015 : Poly :=
[
  term ((2559776815512 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 22. -/
theorem ep_Q2_054_partial_22_0015_valid :
    mulPoly ep_Q2_054_coefficient_22_0015
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0016 : Poly :=
[
  term ((-3163113069390 : Rat) / 45033486517) [(7, 1), (13, 1)]
]

/-- Partial product 16 for generator 22. -/
def ep_Q2_054_partial_22_0016 : Poly :=
[
  term ((6326226138780 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-3163113069390 : Rat) / 45033486517) [(0, 2), (7, 1), (13, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-3163113069390 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1)],
  term ((3163113069390 : Rat) / 45033486517) [(2, 2), (7, 1), (13, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((3163113069390 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 22. -/
theorem ep_Q2_054_partial_22_0016_valid :
    mulPoly ep_Q2_054_coefficient_22_0016
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0017 : Poly :=
[
  term ((6198093795969 : Rat) / 45033486517) [(7, 1), (15, 1)]
]

/-- Partial product 17 for generator 22. -/
def ep_Q2_054_partial_22_0017 : Poly :=
[
  term ((-12396187591938 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((6198093795969 : Rat) / 45033486517) [(0, 2), (7, 1), (15, 1)],
  term ((-12396187591938 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((6198093795969 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1)],
  term ((12396187591938 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-6198093795969 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1)],
  term ((12396187591938 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-6198093795969 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 22. -/
theorem ep_Q2_054_partial_22_0017_valid :
    mulPoly ep_Q2_054_coefficient_22_0017
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0018 : Poly :=
[
  term ((-39658612500 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 22. -/
def ep_Q2_054_partial_22_0018 : Poly :=
[
  term ((79317225000 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-39658612500 : Rat) / 45033486517) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((79317225000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39658612500 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-79317225000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((39658612500 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-79317225000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((39658612500 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 22. -/
theorem ep_Q2_054_partial_22_0018_valid :
    mulPoly ep_Q2_054_coefficient_22_0018
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0019 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 19 for generator 22. -/
def ep_Q2_054_partial_22_0019 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 22. -/
theorem ep_Q2_054_partial_22_0019_valid :
    mulPoly ep_Q2_054_coefficient_22_0019
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0020 : Poly :=
[
  term ((5048751583908 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 20 for generator 22. -/
def ep_Q2_054_partial_22_0020 : Poly :=
[
  term ((-10097503167816 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((5048751583908 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-10097503167816 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((5048751583908 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((10097503167816 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5048751583908 : Rat) / 45033486517) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((10097503167816 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5048751583908 : Rat) / 45033486517) [(3, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 22. -/
theorem ep_Q2_054_partial_22_0020_valid :
    mulPoly ep_Q2_054_coefficient_22_0020
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0021 : Poly :=
[
  term ((15718122688320 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 21 for generator 22. -/
def ep_Q2_054_partial_22_0021 : Poly :=
[
  term ((-31436245376640 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((15718122688320 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((-31436245376640 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((15718122688320 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((31436245376640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-15718122688320 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2)],
  term ((31436245376640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-15718122688320 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 22. -/
theorem ep_Q2_054_partial_22_0021_valid :
    mulPoly ep_Q2_054_coefficient_22_0021
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0022 : Poly :=
[
  term ((1437433626015 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 22. -/
def ep_Q2_054_partial_22_0022 : Poly :=
[
  term ((-2874867252030 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2874867252030 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((2874867252030 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((2874867252030 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 22. -/
theorem ep_Q2_054_partial_22_0022_valid :
    mulPoly ep_Q2_054_coefficient_22_0022
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0023 : Poly :=
[
  term ((5759497834902 : Rat) / 45033486517) [(9, 1), (13, 1)]
]

/-- Partial product 23 for generator 22. -/
def ep_Q2_054_partial_22_0023 : Poly :=
[
  term ((-11518995669804 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((5759497834902 : Rat) / 45033486517) [(0, 2), (9, 1), (13, 1)],
  term ((-11518995669804 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((5759497834902 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 1)],
  term ((11518995669804 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-5759497834902 : Rat) / 45033486517) [(2, 2), (9, 1), (13, 1)],
  term ((11518995669804 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5759497834902 : Rat) / 45033486517) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 22. -/
theorem ep_Q2_054_partial_22_0023_valid :
    mulPoly ep_Q2_054_coefficient_22_0023
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0024 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 24 for generator 22. -/
def ep_Q2_054_partial_22_0024 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 22. -/
theorem ep_Q2_054_partial_22_0024_valid :
    mulPoly ep_Q2_054_coefficient_22_0024
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0025 : Poly :=
[
  term ((479144542005 : Rat) / 90066973034) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 22. -/
def ep_Q2_054_partial_22_0025 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 90066973034) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 90066973034) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 90066973034) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 90066973034) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 22. -/
theorem ep_Q2_054_partial_22_0025_valid :
    mulPoly ep_Q2_054_coefficient_22_0025
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0026 : Poly :=
[
  term ((999247302231 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 26 for generator 22. -/
def ep_Q2_054_partial_22_0026 : Poly :=
[
  term ((-999247302231 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((999247302231 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1)],
  term ((-999247302231 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((999247302231 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((999247302231 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-999247302231 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1)],
  term ((999247302231 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)],
  term ((-999247302231 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 22. -/
theorem ep_Q2_054_partial_22_0026_valid :
    mulPoly ep_Q2_054_coefficient_22_0026
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0027 : Poly :=
[
  term ((159714847335 : Rat) / 90066973034) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 22. -/
def ep_Q2_054_partial_22_0027 : Poly :=
[
  term ((-159714847335 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 22. -/
theorem ep_Q2_054_partial_22_0027_valid :
    mulPoly ep_Q2_054_coefficient_22_0027
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0028 : Poly :=
[
  term ((-938437253395 : Rat) / 45033486517) [(12, 1)]
]

/-- Partial product 28 for generator 22. -/
def ep_Q2_054_partial_22_0028 : Poly :=
[
  term ((1876874506790 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(0, 2), (12, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(1, 2), (12, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1)],
  term ((938437253395 : Rat) / 45033486517) [(2, 2), (12, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1)],
  term ((938437253395 : Rat) / 45033486517) [(3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 22. -/
theorem ep_Q2_054_partial_22_0028_valid :
    mulPoly ep_Q2_054_coefficient_22_0028
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0029 : Poly :=
[
  term ((-156283226433 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 29 for generator 22. -/
def ep_Q2_054_partial_22_0029 : Poly :=
[
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((-312566452866 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1), (15, 2)],
  term ((156283226433 : Rat) / 45033486517) [(2, 2), (12, 1), (15, 2)],
  term ((-312566452866 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((156283226433 : Rat) / 45033486517) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 22. -/
theorem ep_Q2_054_partial_22_0029_valid :
    mulPoly ep_Q2_054_coefficient_22_0029
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0030 : Poly :=
[
  term ((-796530294737 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 30 for generator 22. -/
def ep_Q2_054_partial_22_0030 : Poly :=
[
  term ((796530294737 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-796530294737 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((796530294737 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-796530294737 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((796530294737 : Rat) / 90066973034) [(2, 2), (13, 1), (15, 1)],
  term ((-796530294737 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((796530294737 : Rat) / 90066973034) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 22. -/
theorem ep_Q2_054_partial_22_0030_valid :
    mulPoly ep_Q2_054_coefficient_22_0030
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0031 : Poly :=
[
  term ((-22107440562875 : Rat) / 90066973034) [(15, 2)]
]

/-- Partial product 31 for generator 22. -/
def ep_Q2_054_partial_22_0031 : Poly :=
[
  term ((22107440562875 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2)],
  term ((-22107440562875 : Rat) / 90066973034) [(0, 2), (15, 2)],
  term ((22107440562875 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((-22107440562875 : Rat) / 90066973034) [(1, 2), (15, 2)],
  term ((-22107440562875 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2)],
  term ((22107440562875 : Rat) / 90066973034) [(2, 2), (15, 2)],
  term ((-22107440562875 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2)],
  term ((22107440562875 : Rat) / 90066973034) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 22. -/
theorem ep_Q2_054_partial_22_0031_valid :
    mulPoly ep_Q2_054_coefficient_22_0031
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 22. -/
def ep_Q2_054_coefficient_22_0032 : Poly :=
[
  term ((-2076293015355 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 32 for generator 22. -/
def ep_Q2_054_partial_22_0032 : Poly :=
[
  term ((2076293015355 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2076293015355 : Rat) / 90066973034) [(0, 2), (15, 2), (16, 1)],
  term ((2076293015355 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2076293015355 : Rat) / 90066973034) [(1, 2), (15, 2), (16, 1)],
  term ((-2076293015355 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((2076293015355 : Rat) / 90066973034) [(2, 2), (15, 2), (16, 1)],
  term ((-2076293015355 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((2076293015355 : Rat) / 90066973034) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 22. -/
theorem ep_Q2_054_partial_22_0032_valid :
    mulPoly ep_Q2_054_coefficient_22_0032
        ep_Q2_054_generator_22_0000_0032 =
      ep_Q2_054_partial_22_0032 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_22_0000_0032 : List Poly :=
[
  ep_Q2_054_partial_22_0000,
  ep_Q2_054_partial_22_0001,
  ep_Q2_054_partial_22_0002,
  ep_Q2_054_partial_22_0003,
  ep_Q2_054_partial_22_0004,
  ep_Q2_054_partial_22_0005,
  ep_Q2_054_partial_22_0006,
  ep_Q2_054_partial_22_0007,
  ep_Q2_054_partial_22_0008,
  ep_Q2_054_partial_22_0009,
  ep_Q2_054_partial_22_0010,
  ep_Q2_054_partial_22_0011,
  ep_Q2_054_partial_22_0012,
  ep_Q2_054_partial_22_0013,
  ep_Q2_054_partial_22_0014,
  ep_Q2_054_partial_22_0015,
  ep_Q2_054_partial_22_0016,
  ep_Q2_054_partial_22_0017,
  ep_Q2_054_partial_22_0018,
  ep_Q2_054_partial_22_0019,
  ep_Q2_054_partial_22_0020,
  ep_Q2_054_partial_22_0021,
  ep_Q2_054_partial_22_0022,
  ep_Q2_054_partial_22_0023,
  ep_Q2_054_partial_22_0024,
  ep_Q2_054_partial_22_0025,
  ep_Q2_054_partial_22_0026,
  ep_Q2_054_partial_22_0027,
  ep_Q2_054_partial_22_0028,
  ep_Q2_054_partial_22_0029,
  ep_Q2_054_partial_22_0030,
  ep_Q2_054_partial_22_0031,
  ep_Q2_054_partial_22_0032
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_22_0000_0032 : Poly :=
[
  term ((-5128006179591 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((2407877858574 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-4688710779591 : Rat) / 45033486517) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-4846640305266 : Rat) / 45033486517) [(0, 1), (1, 2), (15, 2)],
  term ((-9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((4688710779591 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (2, 2), (15, 2)],
  term ((-9377421559182 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((4688710779591 : Rat) / 45033486517) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (3, 2), (15, 2)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((146431800000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((6710600578158 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((7869423867237 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-12396187591938 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((79317225000 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-10097503167816 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-31436245376640 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-2874867252030 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-11518995669804 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2924437677189 : Rat) / 90066973034) [(0, 1), (10, 1)],
  term ((-999247302231 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1)],
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((796530294737 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((22107440562875 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2)],
  term ((2076293015355 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((2924437677189 : Rat) / 180133946068) [(0, 2)],
  term ((5128006179591 : Rat) / 90066973034) [(0, 2), (1, 1), (7, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(0, 2), (1, 1), (13, 1)],
  term ((-1203938929287 : Rat) / 45033486517) [(0, 2), (1, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((-3355300289079 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7869423867237 : Rat) / 90066973034) [(0, 2), (7, 1), (9, 1)],
  term ((9151987500 : Rat) / 45033486517) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((9377421559182 : Rat) / 45033486517) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1)],
  term ((3050662500 : Rat) / 45033486517) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-3163113069390 : Rat) / 45033486517) [(0, 2), (7, 1), (13, 1)],
  term ((6198093795969 : Rat) / 45033486517) [(0, 2), (7, 1), (15, 1)],
  term ((-39658612500 : Rat) / 45033486517) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((5048751583908 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((15718122688320 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((1437433626015 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((5759497834902 : Rat) / 45033486517) [(0, 2), (9, 1), (13, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 90066973034) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 2), (10, 1), (15, 2)],
  term ((999247302231 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1)],
  term ((159714847335 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(0, 2), (12, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((-796530294737 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((-22107440562875 : Rat) / 90066973034) [(0, 2), (15, 2)],
  term ((-2076293015355 : Rat) / 90066973034) [(0, 2), (15, 2), (16, 1)],
  term ((-4688710779591 : Rat) / 45033486517) [(0, 3), (7, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 3), (13, 1), (15, 1)],
  term ((-4846640305266 : Rat) / 45033486517) [(0, 3), (15, 2)],
  term ((5128006179591 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-2407877858574 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (2, 2), (7, 1)],
  term ((1919832611634 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1)],
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1)],
  term ((5128006179591 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-2407877858574 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (3, 2), (7, 1)],
  term ((1919832611634 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1)],
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((6710600578158 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((7869423867237 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-12396187591938 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((79317225000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2)],
  term ((-6101325000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-10097503167816 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-31436245376640 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2874867252030 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-11518995669804 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-10881777245760 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2924437677189 : Rat) / 90066973034) [(1, 1), (11, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((796530294737 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((22107440562875 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((2076293015355 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-999247302231 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((2924437677189 : Rat) / 180133946068) [(1, 2)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-3355300289079 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7869423867237 : Rat) / 90066973034) [(1, 2), (7, 1), (9, 1)],
  term ((9151987500 : Rat) / 45033486517) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9616767594237 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1)],
  term ((3050662500 : Rat) / 45033486517) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-3163113069390 : Rat) / 45033486517) [(1, 2), (7, 1), (13, 1)],
  term ((6198093795969 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1)],
  term ((-39658612500 : Rat) / 45033486517) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((5048751583908 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((15718122688320 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((1437433626015 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((5759497834902 : Rat) / 45033486517) [(1, 2), (9, 1), (13, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 90066973034) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1)],
  term ((5815003019379 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((159714847335 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(1, 2), (12, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((-796530294737 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((-22107440562875 : Rat) / 90066973034) [(1, 2), (15, 2)],
  term ((-2076293015355 : Rat) / 90066973034) [(1, 2), (15, 2), (16, 1)],
  term ((5128006179591 : Rat) / 90066973034) [(1, 3), (7, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 3), (13, 1)],
  term ((-1203938929287 : Rat) / 45033486517) [(1, 3), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-6710600578158 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7869423867237 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((6101325000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1)],
  term ((12396187591938 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-79317225000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((10097503167816 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((31436245376640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((2874867252030 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((11518995669804 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2924437677189 : Rat) / 90066973034) [(2, 1), (10, 1)],
  term ((999247302231 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1), (15, 2)],
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-22107440562875 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2)],
  term ((-2076293015355 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2924437677189 : Rat) / 180133946068) [(2, 2)],
  term ((109823850000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((3355300289079 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((7869423867237 : Rat) / 90066973034) [(2, 2), (7, 1), (9, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((3163113069390 : Rat) / 45033486517) [(2, 2), (7, 1), (13, 1)],
  term ((-6198093795969 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1)],
  term ((39658612500 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-5048751583908 : Rat) / 45033486517) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-15718122688320 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2)],
  term ((-1437433626015 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5759497834902 : Rat) / 45033486517) [(2, 2), (9, 1), (13, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 90066973034) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-999247302231 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((938437253395 : Rat) / 45033486517) [(2, 2), (12, 1)],
  term ((156283226433 : Rat) / 45033486517) [(2, 2), (12, 1), (15, 2)],
  term ((796530294737 : Rat) / 90066973034) [(2, 2), (13, 1), (15, 1)],
  term ((22107440562875 : Rat) / 90066973034) [(2, 2), (15, 2)],
  term ((2076293015355 : Rat) / 90066973034) [(2, 2), (15, 2), (16, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-6710600578158 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)],
  term ((-7869423867237 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((12396187591938 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-79317225000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((10097503167816 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((31436245376640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((2874867252030 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((11518995669804 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((10881777245760 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2924437677189 : Rat) / 90066973034) [(3, 1), (11, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-796530294737 : Rat) / 45033486517) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-22107440562875 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2)],
  term ((-2076293015355 : Rat) / 45033486517) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((999247302231 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2924437677189 : Rat) / 180133946068) [(3, 2)],
  term ((109823850000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((3355300289079 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((7869423867237 : Rat) / 90066973034) [(3, 2), (7, 1), (9, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((3163113069390 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1)],
  term ((-6198093795969 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1)],
  term ((39658612500 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-5048751583908 : Rat) / 45033486517) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-15718122688320 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2)],
  term ((-1437433626015 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5759497834902 : Rat) / 45033486517) [(3, 2), (9, 1), (13, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 90066973034) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-999247302231 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((938437253395 : Rat) / 45033486517) [(3, 2), (12, 1)],
  term ((156283226433 : Rat) / 45033486517) [(3, 2), (12, 1), (15, 2)],
  term ((796530294737 : Rat) / 90066973034) [(3, 2), (13, 1), (15, 1)],
  term ((22107440562875 : Rat) / 90066973034) [(3, 2), (15, 2)],
  term ((2076293015355 : Rat) / 90066973034) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 32. -/
theorem ep_Q2_054_block_22_0000_0032_valid :
    checkProductSumEq ep_Q2_054_partials_22_0000_0032
      ep_Q2_054_block_22_0000_0032 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
