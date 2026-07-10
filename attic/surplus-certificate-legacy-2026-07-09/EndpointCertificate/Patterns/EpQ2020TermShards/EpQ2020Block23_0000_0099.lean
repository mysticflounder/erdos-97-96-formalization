/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 23:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_23_0000_0099 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0000 : Poly :=
[
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 23. -/
def ep_Q2_020_partial_23_0000 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem ep_Q2_020_partial_23_0000_valid :
    mulPoly ep_Q2_020_coefficient_23_0000
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0001 : Poly :=
[
  term ((-83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 1 for generator 23. -/
def ep_Q2_020_partial_23_0001 : Poly :=
[
  term ((-166234213465017984 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-166234213465017984 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (14, 2), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem ep_Q2_020_partial_23_0001_valid :
    mulPoly ep_Q2_020_coefficient_23_0001
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0002 : Poly :=
[
  term ((-67188984011146392 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 23. -/
def ep_Q2_020_partial_23_0002 : Poly :=
[
  term ((-134377968022292784 : Rat) / 28298395017400811) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem ep_Q2_020_partial_23_0002_valid :
    mulPoly ep_Q2_020_coefficient_23_0002
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0003 : Poly :=
[
  term ((295107209334679176 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 23. -/
def ep_Q2_020_partial_23_0003 : Poly :=
[
  term ((590214418669358352 : Rat) / 28298395017400811) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((590214418669358352 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-295107209334679176 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-295107209334679176 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem ep_Q2_020_partial_23_0003_valid :
    mulPoly ep_Q2_020_coefficient_23_0003
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0004 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 23. -/
def ep_Q2_020_partial_23_0004 : Poly :=
[
  term ((8585155128801024 : Rat) / 1230365000756557) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8585155128801024 : Rat) / 1230365000756557) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem ep_Q2_020_partial_23_0004_valid :
    mulPoly ep_Q2_020_coefficient_23_0004
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0005 : Poly :=
[
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 5 for generator 23. -/
def ep_Q2_020_partial_23_0005 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem ep_Q2_020_partial_23_0005_valid :
    mulPoly ep_Q2_020_coefficient_23_0005
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0006 : Poly :=
[
  term ((107782681061761224 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 6 for generator 23. -/
def ep_Q2_020_partial_23_0006 : Poly :=
[
  term ((215565362123522448 : Rat) / 28298395017400811) [(0, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((215565362123522448 : Rat) / 28298395017400811) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-107782681061761224 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((-107782681061761224 : Rat) / 28298395017400811) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 23. -/
theorem ep_Q2_020_partial_23_0006_valid :
    mulPoly ep_Q2_020_coefficient_23_0006
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0007 : Poly :=
[
  term ((-17316063902606040 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 7 for generator 23. -/
def ep_Q2_020_partial_23_0007 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 23. -/
theorem ep_Q2_020_partial_23_0007_valid :
    mulPoly ep_Q2_020_coefficient_23_0007
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0008 : Poly :=
[
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 8 for generator 23. -/
def ep_Q2_020_partial_23_0008 : Poly :=
[
  term ((46176170406949440 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((46176170406949440 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 23. -/
theorem ep_Q2_020_partial_23_0008_valid :
    mulPoly ep_Q2_020_coefficient_23_0008
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0009 : Poly :=
[
  term ((38672542715820156 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 23. -/
def ep_Q2_020_partial_23_0009 : Poly :=
[
  term ((77345085431640312 : Rat) / 28298395017400811) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38672542715820156 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-38672542715820156 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((77345085431640312 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 23. -/
theorem ep_Q2_020_partial_23_0009_valid :
    mulPoly ep_Q2_020_coefficient_23_0009
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0010 : Poly :=
[
  term ((6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 23. -/
def ep_Q2_020_partial_23_0010 : Poly :=
[
  term ((13852851122084832 : Rat) / 28298395017400811) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13852851122084832 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 23. -/
theorem ep_Q2_020_partial_23_0010_valid :
    mulPoly ep_Q2_020_coefficient_23_0010
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0011 : Poly :=
[
  term ((-196799845703215656 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 11 for generator 23. -/
def ep_Q2_020_partial_23_0011 : Poly :=
[
  term ((-393599691406431312 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-393599691406431312 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((196799845703215656 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((196799845703215656 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 23. -/
theorem ep_Q2_020_partial_23_0011_valid :
    mulPoly ep_Q2_020_coefficient_23_0011
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0012 : Poly :=
[
  term ((79221249752356476 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 23. -/
def ep_Q2_020_partial_23_0012 : Poly :=
[
  term ((158442499504712952 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((158442499504712952 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-79221249752356476 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-79221249752356476 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 23. -/
theorem ep_Q2_020_partial_23_0012_valid :
    mulPoly ep_Q2_020_coefficient_23_0012
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0013 : Poly :=
[
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 23. -/
def ep_Q2_020_partial_23_0013 : Poly :=
[
  term ((-31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 23. -/
theorem ep_Q2_020_partial_23_0013_valid :
    mulPoly ep_Q2_020_coefficient_23_0013
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0014 : Poly :=
[
  term ((19487553604425000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 23. -/
def ep_Q2_020_partial_23_0014 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 23. -/
theorem ep_Q2_020_partial_23_0014_valid :
    mulPoly ep_Q2_020_coefficient_23_0014
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0015 : Poly :=
[
  term ((894286992583440 : Rat) / 1230365000756557) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 23. -/
def ep_Q2_020_partial_23_0015 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 23. -/
theorem ep_Q2_020_partial_23_0015_valid :
    mulPoly ep_Q2_020_coefficient_23_0015
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0016 : Poly :=
[
  term ((28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 23. -/
def ep_Q2_020_partial_23_0016 : Poly :=
[
  term ((56773017604985484 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((56773017604985484 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 23. -/
theorem ep_Q2_020_partial_23_0016_valid :
    mulPoly ep_Q2_020_coefficient_23_0016
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0017 : Poly :=
[
  term ((-227550356839339176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 23. -/
def ep_Q2_020_partial_23_0017 : Poly :=
[
  term ((-455100713678678352 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-455100713678678352 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((227550356839339176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((227550356839339176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 23. -/
theorem ep_Q2_020_partial_23_0017_valid :
    mulPoly ep_Q2_020_coefficient_23_0017
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0018 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 23. -/
def ep_Q2_020_partial_23_0018 : Poly :=
[
  term ((-2384765313555840 : Rat) / 1230365000756557) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2384765313555840 : Rat) / 1230365000756557) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 23. -/
theorem ep_Q2_020_partial_23_0018_valid :
    mulPoly ep_Q2_020_coefficient_23_0018
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0019 : Poly :=
[
  term ((77604950417307300 : Rat) / 28298395017400811) [(0, 1), (9, 2), (16, 1)]
]

/-- Partial product 19 for generator 23. -/
def ep_Q2_020_partial_23_0019 : Poly :=
[
  term ((155209900834614600 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((155209900834614600 : Rat) / 28298395017400811) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-77604950417307300 : Rat) / 28298395017400811) [(0, 1), (9, 2), (14, 2), (16, 1)],
  term ((-77604950417307300 : Rat) / 28298395017400811) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 23. -/
theorem ep_Q2_020_partial_23_0019_valid :
    mulPoly ep_Q2_020_coefficient_23_0019
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0020 : Poly :=
[
  term ((-43522203049882500 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 23. -/
def ep_Q2_020_partial_23_0020 : Poly :=
[
  term ((-87044406099765000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((43522203049882500 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((43522203049882500 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87044406099765000 : Rat) / 28298395017400811) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 23. -/
theorem ep_Q2_020_partial_23_0020_valid :
    mulPoly ep_Q2_020_coefficient_23_0020
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0021 : Poly :=
[
  term ((-1997240950103016 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 23. -/
def ep_Q2_020_partial_23_0021 : Poly :=
[
  term ((-3994481900206032 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1997240950103016 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1997240950103016 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3994481900206032 : Rat) / 1230365000756557) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 23. -/
theorem ep_Q2_020_partial_23_0021_valid :
    mulPoly ep_Q2_020_coefficient_23_0021
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0022 : Poly :=
[
  term ((813239842215664911 : Rat) / 56596790034801622) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 22 for generator 23. -/
def ep_Q2_020_partial_23_0022 : Poly :=
[
  term ((813239842215664911 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((813239842215664911 : Rat) / 28298395017400811) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-813239842215664911 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-813239842215664911 : Rat) / 56596790034801622) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 23. -/
theorem ep_Q2_020_partial_23_0022_valid :
    mulPoly ep_Q2_020_coefficient_23_0022
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0023 : Poly :=
[
  term ((-7795021441770000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 23. -/
def ep_Q2_020_partial_23_0023 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 23. -/
theorem ep_Q2_020_partial_23_0023_valid :
    mulPoly ep_Q2_020_coefficient_23_0023
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0024 : Poly :=
[
  term ((2369860530346116 : Rat) / 1230365000756557) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 24 for generator 23. -/
def ep_Q2_020_partial_23_0024 : Poly :=
[
  term ((4739721060692232 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((4739721060692232 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2369860530346116 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2369860530346116 : Rat) / 1230365000756557) [(0, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 23. -/
theorem ep_Q2_020_partial_23_0024_valid :
    mulPoly ep_Q2_020_coefficient_23_0024
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0025 : Poly :=
[
  term ((-357714797033376 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 25 for generator 23. -/
def ep_Q2_020_partial_23_0025 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 23. -/
theorem ep_Q2_020_partial_23_0025_valid :
    mulPoly ep_Q2_020_coefficient_23_0025
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0026 : Poly :=
[
  term ((-2983484882319915643 : Rat) / 113193580069603244) [(0, 1), (16, 1)]
]

/-- Partial product 26 for generator 23. -/
def ep_Q2_020_partial_23_0026 : Poly :=
[
  term ((-2983484882319915643 : Rat) / 56596790034801622) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2983484882319915643 : Rat) / 56596790034801622) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((2983484882319915643 : Rat) / 113193580069603244) [(0, 1), (14, 2), (16, 1)],
  term ((2983484882319915643 : Rat) / 113193580069603244) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 23. -/
theorem ep_Q2_020_partial_23_0026_valid :
    mulPoly ep_Q2_020_coefficient_23_0026
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0027 : Poly :=
[
  term ((-33594492005573196 : Rat) / 28298395017400811) [(0, 2), (16, 1)]
]

/-- Partial product 27 for generator 23. -/
def ep_Q2_020_partial_23_0027 : Poly :=
[
  term ((-67188984011146392 : Rat) / 28298395017400811) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-67188984011146392 : Rat) / 28298395017400811) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((33594492005573196 : Rat) / 28298395017400811) [(0, 2), (14, 2), (16, 1)],
  term ((33594492005573196 : Rat) / 28298395017400811) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 23. -/
theorem ep_Q2_020_partial_23_0027_valid :
    mulPoly ep_Q2_020_coefficient_23_0027
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0028 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (16, 1)]
]

/-- Partial product 28 for generator 23. -/
def ep_Q2_020_partial_23_0028 : Poly :=
[
  term ((742179327954631344 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (14, 2), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 23. -/
theorem ep_Q2_020_partial_23_0028_valid :
    mulPoly ep_Q2_020_coefficient_23_0028
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0029 : Poly :=
[
  term ((175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 29 for generator 23. -/
def ep_Q2_020_partial_23_0029 : Poly :=
[
  term ((351051911287072128 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((351051911287072128 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 23. -/
theorem ep_Q2_020_partial_23_0029_valid :
    mulPoly ep_Q2_020_coefficient_23_0029
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0030 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 30 for generator 23. -/
def ep_Q2_020_partial_23_0030 : Poly :=
[
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 23. -/
theorem ep_Q2_020_partial_23_0030_valid :
    mulPoly ep_Q2_020_coefficient_23_0030
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0031 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 31 for generator 23. -/
def ep_Q2_020_partial_23_0031 : Poly :=
[
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 23. -/
theorem ep_Q2_020_partial_23_0031_valid :
    mulPoly ep_Q2_020_coefficient_23_0031
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0032 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 23. -/
def ep_Q2_020_partial_23_0032 : Poly :=
[
  term ((-690727606191489504 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 23. -/
theorem ep_Q2_020_partial_23_0032_valid :
    mulPoly ep_Q2_020_coefficient_23_0032
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0033 : Poly :=
[
  term ((979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 23. -/
def ep_Q2_020_partial_23_0033 : Poly :=
[
  term ((979528844998953843 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 23. -/
theorem ep_Q2_020_partial_23_0033_valid :
    mulPoly ep_Q2_020_coefficient_23_0033
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0034 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 23. -/
def ep_Q2_020_partial_23_0034 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 23. -/
theorem ep_Q2_020_partial_23_0034_valid :
    mulPoly ep_Q2_020_coefficient_23_0034
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0035 : Poly :=
[
  term ((140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (16, 1)]
]

/-- Partial product 35 for generator 23. -/
def ep_Q2_020_partial_23_0035 : Poly :=
[
  term ((281272938854905152 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((281272938854905152 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 23. -/
theorem ep_Q2_020_partial_23_0035_valid :
    mulPoly ep_Q2_020_coefficient_23_0035
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0036 : Poly :=
[
  term ((160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 23. -/
def ep_Q2_020_partial_23_0036 : Poly :=
[
  term ((320436771763309902 : Rat) / 975806724737959) [(1, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((320436771763309902 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 23. -/
theorem ep_Q2_020_partial_23_0036_valid :
    mulPoly ep_Q2_020_coefficient_23_0036
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0037 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 23. -/
def ep_Q2_020_partial_23_0037 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 23. -/
theorem ep_Q2_020_partial_23_0037_valid :
    mulPoly ep_Q2_020_coefficient_23_0037
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0038 : Poly :=
[
  term ((2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 38 for generator 23. -/
def ep_Q2_020_partial_23_0038 : Poly :=
[
  term ((4163688479918734536 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((4163688479918734536 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 23. -/
theorem ep_Q2_020_partial_23_0038_valid :
    mulPoly ep_Q2_020_coefficient_23_0038
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0039 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 23. -/
def ep_Q2_020_partial_23_0039 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (3, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 23. -/
theorem ep_Q2_020_partial_23_0039_valid :
    mulPoly ep_Q2_020_coefficient_23_0039
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0040 : Poly :=
[
  term ((-200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 40 for generator 23. -/
def ep_Q2_020_partial_23_0040 : Poly :=
[
  term ((-200042314802096763 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 23. -/
theorem ep_Q2_020_partial_23_0040_valid :
    mulPoly ep_Q2_020_coefficient_23_0040
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0041 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 41 for generator 23. -/
def ep_Q2_020_partial_23_0041 : Poly :=
[
  term ((-742179327954631344 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 23. -/
theorem ep_Q2_020_partial_23_0041_valid :
    mulPoly ep_Q2_020_coefficient_23_0041
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0042 : Poly :=
[
  term ((-67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 42 for generator 23. -/
def ep_Q2_020_partial_23_0042 : Poly :=
[
  term ((-135171833884640244 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-135171833884640244 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 23. -/
theorem ep_Q2_020_partial_23_0042_valid :
    mulPoly ep_Q2_020_coefficient_23_0042
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0043 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 43 for generator 23. -/
def ep_Q2_020_partial_23_0043 : Poly :=
[
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 23. -/
theorem ep_Q2_020_partial_23_0043_valid :
    mulPoly ep_Q2_020_coefficient_23_0043
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0044 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 23. -/
def ep_Q2_020_partial_23_0044 : Poly :=
[
  term ((3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 23. -/
theorem ep_Q2_020_partial_23_0044_valid :
    mulPoly ep_Q2_020_coefficient_23_0044
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0045 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 23. -/
def ep_Q2_020_partial_23_0045 : Poly :=
[
  term ((690727606191489504 : Rat) / 28298395017400811) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 23. -/
theorem ep_Q2_020_partial_23_0045_valid :
    mulPoly ep_Q2_020_coefficient_23_0045
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0046 : Poly :=
[
  term ((-30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 23. -/
def ep_Q2_020_partial_23_0046 : Poly :=
[
  term ((-61668711084931578 : Rat) / 975806724737959) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61668711084931578 : Rat) / 975806724737959) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 23. -/
theorem ep_Q2_020_partial_23_0046_valid :
    mulPoly ep_Q2_020_coefficient_23_0046
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0047 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 47 for generator 23. -/
def ep_Q2_020_partial_23_0047 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 23. -/
theorem ep_Q2_020_partial_23_0047_valid :
    mulPoly ep_Q2_020_coefficient_23_0047
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0048 : Poly :=
[
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 48 for generator 23. -/
def ep_Q2_020_partial_23_0048 : Poly :=
[
  term ((166234213465017984 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((166234213465017984 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 23. -/
theorem ep_Q2_020_partial_23_0048_valid :
    mulPoly ep_Q2_020_coefficient_23_0048
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0049 : Poly :=
[
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 49 for generator 23. -/
def ep_Q2_020_partial_23_0049 : Poly :=
[
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 23. -/
theorem ep_Q2_020_partial_23_0049_valid :
    mulPoly ep_Q2_020_coefficient_23_0049
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0050 : Poly :=
[
  term ((13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 50 for generator 23. -/
def ep_Q2_020_partial_23_0050 : Poly :=
[
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 23. -/
theorem ep_Q2_020_partial_23_0050_valid :
    mulPoly ep_Q2_020_coefficient_23_0050
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0051 : Poly :=
[
  term ((-27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 51 for generator 23. -/
def ep_Q2_020_partial_23_0051 : Poly :=
[
  term ((-55411404488339328 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-55411404488339328 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 23. -/
theorem ep_Q2_020_partial_23_0051_valid :
    mulPoly ep_Q2_020_coefficient_23_0051
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0052 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 52 for generator 23. -/
def ep_Q2_020_partial_23_0052 : Poly :=
[
  term ((171490471718940000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((171490471718940000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 23. -/
theorem ep_Q2_020_partial_23_0052_valid :
    mulPoly ep_Q2_020_coefficient_23_0052
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0053 : Poly :=
[
  term ((104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 23. -/
def ep_Q2_020_partial_23_0053 : Poly :=
[
  term ((208709389543057920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((208709389543057920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 23. -/
theorem ep_Q2_020_partial_23_0053_valid :
    mulPoly ep_Q2_020_coefficient_23_0053
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0054 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 23. -/
def ep_Q2_020_partial_23_0054 : Poly :=
[
  term ((-155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 23. -/
theorem ep_Q2_020_partial_23_0054_valid :
    mulPoly ep_Q2_020_coefficient_23_0054
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0055 : Poly :=
[
  term ((-3463212780521208 : Rat) / 975806724737959) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 23. -/
def ep_Q2_020_partial_23_0055 : Poly :=
[
  term ((-6926425561042416 : Rat) / 975806724737959) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((-6926425561042416 : Rat) / 975806724737959) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 975806724737959) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((3463212780521208 : Rat) / 975806724737959) [(1, 1), (5, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 23. -/
theorem ep_Q2_020_partial_23_0055_valid :
    mulPoly ep_Q2_020_coefficient_23_0055
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0056 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 56 for generator 23. -/
def ep_Q2_020_partial_23_0056 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 23. -/
theorem ep_Q2_020_partial_23_0056_valid :
    mulPoly ep_Q2_020_coefficient_23_0056
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0057 : Poly :=
[
  term ((-127917603932309547 : Rat) / 56596790034801622) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 57 for generator 23. -/
def ep_Q2_020_partial_23_0057 : Poly :=
[
  term ((-127917603932309547 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-127917603932309547 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((127917603932309547 : Rat) / 56596790034801622) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((127917603932309547 : Rat) / 56596790034801622) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 23. -/
theorem ep_Q2_020_partial_23_0057_valid :
    mulPoly ep_Q2_020_coefficient_23_0057
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0058 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

/-- Partial product 58 for generator 23. -/
def ep_Q2_020_partial_23_0058 : Poly :=
[
  term ((-152381362342933152 : Rat) / 28298395017400811) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (14, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-152381362342933152 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 23. -/
theorem ep_Q2_020_partial_23_0058_valid :
    mulPoly ep_Q2_020_coefficient_23_0058
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0059 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 23. -/
def ep_Q2_020_partial_23_0059 : Poly :=
[
  term ((138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 23. -/
theorem ep_Q2_020_partial_23_0059_valid :
    mulPoly ep_Q2_020_coefficient_23_0059
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0060 : Poly :=
[
  term ((-57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 60 for generator 23. -/
def ep_Q2_020_partial_23_0060 : Poly :=
[
  term ((-115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 23. -/
theorem ep_Q2_020_partial_23_0060_valid :
    mulPoly ep_Q2_020_coefficient_23_0060
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0061 : Poly :=
[
  term ((215585010587983608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 23. -/
def ep_Q2_020_partial_23_0061 : Poly :=
[
  term ((431170021175967216 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((431170021175967216 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-215585010587983608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-215585010587983608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 23. -/
theorem ep_Q2_020_partial_23_0061_valid :
    mulPoly ep_Q2_020_coefficient_23_0061
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0062 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 23. -/
def ep_Q2_020_partial_23_0062 : Poly :=
[
  term ((3934862767367136 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 23. -/
theorem ep_Q2_020_partial_23_0062_valid :
    mulPoly ep_Q2_020_coefficient_23_0062
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0063 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 63 for generator 23. -/
def ep_Q2_020_partial_23_0063 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 23. -/
theorem ep_Q2_020_partial_23_0063_valid :
    mulPoly ep_Q2_020_coefficient_23_0063
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0064 : Poly :=
[
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 64 for generator 23. -/
def ep_Q2_020_partial_23_0064 : Poly :=
[
  term ((-187080514602480000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-187080514602480000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 23. -/
theorem ep_Q2_020_partial_23_0064_valid :
    mulPoly ep_Q2_020_coefficient_23_0064
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0065 : Poly :=
[
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 23. -/
def ep_Q2_020_partial_23_0065 : Poly :=
[
  term ((-8585155128801024 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8585155128801024 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 23. -/
theorem ep_Q2_020_partial_23_0065_valid :
    mulPoly ep_Q2_020_coefficient_23_0065
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0066 : Poly :=
[
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 66 for generator 23. -/
def ep_Q2_020_partial_23_0066 : Poly :=
[
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 23. -/
theorem ep_Q2_020_partial_23_0066_valid :
    mulPoly ep_Q2_020_coefficient_23_0066
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0067 : Poly :=
[
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 23. -/
def ep_Q2_020_partial_23_0067 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 23. -/
theorem ep_Q2_020_partial_23_0067_valid :
    mulPoly ep_Q2_020_coefficient_23_0067
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0068 : Poly :=
[
  term ((-232780215394889097 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 68 for generator 23. -/
def ep_Q2_020_partial_23_0068 : Poly :=
[
  term ((-465560430789778194 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-465560430789778194 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((232780215394889097 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((232780215394889097 : Rat) / 28298395017400811) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 23. -/
theorem ep_Q2_020_partial_23_0068_valid :
    mulPoly ep_Q2_020_coefficient_23_0068
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0069 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 69 for generator 23. -/
def ep_Q2_020_partial_23_0069 : Poly :=
[
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 23. -/
theorem ep_Q2_020_partial_23_0069_valid :
    mulPoly ep_Q2_020_coefficient_23_0069
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0070 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 23. -/
def ep_Q2_020_partial_23_0070 : Poly :=
[
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 23. -/
theorem ep_Q2_020_partial_23_0070_valid :
    mulPoly ep_Q2_020_coefficient_23_0070
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0071 : Poly :=
[
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 71 for generator 23. -/
def ep_Q2_020_partial_23_0071 : Poly :=
[
  term ((-118610657023559616 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-118610657023559616 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 23. -/
theorem ep_Q2_020_partial_23_0071_valid :
    mulPoly ep_Q2_020_coefficient_23_0071
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0072 : Poly :=
[
  term ((105180844467982926 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 72 for generator 23. -/
def ep_Q2_020_partial_23_0072 : Poly :=
[
  term ((210361688935965852 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((210361688935965852 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-105180844467982926 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-105180844467982926 : Rat) / 28298395017400811) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 23. -/
theorem ep_Q2_020_partial_23_0072_valid :
    mulPoly ep_Q2_020_coefficient_23_0072
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0073 : Poly :=
[
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 23. -/
def ep_Q2_020_partial_23_0073 : Poly :=
[
  term ((62360171534160000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((62360171534160000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 23. -/
theorem ep_Q2_020_partial_23_0073_valid :
    mulPoly ep_Q2_020_coefficient_23_0073
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0074 : Poly :=
[
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 23. -/
def ep_Q2_020_partial_23_0074 : Poly :=
[
  term ((2861718376267008 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2861718376267008 : Rat) / 1230365000756557) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 23. -/
theorem ep_Q2_020_partial_23_0074_valid :
    mulPoly ep_Q2_020_coefficient_23_0074
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0075 : Poly :=
[
  term ((164030632278182688 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 75 for generator 23. -/
def ep_Q2_020_partial_23_0075 : Poly :=
[
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-164030632278182688 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-164030632278182688 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 23. -/
theorem ep_Q2_020_partial_23_0075_valid :
    mulPoly ep_Q2_020_coefficient_23_0075
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0076 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 23. -/
def ep_Q2_020_partial_23_0076 : Poly :=
[
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 23. -/
theorem ep_Q2_020_partial_23_0076_valid :
    mulPoly ep_Q2_020_coefficient_23_0076
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0077 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 23. -/
def ep_Q2_020_partial_23_0077 : Poly :=
[
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 23. -/
theorem ep_Q2_020_partial_23_0077_valid :
    mulPoly ep_Q2_020_coefficient_23_0077
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0078 : Poly :=
[
  term ((85119343610157697 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 78 for generator 23. -/
def ep_Q2_020_partial_23_0078 : Poly :=
[
  term ((170238687220315394 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-85119343610157697 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-85119343610157697 : Rat) / 28298395017400811) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((170238687220315394 : Rat) / 28298395017400811) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 23. -/
theorem ep_Q2_020_partial_23_0078_valid :
    mulPoly ep_Q2_020_coefficient_23_0078
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0079 : Poly :=
[
  term ((-328061264556365376 : Rat) / 28298395017400811) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 23. -/
def ep_Q2_020_partial_23_0079 : Poly :=
[
  term ((-656122529112730752 : Rat) / 28298395017400811) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-656122529112730752 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 23. -/
theorem ep_Q2_020_partial_23_0079_valid :
    mulPoly ep_Q2_020_coefficient_23_0079
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0080 : Poly :=
[
  term ((3897510720885000 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 80 for generator 23. -/
def ep_Q2_020_partial_23_0080 : Poly :=
[
  term ((7795021441770000 : Rat) / 975806724737959) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 975806724737959) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 23. -/
theorem ep_Q2_020_partial_23_0080_valid :
    mulPoly ep_Q2_020_coefficient_23_0080
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0081 : Poly :=
[
  term ((3490649503886787285 : Rat) / 113193580069603244) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 81 for generator 23. -/
def ep_Q2_020_partial_23_0081 : Poly :=
[
  term ((3490649503886787285 : Rat) / 56596790034801622) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3490649503886787285 : Rat) / 56596790034801622) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3490649503886787285 : Rat) / 113193580069603244) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3490649503886787285 : Rat) / 113193580069603244) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 23. -/
theorem ep_Q2_020_partial_23_0081_valid :
    mulPoly ep_Q2_020_coefficient_23_0081
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0082 : Poly :=
[
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 23. -/
def ep_Q2_020_partial_23_0082 : Poly :=
[
  term ((-8585155128801024 : Rat) / 1230365000756557) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8585155128801024 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 23. -/
theorem ep_Q2_020_partial_23_0082_valid :
    mulPoly ep_Q2_020_coefficient_23_0082
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0083 : Poly :=
[
  term ((885755987722196775 : Rat) / 56596790034801622) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 23. -/
def ep_Q2_020_partial_23_0083 : Poly :=
[
  term ((885755987722196775 : Rat) / 28298395017400811) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((885755987722196775 : Rat) / 28298395017400811) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-885755987722196775 : Rat) / 56596790034801622) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-885755987722196775 : Rat) / 56596790034801622) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 23. -/
theorem ep_Q2_020_partial_23_0083_valid :
    mulPoly ep_Q2_020_coefficient_23_0083
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0084 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 84 for generator 23. -/
def ep_Q2_020_partial_23_0084 : Poly :=
[
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 23. -/
theorem ep_Q2_020_partial_23_0084_valid :
    mulPoly ep_Q2_020_coefficient_23_0084
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0085 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 85 for generator 23. -/
def ep_Q2_020_partial_23_0085 : Poly :=
[
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 23. -/
theorem ep_Q2_020_partial_23_0085_valid :
    mulPoly ep_Q2_020_coefficient_23_0085
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0086 : Poly :=
[
  term ((-268755936044585568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 86 for generator 23. -/
def ep_Q2_020_partial_23_0086 : Poly :=
[
  term ((-537511872089171136 : Rat) / 28298395017400811) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-537511872089171136 : Rat) / 28298395017400811) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((268755936044585568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((268755936044585568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 23. -/
theorem ep_Q2_020_partial_23_0086_valid :
    mulPoly ep_Q2_020_coefficient_23_0086
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0087 : Poly :=
[
  term ((31247899218482724 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

/-- Partial product 87 for generator 23. -/
def ep_Q2_020_partial_23_0087 : Poly :=
[
  term ((62495798436965448 : Rat) / 28298395017400811) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((62495798436965448 : Rat) / 28298395017400811) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-31247899218482724 : Rat) / 28298395017400811) [(1, 2), (14, 2), (16, 1)],
  term ((-31247899218482724 : Rat) / 28298395017400811) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 23. -/
theorem ep_Q2_020_partial_23_0087_valid :
    mulPoly ep_Q2_020_coefficient_23_0087
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0088 : Poly :=
[
  term ((-541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 88 for generator 23. -/
def ep_Q2_020_partial_23_0088 : Poly :=
[
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 23. -/
theorem ep_Q2_020_partial_23_0088_valid :
    mulPoly ep_Q2_020_coefficient_23_0088
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0089 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 89 for generator 23. -/
def ep_Q2_020_partial_23_0089 : Poly :=
[
  term ((-742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 23. -/
theorem ep_Q2_020_partial_23_0089_valid :
    mulPoly ep_Q2_020_coefficient_23_0089
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0090 : Poly :=
[
  term ((-175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 90 for generator 23. -/
def ep_Q2_020_partial_23_0090 : Poly :=
[
  term ((-351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 23. -/
theorem ep_Q2_020_partial_23_0090_valid :
    mulPoly ep_Q2_020_coefficient_23_0090
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0091 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 91 for generator 23. -/
def ep_Q2_020_partial_23_0091 : Poly :=
[
  term ((3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 23. -/
theorem ep_Q2_020_partial_23_0091_valid :
    mulPoly ep_Q2_020_coefficient_23_0091
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0092 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 92 for generator 23. -/
def ep_Q2_020_partial_23_0092 : Poly :=
[
  term ((690727606191489504 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 23. -/
theorem ep_Q2_020_partial_23_0092_valid :
    mulPoly ep_Q2_020_coefficient_23_0092
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0093 : Poly :=
[
  term ((-979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 23. -/
def ep_Q2_020_partial_23_0093 : Poly :=
[
  term ((-979528844998953843 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 23. -/
theorem ep_Q2_020_partial_23_0093_valid :
    mulPoly ep_Q2_020_coefficient_23_0093
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0094 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 23. -/
def ep_Q2_020_partial_23_0094 : Poly :=
[
  term ((138528511220848320 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 23. -/
theorem ep_Q2_020_partial_23_0094_valid :
    mulPoly ep_Q2_020_coefficient_23_0094
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0095 : Poly :=
[
  term ((-541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 95 for generator 23. -/
def ep_Q2_020_partial_23_0095 : Poly :=
[
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 23. -/
theorem ep_Q2_020_partial_23_0095_valid :
    mulPoly ep_Q2_020_coefficient_23_0095
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0096 : Poly :=
[
  term ((-140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 96 for generator 23. -/
def ep_Q2_020_partial_23_0096 : Poly :=
[
  term ((-281272938854905152 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-281272938854905152 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 23. -/
theorem ep_Q2_020_partial_23_0096_valid :
    mulPoly ep_Q2_020_coefficient_23_0096
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0097 : Poly :=
[
  term ((-160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 23. -/
def ep_Q2_020_partial_23_0097 : Poly :=
[
  term ((-320436771763309902 : Rat) / 975806724737959) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-320436771763309902 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 23. -/
theorem ep_Q2_020_partial_23_0097_valid :
    mulPoly ep_Q2_020_coefficient_23_0097
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0098 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 23. -/
def ep_Q2_020_partial_23_0098 : Poly :=
[
  term ((-155900428835400000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 23. -/
theorem ep_Q2_020_partial_23_0098_valid :
    mulPoly ep_Q2_020_coefficient_23_0098
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0099 : Poly :=
[
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 99 for generator 23. -/
def ep_Q2_020_partial_23_0099 : Poly :=
[
  term ((-4163688479918734536 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-4163688479918734536 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 23. -/
theorem ep_Q2_020_partial_23_0099_valid :
    mulPoly ep_Q2_020_coefficient_23_0099
        ep_Q2_020_generator_23_0000_0099 =
      ep_Q2_020_partial_23_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_23_0000_0099 : List Poly :=
[
  ep_Q2_020_partial_23_0000,
  ep_Q2_020_partial_23_0001,
  ep_Q2_020_partial_23_0002,
  ep_Q2_020_partial_23_0003,
  ep_Q2_020_partial_23_0004,
  ep_Q2_020_partial_23_0005,
  ep_Q2_020_partial_23_0006,
  ep_Q2_020_partial_23_0007,
  ep_Q2_020_partial_23_0008,
  ep_Q2_020_partial_23_0009,
  ep_Q2_020_partial_23_0010,
  ep_Q2_020_partial_23_0011,
  ep_Q2_020_partial_23_0012,
  ep_Q2_020_partial_23_0013,
  ep_Q2_020_partial_23_0014,
  ep_Q2_020_partial_23_0015,
  ep_Q2_020_partial_23_0016,
  ep_Q2_020_partial_23_0017,
  ep_Q2_020_partial_23_0018,
  ep_Q2_020_partial_23_0019,
  ep_Q2_020_partial_23_0020,
  ep_Q2_020_partial_23_0021,
  ep_Q2_020_partial_23_0022,
  ep_Q2_020_partial_23_0023,
  ep_Q2_020_partial_23_0024,
  ep_Q2_020_partial_23_0025,
  ep_Q2_020_partial_23_0026,
  ep_Q2_020_partial_23_0027,
  ep_Q2_020_partial_23_0028,
  ep_Q2_020_partial_23_0029,
  ep_Q2_020_partial_23_0030,
  ep_Q2_020_partial_23_0031,
  ep_Q2_020_partial_23_0032,
  ep_Q2_020_partial_23_0033,
  ep_Q2_020_partial_23_0034,
  ep_Q2_020_partial_23_0035,
  ep_Q2_020_partial_23_0036,
  ep_Q2_020_partial_23_0037,
  ep_Q2_020_partial_23_0038,
  ep_Q2_020_partial_23_0039,
  ep_Q2_020_partial_23_0040,
  ep_Q2_020_partial_23_0041,
  ep_Q2_020_partial_23_0042,
  ep_Q2_020_partial_23_0043,
  ep_Q2_020_partial_23_0044,
  ep_Q2_020_partial_23_0045,
  ep_Q2_020_partial_23_0046,
  ep_Q2_020_partial_23_0047,
  ep_Q2_020_partial_23_0048,
  ep_Q2_020_partial_23_0049,
  ep_Q2_020_partial_23_0050,
  ep_Q2_020_partial_23_0051,
  ep_Q2_020_partial_23_0052,
  ep_Q2_020_partial_23_0053,
  ep_Q2_020_partial_23_0054,
  ep_Q2_020_partial_23_0055,
  ep_Q2_020_partial_23_0056,
  ep_Q2_020_partial_23_0057,
  ep_Q2_020_partial_23_0058,
  ep_Q2_020_partial_23_0059,
  ep_Q2_020_partial_23_0060,
  ep_Q2_020_partial_23_0061,
  ep_Q2_020_partial_23_0062,
  ep_Q2_020_partial_23_0063,
  ep_Q2_020_partial_23_0064,
  ep_Q2_020_partial_23_0065,
  ep_Q2_020_partial_23_0066,
  ep_Q2_020_partial_23_0067,
  ep_Q2_020_partial_23_0068,
  ep_Q2_020_partial_23_0069,
  ep_Q2_020_partial_23_0070,
  ep_Q2_020_partial_23_0071,
  ep_Q2_020_partial_23_0072,
  ep_Q2_020_partial_23_0073,
  ep_Q2_020_partial_23_0074,
  ep_Q2_020_partial_23_0075,
  ep_Q2_020_partial_23_0076,
  ep_Q2_020_partial_23_0077,
  ep_Q2_020_partial_23_0078,
  ep_Q2_020_partial_23_0079,
  ep_Q2_020_partial_23_0080,
  ep_Q2_020_partial_23_0081,
  ep_Q2_020_partial_23_0082,
  ep_Q2_020_partial_23_0083,
  ep_Q2_020_partial_23_0084,
  ep_Q2_020_partial_23_0085,
  ep_Q2_020_partial_23_0086,
  ep_Q2_020_partial_23_0087,
  ep_Q2_020_partial_23_0088,
  ep_Q2_020_partial_23_0089,
  ep_Q2_020_partial_23_0090,
  ep_Q2_020_partial_23_0091,
  ep_Q2_020_partial_23_0092,
  ep_Q2_020_partial_23_0093,
  ep_Q2_020_partial_23_0094,
  ep_Q2_020_partial_23_0095,
  ep_Q2_020_partial_23_0096,
  ep_Q2_020_partial_23_0097,
  ep_Q2_020_partial_23_0098,
  ep_Q2_020_partial_23_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_23_0000_0099 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-166234213465017984 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-166234213465017984 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (14, 2), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((590214418669358352 : Rat) / 28298395017400811) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8585155128801024 : Rat) / 1230365000756557) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((590214418669358352 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((264647551973569944 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-295107209334679176 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-295107209334679176 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((215565362123522448 : Rat) / 28298395017400811) [(0, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((215565362123522448 : Rat) / 28298395017400811) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-107782681061761224 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((-107782681061761224 : Rat) / 28298395017400811) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((46176170406949440 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((46176170406949440 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((77345085431640312 : Rat) / 28298395017400811) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((13852851122084832 : Rat) / 28298395017400811) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38672542715820156 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-24819691593735324 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((77345085431640312 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-393599691406431312 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-393599691406431312 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((196799845703215656 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((196799845703215656 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((158442499504712952 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((158442499504712952 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-79221249752356476 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-79221249752356476 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((56761151268079602 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-31247899218482724 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((56773017604985484 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-455100713678678352 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2384765313555840 : Rat) / 1230365000756557) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-455100713678678352 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28386508802492742 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-83236111014277062 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((56773017604985484 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((227550356839339176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((227550356839339176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((155209900834614600 : Rat) / 28298395017400811) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((155209900834614600 : Rat) / 28298395017400811) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-77604950417307300 : Rat) / 28298395017400811) [(0, 1), (9, 2), (14, 2), (16, 1)],
  term ((-77604950417307300 : Rat) / 28298395017400811) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((-87044406099765000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3994481900206032 : Rat) / 1230365000756557) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((813239842215664911 : Rat) / 28298395017400811) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2983484882319915643 : Rat) / 56596790034801622) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((4739721060692232 : Rat) / 1230365000756557) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((813239842215664911 : Rat) / 28298395017400811) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((43522203049882500 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((27932160166342500 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4739721060692232 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1997240950103016 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2983484882319915643 : Rat) / 56596790034801622) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((1281811356036264 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-87044406099765000 : Rat) / 28298395017400811) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3994481900206032 : Rat) / 1230365000756557) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-813239842215664911 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-813239842215664911 : Rat) / 56596790034801622) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2369860530346116 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((2983484882319915643 : Rat) / 113193580069603244) [(0, 1), (14, 2), (16, 1)],
  term ((-2369860530346116 : Rat) / 1230365000756557) [(0, 1), (14, 3), (16, 1)],
  term ((2983484882319915643 : Rat) / 113193580069603244) [(0, 1), (15, 2), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (15, 4), (16, 1)],
  term ((-67188984011146392 : Rat) / 28298395017400811) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-67188984011146392 : Rat) / 28298395017400811) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((33594492005573196 : Rat) / 28298395017400811) [(0, 2), (14, 2), (16, 1)],
  term ((33594492005573196 : Rat) / 28298395017400811) [(0, 2), (15, 2), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (14, 2), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((351051911287072128 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((351051911287072128 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 28298395017400811) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((2747759974988998677 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((281272938854905152 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((281272938854905152 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((320436771763309902 : Rat) / 975806724737959) [(1, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (3, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((4163688479918734536 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4163688479918734536 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4481784383932640619 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((320436771763309902 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 3), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-135171833884640244 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-135171833884640244 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61668711084931578 : Rat) / 975806724737959) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-154635815280567852 : Rat) / 1230365000756557) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((166234213465017984 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((166234213465017984 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-55411404488339328 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-55411404488339328 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((171490471718940000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((208709389543057920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-127917603932309547 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 975806724737959) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-241645664694870000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6926425561042416 : Rat) / 975806724737959) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-127917603932309547 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-268903501406881920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((171490471718940000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((208709389543057920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((3463212780521208 : Rat) / 975806724737959) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((127917603932309547 : Rat) / 56596790034801622) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((3463212780521208 : Rat) / 975806724737959) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((127917603932309547 : Rat) / 56596790034801622) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (15, 4), (16, 1)],
  term ((-152381362342933152 : Rat) / 28298395017400811) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (14, 2), (16, 1)],
  term ((214719192392314896 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-152381362342933152 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (15, 3), (16, 1)],
  term ((-115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((431170021175967216 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((431170021175967216 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((148072641202193664 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-215585010587983608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-215585010587983608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-187080514602480000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8585155128801024 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-187080514602480000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-293405269030171056 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-465560430789778194 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-465560430789778194 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((232780215394889097 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((232780215394889097 : Rat) / 28298395017400811) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118610657023559616 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((210361688935965852 : Rat) / 28298395017400811) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-118610657023559616 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((210361688935965852 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-105180844467982926 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-105180844467982926 : Rat) / 28298395017400811) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((62360171534160000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2861718376267008 : Rat) / 1230365000756557) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((62360171534160000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2861718376267008 : Rat) / 1230365000756557) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((170238687220315394 : Rat) / 28298395017400811) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-656122529112730752 : Rat) / 28298395017400811) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3490649503886787285 : Rat) / 56596790034801622) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 975806724737959) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((885755987722196775 : Rat) / 28298395017400811) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8585155128801024 : Rat) / 1230365000756557) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-164030632278182688 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-820153161390913440 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((7795021441770000 : Rat) / 975806724737959) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3490649503886787285 : Rat) / 56596790034801622) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8585155128801024 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-85119343610157697 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((800636644112039078 : Rat) / 28298395017400811) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((170238687220315394 : Rat) / 28298395017400811) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((328061264556365376 : Rat) / 28298395017400811) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3490649503886787285 : Rat) / 113193580069603244) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3897510720885000 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((-3490649503886787285 : Rat) / 113193580069603244) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-885755987722196775 : Rat) / 56596790034801622) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-885755987722196775 : Rat) / 56596790034801622) [(1, 1), (15, 3), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-537511872089171136 : Rat) / 28298395017400811) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((62495798436965448 : Rat) / 28298395017400811) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-537511872089171136 : Rat) / 28298395017400811) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((62495798436965448 : Rat) / 28298395017400811) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((268755936044585568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((268755936044585568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-31247899218482724 : Rat) / 28298395017400811) [(1, 2), (14, 2), (16, 1)],
  term ((-31247899218482724 : Rat) / 28298395017400811) [(1, 2), (15, 2), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 28298395017400811) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2747759974988998677 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-281272938854905152 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-281272938854905152 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-320436771763309902 : Rat) / 975806724737959) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4163688479918734536 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4163688479918734536 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-320436771763309902 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 99. -/
theorem ep_Q2_020_block_23_0000_0099_valid :
    checkProductSumEq ep_Q2_020_partials_23_0000_0099
      ep_Q2_020_block_23_0000_0099 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
