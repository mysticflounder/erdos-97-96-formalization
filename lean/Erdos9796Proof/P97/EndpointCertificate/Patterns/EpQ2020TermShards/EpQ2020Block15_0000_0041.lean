/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 15:0-41

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_15_0000_0041 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0000 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 15. -/
def ep_Q2_020_partial_15_0000 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem ep_Q2_020_partial_15_0000_valid :
    mulPoly ep_Q2_020_coefficient_15_0000
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0001 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def ep_Q2_020_partial_15_0001 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 3), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem ep_Q2_020_partial_15_0001_valid :
    mulPoly ep_Q2_020_coefficient_15_0001
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0002 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def ep_Q2_020_partial_15_0002 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem ep_Q2_020_partial_15_0002_valid :
    mulPoly ep_Q2_020_coefficient_15_0002
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0003 : Poly :=
[
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def ep_Q2_020_partial_15_0003 : Poly :=
[
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-7811974804620681 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem ep_Q2_020_partial_15_0003_valid :
    mulPoly ep_Q2_020_coefficient_15_0003
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0004 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def ep_Q2_020_partial_15_0004 : Poly :=
[
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem ep_Q2_020_partial_15_0004_valid :
    mulPoly ep_Q2_020_coefficient_15_0004
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0005 : Poly :=
[
  term ((-119391057074223183 : Rat) / 56596790034801622) [(0, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def ep_Q2_020_partial_15_0005 : Poly :=
[
  term ((119391057074223183 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-119391057074223183 : Rat) / 56596790034801622) [(0, 1), (1, 2), (16, 1)],
  term ((-119391057074223183 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)],
  term ((119391057074223183 : Rat) / 56596790034801622) [(0, 1), (16, 1)],
  term ((119391057074223183 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((-119391057074223183 : Rat) / 56596790034801622) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem ep_Q2_020_partial_15_0005_valid :
    mulPoly ep_Q2_020_coefficient_15_0005
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0006 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 6 for generator 15. -/
def ep_Q2_020_partial_15_0006 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 3), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem ep_Q2_020_partial_15_0006_valid :
    mulPoly ep_Q2_020_coefficient_15_0006
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0007 : Poly :=
[
  term ((-2020207455304038 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def ep_Q2_020_partial_15_0007 : Poly :=
[
  term ((4040414910608076 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-2020207455304038 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-4040414910608076 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((2020207455304038 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)],
  term ((4040414910608076 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-2020207455304038 : Rat) / 28298395017400811) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem ep_Q2_020_partial_15_0007_valid :
    mulPoly ep_Q2_020_coefficient_15_0007
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0008 : Poly :=
[
  term ((11993337633468438 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 8 for generator 15. -/
def ep_Q2_020_partial_15_0008 : Poly :=
[
  term ((-23986675266936876 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((11993337633468438 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-11993337633468438 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)],
  term ((11993337633468438 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem ep_Q2_020_partial_15_0008_valid :
    mulPoly ep_Q2_020_coefficient_15_0008
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0009 : Poly :=
[
  term ((-28785398776374768 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def ep_Q2_020_partial_15_0009 : Poly :=
[
  term ((57570797552749536 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-28785398776374768 : Rat) / 28298395017400811) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)],
  term ((57570797552749536 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-28785398776374768 : Rat) / 28298395017400811) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem ep_Q2_020_partial_15_0009_valid :
    mulPoly ep_Q2_020_coefficient_15_0009
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0010 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 15. -/
def ep_Q2_020_partial_15_0010 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem ep_Q2_020_partial_15_0010_valid :
    mulPoly ep_Q2_020_coefficient_15_0010
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0011 : Poly :=
[
  term ((183430547140682358 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 15. -/
def ep_Q2_020_partial_15_0011 : Poly :=
[
  term ((-366861094281364716 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((183430547140682358 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((366861094281364716 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-183430547140682358 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)],
  term ((-366861094281364716 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((183430547140682358 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem ep_Q2_020_partial_15_0011_valid :
    mulPoly ep_Q2_020_coefficient_15_0011
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0012 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 15. -/
def ep_Q2_020_partial_15_0012 : Poly :=
[
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem ep_Q2_020_partial_15_0012_valid :
    mulPoly ep_Q2_020_coefficient_15_0012
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0013 : Poly :=
[
  term ((491857845920892 : Rat) / 1230365000756557) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def ep_Q2_020_partial_15_0013 : Poly :=
[
  term ((-983715691841784 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((491857845920892 : Rat) / 1230365000756557) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-491857845920892 : Rat) / 1230365000756557) [(1, 1), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((491857845920892 : Rat) / 1230365000756557) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem ep_Q2_020_partial_15_0013_valid :
    mulPoly ep_Q2_020_coefficient_15_0013
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0014 : Poly :=
[
  term ((60834190590904884 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 14 for generator 15. -/
def ep_Q2_020_partial_15_0014 : Poly :=
[
  term ((-121668381181809768 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem ep_Q2_020_partial_15_0014_valid :
    mulPoly ep_Q2_020_coefficient_15_0014
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0015 : Poly :=
[
  term ((-34777397527120914 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 15 for generator 15. -/
def ep_Q2_020_partial_15_0015 : Poly :=
[
  term ((69554795054241828 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((-34777397527120914 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((69554795054241828 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-34777397527120914 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((-69554795054241828 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((34777397527120914 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem ep_Q2_020_partial_15_0015_valid :
    mulPoly ep_Q2_020_coefficient_15_0015
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0016 : Poly :=
[
  term ((28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 16 for generator 15. -/
def ep_Q2_020_partial_15_0016 : Poly :=
[
  term ((-56239907694558840 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((28119953847279420 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-56239907694558840 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((28119953847279420 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((56239907694558840 : Rat) / 28298395017400811) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem ep_Q2_020_partial_15_0016_valid :
    mulPoly ep_Q2_020_coefficient_15_0016
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0017 : Poly :=
[
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 17 for generator 15. -/
def ep_Q2_020_partial_15_0017 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem ep_Q2_020_partial_15_0017_valid :
    mulPoly ep_Q2_020_coefficient_15_0017
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0018 : Poly :=
[
  term ((9523835146433322 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 15. -/
def ep_Q2_020_partial_15_0018 : Poly :=
[
  term ((-19047670292866644 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((9523835146433322 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((9523835146433322 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-9523835146433322 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem ep_Q2_020_partial_15_0018_valid :
    mulPoly ep_Q2_020_coefficient_15_0018
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0019 : Poly :=
[
  term ((-89343920000369844 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 15. -/
def ep_Q2_020_partial_15_0019 : Poly :=
[
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem ep_Q2_020_partial_15_0019_valid :
    mulPoly ep_Q2_020_coefficient_15_0019
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0020 : Poly :=
[
  term ((-3949649825677806 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 15. -/
def ep_Q2_020_partial_15_0020 : Poly :=
[
  term ((7899299651355612 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3949649825677806 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((7899299651355612 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3949649825677806 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-7899299651355612 : Rat) / 28298395017400811) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((3949649825677806 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem ep_Q2_020_partial_15_0020_valid :
    mulPoly ep_Q2_020_coefficient_15_0020
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0021 : Poly :=
[
  term ((17383894199559216 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 21 for generator 15. -/
def ep_Q2_020_partial_15_0021 : Poly :=
[
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 2), (5, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem ep_Q2_020_partial_15_0021_valid :
    mulPoly ep_Q2_020_coefficient_15_0021
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0022 : Poly :=
[
  term ((21589049082281076 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 15. -/
def ep_Q2_020_partial_15_0022 : Poly :=
[
  term ((-43178098164562152 : Rat) / 28298395017400811) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem ep_Q2_020_partial_15_0022_valid :
    mulPoly ep_Q2_020_coefficient_15_0022
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0023 : Poly :=
[
  term ((11993337633468438 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 23 for generator 15. -/
def ep_Q2_020_partial_15_0023 : Poly :=
[
  term ((-23986675266936876 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((11993337633468438 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((11993337633468438 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((-11993337633468438 : Rat) / 28298395017400811) [(6, 1), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem ep_Q2_020_partial_15_0023_valid :
    mulPoly ep_Q2_020_coefficient_15_0023
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0024 : Poly :=
[
  term ((59966688167342190 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 24 for generator 15. -/
def ep_Q2_020_partial_15_0024 : Poly :=
[
  term ((-119933376334684380 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((59966688167342190 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-119933376334684380 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((59966688167342190 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((119933376334684380 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-59966688167342190 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem ep_Q2_020_partial_15_0024_valid :
    mulPoly ep_Q2_020_coefficient_15_0024
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0025 : Poly :=
[
  term ((-4133278580342544 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 15. -/
def ep_Q2_020_partial_15_0025 : Poly :=
[
  term ((8266557160685088 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-8266557160685088 : Rat) / 28298395017400811) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem ep_Q2_020_partial_15_0025_valid :
    mulPoly ep_Q2_020_coefficient_15_0025
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0026 : Poly :=
[
  term ((21589049082281076 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 15. -/
def ep_Q2_020_partial_15_0026 : Poly :=
[
  term ((-43178098164562152 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem ep_Q2_020_partial_15_0026_valid :
    mulPoly ep_Q2_020_coefficient_15_0026
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0027 : Poly :=
[
  term ((-276041519150400882 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 15. -/
def ep_Q2_020_partial_15_0027 : Poly :=
[
  term ((552083038300801764 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((552083038300801764 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((-552083038300801764 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem ep_Q2_020_partial_15_0027_valid :
    mulPoly ep_Q2_020_coefficient_15_0027
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0028 : Poly :=
[
  term ((276041519150400882 : Rat) / 28298395017400811) [(8, 1), (16, 1)]
]

/-- Partial product 28 for generator 15. -/
def ep_Q2_020_partial_15_0028 : Poly :=
[
  term ((-552083038300801764 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(0, 2), (8, 1), (16, 1)],
  term ((-552083038300801764 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)],
  term ((552083038300801764 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem ep_Q2_020_partial_15_0028_valid :
    mulPoly ep_Q2_020_coefficient_15_0028
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0029 : Poly :=
[
  term ((-7196349694093692 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 15. -/
def ep_Q2_020_partial_15_0029 : Poly :=
[
  term ((14392699388187384 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7196349694093692 : Rat) / 28298395017400811) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((14392699388187384 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7196349694093692 : Rat) / 28298395017400811) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-14392699388187384 : Rat) / 28298395017400811) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((7196349694093692 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem ep_Q2_020_partial_15_0029_valid :
    mulPoly ep_Q2_020_coefficient_15_0029
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0030 : Poly :=
[
  term ((21436308964867500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 30 for generator 15. -/
def ep_Q2_020_partial_15_0030 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem ep_Q2_020_partial_15_0030_valid :
    mulPoly ep_Q2_020_coefficient_15_0030
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0031 : Poly :=
[
  term ((-10718154482433750 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 15. -/
def ep_Q2_020_partial_15_0031 : Poly :=
[
  term ((21436308964867500 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10718154482433750 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10718154482433750 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((10718154482433750 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem ep_Q2_020_partial_15_0031_valid :
    mulPoly ep_Q2_020_coefficient_15_0031
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0032 : Poly :=
[
  term ((983715691841784 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 15. -/
def ep_Q2_020_partial_15_0032 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem ep_Q2_020_partial_15_0032_valid :
    mulPoly ep_Q2_020_coefficient_15_0032
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0033 : Poly :=
[
  term ((-795098761906071285 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 15. -/
def ep_Q2_020_partial_15_0033 : Poly :=
[
  term ((795098761906071285 : Rat) / 56596790034801622) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-795098761906071285 : Rat) / 113193580069603244) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((795098761906071285 : Rat) / 56596790034801622) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-795098761906071285 : Rat) / 113193580069603244) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-795098761906071285 : Rat) / 56596790034801622) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((795098761906071285 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem ep_Q2_020_partial_15_0033_valid :
    mulPoly ep_Q2_020_coefficient_15_0033
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0034 : Poly :=
[
  term ((11742385719851223 : Rat) / 4921460003026228) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 34 for generator 15. -/
def ep_Q2_020_partial_15_0034 : Poly :=
[
  term ((-11742385719851223 : Rat) / 2460730001513114) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((11742385719851223 : Rat) / 4921460003026228) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-11742385719851223 : Rat) / 2460730001513114) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((11742385719851223 : Rat) / 4921460003026228) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((11742385719851223 : Rat) / 2460730001513114) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11742385719851223 : Rat) / 4921460003026228) [(12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem ep_Q2_020_partial_15_0034_valid :
    mulPoly ep_Q2_020_coefficient_15_0034
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0035 : Poly :=
[
  term ((-540146232898769385 : Rat) / 113193580069603244) [(12, 1), (16, 1)]
]

/-- Partial product 35 for generator 15. -/
def ep_Q2_020_partial_15_0035 : Poly :=
[
  term ((540146232898769385 : Rat) / 56596790034801622) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-540146232898769385 : Rat) / 113193580069603244) [(0, 2), (12, 1), (16, 1)],
  term ((540146232898769385 : Rat) / 56596790034801622) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-540146232898769385 : Rat) / 113193580069603244) [(1, 2), (12, 1), (16, 1)],
  term ((-540146232898769385 : Rat) / 56596790034801622) [(6, 1), (12, 1), (16, 1)],
  term ((540146232898769385 : Rat) / 113193580069603244) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem ep_Q2_020_partial_15_0035_valid :
    mulPoly ep_Q2_020_coefficient_15_0035
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0036 : Poly :=
[
  term ((443161110700660665 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 15. -/
def ep_Q2_020_partial_15_0036 : Poly :=
[
  term ((-443161110700660665 : Rat) / 56596790034801622) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((443161110700660665 : Rat) / 113193580069603244) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-443161110700660665 : Rat) / 56596790034801622) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((443161110700660665 : Rat) / 113193580069603244) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((443161110700660665 : Rat) / 56596790034801622) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-443161110700660665 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem ep_Q2_020_partial_15_0036_valid :
    mulPoly ep_Q2_020_coefficient_15_0036
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0037 : Poly :=
[
  term ((-15777141865166016 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

/-- Partial product 37 for generator 15. -/
def ep_Q2_020_partial_15_0037 : Poly :=
[
  term ((31554283730332032 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-15777141865166016 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((31554283730332032 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-15777141865166016 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)],
  term ((-31554283730332032 : Rat) / 28298395017400811) [(6, 1), (13, 2), (16, 1)],
  term ((15777141865166016 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem ep_Q2_020_partial_15_0037_valid :
    mulPoly ep_Q2_020_coefficient_15_0037
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0038 : Poly :=
[
  term ((-975429326994088929 : Rat) / 226387160139206488) [(14, 1), (16, 1)]
]

/-- Partial product 38 for generator 15. -/
def ep_Q2_020_partial_15_0038 : Poly :=
[
  term ((975429326994088929 : Rat) / 113193580069603244) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-975429326994088929 : Rat) / 226387160139206488) [(0, 2), (14, 1), (16, 1)],
  term ((975429326994088929 : Rat) / 113193580069603244) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-975429326994088929 : Rat) / 226387160139206488) [(1, 2), (14, 1), (16, 1)],
  term ((-975429326994088929 : Rat) / 113193580069603244) [(6, 1), (14, 1), (16, 1)],
  term ((975429326994088929 : Rat) / 226387160139206488) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem ep_Q2_020_partial_15_0038_valid :
    mulPoly ep_Q2_020_coefficient_15_0038
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0039 : Poly :=
[
  term ((465714511921927797 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 39 for generator 15. -/
def ep_Q2_020_partial_15_0039 : Poly :=
[
  term ((-465714511921927797 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((465714511921927797 : Rat) / 56596790034801622) [(0, 2), (14, 2), (16, 1)],
  term ((-465714511921927797 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((465714511921927797 : Rat) / 56596790034801622) [(1, 2), (14, 2), (16, 1)],
  term ((465714511921927797 : Rat) / 28298395017400811) [(6, 1), (14, 2), (16, 1)],
  term ((-465714511921927797 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem ep_Q2_020_partial_15_0039_valid :
    mulPoly ep_Q2_020_coefficient_15_0039
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0040 : Poly :=
[
  term ((-10896280503586995 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 40 for generator 15. -/
def ep_Q2_020_partial_15_0040 : Poly :=
[
  term ((10896280503586995 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-10896280503586995 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((10896280503586995 : Rat) / 28298395017400811) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-10896280503586995 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((-10896280503586995 : Rat) / 28298395017400811) [(6, 1), (15, 2), (16, 1)],
  term ((10896280503586995 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 15. -/
theorem ep_Q2_020_partial_15_0040_valid :
    mulPoly ep_Q2_020_coefficient_15_0040
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 15. -/
def ep_Q2_020_coefficient_15_0041 : Poly :=
[
  term ((81494647025614695 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 41 for generator 15. -/
def ep_Q2_020_partial_15_0041 : Poly :=
[
  term ((-81494647025614695 : Rat) / 113193580069603244) [(0, 1), (6, 1), (16, 1)],
  term ((81494647025614695 : Rat) / 226387160139206488) [(0, 2), (16, 1)],
  term ((-81494647025614695 : Rat) / 113193580069603244) [(1, 1), (7, 1), (16, 1)],
  term ((81494647025614695 : Rat) / 226387160139206488) [(1, 2), (16, 1)],
  term ((81494647025614695 : Rat) / 113193580069603244) [(6, 1), (16, 1)],
  term ((-81494647025614695 : Rat) / 226387160139206488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 15. -/
theorem ep_Q2_020_partial_15_0041_valid :
    mulPoly ep_Q2_020_coefficient_15_0041
        ep_Q2_020_generator_15_0000_0041 =
      ep_Q2_020_partial_15_0041 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_15_0000_0041 : List Poly :=
[
  ep_Q2_020_partial_15_0000,
  ep_Q2_020_partial_15_0001,
  ep_Q2_020_partial_15_0002,
  ep_Q2_020_partial_15_0003,
  ep_Q2_020_partial_15_0004,
  ep_Q2_020_partial_15_0005,
  ep_Q2_020_partial_15_0006,
  ep_Q2_020_partial_15_0007,
  ep_Q2_020_partial_15_0008,
  ep_Q2_020_partial_15_0009,
  ep_Q2_020_partial_15_0010,
  ep_Q2_020_partial_15_0011,
  ep_Q2_020_partial_15_0012,
  ep_Q2_020_partial_15_0013,
  ep_Q2_020_partial_15_0014,
  ep_Q2_020_partial_15_0015,
  ep_Q2_020_partial_15_0016,
  ep_Q2_020_partial_15_0017,
  ep_Q2_020_partial_15_0018,
  ep_Q2_020_partial_15_0019,
  ep_Q2_020_partial_15_0020,
  ep_Q2_020_partial_15_0021,
  ep_Q2_020_partial_15_0022,
  ep_Q2_020_partial_15_0023,
  ep_Q2_020_partial_15_0024,
  ep_Q2_020_partial_15_0025,
  ep_Q2_020_partial_15_0026,
  ep_Q2_020_partial_15_0027,
  ep_Q2_020_partial_15_0028,
  ep_Q2_020_partial_15_0029,
  ep_Q2_020_partial_15_0030,
  ep_Q2_020_partial_15_0031,
  ep_Q2_020_partial_15_0032,
  ep_Q2_020_partial_15_0033,
  ep_Q2_020_partial_15_0034,
  ep_Q2_020_partial_15_0035,
  ep_Q2_020_partial_15_0036,
  ep_Q2_020_partial_15_0037,
  ep_Q2_020_partial_15_0038,
  ep_Q2_020_partial_15_0039,
  ep_Q2_020_partial_15_0040,
  ep_Q2_020_partial_15_0041
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_15_0000_0041 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((4040414910608076 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((57570797552749536 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (9, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-366861094281364716 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((119391057074223183 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (1, 2), (7, 1), (9, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-119391057074223183 : Rat) / 56596790034801622) [(0, 1), (1, 2), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((69554795054241828 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((-56239907694558840 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-68291381520110964 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((-407773479537926892 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((552083038300801764 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-552083038300801764 : Rat) / 28298395017400811) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((14392699388187384 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((795098761906071285 : Rat) / 56596790034801622) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11742385719851223 : Rat) / 2460730001513114) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((540146232898769385 : Rat) / 56596790034801622) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-271670638981720665 : Rat) / 56596790034801622) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((31554283730332032 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((1037925125431054377 : Rat) / 113193580069603244) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-465714511921927797 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((101398124153031123 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-559058875322507427 : Rat) / 113193580069603244) [(0, 1), (6, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7811974804620681 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)],
  term ((119391057074223183 : Rat) / 56596790034801622) [(0, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-2020207455304038 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((11993337633468438 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-28785398776374768 : Rat) / 28298395017400811) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((183430547140682358 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((491857845920892 : Rat) / 1230365000756557) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-34777397527120914 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((28119953847279420 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((9523835146433322 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-3949649825677806 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 2), (5, 2), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5965099473039714 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((131384394707691621 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((59966688167342190 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(0, 2), (8, 1), (16, 1)],
  term ((-7196349694093692 : Rat) / 28298395017400811) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10718154482433750 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-795098761906071285 : Rat) / 113193580069603244) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((11742385719851223 : Rat) / 4921460003026228) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-540146232898769385 : Rat) / 113193580069603244) [(0, 2), (12, 1), (16, 1)],
  term ((443161110700660665 : Rat) / 113193580069603244) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15777141865166016 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((-975429326994088929 : Rat) / 226387160139206488) [(0, 2), (14, 1), (16, 1)],
  term ((465714511921927797 : Rat) / 56596790034801622) [(0, 2), (14, 2), (16, 1)],
  term ((-10896280503586995 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((81494647025614695 : Rat) / 226387160139206488) [(0, 2), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 3), (7, 1), (9, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 3), (15, 2), (16, 1)],
  term ((-119391057074223183 : Rat) / 56596790034801622) [(0, 3), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((69554795054241828 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-4040414910608076 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((7899299651355612 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-56239907694558840 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((2020207455304038 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((366861094281364716 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((552083038300801764 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-552083038300801764 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((14392699388187384 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((795098761906071285 : Rat) / 56596790034801622) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11742385719851223 : Rat) / 2460730001513114) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((540146232898769385 : Rat) / 56596790034801622) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-443161110700660665 : Rat) / 56596790034801622) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((31554283730332032 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((975429326994088929 : Rat) / 113193580069603244) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-465714511921927797 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((10896280503586995 : Rat) / 28298395017400811) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-129467997559488447 : Rat) / 113193580069603244) [(1, 1), (7, 1), (16, 1)],
  term ((-119933376334684380 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((8266557160685088 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-183430547140682358 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-491857845920892 : Rat) / 1230365000756557) [(1, 1), (15, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-34777397527120914 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((784399237997256 : Rat) / 690204756521971) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((9523835146433322 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-3949649825677806 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term ((11993337633468438 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((117537485720091726 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-370994372861707260 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1036411830079956 : Rat) / 28298395017400811) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-23986675266936876 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)],
  term ((-7196349694093692 : Rat) / 28298395017400811) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10718154482433750 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-795098761906071285 : Rat) / 113193580069603244) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((11742385719851223 : Rat) / 4921460003026228) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-540146232898769385 : Rat) / 113193580069603244) [(1, 2), (12, 1), (16, 1)],
  term ((443161110700660665 : Rat) / 113193580069603244) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15777141865166016 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)],
  term ((-975429326994088929 : Rat) / 226387160139206488) [(1, 2), (14, 1), (16, 1)],
  term ((465714511921927797 : Rat) / 56596790034801622) [(1, 2), (14, 2), (16, 1)],
  term ((-10896280503586995 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((81494647025614695 : Rat) / 226387160139206488) [(1, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 3), (5, 1), (14, 1), (16, 1)],
  term ((-2020207455304038 : Rat) / 28298395017400811) [(1, 3), (5, 1), (16, 1)],
  term ((11993337633468438 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)],
  term ((-28785398776374768 : Rat) / 28298395017400811) [(1, 3), (9, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((183430547140682358 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((491857845920892 : Rat) / 1230365000756557) [(1, 3), (15, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-69554795054241828 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((34777397527120914 : Rat) / 28298395017400811) [(4, 1), (16, 1)],
  term ((56239907694558840 : Rat) / 28298395017400811) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-7899299651355612 : Rat) / 28298395017400811) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-28119953847279420 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9523835146433322 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((3949649825677806 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(5, 2), (16, 1)],
  term ((119933376334684380 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-8266557160685088 : Rat) / 28298395017400811) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-552083038300801764 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((552083038300801764 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)],
  term ((-14392699388187384 : Rat) / 28298395017400811) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-795098761906071285 : Rat) / 56596790034801622) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((11742385719851223 : Rat) / 2460730001513114) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-540146232898769385 : Rat) / 56596790034801622) [(6, 1), (12, 1), (16, 1)],
  term ((443161110700660665 : Rat) / 56596790034801622) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31554283730332032 : Rat) / 28298395017400811) [(6, 1), (13, 2), (16, 1)],
  term ((-1061785523323213233 : Rat) / 113193580069603244) [(6, 1), (14, 1), (16, 1)],
  term ((465714511921927797 : Rat) / 28298395017400811) [(6, 1), (14, 2), (16, 1)],
  term ((-10896280503586995 : Rat) / 28298395017400811) [(6, 1), (15, 2), (16, 1)],
  term ((33521296491740943 : Rat) / 113193580069603244) [(6, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)],
  term ((23986675266936876 : Rat) / 28298395017400811) [(6, 2), (16, 1)],
  term ((-59966688167342190 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)],
  term ((276041519150400882 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)],
  term ((-276041519150400882 : Rat) / 28298395017400811) [(8, 1), (16, 1)],
  term ((7196349694093692 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10718154482433750 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)],
  term ((-983715691841784 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((795098761906071285 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)],
  term ((-11742385719851223 : Rat) / 4921460003026228) [(12, 1), (14, 1), (16, 1)],
  term ((540146232898769385 : Rat) / 113193580069603244) [(12, 1), (16, 1)],
  term ((-443161110700660665 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)],
  term ((15777141865166016 : Rat) / 28298395017400811) [(13, 2), (16, 1)],
  term ((975429326994088929 : Rat) / 226387160139206488) [(14, 1), (16, 1)],
  term ((-465714511921927797 : Rat) / 56596790034801622) [(14, 2), (16, 1)],
  term ((10896280503586995 : Rat) / 56596790034801622) [(15, 2), (16, 1)],
  term ((-81494647025614695 : Rat) / 226387160139206488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 41. -/
theorem ep_Q2_020_block_15_0000_0041_valid :
    checkProductSumEq ep_Q2_020_partials_15_0000_0041
      ep_Q2_020_block_15_0000_0041 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
