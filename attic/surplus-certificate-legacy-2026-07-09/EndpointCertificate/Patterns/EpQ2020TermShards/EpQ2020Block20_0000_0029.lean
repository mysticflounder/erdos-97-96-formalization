/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 20:0-29

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 20 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_20_0000_0029 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(8, 1)],
  term (2 : Rat) [(8, 1), (12, 1)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0000 : Poly :=
[
  term ((-86356196329124304 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 0 for generator 20. -/
def ep_Q2_020_partial_20_0000 : Poly :=
[
  term ((-172712392658248608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem ep_Q2_020_partial_20_0000_valid :
    mulPoly ep_Q2_020_coefficient_20_0000
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0001 : Poly :=
[
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 1 for generator 20. -/
def ep_Q2_020_partial_20_0001 : Poly :=
[
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem ep_Q2_020_partial_20_0001_valid :
    mulPoly ep_Q2_020_coefficient_20_0001
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0002 : Poly :=
[
  term ((-1471346620495672671 : Rat) / 226387160139206488) [(0, 1), (16, 1)]
]

/-- Partial product 2 for generator 20. -/
def ep_Q2_020_partial_20_0002 : Poly :=
[
  term ((-1471346620495672671 : Rat) / 113193580069603244) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((1471346620495672671 : Rat) / 113193580069603244) [(0, 1), (8, 1), (16, 1)],
  term ((-1471346620495672671 : Rat) / 113193580069603244) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((1471346620495672671 : Rat) / 226387160139206488) [(0, 1), (12, 2), (16, 1)],
  term ((1471346620495672671 : Rat) / 226387160139206488) [(0, 1), (13, 2), (16, 1)],
  term ((-1471346620495672671 : Rat) / 226387160139206488) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem ep_Q2_020_partial_20_0002_valid :
    mulPoly ep_Q2_020_coefficient_20_0002
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0003 : Poly :=
[
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 2), (16, 1)]
]

/-- Partial product 3 for generator 20. -/
def ep_Q2_020_partial_20_0003 : Poly :=
[
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 2), (8, 1), (16, 1)],
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 2), (12, 2), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem ep_Q2_020_partial_20_0003_valid :
    mulPoly ep_Q2_020_coefficient_20_0003
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0004 : Poly :=
[
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 20. -/
def ep_Q2_020_partial_20_0004 : Poly :=
[
  term ((15007255382258568 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((15007255382258568 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem ep_Q2_020_partial_20_0004_valid :
    mulPoly ep_Q2_020_coefficient_20_0004
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0005 : Poly :=
[
  term ((125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 5 for generator 20. -/
def ep_Q2_020_partial_20_0005 : Poly :=
[
  term ((251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem ep_Q2_020_partial_20_0005_valid :
    mulPoly ep_Q2_020_coefficient_20_0005
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0006 : Poly :=
[
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 6 for generator 20. -/
def ep_Q2_020_partial_20_0006 : Poly :=
[
  term ((-88957992767669712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((88957992767669712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)],
  term ((-88957992767669712 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem ep_Q2_020_partial_20_0006_valid :
    mulPoly ep_Q2_020_coefficient_20_0006
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0007 : Poly :=
[
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 20. -/
def ep_Q2_020_partial_20_0007 : Poly :=
[
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem ep_Q2_020_partial_20_0007_valid :
    mulPoly ep_Q2_020_coefficient_20_0007
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0008 : Poly :=
[
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 20. -/
def ep_Q2_020_partial_20_0008 : Poly :=
[
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem ep_Q2_020_partial_20_0008_valid :
    mulPoly ep_Q2_020_coefficient_20_0008
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0009 : Poly :=
[
  term ((28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 20. -/
def ep_Q2_020_partial_20_0009 : Poly :=
[
  term ((56239907694558840 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-56239907694558840 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((56239907694558840 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem ep_Q2_020_partial_20_0009_valid :
    mulPoly ep_Q2_020_coefficient_20_0009
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0010 : Poly :=
[
  term ((50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 10 for generator 20. -/
def ep_Q2_020_partial_20_0010 : Poly :=
[
  term ((100526718971744616 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-100526718971744616 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((100526718971744616 : Rat) / 28298395017400811) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem ep_Q2_020_partial_20_0010_valid :
    mulPoly ep_Q2_020_coefficient_20_0010
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0011 : Poly :=
[
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 20. -/
def ep_Q2_020_partial_20_0011 : Poly :=
[
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem ep_Q2_020_partial_20_0011_valid :
    mulPoly ep_Q2_020_coefficient_20_0011
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0012 : Poly :=
[
  term ((-105121061865535860 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 20. -/
def ep_Q2_020_partial_20_0012 : Poly :=
[
  term ((-210242123731071720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((210242123731071720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-210242123731071720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((105121061865535860 : Rat) / 28298395017400811) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-105121061865535860 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((105121061865535860 : Rat) / 28298395017400811) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem ep_Q2_020_partial_20_0012_valid :
    mulPoly ep_Q2_020_coefficient_20_0012
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0013 : Poly :=
[
  term ((373673405799868950 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 20. -/
def ep_Q2_020_partial_20_0013 : Poly :=
[
  term ((747346811599737900 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-747346811599737900 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((747346811599737900 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-373673405799868950 : Rat) / 28298395017400811) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-373673405799868950 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((373673405799868950 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem ep_Q2_020_partial_20_0013_valid :
    mulPoly ep_Q2_020_coefficient_20_0013
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0014 : Poly :=
[
  term ((-10224243921813804 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 14 for generator 20. -/
def ep_Q2_020_partial_20_0014 : Poly :=
[
  term ((-20448487843627608 : Rat) / 28298395017400811) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((20448487843627608 : Rat) / 28298395017400811) [(5, 2), (8, 1), (16, 1)],
  term ((-20448487843627608 : Rat) / 28298395017400811) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((10224243921813804 : Rat) / 28298395017400811) [(5, 2), (12, 2), (16, 1)],
  term ((10224243921813804 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((-10224243921813804 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem ep_Q2_020_partial_20_0014_valid :
    mulPoly ep_Q2_020_coefficient_20_0014
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0015 : Poly :=
[
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 15 for generator 20. -/
def ep_Q2_020_partial_20_0015 : Poly :=
[
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 20. -/
theorem ep_Q2_020_partial_20_0015_valid :
    mulPoly ep_Q2_020_coefficient_20_0015
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0016 : Poly :=
[
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 16 for generator 20. -/
def ep_Q2_020_partial_20_0016 : Poly :=
[
  term ((-15991116844624584 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((15991116844624584 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)],
  term ((-15991116844624584 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 20. -/
theorem ep_Q2_020_partial_20_0016_valid :
    mulPoly ep_Q2_020_coefficient_20_0016
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0017 : Poly :=
[
  term ((-6248878632728760 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 20. -/
def ep_Q2_020_partial_20_0017 : Poly :=
[
  term ((-12497757265457520 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((12497757265457520 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-12497757265457520 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6248878632728760 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((6248878632728760 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6248878632728760 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 20. -/
theorem ep_Q2_020_partial_20_0017_valid :
    mulPoly ep_Q2_020_coefficient_20_0017
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0018 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 20. -/
def ep_Q2_020_partial_20_0018 : Poly :=
[
  term ((13490823602297016 : Rat) / 975806724737959) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(7, 1), (13, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 20. -/
theorem ep_Q2_020_partial_20_0018_valid :
    mulPoly ep_Q2_020_coefficient_20_0018
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0019 : Poly :=
[
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 20. -/
def ep_Q2_020_partial_20_0019 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 20. -/
theorem ep_Q2_020_partial_20_0019_valid :
    mulPoly ep_Q2_020_coefficient_20_0019
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0020 : Poly :=
[
  term ((-101941749696995910 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 20 for generator 20. -/
def ep_Q2_020_partial_20_0020 : Poly :=
[
  term ((-203883499393991820 : Rat) / 28298395017400811) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((203883499393991820 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)],
  term ((-203883499393991820 : Rat) / 28298395017400811) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((101941749696995910 : Rat) / 28298395017400811) [(7, 2), (12, 2), (16, 1)],
  term ((101941749696995910 : Rat) / 28298395017400811) [(7, 2), (13, 2), (16, 1)],
  term ((-101941749696995910 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 20. -/
theorem ep_Q2_020_partial_20_0020_valid :
    mulPoly ep_Q2_020_coefficient_20_0020
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0021 : Poly :=
[
  term ((-204597608769079470 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 20. -/
def ep_Q2_020_partial_20_0021 : Poly :=
[
  term ((-409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-204597608769079470 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (13, 3), (16, 1)],
  term ((-409195217538158940 : Rat) / 28298395017400811) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 20. -/
theorem ep_Q2_020_partial_20_0021_valid :
    mulPoly ep_Q2_020_coefficient_20_0021
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0022 : Poly :=
[
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 20. -/
def ep_Q2_020_partial_20_0022 : Poly :=
[
  term ((609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)],
  term ((609559985463354000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 20. -/
theorem ep_Q2_020_partial_20_0022_valid :
    mulPoly ep_Q2_020_coefficient_20_0022
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0023 : Poly :=
[
  term ((8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 20. -/
def ep_Q2_020_partial_20_0023 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 1), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 20. -/
theorem ep_Q2_020_partial_20_0023_valid :
    mulPoly ep_Q2_020_coefficient_20_0023
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0024 : Poly :=
[
  term ((-17957807362391616 : Rat) / 975806724737959) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 20. -/
def ep_Q2_020_partial_20_0024 : Poly :=
[
  term ((-35915614724783232 : Rat) / 975806724737959) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((35915614724783232 : Rat) / 975806724737959) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35915614724783232 : Rat) / 975806724737959) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17957807362391616 : Rat) / 975806724737959) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((17957807362391616 : Rat) / 975806724737959) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17957807362391616 : Rat) / 975806724737959) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 20. -/
theorem ep_Q2_020_partial_20_0024_valid :
    mulPoly ep_Q2_020_coefficient_20_0024
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0025 : Poly :=
[
  term ((173737629145361385 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 25 for generator 20. -/
def ep_Q2_020_partial_20_0025 : Poly :=
[
  term ((-347475258290722770 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)],
  term ((347475258290722770 : Rat) / 28298395017400811) [(8, 1), (12, 2), (16, 1)],
  term ((347475258290722770 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-173737629145361385 : Rat) / 28298395017400811) [(12, 1), (13, 2), (16, 1)],
  term ((173737629145361385 : Rat) / 28298395017400811) [(12, 1), (16, 1)],
  term ((-173737629145361385 : Rat) / 28298395017400811) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 20. -/
theorem ep_Q2_020_partial_20_0025_valid :
    mulPoly ep_Q2_020_coefficient_20_0025
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0026 : Poly :=
[
  term ((-16002112088689920 : Rat) / 1230365000756557) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 20. -/
def ep_Q2_020_partial_20_0026 : Poly :=
[
  term ((-32004224177379840 : Rat) / 1230365000756557) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(13, 1), (15, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 20. -/
theorem ep_Q2_020_partial_20_0026_valid :
    mulPoly ep_Q2_020_coefficient_20_0026
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0027 : Poly :=
[
  term ((460270927331392911 : Rat) / 226387160139206488) [(14, 1), (16, 1)]
]

/-- Partial product 27 for generator 20. -/
def ep_Q2_020_partial_20_0027 : Poly :=
[
  term ((460270927331392911 : Rat) / 113193580069603244) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-460270927331392911 : Rat) / 113193580069603244) [(8, 1), (14, 1), (16, 1)],
  term ((460270927331392911 : Rat) / 113193580069603244) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-460270927331392911 : Rat) / 226387160139206488) [(12, 2), (14, 1), (16, 1)],
  term ((-460270927331392911 : Rat) / 226387160139206488) [(13, 2), (14, 1), (16, 1)],
  term ((460270927331392911 : Rat) / 226387160139206488) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 20. -/
theorem ep_Q2_020_partial_20_0027_valid :
    mulPoly ep_Q2_020_coefficient_20_0027
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0028 : Poly :=
[
  term ((203186661821118000 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

/-- Partial product 28 for generator 20. -/
def ep_Q2_020_partial_20_0028 : Poly :=
[
  term ((406373323642236000 : Rat) / 28298395017400811) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-203186661821118000 : Rat) / 28298395017400811) [(12, 2), (15, 2), (16, 1)],
  term ((-203186661821118000 : Rat) / 28298395017400811) [(13, 2), (15, 2), (16, 1)],
  term ((203186661821118000 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 20. -/
theorem ep_Q2_020_partial_20_0028_valid :
    mulPoly ep_Q2_020_coefficient_20_0028
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 20. -/
def ep_Q2_020_coefficient_20_0029 : Poly :=
[
  term ((-86653067268750165 : Rat) / 28298395017400811) [(16, 1)]
]

/-- Partial product 29 for generator 20. -/
def ep_Q2_020_partial_20_0029 : Poly :=
[
  term ((-173306134537500330 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)],
  term ((173306134537500330 : Rat) / 28298395017400811) [(8, 1), (16, 1)],
  term ((-173306134537500330 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)],
  term ((86653067268750165 : Rat) / 28298395017400811) [(12, 2), (16, 1)],
  term ((86653067268750165 : Rat) / 28298395017400811) [(13, 2), (16, 1)],
  term ((-86653067268750165 : Rat) / 28298395017400811) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 20. -/
theorem ep_Q2_020_partial_20_0029_valid :
    mulPoly ep_Q2_020_coefficient_20_0029
        ep_Q2_020_generator_20_0000_0029 =
      ep_Q2_020_partial_20_0029 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_20_0000_0029 : List Poly :=
[
  ep_Q2_020_partial_20_0000,
  ep_Q2_020_partial_20_0001,
  ep_Q2_020_partial_20_0002,
  ep_Q2_020_partial_20_0003,
  ep_Q2_020_partial_20_0004,
  ep_Q2_020_partial_20_0005,
  ep_Q2_020_partial_20_0006,
  ep_Q2_020_partial_20_0007,
  ep_Q2_020_partial_20_0008,
  ep_Q2_020_partial_20_0009,
  ep_Q2_020_partial_20_0010,
  ep_Q2_020_partial_20_0011,
  ep_Q2_020_partial_20_0012,
  ep_Q2_020_partial_20_0013,
  ep_Q2_020_partial_20_0014,
  ep_Q2_020_partial_20_0015,
  ep_Q2_020_partial_20_0016,
  ep_Q2_020_partial_20_0017,
  ep_Q2_020_partial_20_0018,
  ep_Q2_020_partial_20_0019,
  ep_Q2_020_partial_20_0020,
  ep_Q2_020_partial_20_0021,
  ep_Q2_020_partial_20_0022,
  ep_Q2_020_partial_20_0023,
  ep_Q2_020_partial_20_0024,
  ep_Q2_020_partial_20_0025,
  ep_Q2_020_partial_20_0026,
  ep_Q2_020_partial_20_0027,
  ep_Q2_020_partial_20_0028,
  ep_Q2_020_partial_20_0029
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_20_0000_0029 : Poly :=
[
  term ((-172712392658248608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1471346620495672671 : Rat) / 113193580069603244) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((1471346620495672671 : Rat) / 113193580069603244) [(0, 1), (8, 1), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1471346620495672671 : Rat) / 113193580069603244) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((1471346620495672671 : Rat) / 226387160139206488) [(0, 1), (12, 2), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((1471346620495672671 : Rat) / 226387160139206488) [(0, 1), (13, 2), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((-1471346620495672671 : Rat) / 226387160139206488) [(0, 1), (16, 1)],
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 2), (8, 1), (16, 1)],
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 2), (12, 2), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 2), (16, 1)],
  term ((15007255382258568 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((15007255382258568 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)],
  term ((251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)],
  term ((-88957992767669712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((88957992767669712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)],
  term ((-88957992767669712 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (15, 1), (16, 1)],
  term ((56239907694558840 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-56239907694558840 : Rat) / 28298395017400811) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((56239907694558840 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((100526718971744616 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-100526718971744616 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-210242123731071720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((747346811599737900 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((210242123731071720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-747346811599737900 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((747346811599737900 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11326325357258436 : Rat) / 1230365000756557) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((50263359485872308 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((100526718971744616 : Rat) / 28298395017400811) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)],
  term ((105121061865535860 : Rat) / 28298395017400811) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-373673405799868950 : Rat) / 28298395017400811) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-105121061865535860 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((-373673405799868950 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((105121061865535860 : Rat) / 28298395017400811) [(5, 1), (13, 3), (16, 1)],
  term ((373673405799868950 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)],
  term ((-20448487843627608 : Rat) / 28298395017400811) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((20448487843627608 : Rat) / 28298395017400811) [(5, 2), (8, 1), (16, 1)],
  term ((-20448487843627608 : Rat) / 28298395017400811) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((10224243921813804 : Rat) / 28298395017400811) [(5, 2), (12, 2), (16, 1)],
  term ((10224243921813804 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((-10224243921813804 : Rat) / 28298395017400811) [(5, 2), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)],
  term ((-15991116844624584 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((15991116844624584 : Rat) / 28298395017400811) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-12497757265457520 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((12497757265457520 : Rat) / 28298395017400811) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12497757265457520 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((399229442888925756 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)],
  term ((-15991116844624584 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((6248878632728760 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((6248878632728760 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6248878632728760 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(7, 1), (13, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(7, 1), (13, 3), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)],
  term ((-203883499393991820 : Rat) / 28298395017400811) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((203883499393991820 : Rat) / 28298395017400811) [(7, 2), (8, 1), (16, 1)],
  term ((-203883499393991820 : Rat) / 28298395017400811) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((101941749696995910 : Rat) / 28298395017400811) [(7, 2), (12, 2), (16, 1)],
  term ((101941749696995910 : Rat) / 28298395017400811) [(7, 2), (13, 2), (16, 1)],
  term ((-101941749696995910 : Rat) / 28298395017400811) [(7, 2), (16, 1)],
  term ((-409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((409195217538158940 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-609559985463354000 : Rat) / 28298395017400811) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-35915614724783232 : Rat) / 975806724737959) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((35915614724783232 : Rat) / 975806724737959) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((460270927331392911 : Rat) / 113193580069603244) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-520781392828223100 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)],
  term ((347475258290722770 : Rat) / 28298395017400811) [(8, 1), (12, 2), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-460270927331392911 : Rat) / 113193580069603244) [(8, 1), (14, 1), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)],
  term ((173306134537500330 : Rat) / 28298395017400811) [(8, 1), (16, 1)],
  term ((-35915614724783232 : Rat) / 975806724737959) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((347475258290722770 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-304779992731677000 : Rat) / 28298395017400811) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((460270927331392911 : Rat) / 113193580069603244) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-377903743306579800 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)],
  term ((-1040877148811413320 : Rat) / 28298395017400811) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((204597608769079470 : Rat) / 28298395017400811) [(9, 1), (13, 3), (16, 1)],
  term ((304779992731677000 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)],
  term ((609559985463354000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-409195217538158940 : Rat) / 28298395017400811) [(9, 2), (13, 2), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((17957807362391616 : Rat) / 975806724737959) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 1), (16, 1)],
  term ((17957807362391616 : Rat) / 975806724737959) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 3), (16, 1)],
  term ((-17957807362391616 : Rat) / 975806724737959) [(11, 1), (15, 1), (16, 1)],
  term ((-173737629145361385 : Rat) / 28298395017400811) [(12, 1), (13, 2), (16, 1)],
  term ((173737629145361385 : Rat) / 28298395017400811) [(12, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-460270927331392911 : Rat) / 226387160139206488) [(12, 2), (14, 1), (16, 1)],
  term ((-203186661821118000 : Rat) / 28298395017400811) [(12, 2), (15, 2), (16, 1)],
  term ((86653067268750165 : Rat) / 28298395017400811) [(12, 2), (16, 1)],
  term ((-173737629145361385 : Rat) / 28298395017400811) [(12, 3), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(13, 1), (15, 1), (16, 1)],
  term ((-460270927331392911 : Rat) / 226387160139206488) [(13, 2), (14, 1), (16, 1)],
  term ((-203186661821118000 : Rat) / 28298395017400811) [(13, 2), (15, 2), (16, 1)],
  term ((86653067268750165 : Rat) / 28298395017400811) [(13, 2), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(13, 3), (15, 1), (16, 1)],
  term ((460270927331392911 : Rat) / 226387160139206488) [(14, 1), (16, 1)],
  term ((203186661821118000 : Rat) / 28298395017400811) [(15, 2), (16, 1)],
  term ((-86653067268750165 : Rat) / 28298395017400811) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 29. -/
theorem ep_Q2_020_block_20_0000_0029_valid :
    checkProductSumEq ep_Q2_020_partials_20_0000_0029
      ep_Q2_020_block_20_0000_0029 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
