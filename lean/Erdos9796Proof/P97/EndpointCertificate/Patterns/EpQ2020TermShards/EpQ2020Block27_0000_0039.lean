/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 27:0-39

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_27_0000_0039 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0000 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 27. -/
def ep_Q2_020_partial_27_0000 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 27. -/
theorem ep_Q2_020_partial_27_0000_valid :
    mulPoly ep_Q2_020_coefficient_27_0000
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0001 : Poly :=
[
  term ((70318234713726288 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 1 for generator 27. -/
def ep_Q2_020_partial_27_0001 : Poly :=
[
  term ((140636469427452576 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 27. -/
theorem ep_Q2_020_partial_27_0001_valid :
    mulPoly ep_Q2_020_coefficient_27_0001
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0002 : Poly :=
[
  term ((160218385881654951 : Rat) / 1951613449475918) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 27. -/
def ep_Q2_020_partial_27_0002 : Poly :=
[
  term ((160218385881654951 : Rat) / 975806724737959) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 27. -/
theorem ep_Q2_020_partial_27_0002_valid :
    mulPoly ep_Q2_020_coefficient_27_0002
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0003 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 27. -/
def ep_Q2_020_partial_27_0003 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 27. -/
theorem ep_Q2_020_partial_27_0003_valid :
    mulPoly ep_Q2_020_coefficient_27_0003
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0004 : Poly :=
[
  term ((1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 27. -/
def ep_Q2_020_partial_27_0004 : Poly :=
[
  term ((2081844239959367268 : Rat) / 28298395017400811) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(0, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 27. -/
theorem ep_Q2_020_partial_27_0004_valid :
    mulPoly ep_Q2_020_coefficient_27_0004
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0005 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 27. -/
def ep_Q2_020_partial_27_0005 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 27. -/
theorem ep_Q2_020_partial_27_0005_valid :
    mulPoly ep_Q2_020_coefficient_27_0005
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0006 : Poly :=
[
  term ((-271039469949279795 : Rat) / 28298395017400811) [(0, 1), (16, 1)]
]

/-- Partial product 6 for generator 27. -/
def ep_Q2_020_partial_27_0006 : Poly :=
[
  term ((-542078939898559590 : Rat) / 28298395017400811) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((271039469949279795 : Rat) / 28298395017400811) [(0, 1), (2, 2), (16, 1)],
  term ((-542078939898559590 : Rat) / 28298395017400811) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((271039469949279795 : Rat) / 28298395017400811) [(0, 1), (3, 2), (16, 1)],
  term ((542078939898559590 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((-271039469949279795 : Rat) / 28298395017400811) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 27. -/
theorem ep_Q2_020_partial_27_0006_valid :
    mulPoly ep_Q2_020_coefficient_27_0006
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0007 : Poly :=
[
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 2), (16, 1)]
]

/-- Partial product 7 for generator 27. -/
def ep_Q2_020_partial_27_0007 : Poly :=
[
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 56596790034801622) [(0, 2), (2, 2), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 56596790034801622) [(0, 2), (3, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 27. -/
theorem ep_Q2_020_partial_27_0007_valid :
    mulPoly ep_Q2_020_coefficient_27_0007
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0008 : Poly :=
[
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 8 for generator 27. -/
def ep_Q2_020_partial_27_0008 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 27. -/
theorem ep_Q2_020_partial_27_0008_valid :
    mulPoly ep_Q2_020_coefficient_27_0008
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0009 : Poly :=
[
  term ((-87762977821768032 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 27. -/
def ep_Q2_020_partial_27_0009 : Poly :=
[
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-87762977821768032 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 27. -/
theorem ep_Q2_020_partial_27_0009_valid :
    mulPoly ep_Q2_020_coefficient_27_0009
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0010 : Poly :=
[
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 10 for generator 27. -/
def ep_Q2_020_partial_27_0010 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 27. -/
theorem ep_Q2_020_partial_27_0010_valid :
    mulPoly ep_Q2_020_coefficient_27_0010
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0011 : Poly :=
[
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 27. -/
def ep_Q2_020_partial_27_0011 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 27. -/
theorem ep_Q2_020_partial_27_0011_valid :
    mulPoly ep_Q2_020_coefficient_27_0011
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0012 : Poly :=
[
  term ((172681901547872376 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 27. -/
def ep_Q2_020_partial_27_0012 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 27. -/
theorem ep_Q2_020_partial_27_0012_valid :
    mulPoly ep_Q2_020_coefficient_27_0012
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0013 : Poly :=
[
  term ((-979528844998953843 : Rat) / 113193580069603244) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 27. -/
def ep_Q2_020_partial_27_0013 : Poly :=
[
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 113193580069603244) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 27. -/
theorem ep_Q2_020_partial_27_0013_valid :
    mulPoly ep_Q2_020_coefficient_27_0013
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0014 : Poly :=
[
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

/-- Partial product 14 for generator 27. -/
def ep_Q2_020_partial_27_0014 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (2, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (3, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 27. -/
theorem ep_Q2_020_partial_27_0014_valid :
    mulPoly ep_Q2_020_coefficient_27_0014
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0015 : Poly :=
[
  term ((-541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 15 for generator 27. -/
def ep_Q2_020_partial_27_0015 : Poly :=
[
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 27. -/
theorem ep_Q2_020_partial_27_0015_valid :
    mulPoly ep_Q2_020_coefficient_27_0015
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0016 : Poly :=
[
  term ((-541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 16 for generator 27. -/
def ep_Q2_020_partial_27_0016 : Poly :=
[
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((1082631401966977644 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 27. -/
theorem ep_Q2_020_partial_27_0016_valid :
    mulPoly ep_Q2_020_coefficient_27_0016
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0017 : Poly :=
[
  term ((-98518727017089522 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 17 for generator 27. -/
def ep_Q2_020_partial_27_0017 : Poly :=
[
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 27. -/
theorem ep_Q2_020_partial_27_0017_valid :
    mulPoly ep_Q2_020_coefficient_27_0017
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0018 : Poly :=
[
  term ((395305978514986488 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 18 for generator 27. -/
def ep_Q2_020_partial_27_0018 : Poly :=
[
  term ((790611957029972976 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-395305978514986488 : Rat) / 28298395017400811) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((790611957029972976 : Rat) / 28298395017400811) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-395305978514986488 : Rat) / 28298395017400811) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((-790611957029972976 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 27. -/
theorem ep_Q2_020_partial_27_0018_valid :
    mulPoly ep_Q2_020_coefficient_27_0018
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0019 : Poly :=
[
  term ((98518727017089522 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 19 for generator 27. -/
def ep_Q2_020_partial_27_0019 : Poly :=
[
  term ((197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(2, 2), (4, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(3, 2), (4, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 27. -/
theorem ep_Q2_020_partial_27_0019_valid :
    mulPoly ep_Q2_020_coefficient_27_0019
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0020 : Poly :=
[
  term ((73004861234251167 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 20 for generator 27. -/
def ep_Q2_020_partial_27_0020 : Poly :=
[
  term ((146009722468502334 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((-73004861234251167 : Rat) / 28298395017400811) [(2, 2), (4, 2), (16, 1)],
  term ((146009722468502334 : Rat) / 28298395017400811) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-73004861234251167 : Rat) / 28298395017400811) [(3, 2), (4, 2), (16, 1)],
  term ((-146009722468502334 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)],
  term ((73004861234251167 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 27. -/
theorem ep_Q2_020_partial_27_0020_valid :
    mulPoly ep_Q2_020_coefficient_27_0020
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0021 : Poly :=
[
  term ((-98518727017089522 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 21 for generator 27. -/
def ep_Q2_020_partial_27_0021 : Poly :=
[
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 27. -/
theorem ep_Q2_020_partial_27_0021_valid :
    mulPoly ep_Q2_020_coefficient_27_0021
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0022 : Poly :=
[
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 22 for generator 27. -/
def ep_Q2_020_partial_27_0022 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 27. -/
theorem ep_Q2_020_partial_27_0022_valid :
    mulPoly ep_Q2_020_coefficient_27_0022
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0023 : Poly :=
[
  term ((412622042417592528 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 27. -/
def ep_Q2_020_partial_27_0023 : Poly :=
[
  term ((825244084835185056 : Rat) / 28298395017400811) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-412622042417592528 : Rat) / 28298395017400811) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((825244084835185056 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-412622042417592528 : Rat) / 28298395017400811) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-825244084835185056 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((412622042417592528 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 27. -/
theorem ep_Q2_020_partial_27_0023_valid :
    mulPoly ep_Q2_020_coefficient_27_0023
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0024 : Poly :=
[
  term ((73004861234251167 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 24 for generator 27. -/
def ep_Q2_020_partial_27_0024 : Poly :=
[
  term ((146009722468502334 : Rat) / 28298395017400811) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-73004861234251167 : Rat) / 28298395017400811) [(2, 2), (5, 2), (16, 1)],
  term ((146009722468502334 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-73004861234251167 : Rat) / 28298395017400811) [(3, 2), (5, 2), (16, 1)],
  term ((-146009722468502334 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)],
  term ((73004861234251167 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 27. -/
theorem ep_Q2_020_partial_27_0024_valid :
    mulPoly ep_Q2_020_coefficient_27_0024
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0025 : Poly :=
[
  term ((-35159117356863144 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 25 for generator 27. -/
def ep_Q2_020_partial_27_0025 : Poly :=
[
  term ((-70318234713726288 : Rat) / 28298395017400811) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((35159117356863144 : Rat) / 28298395017400811) [(2, 2), (6, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((35159117356863144 : Rat) / 28298395017400811) [(3, 2), (6, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)],
  term ((-35159117356863144 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 27. -/
theorem ep_Q2_020_partial_27_0025_valid :
    mulPoly ep_Q2_020_coefficient_27_0025
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0026 : Poly :=
[
  term ((49259363508544761 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

/-- Partial product 26 for generator 27. -/
def ep_Q2_020_partial_27_0026 : Poly :=
[
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-49259363508544761 : Rat) / 28298395017400811) [(2, 2), (6, 2), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-49259363508544761 : Rat) / 28298395017400811) [(3, 2), (6, 2), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)],
  term ((49259363508544761 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 27. -/
theorem ep_Q2_020_partial_27_0026_valid :
    mulPoly ep_Q2_020_coefficient_27_0026
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0027 : Poly :=
[
  term ((87762977821768032 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 27 for generator 27. -/
def ep_Q2_020_partial_27_0027 : Poly :=
[
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-87762977821768032 : Rat) / 28298395017400811) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-87762977821768032 : Rat) / 28298395017400811) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 27. -/
theorem ep_Q2_020_partial_27_0027_valid :
    mulPoly ep_Q2_020_coefficient_27_0027
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0028 : Poly :=
[
  term ((49259363508544761 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 28 for generator 27. -/
def ep_Q2_020_partial_27_0028 : Poly :=
[
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-49259363508544761 : Rat) / 28298395017400811) [(2, 2), (7, 2), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-49259363508544761 : Rat) / 28298395017400811) [(3, 2), (7, 2), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)],
  term ((49259363508544761 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 27. -/
theorem ep_Q2_020_partial_27_0028_valid :
    mulPoly ep_Q2_020_coefficient_27_0028
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0029 : Poly :=
[
  term ((-884115564995022417 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 29 for generator 27. -/
def ep_Q2_020_partial_27_0029 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 27. -/
theorem ep_Q2_020_partial_27_0029_valid :
    mulPoly ep_Q2_020_coefficient_27_0029
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0030 : Poly :=
[
  term ((-172681901547872376 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 27. -/
def ep_Q2_020_partial_27_0030 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 27. -/
theorem ep_Q2_020_partial_27_0030_valid :
    mulPoly ep_Q2_020_coefficient_27_0030
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0031 : Poly :=
[
  term ((979528844998953843 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 27. -/
def ep_Q2_020_partial_27_0031 : Poly :=
[
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 113193580069603244) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-979528844998953843 : Rat) / 113193580069603244) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 27. -/
theorem ep_Q2_020_partial_27_0031_valid :
    mulPoly ep_Q2_020_coefficient_27_0031
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0032 : Poly :=
[
  term ((-160218385881654951 : Rat) / 3903226898951836) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 27. -/
def ep_Q2_020_partial_27_0032 : Poly :=
[
  term ((-160218385881654951 : Rat) / 1951613449475918) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 3903226898951836) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((160218385881654951 : Rat) / 3903226898951836) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 3903226898951836) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 27. -/
theorem ep_Q2_020_partial_27_0032_valid :
    mulPoly ep_Q2_020_coefficient_27_0032
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0033 : Poly :=
[
  term ((449975499998020827 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 33 for generator 27. -/
def ep_Q2_020_partial_27_0033 : Poly :=
[
  term ((899950999996041654 : Rat) / 28298395017400811) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((899950999996041654 : Rat) / 28298395017400811) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)],
  term ((-899950999996041654 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 27. -/
theorem ep_Q2_020_partial_27_0033_valid :
    mulPoly ep_Q2_020_coefficient_27_0033
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0034 : Poly :=
[
  term ((-449975499998020827 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

/-- Partial product 34 for generator 27. -/
def ep_Q2_020_partial_27_0034 : Poly :=
[
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(2, 2), (12, 2), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(3, 2), (12, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(12, 2), (14, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 27. -/
theorem ep_Q2_020_partial_27_0034_valid :
    mulPoly ep_Q2_020_coefficient_27_0034
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0035 : Poly :=
[
  term ((430487946393595827 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 27. -/
def ep_Q2_020_partial_27_0035 : Poly :=
[
  term ((860975892787191654 : Rat) / 28298395017400811) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-430487946393595827 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((860975892787191654 : Rat) / 28298395017400811) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-430487946393595827 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-860975892787191654 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((430487946393595827 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 27. -/
theorem ep_Q2_020_partial_27_0035_valid :
    mulPoly ep_Q2_020_coefficient_27_0035
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0036 : Poly :=
[
  term ((-449975499998020827 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

/-- Partial product 36 for generator 27. -/
def ep_Q2_020_partial_27_0036 : Poly :=
[
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(2, 2), (13, 2), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(3, 2), (13, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(13, 2), (14, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 27. -/
theorem ep_Q2_020_partial_27_0036_valid :
    mulPoly ep_Q2_020_coefficient_27_0036
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0037 : Poly :=
[
  term ((-1464261265519938654 : Rat) / 28298395017400811) [(14, 1), (16, 1)]
]

/-- Partial product 37 for generator 27. -/
def ep_Q2_020_partial_27_0037 : Poly :=
[
  term ((-2928522531039877308 : Rat) / 28298395017400811) [(2, 1), (14, 2), (16, 1)],
  term ((1464261265519938654 : Rat) / 28298395017400811) [(2, 2), (14, 1), (16, 1)],
  term ((-2928522531039877308 : Rat) / 28298395017400811) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1464261265519938654 : Rat) / 28298395017400811) [(3, 2), (14, 1), (16, 1)],
  term ((-1464261265519938654 : Rat) / 28298395017400811) [(14, 1), (16, 1)],
  term ((2928522531039877308 : Rat) / 28298395017400811) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 27. -/
theorem ep_Q2_020_partial_27_0037_valid :
    mulPoly ep_Q2_020_coefficient_27_0037
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0038 : Poly :=
[
  term ((-894286992583440 : Rat) / 1230365000756557) [(15, 2), (16, 1)]
]

/-- Partial product 38 for generator 27. -/
def ep_Q2_020_partial_27_0038 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(2, 2), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 1), (15, 3), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(3, 2), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 27. -/
theorem ep_Q2_020_partial_27_0038_valid :
    mulPoly ep_Q2_020_coefficient_27_0038
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 27. -/
def ep_Q2_020_coefficient_27_0039 : Poly :=
[
  term ((3581168228854126023 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 39 for generator 27. -/
def ep_Q2_020_partial_27_0039 : Poly :=
[
  term ((3581168228854126023 : Rat) / 113193580069603244) [(2, 1), (14, 1), (16, 1)],
  term ((-3581168228854126023 : Rat) / 226387160139206488) [(2, 2), (16, 1)],
  term ((3581168228854126023 : Rat) / 113193580069603244) [(3, 1), (15, 1), (16, 1)],
  term ((-3581168228854126023 : Rat) / 226387160139206488) [(3, 2), (16, 1)],
  term ((-3581168228854126023 : Rat) / 113193580069603244) [(14, 1), (16, 1)],
  term ((3581168228854126023 : Rat) / 226387160139206488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 27. -/
theorem ep_Q2_020_partial_27_0039_valid :
    mulPoly ep_Q2_020_coefficient_27_0039
        ep_Q2_020_generator_27_0000_0039 =
      ep_Q2_020_partial_27_0039 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_27_0000_0039 : List Poly :=
[
  ep_Q2_020_partial_27_0000,
  ep_Q2_020_partial_27_0001,
  ep_Q2_020_partial_27_0002,
  ep_Q2_020_partial_27_0003,
  ep_Q2_020_partial_27_0004,
  ep_Q2_020_partial_27_0005,
  ep_Q2_020_partial_27_0006,
  ep_Q2_020_partial_27_0007,
  ep_Q2_020_partial_27_0008,
  ep_Q2_020_partial_27_0009,
  ep_Q2_020_partial_27_0010,
  ep_Q2_020_partial_27_0011,
  ep_Q2_020_partial_27_0012,
  ep_Q2_020_partial_27_0013,
  ep_Q2_020_partial_27_0014,
  ep_Q2_020_partial_27_0015,
  ep_Q2_020_partial_27_0016,
  ep_Q2_020_partial_27_0017,
  ep_Q2_020_partial_27_0018,
  ep_Q2_020_partial_27_0019,
  ep_Q2_020_partial_27_0020,
  ep_Q2_020_partial_27_0021,
  ep_Q2_020_partial_27_0022,
  ep_Q2_020_partial_27_0023,
  ep_Q2_020_partial_27_0024,
  ep_Q2_020_partial_27_0025,
  ep_Q2_020_partial_27_0026,
  ep_Q2_020_partial_27_0027,
  ep_Q2_020_partial_27_0028,
  ep_Q2_020_partial_27_0029,
  ep_Q2_020_partial_27_0030,
  ep_Q2_020_partial_27_0031,
  ep_Q2_020_partial_27_0032,
  ep_Q2_020_partial_27_0033,
  ep_Q2_020_partial_27_0034,
  ep_Q2_020_partial_27_0035,
  ep_Q2_020_partial_27_0036,
  ep_Q2_020_partial_27_0037,
  ep_Q2_020_partial_27_0038,
  ep_Q2_020_partial_27_0039
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_27_0000_0039 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-542078939898559590 : Rat) / 28298395017400811) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((271039469949279795 : Rat) / 28298395017400811) [(0, 1), (2, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-542078939898559590 : Rat) / 28298395017400811) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((271039469949279795 : Rat) / 28298395017400811) [(0, 1), (3, 2), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((68826133038184488 : Rat) / 1230365000756557) [(0, 1), (14, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(0, 1), (14, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)],
  term ((-271039469949279795 : Rat) / 28298395017400811) [(0, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 56596790034801622) [(0, 2), (2, 2), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 56596790034801622) [(0, 2), (3, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 56596790034801622) [(0, 2), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-87762977821768032 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 113193580069603244) [(1, 1), (15, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (2, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (3, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1082631401966977644 : Rat) / 28298395017400811) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((1279668856001156688 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((790611957029972976 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-541315700983488822 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)],
  term ((146009722468502334 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((825244084835185056 : Rat) / 28298395017400811) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((146009722468502334 : Rat) / 28298395017400811) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((899950999996041654 : Rat) / 28298395017400811) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((860975892787191654 : Rat) / 28298395017400811) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((3581168228854126023 : Rat) / 113193580069603244) [(2, 1), (14, 1), (16, 1)],
  term ((-2928522531039877308 : Rat) / 28298395017400811) [(2, 1), (14, 2), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-1477937380481964132 : Rat) / 28298395017400811) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(2, 2), (4, 1), (16, 1)],
  term ((-73004861234251167 : Rat) / 28298395017400811) [(2, 2), (4, 2), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-412622042417592528 : Rat) / 28298395017400811) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-73004861234251167 : Rat) / 28298395017400811) [(2, 2), (5, 2), (16, 1)],
  term ((35159117356863144 : Rat) / 28298395017400811) [(2, 2), (6, 1), (16, 1)],
  term ((-49259363508544761 : Rat) / 28298395017400811) [(2, 2), (6, 2), (16, 1)],
  term ((-87762977821768032 : Rat) / 28298395017400811) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((-49259363508544761 : Rat) / 28298395017400811) [(2, 2), (7, 2), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 113193580069603244) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 3903226898951836) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(2, 2), (12, 2), (16, 1)],
  term ((-430487946393595827 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(2, 2), (13, 2), (16, 1)],
  term ((1464261265519938654 : Rat) / 28298395017400811) [(2, 2), (14, 1), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(2, 2), (15, 2), (16, 1)],
  term ((-3581168228854126023 : Rat) / 226387160139206488) [(2, 2), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(2, 3), (4, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((790611957029972976 : Rat) / 28298395017400811) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((146009722468502334 : Rat) / 28298395017400811) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1082631401966977644 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((825244084835185056 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-541315700983488822 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)],
  term ((146009722468502334 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((175525955643536064 : Rat) / 28298395017400811) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 56596790034801622) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((899950999996041654 : Rat) / 28298395017400811) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((860975892787191654 : Rat) / 28298395017400811) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2928522531039877308 : Rat) / 28298395017400811) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((3581168228854126023 : Rat) / 113193580069603244) [(3, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 1), (15, 3), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-395305978514986488 : Rat) / 28298395017400811) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(3, 2), (4, 1), (16, 1)],
  term ((-73004861234251167 : Rat) / 28298395017400811) [(3, 2), (4, 2), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-1495253444384570172 : Rat) / 28298395017400811) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-73004861234251167 : Rat) / 28298395017400811) [(3, 2), (5, 2), (16, 1)],
  term ((35159117356863144 : Rat) / 28298395017400811) [(3, 2), (6, 1), (16, 1)],
  term ((-49259363508544761 : Rat) / 28298395017400811) [(3, 2), (6, 2), (16, 1)],
  term ((-87762977821768032 : Rat) / 28298395017400811) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-49259363508544761 : Rat) / 28298395017400811) [(3, 2), (7, 2), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 113193580069603244) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 3903226898951836) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(3, 2), (12, 2), (16, 1)],
  term ((-430487946393595827 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(3, 2), (13, 2), (16, 1)],
  term ((1464261265519938654 : Rat) / 28298395017400811) [(3, 2), (14, 1), (16, 1)],
  term ((894286992583440 : Rat) / 1230365000756557) [(3, 2), (15, 2), (16, 1)],
  term ((-3581168228854126023 : Rat) / 226387160139206488) [(3, 2), (16, 1)],
  term ((541315700983488822 : Rat) / 28298395017400811) [(3, 3), (5, 1), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((198268524480807444 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((-790611957029972976 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(4, 1), (16, 1)],
  term ((-146009722468502334 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)],
  term ((73004861234251167 : Rat) / 28298395017400811) [(4, 2), (16, 1)],
  term ((197037454034179044 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((-825244084835185056 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((412622042417592528 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)],
  term ((-146009722468502334 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)],
  term ((73004861234251167 : Rat) / 28298395017400811) [(5, 2), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)],
  term ((-35159117356863144 : Rat) / 28298395017400811) [(6, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)],
  term ((49259363508544761 : Rat) / 28298395017400811) [(6, 2), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((87762977821768032 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)],
  term ((-98518727017089522 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)],
  term ((49259363508544761 : Rat) / 28298395017400811) [(7, 2), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((979528844998953843 : Rat) / 113193580069603244) [(9, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 3903226898951836) [(11, 1), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)],
  term ((-899950999996041654 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(12, 2), (14, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 56596790034801622) [(12, 2), (16, 1)],
  term ((-860975892787191654 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((430487946393595827 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(13, 2), (14, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 56596790034801622) [(13, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)],
  term ((-9438213290933880639 : Rat) / 113193580069603244) [(14, 1), (16, 1)],
  term ((2928522531039877308 : Rat) / 28298395017400811) [(14, 2), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(15, 2), (16, 1)],
  term ((3581168228854126023 : Rat) / 226387160139206488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 0 through 39. -/
theorem ep_Q2_020_block_27_0000_0039_valid :
    checkProductSumEq ep_Q2_020_partials_27_0000_0039
      ep_Q2_020_block_27_0000_0039 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
