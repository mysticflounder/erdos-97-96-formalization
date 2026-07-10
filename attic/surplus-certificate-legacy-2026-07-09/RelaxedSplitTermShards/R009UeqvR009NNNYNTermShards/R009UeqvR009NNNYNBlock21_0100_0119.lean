/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 21:100-119

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0100 : Poly :=
[
  term ((98 : Rat) / 67) [(9, 2), (14, 1)]
]

/-- Partial product 100 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0100 : Poly :=
[
  term ((196 : Rat) / 67) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((-98 : Rat) / 67) [(9, 2), (10, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(9, 2), (11, 2), (14, 1)],
  term ((196 : Rat) / 67) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0100
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0101 : Poly :=
[
  term ((-30 : Rat) / 67) [(10, 1)]
]

/-- Partial product 101 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0101 : Poly :=
[
  term ((-60 : Rat) / 67) [(8, 1), (10, 2)],
  term ((-60 : Rat) / 67) [(9, 1), (10, 1), (11, 1)],
  term ((30 : Rat) / 67) [(10, 1), (11, 2)],
  term ((30 : Rat) / 67) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0101
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0102 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 102 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0102 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 3), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0102
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0103 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 103 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0103 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0103
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0104 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(10, 1), (15, 2)]
]

/-- Partial product 104 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0104 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(8, 1), (10, 2), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (11, 2), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0104
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0105 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 105 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0105 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0105
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0106 : Poly :=
[
  term ((40815776771 : Rat) / 6981017430) [(11, 1), (13, 1)]
]

/-- Partial product 106 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0106 : Poly :=
[
  term ((40815776771 : Rat) / 3490508715) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((40815776771 : Rat) / 3490508715) [(9, 1), (11, 2), (13, 1)],
  term ((-40815776771 : Rat) / 6981017430) [(10, 2), (11, 1), (13, 1)],
  term ((-40815776771 : Rat) / 6981017430) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0106
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0107 : Poly :=
[
  term ((-1370880 : Rat) / 12247399) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 107 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0107 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((1370880 : Rat) / 12247399) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((1370880 : Rat) / 12247399) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0107
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0108 : Poly :=
[
  term ((43432960 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 108 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0108 : Poly :=
[
  term ((86865920 : Rat) / 110226591) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((86865920 : Rat) / 110226591) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-43432960 : Rat) / 110226591) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-43432960 : Rat) / 110226591) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0108
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0109 : Poly :=
[
  term ((-1136205676451 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 109 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0109 : Poly :=
[
  term ((-2272411352902 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2272411352902 : Rat) / 94243735305) [(9, 1), (11, 2), (15, 1)],
  term ((1136205676451 : Rat) / 94243735305) [(10, 2), (11, 1), (15, 1)],
  term ((1136205676451 : Rat) / 94243735305) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0109
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0110 : Poly :=
[
  term ((1306104856672 : Rat) / 94243735305) [(11, 2)]
]

/-- Partial product 110 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0110 : Poly :=
[
  term ((2612209713344 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 2)],
  term ((2612209713344 : Rat) / 94243735305) [(9, 1), (11, 3)],
  term ((-1306104856672 : Rat) / 94243735305) [(10, 2), (11, 2)],
  term ((-1306104856672 : Rat) / 94243735305) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0110
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0111 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(11, 2), (14, 1)]
]

/-- Partial product 111 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0111 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 3), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(10, 2), (11, 2), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0111
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0112 : Poly :=
[
  term ((-18 : Rat) / 67) [(12, 1)]
]

/-- Partial product 112 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0112 : Poly :=
[
  term ((-36 : Rat) / 67) [(8, 1), (10, 1), (12, 1)],
  term ((-36 : Rat) / 67) [(9, 1), (11, 1), (12, 1)],
  term ((18 : Rat) / 67) [(10, 2), (12, 1)],
  term ((18 : Rat) / 67) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0112
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0113 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 113 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0113 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0113
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0114 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(12, 1), (15, 2)]
]

/-- Partial product 114 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0114 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((35164160 : Rat) / 36742197) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(10, 2), (12, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0114
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0115 : Poly :=
[
  term ((799680 : Rat) / 12247399) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 115 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0115 : Poly :=
[
  term ((1599360 : Rat) / 12247399) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1599360 : Rat) / 12247399) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-799680 : Rat) / 12247399) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-799680 : Rat) / 12247399) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0115
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0116 : Poly :=
[
  term ((3541440 : Rat) / 12247399) [(13, 1), (15, 1)]
]

/-- Partial product 116 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0116 : Poly :=
[
  term ((7082880 : Rat) / 12247399) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((7082880 : Rat) / 12247399) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3541440 : Rat) / 12247399) [(10, 2), (13, 1), (15, 1)],
  term ((-3541440 : Rat) / 12247399) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0116
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0117 : Poly :=
[
  term ((-123 : Rat) / 134) [(14, 1)]
]

/-- Partial product 117 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0117 : Poly :=
[
  term ((-123 : Rat) / 67) [(8, 1), (10, 1), (14, 1)],
  term ((-123 : Rat) / 67) [(9, 1), (11, 1), (14, 1)],
  term ((123 : Rat) / 134) [(10, 2), (14, 1)],
  term ((123 : Rat) / 134) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0117
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0118 : Poly :=
[
  term ((-15384320 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 118 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0118 : Poly :=
[
  term ((-30768640 : Rat) / 110226591) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-30768640 : Rat) / 110226591) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((15384320 : Rat) / 110226591) [(10, 2), (14, 1), (15, 2)],
  term ((15384320 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0118
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0119 : Poly :=
[
  term ((-41259401 : Rat) / 110226591) [(15, 2)]
]

/-- Partial product 119 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0119 : Poly :=
[
  term ((-82518802 : Rat) / 110226591) [(8, 1), (10, 1), (15, 2)],
  term ((-82518802 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)],
  term ((41259401 : Rat) / 110226591) [(10, 2), (15, 2)],
  term ((41259401 : Rat) / 110226591) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0119
        rs_R009_ueqv_R009NNNYN_generator_21_0100_0119 =
      rs_R009_ueqv_R009NNNYN_partial_21_0119 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_21_0100_0119 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_21_0100,
  rs_R009_ueqv_R009NNNYN_partial_21_0101,
  rs_R009_ueqv_R009NNNYN_partial_21_0102,
  rs_R009_ueqv_R009NNNYN_partial_21_0103,
  rs_R009_ueqv_R009NNNYN_partial_21_0104,
  rs_R009_ueqv_R009NNNYN_partial_21_0105,
  rs_R009_ueqv_R009NNNYN_partial_21_0106,
  rs_R009_ueqv_R009NNNYN_partial_21_0107,
  rs_R009_ueqv_R009NNNYN_partial_21_0108,
  rs_R009_ueqv_R009NNNYN_partial_21_0109,
  rs_R009_ueqv_R009NNNYN_partial_21_0110,
  rs_R009_ueqv_R009NNNYN_partial_21_0111,
  rs_R009_ueqv_R009NNNYN_partial_21_0112,
  rs_R009_ueqv_R009NNNYN_partial_21_0113,
  rs_R009_ueqv_R009NNNYN_partial_21_0114,
  rs_R009_ueqv_R009NNNYN_partial_21_0115,
  rs_R009_ueqv_R009NNNYN_partial_21_0116,
  rs_R009_ueqv_R009NNNYN_partial_21_0117,
  rs_R009_ueqv_R009NNNYN_partial_21_0118,
  rs_R009_ueqv_R009NNNYN_partial_21_0119
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_21_0100_0119 : Poly :=
[
  term ((196 : Rat) / 67) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((40815776771 : Rat) / 3490508715) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2741760 : Rat) / 12247399) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((86865920 : Rat) / 110226591) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2272411352902 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((2612209713344 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 2)],
  term ((-19496960 : Rat) / 36742197) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-36 : Rat) / 67) [(8, 1), (10, 1), (12, 1)],
  term ((-5483520 : Rat) / 12247399) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((1599360 : Rat) / 12247399) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((7082880 : Rat) / 12247399) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-123 : Rat) / 67) [(8, 1), (10, 1), (14, 1)],
  term ((-30768640 : Rat) / 110226591) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-82518802 : Rat) / 110226591) [(8, 1), (10, 1), (15, 2)],
  term ((-60 : Rat) / 67) [(8, 1), (10, 2)],
  term ((-38993920 : Rat) / 110226591) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(8, 1), (10, 2), (15, 2)],
  term ((-60 : Rat) / 67) [(9, 1), (10, 1), (11, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-36 : Rat) / 67) [(9, 1), (11, 1), (12, 1)],
  term ((-5483520 : Rat) / 12247399) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((1599360 : Rat) / 12247399) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7082880 : Rat) / 12247399) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-123 : Rat) / 67) [(9, 1), (11, 1), (14, 1)],
  term ((-30768640 : Rat) / 110226591) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-82518802 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((40815776771 : Rat) / 3490508715) [(9, 1), (11, 2), (13, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((86865920 : Rat) / 110226591) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2272411352902 : Rat) / 94243735305) [(9, 1), (11, 2), (15, 1)],
  term ((2612209713344 : Rat) / 94243735305) [(9, 1), (11, 3)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 3), (14, 1)],
  term ((-98 : Rat) / 67) [(9, 2), (10, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(9, 2), (11, 2), (14, 1)],
  term ((196 : Rat) / 67) [(9, 3), (11, 1), (14, 1)],
  term ((30 : Rat) / 67) [(10, 1), (11, 2)],
  term ((913920 : Rat) / 12247399) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (11, 2), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 3), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-40815776771 : Rat) / 6981017430) [(10, 2), (11, 1), (13, 1)],
  term ((1370880 : Rat) / 12247399) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-43432960 : Rat) / 110226591) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((1136205676451 : Rat) / 94243735305) [(10, 2), (11, 1), (15, 1)],
  term ((-1306104856672 : Rat) / 94243735305) [(10, 2), (11, 2)],
  term ((9748480 : Rat) / 36742197) [(10, 2), (11, 2), (14, 1)],
  term ((18 : Rat) / 67) [(10, 2), (12, 1)],
  term ((2741760 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(10, 2), (12, 1), (15, 2)],
  term ((-799680 : Rat) / 12247399) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3541440 : Rat) / 12247399) [(10, 2), (13, 1), (15, 1)],
  term ((123 : Rat) / 134) [(10, 2), (14, 1)],
  term ((15384320 : Rat) / 110226591) [(10, 2), (14, 1), (15, 2)],
  term ((41259401 : Rat) / 110226591) [(10, 2), (15, 2)],
  term ((30 : Rat) / 67) [(10, 3)],
  term ((19496960 : Rat) / 110226591) [(10, 3), (11, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 3), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(10, 3), (15, 2)],
  term ((18 : Rat) / 67) [(11, 2), (12, 1)],
  term ((2741760 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(11, 2), (12, 1), (15, 2)],
  term ((-799680 : Rat) / 12247399) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3541440 : Rat) / 12247399) [(11, 2), (13, 1), (15, 1)],
  term ((123 : Rat) / 134) [(11, 2), (14, 1)],
  term ((15384320 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)],
  term ((41259401 : Rat) / 110226591) [(11, 2), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(11, 3), (12, 1), (15, 1)],
  term ((-40815776771 : Rat) / 6981017430) [(11, 3), (13, 1)],
  term ((1370880 : Rat) / 12247399) [(11, 3), (13, 1), (14, 1)],
  term ((-43432960 : Rat) / 110226591) [(11, 3), (14, 1), (15, 1)],
  term ((1136205676451 : Rat) / 94243735305) [(11, 3), (15, 1)],
  term ((-1306104856672 : Rat) / 94243735305) [(11, 4)],
  term ((9748480 : Rat) / 36742197) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 119. -/
theorem rs_R009_ueqv_R009NNNYN_block_21_0100_0119_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_21_0100_0119
      rs_R009_ueqv_R009NNNYN_block_21_0100_0119 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
