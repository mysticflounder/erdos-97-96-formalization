/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 9:0-53

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_09_0000_0053 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0000 : Poly :=
[
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def ep_Q2_020_partial_09_0000 : Poly :=
[
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem ep_Q2_020_partial_09_0000_valid :
    mulPoly ep_Q2_020_coefficient_09_0000
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0001 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def ep_Q2_020_partial_09_0001 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem ep_Q2_020_partial_09_0001_valid :
    mulPoly ep_Q2_020_coefficient_09_0001
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0002 : Poly :=
[
  term ((123682141813690818 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def ep_Q2_020_partial_09_0002 : Poly :=
[
  term ((-247364283627381636 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (6, 1), (16, 1)],
  term ((123682141813690818 : Rat) / 28298395017400811) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((-247364283627381636 : Rat) / 28298395017400811) [(0, 2), (2, 1), (6, 1), (16, 1)],
  term ((123682141813690818 : Rat) / 28298395017400811) [(0, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem ep_Q2_020_partial_09_0002_valid :
    mulPoly ep_Q2_020_coefficient_09_0002
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0003 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def ep_Q2_020_partial_09_0003 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem ep_Q2_020_partial_09_0003_valid :
    mulPoly ep_Q2_020_coefficient_09_0003
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0004 : Poly :=
[
  term ((4736835034217437707 : Rat) / 56596790034801622) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def ep_Q2_020_partial_09_0004 : Poly :=
[
  term ((-4736835034217437707 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((4736835034217437707 : Rat) / 56596790034801622) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4736835034217437707 : Rat) / 28298395017400811) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((4736835034217437707 : Rat) / 56596790034801622) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem ep_Q2_020_partial_09_0004_valid :
    mulPoly ep_Q2_020_coefficient_09_0004
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0005 : Poly :=
[
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def ep_Q2_020_partial_09_0005 : Poly :=
[
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem ep_Q2_020_partial_09_0005_valid :
    mulPoly ep_Q2_020_coefficient_09_0005
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0006 : Poly :=
[
  term ((1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def ep_Q2_020_partial_09_0006 : Poly :=
[
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem ep_Q2_020_partial_09_0006_valid :
    mulPoly ep_Q2_020_coefficient_09_0006
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0007 : Poly :=
[
  term ((-40388836638459195 : Rat) / 3903226898951836) [(0, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def ep_Q2_020_partial_09_0007 : Poly :=
[
  term ((40388836638459195 : Rat) / 1951613449475918) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((-40388836638459195 : Rat) / 3903226898951836) [(0, 1), (1, 2), (16, 1)],
  term ((40388836638459195 : Rat) / 1951613449475918) [(0, 2), (2, 1), (16, 1)],
  term ((-40388836638459195 : Rat) / 3903226898951836) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem ep_Q2_020_partial_09_0007_valid :
    mulPoly ep_Q2_020_coefficient_09_0007
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0008 : Poly :=
[
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 2), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def ep_Q2_020_partial_09_0008 : Poly :=
[
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 2), (1, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 3), (2, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem ep_Q2_020_partial_09_0008_valid :
    mulPoly ep_Q2_020_coefficient_09_0008
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0009 : Poly :=
[
  term ((-61473647041737255 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def ep_Q2_020_partial_09_0009 : Poly :=
[
  term ((122947294083474510 : Rat) / 28298395017400811) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-61473647041737255 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((122947294083474510 : Rat) / 28298395017400811) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-61473647041737255 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem ep_Q2_020_partial_09_0009_valid :
    mulPoly ep_Q2_020_coefficient_09_0009
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0010 : Poly :=
[
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def ep_Q2_020_partial_09_0010 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem ep_Q2_020_partial_09_0010_valid :
    mulPoly ep_Q2_020_coefficient_09_0010
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0011 : Poly :=
[
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def ep_Q2_020_partial_09_0011 : Poly :=
[
  term ((-15007255382258568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem ep_Q2_020_partial_09_0011_valid :
    mulPoly ep_Q2_020_coefficient_09_0011
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0012 : Poly :=
[
  term ((298195461374196423 : Rat) / 113193580069603244) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def ep_Q2_020_partial_09_0012 : Poly :=
[
  term ((-298195461374196423 : Rat) / 56596790034801622) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((298195461374196423 : Rat) / 113193580069603244) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-298195461374196423 : Rat) / 56596790034801622) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((298195461374196423 : Rat) / 113193580069603244) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem ep_Q2_020_partial_09_0012_valid :
    mulPoly ep_Q2_020_coefficient_09_0012
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0013 : Poly :=
[
  term ((-639834428000578344 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def ep_Q2_020_partial_09_0013 : Poly :=
[
  term ((1279668856001156688 : Rat) / 28298395017400811) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-639834428000578344 : Rat) / 28298395017400811) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((1279668856001156688 : Rat) / 28298395017400811) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-639834428000578344 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem ep_Q2_020_partial_09_0013_valid :
    mulPoly ep_Q2_020_coefficient_09_0013
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0014 : Poly :=
[
  term ((-639834428000578344 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def ep_Q2_020_partial_09_0014 : Poly :=
[
  term ((1279668856001156688 : Rat) / 28298395017400811) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-639834428000578344 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1279668856001156688 : Rat) / 28298395017400811) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-639834428000578344 : Rat) / 28298395017400811) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem ep_Q2_020_partial_09_0014_valid :
    mulPoly ep_Q2_020_coefficient_09_0014
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0015 : Poly :=
[
  term ((-12684748816562382 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def ep_Q2_020_partial_09_0015 : Poly :=
[
  term ((25369497633124764 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem ep_Q2_020_partial_09_0015_valid :
    mulPoly ep_Q2_020_coefficient_09_0015
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0016 : Poly :=
[
  term ((-17383894199559216 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def ep_Q2_020_partial_09_0016 : Poly :=
[
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (8, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem ep_Q2_020_partial_09_0016_valid :
    mulPoly ep_Q2_020_coefficient_09_0016
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0017 : Poly :=
[
  term ((109045803772077474 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def ep_Q2_020_partial_09_0017 : Poly :=
[
  term ((-218091607544154948 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem ep_Q2_020_partial_09_0017_valid :
    mulPoly ep_Q2_020_coefficient_09_0017
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0018 : Poly :=
[
  term ((-90356983053517002 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def ep_Q2_020_partial_09_0018 : Poly :=
[
  term ((180713966107034004 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-90356983053517002 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((180713966107034004 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-90356983053517002 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem ep_Q2_020_partial_09_0018_valid :
    mulPoly ep_Q2_020_coefficient_09_0018
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0019 : Poly :=
[
  term ((22023285084145872 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def ep_Q2_020_partial_09_0019 : Poly :=
[
  term ((-44046570168291744 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((22023285084145872 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((-44046570168291744 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((22023285084145872 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem ep_Q2_020_partial_09_0019_valid :
    mulPoly ep_Q2_020_coefficient_09_0019
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0020 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def ep_Q2_020_partial_09_0020 : Poly :=
[
  term ((41831426046830472 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem ep_Q2_020_partial_09_0020_valid :
    mulPoly ep_Q2_020_coefficient_09_0020
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0021 : Poly :=
[
  term ((-12684748816562382 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def ep_Q2_020_partial_09_0021 : Poly :=
[
  term ((25369497633124764 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem ep_Q2_020_partial_09_0021_valid :
    mulPoly ep_Q2_020_coefficient_09_0021
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0022 : Poly :=
[
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def ep_Q2_020_partial_09_0022 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem ep_Q2_020_partial_09_0022_valid :
    mulPoly ep_Q2_020_coefficient_09_0022
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0023 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def ep_Q2_020_partial_09_0023 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem ep_Q2_020_partial_09_0023_valid :
    mulPoly ep_Q2_020_coefficient_09_0023
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0024 : Poly :=
[
  term ((-93900550060766514 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def ep_Q2_020_partial_09_0024 : Poly :=
[
  term ((187801100121533028 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-93900550060766514 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((187801100121533028 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-93900550060766514 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem ep_Q2_020_partial_09_0024_valid :
    mulPoly ep_Q2_020_coefficient_09_0024
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0025 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 9. -/
def ep_Q2_020_partial_09_0025 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem ep_Q2_020_partial_09_0025_valid :
    mulPoly ep_Q2_020_coefficient_09_0025
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0026 : Poly :=
[
  term ((-126397342039221324 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def ep_Q2_020_partial_09_0026 : Poly :=
[
  term ((252794684078442648 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-126397342039221324 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((252794684078442648 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-126397342039221324 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem ep_Q2_020_partial_09_0026_valid :
    mulPoly ep_Q2_020_coefficient_09_0026
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0027 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 27 for generator 9. -/
def ep_Q2_020_partial_09_0027 : Poly :=
[
  term ((41831426046830472 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(0, 2), (5, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem ep_Q2_020_partial_09_0027_valid :
    mulPoly ep_Q2_020_coefficient_09_0027
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0028 : Poly :=
[
  term ((80424576917094150 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 28 for generator 9. -/
def ep_Q2_020_partial_09_0028 : Poly :=
[
  term ((-160849153834188300 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 1), (8, 1), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((-160849153834188300 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(1, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem ep_Q2_020_partial_09_0028_valid :
    mulPoly ep_Q2_020_coefficient_09_0028
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0029 : Poly :=
[
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 29 for generator 9. -/
def ep_Q2_020_partial_09_0029 : Poly :=
[
  term ((73385709777162504 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(1, 2), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem ep_Q2_020_partial_09_0029_valid :
    mulPoly ep_Q2_020_coefficient_09_0029
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0030 : Poly :=
[
  term ((-57882529500825348 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def ep_Q2_020_partial_09_0030 : Poly :=
[
  term ((115765059001650696 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((-57882529500825348 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((115765059001650696 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((-57882529500825348 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem ep_Q2_020_partial_09_0030_valid :
    mulPoly ep_Q2_020_coefficient_09_0030
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0031 : Poly :=
[
  term ((-50094011088540531 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def ep_Q2_020_partial_09_0031 : Poly :=
[
  term ((100188022177081062 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 2), (16, 1)],
  term ((-50094011088540531 : Rat) / 28298395017400811) [(0, 2), (6, 2), (16, 1)],
  term ((100188022177081062 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-50094011088540531 : Rat) / 28298395017400811) [(1, 2), (6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem ep_Q2_020_partial_09_0031_valid :
    mulPoly ep_Q2_020_coefficient_09_0031
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0032 : Poly :=
[
  term ((87762977821768032 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def ep_Q2_020_partial_09_0032 : Poly :=
[
  term ((-175525955643536064 : Rat) / 28298395017400811) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem ep_Q2_020_partial_09_0032_valid :
    mulPoly ep_Q2_020_coefficient_09_0032
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0033 : Poly :=
[
  term ((174523853635272 : Rat) / 23800164017999) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 9. -/
def ep_Q2_020_partial_09_0033 : Poly :=
[
  term ((-349047707270544 : Rat) / 23800164017999) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((174523853635272 : Rat) / 23800164017999) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-349047707270544 : Rat) / 23800164017999) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((174523853635272 : Rat) / 23800164017999) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem ep_Q2_020_partial_09_0033_valid :
    mulPoly ep_Q2_020_coefficient_09_0033
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0034 : Poly :=
[
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 9. -/
def ep_Q2_020_partial_09_0034 : Poly :=
[
  term ((67585916942320122 : Rat) / 28298395017400811) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem ep_Q2_020_partial_09_0034_valid :
    mulPoly ep_Q2_020_coefficient_09_0034
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0035 : Poly :=
[
  term ((-67603449668539401 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 35 for generator 9. -/
def ep_Q2_020_partial_09_0035 : Poly :=
[
  term ((135206899337078802 : Rat) / 28298395017400811) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((-67603449668539401 : Rat) / 28298395017400811) [(0, 2), (7, 2), (16, 1)],
  term ((135206899337078802 : Rat) / 28298395017400811) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-67603449668539401 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem ep_Q2_020_partial_09_0035_valid :
    mulPoly ep_Q2_020_coefficient_09_0035
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0036 : Poly :=
[
  term ((115192365316212582 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 36 for generator 9. -/
def ep_Q2_020_partial_09_0036 : Poly :=
[
  term ((-230384730632425164 : Rat) / 28298395017400811) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((115192365316212582 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((-230384730632425164 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term ((115192365316212582 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem ep_Q2_020_partial_09_0036_valid :
    mulPoly ep_Q2_020_coefficient_09_0036
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0037 : Poly :=
[
  term ((-178233048033747516 : Rat) / 28298395017400811) [(8, 1), (16, 1)]
]

/-- Partial product 37 for generator 9. -/
def ep_Q2_020_partial_09_0037 : Poly :=
[
  term ((356466096067495032 : Rat) / 28298395017400811) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(0, 2), (8, 1), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem ep_Q2_020_partial_09_0037_valid :
    mulPoly ep_Q2_020_coefficient_09_0037
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0038 : Poly :=
[
  term ((-884115564995022417 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 9. -/
def ep_Q2_020_partial_09_0038 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem ep_Q2_020_partial_09_0038_valid :
    mulPoly ep_Q2_020_coefficient_09_0038
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0039 : Poly :=
[
  term ((-172681901547872376 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 39 for generator 9. -/
def ep_Q2_020_partial_09_0039 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem ep_Q2_020_partial_09_0039_valid :
    mulPoly ep_Q2_020_coefficient_09_0039
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0040 : Poly :=
[
  term ((979528844998953843 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 9. -/
def ep_Q2_020_partial_09_0040 : Poly :=
[
  term ((-979528844998953843 : Rat) / 56596790034801622) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem ep_Q2_020_partial_09_0040_valid :
    mulPoly ep_Q2_020_coefficient_09_0040
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0041 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 41 for generator 9. -/
def ep_Q2_020_partial_09_0041 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem ep_Q2_020_partial_09_0041_valid :
    mulPoly ep_Q2_020_coefficient_09_0041
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0042 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 9. -/
def ep_Q2_020_partial_09_0042 : Poly :=
[
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem ep_Q2_020_partial_09_0042_valid :
    mulPoly ep_Q2_020_coefficient_09_0042
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0043 : Poly :=
[
  term ((-1109870930587903911 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 9. -/
def ep_Q2_020_partial_09_0043 : Poly :=
[
  term ((1109870930587903911 : Rat) / 56596790034801622) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1109870930587903911 : Rat) / 113193580069603244) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((1109870930587903911 : Rat) / 56596790034801622) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1109870930587903911 : Rat) / 113193580069603244) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem ep_Q2_020_partial_09_0043_valid :
    mulPoly ep_Q2_020_coefficient_09_0043
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0044 : Poly :=
[
  term ((107491990320579294 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 44 for generator 9. -/
def ep_Q2_020_partial_09_0044 : Poly :=
[
  term ((-214983980641158588 : Rat) / 28298395017400811) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((107491990320579294 : Rat) / 28298395017400811) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-214983980641158588 : Rat) / 28298395017400811) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((107491990320579294 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem ep_Q2_020_partial_09_0044_valid :
    mulPoly ep_Q2_020_coefficient_09_0044
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0045 : Poly :=
[
  term ((141197724390174294 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 45 for generator 9. -/
def ep_Q2_020_partial_09_0045 : Poly :=
[
  term ((-282395448780348588 : Rat) / 28298395017400811) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((141197724390174294 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((-282395448780348588 : Rat) / 28298395017400811) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((141197724390174294 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem ep_Q2_020_partial_09_0045_valid :
    mulPoly ep_Q2_020_coefficient_09_0045
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0046 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 9. -/
def ep_Q2_020_partial_09_0046 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem ep_Q2_020_partial_09_0046_valid :
    mulPoly ep_Q2_020_coefficient_09_0046
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0047 : Poly :=
[
  term ((10153555705222290 : Rat) / 975806724737959) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 9. -/
def ep_Q2_020_partial_09_0047 : Poly :=
[
  term ((-20307111410444580 : Rat) / 975806724737959) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((10153555705222290 : Rat) / 975806724737959) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20307111410444580 : Rat) / 975806724737959) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((10153555705222290 : Rat) / 975806724737959) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem ep_Q2_020_partial_09_0047_valid :
    mulPoly ep_Q2_020_coefficient_09_0047
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0048 : Poly :=
[
  term ((-146267701363826640 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

/-- Partial product 48 for generator 9. -/
def ep_Q2_020_partial_09_0048 : Poly :=
[
  term ((292535402727653280 : Rat) / 28298395017400811) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-146267701363826640 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((292535402727653280 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-146267701363826640 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem ep_Q2_020_partial_09_0048_valid :
    mulPoly ep_Q2_020_coefficient_09_0048
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0049 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 9. -/
def ep_Q2_020_partial_09_0049 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem ep_Q2_020_partial_09_0049_valid :
    mulPoly ep_Q2_020_coefficient_09_0049
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0050 : Poly :=
[
  term ((-372884842550379213 : Rat) / 113193580069603244) [(14, 1), (16, 1)]
]

/-- Partial product 50 for generator 9. -/
def ep_Q2_020_partial_09_0050 : Poly :=
[
  term ((372884842550379213 : Rat) / 56596790034801622) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-372884842550379213 : Rat) / 113193580069603244) [(0, 2), (14, 1), (16, 1)],
  term ((372884842550379213 : Rat) / 56596790034801622) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-372884842550379213 : Rat) / 113193580069603244) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem ep_Q2_020_partial_09_0050_valid :
    mulPoly ep_Q2_020_coefficient_09_0050
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0051 : Poly :=
[
  term ((412907997639494292 : Rat) / 28298395017400811) [(14, 2), (16, 1)]
]

/-- Partial product 51 for generator 9. -/
def ep_Q2_020_partial_09_0051 : Poly :=
[
  term ((-825815995278988584 : Rat) / 28298395017400811) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((412907997639494292 : Rat) / 28298395017400811) [(0, 2), (14, 2), (16, 1)],
  term ((-825815995278988584 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((412907997639494292 : Rat) / 28298395017400811) [(1, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem ep_Q2_020_partial_09_0051_valid :
    mulPoly ep_Q2_020_coefficient_09_0051
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0052 : Poly :=
[
  term ((-109939112928044241 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 52 for generator 9. -/
def ep_Q2_020_partial_09_0052 : Poly :=
[
  term ((109939112928044241 : Rat) / 28298395017400811) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-109939112928044241 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((109939112928044241 : Rat) / 28298395017400811) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-109939112928044241 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem ep_Q2_020_partial_09_0052_valid :
    mulPoly ep_Q2_020_coefficient_09_0052
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def ep_Q2_020_coefficient_09_0053 : Poly :=
[
  term ((-2148232268285900109 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 53 for generator 9. -/
def ep_Q2_020_partial_09_0053 : Poly :=
[
  term ((2148232268285900109 : Rat) / 113193580069603244) [(0, 1), (2, 1), (16, 1)],
  term ((-2148232268285900109 : Rat) / 226387160139206488) [(0, 2), (16, 1)],
  term ((2148232268285900109 : Rat) / 113193580069603244) [(1, 1), (3, 1), (16, 1)],
  term ((-2148232268285900109 : Rat) / 226387160139206488) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem ep_Q2_020_partial_09_0053_valid :
    mulPoly ep_Q2_020_coefficient_09_0053
        ep_Q2_020_generator_09_0000_0053 =
      ep_Q2_020_partial_09_0053 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_09_0000_0053 : List Poly :=
[
  ep_Q2_020_partial_09_0000,
  ep_Q2_020_partial_09_0001,
  ep_Q2_020_partial_09_0002,
  ep_Q2_020_partial_09_0003,
  ep_Q2_020_partial_09_0004,
  ep_Q2_020_partial_09_0005,
  ep_Q2_020_partial_09_0006,
  ep_Q2_020_partial_09_0007,
  ep_Q2_020_partial_09_0008,
  ep_Q2_020_partial_09_0009,
  ep_Q2_020_partial_09_0010,
  ep_Q2_020_partial_09_0011,
  ep_Q2_020_partial_09_0012,
  ep_Q2_020_partial_09_0013,
  ep_Q2_020_partial_09_0014,
  ep_Q2_020_partial_09_0015,
  ep_Q2_020_partial_09_0016,
  ep_Q2_020_partial_09_0017,
  ep_Q2_020_partial_09_0018,
  ep_Q2_020_partial_09_0019,
  ep_Q2_020_partial_09_0020,
  ep_Q2_020_partial_09_0021,
  ep_Q2_020_partial_09_0022,
  ep_Q2_020_partial_09_0023,
  ep_Q2_020_partial_09_0024,
  ep_Q2_020_partial_09_0025,
  ep_Q2_020_partial_09_0026,
  ep_Q2_020_partial_09_0027,
  ep_Q2_020_partial_09_0028,
  ep_Q2_020_partial_09_0029,
  ep_Q2_020_partial_09_0030,
  ep_Q2_020_partial_09_0031,
  ep_Q2_020_partial_09_0032,
  ep_Q2_020_partial_09_0033,
  ep_Q2_020_partial_09_0034,
  ep_Q2_020_partial_09_0035,
  ep_Q2_020_partial_09_0036,
  ep_Q2_020_partial_09_0037,
  ep_Q2_020_partial_09_0038,
  ep_Q2_020_partial_09_0039,
  ep_Q2_020_partial_09_0040,
  ep_Q2_020_partial_09_0041,
  ep_Q2_020_partial_09_0042,
  ep_Q2_020_partial_09_0043,
  ep_Q2_020_partial_09_0044,
  ep_Q2_020_partial_09_0045,
  ep_Q2_020_partial_09_0046,
  ep_Q2_020_partial_09_0047,
  ep_Q2_020_partial_09_0048,
  ep_Q2_020_partial_09_0049,
  ep_Q2_020_partial_09_0050,
  ep_Q2_020_partial_09_0051,
  ep_Q2_020_partial_09_0052,
  ep_Q2_020_partial_09_0053
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_09_0000_0053 : Poly :=
[
  term ((122947294083474510 : Rat) / 28298395017400811) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-298195461374196423 : Rat) / 56596790034801622) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-247364283627381636 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (6, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4736835034217437707 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((40388836638459195 : Rat) / 1951613449475918) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((123682141813690818 : Rat) / 28298395017400811) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((4736835034217437707 : Rat) / 56596790034801622) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-40388836638459195 : Rat) / 3903226898951836) [(0, 1), (1, 2), (16, 1)],
  term ((1279668856001156688 : Rat) / 28298395017400811) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (6, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((180713966107034004 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-44046570168291744 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 2), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((187801100121533028 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((252794684078442648 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 2), (16, 1)],
  term ((-160849153834188300 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 1), (8, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term ((115765059001650696 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((100188022177081062 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 2), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-349047707270544 : Rat) / 23800164017999) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((135206899337078802 : Rat) / 28298395017400811) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((-230384730632425164 : Rat) / 28298395017400811) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1109870930587903911 : Rat) / 56596790034801622) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-214983980641158588 : Rat) / 28298395017400811) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-282395448780348588 : Rat) / 28298395017400811) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20307111410444580 : Rat) / 975806724737959) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((292535402727653280 : Rat) / 28298395017400811) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((372884842550379213 : Rat) / 56596790034801622) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-825815995278988584 : Rat) / 28298395017400811) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((109939112928044241 : Rat) / 28298395017400811) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((2148232268285900109 : Rat) / 113193580069603244) [(0, 1), (2, 1), (16, 1)],
  term ((1279668856001156688 : Rat) / 28298395017400811) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-61473647041737255 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((298195461374196423 : Rat) / 113193580069603244) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 2), (1, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-247364283627381636 : Rat) / 28298395017400811) [(0, 2), (2, 1), (6, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4736835034217437707 : Rat) / 28298395017400811) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-2721678667959945612 : Rat) / 28298395017400811) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((40388836638459195 : Rat) / 1951613449475918) [(0, 2), (2, 1), (16, 1)],
  term ((-639834428000578344 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-90356983053517002 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((22023285084145872 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-93900550060766514 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-126397342039221324 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(0, 2), (5, 2), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-57882529500825348 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((-50094011088540531 : Rat) / 28298395017400811) [(0, 2), (6, 2), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((174523853635272 : Rat) / 23800164017999) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-67603449668539401 : Rat) / 28298395017400811) [(0, 2), (7, 2), (16, 1)],
  term ((115192365316212582 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(0, 2), (8, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1109870930587903911 : Rat) / 113193580069603244) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((107491990320579294 : Rat) / 28298395017400811) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((141197724390174294 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10153555705222290 : Rat) / 975806724737959) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-146267701363826640 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-372884842550379213 : Rat) / 113193580069603244) [(0, 2), (14, 1), (16, 1)],
  term ((412907997639494292 : Rat) / 28298395017400811) [(0, 2), (14, 2), (16, 1)],
  term ((-109939112928044241 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((-2148232268285900109 : Rat) / 226387160139206488) [(0, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 3), (2, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((123682141813690818 : Rat) / 28298395017400811) [(0, 3), (6, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((4736835034217437707 : Rat) / 56596790034801622) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)],
  term ((-40388836638459195 : Rat) / 3903226898951836) [(0, 3), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 4), (16, 1)],
  term ((1279668856001156688 : Rat) / 28298395017400811) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (8, 1), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((180713966107034004 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-44046570168291744 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(1, 1), (3, 1), (4, 2), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((187801100121533028 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((252794684078442648 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-160849153834188300 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (12, 1), (16, 1)],
  term ((115765059001650696 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((100188022177081062 : Rat) / 28298395017400811) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((-349047707270544 : Rat) / 23800164017999) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((135206899337078802 : Rat) / 28298395017400811) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-230384730632425164 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1109870930587903911 : Rat) / 56596790034801622) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-214983980641158588 : Rat) / 28298395017400811) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((-282395448780348588 : Rat) / 28298395017400811) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20307111410444580 : Rat) / 975806724737959) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((292535402727653280 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((372884842550379213 : Rat) / 56596790034801622) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-825815995278988584 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((109939112928044241 : Rat) / 28298395017400811) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((2148232268285900109 : Rat) / 113193580069603244) [(1, 1), (3, 1), (16, 1)],
  term ((1279668856001156688 : Rat) / 28298395017400811) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-639834428000578344 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((122947294083474510 : Rat) / 28298395017400811) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1577864317375353111 : Rat) / 56596790034801622) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-90356983053517002 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((22023285084145872 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((-12684748816562382 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-93900550060766514 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-126397342039221324 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((80424576917094150 : Rat) / 28298395017400811) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((-57882529500825348 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((-50094011088540531 : Rat) / 28298395017400811) [(1, 2), (6, 2), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((174523853635272 : Rat) / 23800164017999) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-67603449668539401 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)],
  term ((115192365316212582 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(1, 2), (8, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1109870930587903911 : Rat) / 113193580069603244) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((107491990320579294 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((141197724390174294 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10153555705222290 : Rat) / 975806724737959) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-146267701363826640 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-372884842550379213 : Rat) / 113193580069603244) [(1, 2), (14, 1), (16, 1)],
  term ((412907997639494292 : Rat) / 28298395017400811) [(1, 2), (14, 2), (16, 1)],
  term ((-109939112928044241 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((-2148232268285900109 : Rat) / 226387160139206488) [(1, 2), (16, 1)],
  term ((-61473647041737255 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 3), (9, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)],
  term ((298195461374196423 : Rat) / 113193580069603244) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 53. -/
theorem ep_Q2_020_block_09_0000_0053_valid :
    checkProductSumEq ep_Q2_020_partials_09_0000_0053
      ep_Q2_020_block_09_0000_0053 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
