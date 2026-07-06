/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 28:0-55

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_28_0000_0055 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(5, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0000 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 28. -/
def ep_Q2_020_partial_28_0000 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem ep_Q2_020_partial_28_0000_valid :
    mulPoly ep_Q2_020_coefficient_28_0000
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0001 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 28. -/
def ep_Q2_020_partial_28_0001 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem ep_Q2_020_partial_28_0001_valid :
    mulPoly ep_Q2_020_coefficient_28_0001
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0002 : Poly :=
[
  term ((953651141793259281 : Rat) / 56596790034801622) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 2 for generator 28. -/
def ep_Q2_020_partial_28_0002 : Poly :=
[
  term ((953651141793259281 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-953651141793259281 : Rat) / 56596790034801622) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((953651141793259281 : Rat) / 28298395017400811) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-953651141793259281 : Rat) / 56596790034801622) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-953651141793259281 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((953651141793259281 : Rat) / 56596790034801622) [(0, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem ep_Q2_020_partial_28_0002_valid :
    mulPoly ep_Q2_020_coefficient_28_0002
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0003 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 28. -/
def ep_Q2_020_partial_28_0003 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem ep_Q2_020_partial_28_0003_valid :
    mulPoly ep_Q2_020_coefficient_28_0003
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0004 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 28. -/
def ep_Q2_020_partial_28_0004 : Poly :=
[
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem ep_Q2_020_partial_28_0004_valid :
    mulPoly ep_Q2_020_coefficient_28_0004
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0005 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 28. -/
def ep_Q2_020_partial_28_0005 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem ep_Q2_020_partial_28_0005_valid :
    mulPoly ep_Q2_020_coefficient_28_0005
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0006 : Poly :=
[
  term ((-91775138683812012 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 6 for generator 28. -/
def ep_Q2_020_partial_28_0006 : Poly :=
[
  term ((-183550277367624024 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 1), (4, 2), (14, 1), (16, 1)],
  term ((-183550277367624024 : Rat) / 28298395017400811) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 1), (5, 2), (14, 1), (16, 1)],
  term ((-91775138683812012 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((183550277367624024 : Rat) / 28298395017400811) [(0, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem ep_Q2_020_partial_28_0006_valid :
    mulPoly ep_Q2_020_coefficient_28_0006
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0007 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 7 for generator 28. -/
def ep_Q2_020_partial_28_0007 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem ep_Q2_020_partial_28_0007_valid :
    mulPoly ep_Q2_020_coefficient_28_0007
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0008 : Poly :=
[
  term ((-159662272189263948 : Rat) / 28298395017400811) [(0, 1), (16, 1)]
]

/-- Partial product 8 for generator 28. -/
def ep_Q2_020_partial_28_0008 : Poly :=
[
  term ((-319324544378527896 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((159662272189263948 : Rat) / 28298395017400811) [(0, 1), (4, 2), (16, 1)],
  term ((-319324544378527896 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((159662272189263948 : Rat) / 28298395017400811) [(0, 1), (5, 2), (16, 1)],
  term ((319324544378527896 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((-159662272189263948 : Rat) / 28298395017400811) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem ep_Q2_020_partial_28_0008_valid :
    mulPoly ep_Q2_020_coefficient_28_0008
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0009 : Poly :=
[
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 9 for generator 28. -/
def ep_Q2_020_partial_28_0009 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem ep_Q2_020_partial_28_0009_valid :
    mulPoly ep_Q2_020_coefficient_28_0009
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0010 : Poly :=
[
  term ((33792958471160061 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 10 for generator 28. -/
def ep_Q2_020_partial_28_0010 : Poly :=
[
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem ep_Q2_020_partial_28_0010_valid :
    mulPoly ep_Q2_020_coefficient_28_0010
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0011 : Poly :=
[
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 11 for generator 28. -/
def ep_Q2_020_partial_28_0011 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem ep_Q2_020_partial_28_0011_valid :
    mulPoly ep_Q2_020_coefficient_28_0011
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0012 : Poly :=
[
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 28. -/
def ep_Q2_020_partial_28_0012 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem ep_Q2_020_partial_28_0012_valid :
    mulPoly ep_Q2_020_coefficient_28_0012
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0013 : Poly :=
[
  term ((-9949673263631184 : Rat) / 975806724737959) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 28. -/
def ep_Q2_020_partial_28_0013 : Poly :=
[
  term ((-19899346527262368 : Rat) / 975806724737959) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((9949673263631184 : Rat) / 975806724737959) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-19899346527262368 : Rat) / 975806724737959) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((9949673263631184 : Rat) / 975806724737959) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((19899346527262368 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9949673263631184 : Rat) / 975806724737959) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem ep_Q2_020_partial_28_0013_valid :
    mulPoly ep_Q2_020_coefficient_28_0013
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0014 : Poly :=
[
  term ((30834355542465789 : Rat) / 1951613449475918) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 28. -/
def ep_Q2_020_partial_28_0014 : Poly :=
[
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem ep_Q2_020_partial_28_0014_valid :
    mulPoly ep_Q2_020_coefficient_28_0014
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0015 : Poly :=
[
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

/-- Partial product 15 for generator 28. -/
def ep_Q2_020_partial_28_0015 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem ep_Q2_020_partial_28_0015_valid :
    mulPoly ep_Q2_020_coefficient_28_0015
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0016 : Poly :=
[
  term ((72328312529178 : Rat) / 30008902457477) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 16 for generator 28. -/
def ep_Q2_020_partial_28_0016 : Poly :=
[
  term ((144656625058356 : Rat) / 30008902457477) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(2, 1), (4, 2), (12, 1), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((-144656625058356 : Rat) / 30008902457477) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem ep_Q2_020_partial_28_0016_valid :
    mulPoly ep_Q2_020_coefficient_28_0016
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0017 : Poly :=
[
  term ((-395305978514986488 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 17 for generator 28. -/
def ep_Q2_020_partial_28_0017 : Poly :=
[
  term ((-790611957029972976 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((-790611957029972976 : Rat) / 28298395017400811) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-395305978514986488 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)],
  term ((790611957029972976 : Rat) / 28298395017400811) [(2, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem ep_Q2_020_partial_28_0017_valid :
    mulPoly ep_Q2_020_coefficient_28_0017
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0018 : Poly :=
[
  term ((72328312529178 : Rat) / 30008902457477) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 28. -/
def ep_Q2_020_partial_28_0018 : Poly :=
[
  term ((144656625058356 : Rat) / 30008902457477) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-144656625058356 : Rat) / 30008902457477) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem ep_Q2_020_partial_28_0018_valid :
    mulPoly ep_Q2_020_coefficient_28_0018
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0019 : Poly :=
[
  term ((-395305978514986488 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 28. -/
def ep_Q2_020_partial_28_0019 : Poly :=
[
  term ((-790611957029972976 : Rat) / 28298395017400811) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-790611957029972976 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((790611957029972976 : Rat) / 28298395017400811) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-395305978514986488 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem ep_Q2_020_partial_28_0019_valid :
    mulPoly ep_Q2_020_coefficient_28_0019
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0020 : Poly :=
[
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 20 for generator 28. -/
def ep_Q2_020_partial_28_0020 : Poly :=
[
  term ((83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(4, 2), (6, 1), (14, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem ep_Q2_020_partial_28_0020_valid :
    mulPoly ep_Q2_020_coefficient_28_0020
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0021 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 21 for generator 28. -/
def ep_Q2_020_partial_28_0021 : Poly :=
[
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem ep_Q2_020_partial_28_0021_valid :
    mulPoly ep_Q2_020_coefficient_28_0021
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0022 : Poly :=
[
  term ((56755668282590247 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 28. -/
def ep_Q2_020_partial_28_0022 : Poly :=
[
  term ((113511336565180494 : Rat) / 28298395017400811) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56755668282590247 : Rat) / 28298395017400811) [(4, 1), (5, 2), (14, 1), (16, 1)],
  term ((56755668282590247 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((-113511336565180494 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)],
  term ((113511336565180494 : Rat) / 28298395017400811) [(4, 2), (14, 2), (16, 1)],
  term ((-56755668282590247 : Rat) / 28298395017400811) [(4, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem ep_Q2_020_partial_28_0022_valid :
    mulPoly ep_Q2_020_coefficient_28_0022
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0023 : Poly :=
[
  term ((-77671381306005483 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 23 for generator 28. -/
def ep_Q2_020_partial_28_0023 : Poly :=
[
  term ((-155342762612010966 : Rat) / 28298395017400811) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((77671381306005483 : Rat) / 28298395017400811) [(4, 1), (5, 2), (16, 1)],
  term ((155342762612010966 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((-77671381306005483 : Rat) / 28298395017400811) [(4, 1), (16, 1)],
  term ((-155342762612010966 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)],
  term ((77671381306005483 : Rat) / 28298395017400811) [(4, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem ep_Q2_020_partial_28_0023_valid :
    mulPoly ep_Q2_020_coefficient_28_0023
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0024 : Poly :=
[
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 24 for generator 28. -/
def ep_Q2_020_partial_28_0024 : Poly :=
[
  term ((83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem ep_Q2_020_partial_28_0024_valid :
    mulPoly ep_Q2_020_coefficient_28_0024
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0025 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 28. -/
def ep_Q2_020_partial_28_0025 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem ep_Q2_020_partial_28_0025_valid :
    mulPoly ep_Q2_020_coefficient_28_0025
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0026 : Poly :=
[
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 26 for generator 28. -/
def ep_Q2_020_partial_28_0026 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem ep_Q2_020_partial_28_0026_valid :
    mulPoly ep_Q2_020_coefficient_28_0026
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0027 : Poly :=
[
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 28. -/
def ep_Q2_020_partial_28_0027 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem ep_Q2_020_partial_28_0027_valid :
    mulPoly ep_Q2_020_coefficient_28_0027
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0028 : Poly :=
[
  term ((-132188409100347474 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 28. -/
def ep_Q2_020_partial_28_0028 : Poly :=
[
  term ((-264376818200694948 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((132188409100347474 : Rat) / 28298395017400811) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((264376818200694948 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-132188409100347474 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((-264376818200694948 : Rat) / 28298395017400811) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((132188409100347474 : Rat) / 28298395017400811) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem ep_Q2_020_partial_28_0028_valid :
    mulPoly ep_Q2_020_coefficient_28_0028
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0029 : Poly :=
[
  term ((-56755668282590247 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 28. -/
def ep_Q2_020_partial_28_0029 : Poly :=
[
  term ((-113511336565180494 : Rat) / 28298395017400811) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((56755668282590247 : Rat) / 28298395017400811) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((113511336565180494 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56755668282590247 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)],
  term ((-113511336565180494 : Rat) / 28298395017400811) [(5, 2), (15, 2), (16, 1)],
  term ((56755668282590247 : Rat) / 28298395017400811) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem ep_Q2_020_partial_28_0029_valid :
    mulPoly ep_Q2_020_coefficient_28_0029
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0030 : Poly :=
[
  term ((126001736136259956 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 30 for generator 28. -/
def ep_Q2_020_partial_28_0030 : Poly :=
[
  term ((252003472272519912 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-126001736136259956 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((252003472272519912 : Rat) / 28298395017400811) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-126001736136259956 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-252003472272519912 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((126001736136259956 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem ep_Q2_020_partial_28_0030_valid :
    mulPoly ep_Q2_020_coefficient_28_0030
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0031 : Poly :=
[
  term ((-1372295745904254 : Rat) / 690204756521971) [(6, 1), (16, 1)]
]

/-- Partial product 31 for generator 28. -/
def ep_Q2_020_partial_28_0031 : Poly :=
[
  term ((-2744591491808508 : Rat) / 690204756521971) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((1372295745904254 : Rat) / 690204756521971) [(4, 2), (6, 1), (16, 1)],
  term ((-2744591491808508 : Rat) / 690204756521971) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1372295745904254 : Rat) / 690204756521971) [(5, 2), (6, 1), (16, 1)],
  term ((2744591491808508 : Rat) / 690204756521971) [(6, 1), (14, 1), (16, 1)],
  term ((-1372295745904254 : Rat) / 690204756521971) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem ep_Q2_020_partial_28_0031_valid :
    mulPoly ep_Q2_020_coefficient_28_0031
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0032 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

/-- Partial product 32 for generator 28. -/
def ep_Q2_020_partial_28_0032 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(5, 2), (6, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem ep_Q2_020_partial_28_0032_valid :
    mulPoly ep_Q2_020_coefficient_28_0032
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0033 : Poly :=
[
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 33 for generator 28. -/
def ep_Q2_020_partial_28_0033 : Poly :=
[
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem ep_Q2_020_partial_28_0033_valid :
    mulPoly ep_Q2_020_coefficient_28_0033
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0034 : Poly :=
[
  term ((60834190590904884 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 28. -/
def ep_Q2_020_partial_28_0034 : Poly :=
[
  term ((121668381181809768 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem ep_Q2_020_partial_28_0034_valid :
    mulPoly ep_Q2_020_coefficient_28_0034
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0035 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 35 for generator 28. -/
def ep_Q2_020_partial_28_0035 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem ep_Q2_020_partial_28_0035_valid :
    mulPoly ep_Q2_020_coefficient_28_0035
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0036 : Poly :=
[
  term ((160218385881654951 : Rat) / 1951613449475918) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 28. -/
def ep_Q2_020_partial_28_0036 : Poly :=
[
  term ((160218385881654951 : Rat) / 975806724737959) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem ep_Q2_020_partial_28_0036_valid :
    mulPoly ep_Q2_020_coefficient_28_0036
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0037 : Poly :=
[
  term ((130354439878178304 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 37 for generator 28. -/
def ep_Q2_020_partial_28_0037 : Poly :=
[
  term ((260708879756356608 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-130354439878178304 : Rat) / 28298395017400811) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((260708879756356608 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-130354439878178304 : Rat) / 28298395017400811) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-260708879756356608 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((130354439878178304 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem ep_Q2_020_partial_28_0037_valid :
    mulPoly ep_Q2_020_coefficient_28_0037
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0038 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 28. -/
def ep_Q2_020_partial_28_0038 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem ep_Q2_020_partial_28_0038_valid :
    mulPoly ep_Q2_020_coefficient_28_0038
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0039 : Poly :=
[
  term ((24575173501936323 : Rat) / 690204756521971) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 39 for generator 28. -/
def ep_Q2_020_partial_28_0039 : Poly :=
[
  term ((49150347003872646 : Rat) / 690204756521971) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((-24575173501936323 : Rat) / 690204756521971) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((49150347003872646 : Rat) / 690204756521971) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24575173501936323 : Rat) / 690204756521971) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((24575173501936323 : Rat) / 690204756521971) [(8, 1), (14, 1), (16, 1)],
  term ((-49150347003872646 : Rat) / 690204756521971) [(8, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem ep_Q2_020_partial_28_0039_valid :
    mulPoly ep_Q2_020_coefficient_28_0039
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0040 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 40 for generator 28. -/
def ep_Q2_020_partial_28_0040 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem ep_Q2_020_partial_28_0040_valid :
    mulPoly ep_Q2_020_coefficient_28_0040
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0041 : Poly :=
[
  term ((-37507553822010345 : Rat) / 4921460003026228) [(8, 1), (16, 1)]
]

/-- Partial product 41 for generator 28. -/
def ep_Q2_020_partial_28_0041 : Poly :=
[
  term ((-37507553822010345 : Rat) / 2460730001513114) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((37507553822010345 : Rat) / 4921460003026228) [(4, 2), (8, 1), (16, 1)],
  term ((-37507553822010345 : Rat) / 2460730001513114) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((37507553822010345 : Rat) / 4921460003026228) [(5, 2), (8, 1), (16, 1)],
  term ((37507553822010345 : Rat) / 2460730001513114) [(8, 1), (14, 1), (16, 1)],
  term ((-37507553822010345 : Rat) / 4921460003026228) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem ep_Q2_020_partial_28_0041_valid :
    mulPoly ep_Q2_020_coefficient_28_0041
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0042 : Poly :=
[
  term ((-34767788399118432 : Rat) / 28298395017400811) [(8, 2), (16, 1)]
]

/-- Partial product 42 for generator 28. -/
def ep_Q2_020_partial_28_0042 : Poly :=
[
  term ((-69535576798236864 : Rat) / 28298395017400811) [(4, 1), (8, 2), (14, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 2), (16, 1)],
  term ((-69535576798236864 : Rat) / 28298395017400811) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 2), (16, 1)],
  term ((69535576798236864 : Rat) / 28298395017400811) [(8, 2), (14, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem ep_Q2_020_partial_28_0042_valid :
    mulPoly ep_Q2_020_coefficient_28_0042
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0043 : Poly :=
[
  term ((884115564995022417 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 28. -/
def ep_Q2_020_partial_28_0043 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem ep_Q2_020_partial_28_0043_valid :
    mulPoly ep_Q2_020_coefficient_28_0043
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0044 : Poly :=
[
  term ((172681901547872376 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 28. -/
def ep_Q2_020_partial_28_0044 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem ep_Q2_020_partial_28_0044_valid :
    mulPoly ep_Q2_020_coefficient_28_0044
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0045 : Poly :=
[
  term ((-30834355542465789 : Rat) / 1951613449475918) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 28. -/
def ep_Q2_020_partial_28_0045 : Poly :=
[
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem ep_Q2_020_partial_28_0045_valid :
    mulPoly ep_Q2_020_coefficient_28_0045
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0046 : Poly :=
[
  term ((-21436308964867500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 46 for generator 28. -/
def ep_Q2_020_partial_28_0046 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem ep_Q2_020_partial_28_0046_valid :
    mulPoly ep_Q2_020_coefficient_28_0046
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0047 : Poly :=
[
  term ((-5651539123075783059 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 28. -/
def ep_Q2_020_partial_28_0047 : Poly :=
[
  term ((-5651539123075783059 : Rat) / 56596790034801622) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5651539123075783059 : Rat) / 113193580069603244) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5651539123075783059 : Rat) / 56596790034801622) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((5651539123075783059 : Rat) / 113193580069603244) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((5651539123075783059 : Rat) / 56596790034801622) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5651539123075783059 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 28. -/
theorem ep_Q2_020_partial_28_0047_valid :
    mulPoly ep_Q2_020_coefficient_28_0047
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0048 : Poly :=
[
  term ((25452606951215940 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 48 for generator 28. -/
def ep_Q2_020_partial_28_0048 : Poly :=
[
  term ((50905213902431880 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-25452606951215940 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((50905213902431880 : Rat) / 28298395017400811) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25452606951215940 : Rat) / 28298395017400811) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((25452606951215940 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)],
  term ((-50905213902431880 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 28. -/
theorem ep_Q2_020_partial_28_0048_valid :
    mulPoly ep_Q2_020_coefficient_28_0048
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0049 : Poly :=
[
  term ((101313484515308229 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 49 for generator 28. -/
def ep_Q2_020_partial_28_0049 : Poly :=
[
  term ((202626969030616458 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-101313484515308229 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((202626969030616458 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101313484515308229 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)],
  term ((-202626969030616458 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)],
  term ((101313484515308229 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 28. -/
theorem ep_Q2_020_partial_28_0049_valid :
    mulPoly ep_Q2_020_coefficient_28_0049
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0050 : Poly :=
[
  term ((25241809042872588 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 28. -/
def ep_Q2_020_partial_28_0050 : Poly :=
[
  term ((50483618085745176 : Rat) / 28298395017400811) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25241809042872588 : Rat) / 28298395017400811) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((50483618085745176 : Rat) / 28298395017400811) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25241809042872588 : Rat) / 28298395017400811) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50483618085745176 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25241809042872588 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 28. -/
theorem ep_Q2_020_partial_28_0050_valid :
    mulPoly ep_Q2_020_coefficient_28_0050
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0051 : Poly :=
[
  term ((-107491990320579294 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

/-- Partial product 51 for generator 28. -/
def ep_Q2_020_partial_28_0051 : Poly :=
[
  term ((-214983980641158588 : Rat) / 28298395017400811) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((107491990320579294 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((-214983980641158588 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((107491990320579294 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((214983980641158588 : Rat) / 28298395017400811) [(13, 2), (14, 1), (16, 1)],
  term ((-107491990320579294 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 28. -/
theorem ep_Q2_020_partial_28_0051_valid :
    mulPoly ep_Q2_020_coefficient_28_0051
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0052 : Poly :=
[
  term ((-1474647780946526553 : Rat) / 56596790034801622) [(14, 1), (16, 1)]
]

/-- Partial product 52 for generator 28. -/
def ep_Q2_020_partial_28_0052 : Poly :=
[
  term ((-1474647780946526553 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)],
  term ((1474647780946526553 : Rat) / 56596790034801622) [(4, 2), (14, 1), (16, 1)],
  term ((-1474647780946526553 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1474647780946526553 : Rat) / 56596790034801622) [(5, 2), (14, 1), (16, 1)],
  term ((-1474647780946526553 : Rat) / 56596790034801622) [(14, 1), (16, 1)],
  term ((1474647780946526553 : Rat) / 28298395017400811) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 28. -/
theorem ep_Q2_020_partial_28_0052_valid :
    mulPoly ep_Q2_020_coefficient_28_0052
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0053 : Poly :=
[
  term ((989487083502308769 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 53 for generator 28. -/
def ep_Q2_020_partial_28_0053 : Poly :=
[
  term ((989487083502308769 : Rat) / 28298395017400811) [(4, 1), (14, 3), (16, 1)],
  term ((-989487083502308769 : Rat) / 56596790034801622) [(4, 2), (14, 2), (16, 1)],
  term ((989487083502308769 : Rat) / 28298395017400811) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-989487083502308769 : Rat) / 56596790034801622) [(5, 2), (14, 2), (16, 1)],
  term ((989487083502308769 : Rat) / 56596790034801622) [(14, 2), (16, 1)],
  term ((-989487083502308769 : Rat) / 28298395017400811) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 28. -/
theorem ep_Q2_020_partial_28_0053_valid :
    mulPoly ep_Q2_020_coefficient_28_0053
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0054 : Poly :=
[
  term ((989487083502308769 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 54 for generator 28. -/
def ep_Q2_020_partial_28_0054 : Poly :=
[
  term ((989487083502308769 : Rat) / 28298395017400811) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-989487083502308769 : Rat) / 56596790034801622) [(4, 2), (15, 2), (16, 1)],
  term ((989487083502308769 : Rat) / 28298395017400811) [(5, 1), (15, 3), (16, 1)],
  term ((-989487083502308769 : Rat) / 56596790034801622) [(5, 2), (15, 2), (16, 1)],
  term ((-989487083502308769 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((989487083502308769 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 28. -/
theorem ep_Q2_020_partial_28_0054_valid :
    mulPoly ep_Q2_020_coefficient_28_0054
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 28. -/
def ep_Q2_020_coefficient_28_0055 : Poly :=
[
  term ((-87738091349912241 : Rat) / 113193580069603244) [(16, 1)]
]

/-- Partial product 55 for generator 28. -/
def ep_Q2_020_partial_28_0055 : Poly :=
[
  term ((-87738091349912241 : Rat) / 56596790034801622) [(4, 1), (14, 1), (16, 1)],
  term ((87738091349912241 : Rat) / 113193580069603244) [(4, 2), (16, 1)],
  term ((-87738091349912241 : Rat) / 56596790034801622) [(5, 1), (15, 1), (16, 1)],
  term ((87738091349912241 : Rat) / 113193580069603244) [(5, 2), (16, 1)],
  term ((87738091349912241 : Rat) / 56596790034801622) [(14, 1), (16, 1)],
  term ((-87738091349912241 : Rat) / 113193580069603244) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 28. -/
theorem ep_Q2_020_partial_28_0055_valid :
    mulPoly ep_Q2_020_coefficient_28_0055
        ep_Q2_020_generator_28_0000_0055 =
      ep_Q2_020_partial_28_0055 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_28_0000_0055 : List Poly :=
[
  ep_Q2_020_partial_28_0000,
  ep_Q2_020_partial_28_0001,
  ep_Q2_020_partial_28_0002,
  ep_Q2_020_partial_28_0003,
  ep_Q2_020_partial_28_0004,
  ep_Q2_020_partial_28_0005,
  ep_Q2_020_partial_28_0006,
  ep_Q2_020_partial_28_0007,
  ep_Q2_020_partial_28_0008,
  ep_Q2_020_partial_28_0009,
  ep_Q2_020_partial_28_0010,
  ep_Q2_020_partial_28_0011,
  ep_Q2_020_partial_28_0012,
  ep_Q2_020_partial_28_0013,
  ep_Q2_020_partial_28_0014,
  ep_Q2_020_partial_28_0015,
  ep_Q2_020_partial_28_0016,
  ep_Q2_020_partial_28_0017,
  ep_Q2_020_partial_28_0018,
  ep_Q2_020_partial_28_0019,
  ep_Q2_020_partial_28_0020,
  ep_Q2_020_partial_28_0021,
  ep_Q2_020_partial_28_0022,
  ep_Q2_020_partial_28_0023,
  ep_Q2_020_partial_28_0024,
  ep_Q2_020_partial_28_0025,
  ep_Q2_020_partial_28_0026,
  ep_Q2_020_partial_28_0027,
  ep_Q2_020_partial_28_0028,
  ep_Q2_020_partial_28_0029,
  ep_Q2_020_partial_28_0030,
  ep_Q2_020_partial_28_0031,
  ep_Q2_020_partial_28_0032,
  ep_Q2_020_partial_28_0033,
  ep_Q2_020_partial_28_0034,
  ep_Q2_020_partial_28_0035,
  ep_Q2_020_partial_28_0036,
  ep_Q2_020_partial_28_0037,
  ep_Q2_020_partial_28_0038,
  ep_Q2_020_partial_28_0039,
  ep_Q2_020_partial_28_0040,
  ep_Q2_020_partial_28_0041,
  ep_Q2_020_partial_28_0042,
  ep_Q2_020_partial_28_0043,
  ep_Q2_020_partial_28_0044,
  ep_Q2_020_partial_28_0045,
  ep_Q2_020_partial_28_0046,
  ep_Q2_020_partial_28_0047,
  ep_Q2_020_partial_28_0048,
  ep_Q2_020_partial_28_0049,
  ep_Q2_020_partial_28_0050,
  ep_Q2_020_partial_28_0051,
  ep_Q2_020_partial_28_0052,
  ep_Q2_020_partial_28_0053,
  ep_Q2_020_partial_28_0054,
  ep_Q2_020_partial_28_0055
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_28_0000_0055 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((953651141793259281 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (14, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-319324544378527896 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-183550277367624024 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-953651141793259281 : Rat) / 56596790034801622) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 1), (4, 2), (14, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((159662272189263948 : Rat) / 28298395017400811) [(0, 1), (4, 2), (16, 1)],
  term ((953651141793259281 : Rat) / 28298395017400811) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-252814532978048184 : Rat) / 28298395017400811) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-284692416573315816 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-953651141793259281 : Rat) / 56596790034801622) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-121441602996188640 : Rat) / 28298395017400811) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((91775138683812012 : Rat) / 28298395017400811) [(0, 1), (5, 2), (14, 1), (16, 1)],
  term ((110401457269262400 : Rat) / 28298395017400811) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((159662272189263948 : Rat) / 28298395017400811) [(0, 1), (5, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 3), (11, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((-953651141793259281 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((953651141793259281 : Rat) / 56596790034801622) [(0, 1), (8, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((227549405694715884 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)],
  term ((183550277367624024 : Rat) / 28298395017400811) [(0, 1), (14, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)],
  term ((-159662272189263948 : Rat) / 28298395017400811) [(0, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19899346527262368 : Rat) / 975806724737959) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((9949673263631184 : Rat) / 975806724737959) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19899346527262368 : Rat) / 975806724737959) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((9949673263631184 : Rat) / 975806724737959) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((-152016982776876537 : Rat) / 56596790034801622) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 3), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)],
  term ((19899346527262368 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9949673263631184 : Rat) / 975806724737959) [(1, 1), (13, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(1, 1), (15, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-790611957029972976 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(2, 1), (4, 2), (12, 1), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-790611957029972976 : Rat) / 28298395017400811) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-144656625058356 : Rat) / 30008902457477) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(2, 1), (12, 1), (16, 1)],
  term ((-395305978514986488 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)],
  term ((790611957029972976 : Rat) / 28298395017400811) [(2, 1), (14, 2), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-790611957029972976 : Rat) / 28298395017400811) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-790611957029972976 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((395305978514986488 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-144656625058356 : Rat) / 30008902457477) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(3, 1), (13, 1), (16, 1)],
  term ((790611957029972976 : Rat) / 28298395017400811) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-395305978514986488 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-264376818200694948 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-155342762612010966 : Rat) / 28298395017400811) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-56755668282590247 : Rat) / 28298395017400811) [(4, 1), (5, 2), (14, 1), (16, 1)],
  term ((77671381306005483 : Rat) / 28298395017400811) [(4, 1), (5, 2), (16, 1)],
  term ((252003472272519912 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-196191103257809772 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((260708879756356608 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-695348033718916047 : Rat) / 56596790034801622) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((49150347003872646 : Rat) / 690204756521971) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)],
  term ((-69535576798236864 : Rat) / 28298395017400811) [(4, 1), (8, 2), (14, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5651539123075783059 : Rat) / 56596790034801622) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((202626969030616458 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((50905213902431880 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((50483618085745176 : Rat) / 28298395017400811) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-214983980641158588 : Rat) / 28298395017400811) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((989487083502308769 : Rat) / 28298395017400811) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((336458770439290185 : Rat) / 56596790034801622) [(4, 1), (14, 1), (16, 1)],
  term ((-1588159117511707047 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)],
  term ((989487083502308769 : Rat) / 28298395017400811) [(4, 1), (14, 3), (16, 1)],
  term ((-77671381306005483 : Rat) / 28298395017400811) [(4, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((132188409100347474 : Rat) / 28298395017400811) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((56755668282590247 : Rat) / 28298395017400811) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-126001736136259956 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(4, 2), (6, 1), (14, 1), (16, 1)],
  term ((1372295745904254 : Rat) / 690204756521971) [(4, 2), (6, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-130354439878178304 : Rat) / 28298395017400811) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1091244965673050187 : Rat) / 28298395017400811) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((37507553822010345 : Rat) / 4921460003026228) [(4, 2), (8, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((5651539123075783059 : Rat) / 113193580069603244) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25452606951215940 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-101313484515308229 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((-25241809042872588 : Rat) / 28298395017400811) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((107491990320579294 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((1163962255722504621 : Rat) / 56596790034801622) [(4, 2), (14, 1), (16, 1)],
  term ((-762464410371947781 : Rat) / 56596790034801622) [(4, 2), (14, 2), (16, 1)],
  term ((-989487083502308769 : Rat) / 56596790034801622) [(4, 2), (15, 2), (16, 1)],
  term ((87738091349912241 : Rat) / 113193580069603244) [(4, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 3), (6, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(4, 3), (8, 1), (16, 1)],
  term ((-56755668282590247 : Rat) / 28298395017400811) [(4, 3), (14, 1), (16, 1)],
  term ((77671381306005483 : Rat) / 28298395017400811) [(4, 3), (16, 1)],
  term ((252003472272519912 : Rat) / 28298395017400811) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2744591491808508 : Rat) / 690204756521971) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83662852093660944 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((260708879756356608 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((2084428482769202646 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-931937993516662095 : Rat) / 56596790034801622) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-69535576798236864 : Rat) / 28298395017400811) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5651539123075783059 : Rat) / 56596790034801622) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)],
  term ((50905213902431880 : Rat) / 28298395017400811) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((202626969030616458 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((264376818200694948 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((50483618085745176 : Rat) / 28298395017400811) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-132188409100347474 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((-214983980641158588 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1361136444381346059 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((989487083502308769 : Rat) / 28298395017400811) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-201249427915092735 : Rat) / 56596790034801622) [(5, 1), (15, 1), (16, 1)],
  term ((989487083502308769 : Rat) / 28298395017400811) [(5, 1), (15, 3), (16, 1)],
  term ((-126001736136259956 : Rat) / 28298395017400811) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((1372295745904254 : Rat) / 690204756521971) [(5, 2), (6, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(5, 2), (6, 2), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((83662852093660944 : Rat) / 28298395017400811) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(5, 2), (7, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-130354439878178304 : Rat) / 28298395017400811) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24575173501936323 : Rat) / 690204756521971) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((-110401457269262400 : Rat) / 28298395017400811) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((37507553822010345 : Rat) / 4921460003026228) [(5, 2), (8, 1), (16, 1)],
  term ((34767788399118432 : Rat) / 28298395017400811) [(5, 2), (8, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-172681901547872376 : Rat) / 28298395017400811) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((152016982776876537 : Rat) / 56596790034801622) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((5803920485418716211 : Rat) / 113193580069603244) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25452606951215940 : Rat) / 28298395017400811) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-101313484515308229 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)],
  term ((-289618627243567536 : Rat) / 28298395017400811) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((107491990320579294 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((1474647780946526553 : Rat) / 56596790034801622) [(5, 2), (14, 1), (16, 1)],
  term ((-989487083502308769 : Rat) / 56596790034801622) [(5, 2), (14, 2), (16, 1)],
  term ((-1216509756632669757 : Rat) / 56596790034801622) [(5, 2), (15, 2), (16, 1)],
  term ((87738091349912241 : Rat) / 113193580069603244) [(5, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(5, 3), (7, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 3), (9, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 3), (11, 1), (16, 1)],
  term ((132188409100347474 : Rat) / 28298395017400811) [(5, 3), (13, 1), (16, 1)],
  term ((56755668282590247 : Rat) / 28298395017400811) [(5, 3), (15, 1), (16, 1)],
  term ((-252003472272519912 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((126001736136259956 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)],
  term ((2744591491808508 : Rat) / 690204756521971) [(6, 1), (14, 1), (16, 1)],
  term ((-1372295745904254 : Rat) / 690204756521971) [(6, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(6, 2), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)],
  term ((41831426046830472 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)],
  term ((-20915713023415236 : Rat) / 28298395017400811) [(7, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-260708879756356608 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((130354439878178304 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((2877837965065016421 : Rat) / 56596790034801622) [(8, 1), (14, 1), (16, 1)],
  term ((-49150347003872646 : Rat) / 690204756521971) [(8, 1), (14, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(8, 1), (15, 2), (16, 1)],
  term ((-37507553822010345 : Rat) / 4921460003026228) [(8, 1), (16, 1)],
  term ((69535576798236864 : Rat) / 28298395017400811) [(8, 2), (14, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(8, 2), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((172681901547872376 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(9, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21436308964867500 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)],
  term ((5651539123075783059 : Rat) / 56596790034801622) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5651539123075783059 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)],
  term ((-177174362079400518 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)],
  term ((-50905213902431880 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((101313484515308229 : Rat) / 28298395017400811) [(12, 1), (16, 1)],
  term ((-50483618085745176 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25241809042872588 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)],
  term ((214983980641158588 : Rat) / 28298395017400811) [(13, 2), (14, 1), (16, 1)],
  term ((-107491990320579294 : Rat) / 28298395017400811) [(13, 2), (16, 1)],
  term ((-989487083502308769 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((-693454844798307156 : Rat) / 28298395017400811) [(14, 1), (16, 1)],
  term ((96067869399886875 : Rat) / 1380409513043942) [(14, 2), (16, 1)],
  term ((-989487083502308769 : Rat) / 28298395017400811) [(14, 3), (16, 1)],
  term ((989487083502308769 : Rat) / 56596790034801622) [(15, 2), (16, 1)],
  term ((-87738091349912241 : Rat) / 113193580069603244) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 55. -/
theorem ep_Q2_020_block_28_0000_0055_valid :
    checkProductSumEq ep_Q2_020_partials_28_0000_0055
      ep_Q2_020_block_28_0000_0055 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
