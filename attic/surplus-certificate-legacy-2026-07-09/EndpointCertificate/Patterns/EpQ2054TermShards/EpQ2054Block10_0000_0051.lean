/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 10:0-51

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 10 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_10_0000_0051 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0000 : Poly :=
[
  term ((2210054684631 : Rat) / 45033486517) []
]

/-- Partial product 0 for generator 10. -/
def ep_Q2_054_partial_10_0000 : Poly :=
[
  term ((4420109369262 : Rat) / 45033486517) [(2, 1), (6, 1)],
  term ((4420109369262 : Rat) / 45033486517) [(3, 1), (7, 1)],
  term ((-2210054684631 : Rat) / 45033486517) [(6, 2)],
  term ((-2210054684631 : Rat) / 45033486517) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem ep_Q2_054_partial_10_0000_valid :
    mulPoly ep_Q2_054_coefficient_10_0000
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0001 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1)]
]

/-- Partial product 1 for generator 10. -/
def ep_Q2_054_partial_10_0001 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (6, 2)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem ep_Q2_054_partial_10_0001_valid :
    mulPoly ep_Q2_054_coefficient_10_0001
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0002 : Poly :=
[
  term ((-9706893109182 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 2 for generator 10. -/
def ep_Q2_054_partial_10_0002 : Poly :=
[
  term ((-19413786218364 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (9, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem ep_Q2_054_partial_10_0002_valid :
    mulPoly ep_Q2_054_coefficient_10_0002
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0003 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 3 for generator 10. -/
def ep_Q2_054_partial_10_0003 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem ep_Q2_054_partial_10_0003_valid :
    mulPoly ep_Q2_054_coefficient_10_0003
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0004 : Poly :=
[
  term ((-436318791939 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 4 for generator 10. -/
def ep_Q2_054_partial_10_0004 : Poly :=
[
  term ((-872637583878 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-872637583878 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((436318791939 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((436318791939 : Rat) / 45033486517) [(0, 1), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem ep_Q2_054_partial_10_0004_valid :
    mulPoly ep_Q2_054_coefficient_10_0004
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0005 : Poly :=
[
  term ((9706893109182 : Rat) / 45033486517) [(0, 1), (7, 2)]
]

/-- Partial product 5 for generator 10. -/
def ep_Q2_054_partial_10_0005 : Poly :=
[
  term ((19413786218364 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 2)],
  term ((19413786218364 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3)],
  term ((-9706893109182 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2)],
  term ((-9706893109182 : Rat) / 45033486517) [(0, 1), (7, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem ep_Q2_054_partial_10_0005_valid :
    mulPoly ep_Q2_054_coefficient_10_0005
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0006 : Poly :=
[
  term ((156283226433 : Rat) / 45033486517) [(0, 1), (8, 1)]
]

/-- Partial product 6 for generator 10. -/
def ep_Q2_054_partial_10_0006 : Poly :=
[
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1)],
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem ep_Q2_054_partial_10_0006_valid :
    mulPoly ep_Q2_054_coefficient_10_0006
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0007 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 7 for generator 10. -/
def ep_Q2_054_partial_10_0007 : Poly :=
[
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem ep_Q2_054_partial_10_0007_valid :
    mulPoly ep_Q2_054_coefficient_10_0007
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0008 : Poly :=
[
  term ((-4252391987652 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 8 for generator 10. -/
def ep_Q2_054_partial_10_0008 : Poly :=
[
  term ((-8504783975304 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem ep_Q2_054_partial_10_0008_valid :
    mulPoly ep_Q2_054_coefficient_10_0008
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0009 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 9 for generator 10. -/
def ep_Q2_054_partial_10_0009 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem ep_Q2_054_partial_10_0009_valid :
    mulPoly ep_Q2_054_coefficient_10_0009
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0010 : Poly :=
[
  term ((-4846640305266 : Rat) / 45033486517) [(0, 1), (15, 2)]
]

/-- Partial product 10 for generator 10. -/
def ep_Q2_054_partial_10_0010 : Poly :=
[
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (6, 2), (15, 2)],
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem ep_Q2_054_partial_10_0010_valid :
    mulPoly ep_Q2_054_coefficient_10_0010
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0011 : Poly :=
[
  term ((5128006179591 : Rat) / 90066973034) [(1, 1), (7, 1)]
]

/-- Partial product 11 for generator 10. -/
def ep_Q2_054_partial_10_0011 : Poly :=
[
  term ((5128006179591 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((5128006179591 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2)],
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (6, 2), (7, 1)],
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 10. -/
theorem ep_Q2_054_partial_10_0011_valid :
    mulPoly ep_Q2_054_coefficient_10_0011
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0012 : Poly :=
[
  term ((1919832611634 : Rat) / 45033486517) [(1, 1), (13, 1)]
]

/-- Partial product 12 for generator 10. -/
def ep_Q2_054_partial_10_0012 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (6, 2), (13, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 10. -/
theorem ep_Q2_054_partial_10_0012_valid :
    mulPoly ep_Q2_054_coefficient_10_0012
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0013 : Poly :=
[
  term ((-1203938929287 : Rat) / 45033486517) [(1, 1), (15, 1)]
]

/-- Partial product 13 for generator 10. -/
def ep_Q2_054_partial_10_0013 : Poly :=
[
  term ((-2407877858574 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-2407877858574 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (6, 2), (15, 1)],
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 10. -/
theorem ep_Q2_054_partial_10_0013_valid :
    mulPoly ep_Q2_054_coefficient_10_0013
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0014 : Poly :=
[
  term ((9322509634182 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 14 for generator 10. -/
def ep_Q2_054_partial_10_0014 : Poly :=
[
  term ((18645019268364 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1)],
  term ((18645019268364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (9, 1)],
  term ((-9322509634182 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1)],
  term ((-9322509634182 : Rat) / 45033486517) [(6, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 10. -/
theorem ep_Q2_054_partial_10_0014_valid :
    mulPoly ep_Q2_054_coefficient_10_0014
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0015 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 15 for generator 10. -/
def ep_Q2_054_partial_10_0015 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 3), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 10. -/
theorem ep_Q2_054_partial_10_0015_valid :
    mulPoly ep_Q2_054_coefficient_10_0015
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0016 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 16 for generator 10. -/
def ep_Q2_054_partial_10_0016 : Poly :=
[
  term ((15358660893072 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(6, 1), (7, 3), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(6, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 10. -/
theorem ep_Q2_054_partial_10_0016_valid :
    mulPoly ep_Q2_054_coefficient_10_0016
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0017 : Poly :=
[
  term ((-4252391987652 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 17 for generator 10. -/
def ep_Q2_054_partial_10_0017 : Poly :=
[
  term ((-8504783975304 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(6, 1), (7, 3), (15, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(6, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 10. -/
theorem ep_Q2_054_partial_10_0017_valid :
    mulPoly ep_Q2_054_coefficient_10_0017
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0018 : Poly :=
[
  term ((-9706893109182 : Rat) / 45033486517) [(6, 1), (7, 2)]
]

/-- Partial product 18 for generator 10. -/
def ep_Q2_054_partial_10_0018 : Poly :=
[
  term ((-19413786218364 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 2)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 3)],
  term ((9706893109182 : Rat) / 45033486517) [(6, 1), (7, 4)],
  term ((9706893109182 : Rat) / 45033486517) [(6, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 10. -/
theorem ep_Q2_054_partial_10_0018_valid :
    mulPoly ep_Q2_054_coefficient_10_0018
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0019 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 19 for generator 10. -/
def ep_Q2_054_partial_10_0019 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(6, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 10. -/
theorem ep_Q2_054_partial_10_0019_valid :
    mulPoly ep_Q2_054_coefficient_10_0019
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0020 : Poly :=
[
  term ((10600095381012 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 20 for generator 10. -/
def ep_Q2_054_partial_10_0020 : Poly :=
[
  term ((21200190762024 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((21200190762024 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-10600095381012 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((-10600095381012 : Rat) / 45033486517) [(6, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 10. -/
theorem ep_Q2_054_partial_10_0020_valid :
    mulPoly ep_Q2_054_coefficient_10_0020
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0021 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 10. -/
def ep_Q2_054_partial_10_0021 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 10. -/
theorem ep_Q2_054_partial_10_0021_valid :
    mulPoly ep_Q2_054_coefficient_10_0021
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0022 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 22 for generator 10. -/
def ep_Q2_054_partial_10_0022 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (11, 1)],
  term ((109823850000 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (11, 1)],
  term ((109823850000 : Rat) / 45033486517) [(7, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 10. -/
theorem ep_Q2_054_partial_10_0022_valid :
    mulPoly ep_Q2_054_coefficient_10_0022
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0023 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 23 for generator 10. -/
def ep_Q2_054_partial_10_0023 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(7, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 10. -/
theorem ep_Q2_054_partial_10_0023_valid :
    mulPoly ep_Q2_054_coefficient_10_0023
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0024 : Poly :=
[
  term ((-9703003682439 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 24 for generator 10. -/
def ep_Q2_054_partial_10_0024 : Poly :=
[
  term ((-19406007364878 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-19406007364878 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((9703003682439 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((9703003682439 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 10. -/
theorem ep_Q2_054_partial_10_0024_valid :
    mulPoly ep_Q2_054_coefficient_10_0024
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0025 : Poly :=
[
  term ((-424232617005 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 10. -/
def ep_Q2_054_partial_10_0025 : Poly :=
[
  term ((-848465234010 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-848465234010 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((424232617005 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((424232617005 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 10. -/
theorem ep_Q2_054_partial_10_0025_valid :
    mulPoly ep_Q2_054_coefficient_10_0025
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0026 : Poly :=
[
  term ((-1871279436213 : Rat) / 90066973034) [(7, 1), (9, 1)]
]

/-- Partial product 26 for generator 10. -/
def ep_Q2_054_partial_10_0026 : Poly :=
[
  term ((-1871279436213 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-1871279436213 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1)],
  term ((1871279436213 : Rat) / 90066973034) [(6, 2), (7, 1), (9, 1)],
  term ((1871279436213 : Rat) / 90066973034) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 10. -/
theorem ep_Q2_054_partial_10_0026_valid :
    mulPoly ep_Q2_054_coefficient_10_0026
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0027 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 27 for generator 10. -/
def ep_Q2_054_partial_10_0027 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 10. -/
theorem ep_Q2_054_partial_10_0027_valid :
    mulPoly ep_Q2_054_coefficient_10_0027
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0028 : Poly :=
[
  term ((-4488761414646 : Rat) / 45033486517) [(7, 1), (11, 1)]
]

/-- Partial product 28 for generator 10. -/
def ep_Q2_054_partial_10_0028 : Poly :=
[
  term ((-8977522829292 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(3, 1), (7, 2), (11, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 10. -/
theorem ep_Q2_054_partial_10_0028_valid :
    mulPoly ep_Q2_054_coefficient_10_0028
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0029 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 29 for generator 10. -/
def ep_Q2_054_partial_10_0029 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 10. -/
theorem ep_Q2_054_partial_10_0029_valid :
    mulPoly ep_Q2_054_coefficient_10_0029
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0030 : Poly :=
[
  term ((-1279888407756 : Rat) / 45033486517) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 30 for generator 10. -/
def ep_Q2_054_partial_10_0030 : Poly :=
[
  term ((-2559776815512 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(7, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 10. -/
theorem ep_Q2_054_partial_10_0030_valid :
    mulPoly ep_Q2_054_coefficient_10_0030
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0031 : Poly :=
[
  term ((-3319396295823 : Rat) / 45033486517) [(7, 1), (13, 1)]
]

/-- Partial product 31 for generator 10. -/
def ep_Q2_054_partial_10_0031 : Poly :=
[
  term ((-6638792591646 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-6638792591646 : Rat) / 45033486517) [(3, 1), (7, 2), (13, 1)],
  term ((3319396295823 : Rat) / 45033486517) [(6, 2), (7, 1), (13, 1)],
  term ((3319396295823 : Rat) / 45033486517) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 10. -/
theorem ep_Q2_054_partial_10_0031_valid :
    mulPoly ep_Q2_054_coefficient_10_0031
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0032 : Poly :=
[
  term ((12545797189329 : Rat) / 45033486517) [(7, 1), (15, 1)]
]

/-- Partial product 32 for generator 10. -/
def ep_Q2_054_partial_10_0032 : Poly :=
[
  term ((25091594378658 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((25091594378658 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1)],
  term ((-12545797189329 : Rat) / 45033486517) [(6, 2), (7, 1), (15, 1)],
  term ((-12545797189329 : Rat) / 45033486517) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 10. -/
theorem ep_Q2_054_partial_10_0032_valid :
    mulPoly ep_Q2_054_coefficient_10_0032
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0033 : Poly :=
[
  term ((439485929505 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 10. -/
def ep_Q2_054_partial_10_0033 : Poly :=
[
  term ((878971859010 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((878971859010 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-439485929505 : Rat) / 45033486517) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-439485929505 : Rat) / 45033486517) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 10. -/
theorem ep_Q2_054_partial_10_0033_valid :
    mulPoly ep_Q2_054_coefficient_10_0033
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0034 : Poly :=
[
  term ((-384383475000 : Rat) / 45033486517) [(7, 2)]
]

/-- Partial product 34 for generator 10. -/
def ep_Q2_054_partial_10_0034 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 3)],
  term ((384383475000 : Rat) / 45033486517) [(6, 2), (7, 2)],
  term ((384383475000 : Rat) / 45033486517) [(7, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 10. -/
theorem ep_Q2_054_partial_10_0034_valid :
    mulPoly ep_Q2_054_coefficient_10_0034
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0035 : Poly :=
[
  term ((384383475000 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 35 for generator 10. -/
def ep_Q2_054_partial_10_0035 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2), (8, 1)],
  term ((768766950000 : Rat) / 45033486517) [(3, 1), (7, 3), (8, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(7, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 10. -/
theorem ep_Q2_054_partial_10_0035_valid :
    mulPoly ep_Q2_054_coefficient_10_0035
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0036 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 36 for generator 10. -/
def ep_Q2_054_partial_10_0036 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (8, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 4), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 10. -/
theorem ep_Q2_054_partial_10_0036_valid :
    mulPoly ep_Q2_054_coefficient_10_0036
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0037 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (16, 1)]
]

/-- Partial product 37 for generator 10. -/
def ep_Q2_054_partial_10_0037 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 2), (7, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 10. -/
theorem ep_Q2_054_partial_10_0037_valid :
    mulPoly ep_Q2_054_coefficient_10_0037
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0038 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 38 for generator 10. -/
def ep_Q2_054_partial_10_0038 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 10. -/
theorem ep_Q2_054_partial_10_0038_valid :
    mulPoly ep_Q2_054_coefficient_10_0038
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0039 : Poly :=
[
  term ((5048751583908 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 39 for generator 10. -/
def ep_Q2_054_partial_10_0039 : Poly :=
[
  term ((10097503167816 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((10097503167816 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-5048751583908 : Rat) / 45033486517) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-5048751583908 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 10. -/
theorem ep_Q2_054_partial_10_0039_valid :
    mulPoly ep_Q2_054_coefficient_10_0039
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0040 : Poly :=
[
  term ((15718122688320 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 40 for generator 10. -/
def ep_Q2_054_partial_10_0040 : Poly :=
[
  term ((31436245376640 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((31436245376640 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((-15718122688320 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2)],
  term ((-15718122688320 : Rat) / 45033486517) [(7, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 10. -/
theorem ep_Q2_054_partial_10_0040_valid :
    mulPoly ep_Q2_054_coefficient_10_0040
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0041 : Poly :=
[
  term ((1437433626015 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 10. -/
def ep_Q2_054_partial_10_0041 : Poly :=
[
  term ((2874867252030 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((2874867252030 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1437433626015 : Rat) / 45033486517) [(7, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 10. -/
theorem ep_Q2_054_partial_10_0041_valid :
    mulPoly ep_Q2_054_coefficient_10_0041
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0042 : Poly :=
[
  term ((-1607266158768 : Rat) / 45033486517) [(9, 1), (13, 1)]
]

/-- Partial product 42 for generator 10. -/
def ep_Q2_054_partial_10_0042 : Poly :=
[
  term ((-3214532317536 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-3214532317536 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((1607266158768 : Rat) / 45033486517) [(6, 2), (9, 1), (13, 1)],
  term ((1607266158768 : Rat) / 45033486517) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 10. -/
theorem ep_Q2_054_partial_10_0042_valid :
    mulPoly ep_Q2_054_coefficient_10_0042
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0043 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 43 for generator 10. -/
def ep_Q2_054_partial_10_0043 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(6, 2), (9, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 10. -/
theorem ep_Q2_054_partial_10_0043_valid :
    mulPoly ep_Q2_054_coefficient_10_0043
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0044 : Poly :=
[
  term ((-479144542005 : Rat) / 90066973034) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 10. -/
def ep_Q2_054_partial_10_0044 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 90066973034) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 90066973034) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 10. -/
theorem ep_Q2_054_partial_10_0044_valid :
    mulPoly ep_Q2_054_coefficient_10_0044
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0045 : Poly :=
[
  term ((999247302231 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 45 for generator 10. -/
def ep_Q2_054_partial_10_0045 : Poly :=
[
  term ((999247302231 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((999247302231 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-999247302231 : Rat) / 90066973034) [(6, 2), (11, 1), (15, 1)],
  term ((-999247302231 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 10. -/
theorem ep_Q2_054_partial_10_0045_valid :
    mulPoly ep_Q2_054_coefficient_10_0045
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0046 : Poly :=
[
  term ((159714847335 : Rat) / 90066973034) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 10. -/
def ep_Q2_054_partial_10_0046 : Poly :=
[
  term ((159714847335 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 10. -/
theorem ep_Q2_054_partial_10_0046_valid :
    mulPoly ep_Q2_054_coefficient_10_0046
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0047 : Poly :=
[
  term ((-938437253395 : Rat) / 45033486517) [(12, 1)]
]

/-- Partial product 47 for generator 10. -/
def ep_Q2_054_partial_10_0047 : Poly :=
[
  term ((-1876874506790 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)],
  term ((938437253395 : Rat) / 45033486517) [(6, 2), (12, 1)],
  term ((938437253395 : Rat) / 45033486517) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 10. -/
theorem ep_Q2_054_partial_10_0047_valid :
    mulPoly ep_Q2_054_coefficient_10_0047
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0048 : Poly :=
[
  term ((-156283226433 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 48 for generator 10. -/
def ep_Q2_054_partial_10_0048 : Poly :=
[
  term ((-312566452866 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-312566452866 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((156283226433 : Rat) / 45033486517) [(6, 2), (12, 1), (15, 2)],
  term ((156283226433 : Rat) / 45033486517) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 10. -/
theorem ep_Q2_054_partial_10_0048_valid :
    mulPoly ep_Q2_054_coefficient_10_0048
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0049 : Poly :=
[
  term ((-483963841871 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 49 for generator 10. -/
def ep_Q2_054_partial_10_0049 : Poly :=
[
  term ((-483963841871 : Rat) / 45033486517) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-483963841871 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((483963841871 : Rat) / 90066973034) [(6, 2), (13, 1), (15, 1)],
  term ((483963841871 : Rat) / 90066973034) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 10. -/
theorem ep_Q2_054_partial_10_0049_valid :
    mulPoly ep_Q2_054_coefficient_10_0049
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0050 : Poly :=
[
  term ((-21140118607985 : Rat) / 90066973034) [(15, 2)]
]

/-- Partial product 50 for generator 10. -/
def ep_Q2_054_partial_10_0050 : Poly :=
[
  term ((-21140118607985 : Rat) / 45033486517) [(2, 1), (6, 1), (15, 2)],
  term ((-21140118607985 : Rat) / 45033486517) [(3, 1), (7, 1), (15, 2)],
  term ((21140118607985 : Rat) / 90066973034) [(6, 2), (15, 2)],
  term ((21140118607985 : Rat) / 90066973034) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 10. -/
theorem ep_Q2_054_partial_10_0050_valid :
    mulPoly ep_Q2_054_coefficient_10_0050
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 10. -/
def ep_Q2_054_coefficient_10_0051 : Poly :=
[
  term ((-2076293015355 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 51 for generator 10. -/
def ep_Q2_054_partial_10_0051 : Poly :=
[
  term ((-2076293015355 : Rat) / 45033486517) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2076293015355 : Rat) / 45033486517) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((2076293015355 : Rat) / 90066973034) [(6, 2), (15, 2), (16, 1)],
  term ((2076293015355 : Rat) / 90066973034) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 10. -/
theorem ep_Q2_054_partial_10_0051_valid :
    mulPoly ep_Q2_054_coefficient_10_0051
        ep_Q2_054_generator_10_0000_0051 =
      ep_Q2_054_partial_10_0051 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_10_0000_0051 : List Poly :=
[
  ep_Q2_054_partial_10_0000,
  ep_Q2_054_partial_10_0001,
  ep_Q2_054_partial_10_0002,
  ep_Q2_054_partial_10_0003,
  ep_Q2_054_partial_10_0004,
  ep_Q2_054_partial_10_0005,
  ep_Q2_054_partial_10_0006,
  ep_Q2_054_partial_10_0007,
  ep_Q2_054_partial_10_0008,
  ep_Q2_054_partial_10_0009,
  ep_Q2_054_partial_10_0010,
  ep_Q2_054_partial_10_0011,
  ep_Q2_054_partial_10_0012,
  ep_Q2_054_partial_10_0013,
  ep_Q2_054_partial_10_0014,
  ep_Q2_054_partial_10_0015,
  ep_Q2_054_partial_10_0016,
  ep_Q2_054_partial_10_0017,
  ep_Q2_054_partial_10_0018,
  ep_Q2_054_partial_10_0019,
  ep_Q2_054_partial_10_0020,
  ep_Q2_054_partial_10_0021,
  ep_Q2_054_partial_10_0022,
  ep_Q2_054_partial_10_0023,
  ep_Q2_054_partial_10_0024,
  ep_Q2_054_partial_10_0025,
  ep_Q2_054_partial_10_0026,
  ep_Q2_054_partial_10_0027,
  ep_Q2_054_partial_10_0028,
  ep_Q2_054_partial_10_0029,
  ep_Q2_054_partial_10_0030,
  ep_Q2_054_partial_10_0031,
  ep_Q2_054_partial_10_0032,
  ep_Q2_054_partial_10_0033,
  ep_Q2_054_partial_10_0034,
  ep_Q2_054_partial_10_0035,
  ep_Q2_054_partial_10_0036,
  ep_Q2_054_partial_10_0037,
  ep_Q2_054_partial_10_0038,
  ep_Q2_054_partial_10_0039,
  ep_Q2_054_partial_10_0040,
  ep_Q2_054_partial_10_0041,
  ep_Q2_054_partial_10_0042,
  ep_Q2_054_partial_10_0043,
  ep_Q2_054_partial_10_0044,
  ep_Q2_054_partial_10_0045,
  ep_Q2_054_partial_10_0046,
  ep_Q2_054_partial_10_0047,
  ep_Q2_054_partial_10_0048,
  ep_Q2_054_partial_10_0049,
  ep_Q2_054_partial_10_0050,
  ep_Q2_054_partial_10_0051
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_10_0000_0051 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-872637583878 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (7, 2)],
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (8, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1)],
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-19413786218364 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (9, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((-872637583878 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 3)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (6, 2)],
  term ((9706893109182 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((436318791939 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(0, 1), (6, 2), (8, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (6, 2), (15, 2)],
  term ((3839665223268 : Rat) / 45033486517) [(0, 1), (7, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-3839665223268 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((4846640305266 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2)],
  term ((9706893109182 : Rat) / 45033486517) [(0, 1), (7, 3), (9, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1)],
  term ((436318791939 : Rat) / 45033486517) [(0, 1), (7, 3), (15, 1)],
  term ((-9706893109182 : Rat) / 45033486517) [(0, 1), (7, 4)],
  term ((5128006179591 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-2407877858574 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-2407877858574 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((5128006179591 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2)],
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (6, 2), (7, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (6, 2), (13, 1)],
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (6, 2), (15, 1)],
  term ((-1919832611634 : Rat) / 45033486517) [(1, 1), (7, 2), (13, 1)],
  term ((1203938929287 : Rat) / 45033486517) [(1, 1), (7, 2), (15, 1)],
  term ((-5128006179591 : Rat) / 90066973034) [(1, 1), (7, 3)],
  term ((4420109369262 : Rat) / 45033486517) [(2, 1), (6, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-19406007364878 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-848465234010 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1871279436213 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((6101325000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-6638792591646 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((25091594378658 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((878971859010 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2), (8, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((10097503167816 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((31436245376640 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((2874867252030 : Rat) / 45033486517) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3214532317536 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((999247302231 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-483963841871 : Rat) / 45033486517) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-21140118607985 : Rat) / 45033486517) [(2, 1), (6, 1), (15, 2)],
  term ((-2076293015355 : Rat) / 45033486517) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((18645019268364 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(2, 1), (6, 2), (7, 2)],
  term ((-15358660893072 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((21200190762024 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((21200190762024 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((18645019268364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 3)],
  term ((4420109369262 : Rat) / 45033486517) [(3, 1), (7, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((10097503167816 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((31436245376640 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((2874867252030 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3214532317536 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((999247302231 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-483963841871 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-21140118607985 : Rat) / 45033486517) [(3, 1), (7, 1), (15, 2)],
  term ((-2076293015355 : Rat) / 45033486517) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (11, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (13, 1)],
  term ((-19406007364878 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((-848465234010 : Rat) / 45033486517) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-1871279436213 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(3, 1), (7, 2), (11, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-6638792591646 : Rat) / 45033486517) [(3, 1), (7, 2), (13, 1)],
  term ((25091594378658 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1)],
  term ((878971859010 : Rat) / 45033486517) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (7, 3)],
  term ((768766950000 : Rat) / 45033486517) [(3, 1), (7, 3), (8, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 3), (16, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((-10600095381012 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9322509634182 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(6, 1), (7, 3), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(6, 1), (7, 3), (15, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(6, 1), (7, 4)],
  term ((-2210054684631 : Rat) / 45033486517) [(6, 2)],
  term ((109823850000 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (11, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (13, 1)],
  term ((9703003682439 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((424232617005 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1871279436213 : Rat) / 90066973034) [(6, 2), (7, 1), (9, 1)],
  term ((9151987500 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((3319396295823 : Rat) / 45033486517) [(6, 2), (7, 1), (13, 1)],
  term ((-12545797189329 : Rat) / 45033486517) [(6, 2), (7, 1), (15, 1)],
  term ((-439485929505 : Rat) / 45033486517) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(6, 2), (7, 2)],
  term ((-384383475000 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1)],
  term ((18303975000 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 2), (7, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-5048751583908 : Rat) / 45033486517) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-15718122688320 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2)],
  term ((-1437433626015 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((1607266158768 : Rat) / 45033486517) [(6, 2), (9, 1), (13, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(6, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 90066973034) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-999247302231 : Rat) / 90066973034) [(6, 2), (11, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((938437253395 : Rat) / 45033486517) [(6, 2), (12, 1)],
  term ((156283226433 : Rat) / 45033486517) [(6, 2), (12, 1), (15, 2)],
  term ((483963841871 : Rat) / 90066973034) [(6, 2), (13, 1), (15, 1)],
  term ((21140118607985 : Rat) / 90066973034) [(6, 2), (15, 2)],
  term ((2076293015355 : Rat) / 90066973034) [(6, 2), (15, 2), (16, 1)],
  term ((-9322509634182 : Rat) / 45033486517) [(6, 3), (7, 1), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 3), (7, 1), (9, 1), (16, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(6, 3), (7, 1), (13, 1)],
  term ((4252391987652 : Rat) / 45033486517) [(6, 3), (7, 1), (15, 1)],
  term ((9706893109182 : Rat) / 45033486517) [(6, 3), (7, 2)],
  term ((7679330446536 : Rat) / 45033486517) [(6, 3), (9, 1), (13, 1)],
  term ((-10600095381012 : Rat) / 45033486517) [(6, 3), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 3), (9, 1), (15, 1), (16, 1)],
  term ((-2210054684631 : Rat) / 45033486517) [(7, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-5048751583908 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-15718122688320 : Rat) / 45033486517) [(7, 2), (8, 1), (15, 2)],
  term ((-1437433626015 : Rat) / 45033486517) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((1607266158768 : Rat) / 45033486517) [(7, 2), (9, 1), (13, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(7, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 90066973034) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-999247302231 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((938437253395 : Rat) / 45033486517) [(7, 2), (12, 1)],
  term ((156283226433 : Rat) / 45033486517) [(7, 2), (12, 1), (15, 2)],
  term ((483963841871 : Rat) / 90066973034) [(7, 2), (13, 1), (15, 1)],
  term ((21140118607985 : Rat) / 90066973034) [(7, 2), (15, 2)],
  term ((2076293015355 : Rat) / 90066973034) [(7, 2), (15, 2), (16, 1)],
  term ((109823850000 : Rat) / 45033486517) [(7, 3), (8, 1), (11, 1)],
  term ((73215900000 : Rat) / 45033486517) [(7, 3), (8, 1), (13, 1)],
  term ((9703003682439 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1)],
  term ((424232617005 : Rat) / 45033486517) [(7, 3), (8, 1), (15, 1), (16, 1)],
  term ((1871279436213 : Rat) / 90066973034) [(7, 3), (9, 1)],
  term ((9151987500 : Rat) / 45033486517) [(7, 3), (9, 1), (16, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(7, 3), (11, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 3), (11, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(7, 3), (12, 1), (15, 1)],
  term ((3319396295823 : Rat) / 45033486517) [(7, 3), (13, 1)],
  term ((-12545797189329 : Rat) / 45033486517) [(7, 3), (15, 1)],
  term ((-439485929505 : Rat) / 45033486517) [(7, 3), (15, 1), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(7, 4)],
  term ((-384383475000 : Rat) / 45033486517) [(7, 4), (8, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 4), (8, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 51. -/
theorem ep_Q2_054_block_10_0000_0051_valid :
    checkProductSumEq ep_Q2_054_partials_10_0000_0051
      ep_Q2_054_block_10_0000_0051 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
