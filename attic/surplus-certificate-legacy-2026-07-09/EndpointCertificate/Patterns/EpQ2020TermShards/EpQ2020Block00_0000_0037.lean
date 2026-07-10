/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 0:0-37

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 0 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_00_0000_0037 : Poly :=
[
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0000 : Poly :=
[
  term ((-884115564995022417 : Rat) / 56596790034801622) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 0 for generator 0. -/
def ep_Q2_020_partial_00_0000 : Poly :=
[
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 0. -/
theorem ep_Q2_020_partial_00_0000_valid :
    mulPoly ep_Q2_020_coefficient_00_0000
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0001 : Poly :=
[
  term ((884115564995022417 : Rat) / 113193580069603244) [(0, 1), (16, 1)]
]

/-- Partial product 1 for generator 0. -/
def ep_Q2_020_partial_00_0001 : Poly :=
[
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 113193580069603244) [(0, 1), (4, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 113193580069603244) [(0, 1), (5, 2), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 0. -/
theorem ep_Q2_020_partial_00_0001_valid :
    mulPoly ep_Q2_020_coefficient_00_0001
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0002 : Poly :=
[
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 0. -/
def ep_Q2_020_partial_00_0002 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(0, 1), (1, 1), (4, 1), (9, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 0. -/
theorem ep_Q2_020_partial_00_0002_valid :
    mulPoly ep_Q2_020_coefficient_00_0002
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0003 : Poly :=
[
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 0. -/
def ep_Q2_020_partial_00_0003 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 0. -/
theorem ep_Q2_020_partial_00_0003_valid :
    mulPoly ep_Q2_020_coefficient_00_0003
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0004 : Poly :=
[
  term ((17383894199559216 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 4 for generator 0. -/
def ep_Q2_020_partial_00_0004 : Poly :=
[
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 0. -/
theorem ep_Q2_020_partial_00_0004_valid :
    mulPoly ep_Q2_020_coefficient_00_0004
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0005 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 0. -/
def ep_Q2_020_partial_00_0005 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 0. -/
theorem ep_Q2_020_partial_00_0005_valid :
    mulPoly ep_Q2_020_coefficient_00_0005
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0006 : Poly :=
[
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 6 for generator 0. -/
def ep_Q2_020_partial_00_0006 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 0. -/
theorem ep_Q2_020_partial_00_0006_valid :
    mulPoly ep_Q2_020_coefficient_00_0006
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0007 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 0. -/
def ep_Q2_020_partial_00_0007 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 0. -/
theorem ep_Q2_020_partial_00_0007_valid :
    mulPoly ep_Q2_020_coefficient_00_0007
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0008 : Poly :=
[
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 0. -/
def ep_Q2_020_partial_00_0008 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 0. -/
theorem ep_Q2_020_partial_00_0008_valid :
    mulPoly ep_Q2_020_coefficient_00_0008
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0009 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 0. -/
def ep_Q2_020_partial_00_0009 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 0. -/
theorem ep_Q2_020_partial_00_0009_valid :
    mulPoly ep_Q2_020_coefficient_00_0009
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0010 : Poly :=
[
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 0. -/
def ep_Q2_020_partial_00_0010 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 0. -/
theorem ep_Q2_020_partial_00_0010_valid :
    mulPoly ep_Q2_020_coefficient_00_0010
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0011 : Poly :=
[
  term ((-70318234713726288 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 11 for generator 0. -/
def ep_Q2_020_partial_00_0011 : Poly :=
[
  term ((-140636469427452576 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 0. -/
theorem ep_Q2_020_partial_00_0011_valid :
    mulPoly ep_Q2_020_coefficient_00_0011
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0012 : Poly :=
[
  term ((31407303511298502 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 12 for generator 0. -/
def ep_Q2_020_partial_00_0012 : Poly :=
[
  term ((62814607022597004 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((62814607022597004 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-31407303511298502 : Rat) / 28298395017400811) [(4, 2), (6, 1), (16, 1)],
  term ((-31407303511298502 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 0. -/
theorem ep_Q2_020_partial_00_0012_valid :
    mulPoly ep_Q2_020_coefficient_00_0012
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0013 : Poly :=
[
  term ((33792958471160061 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 13 for generator 0. -/
def ep_Q2_020_partial_00_0013 : Poly :=
[
  term ((67585916942320122 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 0. -/
theorem ep_Q2_020_partial_00_0013_valid :
    mulPoly ep_Q2_020_coefficient_00_0013
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0014 : Poly :=
[
  term ((-89343920000369844 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 0. -/
def ep_Q2_020_partial_00_0014 : Poly :=
[
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 0. -/
theorem ep_Q2_020_partial_00_0014_valid :
    mulPoly ep_Q2_020_coefficient_00_0014
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0015 : Poly :=
[
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 0. -/
def ep_Q2_020_partial_00_0015 : Poly :=
[
  term ((-67585916942320122 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 0. -/
theorem ep_Q2_020_partial_00_0015_valid :
    mulPoly ep_Q2_020_coefficient_00_0015
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0016 : Poly :=
[
  term ((35980012900405314 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 16 for generator 0. -/
def ep_Q2_020_partial_00_0016 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 0. -/
theorem ep_Q2_020_partial_00_0016_valid :
    mulPoly ep_Q2_020_coefficient_00_0016
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0017 : Poly :=
[
  term ((-160218385881654951 : Rat) / 1951613449475918) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 0. -/
def ep_Q2_020_partial_00_0017 : Poly :=
[
  term ((-160218385881654951 : Rat) / 975806724737959) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 0. -/
theorem ep_Q2_020_partial_00_0017_valid :
    mulPoly ep_Q2_020_coefficient_00_0017
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0018 : Poly :=
[
  term ((87737167665976644 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 0. -/
def ep_Q2_020_partial_00_0018 : Poly :=
[
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(5, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 0. -/
theorem ep_Q2_020_partial_00_0018_valid :
    mulPoly ep_Q2_020_coefficient_00_0018
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0019 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 0. -/
def ep_Q2_020_partial_00_0019 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 0. -/
theorem ep_Q2_020_partial_00_0019_valid :
    mulPoly ep_Q2_020_coefficient_00_0019
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0020 : Poly :=
[
  term ((-1305045691428170535 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 0. -/
def ep_Q2_020_partial_00_0020 : Poly :=
[
  term ((-2610091382856341070 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-2610091382856341070 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((1305045691428170535 : Rat) / 28298395017400811) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((1305045691428170535 : Rat) / 28298395017400811) [(5, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 0. -/
theorem ep_Q2_020_partial_00_0020_valid :
    mulPoly ep_Q2_020_coefficient_00_0020
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0021 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 0. -/
def ep_Q2_020_partial_00_0021 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 0. -/
theorem ep_Q2_020_partial_00_0021_valid :
    mulPoly ep_Q2_020_coefficient_00_0021
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0022 : Poly :=
[
  term ((535983730083744771 : Rat) / 113193580069603244) [(8, 1), (16, 1)]
]

/-- Partial product 22 for generator 0. -/
def ep_Q2_020_partial_00_0022 : Poly :=
[
  term ((535983730083744771 : Rat) / 56596790034801622) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((535983730083744771 : Rat) / 56596790034801622) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-535983730083744771 : Rat) / 113193580069603244) [(4, 2), (8, 1), (16, 1)],
  term ((-535983730083744771 : Rat) / 113193580069603244) [(5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 0. -/
theorem ep_Q2_020_partial_00_0022_valid :
    mulPoly ep_Q2_020_coefficient_00_0022
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0023 : Poly :=
[
  term ((-884115564995022417 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 23 for generator 0. -/
def ep_Q2_020_partial_00_0023 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 0. -/
theorem ep_Q2_020_partial_00_0023_valid :
    mulPoly ep_Q2_020_coefficient_00_0023
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0024 : Poly :=
[
  term ((-172681901547872376 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 0. -/
def ep_Q2_020_partial_00_0024 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 0. -/
theorem ep_Q2_020_partial_00_0024_valid :
    mulPoly ep_Q2_020_coefficient_00_0024
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0025 : Poly :=
[
  term ((30834355542465789 : Rat) / 1951613449475918) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 0. -/
def ep_Q2_020_partial_00_0025 : Poly :=
[
  term ((30834355542465789 : Rat) / 975806724737959) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 0. -/
theorem ep_Q2_020_partial_00_0025_valid :
    mulPoly ep_Q2_020_coefficient_00_0025
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0026 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 0. -/
def ep_Q2_020_partial_00_0026 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 0. -/
theorem ep_Q2_020_partial_00_0026_valid :
    mulPoly ep_Q2_020_coefficient_00_0026
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0027 : Poly :=
[
  term ((21436308964867500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 27 for generator 0. -/
def ep_Q2_020_partial_00_0027 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 0. -/
theorem ep_Q2_020_partial_00_0027_valid :
    mulPoly ep_Q2_020_coefficient_00_0027
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0028 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 0. -/
def ep_Q2_020_partial_00_0028 : Poly :=
[
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 0. -/
theorem ep_Q2_020_partial_00_0028_valid :
    mulPoly ep_Q2_020_coefficient_00_0028
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0029 : Poly :=
[
  term ((7842166569950482479 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 0. -/
def ep_Q2_020_partial_00_0029 : Poly :=
[
  term ((7842166569950482479 : Rat) / 56596790034801622) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((7842166569950482479 : Rat) / 56596790034801622) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7842166569950482479 : Rat) / 113193580069603244) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7842166569950482479 : Rat) / 113193580069603244) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 0. -/
theorem ep_Q2_020_partial_00_0029_valid :
    mulPoly ep_Q2_020_coefficient_00_0029
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0030 : Poly :=
[
  term ((-40116769987423680 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 30 for generator 0. -/
def ep_Q2_020_partial_00_0030 : Poly :=
[
  term ((-80233539974847360 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-80233539974847360 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((40116769987423680 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((40116769987423680 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 0. -/
theorem ep_Q2_020_partial_00_0030_valid :
    mulPoly ep_Q2_020_coefficient_00_0030
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0031 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 0. -/
def ep_Q2_020_partial_00_0031 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 0. -/
theorem ep_Q2_020_partial_00_0031_valid :
    mulPoly ep_Q2_020_coefficient_00_0031
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0032 : Poly :=
[
  term ((9949673263631184 : Rat) / 975806724737959) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 0. -/
def ep_Q2_020_partial_00_0032 : Poly :=
[
  term ((19899346527262368 : Rat) / 975806724737959) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((19899346527262368 : Rat) / 975806724737959) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9949673263631184 : Rat) / 975806724737959) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9949673263631184 : Rat) / 975806724737959) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 0. -/
theorem ep_Q2_020_partial_00_0032_valid :
    mulPoly ep_Q2_020_coefficient_00_0032
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0033 : Poly :=
[
  term ((87737167665976644 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

/-- Partial product 33 for generator 0. -/
def ep_Q2_020_partial_00_0033 : Poly :=
[
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 0. -/
theorem ep_Q2_020_partial_00_0033_valid :
    mulPoly ep_Q2_020_coefficient_00_0033
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0034 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 0. -/
def ep_Q2_020_partial_00_0034 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 0. -/
theorem ep_Q2_020_partial_00_0034_valid :
    mulPoly ep_Q2_020_coefficient_00_0034
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0035 : Poly :=
[
  term ((2703954061113525405 : Rat) / 113193580069603244) [(14, 1), (16, 1)]
]

/-- Partial product 35 for generator 0. -/
def ep_Q2_020_partial_00_0035 : Poly :=
[
  term ((2703954061113525405 : Rat) / 56596790034801622) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((2703954061113525405 : Rat) / 56596790034801622) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-2703954061113525405 : Rat) / 113193580069603244) [(4, 2), (14, 1), (16, 1)],
  term ((-2703954061113525405 : Rat) / 113193580069603244) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 0. -/
theorem ep_Q2_020_partial_00_0035_valid :
    mulPoly ep_Q2_020_coefficient_00_0035
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0036 : Poly :=
[
  term ((-1077746588099131905 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 36 for generator 0. -/
def ep_Q2_020_partial_00_0036 : Poly :=
[
  term ((-1077746588099131905 : Rat) / 28298395017400811) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-1077746588099131905 : Rat) / 28298395017400811) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((1077746588099131905 : Rat) / 56596790034801622) [(4, 2), (15, 2), (16, 1)],
  term ((1077746588099131905 : Rat) / 56596790034801622) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 0. -/
theorem ep_Q2_020_partial_00_0036_valid :
    mulPoly ep_Q2_020_coefficient_00_0036
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 0. -/
def ep_Q2_020_coefficient_00_0037 : Poly :=
[
  term ((-368783258445328203 : Rat) / 113193580069603244) [(16, 1)]
]

/-- Partial product 37 for generator 0. -/
def ep_Q2_020_partial_00_0037 : Poly :=
[
  term ((-368783258445328203 : Rat) / 56596790034801622) [(0, 1), (4, 1), (16, 1)],
  term ((-368783258445328203 : Rat) / 56596790034801622) [(1, 1), (5, 1), (16, 1)],
  term ((368783258445328203 : Rat) / 113193580069603244) [(4, 2), (16, 1)],
  term ((368783258445328203 : Rat) / 113193580069603244) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 0. -/
theorem ep_Q2_020_partial_00_0037_valid :
    mulPoly ep_Q2_020_coefficient_00_0037
        ep_Q2_020_generator_00_0000_0037 =
      ep_Q2_020_partial_00_0037 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_00_0000_0037 : List Poly :=
[
  ep_Q2_020_partial_00_0000,
  ep_Q2_020_partial_00_0001,
  ep_Q2_020_partial_00_0002,
  ep_Q2_020_partial_00_0003,
  ep_Q2_020_partial_00_0004,
  ep_Q2_020_partial_00_0005,
  ep_Q2_020_partial_00_0006,
  ep_Q2_020_partial_00_0007,
  ep_Q2_020_partial_00_0008,
  ep_Q2_020_partial_00_0009,
  ep_Q2_020_partial_00_0010,
  ep_Q2_020_partial_00_0011,
  ep_Q2_020_partial_00_0012,
  ep_Q2_020_partial_00_0013,
  ep_Q2_020_partial_00_0014,
  ep_Q2_020_partial_00_0015,
  ep_Q2_020_partial_00_0016,
  ep_Q2_020_partial_00_0017,
  ep_Q2_020_partial_00_0018,
  ep_Q2_020_partial_00_0019,
  ep_Q2_020_partial_00_0020,
  ep_Q2_020_partial_00_0021,
  ep_Q2_020_partial_00_0022,
  ep_Q2_020_partial_00_0023,
  ep_Q2_020_partial_00_0024,
  ep_Q2_020_partial_00_0025,
  ep_Q2_020_partial_00_0026,
  ep_Q2_020_partial_00_0027,
  ep_Q2_020_partial_00_0028,
  ep_Q2_020_partial_00_0029,
  ep_Q2_020_partial_00_0030,
  ep_Q2_020_partial_00_0031,
  ep_Q2_020_partial_00_0032,
  ep_Q2_020_partial_00_0033,
  ep_Q2_020_partial_00_0034,
  ep_Q2_020_partial_00_0035,
  ep_Q2_020_partial_00_0036,
  ep_Q2_020_partial_00_0037
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_00_0000_0037 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(0, 1), (1, 1), (4, 1), (9, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((62814607022597004 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2610091382856341070 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((535983730083744771 : Rat) / 56596790034801622) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(0, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7842166569950482479 : Rat) / 56596790034801622) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-80233539974847360 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19899346527262368 : Rat) / 975806724737959) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((2703954061113525405 : Rat) / 56596790034801622) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-1077746588099131905 : Rat) / 28298395017400811) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-368783258445328203 : Rat) / 56596790034801622) [(0, 1), (4, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 113193580069603244) [(0, 1), (4, 2), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 113193580069603244) [(0, 1), (5, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 2), (4, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((62814607022597004 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2610091382856341070 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((535983730083744771 : Rat) / 56596790034801622) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7842166569950482479 : Rat) / 56596790034801622) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-80233539974847360 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19899346527262368 : Rat) / 975806724737959) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((2703954061113525405 : Rat) / 56596790034801622) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-1077746588099131905 : Rat) / 28298395017400811) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-368783258445328203 : Rat) / 56596790034801622) [(1, 1), (5, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((243422585204849298 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-243422585204849298 : Rat) / 28298395017400811) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((-31407303511298502 : Rat) / 28298395017400811) [(4, 2), (6, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1305045691428170535 : Rat) / 28298395017400811) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-535983730083744771 : Rat) / 113193580069603244) [(4, 2), (8, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7842166569950482479 : Rat) / 113193580069603244) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((40116769987423680 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9949673263631184 : Rat) / 975806724737959) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2703954061113525405 : Rat) / 113193580069603244) [(4, 2), (14, 1), (16, 1)],
  term ((1077746588099131905 : Rat) / 56596790034801622) [(4, 2), (15, 2), (16, 1)],
  term ((368783258445328203 : Rat) / 113193580069603244) [(4, 2), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-31407303511298502 : Rat) / 28298395017400811) [(5, 2), (6, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1305045691428170535 : Rat) / 28298395017400811) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-535983730083744771 : Rat) / 113193580069603244) [(5, 2), (8, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7842166569950482479 : Rat) / 113193580069603244) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((40116769987423680 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9949673263631184 : Rat) / 975806724737959) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2703954061113525405 : Rat) / 113193580069603244) [(5, 2), (14, 1), (16, 1)],
  term ((1077746588099131905 : Rat) / 56596790034801622) [(5, 2), (15, 2), (16, 1)],
  term ((368783258445328203 : Rat) / 113193580069603244) [(5, 2), (16, 1)],
  term ((-17383894199559216 : Rat) / 28298395017400811) [(5, 3), (7, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 3), (9, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 3), (11, 1), (14, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 3), (11, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 0 through 37. -/
theorem ep_Q2_020_block_00_0000_0037_valid :
    checkProductSumEq ep_Q2_020_partials_00_0000_0037
      ep_Q2_020_block_00_0000_0037 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
