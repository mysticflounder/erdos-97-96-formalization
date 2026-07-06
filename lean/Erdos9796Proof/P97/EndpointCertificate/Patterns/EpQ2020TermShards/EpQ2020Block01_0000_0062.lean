/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 1:0-62

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 1 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_01_0000_0062 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0000 : Poly :=
[
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 1. -/
def ep_Q2_020_partial_01_0000 : Poly :=
[
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 1. -/
theorem ep_Q2_020_partial_01_0000_valid :
    mulPoly ep_Q2_020_coefficient_01_0000
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0001 : Poly :=
[
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 1. -/
def ep_Q2_020_partial_01_0001 : Poly :=
[
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 1. -/
theorem ep_Q2_020_partial_01_0001_valid :
    mulPoly ep_Q2_020_coefficient_01_0001
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0002 : Poly :=
[
  term ((-41558553366254496 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 1. -/
def ep_Q2_020_partial_01_0002 : Poly :=
[
  term ((-83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 1. -/
theorem ep_Q2_020_partial_01_0002_valid :
    mulPoly ep_Q2_020_coefficient_01_0002
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0003 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 3 for generator 1. -/
def ep_Q2_020_partial_01_0003 : Poly :=
[
  term ((-287840103203242512 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 2), (9, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 3), (9, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 1. -/
theorem ep_Q2_020_partial_01_0003_valid :
    mulPoly ep_Q2_020_coefficient_01_0003
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0004 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 1. -/
def ep_Q2_020_partial_01_0004 : Poly :=
[
  term ((-25983404805900000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 1. -/
theorem ep_Q2_020_partial_01_0004_valid :
    mulPoly ep_Q2_020_coefficient_01_0004
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0005 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 1. -/
def ep_Q2_020_partial_01_0005 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 1. -/
theorem ep_Q2_020_partial_01_0005_valid :
    mulPoly ep_Q2_020_coefficient_01_0005
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0006 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 1. -/
def ep_Q2_020_partial_01_0006 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 1. -/
theorem ep_Q2_020_partial_01_0006_valid :
    mulPoly ep_Q2_020_coefficient_01_0006
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0007 : Poly :=
[
  term ((298095664194480 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 1. -/
def ep_Q2_020_partial_01_0007 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 1. -/
theorem ep_Q2_020_partial_01_0007_valid :
    mulPoly ep_Q2_020_coefficient_01_0007
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0008 : Poly :=
[
  term ((46770128650620000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 1. -/
def ep_Q2_020_partial_01_0008 : Poly :=
[
  term ((93540257301240000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 1. -/
theorem ep_Q2_020_partial_01_0008_valid :
    mulPoly ep_Q2_020_coefficient_01_0008
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0009 : Poly :=
[
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 1. -/
def ep_Q2_020_partial_01_0009 : Poly :=
[
  term ((31247899218482724 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((31247899218482724 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 1. -/
theorem ep_Q2_020_partial_01_0009_valid :
    mulPoly ep_Q2_020_coefficient_01_0009
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0010 : Poly :=
[
  term ((2146288782200256 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 1. -/
def ep_Q2_020_partial_01_0010 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 1. -/
theorem ep_Q2_020_partial_01_0010_valid :
    mulPoly ep_Q2_020_coefficient_01_0010
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0011 : Poly :=
[
  term ((-307054479762195051 : Rat) / 56596790034801622) [(0, 1), (16, 1)]
]

/-- Partial product 11 for generator 1. -/
def ep_Q2_020_partial_01_0011 : Poly :=
[
  term ((-307054479762195051 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((307054479762195051 : Rat) / 56596790034801622) [(0, 1), (6, 2), (16, 1)],
  term ((307054479762195051 : Rat) / 56596790034801622) [(0, 1), (7, 2), (16, 1)],
  term ((-307054479762195051 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 1. -/
theorem ep_Q2_020_partial_01_0011_valid :
    mulPoly ep_Q2_020_coefficient_01_0011
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0012 : Poly :=
[
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 12 for generator 1. -/
def ep_Q2_020_partial_01_0012 : Poly :=
[
  term ((83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 1. -/
theorem ep_Q2_020_partial_01_0012_valid :
    mulPoly ep_Q2_020_coefficient_01_0012
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0013 : Poly :=
[
  term ((-2886010650434340 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 13 for generator 1. -/
def ep_Q2_020_partial_01_0013 : Poly :=
[
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 1. -/
theorem ep_Q2_020_partial_01_0013_valid :
    mulPoly ep_Q2_020_coefficient_01_0013
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0014 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 14 for generator 1. -/
def ep_Q2_020_partial_01_0014 : Poly :=
[
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(1, 1), (7, 3), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 1. -/
theorem ep_Q2_020_partial_01_0014_valid :
    mulPoly ep_Q2_020_coefficient_01_0014
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0015 : Poly :=
[
  term ((-119555652922309767 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 15 for generator 1. -/
def ep_Q2_020_partial_01_0015 : Poly :=
[
  term ((-239111305844619534 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (9, 1), (16, 1)],
  term ((119555652922309767 : Rat) / 28298395017400811) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((119555652922309767 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-239111305844619534 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 1. -/
theorem ep_Q2_020_partial_01_0015_valid :
    mulPoly ep_Q2_020_coefficient_01_0015
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0016 : Poly :=
[
  term ((-6234066813450306 : Rat) / 975806724737959) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 1. -/
def ep_Q2_020_partial_01_0016 : Poly :=
[
  term ((-12468133626900612 : Rat) / 975806724737959) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((6234066813450306 : Rat) / 975806724737959) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((6234066813450306 : Rat) / 975806724737959) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-12468133626900612 : Rat) / 975806724737959) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 1. -/
theorem ep_Q2_020_partial_01_0016_valid :
    mulPoly ep_Q2_020_coefficient_01_0016
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0017 : Poly :=
[
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 17 for generator 1. -/
def ep_Q2_020_partial_01_0017 : Poly :=
[
  term ((-93540257301240000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 1. -/
theorem ep_Q2_020_partial_01_0017_valid :
    mulPoly ep_Q2_020_coefficient_01_0017
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0018 : Poly :=
[
  term ((137625893623030284 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 1. -/
def ep_Q2_020_partial_01_0018 : Poly :=
[
  term ((275251787246060568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-137625893623030284 : Rat) / 28298395017400811) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-137625893623030284 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((275251787246060568 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 1. -/
theorem ep_Q2_020_partial_01_0018_valid :
    mulPoly ep_Q2_020_coefficient_01_0018
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0019 : Poly :=
[
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 1. -/
def ep_Q2_020_partial_01_0019 : Poly :=
[
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 1. -/
theorem ep_Q2_020_partial_01_0019_valid :
    mulPoly ep_Q2_020_coefficient_01_0019
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0020 : Poly :=
[
  term ((536572195550064 : Rat) / 1230365000756557) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 1. -/
def ep_Q2_020_partial_01_0020 : Poly :=
[
  term ((1073144391100128 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-536572195550064 : Rat) / 1230365000756557) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-536572195550064 : Rat) / 1230365000756557) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 1. -/
theorem ep_Q2_020_partial_01_0020_valid :
    mulPoly ep_Q2_020_coefficient_01_0020
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0021 : Poly :=
[
  term ((60834190590904884 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 1. -/
def ep_Q2_020_partial_01_0021 : Poly :=
[
  term ((121668381181809768 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 1), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 1. -/
theorem ep_Q2_020_partial_01_0021_valid :
    mulPoly ep_Q2_020_coefficient_01_0021
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0022 : Poly :=
[
  term ((-31025583681556272 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 22 for generator 1. -/
def ep_Q2_020_partial_01_0022 : Poly :=
[
  term ((-62051167363112544 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((-62051167363112544 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((31025583681556272 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((31025583681556272 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 1. -/
theorem ep_Q2_020_partial_01_0022_valid :
    mulPoly ep_Q2_020_coefficient_01_0022
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0023 : Poly :=
[
  term ((-7860059053125894 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 23 for generator 1. -/
def ep_Q2_020_partial_01_0023 : Poly :=
[
  term ((-15720118106251788 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-15720118106251788 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((7860059053125894 : Rat) / 28298395017400811) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((7860059053125894 : Rat) / 28298395017400811) [(5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 1. -/
theorem ep_Q2_020_partial_01_0023_valid :
    mulPoly ep_Q2_020_coefficient_01_0023
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0024 : Poly :=
[
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 24 for generator 1. -/
def ep_Q2_020_partial_01_0024 : Poly :=
[
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 1. -/
theorem ep_Q2_020_partial_01_0024_valid :
    mulPoly ep_Q2_020_coefficient_01_0024
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0025 : Poly :=
[
  term ((-75847907662293888 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 25 for generator 1. -/
def ep_Q2_020_partial_01_0025 : Poly :=
[
  term ((-151695815324587776 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-151695815324587776 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 1. -/
theorem ep_Q2_020_partial_01_0025_valid :
    mulPoly ep_Q2_020_coefficient_01_0025
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0026 : Poly :=
[
  term ((-35209329935298948 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 1. -/
def ep_Q2_020_partial_01_0026 : Poly :=
[
  term ((-70418659870597896 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-70418659870597896 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((35209329935298948 : Rat) / 28298395017400811) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((35209329935298948 : Rat) / 28298395017400811) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 1. -/
theorem ep_Q2_020_partial_01_0026_valid :
    mulPoly ep_Q2_020_coefficient_01_0026
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0027 : Poly :=
[
  term ((-29960338320387882 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 1. -/
def ep_Q2_020_partial_01_0027 : Poly :=
[
  term ((-59920676640775764 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-59920676640775764 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((29960338320387882 : Rat) / 28298395017400811) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((29960338320387882 : Rat) / 28298395017400811) [(5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 1. -/
theorem ep_Q2_020_partial_01_0027_valid :
    mulPoly ep_Q2_020_coefficient_01_0027
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0028 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 1. -/
def ep_Q2_020_partial_01_0028 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 1. -/
theorem ep_Q2_020_partial_01_0028_valid :
    mulPoly ep_Q2_020_coefficient_01_0028
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0029 : Poly :=
[
  term ((1731606390260604 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 1. -/
def ep_Q2_020_partial_01_0029 : Poly :=
[
  term ((3463212780521208 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1731606390260604 : Rat) / 28298395017400811) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1731606390260604 : Rat) / 28298395017400811) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 1. -/
theorem ep_Q2_020_partial_01_0029_valid :
    mulPoly ep_Q2_020_coefficient_01_0029
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0030 : Poly :=
[
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 30 for generator 1. -/
def ep_Q2_020_partial_01_0030 : Poly :=
[
  term ((86356196329124304 : Rat) / 28298395017400811) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(6, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 1. -/
theorem ep_Q2_020_partial_01_0030_valid :
    mulPoly ep_Q2_020_coefficient_01_0030
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0031 : Poly :=
[
  term ((1198813092327900 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 31 for generator 1. -/
def ep_Q2_020_partial_01_0031 : Poly :=
[
  term ((2397626184655800 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((2397626184655800 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-1198813092327900 : Rat) / 28298395017400811) [(6, 1), (7, 2), (16, 1)],
  term ((-1198813092327900 : Rat) / 28298395017400811) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 1. -/
theorem ep_Q2_020_partial_01_0031_valid :
    mulPoly ep_Q2_020_coefficient_01_0031
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0032 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 32 for generator 1. -/
def ep_Q2_020_partial_01_0032 : Poly :=
[
  term ((-287840103203242512 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(6, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 1. -/
theorem ep_Q2_020_partial_01_0032_valid :
    mulPoly ep_Q2_020_coefficient_01_0032
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0033 : Poly :=
[
  term ((1404856917593526 : Rat) / 1230365000756557) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 33 for generator 1. -/
def ep_Q2_020_partial_01_0033 : Poly :=
[
  term ((2809713835187052 : Rat) / 1230365000756557) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((2809713835187052 : Rat) / 1230365000756557) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-1404856917593526 : Rat) / 1230365000756557) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1404856917593526 : Rat) / 1230365000756557) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 1. -/
theorem ep_Q2_020_partial_01_0033_valid :
    mulPoly ep_Q2_020_coefficient_01_0033
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0034 : Poly :=
[
  term ((126339731670460776 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 1. -/
def ep_Q2_020_partial_01_0034 : Poly :=
[
  term ((252679463340921552 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((252679463340921552 : Rat) / 28298395017400811) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-126339731670460776 : Rat) / 28298395017400811) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-126339731670460776 : Rat) / 28298395017400811) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 1. -/
theorem ep_Q2_020_partial_01_0034_valid :
    mulPoly ep_Q2_020_coefficient_01_0034
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0035 : Poly :=
[
  term ((31846734320062770 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 1. -/
def ep_Q2_020_partial_01_0035 : Poly :=
[
  term ((63693468640125540 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((63693468640125540 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-31846734320062770 : Rat) / 28298395017400811) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-31846734320062770 : Rat) / 28298395017400811) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 1. -/
theorem ep_Q2_020_partial_01_0035_valid :
    mulPoly ep_Q2_020_coefficient_01_0035
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0036 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 1. -/
def ep_Q2_020_partial_01_0036 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 1. -/
theorem ep_Q2_020_partial_01_0036_valid :
    mulPoly ep_Q2_020_coefficient_01_0036
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0037 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 37 for generator 1. -/
def ep_Q2_020_partial_01_0037 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 4), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 1. -/
theorem ep_Q2_020_partial_01_0037_valid :
    mulPoly ep_Q2_020_coefficient_01_0037
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0038 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 38 for generator 1. -/
def ep_Q2_020_partial_01_0038 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 3), (9, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 2), (7, 2), (9, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 4), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 1. -/
theorem ep_Q2_020_partial_01_0038_valid :
    mulPoly ep_Q2_020_coefficient_01_0038
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0039 : Poly :=
[
  term ((-276041519150400882 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 39 for generator 1. -/
def ep_Q2_020_partial_01_0039 : Poly :=
[
  term ((-552083038300801764 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-552083038300801764 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(7, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 1. -/
theorem ep_Q2_020_partial_01_0039_valid :
    mulPoly ep_Q2_020_coefficient_01_0039
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0040 : Poly :=
[
  term ((276041519150400882 : Rat) / 28298395017400811) [(8, 1), (16, 1)]
]

/-- Partial product 40 for generator 1. -/
def ep_Q2_020_partial_01_0040 : Poly :=
[
  term ((552083038300801764 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((552083038300801764 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(6, 2), (8, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 1. -/
theorem ep_Q2_020_partial_01_0040_valid :
    mulPoly ep_Q2_020_coefficient_01_0040
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0041 : Poly :=
[
  term ((289907621868945011 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 41 for generator 1. -/
def ep_Q2_020_partial_01_0041 : Poly :=
[
  term ((579815243737890022 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((579815243737890022 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-289907621868945011 : Rat) / 28298395017400811) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-289907621868945011 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 1. -/
theorem ep_Q2_020_partial_01_0041_valid :
    mulPoly ep_Q2_020_coefficient_01_0041
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0042 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 42 for generator 1. -/
def ep_Q2_020_partial_01_0042 : Poly :=
[
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 1. -/
theorem ep_Q2_020_partial_01_0042_valid :
    mulPoly ep_Q2_020_coefficient_01_0042
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0043 : Poly :=
[
  term ((75371576317876971 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 1. -/
def ep_Q2_020_partial_01_0043 : Poly :=
[
  term ((150743152635753942 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 1. -/
theorem ep_Q2_020_partial_01_0043_valid :
    mulPoly ep_Q2_020_coefficient_01_0043
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0044 : Poly :=
[
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 1. -/
def ep_Q2_020_partial_01_0044 : Poly :=
[
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 1. -/
theorem ep_Q2_020_partial_01_0044_valid :
    mulPoly ep_Q2_020_coefficient_01_0044
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0045 : Poly :=
[
  term ((-408289198336663233 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 1. -/
def ep_Q2_020_partial_01_0045 : Poly :=
[
  term ((-816578396673326466 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-816578396673326466 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((408289198336663233 : Rat) / 28298395017400811) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((408289198336663233 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 1. -/
theorem ep_Q2_020_partial_01_0045_valid :
    mulPoly ep_Q2_020_coefficient_01_0045
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0046 : Poly :=
[
  term ((-4797566462729128 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

/-- Partial product 46 for generator 1. -/
def ep_Q2_020_partial_01_0046 : Poly :=
[
  term ((-9595132925458256 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(6, 2), (9, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 1. -/
theorem ep_Q2_020_partial_01_0046_valid :
    mulPoly ep_Q2_020_coefficient_01_0046
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0047 : Poly :=
[
  term ((39624692328997500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 47 for generator 1. -/
def ep_Q2_020_partial_01_0047 : Poly :=
[
  term ((79249384657995000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((79249384657995000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-39624692328997500 : Rat) / 28298395017400811) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-39624692328997500 : Rat) / 28298395017400811) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 1. -/
theorem ep_Q2_020_partial_01_0047_valid :
    mulPoly ep_Q2_020_coefficient_01_0047
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0048 : Poly :=
[
  term ((23729559266150721 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 1. -/
def ep_Q2_020_partial_01_0048 : Poly :=
[
  term ((47459118532301442 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((47459118532301442 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-23729559266150721 : Rat) / 28298395017400811) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-23729559266150721 : Rat) / 28298395017400811) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 1. -/
theorem ep_Q2_020_partial_01_0048_valid :
    mulPoly ep_Q2_020_coefficient_01_0048
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0049 : Poly :=
[
  term ((1818383551586328 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 1. -/
def ep_Q2_020_partial_01_0049 : Poly :=
[
  term ((3636767103172656 : Rat) / 1230365000756557) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3636767103172656 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1818383551586328 : Rat) / 1230365000756557) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1818383551586328 : Rat) / 1230365000756557) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 1. -/
theorem ep_Q2_020_partial_01_0049_valid :
    mulPoly ep_Q2_020_coefficient_01_0049
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0050 : Poly :=
[
  term ((-1254553071203483757 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 1. -/
def ep_Q2_020_partial_01_0050 : Poly :=
[
  term ((-1254553071203483757 : Rat) / 56596790034801622) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1254553071203483757 : Rat) / 56596790034801622) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1254553071203483757 : Rat) / 113193580069603244) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1254553071203483757 : Rat) / 113193580069603244) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 1. -/
theorem ep_Q2_020_partial_01_0050_valid :
    mulPoly ep_Q2_020_coefficient_01_0050
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0051 : Poly :=
[
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (16, 1)]
]

/-- Partial product 51 for generator 1. -/
def ep_Q2_020_partial_01_0051 : Poly :=
[
  term ((589410376663348278 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(6, 2), (11, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 1. -/
theorem ep_Q2_020_partial_01_0051_valid :
    mulPoly ep_Q2_020_coefficient_01_0051
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0052 : Poly :=
[
  term ((-153192893822490915 : Rat) / 113193580069603244) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 52 for generator 1. -/
def ep_Q2_020_partial_01_0052 : Poly :=
[
  term ((-153192893822490915 : Rat) / 56596790034801622) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-153192893822490915 : Rat) / 56596790034801622) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((153192893822490915 : Rat) / 113193580069603244) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((153192893822490915 : Rat) / 113193580069603244) [(7, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 1. -/
theorem ep_Q2_020_partial_01_0052_valid :
    mulPoly ep_Q2_020_coefficient_01_0052
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0053 : Poly :=
[
  term ((-335013304433256441 : Rat) / 113193580069603244) [(12, 1), (16, 1)]
]

/-- Partial product 53 for generator 1. -/
def ep_Q2_020_partial_01_0053 : Poly :=
[
  term ((-335013304433256441 : Rat) / 56596790034801622) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-335013304433256441 : Rat) / 56596790034801622) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((335013304433256441 : Rat) / 113193580069603244) [(6, 2), (12, 1), (16, 1)],
  term ((335013304433256441 : Rat) / 113193580069603244) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 1. -/
theorem ep_Q2_020_partial_01_0053_valid :
    mulPoly ep_Q2_020_coefficient_01_0053
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0054 : Poly :=
[
  term ((113502610747420521 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

/-- Partial product 54 for generator 1. -/
def ep_Q2_020_partial_01_0054 : Poly :=
[
  term ((113502610747420521 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(6, 2), (12, 2), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(7, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 1. -/
theorem ep_Q2_020_partial_01_0054_valid :
    mulPoly ep_Q2_020_coefficient_01_0054
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0055 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 1. -/
def ep_Q2_020_partial_01_0055 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 1. -/
theorem ep_Q2_020_partial_01_0055_valid :
    mulPoly ep_Q2_020_coefficient_01_0055
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0056 : Poly :=
[
  term ((103309004574361005 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 1. -/
def ep_Q2_020_partial_01_0056 : Poly :=
[
  term ((103309004574361005 : Rat) / 56596790034801622) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((103309004574361005 : Rat) / 56596790034801622) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103309004574361005 : Rat) / 113193580069603244) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-103309004574361005 : Rat) / 113193580069603244) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 1. -/
theorem ep_Q2_020_partial_01_0056_valid :
    mulPoly ep_Q2_020_coefficient_01_0056
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0057 : Poly :=
[
  term ((-61971724584532767 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

/-- Partial product 57 for generator 1. -/
def ep_Q2_020_partial_01_0057 : Poly :=
[
  term ((-61971724584532767 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-61971724584532767 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((61971724584532767 : Rat) / 56596790034801622) [(6, 2), (13, 2), (16, 1)],
  term ((61971724584532767 : Rat) / 56596790034801622) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 1. -/
theorem ep_Q2_020_partial_01_0057_valid :
    mulPoly ep_Q2_020_coefficient_01_0057
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0058 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 58 for generator 1. -/
def ep_Q2_020_partial_01_0058 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 1. -/
theorem ep_Q2_020_partial_01_0058_valid :
    mulPoly ep_Q2_020_coefficient_01_0058
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0059 : Poly :=
[
  term ((893022100825424715 : Rat) / 226387160139206488) [(14, 1), (16, 1)]
]

/-- Partial product 59 for generator 1. -/
def ep_Q2_020_partial_01_0059 : Poly :=
[
  term ((893022100825424715 : Rat) / 113193580069603244) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((893022100825424715 : Rat) / 113193580069603244) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-893022100825424715 : Rat) / 226387160139206488) [(6, 2), (14, 1), (16, 1)],
  term ((-893022100825424715 : Rat) / 226387160139206488) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 1. -/
theorem ep_Q2_020_partial_01_0059_valid :
    mulPoly ep_Q2_020_coefficient_01_0059
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0060 : Poly :=
[
  term ((465714511921927797 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 60 for generator 1. -/
def ep_Q2_020_partial_01_0060 : Poly :=
[
  term ((465714511921927797 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((465714511921927797 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-465714511921927797 : Rat) / 56596790034801622) [(6, 2), (14, 2), (16, 1)],
  term ((-465714511921927797 : Rat) / 56596790034801622) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 1. -/
theorem ep_Q2_020_partial_01_0060_valid :
    mulPoly ep_Q2_020_coefficient_01_0060
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0061 : Poly :=
[
  term ((461600791756043973 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 61 for generator 1. -/
def ep_Q2_020_partial_01_0061 : Poly :=
[
  term ((461600791756043973 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((461600791756043973 : Rat) / 28298395017400811) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-461600791756043973 : Rat) / 56596790034801622) [(6, 2), (15, 2), (16, 1)],
  term ((-461600791756043973 : Rat) / 56596790034801622) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 1. -/
theorem ep_Q2_020_partial_01_0061_valid :
    mulPoly ep_Q2_020_coefficient_01_0061
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 1. -/
def ep_Q2_020_coefficient_01_0062 : Poly :=
[
  term ((-847996541106623053 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 62 for generator 1. -/
def ep_Q2_020_partial_01_0062 : Poly :=
[
  term ((-847996541106623053 : Rat) / 113193580069603244) [(0, 1), (6, 1), (16, 1)],
  term ((-847996541106623053 : Rat) / 113193580069603244) [(1, 1), (7, 1), (16, 1)],
  term ((847996541106623053 : Rat) / 226387160139206488) [(6, 2), (16, 1)],
  term ((847996541106623053 : Rat) / 226387160139206488) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 1. -/
theorem ep_Q2_020_partial_01_0062_valid :
    mulPoly ep_Q2_020_coefficient_01_0062
        ep_Q2_020_generator_01_0000_0062 =
      ep_Q2_020_partial_01_0062 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_01_0000_0062 : List Poly :=
[
  ep_Q2_020_partial_01_0000,
  ep_Q2_020_partial_01_0001,
  ep_Q2_020_partial_01_0002,
  ep_Q2_020_partial_01_0003,
  ep_Q2_020_partial_01_0004,
  ep_Q2_020_partial_01_0005,
  ep_Q2_020_partial_01_0006,
  ep_Q2_020_partial_01_0007,
  ep_Q2_020_partial_01_0008,
  ep_Q2_020_partial_01_0009,
  ep_Q2_020_partial_01_0010,
  ep_Q2_020_partial_01_0011,
  ep_Q2_020_partial_01_0012,
  ep_Q2_020_partial_01_0013,
  ep_Q2_020_partial_01_0014,
  ep_Q2_020_partial_01_0015,
  ep_Q2_020_partial_01_0016,
  ep_Q2_020_partial_01_0017,
  ep_Q2_020_partial_01_0018,
  ep_Q2_020_partial_01_0019,
  ep_Q2_020_partial_01_0020,
  ep_Q2_020_partial_01_0021,
  ep_Q2_020_partial_01_0022,
  ep_Q2_020_partial_01_0023,
  ep_Q2_020_partial_01_0024,
  ep_Q2_020_partial_01_0025,
  ep_Q2_020_partial_01_0026,
  ep_Q2_020_partial_01_0027,
  ep_Q2_020_partial_01_0028,
  ep_Q2_020_partial_01_0029,
  ep_Q2_020_partial_01_0030,
  ep_Q2_020_partial_01_0031,
  ep_Q2_020_partial_01_0032,
  ep_Q2_020_partial_01_0033,
  ep_Q2_020_partial_01_0034,
  ep_Q2_020_partial_01_0035,
  ep_Q2_020_partial_01_0036,
  ep_Q2_020_partial_01_0037,
  ep_Q2_020_partial_01_0038,
  ep_Q2_020_partial_01_0039,
  ep_Q2_020_partial_01_0040,
  ep_Q2_020_partial_01_0041,
  ep_Q2_020_partial_01_0042,
  ep_Q2_020_partial_01_0043,
  ep_Q2_020_partial_01_0044,
  ep_Q2_020_partial_01_0045,
  ep_Q2_020_partial_01_0046,
  ep_Q2_020_partial_01_0047,
  ep_Q2_020_partial_01_0048,
  ep_Q2_020_partial_01_0049,
  ep_Q2_020_partial_01_0050,
  ep_Q2_020_partial_01_0051,
  ep_Q2_020_partial_01_0052,
  ep_Q2_020_partial_01_0053,
  ep_Q2_020_partial_01_0054,
  ep_Q2_020_partial_01_0055,
  ep_Q2_020_partial_01_0056,
  ep_Q2_020_partial_01_0057,
  ep_Q2_020_partial_01_0058,
  ep_Q2_020_partial_01_0059,
  ep_Q2_020_partial_01_0060,
  ep_Q2_020_partial_01_0061,
  ep_Q2_020_partial_01_0062
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_01_0000_0062 : Poly :=
[
  term ((83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-239111305844619534 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-12468133626900612 : Rat) / 975806724737959) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((275251787246060568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((31247899218482724 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-307054479762195051 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 2), (9, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-62051167363112544 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((-15720118106251788 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-151695815324587776 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-70418659870597896 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-59920676640775764 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((2809713835187052 : Rat) / 1230365000756557) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((252679463340921552 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((63693468640125540 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-552083038300801764 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((552083038300801764 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((579815243737890022 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-816578396673326466 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((79249384657995000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((47459118532301442 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3636767103172656 : Rat) / 1230365000756557) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1254553071203483757 : Rat) / 56596790034801622) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-153192893822490915 : Rat) / 56596790034801622) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-335013304433256441 : Rat) / 56596790034801622) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((103309004574361005 : Rat) / 56596790034801622) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61971724584532767 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((893022100825424715 : Rat) / 113193580069603244) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((465714511921927797 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((461600791756043973 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-847996541106623053 : Rat) / 113193580069603244) [(0, 1), (6, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((70732246719882942 : Rat) / 28298395017400811) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((311849732131506651 : Rat) / 56596790034801622) [(0, 1), (6, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((307054479762195051 : Rat) / 56596790034801622) [(0, 1), (7, 2), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 3), (9, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((31247899218482724 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-307054479762195051 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-62051167363112544 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-151695815324587776 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-70418659870597896 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-59920676640775764 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((-12834107455817448 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((2397626184655800 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((119555652922309767 : Rat) / 28298395017400811) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((6234066813450306 : Rat) / 975806724737959) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-137625893623030284 : Rat) / 28298395017400811) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-536572195550064 : Rat) / 1230365000756557) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-552083038300801764 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((552083038300801764 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((579815243737890022 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-816578396673326466 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((79249384657995000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((47459118532301442 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3636767103172656 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1254553071203483757 : Rat) / 56596790034801622) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-153192893822490915 : Rat) / 56596790034801622) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-335013304433256441 : Rat) / 56596790034801622) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((103309004574361005 : Rat) / 56596790034801622) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61971724584532767 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((893022100825424715 : Rat) / 113193580069603244) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((465714511921927797 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((461600791756043973 : Rat) / 28298395017400811) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-847996541106623053 : Rat) / 113193580069603244) [(1, 1), (7, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((184179071131611963 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((433467400930980426 : Rat) / 28298395017400811) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-73932424982904744 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((83605540570096032 : Rat) / 28298395017400811) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 3), (9, 2), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(1, 1), (7, 3), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-239111305844619534 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-12468133626900612 : Rat) / 975806724737959) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((275251787246060568 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((31025583681556272 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((31025583681556272 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)],
  term ((7860059053125894 : Rat) / 28298395017400811) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((35209329935298948 : Rat) / 28298395017400811) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((29960338320387882 : Rat) / 28298395017400811) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1731606390260604 : Rat) / 28298395017400811) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((35209329935298948 : Rat) / 28298395017400811) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((29960338320387882 : Rat) / 28298395017400811) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1731606390260604 : Rat) / 28298395017400811) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((7860059053125894 : Rat) / 28298395017400811) [(5, 1), (7, 3), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1198813092327900 : Rat) / 28298395017400811) [(6, 1), (7, 2), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(6, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1404856917593526 : Rat) / 1230365000756557) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-126339731670460776 : Rat) / 28298395017400811) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-31846734320062770 : Rat) / 28298395017400811) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 2), (7, 2), (9, 2), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(6, 2), (8, 1), (16, 1)],
  term ((-289907621868945011 : Rat) / 28298395017400811) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((408289198336663233 : Rat) / 28298395017400811) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(6, 2), (9, 2), (16, 1)],
  term ((-39624692328997500 : Rat) / 28298395017400811) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23729559266150721 : Rat) / 28298395017400811) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1818383551586328 : Rat) / 1230365000756557) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1254553071203483757 : Rat) / 113193580069603244) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(6, 2), (11, 2), (16, 1)],
  term ((153192893822490915 : Rat) / 113193580069603244) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((335013304433256441 : Rat) / 113193580069603244) [(6, 2), (12, 1), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(6, 2), (12, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103309004574361005 : Rat) / 113193580069603244) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((61971724584532767 : Rat) / 56596790034801622) [(6, 2), (13, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-893022100825424715 : Rat) / 226387160139206488) [(6, 2), (14, 1), (16, 1)],
  term ((-465714511921927797 : Rat) / 56596790034801622) [(6, 2), (14, 2), (16, 1)],
  term ((-461600791756043973 : Rat) / 56596790034801622) [(6, 2), (15, 2), (16, 1)],
  term ((847996541106623053 : Rat) / 226387160139206488) [(6, 2), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(6, 3), (14, 1), (16, 1)],
  term ((-1198813092327900 : Rat) / 28298395017400811) [(6, 3), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)],
  term ((-289907621868945011 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((408289198336663233 : Rat) / 28298395017400811) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)],
  term ((-39624692328997500 : Rat) / 28298395017400811) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23729559266150721 : Rat) / 28298395017400811) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1818383551586328 : Rat) / 1230365000756557) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1254553071203483757 : Rat) / 113193580069603244) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(7, 2), (11, 2), (16, 1)],
  term ((153192893822490915 : Rat) / 113193580069603244) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((335013304433256441 : Rat) / 113193580069603244) [(7, 2), (12, 1), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(7, 2), (12, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103309004574361005 : Rat) / 113193580069603244) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((61971724584532767 : Rat) / 56596790034801622) [(7, 2), (13, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-893022100825424715 : Rat) / 226387160139206488) [(7, 2), (14, 1), (16, 1)],
  term ((-465714511921927797 : Rat) / 56596790034801622) [(7, 2), (14, 2), (16, 1)],
  term ((-461600791756043973 : Rat) / 56596790034801622) [(7, 2), (15, 2), (16, 1)],
  term ((847996541106623053 : Rat) / 226387160139206488) [(7, 2), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 3), (9, 1), (14, 1), (16, 1)],
  term ((-1404856917593526 : Rat) / 1230365000756557) [(7, 3), (9, 1), (16, 1)],
  term ((-126339731670460776 : Rat) / 28298395017400811) [(7, 3), (11, 1), (16, 1)],
  term ((-31846734320062770 : Rat) / 28298395017400811) [(7, 3), (13, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 3), (15, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 4), (9, 1), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 4), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 0 through 62. -/
theorem ep_Q2_020_block_01_0000_0062_valid :
    checkProductSumEq ep_Q2_020_partials_01_0000_0062
      ep_Q2_020_block_01_0000_0062 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
