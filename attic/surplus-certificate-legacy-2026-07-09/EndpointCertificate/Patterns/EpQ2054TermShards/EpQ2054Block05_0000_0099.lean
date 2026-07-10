/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 5:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_05_0000_0099 : Poly :=
[
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0000 : Poly :=
[
  term ((-4963253250605 : Rat) / 90066973034) []
]

/-- Partial product 0 for generator 5. -/
def ep_Q2_054_partial_05_0000 : Poly :=
[
  term ((-4963253250605 : Rat) / 90066973034) [(4, 2)],
  term ((-4963253250605 : Rat) / 90066973034) [(5, 2)],
  term ((4963253250605 : Rat) / 90066973034) [(14, 2)],
  term ((4963253250605 : Rat) / 90066973034) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 5. -/
theorem ep_Q2_054_partial_05_0000_valid :
    mulPoly ep_Q2_054_coefficient_05_0000
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0001 : Poly :=
[
  term ((1021628833353 : Rat) / 45033486517) [(0, 1)]
]

/-- Partial product 1 for generator 5. -/
def ep_Q2_054_partial_05_0001 : Poly :=
[
  term ((1021628833353 : Rat) / 45033486517) [(0, 1), (4, 2)],
  term ((1021628833353 : Rat) / 45033486517) [(0, 1), (5, 2)],
  term ((-1021628833353 : Rat) / 45033486517) [(0, 1), (14, 2)],
  term ((-1021628833353 : Rat) / 45033486517) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 5. -/
theorem ep_Q2_054_partial_05_0001_valid :
    mulPoly ep_Q2_054_coefficient_05_0001
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0002 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 2 for generator 5. -/
def ep_Q2_054_partial_05_0002 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (4, 2), (7, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 2), (7, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 5. -/
theorem ep_Q2_054_partial_05_0002_valid :
    mulPoly ep_Q2_054_coefficient_05_0002
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0003 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 3 for generator 5. -/
def ep_Q2_054_partial_05_0003 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (4, 2), (9, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 2), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 5. -/
theorem ep_Q2_054_partial_05_0003_valid :
    mulPoly ep_Q2_054_coefficient_05_0003
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0004 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 4 for generator 5. -/
def ep_Q2_054_partial_05_0004 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (4, 2), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 2), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 5. -/
theorem ep_Q2_054_partial_05_0004_valid :
    mulPoly ep_Q2_054_coefficient_05_0004
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0005 : Poly :=
[
  term ((-4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1)]
]

/-- Partial product 5 for generator 5. -/
def ep_Q2_054_partial_05_0005 : Poly :=
[
  term ((-4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2)],
  term ((-4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2)],
  term ((4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1), (14, 2)],
  term ((4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 5. -/
theorem ep_Q2_054_partial_05_0005_valid :
    mulPoly ep_Q2_054_coefficient_05_0005
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0006 : Poly :=
[
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1)]
]

/-- Partial product 6 for generator 5. -/
def ep_Q2_054_partial_05_0006 : Poly :=
[
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (9, 1)],
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (9, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 2)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 5. -/
theorem ep_Q2_054_partial_05_0006_valid :
    mulPoly ep_Q2_054_coefficient_05_0006
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0007 : Poly :=
[
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 7 for generator 5. -/
def ep_Q2_054_partial_05_0007 : Poly :=
[
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (9, 1), (12, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (9, 1), (12, 1)],
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 5. -/
theorem ep_Q2_054_partial_05_0007_valid :
    mulPoly ep_Q2_054_coefficient_05_0007
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0008 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1)]
]

/-- Partial product 8 for generator 5. -/
def ep_Q2_054_partial_05_0008 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (11, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (11, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 5. -/
theorem ep_Q2_054_partial_05_0008_valid :
    mulPoly ep_Q2_054_coefficient_05_0008
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0009 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1)]
]

/-- Partial product 9 for generator 5. -/
def ep_Q2_054_partial_05_0009 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (13, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 2)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 5. -/
theorem ep_Q2_054_partial_05_0009_valid :
    mulPoly ep_Q2_054_coefficient_05_0009
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0010 : Poly :=
[
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (15, 1)]
]

/-- Partial product 10 for generator 5. -/
def ep_Q2_054_partial_05_0010 : Poly :=
[
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (15, 1)],
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (15, 1)],
  term ((-9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 5. -/
theorem ep_Q2_054_partial_05_0010_valid :
    mulPoly ep_Q2_054_coefficient_05_0010
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0011 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 11 for generator 5. -/
def ep_Q2_054_partial_05_0011 : Poly :=
[
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 5. -/
theorem ep_Q2_054_partial_05_0011_valid :
    mulPoly ep_Q2_054_coefficient_05_0011
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0012 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 12 for generator 5. -/
def ep_Q2_054_partial_05_0012 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (9, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (9, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 5. -/
theorem ep_Q2_054_partial_05_0012_valid :
    mulPoly ep_Q2_054_coefficient_05_0012
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0013 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 13 for generator 5. -/
def ep_Q2_054_partial_05_0013 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (11, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 5. -/
theorem ep_Q2_054_partial_05_0013_valid :
    mulPoly ep_Q2_054_coefficient_05_0013
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0014 : Poly :=
[
  term ((-6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (15, 1)]
]

/-- Partial product 14 for generator 5. -/
def ep_Q2_054_partial_05_0014 : Poly :=
[
  term ((-6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (13, 1), (15, 1)],
  term ((6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (14, 2), (15, 1)],
  term ((6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 5. -/
theorem ep_Q2_054_partial_05_0014_valid :
    mulPoly ep_Q2_054_coefficient_05_0014
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0015 : Poly :=
[
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2)]
]

/-- Partial product 15 for generator 5. -/
def ep_Q2_054_partial_05_0015 : Poly :=
[
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (15, 2)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (15, 2)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (14, 2), (15, 2)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 5. -/
theorem ep_Q2_054_partial_05_0015_valid :
    mulPoly ep_Q2_054_coefficient_05_0015
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0016 : Poly :=
[
  term ((17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 16 for generator 5. -/
def ep_Q2_054_partial_05_0016 : Poly :=
[
  term ((17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (7, 1)],
  term ((17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (7, 1)],
  term ((-17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((-17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 5. -/
theorem ep_Q2_054_partial_05_0016_valid :
    mulPoly ep_Q2_054_coefficient_05_0016
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0017 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 17 for generator 5. -/
def ep_Q2_054_partial_05_0017 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (14, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 5. -/
theorem ep_Q2_054_partial_05_0017_valid :
    mulPoly ep_Q2_054_coefficient_05_0017
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0018 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 18 for generator 5. -/
def ep_Q2_054_partial_05_0018 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 5. -/
theorem ep_Q2_054_partial_05_0018_valid :
    mulPoly ep_Q2_054_coefficient_05_0018
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0019 : Poly :=
[
  term ((-2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 19 for generator 5. -/
def ep_Q2_054_partial_05_0019 : Poly :=
[
  term ((-2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((-2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 5. -/
theorem ep_Q2_054_partial_05_0019_valid :
    mulPoly ep_Q2_054_coefficient_05_0019
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0020 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 5. -/
def ep_Q2_054_partial_05_0020 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 5. -/
theorem ep_Q2_054_partial_05_0020_valid :
    mulPoly ep_Q2_054_coefficient_05_0020
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0021 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 21 for generator 5. -/
def ep_Q2_054_partial_05_0021 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (4, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (5, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 5. -/
theorem ep_Q2_054_partial_05_0021_valid :
    mulPoly ep_Q2_054_coefficient_05_0021
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0022 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (13, 1)]
]

/-- Partial product 22 for generator 5. -/
def ep_Q2_054_partial_05_0022 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (4, 2), (5, 1), (7, 2), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (13, 1), (14, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (5, 3), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 5. -/
theorem ep_Q2_054_partial_05_0022_valid :
    mulPoly ep_Q2_054_coefficient_05_0022
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0023 : Poly :=
[
  term ((3121848447930 : Rat) / 45033486517) [(0, 1), (6, 1)]
]

/-- Partial product 23 for generator 5. -/
def ep_Q2_054_partial_05_0023 : Poly :=
[
  term ((3121848447930 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1)],
  term ((3121848447930 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1)],
  term ((-3121848447930 : Rat) / 45033486517) [(0, 1), (6, 1), (14, 2)],
  term ((-3121848447930 : Rat) / 45033486517) [(0, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 5. -/
theorem ep_Q2_054_partial_05_0023_valid :
    mulPoly ep_Q2_054_coefficient_05_0023
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0024 : Poly :=
[
  term ((-604031175000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 24 for generator 5. -/
def ep_Q2_054_partial_05_0024 : Poly :=
[
  term ((-604031175000 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1), (7, 1), (11, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1), (7, 1), (11, 1)],
  term ((604031175000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 2)],
  term ((604031175000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 5. -/
theorem ep_Q2_054_partial_05_0024_valid :
    mulPoly ep_Q2_054_coefficient_05_0024
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0025 : Poly :=
[
  term ((1098238500000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 25 for generator 5. -/
def ep_Q2_054_partial_05_0025 : Poly :=
[
  term ((1098238500000 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1), (7, 1), (15, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-1098238500000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-1098238500000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 5. -/
theorem ep_Q2_054_partial_05_0025_valid :
    mulPoly ep_Q2_054_coefficient_05_0025
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0026 : Poly :=
[
  term ((18650157112872 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 26 for generator 5. -/
def ep_Q2_054_partial_05_0026 : Poly :=
[
  term ((18650157112872 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1), (11, 1), (15, 1)],
  term ((18650157112872 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-18650157112872 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-18650157112872 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 5. -/
theorem ep_Q2_054_partial_05_0026_valid :
    mulPoly ep_Q2_054_coefficient_05_0026
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0027 : Poly :=
[
  term ((-37602585815904 : Rat) / 45033486517) [(0, 1), (6, 1), (15, 2)]
]

/-- Partial product 27 for generator 5. -/
def ep_Q2_054_partial_05_0027 : Poly :=
[
  term ((-37602585815904 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1), (15, 2)],
  term ((-37602585815904 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1), (15, 2)],
  term ((37602585815904 : Rat) / 45033486517) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((37602585815904 : Rat) / 45033486517) [(0, 1), (6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 5. -/
theorem ep_Q2_054_partial_05_0027_valid :
    mulPoly ep_Q2_054_coefficient_05_0027
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0028 : Poly :=
[
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 28 for generator 5. -/
def ep_Q2_054_partial_05_0028 : Poly :=
[
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (8, 1), (11, 1)],
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (8, 1), (11, 1)],
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 2)],
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 5. -/
theorem ep_Q2_054_partial_05_0028_valid :
    mulPoly ep_Q2_054_coefficient_05_0028
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0029 : Poly :=
[
  term ((-9023544709182 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 29 for generator 5. -/
def ep_Q2_054_partial_05_0029 : Poly :=
[
  term ((-9023544709182 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (8, 1), (15, 1)],
  term ((-9023544709182 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (8, 1), (15, 1)],
  term ((9023544709182 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((9023544709182 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 5. -/
theorem ep_Q2_054_partial_05_0029_valid :
    mulPoly ep_Q2_054_coefficient_05_0029
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0030 : Poly :=
[
  term ((-4702021251111 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 30 for generator 5. -/
def ep_Q2_054_partial_05_0030 : Poly :=
[
  term ((-4702021251111 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (9, 1)],
  term ((-4702021251111 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (9, 1)],
  term ((4702021251111 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((4702021251111 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 5. -/
theorem ep_Q2_054_partial_05_0030_valid :
    mulPoly ep_Q2_054_coefficient_05_0030
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0031 : Poly :=
[
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 31 for generator 5. -/
def ep_Q2_054_partial_05_0031 : Poly :=
[
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (9, 1), (10, 1)],
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 1)],
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 2)],
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 5. -/
theorem ep_Q2_054_partial_05_0031_valid :
    mulPoly ep_Q2_054_coefficient_05_0031
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0032 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 32 for generator 5. -/
def ep_Q2_054_partial_05_0032 : Poly :=
[
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (9, 1), (12, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (9, 1), (12, 1)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 5. -/
theorem ep_Q2_054_partial_05_0032_valid :
    mulPoly ep_Q2_054_coefficient_05_0032
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0033 : Poly :=
[
  term ((-381332812500 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 33 for generator 5. -/
def ep_Q2_054_partial_05_0033 : Poly :=
[
  term ((-381332812500 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-381332812500 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (10, 1), (15, 1)],
  term ((381332812500 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((381332812500 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 5. -/
theorem ep_Q2_054_partial_05_0033_valid :
    mulPoly ep_Q2_054_coefficient_05_0033
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0034 : Poly :=
[
  term ((99954957285 : Rat) / 90066973034) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 34 for generator 5. -/
def ep_Q2_054_partial_05_0034 : Poly :=
[
  term ((99954957285 : Rat) / 90066973034) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((99954957285 : Rat) / 90066973034) [(0, 1), (5, 2), (7, 1), (11, 1)],
  term ((-99954957285 : Rat) / 90066973034) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-99954957285 : Rat) / 90066973034) [(0, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 5. -/
theorem ep_Q2_054_partial_05_0034_valid :
    mulPoly ep_Q2_054_coefficient_05_0034
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0035 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 35 for generator 5. -/
def ep_Q2_054_partial_05_0035 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 5. -/
theorem ep_Q2_054_partial_05_0035_valid :
    mulPoly ep_Q2_054_coefficient_05_0035
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0036 : Poly :=
[
  term ((1153913090625 : Rat) / 45033486517) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 36 for generator 5. -/
def ep_Q2_054_partial_05_0036 : Poly :=
[
  term ((1153913090625 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (12, 1), (15, 1)],
  term ((1153913090625 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1153913090625 : Rat) / 45033486517) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1153913090625 : Rat) / 45033486517) [(0, 1), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 5. -/
theorem ep_Q2_054_partial_05_0036_valid :
    mulPoly ep_Q2_054_coefficient_05_0036
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0037 : Poly :=
[
  term ((18299091404727 : Rat) / 90066973034) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 37 for generator 5. -/
def ep_Q2_054_partial_05_0037 : Poly :=
[
  term ((18299091404727 : Rat) / 90066973034) [(0, 1), (4, 2), (7, 1), (13, 1)],
  term ((18299091404727 : Rat) / 90066973034) [(0, 1), (5, 2), (7, 1), (13, 1)],
  term ((-18299091404727 : Rat) / 90066973034) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-18299091404727 : Rat) / 90066973034) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 5. -/
theorem ep_Q2_054_partial_05_0037_valid :
    mulPoly ep_Q2_054_coefficient_05_0037
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0038 : Poly :=
[
  term ((2735598222324 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 38 for generator 5. -/
def ep_Q2_054_partial_05_0038 : Poly :=
[
  term ((2735598222324 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((2735598222324 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (15, 1)],
  term ((-2735598222324 : Rat) / 45033486517) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-2735598222324 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 5. -/
theorem ep_Q2_054_partial_05_0038_valid :
    mulPoly ep_Q2_054_coefficient_05_0038
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0039 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 5. -/
def ep_Q2_054_partial_05_0039 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 5. -/
theorem ep_Q2_054_partial_05_0039_valid :
    mulPoly ep_Q2_054_coefficient_05_0039
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0040 : Poly :=
[
  term ((-10082208145950 : Rat) / 45033486517) [(0, 1), (7, 2)]
]

/-- Partial product 40 for generator 5. -/
def ep_Q2_054_partial_05_0040 : Poly :=
[
  term ((-10082208145950 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 2)],
  term ((-10082208145950 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 2)],
  term ((10082208145950 : Rat) / 45033486517) [(0, 1), (7, 2), (14, 2)],
  term ((10082208145950 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 5. -/
theorem ep_Q2_054_partial_05_0040_valid :
    mulPoly ep_Q2_054_coefficient_05_0040
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0041 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 41 for generator 5. -/
def ep_Q2_054_partial_05_0041 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 2), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1), (14, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 5. -/
theorem ep_Q2_054_partial_05_0041_valid :
    mulPoly ep_Q2_054_coefficient_05_0041
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0042 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (7, 2), (16, 1)]
]

/-- Partial product 42 for generator 5. -/
def ep_Q2_054_partial_05_0042 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 5. -/
theorem ep_Q2_054_partial_05_0042_valid :
    mulPoly ep_Q2_054_coefficient_05_0042
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0043 : Poly :=
[
  term ((2285345308320 : Rat) / 45033486517) [(0, 1), (8, 1)]
]

/-- Partial product 43 for generator 5. -/
def ep_Q2_054_partial_05_0043 : Poly :=
[
  term ((2285345308320 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1)],
  term ((2285345308320 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1)],
  term ((-2285345308320 : Rat) / 45033486517) [(0, 1), (8, 1), (14, 2)],
  term ((-2285345308320 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 5. -/
theorem ep_Q2_054_partial_05_0043_valid :
    mulPoly ep_Q2_054_coefficient_05_0043
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0044 : Poly :=
[
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 44 for generator 5. -/
def ep_Q2_054_partial_05_0044 : Poly :=
[
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 5. -/
theorem ep_Q2_054_partial_05_0044_valid :
    mulPoly ep_Q2_054_coefficient_05_0044
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0045 : Poly :=
[
  term ((-236543124816 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 5. -/
def ep_Q2_054_partial_05_0045 : Poly :=
[
  term ((-236543124816 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-236543124816 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 5. -/
theorem ep_Q2_054_partial_05_0045_valid :
    mulPoly ep_Q2_054_coefficient_05_0045
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0046 : Poly :=
[
  term ((-88703671806 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 46 for generator 5. -/
def ep_Q2_054_partial_05_0046 : Poly :=
[
  term ((-88703671806 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (10, 1), (16, 1)],
  term ((-88703671806 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((88703671806 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((88703671806 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 5. -/
theorem ep_Q2_054_partial_05_0046_valid :
    mulPoly ep_Q2_054_coefficient_05_0046
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0047 : Poly :=
[
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 47 for generator 5. -/
def ep_Q2_054_partial_05_0047 : Poly :=
[
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (11, 1), (13, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (11, 1), (13, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 5. -/
theorem ep_Q2_054_partial_05_0047_valid :
    mulPoly ep_Q2_054_coefficient_05_0047
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0048 : Poly :=
[
  term ((20408999028018 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 48 for generator 5. -/
def ep_Q2_054_partial_05_0048 : Poly :=
[
  term ((20408999028018 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (11, 1), (15, 1)],
  term ((20408999028018 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-20408999028018 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-20408999028018 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 5. -/
theorem ep_Q2_054_partial_05_0048_valid :
    mulPoly ep_Q2_054_coefficient_05_0048
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0049 : Poly :=
[
  term ((-59135781204 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 5. -/
def ep_Q2_054_partial_05_0049 : Poly :=
[
  term ((-59135781204 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-59135781204 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((59135781204 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((59135781204 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 5. -/
theorem ep_Q2_054_partial_05_0049_valid :
    mulPoly ep_Q2_054_coefficient_05_0049
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0050 : Poly :=
[
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2)]
]

/-- Partial product 50 for generator 5. -/
def ep_Q2_054_partial_05_0050 : Poly :=
[
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (11, 2)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (11, 2)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2), (14, 2)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 5. -/
theorem ep_Q2_054_partial_05_0050_valid :
    mulPoly ep_Q2_054_coefficient_05_0050
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0051 : Poly :=
[
  term ((1359445830375 : Rat) / 90066973034) [(0, 1), (8, 1), (12, 1)]
]

/-- Partial product 51 for generator 5. -/
def ep_Q2_054_partial_05_0051 : Poly :=
[
  term ((1359445830375 : Rat) / 90066973034) [(0, 1), (4, 2), (8, 1), (12, 1)],
  term ((1359445830375 : Rat) / 90066973034) [(0, 1), (5, 2), (8, 1), (12, 1)],
  term ((-1359445830375 : Rat) / 90066973034) [(0, 1), (8, 1), (12, 1), (14, 2)],
  term ((-1359445830375 : Rat) / 90066973034) [(0, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 5. -/
theorem ep_Q2_054_partial_05_0051_valid :
    mulPoly ep_Q2_054_coefficient_05_0051
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0052 : Poly :=
[
  term ((-147839453010 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 52 for generator 5. -/
def ep_Q2_054_partial_05_0052 : Poly :=
[
  term ((-147839453010 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (12, 1), (16, 1)],
  term ((-147839453010 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((147839453010 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((147839453010 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 5. -/
theorem ep_Q2_054_partial_05_0052_valid :
    mulPoly ep_Q2_054_coefficient_05_0052
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0053 : Poly :=
[
  term ((-950430785346 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 53 for generator 5. -/
def ep_Q2_054_partial_05_0053 : Poly :=
[
  term ((-950430785346 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (13, 1), (15, 1)],
  term ((-950430785346 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((950430785346 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((950430785346 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 5. -/
theorem ep_Q2_054_partial_05_0053_valid :
    mulPoly ep_Q2_054_coefficient_05_0053
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0054 : Poly :=
[
  term ((295678906020 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 5. -/
def ep_Q2_054_partial_05_0054 : Poly :=
[
  term ((295678906020 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((295678906020 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-295678906020 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-295678906020 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 5. -/
theorem ep_Q2_054_partial_05_0054_valid :
    mulPoly ep_Q2_054_coefficient_05_0054
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0055 : Poly :=
[
  term ((-27810867579924 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 55 for generator 5. -/
def ep_Q2_054_partial_05_0055 : Poly :=
[
  term ((-27810867579924 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (15, 2)],
  term ((-27810867579924 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (15, 2)],
  term ((27810867579924 : Rat) / 45033486517) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((27810867579924 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 5. -/
theorem ep_Q2_054_partial_05_0055_valid :
    mulPoly ep_Q2_054_coefficient_05_0055
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0056 : Poly :=
[
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 56 for generator 5. -/
def ep_Q2_054_partial_05_0056 : Poly :=
[
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (14, 2), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 5. -/
theorem ep_Q2_054_partial_05_0056_valid :
    mulPoly ep_Q2_054_coefficient_05_0056
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0057 : Poly :=
[
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 57 for generator 5. -/
def ep_Q2_054_partial_05_0057 : Poly :=
[
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (10, 1), (11, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 5. -/
theorem ep_Q2_054_partial_05_0057_valid :
    mulPoly ep_Q2_054_coefficient_05_0057
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0058 : Poly :=
[
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 58 for generator 5. -/
def ep_Q2_054_partial_05_0058 : Poly :=
[
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 5. -/
theorem ep_Q2_054_partial_05_0058_valid :
    mulPoly ep_Q2_054_coefficient_05_0058
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0059 : Poly :=
[
  term ((-11779237796136 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 59 for generator 5. -/
def ep_Q2_054_partial_05_0059 : Poly :=
[
  term ((-11779237796136 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-11779237796136 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((11779237796136 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((11779237796136 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 5. -/
theorem ep_Q2_054_partial_05_0059_valid :
    mulPoly ep_Q2_054_coefficient_05_0059
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0060 : Poly :=
[
  term ((395095642650 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 60 for generator 5. -/
def ep_Q2_054_partial_05_0060 : Poly :=
[
  term ((395095642650 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (11, 1)],
  term ((395095642650 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (11, 1)],
  term ((-395095642650 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-395095642650 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 5. -/
theorem ep_Q2_054_partial_05_0060_valid :
    mulPoly ep_Q2_054_coefficient_05_0060
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0061 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 61 for generator 5. -/
def ep_Q2_054_partial_05_0061 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 5. -/
theorem ep_Q2_054_partial_05_0061_valid :
    mulPoly ep_Q2_054_coefficient_05_0061
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0062 : Poly :=
[
  term ((12241971062157 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 62 for generator 5. -/
def ep_Q2_054_partial_05_0062 : Poly :=
[
  term ((12241971062157 : Rat) / 90066973034) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((12241971062157 : Rat) / 90066973034) [(0, 1), (5, 2), (9, 1), (13, 1)],
  term ((-12241971062157 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-12241971062157 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 5. -/
theorem ep_Q2_054_partial_05_0062_valid :
    mulPoly ep_Q2_054_coefficient_05_0062
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0063 : Poly :=
[
  term ((17855754320166 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 63 for generator 5. -/
def ep_Q2_054_partial_05_0063 : Poly :=
[
  term ((17855754320166 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((17855754320166 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((-17855754320166 : Rat) / 45033486517) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-17855754320166 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 5. -/
theorem ep_Q2_054_partial_05_0063_valid :
    mulPoly ep_Q2_054_coefficient_05_0063
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0064 : Poly :=
[
  term ((-784113513552 : Rat) / 45033486517) [(0, 1), (9, 2)]
]

/-- Partial product 64 for generator 5. -/
def ep_Q2_054_partial_05_0064 : Poly :=
[
  term ((-784113513552 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 2)],
  term ((-784113513552 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 2)],
  term ((784113513552 : Rat) / 45033486517) [(0, 1), (9, 2), (14, 2)],
  term ((784113513552 : Rat) / 45033486517) [(0, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 5. -/
theorem ep_Q2_054_partial_05_0064_valid :
    mulPoly ep_Q2_054_coefficient_05_0064
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0065 : Poly :=
[
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 65 for generator 5. -/
def ep_Q2_054_partial_05_0065 : Poly :=
[
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (11, 1), (15, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 5. -/
theorem ep_Q2_054_partial_05_0065_valid :
    mulPoly ep_Q2_054_coefficient_05_0065
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0066 : Poly :=
[
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 66 for generator 5. -/
def ep_Q2_054_partial_05_0066 : Poly :=
[
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (12, 1), (16, 1)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (12, 1), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 5. -/
theorem ep_Q2_054_partial_05_0066_valid :
    mulPoly ep_Q2_054_coefficient_05_0066
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0067 : Poly :=
[
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 67 for generator 5. -/
def ep_Q2_054_partial_05_0067 : Poly :=
[
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 5. -/
theorem ep_Q2_054_partial_05_0067_valid :
    mulPoly ep_Q2_054_coefficient_05_0067
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0068 : Poly :=
[
  term ((32853012408 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 5. -/
def ep_Q2_054_partial_05_0068 : Poly :=
[
  term ((32853012408 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32853012408 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 5. -/
theorem ep_Q2_054_partial_05_0068_valid :
    mulPoly ep_Q2_054_coefficient_05_0068
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0069 : Poly :=
[
  term ((13885502696103 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2)]
]

/-- Partial product 69 for generator 5. -/
def ep_Q2_054_partial_05_0069 : Poly :=
[
  term ((13885502696103 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (15, 2)],
  term ((13885502696103 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (15, 2)],
  term ((-13885502696103 : Rat) / 45033486517) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((-13885502696103 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 5. -/
theorem ep_Q2_054_partial_05_0069_valid :
    mulPoly ep_Q2_054_coefficient_05_0069
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0070 : Poly :=
[
  term ((12319879653 : Rat) / 45033486517) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 70 for generator 5. -/
def ep_Q2_054_partial_05_0070 : Poly :=
[
  term ((12319879653 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((12319879653 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((-12319879653 : Rat) / 45033486517) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((-12319879653 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 5. -/
theorem ep_Q2_054_partial_05_0070_valid :
    mulPoly ep_Q2_054_coefficient_05_0070
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0071 : Poly :=
[
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 71 for generator 5. -/
def ep_Q2_054_partial_05_0071 : Poly :=
[
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 5. -/
theorem ep_Q2_054_partial_05_0071_valid :
    mulPoly ep_Q2_054_coefficient_05_0071
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0072 : Poly :=
[
  term ((-70769558431239 : Rat) / 90066973034) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 72 for generator 5. -/
def ep_Q2_054_partial_05_0072 : Poly :=
[
  term ((-70769558431239 : Rat) / 90066973034) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((-70769558431239 : Rat) / 90066973034) [(0, 1), (5, 2), (11, 1), (15, 1)],
  term ((70769558431239 : Rat) / 90066973034) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((70769558431239 : Rat) / 90066973034) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 5. -/
theorem ep_Q2_054_partial_05_0072_valid :
    mulPoly ep_Q2_054_coefficient_05_0072
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0073 : Poly :=
[
  term ((8213253102 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 5. -/
def ep_Q2_054_partial_05_0073 : Poly :=
[
  term ((8213253102 : Rat) / 45033486517) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((8213253102 : Rat) / 45033486517) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8213253102 : Rat) / 45033486517) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8213253102 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 5. -/
theorem ep_Q2_054_partial_05_0073_valid :
    mulPoly ep_Q2_054_coefficient_05_0073
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0074 : Poly :=
[
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (11, 2)]
]

/-- Partial product 74 for generator 5. -/
def ep_Q2_054_partial_05_0074 : Poly :=
[
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (4, 2), (11, 2)],
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (5, 2), (11, 2)],
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (11, 2), (14, 2)],
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 5. -/
theorem ep_Q2_054_partial_05_0074_valid :
    mulPoly ep_Q2_054_coefficient_05_0074
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0075 : Poly :=
[
  term ((-11616439407693 : Rat) / 180133946068) [(0, 1), (12, 1)]
]

/-- Partial product 75 for generator 5. -/
def ep_Q2_054_partial_05_0075 : Poly :=
[
  term ((-11616439407693 : Rat) / 180133946068) [(0, 1), (4, 2), (12, 1)],
  term ((-11616439407693 : Rat) / 180133946068) [(0, 1), (5, 2), (12, 1)],
  term ((11616439407693 : Rat) / 180133946068) [(0, 1), (12, 1), (14, 2)],
  term ((11616439407693 : Rat) / 180133946068) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 5. -/
theorem ep_Q2_054_partial_05_0075_valid :
    mulPoly ep_Q2_054_coefficient_05_0075
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0076 : Poly :=
[
  term ((-20076652089168 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 76 for generator 5. -/
def ep_Q2_054_partial_05_0076 : Poly :=
[
  term ((-20076652089168 : Rat) / 45033486517) [(0, 1), (4, 2), (12, 1), (15, 2)],
  term ((-20076652089168 : Rat) / 45033486517) [(0, 1), (5, 2), (12, 1), (15, 2)],
  term ((20076652089168 : Rat) / 45033486517) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((20076652089168 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 5. -/
theorem ep_Q2_054_partial_05_0076_valid :
    mulPoly ep_Q2_054_coefficient_05_0076
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0077 : Poly :=
[
  term ((20533132755 : Rat) / 45033486517) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 77 for generator 5. -/
def ep_Q2_054_partial_05_0077 : Poly :=
[
  term ((20533132755 : Rat) / 45033486517) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((20533132755 : Rat) / 45033486517) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((-20533132755 : Rat) / 45033486517) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-20533132755 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 5. -/
theorem ep_Q2_054_partial_05_0077_valid :
    mulPoly ep_Q2_054_coefficient_05_0077
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0078 : Poly :=
[
  term ((8654500621611 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 78 for generator 5. -/
def ep_Q2_054_partial_05_0078 : Poly :=
[
  term ((8654500621611 : Rat) / 45033486517) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((8654500621611 : Rat) / 45033486517) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((-8654500621611 : Rat) / 45033486517) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-8654500621611 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 5. -/
theorem ep_Q2_054_partial_05_0078_valid :
    mulPoly ep_Q2_054_coefficient_05_0078
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0079 : Poly :=
[
  term ((-41066265510 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 5. -/
def ep_Q2_054_partial_05_0079 : Poly :=
[
  term ((-41066265510 : Rat) / 45033486517) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41066265510 : Rat) / 45033486517) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((41066265510 : Rat) / 45033486517) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((41066265510 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 5. -/
theorem ep_Q2_054_partial_05_0079_valid :
    mulPoly ep_Q2_054_coefficient_05_0079
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0080 : Poly :=
[
  term ((47023453566672 : Rat) / 45033486517) [(0, 1), (15, 2)]
]

/-- Partial product 80 for generator 5. -/
def ep_Q2_054_partial_05_0080 : Poly :=
[
  term ((47023453566672 : Rat) / 45033486517) [(0, 1), (4, 2), (15, 2)],
  term ((47023453566672 : Rat) / 45033486517) [(0, 1), (5, 2), (15, 2)],
  term ((-47023453566672 : Rat) / 45033486517) [(0, 1), (14, 2), (15, 2)],
  term ((-47023453566672 : Rat) / 45033486517) [(0, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 5. -/
theorem ep_Q2_054_partial_05_0080_valid :
    mulPoly ep_Q2_054_coefficient_05_0080
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0081 : Poly :=
[
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (16, 1)]
]

/-- Partial product 81 for generator 5. -/
def ep_Q2_054_partial_05_0081 : Poly :=
[
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (4, 2), (16, 1)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (5, 2), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (14, 2), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 5. -/
theorem ep_Q2_054_partial_05_0081_valid :
    mulPoly ep_Q2_054_coefficient_05_0081
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0082 : Poly :=
[
  term ((-2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 82 for generator 5. -/
def ep_Q2_054_partial_05_0082 : Poly :=
[
  term ((-2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1)],
  term ((-2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1)],
  term ((2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 5. -/
theorem ep_Q2_054_partial_05_0082_valid :
    mulPoly ep_Q2_054_coefficient_05_0082
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0083 : Poly :=
[
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 83 for generator 5. -/
def ep_Q2_054_partial_05_0083 : Poly :=
[
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 5. -/
theorem ep_Q2_054_partial_05_0083_valid :
    mulPoly ep_Q2_054_coefficient_05_0083
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0084 : Poly :=
[
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 84 for generator 5. -/
def ep_Q2_054_partial_05_0084 : Poly :=
[
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 5. -/
theorem ep_Q2_054_partial_05_0084_valid :
    mulPoly ep_Q2_054_coefficient_05_0084
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0085 : Poly :=
[
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 85 for generator 5. -/
def ep_Q2_054_partial_05_0085 : Poly :=
[
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (11, 2)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (11, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 2), (14, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 5. -/
theorem ep_Q2_054_partial_05_0085_valid :
    mulPoly ep_Q2_054_coefficient_05_0085
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0086 : Poly :=
[
  term ((411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 86 for generator 5. -/
def ep_Q2_054_partial_05_0086 : Poly :=
[
  term ((411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (12, 1)],
  term ((411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (12, 1)],
  term ((-411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (14, 2)],
  term ((-411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 5. -/
theorem ep_Q2_054_partial_05_0086_valid :
    mulPoly ep_Q2_054_coefficient_05_0086
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0087 : Poly :=
[
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 87 for generator 5. -/
def ep_Q2_054_partial_05_0087 : Poly :=
[
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 5. -/
theorem ep_Q2_054_partial_05_0087_valid :
    mulPoly ep_Q2_054_coefficient_05_0087
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0088 : Poly :=
[
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 88 for generator 5. -/
def ep_Q2_054_partial_05_0088 : Poly :=
[
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 5. -/
theorem ep_Q2_054_partial_05_0088_valid :
    mulPoly ep_Q2_054_coefficient_05_0088
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0089 : Poly :=
[
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 89 for generator 5. -/
def ep_Q2_054_partial_05_0089 : Poly :=
[
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 5. -/
theorem ep_Q2_054_partial_05_0089_valid :
    mulPoly ep_Q2_054_coefficient_05_0089
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0090 : Poly :=
[
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 90 for generator 5. -/
def ep_Q2_054_partial_05_0090 : Poly :=
[
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (9, 1), (11, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (11, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 5. -/
theorem ep_Q2_054_partial_05_0090_valid :
    mulPoly ep_Q2_054_coefficient_05_0090
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0091 : Poly :=
[
  term ((247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 91 for generator 5. -/
def ep_Q2_054_partial_05_0091 : Poly :=
[
  term ((247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (9, 1), (13, 1)],
  term ((247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (13, 1)],
  term ((-247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 5. -/
theorem ep_Q2_054_partial_05_0091_valid :
    mulPoly ep_Q2_054_coefficient_05_0091
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0092 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1)]
]

/-- Partial product 92 for generator 5. -/
def ep_Q2_054_partial_05_0092 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 2)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 5. -/
theorem ep_Q2_054_partial_05_0092_valid :
    mulPoly ep_Q2_054_coefficient_05_0092
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0093 : Poly :=
[
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 93 for generator 5. -/
def ep_Q2_054_partial_05_0093 : Poly :=
[
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 5. -/
theorem ep_Q2_054_partial_05_0093_valid :
    mulPoly ep_Q2_054_coefficient_05_0093
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0094 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 94 for generator 5. -/
def ep_Q2_054_partial_05_0094 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (12, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (12, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (14, 2)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 5. -/
theorem ep_Q2_054_partial_05_0094_valid :
    mulPoly ep_Q2_054_coefficient_05_0094
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0095 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 95 for generator 5. -/
def ep_Q2_054_partial_05_0095 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 5. -/
theorem ep_Q2_054_partial_05_0095_valid :
    mulPoly ep_Q2_054_coefficient_05_0095
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0096 : Poly :=
[
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 96 for generator 5. -/
def ep_Q2_054_partial_05_0096 : Poly :=
[
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 5. -/
theorem ep_Q2_054_partial_05_0096_valid :
    mulPoly ep_Q2_054_coefficient_05_0096
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0097 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 5. -/
def ep_Q2_054_partial_05_0097 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 5. -/
theorem ep_Q2_054_partial_05_0097_valid :
    mulPoly ep_Q2_054_coefficient_05_0097
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0098 : Poly :=
[
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 98 for generator 5. -/
def ep_Q2_054_partial_05_0098 : Poly :=
[
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 5. -/
theorem ep_Q2_054_partial_05_0098_valid :
    mulPoly ep_Q2_054_coefficient_05_0098
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 5. -/
def ep_Q2_054_coefficient_05_0099 : Poly :=
[
  term ((-631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 99 for generator 5. -/
def ep_Q2_054_partial_05_0099 : Poly :=
[
  term ((-631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (11, 1), (13, 1)],
  term ((-631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (11, 1), (13, 1)],
  term ((631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 5. -/
theorem ep_Q2_054_partial_05_0099_valid :
    mulPoly ep_Q2_054_coefficient_05_0099
        ep_Q2_054_generator_05_0000_0099 =
      ep_Q2_054_partial_05_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_05_0000_0099 : List Poly :=
[
  ep_Q2_054_partial_05_0000,
  ep_Q2_054_partial_05_0001,
  ep_Q2_054_partial_05_0002,
  ep_Q2_054_partial_05_0003,
  ep_Q2_054_partial_05_0004,
  ep_Q2_054_partial_05_0005,
  ep_Q2_054_partial_05_0006,
  ep_Q2_054_partial_05_0007,
  ep_Q2_054_partial_05_0008,
  ep_Q2_054_partial_05_0009,
  ep_Q2_054_partial_05_0010,
  ep_Q2_054_partial_05_0011,
  ep_Q2_054_partial_05_0012,
  ep_Q2_054_partial_05_0013,
  ep_Q2_054_partial_05_0014,
  ep_Q2_054_partial_05_0015,
  ep_Q2_054_partial_05_0016,
  ep_Q2_054_partial_05_0017,
  ep_Q2_054_partial_05_0018,
  ep_Q2_054_partial_05_0019,
  ep_Q2_054_partial_05_0020,
  ep_Q2_054_partial_05_0021,
  ep_Q2_054_partial_05_0022,
  ep_Q2_054_partial_05_0023,
  ep_Q2_054_partial_05_0024,
  ep_Q2_054_partial_05_0025,
  ep_Q2_054_partial_05_0026,
  ep_Q2_054_partial_05_0027,
  ep_Q2_054_partial_05_0028,
  ep_Q2_054_partial_05_0029,
  ep_Q2_054_partial_05_0030,
  ep_Q2_054_partial_05_0031,
  ep_Q2_054_partial_05_0032,
  ep_Q2_054_partial_05_0033,
  ep_Q2_054_partial_05_0034,
  ep_Q2_054_partial_05_0035,
  ep_Q2_054_partial_05_0036,
  ep_Q2_054_partial_05_0037,
  ep_Q2_054_partial_05_0038,
  ep_Q2_054_partial_05_0039,
  ep_Q2_054_partial_05_0040,
  ep_Q2_054_partial_05_0041,
  ep_Q2_054_partial_05_0042,
  ep_Q2_054_partial_05_0043,
  ep_Q2_054_partial_05_0044,
  ep_Q2_054_partial_05_0045,
  ep_Q2_054_partial_05_0046,
  ep_Q2_054_partial_05_0047,
  ep_Q2_054_partial_05_0048,
  ep_Q2_054_partial_05_0049,
  ep_Q2_054_partial_05_0050,
  ep_Q2_054_partial_05_0051,
  ep_Q2_054_partial_05_0052,
  ep_Q2_054_partial_05_0053,
  ep_Q2_054_partial_05_0054,
  ep_Q2_054_partial_05_0055,
  ep_Q2_054_partial_05_0056,
  ep_Q2_054_partial_05_0057,
  ep_Q2_054_partial_05_0058,
  ep_Q2_054_partial_05_0059,
  ep_Q2_054_partial_05_0060,
  ep_Q2_054_partial_05_0061,
  ep_Q2_054_partial_05_0062,
  ep_Q2_054_partial_05_0063,
  ep_Q2_054_partial_05_0064,
  ep_Q2_054_partial_05_0065,
  ep_Q2_054_partial_05_0066,
  ep_Q2_054_partial_05_0067,
  ep_Q2_054_partial_05_0068,
  ep_Q2_054_partial_05_0069,
  ep_Q2_054_partial_05_0070,
  ep_Q2_054_partial_05_0071,
  ep_Q2_054_partial_05_0072,
  ep_Q2_054_partial_05_0073,
  ep_Q2_054_partial_05_0074,
  ep_Q2_054_partial_05_0075,
  ep_Q2_054_partial_05_0076,
  ep_Q2_054_partial_05_0077,
  ep_Q2_054_partial_05_0078,
  ep_Q2_054_partial_05_0079,
  ep_Q2_054_partial_05_0080,
  ep_Q2_054_partial_05_0081,
  ep_Q2_054_partial_05_0082,
  ep_Q2_054_partial_05_0083,
  ep_Q2_054_partial_05_0084,
  ep_Q2_054_partial_05_0085,
  ep_Q2_054_partial_05_0086,
  ep_Q2_054_partial_05_0087,
  ep_Q2_054_partial_05_0088,
  ep_Q2_054_partial_05_0089,
  ep_Q2_054_partial_05_0090,
  ep_Q2_054_partial_05_0091,
  ep_Q2_054_partial_05_0092,
  ep_Q2_054_partial_05_0093,
  ep_Q2_054_partial_05_0094,
  ep_Q2_054_partial_05_0095,
  ep_Q2_054_partial_05_0096,
  ep_Q2_054_partial_05_0097,
  ep_Q2_054_partial_05_0098,
  ep_Q2_054_partial_05_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_05_0000_0099 : Poly :=
[
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (4, 2), (7, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (4, 2), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (4, 2), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 2), (7, 1)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 2), (9, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (5, 2), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((317503552248 : Rat) / 45033486517) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2)],
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (9, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (9, 1), (12, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (11, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (13, 1)],
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (7, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (9, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (13, 1), (15, 1)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (4, 2), (15, 2)],
  term ((-4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2)],
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (9, 1)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (9, 1), (12, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (11, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (13, 1)],
  term ((9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (7, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (9, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (13, 1), (15, 1)],
  term ((9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (5, 2), (15, 2)],
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 2)],
  term ((-329471550000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 2)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-9377421559182 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (15, 3)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 3)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 3)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (14, 2), (15, 1)],
  term ((6772515676056 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (15, 3)],
  term ((4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1), (14, 2)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (14, 2), (15, 2)],
  term ((4152231676134 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2)],
  term ((-9693280610532 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 4)],
  term ((17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (13, 1)],
  term ((-2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (7, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((-2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-17458040577852 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((2095311405708 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 3)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((1021628833353 : Rat) / 45033486517) [(0, 1), (4, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (4, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (4, 2), (5, 1), (7, 2), (13, 1)],
  term ((3121848447930 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1), (7, 1), (11, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1), (7, 1), (15, 1)],
  term ((18650157112872 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-37602585815904 : Rat) / 45033486517) [(0, 1), (4, 2), (6, 1), (15, 2)],
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (8, 1), (11, 1)],
  term ((-9023544709182 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (8, 1), (15, 1)],
  term ((-4702021251111 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (9, 1)],
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (9, 1), (10, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (9, 1), (12, 1)],
  term ((-381332812500 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (10, 1), (15, 1)],
  term ((99954957285 : Rat) / 90066973034) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1153913090625 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (12, 1), (15, 1)],
  term ((18299091404727 : Rat) / 90066973034) [(0, 1), (4, 2), (7, 1), (13, 1)],
  term ((2735598222324 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-10082208145950 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 2), (11, 1), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (4, 2), (7, 2), (16, 1)],
  term ((2285345308320 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1)],
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-236543124816 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-88703671806 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (10, 1), (16, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (11, 1), (13, 1)],
  term ((20408999028018 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-59135781204 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (11, 2)],
  term ((1359445830375 : Rat) / 90066973034) [(0, 1), (4, 2), (8, 1), (12, 1)],
  term ((-147839453010 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (12, 1), (16, 1)],
  term ((-950430785346 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (13, 1), (15, 1)],
  term ((295678906020 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27810867579924 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (15, 2)],
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-11779237796136 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (10, 1), (15, 1)],
  term ((395095642650 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (11, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((12241971062157 : Rat) / 90066973034) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((17855754320166 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(0, 1), (4, 2), (9, 2)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (12, 1), (16, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1)],
  term ((32853012408 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((13885502696103 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (15, 2)],
  term ((12319879653 : Rat) / 45033486517) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((-70769558431239 : Rat) / 90066973034) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((8213253102 : Rat) / 45033486517) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (4, 2), (11, 2)],
  term ((-11616439407693 : Rat) / 180133946068) [(0, 1), (4, 2), (12, 1)],
  term ((-20076652089168 : Rat) / 45033486517) [(0, 1), (4, 2), (12, 1), (15, 2)],
  term ((20533132755 : Rat) / 45033486517) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((8654500621611 : Rat) / 45033486517) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((-41066265510 : Rat) / 45033486517) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((47023453566672 : Rat) / 45033486517) [(0, 1), (4, 2), (15, 2)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (4, 2), (16, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 3)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (13, 1), (14, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (13, 1), (15, 2)],
  term ((1021628833353 : Rat) / 45033486517) [(0, 1), (5, 2)],
  term ((3121848447930 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1)],
  term ((-604031175000 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1), (7, 1), (11, 1)],
  term ((1098238500000 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1), (7, 1), (15, 1)],
  term ((18650157112872 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-37602585815904 : Rat) / 45033486517) [(0, 1), (5, 2), (6, 1), (15, 2)],
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (8, 1), (11, 1)],
  term ((-9023544709182 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (8, 1), (15, 1)],
  term ((-4702021251111 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (9, 1)],
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 1)],
  term ((292863600000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (9, 1), (12, 1)],
  term ((-381332812500 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (10, 1), (15, 1)],
  term ((99954957285 : Rat) / 90066973034) [(0, 1), (5, 2), (7, 1), (11, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1153913090625 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (12, 1), (15, 1)],
  term ((18299091404727 : Rat) / 90066973034) [(0, 1), (5, 2), (7, 1), (13, 1)],
  term ((2735598222324 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-10082208145950 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 2), (11, 1), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (5, 2), (7, 2), (16, 1)],
  term ((2285345308320 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1)],
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-236543124816 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-88703671806 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (11, 1), (13, 1)],
  term ((20408999028018 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-59135781204 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (11, 2)],
  term ((1359445830375 : Rat) / 90066973034) [(0, 1), (5, 2), (8, 1), (12, 1)],
  term ((-147839453010 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-950430785346 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((295678906020 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27810867579924 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (15, 2)],
  term ((118271562408 : Rat) / 45033486517) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-11779237796136 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((395095642650 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (11, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((12241971062157 : Rat) / 90066973034) [(0, 1), (5, 2), (9, 1), (13, 1)],
  term ((17855754320166 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((-784113513552 : Rat) / 45033486517) [(0, 1), (5, 2), (9, 2)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (12, 1), (16, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (13, 1), (15, 1)],
  term ((32853012408 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((13885502696103 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (15, 2)],
  term ((12319879653 : Rat) / 45033486517) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((-70769558431239 : Rat) / 90066973034) [(0, 1), (5, 2), (11, 1), (15, 1)],
  term ((8213253102 : Rat) / 45033486517) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (5, 2), (11, 2)],
  term ((-11616439407693 : Rat) / 180133946068) [(0, 1), (5, 2), (12, 1)],
  term ((-20076652089168 : Rat) / 45033486517) [(0, 1), (5, 2), (12, 1), (15, 2)],
  term ((20533132755 : Rat) / 45033486517) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((8654500621611 : Rat) / 45033486517) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((-41066265510 : Rat) / 45033486517) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((47023453566672 : Rat) / 45033486517) [(0, 1), (5, 2), (15, 2)],
  term ((-16426506204 : Rat) / 45033486517) [(0, 1), (5, 2), (16, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (5, 3), (7, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (5, 3), (7, 2), (13, 1)],
  term ((604031175000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 2)],
  term ((604031175000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-1098238500000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-1098238500000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (15, 3)],
  term ((-18650157112872 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-18650157112872 : Rat) / 45033486517) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((-3121848447930 : Rat) / 45033486517) [(0, 1), (6, 1), (14, 2)],
  term ((37602585815904 : Rat) / 45033486517) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((-3121848447930 : Rat) / 45033486517) [(0, 1), (6, 1), (15, 2)],
  term ((37602585815904 : Rat) / 45033486517) [(0, 1), (6, 1), (15, 4)],
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 2)],
  term ((341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((9023544709182 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((9023544709182 : Rat) / 45033486517) [(0, 1), (7, 1), (8, 1), (15, 3)],
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 2)],
  term ((-341674200000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (10, 1), (15, 2)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-292863600000 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((4702021251111 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((4702021251111 : Rat) / 45033486517) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((381332812500 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((381332812500 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 3)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 3)],
  term ((-99954957285 : Rat) / 90066973034) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-99954957285 : Rat) / 90066973034) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-1153913090625 : Rat) / 45033486517) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1153913090625 : Rat) / 45033486517) [(0, 1), (7, 1), (12, 1), (15, 3)],
  term ((-18299091404727 : Rat) / 90066973034) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-18299091404727 : Rat) / 90066973034) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-2735598222324 : Rat) / 45033486517) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2735598222324 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 3)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1), (14, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1), (15, 2)],
  term ((10082208145950 : Rat) / 45033486517) [(0, 1), (7, 2), (14, 2)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((10082208145950 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((236543124816 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((88703671806 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((88703671806 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-20408999028018 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((59135781204 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20408999028018 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((59135781204 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2), (14, 2)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2), (15, 2)],
  term ((-1359445830375 : Rat) / 90066973034) [(0, 1), (8, 1), (12, 1), (14, 2)],
  term ((147839453010 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1359445830375 : Rat) / 90066973034) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((147839453010 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((950430785346 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-295678906020 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((950430785346 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 3)],
  term ((-295678906020 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2285345308320 : Rat) / 45033486517) [(0, 1), (8, 1), (14, 2)],
  term ((27810867579924 : Rat) / 45033486517) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (14, 2), (16, 1)],
  term ((-2285345308320 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)],
  term ((-118271562408 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((27810867579924 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 4)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((11779237796136 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((11779237796136 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((-395095642650 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-395095642650 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-12241971062157 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-12241971062157 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-17855754320166 : Rat) / 45033486517) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-17855754320166 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 3)],
  term ((784113513552 : Rat) / 45033486517) [(0, 1), (9, 2), (14, 2)],
  term ((784113513552 : Rat) / 45033486517) [(0, 1), (9, 2), (15, 2)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4314880615941 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term ((-32853012408 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-13885502696103 : Rat) / 45033486517) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((-12319879653 : Rat) / 45033486517) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((-12319879653 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-13885502696103 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 4)],
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((7191467693235 : Rat) / 90066973034) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((70769558431239 : Rat) / 90066973034) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-8213253102 : Rat) / 45033486517) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((70769558431239 : Rat) / 90066973034) [(0, 1), (11, 1), (15, 3)],
  term ((-8213253102 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (11, 2), (14, 2)],
  term ((-7191467693235 : Rat) / 90066973034) [(0, 1), (11, 2), (15, 2)],
  term ((11616439407693 : Rat) / 180133946068) [(0, 1), (12, 1), (14, 2)],
  term ((20076652089168 : Rat) / 45033486517) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-20533132755 : Rat) / 45033486517) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((11616439407693 : Rat) / 180133946068) [(0, 1), (12, 1), (15, 2)],
  term ((-20533132755 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((20076652089168 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 4)],
  term ((-8654500621611 : Rat) / 45033486517) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((41066265510 : Rat) / 45033486517) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8654500621611 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 3)],
  term ((41066265510 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1021628833353 : Rat) / 45033486517) [(0, 1), (14, 2)],
  term ((-47023453566672 : Rat) / 45033486517) [(0, 1), (14, 2), (15, 2)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (14, 2), (16, 1)],
  term ((-1021628833353 : Rat) / 45033486517) [(0, 1), (15, 2)],
  term ((16426506204 : Rat) / 45033486517) [(0, 1), (15, 2), (16, 1)],
  term ((-47023453566672 : Rat) / 45033486517) [(0, 1), (15, 4)],
  term ((-2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (11, 2)],
  term ((411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (12, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (9, 1), (11, 1)],
  term ((247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (9, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (12, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (10, 1), (16, 1)],
  term ((-631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (4, 2), (7, 1), (11, 1), (13, 1)],
  term ((-2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (11, 2)],
  term ((411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (12, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (11, 1)],
  term ((247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (12, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (5, 2), (7, 1), (11, 1), (13, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (15, 3)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 2), (14, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 2), (15, 2)],
  term ((-411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (14, 2)],
  term ((-411839437500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((988414650000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-247103662500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 3)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (14, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (15, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-494207325000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 3)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 2)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (15, 2)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((631487137500 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((2856516970329 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-4963253250605 : Rat) / 90066973034) [(4, 2)],
  term ((-4963253250605 : Rat) / 90066973034) [(5, 2)],
  term ((4963253250605 : Rat) / 90066973034) [(14, 2)],
  term ((4963253250605 : Rat) / 90066973034) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 0 through 99. -/
theorem ep_Q2_054_block_05_0000_0099_valid :
    checkProductSumEq ep_Q2_054_partials_05_0000_0099
      ep_Q2_054_block_05_0000_0099 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
