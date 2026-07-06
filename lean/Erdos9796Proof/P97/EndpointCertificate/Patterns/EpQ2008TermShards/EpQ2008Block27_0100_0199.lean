/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0100 : Poly :=
[
  term ((-1623051116173234125 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 27. -/
def ep_Q2_008_partial_27_0100 : Poly :=
[
  term ((-1623051116173234125 : Rat) / 692956453614176359) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((1623051116173234125 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 27. -/
theorem ep_Q2_008_partial_27_0100_valid :
    mulPoly ep_Q2_008_coefficient_27_0100
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0101 : Poly :=
[
  term ((-30560551079972547643318262392085479286250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 27. -/
def ep_Q2_008_partial_27_0101 : Poly :=
[
  term ((-61121102159945095286636524784170958572500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((30560551079972547643318262392085479286250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 27. -/
theorem ep_Q2_008_partial_27_0101_valid :
    mulPoly ep_Q2_008_coefficient_27_0101
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0102 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 102 for generator 27. -/
def ep_Q2_008_partial_27_0102 : Poly :=
[
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 27. -/
theorem ep_Q2_008_partial_27_0102_valid :
    mulPoly ep_Q2_008_coefficient_27_0102
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0103 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 103 for generator 27. -/
def ep_Q2_008_partial_27_0103 : Poly :=
[
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 27. -/
theorem ep_Q2_008_partial_27_0103_valid :
    mulPoly ep_Q2_008_coefficient_27_0103
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0104 : Poly :=
[
  term ((-128629257418242000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

/-- Partial product 104 for generator 27. -/
def ep_Q2_008_partial_27_0104 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((128629257418242000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 27. -/
theorem ep_Q2_008_partial_27_0104_valid :
    mulPoly ep_Q2_008_coefficient_27_0104
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0105 : Poly :=
[
  term ((147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 27. -/
def ep_Q2_008_partial_27_0105 : Poly :=
[
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 27. -/
theorem ep_Q2_008_partial_27_0105_valid :
    mulPoly ep_Q2_008_coefficient_27_0105
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0106 : Poly :=
[
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 106 for generator 27. -/
def ep_Q2_008_partial_27_0106 : Poly :=
[
  term ((147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 27. -/
theorem ep_Q2_008_partial_27_0106_valid :
    mulPoly ep_Q2_008_coefficient_27_0106
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0107 : Poly :=
[
  term ((-73941972821443125 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 27. -/
def ep_Q2_008_partial_27_0107 : Poly :=
[
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((73941972821443125 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 27. -/
theorem ep_Q2_008_partial_27_0107_valid :
    mulPoly ep_Q2_008_coefficient_27_0107
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0108 : Poly :=
[
  term ((762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 27. -/
def ep_Q2_008_partial_27_0108 : Poly :=
[
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 27. -/
theorem ep_Q2_008_partial_27_0108_valid :
    mulPoly ep_Q2_008_coefficient_27_0108
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0109 : Poly :=
[
  term ((505584442352256750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 109 for generator 27. -/
def ep_Q2_008_partial_27_0109 : Poly :=
[
  term ((-505584442352256750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((1011168884704513500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 27. -/
theorem ep_Q2_008_partial_27_0109_valid :
    mulPoly ep_Q2_008_coefficient_27_0109
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0110 : Poly :=
[
  term ((-62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 27. -/
def ep_Q2_008_partial_27_0110 : Poly :=
[
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 27. -/
theorem ep_Q2_008_partial_27_0110_valid :
    mulPoly ep_Q2_008_coefficient_27_0110
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0111 : Poly :=
[
  term ((1002236297383802250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 111 for generator 27. -/
def ep_Q2_008_partial_27_0111 : Poly :=
[
  term ((2004472594767604500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1002236297383802250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 27. -/
theorem ep_Q2_008_partial_27_0111_valid :
    mulPoly ep_Q2_008_coefficient_27_0111
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0112 : Poly :=
[
  term ((-1011168884704513500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 2), (16, 1)]
]

/-- Partial product 112 for generator 27. -/
def ep_Q2_008_partial_27_0112 : Poly :=
[
  term ((-2022337769409027000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((1011168884704513500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 27. -/
theorem ep_Q2_008_partial_27_0112_valid :
    mulPoly ep_Q2_008_coefficient_27_0112
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0113 : Poly :=
[
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 27. -/
def ep_Q2_008_partial_27_0113 : Poly :=
[
  term ((-62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 27. -/
theorem ep_Q2_008_partial_27_0113_valid :
    mulPoly ep_Q2_008_coefficient_27_0113
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0114 : Poly :=
[
  term ((31316762018463703392632321139862696544250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 27. -/
def ep_Q2_008_partial_27_0114 : Poly :=
[
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31316762018463703392632321139862696544250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 27. -/
theorem ep_Q2_008_partial_27_0114_valid :
    mulPoly ep_Q2_008_coefficient_27_0114
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0115 : Poly :=
[
  term ((-762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 115 for generator 27. -/
def ep_Q2_008_partial_27_0115 : Poly :=
[
  term ((762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 27. -/
theorem ep_Q2_008_partial_27_0115_valid :
    mulPoly ep_Q2_008_coefficient_27_0115
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0116 : Poly :=
[
  term ((-381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (16, 1)]
]

/-- Partial product 116 for generator 27. -/
def ep_Q2_008_partial_27_0116 : Poly :=
[
  term ((-762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 27. -/
theorem ep_Q2_008_partial_27_0116_valid :
    mulPoly ep_Q2_008_coefficient_27_0116
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0117 : Poly :=
[
  term ((381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 117 for generator 27. -/
def ep_Q2_008_partial_27_0117 : Poly :=
[
  term ((-381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 27. -/
theorem ep_Q2_008_partial_27_0117_valid :
    mulPoly ep_Q2_008_coefficient_27_0117
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0118 : Poly :=
[
  term ((381421478594370375 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 118 for generator 27. -/
def ep_Q2_008_partial_27_0118 : Poly :=
[
  term ((381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-381421478594370375 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 27. -/
theorem ep_Q2_008_partial_27_0118_valid :
    mulPoly ep_Q2_008_coefficient_27_0118
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0119 : Poly :=
[
  term ((-295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 119 for generator 27. -/
def ep_Q2_008_partial_27_0119 : Poly :=
[
  term ((-591535782571545000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 27. -/
theorem ep_Q2_008_partial_27_0119_valid :
    mulPoly ep_Q2_008_coefficient_27_0119
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0120 : Poly :=
[
  term ((147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 120 for generator 27. -/
def ep_Q2_008_partial_27_0120 : Poly :=
[
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 27. -/
theorem ep_Q2_008_partial_27_0120_valid :
    mulPoly ep_Q2_008_coefficient_27_0120
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0121 : Poly :=
[
  term ((73941972821443125 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (16, 1)]
]

/-- Partial product 121 for generator 27. -/
def ep_Q2_008_partial_27_0121 : Poly :=
[
  term ((147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-73941972821443125 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 27. -/
theorem ep_Q2_008_partial_27_0121_valid :
    mulPoly ep_Q2_008_coefficient_27_0121
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0122 : Poly :=
[
  term ((-1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 122 for generator 27. -/
def ep_Q2_008_partial_27_0122 : Poly :=
[
  term ((-3051371828754963000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 27. -/
theorem ep_Q2_008_partial_27_0122_valid :
    mulPoly ep_Q2_008_coefficient_27_0122
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0123 : Poly :=
[
  term ((125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 27. -/
def ep_Q2_008_partial_27_0123 : Poly :=
[
  term ((250534096147709627141058569118901572354000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 27. -/
theorem ep_Q2_008_partial_27_0123_valid :
    mulPoly ep_Q2_008_coefficient_27_0123
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0124 : Poly :=
[
  term ((762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 124 for generator 27. -/
def ep_Q2_008_partial_27_0124 : Poly :=
[
  term ((-762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 27. -/
theorem ep_Q2_008_partial_27_0124_valid :
    mulPoly ep_Q2_008_coefficient_27_0124
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0125 : Poly :=
[
  term ((381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 1), (16, 1)]
]

/-- Partial product 125 for generator 27. -/
def ep_Q2_008_partial_27_0125 : Poly :=
[
  term ((762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 27. -/
theorem ep_Q2_008_partial_27_0125_valid :
    mulPoly ep_Q2_008_coefficient_27_0125
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0126 : Poly :=
[
  term ((-62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 27. -/
def ep_Q2_008_partial_27_0126 : Poly :=
[
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 27. -/
theorem ep_Q2_008_partial_27_0126_valid :
    mulPoly ep_Q2_008_coefficient_27_0126
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0127 : Poly :=
[
  term ((-31316762018463703392632321139862696544250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 27. -/
def ep_Q2_008_partial_27_0127 : Poly :=
[
  term ((-62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((31316762018463703392632321139862696544250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 27. -/
theorem ep_Q2_008_partial_27_0127_valid :
    mulPoly ep_Q2_008_coefficient_27_0127
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0128 : Poly :=
[
  term ((-31266364452508878646654115743969129860000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 27. -/
def ep_Q2_008_partial_27_0128 : Poly :=
[
  term ((-62532728905017757293308231487938259720000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((31266364452508878646654115743969129860000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 27. -/
theorem ep_Q2_008_partial_27_0128_valid :
    mulPoly ep_Q2_008_coefficient_27_0128
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0129 : Poly :=
[
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 129 for generator 27. -/
def ep_Q2_008_partial_27_0129 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 27. -/
theorem ep_Q2_008_partial_27_0129_valid :
    mulPoly ep_Q2_008_coefficient_27_0129
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0130 : Poly :=
[
  term ((128629257418242000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 130 for generator 27. -/
def ep_Q2_008_partial_27_0130 : Poly :=
[
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128629257418242000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 27. -/
theorem ep_Q2_008_partial_27_0130_valid :
    mulPoly ep_Q2_008_coefficient_27_0130
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0131 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 27. -/
def ep_Q2_008_partial_27_0131 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 27. -/
theorem ep_Q2_008_partial_27_0131_valid :
    mulPoly ep_Q2_008_coefficient_27_0131
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0132 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 27. -/
def ep_Q2_008_partial_27_0132 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 27. -/
theorem ep_Q2_008_partial_27_0132_valid :
    mulPoly ep_Q2_008_coefficient_27_0132
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0133 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 133 for generator 27. -/
def ep_Q2_008_partial_27_0133 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 27. -/
theorem ep_Q2_008_partial_27_0133_valid :
    mulPoly ep_Q2_008_coefficient_27_0133
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0134 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 134 for generator 27. -/
def ep_Q2_008_partial_27_0134 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 27. -/
theorem ep_Q2_008_partial_27_0134_valid :
    mulPoly ep_Q2_008_coefficient_27_0134
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0135 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 27. -/
def ep_Q2_008_partial_27_0135 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 27. -/
theorem ep_Q2_008_partial_27_0135_valid :
    mulPoly ep_Q2_008_coefficient_27_0135
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0136 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 27. -/
def ep_Q2_008_partial_27_0136 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 27. -/
theorem ep_Q2_008_partial_27_0136_valid :
    mulPoly ep_Q2_008_coefficient_27_0136
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0137 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 137 for generator 27. -/
def ep_Q2_008_partial_27_0137 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 27. -/
theorem ep_Q2_008_partial_27_0137_valid :
    mulPoly ep_Q2_008_coefficient_27_0137
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0138 : Poly :=
[
  term ((27056674674628305657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 138 for generator 27. -/
def ep_Q2_008_partial_27_0138 : Poly :=
[
  term ((27056674674628305657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-27056674674628305657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 27. -/
theorem ep_Q2_008_partial_27_0138_valid :
    mulPoly ep_Q2_008_coefficient_27_0138
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0139 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 27. -/
def ep_Q2_008_partial_27_0139 : Poly :=
[
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 27. -/
theorem ep_Q2_008_partial_27_0139_valid :
    mulPoly ep_Q2_008_coefficient_27_0139
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0140 : Poly :=
[
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 27. -/
def ep_Q2_008_partial_27_0140 : Poly :=
[
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 27. -/
theorem ep_Q2_008_partial_27_0140_valid :
    mulPoly ep_Q2_008_coefficient_27_0140
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0141 : Poly :=
[
  term ((-17372613027107050983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 141 for generator 27. -/
def ep_Q2_008_partial_27_0141 : Poly :=
[
  term ((17372613027107050983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-17372613027107050983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 27. -/
theorem ep_Q2_008_partial_27_0141_valid :
    mulPoly ep_Q2_008_coefficient_27_0141
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0142 : Poly :=
[
  term ((-59193482650900086915 : Rat) / 11087303257826821744) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 142 for generator 27. -/
def ep_Q2_008_partial_27_0142 : Poly :=
[
  term ((-59193482650900086915 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((59193482650900086915 : Rat) / 11087303257826821744) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 27. -/
theorem ep_Q2_008_partial_27_0142_valid :
    mulPoly ep_Q2_008_coefficient_27_0142
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0143 : Poly :=
[
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 27. -/
def ep_Q2_008_partial_27_0143 : Poly :=
[
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 27. -/
theorem ep_Q2_008_partial_27_0143_valid :
    mulPoly ep_Q2_008_coefficient_27_0143
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0144 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 144 for generator 27. -/
def ep_Q2_008_partial_27_0144 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 27. -/
theorem ep_Q2_008_partial_27_0144_valid :
    mulPoly ep_Q2_008_coefficient_27_0144
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0145 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 27. -/
def ep_Q2_008_partial_27_0145 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 27. -/
theorem ep_Q2_008_partial_27_0145_valid :
    mulPoly ep_Q2_008_coefficient_27_0145
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0146 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 146 for generator 27. -/
def ep_Q2_008_partial_27_0146 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 27. -/
theorem ep_Q2_008_partial_27_0146_valid :
    mulPoly ep_Q2_008_coefficient_27_0146
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0147 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 27. -/
def ep_Q2_008_partial_27_0147 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 27. -/
theorem ep_Q2_008_partial_27_0147_valid :
    mulPoly ep_Q2_008_coefficient_27_0147
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0148 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 27. -/
def ep_Q2_008_partial_27_0148 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 27. -/
theorem ep_Q2_008_partial_27_0148_valid :
    mulPoly ep_Q2_008_coefficient_27_0148
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0149 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 149 for generator 27. -/
def ep_Q2_008_partial_27_0149 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 27. -/
theorem ep_Q2_008_partial_27_0149_valid :
    mulPoly ep_Q2_008_coefficient_27_0149
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0150 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 27. -/
def ep_Q2_008_partial_27_0150 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 27. -/
theorem ep_Q2_008_partial_27_0150_valid :
    mulPoly ep_Q2_008_coefficient_27_0150
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0151 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 151 for generator 27. -/
def ep_Q2_008_partial_27_0151 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 27. -/
theorem ep_Q2_008_partial_27_0151_valid :
    mulPoly ep_Q2_008_coefficient_27_0151
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0152 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 27. -/
def ep_Q2_008_partial_27_0152 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 27. -/
theorem ep_Q2_008_partial_27_0152_valid :
    mulPoly ep_Q2_008_coefficient_27_0152
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0153 : Poly :=
[
  term ((-3734882957533134375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 153 for generator 27. -/
def ep_Q2_008_partial_27_0153 : Poly :=
[
  term ((-3734882957533134375 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((3734882957533134375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 27. -/
theorem ep_Q2_008_partial_27_0153_valid :
    mulPoly ep_Q2_008_coefficient_27_0153
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0154 : Poly :=
[
  term ((20618368349837074696000459880354819298600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 27. -/
def ep_Q2_008_partial_27_0154 : Poly :=
[
  term ((41236736699674149392000919760709638597200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20618368349837074696000459880354819298600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 27. -/
theorem ep_Q2_008_partial_27_0154_valid :
    mulPoly ep_Q2_008_coefficient_27_0154
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0155 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 155 for generator 27. -/
def ep_Q2_008_partial_27_0155 : Poly :=
[
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 27. -/
theorem ep_Q2_008_partial_27_0155_valid :
    mulPoly ep_Q2_008_coefficient_27_0155
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0156 : Poly :=
[
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 156 for generator 27. -/
def ep_Q2_008_partial_27_0156 : Poly :=
[
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 27. -/
theorem ep_Q2_008_partial_27_0156_valid :
    mulPoly ep_Q2_008_coefficient_27_0156
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0157 : Poly :=
[
  term ((16445226938813630460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 157 for generator 27. -/
def ep_Q2_008_partial_27_0157 : Poly :=
[
  term ((32890453877627260920 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16445226938813630460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 27. -/
theorem ep_Q2_008_partial_27_0157_valid :
    mulPoly ep_Q2_008_coefficient_27_0157
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0158 : Poly :=
[
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 27. -/
def ep_Q2_008_partial_27_0158 : Poly :=
[
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 27. -/
theorem ep_Q2_008_partial_27_0158_valid :
    mulPoly ep_Q2_008_coefficient_27_0158
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0159 : Poly :=
[
  term ((846484381451958505912285274074687488000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 27. -/
def ep_Q2_008_partial_27_0159 : Poly :=
[
  term ((-846484381451958505912285274074687488000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1692968762903917011824570548149374976000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 27. -/
theorem ep_Q2_008_partial_27_0159_valid :
    mulPoly ep_Q2_008_coefficient_27_0159
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0160 : Poly :=
[
  term ((-3828390404426540894962617053961771506475 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 27. -/
def ep_Q2_008_partial_27_0160 : Poly :=
[
  term ((-7656780808853081789925234107923543012950 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3828390404426540894962617053961771506475 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 27. -/
theorem ep_Q2_008_partial_27_0160_valid :
    mulPoly ep_Q2_008_coefficient_27_0160
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0161 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 27. -/
def ep_Q2_008_partial_27_0161 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 27. -/
theorem ep_Q2_008_partial_27_0161_valid :
    mulPoly ep_Q2_008_coefficient_27_0161
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0162 : Poly :=
[
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 27. -/
def ep_Q2_008_partial_27_0162 : Poly :=
[
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 27. -/
theorem ep_Q2_008_partial_27_0162_valid :
    mulPoly ep_Q2_008_coefficient_27_0162
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0163 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 163 for generator 27. -/
def ep_Q2_008_partial_27_0163 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 27. -/
theorem ep_Q2_008_partial_27_0163_valid :
    mulPoly ep_Q2_008_coefficient_27_0163
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0164 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 27. -/
def ep_Q2_008_partial_27_0164 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 27. -/
theorem ep_Q2_008_partial_27_0164_valid :
    mulPoly ep_Q2_008_coefficient_27_0164
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0165 : Poly :=
[
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 165 for generator 27. -/
def ep_Q2_008_partial_27_0165 : Poly :=
[
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 27. -/
theorem ep_Q2_008_partial_27_0165_valid :
    mulPoly ep_Q2_008_coefficient_27_0165
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0166 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 166 for generator 27. -/
def ep_Q2_008_partial_27_0166 : Poly :=
[
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 27. -/
theorem ep_Q2_008_partial_27_0166_valid :
    mulPoly ep_Q2_008_coefficient_27_0166
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0167 : Poly :=
[
  term ((-128629257418242000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 167 for generator 27. -/
def ep_Q2_008_partial_27_0167 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((128629257418242000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 27. -/
theorem ep_Q2_008_partial_27_0167_valid :
    mulPoly ep_Q2_008_coefficient_27_0167
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0168 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 27. -/
def ep_Q2_008_partial_27_0168 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 27. -/
theorem ep_Q2_008_partial_27_0168_valid :
    mulPoly ep_Q2_008_coefficient_27_0168
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0169 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 27. -/
def ep_Q2_008_partial_27_0169 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 27. -/
theorem ep_Q2_008_partial_27_0169_valid :
    mulPoly ep_Q2_008_coefficient_27_0169
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0170 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 170 for generator 27. -/
def ep_Q2_008_partial_27_0170 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 27. -/
theorem ep_Q2_008_partial_27_0170_valid :
    mulPoly ep_Q2_008_coefficient_27_0170
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0171 : Poly :=
[
  term ((58965653991688988679201265892454326400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 27. -/
def ep_Q2_008_partial_27_0171 : Poly :=
[
  term ((117931307983377977358402531784908652800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58965653991688988679201265892454326400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 27. -/
theorem ep_Q2_008_partial_27_0171_valid :
    mulPoly ep_Q2_008_coefficient_27_0171
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0172 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 27. -/
def ep_Q2_008_partial_27_0172 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 27. -/
theorem ep_Q2_008_partial_27_0172_valid :
    mulPoly ep_Q2_008_coefficient_27_0172
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0173 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 173 for generator 27. -/
def ep_Q2_008_partial_27_0173 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 27. -/
theorem ep_Q2_008_partial_27_0173_valid :
    mulPoly ep_Q2_008_coefficient_27_0173
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0174 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 27. -/
def ep_Q2_008_partial_27_0174 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 27. -/
theorem ep_Q2_008_partial_27_0174_valid :
    mulPoly ep_Q2_008_coefficient_27_0174
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0175 : Poly :=
[
  term ((1630479787342143750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 175 for generator 27. -/
def ep_Q2_008_partial_27_0175 : Poly :=
[
  term ((3260959574684287500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1630479787342143750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 27. -/
theorem ep_Q2_008_partial_27_0175_valid :
    mulPoly ep_Q2_008_coefficient_27_0175
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0176 : Poly :=
[
  term ((329016966312864375 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 176 for generator 27. -/
def ep_Q2_008_partial_27_0176 : Poly :=
[
  term ((658033932625728750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-329016966312864375 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 27. -/
theorem ep_Q2_008_partial_27_0176_valid :
    mulPoly ep_Q2_008_coefficient_27_0176
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0177 : Poly :=
[
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 27. -/
def ep_Q2_008_partial_27_0177 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 27. -/
theorem ep_Q2_008_partial_27_0177_valid :
    mulPoly ep_Q2_008_coefficient_27_0177
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0178 : Poly :=
[
  term ((167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 27. -/
def ep_Q2_008_partial_27_0178 : Poly :=
[
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 27. -/
theorem ep_Q2_008_partial_27_0178_valid :
    mulPoly ep_Q2_008_coefficient_27_0178
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0179 : Poly :=
[
  term ((11484251465294194983 : Rat) / 5543651628913410872) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 179 for generator 27. -/
def ep_Q2_008_partial_27_0179 : Poly :=
[
  term ((-11484251465294194983 : Rat) / 5543651628913410872) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((11484251465294194983 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 27. -/
theorem ep_Q2_008_partial_27_0179_valid :
    mulPoly ep_Q2_008_coefficient_27_0179
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0180 : Poly :=
[
  term ((11103127739610514983 : Rat) / 11087303257826821744) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 180 for generator 27. -/
def ep_Q2_008_partial_27_0180 : Poly :=
[
  term ((11103127739610514983 : Rat) / 5543651628913410872) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11103127739610514983 : Rat) / 11087303257826821744) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 27. -/
theorem ep_Q2_008_partial_27_0180_valid :
    mulPoly ep_Q2_008_coefficient_27_0180
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0181 : Poly :=
[
  term ((-505584442352256750 : Rat) / 692956453614176359) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 181 for generator 27. -/
def ep_Q2_008_partial_27_0181 : Poly :=
[
  term ((505584442352256750 : Rat) / 692956453614176359) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1011168884704513500 : Rat) / 692956453614176359) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 27. -/
theorem ep_Q2_008_partial_27_0181_valid :
    mulPoly ep_Q2_008_coefficient_27_0181
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0182 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 182 for generator 27. -/
def ep_Q2_008_partial_27_0182 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 27. -/
theorem ep_Q2_008_partial_27_0182_valid :
    mulPoly ep_Q2_008_coefficient_27_0182
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0183 : Poly :=
[
  term ((-37103955316806757545 : Rat) / 1385912907228352718) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 183 for generator 27. -/
def ep_Q2_008_partial_27_0183 : Poly :=
[
  term ((-37103955316806757545 : Rat) / 692956453614176359) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((37103955316806757545 : Rat) / 1385912907228352718) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 27. -/
theorem ep_Q2_008_partial_27_0183_valid :
    mulPoly ep_Q2_008_coefficient_27_0183
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0184 : Poly :=
[
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 27. -/
def ep_Q2_008_partial_27_0184 : Poly :=
[
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 27. -/
theorem ep_Q2_008_partial_27_0184_valid :
    mulPoly ep_Q2_008_coefficient_27_0184
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0185 : Poly :=
[
  term ((34794396896947268781548516503318624226925 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 27. -/
def ep_Q2_008_partial_27_0185 : Poly :=
[
  term ((69588793793894537563097033006637248453850 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34794396896947268781548516503318624226925 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 27. -/
theorem ep_Q2_008_partial_27_0185_valid :
    mulPoly ep_Q2_008_coefficient_27_0185
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0186 : Poly :=
[
  term ((1144264435783111125 : Rat) / 692956453614176359) [(1, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 186 for generator 27. -/
def ep_Q2_008_partial_27_0186 : Poly :=
[
  term ((2288528871566222250 : Rat) / 692956453614176359) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1144264435783111125 : Rat) / 692956453614176359) [(1, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 27. -/
theorem ep_Q2_008_partial_27_0186_valid :
    mulPoly ep_Q2_008_coefficient_27_0186
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0187 : Poly :=
[
  term ((-48792088383041854785135927661579550307600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 27. -/
def ep_Q2_008_partial_27_0187 : Poly :=
[
  term ((-97584176766083709570271855323159100615200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((48792088383041854785135927661579550307600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 27. -/
theorem ep_Q2_008_partial_27_0187_valid :
    mulPoly ep_Q2_008_coefficient_27_0187
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0188 : Poly :=
[
  term ((354623716632236625 : Rat) / 692956453614176359) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 188 for generator 27. -/
def ep_Q2_008_partial_27_0188 : Poly :=
[
  term ((-354623716632236625 : Rat) / 692956453614176359) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((709247433264473250 : Rat) / 692956453614176359) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 27. -/
theorem ep_Q2_008_partial_27_0188_valid :
    mulPoly ep_Q2_008_coefficient_27_0188
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0189 : Poly :=
[
  term ((14251567017250540233 : Rat) / 2771825814456705436) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 189 for generator 27. -/
def ep_Q2_008_partial_27_0189 : Poly :=
[
  term ((14251567017250540233 : Rat) / 1385912907228352718) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14251567017250540233 : Rat) / 2771825814456705436) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 27. -/
theorem ep_Q2_008_partial_27_0189_valid :
    mulPoly ep_Q2_008_coefficient_27_0189
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0190 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 27. -/
def ep_Q2_008_partial_27_0190 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 27. -/
theorem ep_Q2_008_partial_27_0190_valid :
    mulPoly ep_Q2_008_coefficient_27_0190
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0191 : Poly :=
[
  term ((-634863286088968879434213955556015616000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 27. -/
def ep_Q2_008_partial_27_0191 : Poly :=
[
  term ((634863286088968879434213955556015616000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1269726572177937758868427911112031232000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 27. -/
theorem ep_Q2_008_partial_27_0191_valid :
    mulPoly ep_Q2_008_coefficient_27_0191
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0192 : Poly :=
[
  term ((-17169488805261038745894749328516761868300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 27. -/
def ep_Q2_008_partial_27_0192 : Poly :=
[
  term ((-34338977610522077491789498657033523736600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((17169488805261038745894749328516761868300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 27. -/
theorem ep_Q2_008_partial_27_0192_valid :
    mulPoly ep_Q2_008_coefficient_27_0192
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0193 : Poly :=
[
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 27. -/
def ep_Q2_008_partial_27_0193 : Poly :=
[
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 27. -/
theorem ep_Q2_008_partial_27_0193_valid :
    mulPoly ep_Q2_008_coefficient_27_0193
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0194 : Poly :=
[
  term ((-6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 27. -/
def ep_Q2_008_partial_27_0194 : Poly :=
[
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 27. -/
theorem ep_Q2_008_partial_27_0194_valid :
    mulPoly ep_Q2_008_coefficient_27_0194
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0195 : Poly :=
[
  term ((242189375816351879415 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 195 for generator 27. -/
def ep_Q2_008_partial_27_0195 : Poly :=
[
  term ((484378751632703758830 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 27. -/
theorem ep_Q2_008_partial_27_0195_valid :
    mulPoly ep_Q2_008_coefficient_27_0195
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0196 : Poly :=
[
  term ((-40983859916519688411 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 196 for generator 27. -/
def ep_Q2_008_partial_27_0196 : Poly :=
[
  term ((-40983859916519688411 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((40983859916519688411 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 27. -/
theorem ep_Q2_008_partial_27_0196_valid :
    mulPoly ep_Q2_008_coefficient_27_0196
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0197 : Poly :=
[
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 27. -/
def ep_Q2_008_partial_27_0197 : Poly :=
[
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 27. -/
theorem ep_Q2_008_partial_27_0197_valid :
    mulPoly ep_Q2_008_coefficient_27_0197
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0198 : Poly :=
[
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 198 for generator 27. -/
def ep_Q2_008_partial_27_0198 : Poly :=
[
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 27. -/
theorem ep_Q2_008_partial_27_0198_valid :
    mulPoly ep_Q2_008_coefficient_27_0198
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0199 : Poly :=
[
  term ((80393285886401250 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 199 for generator 27. -/
def ep_Q2_008_partial_27_0199 : Poly :=
[
  term ((160786571772802500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 27. -/
theorem ep_Q2_008_partial_27_0199_valid :
    mulPoly ep_Q2_008_coefficient_27_0199
        ep_Q2_008_generator_27_0100_0199 =
      ep_Q2_008_partial_27_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0100_0199 : List Poly :=
[
  ep_Q2_008_partial_27_0100,
  ep_Q2_008_partial_27_0101,
  ep_Q2_008_partial_27_0102,
  ep_Q2_008_partial_27_0103,
  ep_Q2_008_partial_27_0104,
  ep_Q2_008_partial_27_0105,
  ep_Q2_008_partial_27_0106,
  ep_Q2_008_partial_27_0107,
  ep_Q2_008_partial_27_0108,
  ep_Q2_008_partial_27_0109,
  ep_Q2_008_partial_27_0110,
  ep_Q2_008_partial_27_0111,
  ep_Q2_008_partial_27_0112,
  ep_Q2_008_partial_27_0113,
  ep_Q2_008_partial_27_0114,
  ep_Q2_008_partial_27_0115,
  ep_Q2_008_partial_27_0116,
  ep_Q2_008_partial_27_0117,
  ep_Q2_008_partial_27_0118,
  ep_Q2_008_partial_27_0119,
  ep_Q2_008_partial_27_0120,
  ep_Q2_008_partial_27_0121,
  ep_Q2_008_partial_27_0122,
  ep_Q2_008_partial_27_0123,
  ep_Q2_008_partial_27_0124,
  ep_Q2_008_partial_27_0125,
  ep_Q2_008_partial_27_0126,
  ep_Q2_008_partial_27_0127,
  ep_Q2_008_partial_27_0128,
  ep_Q2_008_partial_27_0129,
  ep_Q2_008_partial_27_0130,
  ep_Q2_008_partial_27_0131,
  ep_Q2_008_partial_27_0132,
  ep_Q2_008_partial_27_0133,
  ep_Q2_008_partial_27_0134,
  ep_Q2_008_partial_27_0135,
  ep_Q2_008_partial_27_0136,
  ep_Q2_008_partial_27_0137,
  ep_Q2_008_partial_27_0138,
  ep_Q2_008_partial_27_0139,
  ep_Q2_008_partial_27_0140,
  ep_Q2_008_partial_27_0141,
  ep_Q2_008_partial_27_0142,
  ep_Q2_008_partial_27_0143,
  ep_Q2_008_partial_27_0144,
  ep_Q2_008_partial_27_0145,
  ep_Q2_008_partial_27_0146,
  ep_Q2_008_partial_27_0147,
  ep_Q2_008_partial_27_0148,
  ep_Q2_008_partial_27_0149,
  ep_Q2_008_partial_27_0150,
  ep_Q2_008_partial_27_0151,
  ep_Q2_008_partial_27_0152,
  ep_Q2_008_partial_27_0153,
  ep_Q2_008_partial_27_0154,
  ep_Q2_008_partial_27_0155,
  ep_Q2_008_partial_27_0156,
  ep_Q2_008_partial_27_0157,
  ep_Q2_008_partial_27_0158,
  ep_Q2_008_partial_27_0159,
  ep_Q2_008_partial_27_0160,
  ep_Q2_008_partial_27_0161,
  ep_Q2_008_partial_27_0162,
  ep_Q2_008_partial_27_0163,
  ep_Q2_008_partial_27_0164,
  ep_Q2_008_partial_27_0165,
  ep_Q2_008_partial_27_0166,
  ep_Q2_008_partial_27_0167,
  ep_Q2_008_partial_27_0168,
  ep_Q2_008_partial_27_0169,
  ep_Q2_008_partial_27_0170,
  ep_Q2_008_partial_27_0171,
  ep_Q2_008_partial_27_0172,
  ep_Q2_008_partial_27_0173,
  ep_Q2_008_partial_27_0174,
  ep_Q2_008_partial_27_0175,
  ep_Q2_008_partial_27_0176,
  ep_Q2_008_partial_27_0177,
  ep_Q2_008_partial_27_0178,
  ep_Q2_008_partial_27_0179,
  ep_Q2_008_partial_27_0180,
  ep_Q2_008_partial_27_0181,
  ep_Q2_008_partial_27_0182,
  ep_Q2_008_partial_27_0183,
  ep_Q2_008_partial_27_0184,
  ep_Q2_008_partial_27_0185,
  ep_Q2_008_partial_27_0186,
  ep_Q2_008_partial_27_0187,
  ep_Q2_008_partial_27_0188,
  ep_Q2_008_partial_27_0189,
  ep_Q2_008_partial_27_0190,
  ep_Q2_008_partial_27_0191,
  ep_Q2_008_partial_27_0192,
  ep_Q2_008_partial_27_0193,
  ep_Q2_008_partial_27_0194,
  ep_Q2_008_partial_27_0195,
  ep_Q2_008_partial_27_0196,
  ep_Q2_008_partial_27_0197,
  ep_Q2_008_partial_27_0198,
  ep_Q2_008_partial_27_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0100_0199 : Poly :=
[
  term ((-1623051116173234125 : Rat) / 692956453614176359) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((1623051116173234125 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-61121102159945095286636524784170958572500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((30560551079972547643318262392085479286250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (14, 2), (16, 1)],
  term ((128629257418242000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-147883945642886250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((73941972821443125 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1498888152415347750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((1011168884704513500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((62633524036927406785264642279725393088500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1002236297383802250 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-2022337769409027000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((1011168884704513500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-31316762018463703392632321139862696544250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (14, 2), (16, 1)],
  term ((381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((762842957188740750 : Rat) / 692956453614176359) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-381421478594370375 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (16, 1)],
  term ((-591535782571545000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((295767891285772500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (14, 2), (16, 1)],
  term ((-73941972821443125 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-3051371828754963000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((250534096147709627141058569118901572354000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((1525685914377481500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 1), (14, 2), (16, 1)],
  term ((-381421478594370375 : Rat) / 692956453614176359) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-125267048073854813570529284559450786177000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)],
  term ((31316762018463703392632321139862696544250 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-62532728905017757293308231487938259720000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((31266364452508878646654115743969129860000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-128629257418242000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((27056674674628305657 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-27056674674628305657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-17372613027107050983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((59193482650900086915 : Rat) / 11087303257826821744) [(1, 1), (5, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3734882957533134375 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((3734882957533134375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((41236736699674149392000919760709638597200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20618368349837074696000459880354819298600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32375936847954292920 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16445226938813630460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8503265190305040295837519381998230500950 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1692968762903917011824570548149374976000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((3828390404426540894962617053961771506475 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((128629257418242000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((117931307983377977358402531784908652800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58965653991688988679201265892454326400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3260959574684287500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1630479787342143750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((658033932625728750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-329016966312864375 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((11484251465294194983 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-11103127739610514983 : Rat) / 11087303257826821744) [(1, 1), (11, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36598370874454500795 : Rat) / 692956453614176359) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1011168884704513500 : Rat) / 692956453614176359) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((37103955316806757545 : Rat) / 1385912907228352718) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((69588793793894537563097033006637248453850 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34794396896947268781548516503318624226925 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((2288528871566222250 : Rat) / 692956453614176359) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1144264435783111125 : Rat) / 692956453614176359) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-97584176766083709570271855323159100615200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((48792088383041854785135927661579550307600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((13542319583986066983 : Rat) / 1385912907228352718) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((709247433264473250 : Rat) / 692956453614176359) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-14251567017250540233 : Rat) / 2771825814456705436) [(1, 1), (13, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33704114324433108612355284701477508120600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1269726572177937758868427911112031232000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((17169488805261038745894749328516761868300 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)],
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((484378751632703758830 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((-40983859916519688411 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((40983859916519688411 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 100 through 199. -/
theorem ep_Q2_008_block_27_0100_0199_valid :
    checkProductSumEq ep_Q2_008_partials_27_0100_0199
      ep_Q2_008_block_27_0100_0199 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
