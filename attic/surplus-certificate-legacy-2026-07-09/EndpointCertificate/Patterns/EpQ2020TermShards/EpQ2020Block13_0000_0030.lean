/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 13:0-30

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 13 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_13_0000_0030 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0000 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 13. -/
def ep_Q2_020_partial_13_0000 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem ep_Q2_020_partial_13_0000_valid :
    mulPoly ep_Q2_020_coefficient_13_0000
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0001 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 13. -/
def ep_Q2_020_partial_13_0001 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem ep_Q2_020_partial_13_0001_valid :
    mulPoly ep_Q2_020_coefficient_13_0001
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0002 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 13. -/
def ep_Q2_020_partial_13_0002 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem ep_Q2_020_partial_13_0002_valid :
    mulPoly ep_Q2_020_coefficient_13_0002
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0003 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 13. -/
def ep_Q2_020_partial_13_0003 : Poly :=
[
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem ep_Q2_020_partial_13_0003_valid :
    mulPoly ep_Q2_020_coefficient_13_0003
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0004 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 13. -/
def ep_Q2_020_partial_13_0004 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem ep_Q2_020_partial_13_0004_valid :
    mulPoly ep_Q2_020_coefficient_13_0004
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0005 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 13. -/
def ep_Q2_020_partial_13_0005 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem ep_Q2_020_partial_13_0005_valid :
    mulPoly ep_Q2_020_coefficient_13_0005
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0006 : Poly :=
[
  term ((3782337760585587 : Rat) / 2760819026087884) [(0, 1), (16, 1)]
]

/-- Partial product 6 for generator 13. -/
def ep_Q2_020_partial_13_0006 : Poly :=
[
  term ((-3782337760585587 : Rat) / 1380409513043942) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((3782337760585587 : Rat) / 2760819026087884) [(0, 1), (2, 2), (16, 1)],
  term ((-3782337760585587 : Rat) / 1380409513043942) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((3782337760585587 : Rat) / 2760819026087884) [(0, 1), (3, 2), (16, 1)],
  term ((3782337760585587 : Rat) / 1380409513043942) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((3782337760585587 : Rat) / 1380409513043942) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((-3782337760585587 : Rat) / 2760819026087884) [(0, 1), (8, 2), (16, 1)],
  term ((-3782337760585587 : Rat) / 2760819026087884) [(0, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem ep_Q2_020_partial_13_0006_valid :
    mulPoly ep_Q2_020_coefficient_13_0006
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0007 : Poly :=
[
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 7 for generator 13. -/
def ep_Q2_020_partial_13_0007 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem ep_Q2_020_partial_13_0007_valid :
    mulPoly ep_Q2_020_coefficient_13_0007
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0008 : Poly :=
[
  term ((-26289330780030777 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 8 for generator 13. -/
def ep_Q2_020_partial_13_0008 : Poly :=
[
  term ((52578661560061554 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (7, 1), (16, 1)],
  term ((-26289330780030777 : Rat) / 28298395017400811) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((52578661560061554 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-26289330780030777 : Rat) / 28298395017400811) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-52578661560061554 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (8, 1), (16, 1)],
  term ((-52578661560061554 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((26289330780030777 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((26289330780030777 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem ep_Q2_020_partial_13_0008_valid :
    mulPoly ep_Q2_020_coefficient_13_0008
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0009 : Poly :=
[
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 13. -/
def ep_Q2_020_partial_13_0009 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem ep_Q2_020_partial_13_0009_valid :
    mulPoly ep_Q2_020_coefficient_13_0009
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0010 : Poly :=
[
  term ((165178273856743092 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 13. -/
def ep_Q2_020_partial_13_0010 : Poly :=
[
  term ((-330356547713486184 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((165178273856743092 : Rat) / 28298395017400811) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-330356547713486184 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((165178273856743092 : Rat) / 28298395017400811) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((330356547713486184 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((330356547713486184 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-165178273856743092 : Rat) / 28298395017400811) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-165178273856743092 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem ep_Q2_020_partial_13_0010_valid :
    mulPoly ep_Q2_020_coefficient_13_0010
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0011 : Poly :=
[
  term ((-638862153186575133 : Rat) / 56596790034801622) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 13. -/
def ep_Q2_020_partial_13_0011 : Poly :=
[
  term ((638862153186575133 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-638862153186575133 : Rat) / 56596790034801622) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-638862153186575133 : Rat) / 56596790034801622) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-638862153186575133 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-638862153186575133 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 56596790034801622) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 56596790034801622) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem ep_Q2_020_partial_13_0011_valid :
    mulPoly ep_Q2_020_coefficient_13_0011
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0012 : Poly :=
[
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

/-- Partial product 12 for generator 13. -/
def ep_Q2_020_partial_13_0012 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (2, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (3, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (8, 2), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem ep_Q2_020_partial_13_0012_valid :
    mulPoly ep_Q2_020_coefficient_13_0012
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0013 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 13 for generator 13. -/
def ep_Q2_020_partial_13_0013 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem ep_Q2_020_partial_13_0013_valid :
    mulPoly ep_Q2_020_coefficient_13_0013
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0014 : Poly :=
[
  term ((10224243921813804 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 13. -/
def ep_Q2_020_partial_13_0014 : Poly :=
[
  term ((-20448487843627608 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((10224243921813804 : Rat) / 28298395017400811) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-20448487843627608 : Rat) / 28298395017400811) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((10224243921813804 : Rat) / 28298395017400811) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((20448487843627608 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-10224243921813804 : Rat) / 28298395017400811) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-10224243921813804 : Rat) / 28298395017400811) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((20448487843627608 : Rat) / 28298395017400811) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem ep_Q2_020_partial_13_0014_valid :
    mulPoly ep_Q2_020_coefficient_13_0014
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0015 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 13. -/
def ep_Q2_020_partial_13_0015 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem ep_Q2_020_partial_13_0015_valid :
    mulPoly ep_Q2_020_coefficient_13_0015
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0016 : Poly :=
[
  term ((185544831988657836 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 13. -/
def ep_Q2_020_partial_13_0016 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem ep_Q2_020_partial_13_0016_valid :
    mulPoly ep_Q2_020_coefficient_13_0016
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0017 : Poly :=
[
  term ((-311474063746562796 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 13. -/
def ep_Q2_020_partial_13_0017 : Poly :=
[
  term ((622948127493125592 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-311474063746562796 : Rat) / 28298395017400811) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((622948127493125592 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-311474063746562796 : Rat) / 28298395017400811) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-622948127493125592 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-622948127493125592 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((311474063746562796 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((311474063746562796 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem ep_Q2_020_partial_13_0017_valid :
    mulPoly ep_Q2_020_coefficient_13_0017
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0018 : Poly :=
[
  term ((33792958471160061 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 13. -/
def ep_Q2_020_partial_13_0018 : Poly :=
[
  term ((-67585916942320122 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem ep_Q2_020_partial_13_0018_valid :
    mulPoly ep_Q2_020_coefficient_13_0018
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0019 : Poly :=
[
  term ((125928424963932786 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 19 for generator 13. -/
def ep_Q2_020_partial_13_0019 : Poly :=
[
  term ((-251856849927865572 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((125928424963932786 : Rat) / 28298395017400811) [(2, 2), (7, 2), (16, 1)],
  term ((-251856849927865572 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((125928424963932786 : Rat) / 28298395017400811) [(3, 2), (7, 2), (16, 1)],
  term ((251856849927865572 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 1), (16, 1)],
  term ((251856849927865572 : Rat) / 28298395017400811) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-125928424963932786 : Rat) / 28298395017400811) [(7, 2), (8, 2), (16, 1)],
  term ((-125928424963932786 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem ep_Q2_020_partial_13_0019_valid :
    mulPoly ep_Q2_020_coefficient_13_0019
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0020 : Poly :=
[
  term ((42872617929735000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 13. -/
def ep_Q2_020_partial_13_0020 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem ep_Q2_020_partial_13_0020_valid :
    mulPoly ep_Q2_020_coefficient_13_0020
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0021 : Poly :=
[
  term ((1967431383683568 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 13. -/
def ep_Q2_020_partial_13_0021 : Poly :=
[
  term ((-3934862767367136 : Rat) / 1230365000756557) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem ep_Q2_020_partial_13_0021_valid :
    mulPoly ep_Q2_020_coefficient_13_0021
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0022 : Poly :=
[
  term ((-964540141912116567 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 13. -/
def ep_Q2_020_partial_13_0022 : Poly :=
[
  term ((1929080283824233134 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-964540141912116567 : Rat) / 28298395017400811) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1929080283824233134 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-964540141912116567 : Rat) / 28298395017400811) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1929080283824233134 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1929080283824233134 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((964540141912116567 : Rat) / 28298395017400811) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((964540141912116567 : Rat) / 28298395017400811) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem ep_Q2_020_partial_13_0022_valid :
    mulPoly ep_Q2_020_coefficient_13_0022
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0023 : Poly :=
[
  term ((-194804941919144946 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 23 for generator 13. -/
def ep_Q2_020_partial_13_0023 : Poly :=
[
  term ((389609883838289892 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-194804941919144946 : Rat) / 28298395017400811) [(2, 2), (12, 1), (16, 1)],
  term ((389609883838289892 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-194804941919144946 : Rat) / 28298395017400811) [(3, 2), (12, 1), (16, 1)],
  term ((-389609883838289892 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-389609883838289892 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((194804941919144946 : Rat) / 28298395017400811) [(8, 2), (12, 1), (16, 1)],
  term ((194804941919144946 : Rat) / 28298395017400811) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem ep_Q2_020_partial_13_0023_valid :
    mulPoly ep_Q2_020_coefficient_13_0023
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0024 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 13. -/
def ep_Q2_020_partial_13_0024 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem ep_Q2_020_partial_13_0024_valid :
    mulPoly ep_Q2_020_coefficient_13_0024
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0025 : Poly :=
[
  term ((-253106478464966526 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 13. -/
def ep_Q2_020_partial_13_0025 : Poly :=
[
  term ((506212956929933052 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-253106478464966526 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((506212956929933052 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-253106478464966526 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-506212956929933052 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-506212956929933052 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((253106478464966526 : Rat) / 28298395017400811) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((253106478464966526 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem ep_Q2_020_partial_13_0025_valid :
    mulPoly ep_Q2_020_coefficient_13_0025
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0026 : Poly :=
[
  term ((105121061865535860 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

/-- Partial product 26 for generator 13. -/
def ep_Q2_020_partial_13_0026 : Poly :=
[
  term ((-210242123731071720 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((105121061865535860 : Rat) / 28298395017400811) [(2, 2), (13, 2), (16, 1)],
  term ((-210242123731071720 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((105121061865535860 : Rat) / 28298395017400811) [(3, 2), (13, 2), (16, 1)],
  term ((210242123731071720 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((210242123731071720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-105121061865535860 : Rat) / 28298395017400811) [(8, 2), (13, 2), (16, 1)],
  term ((-105121061865535860 : Rat) / 28298395017400811) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem ep_Q2_020_partial_13_0026_valid :
    mulPoly ep_Q2_020_coefficient_13_0026
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0027 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 27 for generator 13. -/
def ep_Q2_020_partial_13_0027 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem ep_Q2_020_partial_13_0027_valid :
    mulPoly ep_Q2_020_coefficient_13_0027
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0028 : Poly :=
[
  term ((489625676383684617 : Rat) / 113193580069603244) [(14, 1), (16, 1)]
]

/-- Partial product 28 for generator 13. -/
def ep_Q2_020_partial_13_0028 : Poly :=
[
  term ((-489625676383684617 : Rat) / 56596790034801622) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((489625676383684617 : Rat) / 113193580069603244) [(2, 2), (14, 1), (16, 1)],
  term ((-489625676383684617 : Rat) / 56596790034801622) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((489625676383684617 : Rat) / 113193580069603244) [(3, 2), (14, 1), (16, 1)],
  term ((489625676383684617 : Rat) / 56596790034801622) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((489625676383684617 : Rat) / 56596790034801622) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-489625676383684617 : Rat) / 113193580069603244) [(8, 2), (14, 1), (16, 1)],
  term ((-489625676383684617 : Rat) / 113193580069603244) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem ep_Q2_020_partial_13_0028_valid :
    mulPoly ep_Q2_020_coefficient_13_0028
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0029 : Poly :=
[
  term ((30834355542465789 : Rat) / 1951613449475918) [(15, 2), (16, 1)]
]

/-- Partial product 29 for generator 13. -/
def ep_Q2_020_partial_13_0029 : Poly :=
[
  term ((-30834355542465789 : Rat) / 975806724737959) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(2, 2), (15, 2), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(3, 2), (15, 2), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(8, 2), (15, 2), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem ep_Q2_020_partial_13_0029_valid :
    mulPoly ep_Q2_020_coefficient_13_0029
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 13. -/
def ep_Q2_020_coefficient_13_0030 : Poly :=
[
  term ((68550289647477039 : Rat) / 28298395017400811) [(16, 1)]
]

/-- Partial product 30 for generator 13. -/
def ep_Q2_020_partial_13_0030 : Poly :=
[
  term ((-137100579294954078 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)],
  term ((68550289647477039 : Rat) / 28298395017400811) [(2, 2), (16, 1)],
  term ((-137100579294954078 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)],
  term ((68550289647477039 : Rat) / 28298395017400811) [(3, 2), (16, 1)],
  term ((137100579294954078 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)],
  term ((137100579294954078 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((-68550289647477039 : Rat) / 28298395017400811) [(8, 2), (16, 1)],
  term ((-68550289647477039 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 13. -/
theorem ep_Q2_020_partial_13_0030_valid :
    mulPoly ep_Q2_020_coefficient_13_0030
        ep_Q2_020_generator_13_0000_0030 =
      ep_Q2_020_partial_13_0030 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_13_0000_0030 : List Poly :=
[
  ep_Q2_020_partial_13_0000,
  ep_Q2_020_partial_13_0001,
  ep_Q2_020_partial_13_0002,
  ep_Q2_020_partial_13_0003,
  ep_Q2_020_partial_13_0004,
  ep_Q2_020_partial_13_0005,
  ep_Q2_020_partial_13_0006,
  ep_Q2_020_partial_13_0007,
  ep_Q2_020_partial_13_0008,
  ep_Q2_020_partial_13_0009,
  ep_Q2_020_partial_13_0010,
  ep_Q2_020_partial_13_0011,
  ep_Q2_020_partial_13_0012,
  ep_Q2_020_partial_13_0013,
  ep_Q2_020_partial_13_0014,
  ep_Q2_020_partial_13_0015,
  ep_Q2_020_partial_13_0016,
  ep_Q2_020_partial_13_0017,
  ep_Q2_020_partial_13_0018,
  ep_Q2_020_partial_13_0019,
  ep_Q2_020_partial_13_0020,
  ep_Q2_020_partial_13_0021,
  ep_Q2_020_partial_13_0022,
  ep_Q2_020_partial_13_0023,
  ep_Q2_020_partial_13_0024,
  ep_Q2_020_partial_13_0025,
  ep_Q2_020_partial_13_0026,
  ep_Q2_020_partial_13_0027,
  ep_Q2_020_partial_13_0028,
  ep_Q2_020_partial_13_0029,
  ep_Q2_020_partial_13_0030
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_13_0000_0030 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-3782337760585587 : Rat) / 1380409513043942) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((3782337760585587 : Rat) / 2760819026087884) [(0, 1), (2, 2), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-3782337760585587 : Rat) / 1380409513043942) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((3782337760585587 : Rat) / 2760819026087884) [(0, 1), (3, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((3782337760585587 : Rat) / 1380409513043942) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((3782337760585587 : Rat) / 1380409513043942) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((-3782337760585587 : Rat) / 2760819026087884) [(0, 1), (8, 2), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3782337760585587 : Rat) / 2760819026087884) [(0, 1), (9, 2), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((52578661560061554 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (7, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-330356547713486184 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-26289330780030777 : Rat) / 28298395017400811) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((165178273856743092 : Rat) / 28298395017400811) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-638862153186575133 : Rat) / 56596790034801622) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((52578661560061554 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-330356547713486184 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-26289330780030777 : Rat) / 28298395017400811) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((884115564995022417 : Rat) / 28298395017400811) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((165178273856743092 : Rat) / 28298395017400811) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-638862153186575133 : Rat) / 56596790034801622) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-52578661560061554 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (8, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((330356547713486184 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-638862153186575133 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-52578661560061554 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((330356547713486184 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-638862153186575133 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((26289330780030777 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((26289330780030777 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-165178273856743092 : Rat) / 28298395017400811) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 56596790034801622) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-884115564995022417 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-165178273856743092 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 56596790034801622) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (2, 2), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-127667078772466374 : Rat) / 28298395017400811) [(1, 2), (3, 2), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (8, 2), (16, 1)],
  term ((127667078772466374 : Rat) / 28298395017400811) [(1, 2), (9, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20448487843627608 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((622948127493125592 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-251856849927865572 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1929080283824233134 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((389609883838289892 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((506212956929933052 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-210242123731071720 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-489625676383684617 : Rat) / 56596790034801622) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-137100579294954078 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((10224243921813804 : Rat) / 28298395017400811) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-311474063746562796 : Rat) / 28298395017400811) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((125928424963932786 : Rat) / 28298395017400811) [(2, 2), (7, 2), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-964540141912116567 : Rat) / 28298395017400811) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-194804941919144946 : Rat) / 28298395017400811) [(2, 2), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-253106478464966526 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((105121061865535860 : Rat) / 28298395017400811) [(2, 2), (13, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((489625676383684617 : Rat) / 113193580069603244) [(2, 2), (14, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(2, 2), (15, 2), (16, 1)],
  term ((68550289647477039 : Rat) / 28298395017400811) [(2, 2), (16, 1)],
  term ((622948127493125592 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-251856849927865572 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1929080283824233134 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((389609883838289892 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((506212956929933052 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-210242123731071720 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-489625676383684617 : Rat) / 56596790034801622) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-137100579294954078 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-20448487843627608 : Rat) / 28298395017400811) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((10224243921813804 : Rat) / 28298395017400811) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((185544831988657836 : Rat) / 28298395017400811) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-311474063746562796 : Rat) / 28298395017400811) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((33792958471160061 : Rat) / 28298395017400811) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((125928424963932786 : Rat) / 28298395017400811) [(3, 2), (7, 2), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-964540141912116567 : Rat) / 28298395017400811) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-194804941919144946 : Rat) / 28298395017400811) [(3, 2), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-253106478464966526 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((105121061865535860 : Rat) / 28298395017400811) [(3, 2), (13, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((489625676383684617 : Rat) / 113193580069603244) [(3, 2), (14, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 1951613449475918) [(3, 2), (15, 2), (16, 1)],
  term ((68550289647477039 : Rat) / 28298395017400811) [(3, 2), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((20448487843627608 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-622948127493125592 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((251856849927865572 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1929080283824233134 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-389609883838289892 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-506212956929933052 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((210242123731071720 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((489625676383684617 : Rat) / 56596790034801622) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((137100579294954078 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)],
  term ((-622948127493125592 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((251856849927865572 : Rat) / 28298395017400811) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-10224243921813804 : Rat) / 28298395017400811) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3934862767367136 : Rat) / 1230365000756557) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1929080283824233134 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-389609883838289892 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-506212956929933052 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((210242123731071720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((489625676383684617 : Rat) / 56596790034801622) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((30834355542465789 : Rat) / 975806724737959) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((137100579294954078 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-10224243921813804 : Rat) / 28298395017400811) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-185544831988657836 : Rat) / 28298395017400811) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((20448487843627608 : Rat) / 28298395017400811) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((311474063746562796 : Rat) / 28298395017400811) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((311474063746562796 : Rat) / 28298395017400811) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-33792958471160061 : Rat) / 28298395017400811) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-125928424963932786 : Rat) / 28298395017400811) [(7, 2), (8, 2), (16, 1)],
  term ((-125928424963932786 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((964540141912116567 : Rat) / 28298395017400811) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((194804941919144946 : Rat) / 28298395017400811) [(8, 2), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((253106478464966526 : Rat) / 28298395017400811) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-105121061865535860 : Rat) / 28298395017400811) [(8, 2), (13, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-489625676383684617 : Rat) / 113193580069603244) [(8, 2), (14, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(8, 2), (15, 2), (16, 1)],
  term ((-68550289647477039 : Rat) / 28298395017400811) [(8, 2), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((964540141912116567 : Rat) / 28298395017400811) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((194804941919144946 : Rat) / 28298395017400811) [(9, 2), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((253106478464966526 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-105121061865535860 : Rat) / 28298395017400811) [(9, 2), (13, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-489625676383684617 : Rat) / 113193580069603244) [(9, 2), (14, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 1951613449475918) [(9, 2), (15, 2), (16, 1)],
  term ((-68550289647477039 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 30. -/
theorem ep_Q2_020_block_13_0000_0030_valid :
    checkProductSumEq ep_Q2_020_partials_13_0000_0030
      ep_Q2_020_block_13_0000_0030 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
