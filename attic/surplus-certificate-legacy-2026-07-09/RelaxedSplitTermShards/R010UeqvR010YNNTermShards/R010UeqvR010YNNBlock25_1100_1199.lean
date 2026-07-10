/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1100-1199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1100 : Poly :=
[
  term ((483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (14, 1), (16, 1)]
]

/-- Partial product 1100 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1100 : Poly :=
[
  term ((966590987811635200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1100
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1101 : Poly :=
[
  term ((120823873476454400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (16, 1)]
]

/-- Partial product 1101 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1101 : Poly :=
[
  term ((241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1101
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1102 : Poly :=
[
  term ((-297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1102 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1102 : Poly :=
[
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1102
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1103 : Poly :=
[
  term ((3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1103 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1103 : Poly :=
[
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1103
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1104 : Poly :=
[
  term ((595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1104 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1104 : Poly :=
[
  term ((1191532557361639511264 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1104
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1105 : Poly :=
[
  term ((-7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1105 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1105 : Poly :=
[
  term ((-14526846179338823680 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1105
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1106 : Poly :=
[
  term ((148941569670204938908 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1106 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1106 : Poly :=
[
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-148941569670204938908 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1106
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1107 : Poly :=
[
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1107 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1107 : Poly :=
[
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1107
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1108 : Poly :=
[
  term ((-941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1108 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1108 : Poly :=
[
  term ((941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1108
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1109 : Poly :=
[
  term ((1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1109 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1109 : Poly :=
[
  term ((3767433537347379200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1109
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1110 : Poly :=
[
  term ((470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1110 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1110 : Poly :=
[
  term ((941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1110
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1111 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1111 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1111 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1111
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1112 : Poly :=
[
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1112 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1112 : Poly :=
[
  term ((407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1112
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1113 : Poly :=
[
  term ((2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1113 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1113 : Poly :=
[
  term ((5052816062378721280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1113
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1114 : Poly :=
[
  term ((814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1114 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1114 : Poly :=
[
  term ((1628684374324906279552 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1114
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1115 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1115 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1115 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1115
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1116 : Poly :=
[
  term ((2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1116 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1116 : Poly :=
[
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1116
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1117 : Poly :=
[
  term ((-4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1117 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1117 : Poly :=
[
  term ((-8436772409976709120 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1117
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1118 : Poly :=
[
  term ((-1054596551247088640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1118 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1118 : Poly :=
[
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1054596551247088640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1118
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1119 : Poly :=
[
  term ((1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1119 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1119 : Poly :=
[
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1119
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1120 : Poly :=
[
  term ((-3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1120 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1120 : Poly :=
[
  term ((-6970295981025198080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1120
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1121 : Poly :=
[
  term ((-871286997628149760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 1121 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1121 : Poly :=
[
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((871286997628149760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1121
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1122 : Poly :=
[
  term ((7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1122 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1122 : Poly :=
[
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1122
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1123 : Poly :=
[
  term ((-14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1123 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1123 : Poly :=
[
  term ((-29442639139407781063936 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1123
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1124 : Poly :=
[
  term ((-3680329892425972632992 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1124 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1124 : Poly :=
[
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((3680329892425972632992 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1124
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1125 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1125 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1125 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1125
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1126 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1126 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1126 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1126_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1126
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1127 : Poly :=
[
  term ((4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1127 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1127 : Poly :=
[
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1127_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1127
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1128 : Poly :=
[
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1128 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1128 : Poly :=
[
  term ((-17763525782189178880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1128_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1128
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1129 : Poly :=
[
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1129 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1129 : Poly :=
[
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1129_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1129
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1130 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1130 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1130 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1130_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1130
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1131 : Poly :=
[
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1131 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1131 : Poly :=
[
  term ((2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1131_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1131
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1132 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1132 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1132 : Poly :=
[
  term ((1016830741658009600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1132_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1132
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1133 : Poly :=
[
  term ((4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1133 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1133 : Poly :=
[
  term ((9657592289076838400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1133_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1133
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1134 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1134 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1134 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1134_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1134
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1135 : Poly :=
[
  term ((1207199036134604800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 1135 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1135 : Poly :=
[
  term ((2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-1207199036134604800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1135_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1135
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1136 : Poly :=
[
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1136 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1136 : Poly :=
[
  term ((2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1136_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1136
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1137 : Poly :=
[
  term ((5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1137 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1137 : Poly :=
[
  term ((11461970099307642880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1137_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1137
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1138 : Poly :=
[
  term ((1432746262413455360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1138 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1138 : Poly :=
[
  term ((2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1138_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1138
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1139 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1139 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1139 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1139_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1139
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1140 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1140 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1140 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1140_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1140
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1141 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1141 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1141 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1141_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1141
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1142 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1142 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1142 : Poly :=
[
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1142_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1142
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1143 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 1143 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1143 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1143_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1143
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1144 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1144 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1144 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1144_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1144
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1145 : Poly :=
[
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1145 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1145 : Poly :=
[
  term ((-5172010046989242880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1145_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1145
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1146 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1146 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1146 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1146_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1146
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1147 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1147 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1147 : Poly :=
[
  term ((359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1147_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1147
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1148 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1148 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1148 : Poly :=
[
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1148_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1148
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1149 : Poly :=
[
  term ((1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1149 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1149 : Poly :=
[
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1149_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1149
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1150 : Poly :=
[
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1150 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1150 : Poly :=
[
  term ((-7050775127757437984 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1150_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1150
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1151 : Poly :=
[
  term ((-881346890969679748 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1151 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1151 : Poly :=
[
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1151_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1151
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1152 : Poly :=
[
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1152 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1152 : Poly :=
[
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1152_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1152
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1153 : Poly :=
[
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1153 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1153 : Poly :=
[
  term ((-93152670185293602944 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1153_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1153
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1154 : Poly :=
[
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 1154 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1154 : Poly :=
[
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1154_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1154
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1155 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1155 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1155 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1155_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1155
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1156 : Poly :=
[
  term (8 : Rat) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 1156 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1156 : Poly :=
[
  term (-8 : Rat) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1156_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1156
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1157 : Poly :=
[
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1157 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1157 : Poly :=
[
  term ((-2875707320683582445696 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1157_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1157
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1158 : Poly :=
[
  term (-16 : Rat) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 1158 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1158 : Poly :=
[
  term (-32 : Rat) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1158_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1158
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1159 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 1159 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1159 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1159_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1159
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1160 : Poly :=
[
  term (-4 : Rat) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 1160 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1160 : Poly :=
[
  term (-8 : Rat) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1160_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1160
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1161 : Poly :=
[
  term ((297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1161 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1161 : Poly :=
[
  term ((-297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1161_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1161
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1162 : Poly :=
[
  term ((-594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1162 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1162 : Poly :=
[
  term ((-1188615478328104960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1162_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1162
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1163 : Poly :=
[
  term ((-148576934791013120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1163 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1163 : Poly :=
[
  term ((-297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1163_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1163
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1164 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1164 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1164 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1164_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1164
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1165 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1165 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1165 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1165_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1165
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1166 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1166 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1166 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1166_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1166
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1167 : Poly :=
[
  term ((-790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1167 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1167 : Poly :=
[
  term ((790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1167_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1167
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1168 : Poly :=
[
  term ((1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1168 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1168 : Poly :=
[
  term ((3160046611321120384 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1168_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1168
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1169 : Poly :=
[
  term ((395005826415140048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 1169 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1169 : Poly :=
[
  term ((790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1169_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1169
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1170 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1170 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1170 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1170_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1170
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1171 : Poly :=
[
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1171 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1171 : Poly :=
[
  term ((1531787043959603200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1171_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1171
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1172 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1172 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1172 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1172_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1172
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1173 : Poly :=
[
  term ((-185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1173 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1173 : Poly :=
[
  term ((185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1173_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1173
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1174 : Poly :=
[
  term ((371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1174 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1174 : Poly :=
[
  term ((743141876701696000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1174_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1174
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1175 : Poly :=
[
  term ((92892734587712000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1175 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1175 : Poly :=
[
  term ((185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1175_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1175
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1176 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 1), (16, 1)]
]

/-- Partial product 1176 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1176 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1176_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1176
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1177 : Poly :=
[
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 1177 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1177 : Poly :=
[
  term ((-4456107764246118400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1177_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1177
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1178 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 1178 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1178 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1178_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1178
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1179 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1179 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1179 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1179_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1179
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1180 : Poly :=
[
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1180 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1180 : Poly :=
[
  term ((-4362857639094471872 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1180_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1180
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1181 : Poly :=
[
  term ((-545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 1181 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1181 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1181_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1181
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1182 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 1182 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1182 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1182_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1182
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1183 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 1183 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1183 : Poly :=
[
  term ((-6803910212203057664 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1183_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1183
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1184 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 1184 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1184 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1184_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1184
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1185 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1185 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1185 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1185_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1185
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1186 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1186 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1186 : Poly :=
[
  term ((1510503657512214939328 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1186_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1186
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1187 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1187 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1187 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1187_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1187
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1188 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1188 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1188 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1188_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1188
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1189 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1189 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1189 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1189_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1189
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1190 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1190 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1190 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1190_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1190
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1191 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1191 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1191 : Poly :=
[
  term ((262473904242278400 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1191_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1191
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1192 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1192 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1192 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1192_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1192
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1193 : Poly :=
[
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1193 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1193 : Poly :=
[
  term ((46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1193_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1193
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1194 : Poly :=
[
  term ((93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1194 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1194 : Poly :=
[
  term ((186512348704522246144 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1194_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1194
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1195 : Poly :=
[
  term ((23314043588065280768 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1195 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1195 : Poly :=
[
  term ((46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1195_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1195
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1196 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1196 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1196 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1196_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1196
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1197 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1197 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1197 : Poly :=
[
  term ((8405931269691146240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1197_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1197
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1198 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1198 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1198 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1198_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1198
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1199 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 1199 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1199 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1199_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1199
        rs_R010_ueqv_R010YNN_generator_25_1100_1199 =
      rs_R010_ueqv_R010YNN_partial_25_1199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1100_1199 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1100,
  rs_R010_ueqv_R010YNN_partial_25_1101,
  rs_R010_ueqv_R010YNN_partial_25_1102,
  rs_R010_ueqv_R010YNN_partial_25_1103,
  rs_R010_ueqv_R010YNN_partial_25_1104,
  rs_R010_ueqv_R010YNN_partial_25_1105,
  rs_R010_ueqv_R010YNN_partial_25_1106,
  rs_R010_ueqv_R010YNN_partial_25_1107,
  rs_R010_ueqv_R010YNN_partial_25_1108,
  rs_R010_ueqv_R010YNN_partial_25_1109,
  rs_R010_ueqv_R010YNN_partial_25_1110,
  rs_R010_ueqv_R010YNN_partial_25_1111,
  rs_R010_ueqv_R010YNN_partial_25_1112,
  rs_R010_ueqv_R010YNN_partial_25_1113,
  rs_R010_ueqv_R010YNN_partial_25_1114,
  rs_R010_ueqv_R010YNN_partial_25_1115,
  rs_R010_ueqv_R010YNN_partial_25_1116,
  rs_R010_ueqv_R010YNN_partial_25_1117,
  rs_R010_ueqv_R010YNN_partial_25_1118,
  rs_R010_ueqv_R010YNN_partial_25_1119,
  rs_R010_ueqv_R010YNN_partial_25_1120,
  rs_R010_ueqv_R010YNN_partial_25_1121,
  rs_R010_ueqv_R010YNN_partial_25_1122,
  rs_R010_ueqv_R010YNN_partial_25_1123,
  rs_R010_ueqv_R010YNN_partial_25_1124,
  rs_R010_ueqv_R010YNN_partial_25_1125,
  rs_R010_ueqv_R010YNN_partial_25_1126,
  rs_R010_ueqv_R010YNN_partial_25_1127,
  rs_R010_ueqv_R010YNN_partial_25_1128,
  rs_R010_ueqv_R010YNN_partial_25_1129,
  rs_R010_ueqv_R010YNN_partial_25_1130,
  rs_R010_ueqv_R010YNN_partial_25_1131,
  rs_R010_ueqv_R010YNN_partial_25_1132,
  rs_R010_ueqv_R010YNN_partial_25_1133,
  rs_R010_ueqv_R010YNN_partial_25_1134,
  rs_R010_ueqv_R010YNN_partial_25_1135,
  rs_R010_ueqv_R010YNN_partial_25_1136,
  rs_R010_ueqv_R010YNN_partial_25_1137,
  rs_R010_ueqv_R010YNN_partial_25_1138,
  rs_R010_ueqv_R010YNN_partial_25_1139,
  rs_R010_ueqv_R010YNN_partial_25_1140,
  rs_R010_ueqv_R010YNN_partial_25_1141,
  rs_R010_ueqv_R010YNN_partial_25_1142,
  rs_R010_ueqv_R010YNN_partial_25_1143,
  rs_R010_ueqv_R010YNN_partial_25_1144,
  rs_R010_ueqv_R010YNN_partial_25_1145,
  rs_R010_ueqv_R010YNN_partial_25_1146,
  rs_R010_ueqv_R010YNN_partial_25_1147,
  rs_R010_ueqv_R010YNN_partial_25_1148,
  rs_R010_ueqv_R010YNN_partial_25_1149,
  rs_R010_ueqv_R010YNN_partial_25_1150,
  rs_R010_ueqv_R010YNN_partial_25_1151,
  rs_R010_ueqv_R010YNN_partial_25_1152,
  rs_R010_ueqv_R010YNN_partial_25_1153,
  rs_R010_ueqv_R010YNN_partial_25_1154,
  rs_R010_ueqv_R010YNN_partial_25_1155,
  rs_R010_ueqv_R010YNN_partial_25_1156,
  rs_R010_ueqv_R010YNN_partial_25_1157,
  rs_R010_ueqv_R010YNN_partial_25_1158,
  rs_R010_ueqv_R010YNN_partial_25_1159,
  rs_R010_ueqv_R010YNN_partial_25_1160,
  rs_R010_ueqv_R010YNN_partial_25_1161,
  rs_R010_ueqv_R010YNN_partial_25_1162,
  rs_R010_ueqv_R010YNN_partial_25_1163,
  rs_R010_ueqv_R010YNN_partial_25_1164,
  rs_R010_ueqv_R010YNN_partial_25_1165,
  rs_R010_ueqv_R010YNN_partial_25_1166,
  rs_R010_ueqv_R010YNN_partial_25_1167,
  rs_R010_ueqv_R010YNN_partial_25_1168,
  rs_R010_ueqv_R010YNN_partial_25_1169,
  rs_R010_ueqv_R010YNN_partial_25_1170,
  rs_R010_ueqv_R010YNN_partial_25_1171,
  rs_R010_ueqv_R010YNN_partial_25_1172,
  rs_R010_ueqv_R010YNN_partial_25_1173,
  rs_R010_ueqv_R010YNN_partial_25_1174,
  rs_R010_ueqv_R010YNN_partial_25_1175,
  rs_R010_ueqv_R010YNN_partial_25_1176,
  rs_R010_ueqv_R010YNN_partial_25_1177,
  rs_R010_ueqv_R010YNN_partial_25_1178,
  rs_R010_ueqv_R010YNN_partial_25_1179,
  rs_R010_ueqv_R010YNN_partial_25_1180,
  rs_R010_ueqv_R010YNN_partial_25_1181,
  rs_R010_ueqv_R010YNN_partial_25_1182,
  rs_R010_ueqv_R010YNN_partial_25_1183,
  rs_R010_ueqv_R010YNN_partial_25_1184,
  rs_R010_ueqv_R010YNN_partial_25_1185,
  rs_R010_ueqv_R010YNN_partial_25_1186,
  rs_R010_ueqv_R010YNN_partial_25_1187,
  rs_R010_ueqv_R010YNN_partial_25_1188,
  rs_R010_ueqv_R010YNN_partial_25_1189,
  rs_R010_ueqv_R010YNN_partial_25_1190,
  rs_R010_ueqv_R010YNN_partial_25_1191,
  rs_R010_ueqv_R010YNN_partial_25_1192,
  rs_R010_ueqv_R010YNN_partial_25_1193,
  rs_R010_ueqv_R010YNN_partial_25_1194,
  rs_R010_ueqv_R010YNN_partial_25_1195,
  rs_R010_ueqv_R010YNN_partial_25_1196,
  rs_R010_ueqv_R010YNN_partial_25_1197,
  rs_R010_ueqv_R010YNN_partial_25_1198,
  rs_R010_ueqv_R010YNN_partial_25_1199
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1100_1199 : Poly :=
[
  term ((966590987811635200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (14, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((1191532557361639511264 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14526846179338823680 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-148941569670204938908 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((3767433537347379200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5052816062378721280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1628684374324906279552 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-8436772409976709120 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1054596551247088640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6970295981025198080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (14, 1), (16, 1)],
  term ((871286997628149760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((-29442639139407781063936 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((3680329892425972632992 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17763525782189178880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((1016830741658009600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9657592289076838400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-1207199036134604800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((11461970099307642880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (14, 1), (16, 1)],
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 2), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (14, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((-5172010046989242880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-7050775127757437984 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-93152670185293602944 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 2), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-2875707320683582445696 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (-32 : Rat) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (5, 1), (16, 1)],
  term ((-1188615478328104960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((3160046611321120384 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((1531787043959603200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((743141876701696000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4456107764246118400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 2), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (16, 1)],
  term ((-4362857639094471872 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)],
  term ((-6803910212203057664 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((1510503657512214939328 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((262473904242278400 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((186512348704522246144 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((8405931269691146240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1100 through 1199. -/
theorem rs_R010_ueqv_R010YNN_block_25_1100_1199_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1100_1199
      rs_R010_ueqv_R010YNN_block_25_1100_1199 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
