/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1100-1199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1100 : Poly :=
[
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1100 for generator 27. -/
def ep_Q2_008_partial_27_1100 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 27. -/
theorem ep_Q2_008_partial_27_1100_valid :
    mulPoly ep_Q2_008_coefficient_27_1100
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1101 : Poly :=
[
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 1101 for generator 27. -/
def ep_Q2_008_partial_27_1101 : Poly :=
[
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 27. -/
theorem ep_Q2_008_partial_27_1101_valid :
    mulPoly ep_Q2_008_coefficient_27_1101
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1102 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1102 for generator 27. -/
def ep_Q2_008_partial_27_1102 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 27. -/
theorem ep_Q2_008_partial_27_1102_valid :
    mulPoly ep_Q2_008_coefficient_27_1102
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1103 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1103 for generator 27. -/
def ep_Q2_008_partial_27_1103 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 27. -/
theorem ep_Q2_008_partial_27_1103_valid :
    mulPoly ep_Q2_008_coefficient_27_1103
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1104 : Poly :=
[
  term ((2502509086878773271725819175203376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1104 for generator 27. -/
def ep_Q2_008_partial_27_1104 : Poly :=
[
  term ((5005018173757546543451638350406752000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2502509086878773271725819175203376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 27. -/
theorem ep_Q2_008_partial_27_1104_valid :
    mulPoly ep_Q2_008_coefficient_27_1104
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1105 : Poly :=
[
  term ((5474084778965724345 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1105 for generator 27. -/
def ep_Q2_008_partial_27_1105 : Poly :=
[
  term ((10948169557931448690 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 27. -/
theorem ep_Q2_008_partial_27_1105_valid :
    mulPoly ep_Q2_008_coefficient_27_1105
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1106 : Poly :=
[
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1106 for generator 27. -/
def ep_Q2_008_partial_27_1106 : Poly :=
[
  term ((221204126551875835518380789595653760000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 27. -/
theorem ep_Q2_008_partial_27_1106_valid :
    mulPoly ep_Q2_008_coefficient_27_1106
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1107 : Poly :=
[
  term ((-29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1107 for generator 27. -/
def ep_Q2_008_partial_27_1107 : Poly :=
[
  term ((-59209634925788306317432532554406400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 27. -/
theorem ep_Q2_008_partial_27_1107_valid :
    mulPoly ep_Q2_008_coefficient_27_1107
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1108 : Poly :=
[
  term ((4858939462685558847 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 1108 for generator 27. -/
def ep_Q2_008_partial_27_1108 : Poly :=
[
  term ((4858939462685558847 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 27. -/
theorem ep_Q2_008_partial_27_1108_valid :
    mulPoly ep_Q2_008_coefficient_27_1108
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1109 : Poly :=
[
  term ((-1251254543439386635862909587601688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1109 for generator 27. -/
def ep_Q2_008_partial_27_1109 : Poly :=
[
  term ((1251254543439386635862909587601688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2502509086878773271725819175203376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 27. -/
theorem ep_Q2_008_partial_27_1109_valid :
    mulPoly ep_Q2_008_coefficient_27_1109
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1110 : Poly :=
[
  term ((-625627271719693317931454793800844000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1110 for generator 27. -/
def ep_Q2_008_partial_27_1110 : Poly :=
[
  term ((-1251254543439386635862909587601688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((625627271719693317931454793800844000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 27. -/
theorem ep_Q2_008_partial_27_1110_valid :
    mulPoly ep_Q2_008_coefficient_27_1110
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1111 : Poly :=
[
  term ((-5474084778965724345 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1111 for generator 27. -/
def ep_Q2_008_partial_27_1111 : Poly :=
[
  term ((5474084778965724345 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 27. -/
theorem ep_Q2_008_partial_27_1111_valid :
    mulPoly ep_Q2_008_coefficient_27_1111
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1112 : Poly :=
[
  term ((-5474084778965724345 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 1112 for generator 27. -/
def ep_Q2_008_partial_27_1112 : Poly :=
[
  term ((-5474084778965724345 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((5474084778965724345 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 27. -/
theorem ep_Q2_008_partial_27_1112_valid :
    mulPoly ep_Q2_008_coefficient_27_1112
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1113 : Poly :=
[
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1113 for generator 27. -/
def ep_Q2_008_partial_27_1113 : Poly :=
[
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 27. -/
theorem ep_Q2_008_partial_27_1113_valid :
    mulPoly ep_Q2_008_coefficient_27_1113
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1114 : Poly :=
[
  term ((-27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1114 for generator 27. -/
def ep_Q2_008_partial_27_1114 : Poly :=
[
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 27. -/
theorem ep_Q2_008_partial_27_1114_valid :
    mulPoly ep_Q2_008_coefficient_27_1114
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1115 : Poly :=
[
  term ((14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1115 for generator 27. -/
def ep_Q2_008_partial_27_1115 : Poly :=
[
  term ((-14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 27. -/
theorem ep_Q2_008_partial_27_1115_valid :
    mulPoly ep_Q2_008_coefficient_27_1115
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1116 : Poly :=
[
  term ((-4858939462685558847 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1116 for generator 27. -/
def ep_Q2_008_partial_27_1116 : Poly :=
[
  term ((4858939462685558847 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 27. -/
theorem ep_Q2_008_partial_27_1116_valid :
    mulPoly ep_Q2_008_coefficient_27_1116
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1117 : Poly :=
[
  term ((7401204365723538289679066569300800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1117 for generator 27. -/
def ep_Q2_008_partial_27_1117 : Poly :=
[
  term ((14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7401204365723538289679066569300800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 27. -/
theorem ep_Q2_008_partial_27_1117_valid :
    mulPoly ep_Q2_008_coefficient_27_1117
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1118 : Poly :=
[
  term ((-4858939462685558847 : Rat) / 11087303257826821744) [(3, 2), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 1118 for generator 27. -/
def ep_Q2_008_partial_27_1118 : Poly :=
[
  term ((-4858939462685558847 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((4858939462685558847 : Rat) / 11087303257826821744) [(3, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 27. -/
theorem ep_Q2_008_partial_27_1118_valid :
    mulPoly ep_Q2_008_coefficient_27_1118
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1119 : Poly :=
[
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1119 for generator 27. -/
def ep_Q2_008_partial_27_1119 : Poly :=
[
  term ((6092211004233225187531734795707136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 27. -/
theorem ep_Q2_008_partial_27_1119_valid :
    mulPoly ep_Q2_008_coefficient_27_1119
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1120 : Poly :=
[
  term ((28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1120 for generator 27. -/
def ep_Q2_008_partial_27_1120 : Poly :=
[
  term ((56382435440928018839792507125478400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 27. -/
theorem ep_Q2_008_partial_27_1120_valid :
    mulPoly ep_Q2_008_coefficient_27_1120
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1121 : Poly :=
[
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1121 for generator 27. -/
def ep_Q2_008_partial_27_1121 : Poly :=
[
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 27. -/
theorem ep_Q2_008_partial_27_1121_valid :
    mulPoly ep_Q2_008_coefficient_27_1121
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1122 : Poly :=
[
  term ((-761526375529153148441466849463392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1122 for generator 27. -/
def ep_Q2_008_partial_27_1122 : Poly :=
[
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((761526375529153148441466849463392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 27. -/
theorem ep_Q2_008_partial_27_1122_valid :
    mulPoly ep_Q2_008_coefficient_27_1122
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1123 : Poly :=
[
  term ((-14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1123 for generator 27. -/
def ep_Q2_008_partial_27_1123 : Poly :=
[
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 27. -/
theorem ep_Q2_008_partial_27_1123_valid :
    mulPoly ep_Q2_008_coefficient_27_1123
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1124 : Poly :=
[
  term ((-7047804430116002354974063390684800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 1124 for generator 27. -/
def ep_Q2_008_partial_27_1124 : Poly :=
[
  term ((-14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((7047804430116002354974063390684800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 27. -/
theorem ep_Q2_008_partial_27_1124_valid :
    mulPoly ep_Q2_008_coefficient_27_1124
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1125 : Poly :=
[
  term ((25468592968811916000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1125 for generator 27. -/
def ep_Q2_008_partial_27_1125 : Poly :=
[
  term ((50937185937623832000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 27. -/
theorem ep_Q2_008_partial_27_1125_valid :
    mulPoly ep_Q2_008_coefficient_27_1125
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1126 : Poly :=
[
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1126 for generator 27. -/
def ep_Q2_008_partial_27_1126 : Poly :=
[
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 27. -/
theorem ep_Q2_008_partial_27_1126_valid :
    mulPoly ep_Q2_008_coefficient_27_1126
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1127 : Poly :=
[
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1127 for generator 27. -/
def ep_Q2_008_partial_27_1127 : Poly :=
[
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6367148242202979000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 27. -/
theorem ep_Q2_008_partial_27_1127_valid :
    mulPoly ep_Q2_008_coefficient_27_1127
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1128 : Poly :=
[
  term ((12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1128 for generator 27. -/
def ep_Q2_008_partial_27_1128 : Poly :=
[
  term ((24586673565095147362764268006076140300800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 27. -/
theorem ep_Q2_008_partial_27_1128_valid :
    mulPoly ep_Q2_008_coefficient_27_1128
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1129 : Poly :=
[
  term ((71468305706088360000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1129 for generator 27. -/
def ep_Q2_008_partial_27_1129 : Poly :=
[
  term ((142936611412176720000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 27. -/
theorem ep_Q2_008_partial_27_1129_valid :
    mulPoly ep_Q2_008_coefficient_27_1129
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1130 : Poly :=
[
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1130 for generator 27. -/
def ep_Q2_008_partial_27_1130 : Poly :=
[
  term ((11832980445486574069079825621325421056000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 27. -/
theorem ep_Q2_008_partial_27_1130_valid :
    mulPoly ep_Q2_008_coefficient_27_1130
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1131 : Poly :=
[
  term ((1401694617601348875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1131 for generator 27. -/
def ep_Q2_008_partial_27_1131 : Poly :=
[
  term ((1401694617601348875 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 27. -/
theorem ep_Q2_008_partial_27_1131_valid :
    mulPoly ep_Q2_008_coefficient_27_1131
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1132 : Poly :=
[
  term ((-6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1132 for generator 27. -/
def ep_Q2_008_partial_27_1132 : Poly :=
[
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 27. -/
theorem ep_Q2_008_partial_27_1132_valid :
    mulPoly ep_Q2_008_coefficient_27_1132
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1133 : Poly :=
[
  term ((-3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1133 for generator 27. -/
def ep_Q2_008_partial_27_1133 : Poly :=
[
  term ((-6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 27. -/
theorem ep_Q2_008_partial_27_1133_valid :
    mulPoly ep_Q2_008_coefficient_27_1133
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1134 : Poly :=
[
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1134 for generator 27. -/
def ep_Q2_008_partial_27_1134 : Poly :=
[
  term ((35734152853044180000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 27. -/
theorem ep_Q2_008_partial_27_1134_valid :
    mulPoly ep_Q2_008_coefficient_27_1134
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1135 : Poly :=
[
  term ((-17867076426522090000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1135 for generator 27. -/
def ep_Q2_008_partial_27_1135 : Poly :=
[
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((17867076426522090000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 27. -/
theorem ep_Q2_008_partial_27_1135_valid :
    mulPoly ep_Q2_008_coefficient_27_1135
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1136 : Poly :=
[
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1136 for generator 27. -/
def ep_Q2_008_partial_27_1136 : Poly :=
[
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 27. -/
theorem ep_Q2_008_partial_27_1136_valid :
    mulPoly ep_Q2_008_coefficient_27_1136
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1137 : Poly :=
[
  term ((-1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1137 for generator 27. -/
def ep_Q2_008_partial_27_1137 : Poly :=
[
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 27. -/
theorem ep_Q2_008_partial_27_1137_valid :
    mulPoly ep_Q2_008_coefficient_27_1137
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1138 : Poly :=
[
  term ((-1401694617601348875 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1138 for generator 27. -/
def ep_Q2_008_partial_27_1138 : Poly :=
[
  term ((1401694617601348875 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 27. -/
theorem ep_Q2_008_partial_27_1138_valid :
    mulPoly ep_Q2_008_coefficient_27_1138
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1139 : Poly :=
[
  term ((-1401694617601348875 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1139 for generator 27. -/
def ep_Q2_008_partial_27_1139 : Poly :=
[
  term ((-1401694617601348875 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 27. -/
theorem ep_Q2_008_partial_27_1139_valid :
    mulPoly ep_Q2_008_coefficient_27_1139
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1140 : Poly :=
[
  term ((-3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1140 for generator 27. -/
def ep_Q2_008_partial_27_1140 : Poly :=
[
  term ((-6959501114231161659535083489885387033600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 27. -/
theorem ep_Q2_008_partial_27_1140_valid :
    mulPoly ep_Q2_008_coefficient_27_1140
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1141 : Poly :=
[
  term ((105559530093286220235 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1141 for generator 27. -/
def ep_Q2_008_partial_27_1141 : Poly :=
[
  term ((105559530093286220235 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-105559530093286220235 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 27. -/
theorem ep_Q2_008_partial_27_1141_valid :
    mulPoly ep_Q2_008_coefficient_27_1141
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1142 : Poly :=
[
  term ((102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1142 for generator 27. -/
def ep_Q2_008_partial_27_1142 : Poly :=
[
  term ((205684388472497618145672645264016490649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 27. -/
theorem ep_Q2_008_partial_27_1142_valid :
    mulPoly ep_Q2_008_coefficient_27_1142
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1143 : Poly :=
[
  term ((-4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1143 for generator 27. -/
def ep_Q2_008_partial_27_1143 : Poly :=
[
  term ((-4173645954211731293768558624477927457247073 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 27. -/
theorem ep_Q2_008_partial_27_1143_valid :
    mulPoly ep_Q2_008_coefficient_27_1143
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1144 : Poly :=
[
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1144 for generator 27. -/
def ep_Q2_008_partial_27_1144 : Poly :=
[
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 27. -/
theorem ep_Q2_008_partial_27_1144_valid :
    mulPoly ep_Q2_008_coefficient_27_1144
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1145 : Poly :=
[
  term ((-105559530093286220235 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1145 for generator 27. -/
def ep_Q2_008_partial_27_1145 : Poly :=
[
  term ((105559530093286220235 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-105559530093286220235 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 27. -/
theorem ep_Q2_008_partial_27_1145_valid :
    mulPoly ep_Q2_008_coefficient_27_1145
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1146 : Poly :=
[
  term ((869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1146 for generator 27. -/
def ep_Q2_008_partial_27_1146 : Poly :=
[
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 27. -/
theorem ep_Q2_008_partial_27_1146_valid :
    mulPoly ep_Q2_008_coefficient_27_1146
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1147 : Poly :=
[
  term ((-105559530093286220235 : Rat) / 11087303257826821744) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 1147 for generator 27. -/
def ep_Q2_008_partial_27_1147 : Poly :=
[
  term ((-105559530093286220235 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((105559530093286220235 : Rat) / 11087303257826821744) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 27. -/
theorem ep_Q2_008_partial_27_1147_valid :
    mulPoly ep_Q2_008_coefficient_27_1147
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1148 : Poly :=
[
  term ((-51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1148 for generator 27. -/
def ep_Q2_008_partial_27_1148 : Poly :=
[
  term ((51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 27. -/
theorem ep_Q2_008_partial_27_1148_valid :
    mulPoly ep_Q2_008_coefficient_27_1148
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1149 : Poly :=
[
  term ((-25710548559062202268209080658002061331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1149 for generator 27. -/
def ep_Q2_008_partial_27_1149 : Poly :=
[
  term ((-51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((25710548559062202268209080658002061331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 27. -/
theorem ep_Q2_008_partial_27_1149_valid :
    mulPoly ep_Q2_008_coefficient_27_1149
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1150 : Poly :=
[
  term ((4173645954211731293768558624477927457247073 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1150 for generator 27. -/
def ep_Q2_008_partial_27_1150 : Poly :=
[
  term ((-4173645954211731293768558624477927457247073 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 27. -/
theorem ep_Q2_008_partial_27_1150_valid :
    mulPoly ep_Q2_008_coefficient_27_1150
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1151 : Poly :=
[
  term ((4173645954211731293768558624477927457247073 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1151 for generator 27. -/
def ep_Q2_008_partial_27_1151 : Poly :=
[
  term ((4173645954211731293768558624477927457247073 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4173645954211731293768558624477927457247073 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 27. -/
theorem ep_Q2_008_partial_27_1151_valid :
    mulPoly ep_Q2_008_coefficient_27_1151
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1152 : Poly :=
[
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1152 for generator 27. -/
def ep_Q2_008_partial_27_1152 : Poly :=
[
  term ((-3872455522977205190801794830365952000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 27. -/
theorem ep_Q2_008_partial_27_1152_valid :
    mulPoly ep_Q2_008_coefficient_27_1152
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1153 : Poly :=
[
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1153 for generator 27. -/
def ep_Q2_008_partial_27_1153 : Poly :=
[
  term ((-68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 27. -/
theorem ep_Q2_008_partial_27_1153_valid :
    mulPoly ep_Q2_008_coefficient_27_1153
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1154 : Poly :=
[
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1154 for generator 27. -/
def ep_Q2_008_partial_27_1154 : Poly :=
[
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 27. -/
theorem ep_Q2_008_partial_27_1154_valid :
    mulPoly ep_Q2_008_coefficient_27_1154
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1155 : Poly :=
[
  term ((484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1155 for generator 27. -/
def ep_Q2_008_partial_27_1155 : Poly :=
[
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 27. -/
theorem ep_Q2_008_partial_27_1155_valid :
    mulPoly ep_Q2_008_coefficient_27_1155
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1156 : Poly :=
[
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1156 for generator 27. -/
def ep_Q2_008_partial_27_1156 : Poly :=
[
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 27. -/
theorem ep_Q2_008_partial_27_1156_valid :
    mulPoly ep_Q2_008_coefficient_27_1156
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1157 : Poly :=
[
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1157 for generator 27. -/
def ep_Q2_008_partial_27_1157 : Poly :=
[
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 27. -/
theorem ep_Q2_008_partial_27_1157_valid :
    mulPoly ep_Q2_008_coefficient_27_1157
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1158 : Poly :=
[
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1158 for generator 27. -/
def ep_Q2_008_partial_27_1158 : Poly :=
[
  term ((-645838335510271678440 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 27. -/
theorem ep_Q2_008_partial_27_1158_valid :
    mulPoly ep_Q2_008_coefficient_27_1158
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1159 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (12, 1), (16, 1)]
]

/-- Partial product 1159 for generator 27. -/
def ep_Q2_008_partial_27_1159 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 1385912907228352718) [(3, 2), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 27. -/
theorem ep_Q2_008_partial_27_1159_valid :
    mulPoly ep_Q2_008_coefficient_27_1159
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1160 : Poly :=
[
  term ((161459583877567919610 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1160 for generator 27. -/
def ep_Q2_008_partial_27_1160 : Poly :=
[
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 27. -/
theorem ep_Q2_008_partial_27_1160_valid :
    mulPoly ep_Q2_008_coefficient_27_1160
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1161 : Poly :=
[
  term ((80729791938783959805 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (16, 1)]
]

/-- Partial product 1161 for generator 27. -/
def ep_Q2_008_partial_27_1161 : Poly :=
[
  term ((161459583877567919610 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-80729791938783959805 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 27. -/
theorem ep_Q2_008_partial_27_1161_valid :
    mulPoly ep_Q2_008_coefficient_27_1161
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1162 : Poly :=
[
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(3, 2), (5, 2), (14, 1), (16, 1)]
]

/-- Partial product 1162 for generator 27. -/
def ep_Q2_008_partial_27_1162 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 2), (5, 2), (14, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 27. -/
theorem ep_Q2_008_partial_27_1162_valid :
    mulPoly ep_Q2_008_coefficient_27_1162
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1163 : Poly :=
[
  term ((15042639383838845127 : Rat) / 11087303257826821744) [(3, 2), (5, 2), (16, 1)]
]

/-- Partial product 1163 for generator 27. -/
def ep_Q2_008_partial_27_1163 : Poly :=
[
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(3, 2), (5, 2), (14, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 11087303257826821744) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 27. -/
theorem ep_Q2_008_partial_27_1163_valid :
    mulPoly ep_Q2_008_coefficient_27_1163
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1164 : Poly :=
[
  term ((2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1164 for generator 27. -/
def ep_Q2_008_partial_27_1164 : Poly :=
[
  term ((4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 27. -/
theorem ep_Q2_008_partial_27_1164_valid :
    mulPoly ep_Q2_008_coefficient_27_1164
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1165 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1165 for generator 27. -/
def ep_Q2_008_partial_27_1165 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 27. -/
theorem ep_Q2_008_partial_27_1165_valid :
    mulPoly ep_Q2_008_coefficient_27_1165
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1166 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1166 for generator 27. -/
def ep_Q2_008_partial_27_1166 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 27. -/
theorem ep_Q2_008_partial_27_1166_valid :
    mulPoly ep_Q2_008_coefficient_27_1166
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1167 : Poly :=
[
  term ((14818996851803579394945536762269013620701 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1167 for generator 27. -/
def ep_Q2_008_partial_27_1167 : Poly :=
[
  term ((29637993703607158789891073524538027241402 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14818996851803579394945536762269013620701 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 27. -/
theorem ep_Q2_008_partial_27_1167_valid :
    mulPoly ep_Q2_008_coefficient_27_1167
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1168 : Poly :=
[
  term ((-1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1168 for generator 27. -/
def ep_Q2_008_partial_27_1168 : Poly :=
[
  term ((1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 27. -/
theorem ep_Q2_008_partial_27_1168_valid :
    mulPoly ep_Q2_008_coefficient_27_1168
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1169 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1169 for generator 27. -/
def ep_Q2_008_partial_27_1169 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 27. -/
theorem ep_Q2_008_partial_27_1169_valid :
    mulPoly ep_Q2_008_coefficient_27_1169
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1170 : Poly :=
[
  term ((-614455907088543987551057748876816000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1170 for generator 27. -/
def ep_Q2_008_partial_27_1170 : Poly :=
[
  term ((-1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((614455907088543987551057748876816000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 27. -/
theorem ep_Q2_008_partial_27_1170_valid :
    mulPoly ep_Q2_008_coefficient_27_1170
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1171 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 1171 for generator 27. -/
def ep_Q2_008_partial_27_1171 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 27. -/
theorem ep_Q2_008_partial_27_1171_valid :
    mulPoly ep_Q2_008_coefficient_27_1171
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1172 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1172 for generator 27. -/
def ep_Q2_008_partial_27_1172 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 27. -/
theorem ep_Q2_008_partial_27_1172_valid :
    mulPoly ep_Q2_008_coefficient_27_1172
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1173 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1173 for generator 27. -/
def ep_Q2_008_partial_27_1173 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 27. -/
theorem ep_Q2_008_partial_27_1173_valid :
    mulPoly ep_Q2_008_coefficient_27_1173
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1174 : Poly :=
[
  term ((-14812738146797301835931598593864683785501 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1174 for generator 27. -/
def ep_Q2_008_partial_27_1174 : Poly :=
[
  term ((14812738146797301835931598593864683785501 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14812738146797301835931598593864683785501 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 27. -/
theorem ep_Q2_008_partial_27_1174_valid :
    mulPoly ep_Q2_008_coefficient_27_1174
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1175 : Poly :=
[
  term ((-14812738146797301835931598593864683785501 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1175 for generator 27. -/
def ep_Q2_008_partial_27_1175 : Poly :=
[
  term ((-14812738146797301835931598593864683785501 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((14812738146797301835931598593864683785501 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 27. -/
theorem ep_Q2_008_partial_27_1175_valid :
    mulPoly ep_Q2_008_coefficient_27_1175
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1176 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1176 for generator 27. -/
def ep_Q2_008_partial_27_1176 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 27. -/
theorem ep_Q2_008_partial_27_1176_valid :
    mulPoly ep_Q2_008_coefficient_27_1176
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1177 : Poly :=
[
  term ((67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1177 for generator 27. -/
def ep_Q2_008_partial_27_1177 : Poly :=
[
  term ((135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 27. -/
theorem ep_Q2_008_partial_27_1177_valid :
    mulPoly ep_Q2_008_coefficient_27_1177
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1178 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1178 for generator 27. -/
def ep_Q2_008_partial_27_1178 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 27. -/
theorem ep_Q2_008_partial_27_1178_valid :
    mulPoly ep_Q2_008_coefficient_27_1178
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1179 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1179 for generator 27. -/
def ep_Q2_008_partial_27_1179 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 27. -/
theorem ep_Q2_008_partial_27_1179_valid :
    mulPoly ep_Q2_008_coefficient_27_1179
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1180 : Poly :=
[
  term ((-33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1180 for generator 27. -/
def ep_Q2_008_partial_27_1180 : Poly :=
[
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 27. -/
theorem ep_Q2_008_partial_27_1180_valid :
    mulPoly ep_Q2_008_coefficient_27_1180
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1181 : Poly :=
[
  term ((-16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 1181 for generator 27. -/
def ep_Q2_008_partial_27_1181 : Poly :=
[
  term ((-33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 27. -/
theorem ep_Q2_008_partial_27_1181_valid :
    mulPoly ep_Q2_008_coefficient_27_1181
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1182 : Poly :=
[
  term ((-234997830172389375 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1182 for generator 27. -/
def ep_Q2_008_partial_27_1182 : Poly :=
[
  term ((-469995660344778750 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 27. -/
theorem ep_Q2_008_partial_27_1182_valid :
    mulPoly ep_Q2_008_coefficient_27_1182
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1183 : Poly :=
[
  term ((234997830172389375 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1183 for generator 27. -/
def ep_Q2_008_partial_27_1183 : Poly :=
[
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 27. -/
theorem ep_Q2_008_partial_27_1183_valid :
    mulPoly ep_Q2_008_coefficient_27_1183
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1184 : Poly :=
[
  term ((234997830172389375 : Rat) / 2771825814456705436) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1184 for generator 27. -/
def ep_Q2_008_partial_27_1184 : Poly :=
[
  term ((234997830172389375 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 27. -/
theorem ep_Q2_008_partial_27_1184_valid :
    mulPoly ep_Q2_008_coefficient_27_1184
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1185 : Poly :=
[
  term ((-37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1185 for generator 27. -/
def ep_Q2_008_partial_27_1185 : Poly :=
[
  term ((-75213641643729987943570839465710231681400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 27. -/
theorem ep_Q2_008_partial_27_1185_valid :
    mulPoly ep_Q2_008_coefficient_27_1185
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1186 : Poly :=
[
  term ((18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1186 for generator 27. -/
def ep_Q2_008_partial_27_1186 : Poly :=
[
  term ((-18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 27. -/
theorem ep_Q2_008_partial_27_1186_valid :
    mulPoly ep_Q2_008_coefficient_27_1186
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1187 : Poly :=
[
  term ((9401705205466248492946354933213778960175 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1187 for generator 27. -/
def ep_Q2_008_partial_27_1187 : Poly :=
[
  term ((18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9401705205466248492946354933213778960175 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 27. -/
theorem ep_Q2_008_partial_27_1187_valid :
    mulPoly ep_Q2_008_coefficient_27_1187
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1188 : Poly :=
[
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1188 for generator 27. -/
def ep_Q2_008_partial_27_1188 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4244765494801986000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 27. -/
theorem ep_Q2_008_partial_27_1188_valid :
    mulPoly ep_Q2_008_coefficient_27_1188
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1189 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1189 for generator 27. -/
def ep_Q2_008_partial_27_1189 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 27. -/
theorem ep_Q2_008_partial_27_1189_valid :
    mulPoly ep_Q2_008_coefficient_27_1189
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1190 : Poly :=
[
  term ((1157663316764178000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)]
]

/-- Partial product 1190 for generator 27. -/
def ep_Q2_008_partial_27_1190 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1157663316764178000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 27. -/
theorem ep_Q2_008_partial_27_1190_valid :
    mulPoly ep_Q2_008_coefficient_27_1190
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1191 : Poly :=
[
  term ((131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1191 for generator 27. -/
def ep_Q2_008_partial_27_1191 : Poly :=
[
  term ((262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 27. -/
theorem ep_Q2_008_partial_27_1191_valid :
    mulPoly ep_Q2_008_coefficient_27_1191
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1192 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1192 for generator 27. -/
def ep_Q2_008_partial_27_1192 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 27. -/
theorem ep_Q2_008_partial_27_1192_valid :
    mulPoly ep_Q2_008_coefficient_27_1192
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1193 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1193 for generator 27. -/
def ep_Q2_008_partial_27_1193 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 27. -/
theorem ep_Q2_008_partial_27_1193_valid :
    mulPoly ep_Q2_008_coefficient_27_1193
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1194 : Poly :=
[
  term ((82474701698463322263540314777100367245000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1194 for generator 27. -/
def ep_Q2_008_partial_27_1194 : Poly :=
[
  term ((164949403396926644527080629554200734490000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82474701698463322263540314777100367245000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 27. -/
theorem ep_Q2_008_partial_27_1194_valid :
    mulPoly ep_Q2_008_coefficient_27_1194
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1195 : Poly :=
[
  term ((-65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1195 for generator 27. -/
def ep_Q2_008_partial_27_1195 : Poly :=
[
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 27. -/
theorem ep_Q2_008_partial_27_1195_valid :
    mulPoly ep_Q2_008_coefficient_27_1195
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1196 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1196 for generator 27. -/
def ep_Q2_008_partial_27_1196 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 27. -/
theorem ep_Q2_008_partial_27_1196_valid :
    mulPoly ep_Q2_008_coefficient_27_1196
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1197 : Poly :=
[
  term ((-32869390126351594636332848948126169600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1197 for generator 27. -/
def ep_Q2_008_partial_27_1197 : Poly :=
[
  term ((-65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32869390126351594636332848948126169600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 27. -/
theorem ep_Q2_008_partial_27_1197_valid :
    mulPoly ep_Q2_008_coefficient_27_1197
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1198 : Poly :=
[
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1198 for generator 27. -/
def ep_Q2_008_partial_27_1198 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 27. -/
theorem ep_Q2_008_partial_27_1198_valid :
    mulPoly ep_Q2_008_coefficient_27_1198
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1199 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1199 for generator 27. -/
def ep_Q2_008_partial_27_1199 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 27. -/
theorem ep_Q2_008_partial_27_1199_valid :
    mulPoly ep_Q2_008_coefficient_27_1199
        ep_Q2_008_generator_27_1100_1199 =
      ep_Q2_008_partial_27_1199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1100_1199 : List Poly :=
[
  ep_Q2_008_partial_27_1100,
  ep_Q2_008_partial_27_1101,
  ep_Q2_008_partial_27_1102,
  ep_Q2_008_partial_27_1103,
  ep_Q2_008_partial_27_1104,
  ep_Q2_008_partial_27_1105,
  ep_Q2_008_partial_27_1106,
  ep_Q2_008_partial_27_1107,
  ep_Q2_008_partial_27_1108,
  ep_Q2_008_partial_27_1109,
  ep_Q2_008_partial_27_1110,
  ep_Q2_008_partial_27_1111,
  ep_Q2_008_partial_27_1112,
  ep_Q2_008_partial_27_1113,
  ep_Q2_008_partial_27_1114,
  ep_Q2_008_partial_27_1115,
  ep_Q2_008_partial_27_1116,
  ep_Q2_008_partial_27_1117,
  ep_Q2_008_partial_27_1118,
  ep_Q2_008_partial_27_1119,
  ep_Q2_008_partial_27_1120,
  ep_Q2_008_partial_27_1121,
  ep_Q2_008_partial_27_1122,
  ep_Q2_008_partial_27_1123,
  ep_Q2_008_partial_27_1124,
  ep_Q2_008_partial_27_1125,
  ep_Q2_008_partial_27_1126,
  ep_Q2_008_partial_27_1127,
  ep_Q2_008_partial_27_1128,
  ep_Q2_008_partial_27_1129,
  ep_Q2_008_partial_27_1130,
  ep_Q2_008_partial_27_1131,
  ep_Q2_008_partial_27_1132,
  ep_Q2_008_partial_27_1133,
  ep_Q2_008_partial_27_1134,
  ep_Q2_008_partial_27_1135,
  ep_Q2_008_partial_27_1136,
  ep_Q2_008_partial_27_1137,
  ep_Q2_008_partial_27_1138,
  ep_Q2_008_partial_27_1139,
  ep_Q2_008_partial_27_1140,
  ep_Q2_008_partial_27_1141,
  ep_Q2_008_partial_27_1142,
  ep_Q2_008_partial_27_1143,
  ep_Q2_008_partial_27_1144,
  ep_Q2_008_partial_27_1145,
  ep_Q2_008_partial_27_1146,
  ep_Q2_008_partial_27_1147,
  ep_Q2_008_partial_27_1148,
  ep_Q2_008_partial_27_1149,
  ep_Q2_008_partial_27_1150,
  ep_Q2_008_partial_27_1151,
  ep_Q2_008_partial_27_1152,
  ep_Q2_008_partial_27_1153,
  ep_Q2_008_partial_27_1154,
  ep_Q2_008_partial_27_1155,
  ep_Q2_008_partial_27_1156,
  ep_Q2_008_partial_27_1157,
  ep_Q2_008_partial_27_1158,
  ep_Q2_008_partial_27_1159,
  ep_Q2_008_partial_27_1160,
  ep_Q2_008_partial_27_1161,
  ep_Q2_008_partial_27_1162,
  ep_Q2_008_partial_27_1163,
  ep_Q2_008_partial_27_1164,
  ep_Q2_008_partial_27_1165,
  ep_Q2_008_partial_27_1166,
  ep_Q2_008_partial_27_1167,
  ep_Q2_008_partial_27_1168,
  ep_Q2_008_partial_27_1169,
  ep_Q2_008_partial_27_1170,
  ep_Q2_008_partial_27_1171,
  ep_Q2_008_partial_27_1172,
  ep_Q2_008_partial_27_1173,
  ep_Q2_008_partial_27_1174,
  ep_Q2_008_partial_27_1175,
  ep_Q2_008_partial_27_1176,
  ep_Q2_008_partial_27_1177,
  ep_Q2_008_partial_27_1178,
  ep_Q2_008_partial_27_1179,
  ep_Q2_008_partial_27_1180,
  ep_Q2_008_partial_27_1181,
  ep_Q2_008_partial_27_1182,
  ep_Q2_008_partial_27_1183,
  ep_Q2_008_partial_27_1184,
  ep_Q2_008_partial_27_1185,
  ep_Q2_008_partial_27_1186,
  ep_Q2_008_partial_27_1187,
  ep_Q2_008_partial_27_1188,
  ep_Q2_008_partial_27_1189,
  ep_Q2_008_partial_27_1190,
  ep_Q2_008_partial_27_1191,
  ep_Q2_008_partial_27_1192,
  ep_Q2_008_partial_27_1193,
  ep_Q2_008_partial_27_1194,
  ep_Q2_008_partial_27_1195,
  ep_Q2_008_partial_27_1196,
  ep_Q2_008_partial_27_1197,
  ep_Q2_008_partial_27_1198,
  ep_Q2_008_partial_27_1199
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1100_1199 : Poly :=
[
  term ((7995170523765116349 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((5005018173757546543451638350406752000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2502509086878773271725819175203376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10948169557931448690 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((221204126551875835518380789595653760000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-59209634925788306317432532554406400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4858939462685558847 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2502509086878773271725819175203376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((625627271719693317931454793800844000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((5474084778965724345 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-7401204365723538289679066569300800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((4858939462685558847 : Rat) / 11087303257826821744) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((6092211004233225187531734795707136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((56382435440928018839792507125478400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((761526375529153148441466849463392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((7047804430116002354974063390684800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((50937185937623832000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((6367148242202979000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((24586673565095147362764268006076140300800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((142936611412176720000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((11832980445486574069079825621325421056000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((17867076426522090000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((1401694617601348875 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-6959501114231161659535083489885387033600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((105559530093286220235 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-105559530093286220235 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((205684388472497618145672645264016490649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4173645954211731293768558624477927457247073 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-105559530093286220235 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((105559530093286220235 : Rat) / 11087303257826821744) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((25710548559062202268209080658002061331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4173645954211731293768558624477927457247073 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3872455522977205190801794830365952000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-645838335510271678440 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 2), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-15042639383838845127 : Rat) / 1385912907228352718) [(3, 2), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (12, 1), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (14, 2), (16, 1)],
  term ((-80729791938783959805 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (14, 2), (16, 1)],
  term ((-15042639383838845127 : Rat) / 11087303257826821744) [(3, 2), (5, 2), (16, 1)],
  term ((4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((29637993703607158789891073524538027241402 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14818996851803579394945536762269013620701 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((614455907088543987551057748876816000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14812738146797301835931598593864683785501 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((14812738146797301835931598593864683785501 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((16922808345092292187588152210297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((-469995660344778750 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-75213641643729987943570839465710231681400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9401705205466248492946354933213778960175 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4244765494801986000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (14, 2), (16, 1)],
  term ((-1157663316764178000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)],
  term ((262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((164949403396926644527080629554200734490000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82474701698463322263540314777100367245000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((32869390126351594636332848948126169600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1100 through 1199. -/
theorem ep_Q2_008_block_27_1100_1199_valid :
    checkProductSumEq ep_Q2_008_partials_27_1100_1199
      ep_Q2_008_block_27_1100_1199 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
