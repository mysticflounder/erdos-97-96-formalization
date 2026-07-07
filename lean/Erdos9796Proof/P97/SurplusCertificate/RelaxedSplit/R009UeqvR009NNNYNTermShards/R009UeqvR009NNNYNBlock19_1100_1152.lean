/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:1100-1152

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1100 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1100 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1100 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1100
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1101 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(9, 2), (15, 2)]
]

/-- Partial product 1101 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1101 : Poly :=
[
  term ((-153811535336 : Rat) / 18848747061) [(8, 1), (9, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1101
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1102 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1102 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1102 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1102
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1103 : Poly :=
[
  term ((175 : Rat) / 134) [(10, 1)]
]

/-- Partial product 1103 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1103 : Poly :=
[
  term ((175 : Rat) / 67) [(8, 1), (10, 1)],
  term ((-175 : Rat) / 134) [(10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1103
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1104 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1104 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1104 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1104
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1105 : Poly :=
[
  term ((-77240396632 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1105 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1105 : Poly :=
[
  term ((-154480793264 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((77240396632 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1105
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1106 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1106 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1106 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1106
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1107 : Poly :=
[
  term ((-43432960 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1107 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1107 : Poly :=
[
  term ((-86865920 : Rat) / 110226591) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((43432960 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1107
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1108 : Poly :=
[
  term ((164180954372 : Rat) / 10471526145) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1108 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1108 : Poly :=
[
  term ((328361908744 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-164180954372 : Rat) / 10471526145) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1108
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1109 : Poly :=
[
  term ((-178697921024 : Rat) / 10471526145) [(10, 1), (11, 2)]
]

/-- Partial product 1109 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1109 : Poly :=
[
  term ((-357395842048 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 2)],
  term ((178697921024 : Rat) / 10471526145) [(10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1109
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1110 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(10, 1), (11, 2), (14, 1)]
]

/-- Partial product 1110 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1110 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1110
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1111 : Poly :=
[
  term ((18 : Rat) / 67) [(10, 1), (12, 1)]
]

/-- Partial product 1111 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1111 : Poly :=
[
  term ((36 : Rat) / 67) [(8, 1), (10, 1), (12, 1)],
  term ((-18 : Rat) / 67) [(10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1111
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1112 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1112 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1112 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1112
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1113 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 1113 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1113 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((17582080 : Rat) / 36742197) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1113
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1114 : Poly :=
[
  term ((-799680 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1114 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1114 : Poly :=
[
  term ((-1599360 : Rat) / 12247399) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((799680 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1114
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1115 : Poly :=
[
  term ((-14290880 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1115 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1115 : Poly :=
[
  term ((-28581760 : Rat) / 110226591) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((14290880 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1115
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1116 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 2)]
]

/-- Partial product 1116 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1116 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(8, 1), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1116
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1117 : Poly :=
[
  term ((123 : Rat) / 134) [(10, 1), (14, 1)]
]

/-- Partial product 1117 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1117 : Poly :=
[
  term ((123 : Rat) / 67) [(8, 1), (10, 1), (14, 1)],
  term ((-123 : Rat) / 134) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1117
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1118 : Poly :=
[
  term ((15384320 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1118 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1118 : Poly :=
[
  term ((30768640 : Rat) / 110226591) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-15384320 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1118
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1119 : Poly :=
[
  term ((41259401 : Rat) / 110226591) [(10, 1), (15, 2)]
]

/-- Partial product 1119 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1119 : Poly :=
[
  term ((82518802 : Rat) / 110226591) [(8, 1), (10, 1), (15, 2)],
  term ((-41259401 : Rat) / 110226591) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1119
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1120 : Poly :=
[
  term ((30 : Rat) / 67) [(10, 2)]
]

/-- Partial product 1120 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1120 : Poly :=
[
  term ((60 : Rat) / 67) [(8, 1), (10, 2)],
  term ((-30 : Rat) / 67) [(10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1120
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1121 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 1121 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1121 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1121
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1122 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 1122 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1122 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1122
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1123 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(10, 2), (15, 2)]
]

/-- Partial product 1123 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1123 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(8, 1), (10, 2), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1123
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1124 : Poly :=
[
  term ((-2284800 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1124 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1124 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((2284800 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1124
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1125 : Poly :=
[
  term ((6854400 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1125 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1125 : Poly :=
[
  term ((13708800 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6854400 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1125
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1126 : Poly :=
[
  term ((-43955200 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1126 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1126 : Poly :=
[
  term ((-87910400 : Rat) / 36742197) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((43955200 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1126
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1127 : Poly :=
[
  term ((43955200 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1127 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1127 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1127_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1127
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1128 : Poly :=
[
  term ((102115487587 : Rat) / 62829156870) [(11, 1), (13, 1)]
]

/-- Partial product 1128 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1128 : Poly :=
[
  term ((102115487587 : Rat) / 31414578435) [(8, 1), (11, 1), (13, 1)],
  term ((-102115487587 : Rat) / 62829156870) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1128_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1128
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1129 : Poly :=
[
  term ((798280000 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1129 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1129 : Poly :=
[
  term ((1596560000 : Rat) / 330679773) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-798280000 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1129_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1129
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1130 : Poly :=
[
  term ((1028160 : Rat) / 12247399) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 1130 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1130 : Poly :=
[
  term ((2056320 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1028160 : Rat) / 12247399) [(11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1130_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1130
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1131 : Poly :=
[
  term ((-121801600 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1131 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1131 : Poly :=
[
  term ((-243603200 : Rat) / 110226591) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((121801600 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1131_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1131
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1132 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1132 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1132 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1132_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1132
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1133 : Poly :=
[
  term ((106196123 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1133 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1133 : Poly :=
[
  term ((212392246 : Rat) / 110226591) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-106196123 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1133_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1133
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1134 : Poly :=
[
  term ((-2197760 : Rat) / 12247399) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 1134 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1134 : Poly :=
[
  term ((-4395520 : Rat) / 12247399) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((2197760 : Rat) / 12247399) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1134_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1134
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1135 : Poly :=
[
  term ((1171497111502 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 1135 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1135 : Poly :=
[
  term ((2342994223004 : Rat) / 94243735305) [(8, 1), (11, 1), (15, 1)],
  term ((-1171497111502 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1135_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1135
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1136 : Poly :=
[
  term ((30768640 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 1136 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1136 : Poly :=
[
  term ((61537280 : Rat) / 110226591) [(8, 1), (11, 1), (15, 3)],
  term ((-30768640 : Rat) / 110226591) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1136_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1136
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1137 : Poly :=
[
  term ((-18759510722 : Rat) / 1406622915) [(11, 2)]
]

/-- Partial product 1137 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1137 : Poly :=
[
  term ((-37519021444 : Rat) / 1406622915) [(8, 1), (11, 2)],
  term ((18759510722 : Rat) / 1406622915) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1137_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1137
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1138 : Poly :=
[
  term ((-48742400 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 1138 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1138 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1)],
  term ((48742400 : Rat) / 110226591) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1138_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1138
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1139 : Poly :=
[
  term ((48742400 : Rat) / 36742197) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 1139 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1139 : Poly :=
[
  term ((97484800 : Rat) / 36742197) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-48742400 : Rat) / 36742197) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1139_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1139
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1140 : Poly :=
[
  term ((118048000 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1140 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1140 : Poly :=
[
  term ((236096000 : Rat) / 110226591) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-118048000 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1140_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1140
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1141 : Poly :=
[
  term ((-207155200 : Rat) / 110226591) [(11, 2), (14, 1)]
]

/-- Partial product 1141 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1141 : Poly :=
[
  term ((-414310400 : Rat) / 110226591) [(8, 1), (11, 2), (14, 1)],
  term ((207155200 : Rat) / 110226591) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1141_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1141
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1142 : Poly :=
[
  term ((2437120 : Rat) / 12247399) [(11, 2), (14, 2)]
]

/-- Partial product 1142 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1142 : Poly :=
[
  term ((4874240 : Rat) / 12247399) [(8, 1), (11, 2), (14, 2)],
  term ((-2437120 : Rat) / 12247399) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1142_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1142
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1143 : Poly :=
[
  term ((-26024960 : Rat) / 36742197) [(11, 2), (15, 2)]
]

/-- Partial product 1143 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1143 : Poly :=
[
  term ((-52049920 : Rat) / 36742197) [(8, 1), (11, 2), (15, 2)],
  term ((26024960 : Rat) / 36742197) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1143_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1143
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1144 : Poly :=
[
  term ((48742400 : Rat) / 110226591) [(11, 3), (15, 1)]
]

/-- Partial product 1144 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1144 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(8, 1), (11, 3), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1144_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1144
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1145 : Poly :=
[
  term ((54 : Rat) / 67) [(12, 1)]
]

/-- Partial product 1145 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1145 : Poly :=
[
  term ((108 : Rat) / 67) [(8, 1), (12, 1)],
  term ((-54 : Rat) / 67) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1145_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1145
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1146 : Poly :=
[
  term ((-1311665768 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1146 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1146 : Poly :=
[
  term ((-2623331536 : Rat) / 330679773) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1146_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1146
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1147 : Poly :=
[
  term ((-1969721246 : Rat) / 330679773) [(13, 1), (15, 1)]
]

/-- Partial product 1147 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1147 : Poly :=
[
  term ((-3939442492 : Rat) / 330679773) [(8, 1), (13, 1), (15, 1)],
  term ((1969721246 : Rat) / 330679773) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1147_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1147
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1148 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(13, 1), (15, 3)]
]

/-- Partial product 1148 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1148 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(8, 1), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1148_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1148
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1149 : Poly :=
[
  term ((35668129 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 1149 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1149 : Poly :=
[
  term ((71336258 : Rat) / 12247399) [(8, 1), (13, 2)],
  term ((-35668129 : Rat) / 12247399) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1149_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1149
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1150 : Poly :=
[
  term ((16569700 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 1150 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1150 : Poly :=
[
  term ((33139400 : Rat) / 12247399) [(8, 1), (13, 2), (14, 1)],
  term ((-16569700 : Rat) / 12247399) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1150_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1150
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1151 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 1151 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1151 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(8, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1151_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1151
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1152 : Poly :=
[
  term ((111 : Rat) / 67) [(14, 1)]
]

/-- Partial product 1152 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1152 : Poly :=
[
  term ((222 : Rat) / 67) [(8, 1), (14, 1)],
  term ((-111 : Rat) / 67) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1152_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1152
        rs_R009_ueqv_R009NNNYN_generator_19_1100_1152 =
      rs_R009_ueqv_R009NNNYN_partial_19_1152 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_1100_1152 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_1100,
  rs_R009_ueqv_R009NNNYN_partial_19_1101,
  rs_R009_ueqv_R009NNNYN_partial_19_1102,
  rs_R009_ueqv_R009NNNYN_partial_19_1103,
  rs_R009_ueqv_R009NNNYN_partial_19_1104,
  rs_R009_ueqv_R009NNNYN_partial_19_1105,
  rs_R009_ueqv_R009NNNYN_partial_19_1106,
  rs_R009_ueqv_R009NNNYN_partial_19_1107,
  rs_R009_ueqv_R009NNNYN_partial_19_1108,
  rs_R009_ueqv_R009NNNYN_partial_19_1109,
  rs_R009_ueqv_R009NNNYN_partial_19_1110,
  rs_R009_ueqv_R009NNNYN_partial_19_1111,
  rs_R009_ueqv_R009NNNYN_partial_19_1112,
  rs_R009_ueqv_R009NNNYN_partial_19_1113,
  rs_R009_ueqv_R009NNNYN_partial_19_1114,
  rs_R009_ueqv_R009NNNYN_partial_19_1115,
  rs_R009_ueqv_R009NNNYN_partial_19_1116,
  rs_R009_ueqv_R009NNNYN_partial_19_1117,
  rs_R009_ueqv_R009NNNYN_partial_19_1118,
  rs_R009_ueqv_R009NNNYN_partial_19_1119,
  rs_R009_ueqv_R009NNNYN_partial_19_1120,
  rs_R009_ueqv_R009NNNYN_partial_19_1121,
  rs_R009_ueqv_R009NNNYN_partial_19_1122,
  rs_R009_ueqv_R009NNNYN_partial_19_1123,
  rs_R009_ueqv_R009NNNYN_partial_19_1124,
  rs_R009_ueqv_R009NNNYN_partial_19_1125,
  rs_R009_ueqv_R009NNNYN_partial_19_1126,
  rs_R009_ueqv_R009NNNYN_partial_19_1127,
  rs_R009_ueqv_R009NNNYN_partial_19_1128,
  rs_R009_ueqv_R009NNNYN_partial_19_1129,
  rs_R009_ueqv_R009NNNYN_partial_19_1130,
  rs_R009_ueqv_R009NNNYN_partial_19_1131,
  rs_R009_ueqv_R009NNNYN_partial_19_1132,
  rs_R009_ueqv_R009NNNYN_partial_19_1133,
  rs_R009_ueqv_R009NNNYN_partial_19_1134,
  rs_R009_ueqv_R009NNNYN_partial_19_1135,
  rs_R009_ueqv_R009NNNYN_partial_19_1136,
  rs_R009_ueqv_R009NNNYN_partial_19_1137,
  rs_R009_ueqv_R009NNNYN_partial_19_1138,
  rs_R009_ueqv_R009NNNYN_partial_19_1139,
  rs_R009_ueqv_R009NNNYN_partial_19_1140,
  rs_R009_ueqv_R009NNNYN_partial_19_1141,
  rs_R009_ueqv_R009NNNYN_partial_19_1142,
  rs_R009_ueqv_R009NNNYN_partial_19_1143,
  rs_R009_ueqv_R009NNNYN_partial_19_1144,
  rs_R009_ueqv_R009NNNYN_partial_19_1145,
  rs_R009_ueqv_R009NNNYN_partial_19_1146,
  rs_R009_ueqv_R009NNNYN_partial_19_1147,
  rs_R009_ueqv_R009NNNYN_partial_19_1148,
  rs_R009_ueqv_R009NNNYN_partial_19_1149,
  rs_R009_ueqv_R009NNNYN_partial_19_1150,
  rs_R009_ueqv_R009NNNYN_partial_19_1151,
  rs_R009_ueqv_R009NNNYN_partial_19_1152
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_1100_1152 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(8, 1), (9, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((175 : Rat) / 67) [(8, 1), (10, 1)],
  term ((38993920 : Rat) / 36742197) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-154480793264 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((2741760 : Rat) / 12247399) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-86865920 : Rat) / 110226591) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((328361908744 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-357395842048 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 2)],
  term ((19496960 : Rat) / 36742197) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((36 : Rat) / 67) [(8, 1), (10, 1), (12, 1)],
  term ((5483520 : Rat) / 12247399) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1599360 : Rat) / 12247399) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28581760 : Rat) / 110226591) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(8, 1), (10, 1), (13, 2)],
  term ((123 : Rat) / 67) [(8, 1), (10, 1), (14, 1)],
  term ((30768640 : Rat) / 110226591) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((82518802 : Rat) / 110226591) [(8, 1), (10, 1), (15, 2)],
  term ((60 : Rat) / 67) [(8, 1), (10, 2)],
  term ((38993920 : Rat) / 110226591) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(8, 1), (10, 2), (15, 2)],
  term ((-4569600 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((13708800 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-87910400 : Rat) / 36742197) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((102115487587 : Rat) / 31414578435) [(8, 1), (11, 1), (13, 1)],
  term ((1596560000 : Rat) / 330679773) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((2056320 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-243603200 : Rat) / 110226591) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((212392246 : Rat) / 110226591) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4395520 : Rat) / 12247399) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((2342994223004 : Rat) / 94243735305) [(8, 1), (11, 1), (15, 1)],
  term ((61537280 : Rat) / 110226591) [(8, 1), (11, 1), (15, 3)],
  term ((-37519021444 : Rat) / 1406622915) [(8, 1), (11, 2)],
  term ((-97484800 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1)],
  term ((97484800 : Rat) / 36742197) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((236096000 : Rat) / 110226591) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-414310400 : Rat) / 110226591) [(8, 1), (11, 2), (14, 1)],
  term ((4874240 : Rat) / 12247399) [(8, 1), (11, 2), (14, 2)],
  term ((-52049920 : Rat) / 36742197) [(8, 1), (11, 2), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(8, 1), (11, 3), (15, 1)],
  term ((108 : Rat) / 67) [(8, 1), (12, 1)],
  term ((-2623331536 : Rat) / 330679773) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3939442492 : Rat) / 330679773) [(8, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(8, 1), (13, 1), (15, 3)],
  term ((71336258 : Rat) / 12247399) [(8, 1), (13, 2)],
  term ((33139400 : Rat) / 12247399) [(8, 1), (13, 2), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(8, 1), (13, 2), (15, 2)],
  term ((222 : Rat) / 67) [(8, 1), (14, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(9, 2), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)],
  term ((-175 : Rat) / 134) [(10, 1)],
  term ((-19496960 : Rat) / 36742197) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((77240396632 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1)],
  term ((-1370880 : Rat) / 12247399) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((43432960 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-164180954372 : Rat) / 10471526145) [(10, 1), (11, 1), (15, 1)],
  term ((178697921024 : Rat) / 10471526145) [(10, 1), (11, 2)],
  term ((-9748480 : Rat) / 36742197) [(10, 1), (11, 2), (14, 1)],
  term ((-18 : Rat) / 67) [(10, 1), (12, 1)],
  term ((-2741760 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(10, 1), (12, 1), (15, 2)],
  term ((799680 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((14290880 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 2)],
  term ((-123 : Rat) / 134) [(10, 1), (14, 1)],
  term ((-15384320 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)],
  term ((-41259401 : Rat) / 110226591) [(10, 1), (15, 2)],
  term ((-30 : Rat) / 67) [(10, 2)],
  term ((-19496960 : Rat) / 110226591) [(10, 2), (11, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(10, 2), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(10, 2), (15, 2)],
  term ((2284800 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)],
  term ((-6854400 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((43955200 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)],
  term ((-102115487587 : Rat) / 62829156870) [(11, 1), (13, 1)],
  term ((-798280000 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)],
  term ((-1028160 : Rat) / 12247399) [(11, 1), (13, 1), (14, 2)],
  term ((121801600 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)],
  term ((-4569600 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)],
  term ((-106196123 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)],
  term ((2197760 : Rat) / 12247399) [(11, 1), (14, 2), (15, 1)],
  term ((-1171497111502 : Rat) / 94243735305) [(11, 1), (15, 1)],
  term ((-30768640 : Rat) / 110226591) [(11, 1), (15, 3)],
  term ((18759510722 : Rat) / 1406622915) [(11, 2)],
  term ((48742400 : Rat) / 110226591) [(11, 2), (12, 1)],
  term ((-48742400 : Rat) / 36742197) [(11, 2), (12, 1), (14, 1)],
  term ((-118048000 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)],
  term ((207155200 : Rat) / 110226591) [(11, 2), (14, 1)],
  term ((-2437120 : Rat) / 12247399) [(11, 2), (14, 2)],
  term ((26024960 : Rat) / 36742197) [(11, 2), (15, 2)],
  term ((-48742400 : Rat) / 110226591) [(11, 3), (15, 1)],
  term ((-54 : Rat) / 67) [(12, 1)],
  term ((1311665768 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)],
  term ((1969721246 : Rat) / 330679773) [(13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(13, 1), (15, 3)],
  term ((-35668129 : Rat) / 12247399) [(13, 2)],
  term ((-16569700 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((913920 : Rat) / 12247399) [(13, 2), (15, 2)],
  term ((-111 : Rat) / 67) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1100 through 1152. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_1100_1152_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_1100_1152
      rs_R009_ueqv_R009NNNYN_block_19_1100_1152 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
