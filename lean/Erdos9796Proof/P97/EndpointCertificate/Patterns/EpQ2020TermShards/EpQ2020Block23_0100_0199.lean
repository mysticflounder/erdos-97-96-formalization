/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 23:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_23_0100_0199 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0100 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 23. -/
def ep_Q2_020_partial_23_0100 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 23. -/
theorem ep_Q2_020_partial_23_0100_valid :
    mulPoly ep_Q2_020_coefficient_23_0100
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0101 : Poly :=
[
  term ((200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 101 for generator 23. -/
def ep_Q2_020_partial_23_0101 : Poly :=
[
  term ((200042314802096763 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 23. -/
theorem ep_Q2_020_partial_23_0101_valid :
    mulPoly ep_Q2_020_coefficient_23_0101
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0102 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 102 for generator 23. -/
def ep_Q2_020_partial_23_0102 : Poly :=
[
  term ((742179327954631344 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 23. -/
theorem ep_Q2_020_partial_23_0102_valid :
    mulPoly ep_Q2_020_coefficient_23_0102
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0103 : Poly :=
[
  term ((-198348295900969719 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 103 for generator 23. -/
def ep_Q2_020_partial_23_0103 : Poly :=
[
  term ((-396696591801939438 : Rat) / 28298395017400811) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-396696591801939438 : Rat) / 28298395017400811) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((198348295900969719 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((198348295900969719 : Rat) / 28298395017400811) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 23. -/
theorem ep_Q2_020_partial_23_0103_valid :
    mulPoly ep_Q2_020_coefficient_23_0103
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0104 : Poly :=
[
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 104 for generator 23. -/
def ep_Q2_020_partial_23_0104 : Poly :=
[
  term ((135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 23. -/
theorem ep_Q2_020_partial_23_0104_valid :
    mulPoly ep_Q2_020_coefficient_23_0104
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0105 : Poly :=
[
  term ((80424576917094150 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 105 for generator 23. -/
def ep_Q2_020_partial_23_0105 : Poly :=
[
  term ((160849153834188300 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((160849153834188300 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-80424576917094150 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((-80424576917094150 : Rat) / 28298395017400811) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 23. -/
theorem ep_Q2_020_partial_23_0105_valid :
    mulPoly ep_Q2_020_coefficient_23_0105
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0106 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 106 for generator 23. -/
def ep_Q2_020_partial_23_0106 : Poly :=
[
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 23. -/
theorem ep_Q2_020_partial_23_0106_valid :
    mulPoly ep_Q2_020_coefficient_23_0106
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0107 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 23. -/
def ep_Q2_020_partial_23_0107 : Poly :=
[
  term ((-690727606191489504 : Rat) / 28298395017400811) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 23. -/
theorem ep_Q2_020_partial_23_0107_valid :
    mulPoly ep_Q2_020_coefficient_23_0107
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0108 : Poly :=
[
  term ((30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 23. -/
def ep_Q2_020_partial_23_0108 : Poly :=
[
  term ((61668711084931578 : Rat) / 975806724737959) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((61668711084931578 : Rat) / 975806724737959) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 23. -/
theorem ep_Q2_020_partial_23_0108_valid :
    mulPoly ep_Q2_020_coefficient_23_0108
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0109 : Poly :=
[
  term ((659239419967364391 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 109 for generator 23. -/
def ep_Q2_020_partial_23_0109 : Poly :=
[
  term ((1318478839934728782 : Rat) / 28298395017400811) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1318478839934728782 : Rat) / 28298395017400811) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-659239419967364391 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-659239419967364391 : Rat) / 28298395017400811) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 23. -/
theorem ep_Q2_020_partial_23_0109_valid :
    mulPoly ep_Q2_020_coefficient_23_0109
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0110 : Poly :=
[
  term ((228676022214586338 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 110 for generator 23. -/
def ep_Q2_020_partial_23_0110 : Poly :=
[
  term ((457352044429172676 : Rat) / 28298395017400811) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((457352044429172676 : Rat) / 28298395017400811) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-228676022214586338 : Rat) / 28298395017400811) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-228676022214586338 : Rat) / 28298395017400811) [(4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 23. -/
theorem ep_Q2_020_partial_23_0110_valid :
    mulPoly ep_Q2_020_coefficient_23_0110
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0111 : Poly :=
[
  term ((-168229351638173781 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 111 for generator 23. -/
def ep_Q2_020_partial_23_0111 : Poly :=
[
  term ((-336458703276347562 : Rat) / 28298395017400811) [(4, 2), (10, 1), (14, 1), (16, 1)],
  term ((-336458703276347562 : Rat) / 28298395017400811) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((168229351638173781 : Rat) / 28298395017400811) [(4, 2), (14, 2), (16, 1)],
  term ((168229351638173781 : Rat) / 28298395017400811) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 23. -/
theorem ep_Q2_020_partial_23_0111_valid :
    mulPoly ep_Q2_020_coefficient_23_0111
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0112 : Poly :=
[
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 112 for generator 23. -/
def ep_Q2_020_partial_23_0112 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 23. -/
theorem ep_Q2_020_partial_23_0112_valid :
    mulPoly ep_Q2_020_coefficient_23_0112
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0113 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 113 for generator 23. -/
def ep_Q2_020_partial_23_0113 : Poly :=
[
  term ((-152381362342933152 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-152381362342933152 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 23. -/
theorem ep_Q2_020_partial_23_0113_valid :
    mulPoly ep_Q2_020_coefficient_23_0113
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0114 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 23. -/
def ep_Q2_020_partial_23_0114 : Poly :=
[
  term ((138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 23. -/
theorem ep_Q2_020_partial_23_0114_valid :
    mulPoly ep_Q2_020_coefficient_23_0114
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0115 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 23. -/
def ep_Q2_020_partial_23_0115 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 23. -/
theorem ep_Q2_020_partial_23_0115_valid :
    mulPoly ep_Q2_020_coefficient_23_0115
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0116 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 116 for generator 23. -/
def ep_Q2_020_partial_23_0116 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (14, 2), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 23. -/
theorem ep_Q2_020_partial_23_0116_valid :
    mulPoly ep_Q2_020_coefficient_23_0116
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0117 : Poly :=
[
  term ((-17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 117 for generator 23. -/
def ep_Q2_020_partial_23_0117 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 23. -/
theorem ep_Q2_020_partial_23_0117_valid :
    mulPoly ep_Q2_020_coefficient_23_0117
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0118 : Poly :=
[
  term ((-9209642646655689 : Rat) / 1230365000756557) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 118 for generator 23. -/
def ep_Q2_020_partial_23_0118 : Poly :=
[
  term ((-18419285293311378 : Rat) / 1230365000756557) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-18419285293311378 : Rat) / 1230365000756557) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9209642646655689 : Rat) / 1230365000756557) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((9209642646655689 : Rat) / 1230365000756557) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 23. -/
theorem ep_Q2_020_partial_23_0118_valid :
    mulPoly ep_Q2_020_coefficient_23_0118
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0119 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 23. -/
def ep_Q2_020_partial_23_0119 : Poly :=
[
  term ((-171490471718940000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-171490471718940000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 23. -/
theorem ep_Q2_020_partial_23_0119_valid :
    mulPoly ep_Q2_020_coefficient_23_0119
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0120 : Poly :=
[
  term ((-92810652169791600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 23. -/
def ep_Q2_020_partial_23_0120 : Poly :=
[
  term ((-185621304339583200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((92810652169791600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((92810652169791600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-185621304339583200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 23. -/
theorem ep_Q2_020_partial_23_0120_valid :
    mulPoly ep_Q2_020_coefficient_23_0120
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0121 : Poly :=
[
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 121 for generator 23. -/
def ep_Q2_020_partial_23_0121 : Poly :=
[
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 23. -/
theorem ep_Q2_020_partial_23_0121_valid :
    mulPoly ep_Q2_020_coefficient_23_0121
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0122 : Poly :=
[
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 122 for generator 23. -/
def ep_Q2_020_partial_23_0122 : Poly :=
[
  term ((1172995315531099200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1172995315531099200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 23. -/
theorem ep_Q2_020_partial_23_0122_valid :
    mulPoly ep_Q2_020_coefficient_23_0122
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0123 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 23. -/
def ep_Q2_020_partial_23_0123 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 23. -/
theorem ep_Q2_020_partial_23_0123_valid :
    mulPoly ep_Q2_020_coefficient_23_0123
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0124 : Poly :=
[
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 124 for generator 23. -/
def ep_Q2_020_partial_23_0124 : Poly :=
[
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 23. -/
theorem ep_Q2_020_partial_23_0124_valid :
    mulPoly ep_Q2_020_coefficient_23_0124
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0125 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 23. -/
def ep_Q2_020_partial_23_0125 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 23. -/
theorem ep_Q2_020_partial_23_0125_valid :
    mulPoly ep_Q2_020_coefficient_23_0125
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0126 : Poly :=
[
  term ((-249005406371283717 : Rat) / 56596790034801622) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 126 for generator 23. -/
def ep_Q2_020_partial_23_0126 : Poly :=
[
  term ((-249005406371283717 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-249005406371283717 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((249005406371283717 : Rat) / 56596790034801622) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((249005406371283717 : Rat) / 56596790034801622) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 23. -/
theorem ep_Q2_020_partial_23_0126_valid :
    mulPoly ep_Q2_020_coefficient_23_0126
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0127 : Poly :=
[
  term ((25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 127 for generator 23. -/
def ep_Q2_020_partial_23_0127 : Poly :=
[
  term ((50793787447644384 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((50793787447644384 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 23. -/
theorem ep_Q2_020_partial_23_0127_valid :
    mulPoly ep_Q2_020_coefficient_23_0127
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0128 : Poly :=
[
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 23. -/
def ep_Q2_020_partial_23_0128 : Poly :=
[
  term ((-46176170406949440 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46176170406949440 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 23. -/
theorem ep_Q2_020_partial_23_0128_valid :
    mulPoly ep_Q2_020_coefficient_23_0128
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0129 : Poly :=
[
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 129 for generator 23. -/
def ep_Q2_020_partial_23_0129 : Poly :=
[
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 23. -/
theorem ep_Q2_020_partial_23_0129_valid :
    mulPoly ep_Q2_020_coefficient_23_0129
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0130 : Poly :=
[
  term ((2308808520347472 : Rat) / 1230365000756557) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 130 for generator 23. -/
def ep_Q2_020_partial_23_0130 : Poly :=
[
  term ((4617617040694944 : Rat) / 1230365000756557) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2308808520347472 : Rat) / 1230365000756557) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2308808520347472 : Rat) / 1230365000756557) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((4617617040694944 : Rat) / 1230365000756557) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 23. -/
theorem ep_Q2_020_partial_23_0130_valid :
    mulPoly ep_Q2_020_coefficient_23_0130
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0131 : Poly :=
[
  term ((151942651899750648 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 131 for generator 23. -/
def ep_Q2_020_partial_23_0131 : Poly :=
[
  term ((303885303799501296 : Rat) / 28298395017400811) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-151942651899750648 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-151942651899750648 : Rat) / 28298395017400811) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((303885303799501296 : Rat) / 28298395017400811) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 23. -/
theorem ep_Q2_020_partial_23_0131_valid :
    mulPoly ep_Q2_020_coefficient_23_0131
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0132 : Poly :=
[
  term ((512615005525976991 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 132 for generator 23. -/
def ep_Q2_020_partial_23_0132 : Poly :=
[
  term ((1025230011051953982 : Rat) / 28298395017400811) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1025230011051953982 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-512615005525976991 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-512615005525976991 : Rat) / 28298395017400811) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 23. -/
theorem ep_Q2_020_partial_23_0132_valid :
    mulPoly ep_Q2_020_coefficient_23_0132
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0133 : Poly :=
[
  term ((286973437353360006 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 23. -/
def ep_Q2_020_partial_23_0133 : Poly :=
[
  term ((573946874706720012 : Rat) / 28298395017400811) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((573946874706720012 : Rat) / 28298395017400811) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-286973437353360006 : Rat) / 28298395017400811) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-286973437353360006 : Rat) / 28298395017400811) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 23. -/
theorem ep_Q2_020_partial_23_0133_valid :
    mulPoly ep_Q2_020_coefficient_23_0133
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0134 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 134 for generator 23. -/
def ep_Q2_020_partial_23_0134 : Poly :=
[
  term ((152381362342933152 : Rat) / 28298395017400811) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((152381362342933152 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 23. -/
theorem ep_Q2_020_partial_23_0134_valid :
    mulPoly ep_Q2_020_coefficient_23_0134
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0135 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 23. -/
def ep_Q2_020_partial_23_0135 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 23. -/
theorem ep_Q2_020_partial_23_0135_valid :
    mulPoly ep_Q2_020_coefficient_23_0135
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0136 : Poly :=
[
  term ((-168229351638173781 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 136 for generator 23. -/
def ep_Q2_020_partial_23_0136 : Poly :=
[
  term ((-336458703276347562 : Rat) / 28298395017400811) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-336458703276347562 : Rat) / 28298395017400811) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((168229351638173781 : Rat) / 28298395017400811) [(5, 2), (14, 2), (16, 1)],
  term ((168229351638173781 : Rat) / 28298395017400811) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 23. -/
theorem ep_Q2_020_partial_23_0136_valid :
    mulPoly ep_Q2_020_coefficient_23_0136
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0137 : Poly :=
[
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 137 for generator 23. -/
def ep_Q2_020_partial_23_0137 : Poly :=
[
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 23. -/
theorem ep_Q2_020_partial_23_0137_valid :
    mulPoly ep_Q2_020_coefficient_23_0137
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0138 : Poly :=
[
  term ((-43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 138 for generator 23. -/
def ep_Q2_020_partial_23_0138 : Poly :=
[
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 23. -/
theorem ep_Q2_020_partial_23_0138_valid :
    mulPoly ep_Q2_020_coefficient_23_0138
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0139 : Poly :=
[
  term ((3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 139 for generator 23. -/
def ep_Q2_020_partial_23_0139 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 23. -/
theorem ep_Q2_020_partial_23_0139_valid :
    mulPoly ep_Q2_020_coefficient_23_0139
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0140 : Poly :=
[
  term ((71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 140 for generator 23. -/
def ep_Q2_020_partial_23_0140 : Poly :=
[
  term ((143926993881873840 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((143926993881873840 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 23. -/
theorem ep_Q2_020_partial_23_0140_valid :
    mulPoly ep_Q2_020_coefficient_23_0140
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0141 : Poly :=
[
  term ((-172712392658248608 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 141 for generator 23. -/
def ep_Q2_020_partial_23_0141 : Poly :=
[
  term ((-345424785316497216 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-345424785316497216 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 23. -/
theorem ep_Q2_020_partial_23_0141_valid :
    mulPoly ep_Q2_020_coefficient_23_0141
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0142 : Poly :=
[
  term ((-28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 2), (16, 1)]
]

/-- Partial product 142 for generator 23. -/
def ep_Q2_020_partial_23_0142 : Poly :=
[
  term ((-57570797552749536 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 2), (14, 2), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 23. -/
theorem ep_Q2_020_partial_23_0142_valid :
    mulPoly ep_Q2_020_coefficient_23_0142
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0143 : Poly :=
[
  term ((-21436308964867500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 143 for generator 23. -/
def ep_Q2_020_partial_23_0143 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 23. -/
theorem ep_Q2_020_partial_23_0143_valid :
    mulPoly ep_Q2_020_coefficient_23_0143
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0144 : Poly :=
[
  term ((-983715691841784 : Rat) / 1230365000756557) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 23. -/
def ep_Q2_020_partial_23_0144 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 23. -/
theorem ep_Q2_020_partial_23_0144_valid :
    mulPoly ep_Q2_020_coefficient_23_0144
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0145 : Poly :=
[
  term ((-1540723537949905221 : Rat) / 113193580069603244) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 145 for generator 23. -/
def ep_Q2_020_partial_23_0145 : Poly :=
[
  term ((-1540723537949905221 : Rat) / 56596790034801622) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 56596790034801622) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1540723537949905221 : Rat) / 113193580069603244) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((1540723537949905221 : Rat) / 113193580069603244) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 23. -/
theorem ep_Q2_020_partial_23_0145_valid :
    mulPoly ep_Q2_020_coefficient_23_0145
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0146 : Poly :=
[
  term ((1209704629024493385 : Rat) / 113193580069603244) [(6, 1), (16, 1)]
]

/-- Partial product 146 for generator 23. -/
def ep_Q2_020_partial_23_0146 : Poly :=
[
  term ((1209704629024493385 : Rat) / 56596790034801622) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((1209704629024493385 : Rat) / 56596790034801622) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1209704629024493385 : Rat) / 113193580069603244) [(6, 1), (14, 2), (16, 1)],
  term ((-1209704629024493385 : Rat) / 113193580069603244) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 23. -/
theorem ep_Q2_020_partial_23_0146_valid :
    mulPoly ep_Q2_020_coefficient_23_0146
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0147 : Poly :=
[
  term ((265130200483098927 : Rat) / 56596790034801622) [(6, 2), (16, 1)]
]

/-- Partial product 147 for generator 23. -/
def ep_Q2_020_partial_23_0147 : Poly :=
[
  term ((265130200483098927 : Rat) / 28298395017400811) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((265130200483098927 : Rat) / 28298395017400811) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-265130200483098927 : Rat) / 56596790034801622) [(6, 2), (14, 2), (16, 1)],
  term ((-265130200483098927 : Rat) / 56596790034801622) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 23. -/
theorem ep_Q2_020_partial_23_0147_valid :
    mulPoly ep_Q2_020_coefficient_23_0147
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0148 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 148 for generator 23. -/
def ep_Q2_020_partial_23_0148 : Poly :=
[
  term ((171490471718940000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((171490471718940000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 23. -/
theorem ep_Q2_020_partial_23_0148_valid :
    mulPoly ep_Q2_020_coefficient_23_0148
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0149 : Poly :=
[
  term ((3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 23. -/
def ep_Q2_020_partial_23_0149 : Poly :=
[
  term ((7869725534734272 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((7869725534734272 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 23. -/
theorem ep_Q2_020_partial_23_0149_valid :
    mulPoly ep_Q2_020_coefficient_23_0149
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0150 : Poly :=
[
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 150 for generator 23. -/
def ep_Q2_020_partial_23_0150 : Poly :=
[
  term ((-13973438316668256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13973438316668256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 23. -/
theorem ep_Q2_020_partial_23_0150_valid :
    mulPoly ep_Q2_020_coefficient_23_0150
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0151 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 23. -/
def ep_Q2_020_partial_23_0151 : Poly :=
[
  term ((-155900428835400000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 23. -/
theorem ep_Q2_020_partial_23_0151_valid :
    mulPoly ep_Q2_020_coefficient_23_0151
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0152 : Poly :=
[
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 152 for generator 23. -/
def ep_Q2_020_partial_23_0152 : Poly :=
[
  term ((-575680206406485024 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-575680206406485024 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 23. -/
theorem ep_Q2_020_partial_23_0152_valid :
    mulPoly ep_Q2_020_coefficient_23_0152
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0153 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 153 for generator 23. -/
def ep_Q2_020_partial_23_0153 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 23. -/
theorem ep_Q2_020_partial_23_0153_valid :
    mulPoly ep_Q2_020_coefficient_23_0153
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0154 : Poly :=
[
  term ((414875800304638710 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 154 for generator 23. -/
def ep_Q2_020_partial_23_0154 : Poly :=
[
  term ((829751600609277420 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((829751600609277420 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-414875800304638710 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-414875800304638710 : Rat) / 28298395017400811) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 23. -/
theorem ep_Q2_020_partial_23_0154_valid :
    mulPoly ep_Q2_020_coefficient_23_0154
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0155 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 155 for generator 23. -/
def ep_Q2_020_partial_23_0155 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 23. -/
theorem ep_Q2_020_partial_23_0155_valid :
    mulPoly ep_Q2_020_coefficient_23_0155
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0156 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 156 for generator 23. -/
def ep_Q2_020_partial_23_0156 : Poly :=
[
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 23. -/
theorem ep_Q2_020_partial_23_0156_valid :
    mulPoly ep_Q2_020_coefficient_23_0156
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0157 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 23. -/
def ep_Q2_020_partial_23_0157 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 23. -/
theorem ep_Q2_020_partial_23_0157_valid :
    mulPoly ep_Q2_020_coefficient_23_0157
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0158 : Poly :=
[
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 158 for generator 23. -/
def ep_Q2_020_partial_23_0158 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 23. -/
theorem ep_Q2_020_partial_23_0158_valid :
    mulPoly ep_Q2_020_coefficient_23_0158
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0159 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 23. -/
def ep_Q2_020_partial_23_0159 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 23. -/
theorem ep_Q2_020_partial_23_0159_valid :
    mulPoly ep_Q2_020_coefficient_23_0159
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0160 : Poly :=
[
  term ((-212910917530741782 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 160 for generator 23. -/
def ep_Q2_020_partial_23_0160 : Poly :=
[
  term ((-425821835061483564 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((212910917530741782 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((212910917530741782 : Rat) / 28298395017400811) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-425821835061483564 : Rat) / 28298395017400811) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 23. -/
theorem ep_Q2_020_partial_23_0160_valid :
    mulPoly ep_Q2_020_coefficient_23_0160
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0161 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 161 for generator 23. -/
def ep_Q2_020_partial_23_0161 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 23. -/
theorem ep_Q2_020_partial_23_0161_valid :
    mulPoly ep_Q2_020_coefficient_23_0161
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0162 : Poly :=
[
  term ((-1967431383683568 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 23. -/
def ep_Q2_020_partial_23_0162 : Poly :=
[
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 23. -/
theorem ep_Q2_020_partial_23_0162_valid :
    mulPoly ep_Q2_020_coefficient_23_0162
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0163 : Poly :=
[
  term ((19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 163 for generator 23. -/
def ep_Q2_020_partial_23_0163 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 23. -/
theorem ep_Q2_020_partial_23_0163_valid :
    mulPoly ep_Q2_020_coefficient_23_0163
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0164 : Poly :=
[
  term ((-1582074881556375477 : Rat) / 113193580069603244) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 164 for generator 23. -/
def ep_Q2_020_partial_23_0164 : Poly :=
[
  term ((-1582074881556375477 : Rat) / 56596790034801622) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1582074881556375477 : Rat) / 56596790034801622) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1582074881556375477 : Rat) / 113193580069603244) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((1582074881556375477 : Rat) / 113193580069603244) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 23. -/
theorem ep_Q2_020_partial_23_0164_valid :
    mulPoly ep_Q2_020_coefficient_23_0164
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0165 : Poly :=
[
  term ((894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 23. -/
def ep_Q2_020_partial_23_0165 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 23. -/
theorem ep_Q2_020_partial_23_0165_valid :
    mulPoly ep_Q2_020_coefficient_23_0165
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0166 : Poly :=
[
  term ((-155032639955766252 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 23. -/
def ep_Q2_020_partial_23_0166 : Poly :=
[
  term ((-310065279911532504 : Rat) / 28298395017400811) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-310065279911532504 : Rat) / 28298395017400811) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((155032639955766252 : Rat) / 28298395017400811) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((155032639955766252 : Rat) / 28298395017400811) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 23. -/
theorem ep_Q2_020_partial_23_0166_valid :
    mulPoly ep_Q2_020_coefficient_23_0166
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0167 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 167 for generator 23. -/
def ep_Q2_020_partial_23_0167 : Poly :=
[
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 23. -/
theorem ep_Q2_020_partial_23_0167_valid :
    mulPoly ep_Q2_020_coefficient_23_0167
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0168 : Poly :=
[
  term ((-383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 168 for generator 23. -/
def ep_Q2_020_partial_23_0168 : Poly :=
[
  term ((-767573608541980032 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-767573608541980032 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 2), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 23. -/
theorem ep_Q2_020_partial_23_0168_valid :
    mulPoly ep_Q2_020_coefficient_23_0168
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0169 : Poly :=
[
  term ((212361597579913575 : Rat) / 56596790034801622) [(7, 2), (16, 1)]
]

/-- Partial product 169 for generator 23. -/
def ep_Q2_020_partial_23_0169 : Poly :=
[
  term ((212361597579913575 : Rat) / 28298395017400811) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((212361597579913575 : Rat) / 28298395017400811) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-212361597579913575 : Rat) / 56596790034801622) [(7, 2), (14, 2), (16, 1)],
  term ((-212361597579913575 : Rat) / 56596790034801622) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 23. -/
theorem ep_Q2_020_partial_23_0169_valid :
    mulPoly ep_Q2_020_coefficient_23_0169
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0170 : Poly :=
[
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 170 for generator 23. -/
def ep_Q2_020_partial_23_0170 : Poly :=
[
  term ((-13490823602297016 : Rat) / 975806724737959) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 23. -/
theorem ep_Q2_020_partial_23_0170_valid :
    mulPoly ep_Q2_020_coefficient_23_0170
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0171 : Poly :=
[
  term ((-276751775050837038 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 171 for generator 23. -/
def ep_Q2_020_partial_23_0171 : Poly :=
[
  term ((-553503550101674076 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-553503550101674076 : Rat) / 28298395017400811) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((276751775050837038 : Rat) / 28298395017400811) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((276751775050837038 : Rat) / 28298395017400811) [(8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 23. -/
theorem ep_Q2_020_partial_23_0171_valid :
    mulPoly ep_Q2_020_coefficient_23_0171
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0172 : Poly :=
[
  term ((218445336492294591 : Rat) / 28298395017400811) [(8, 1), (16, 1)]
]

/-- Partial product 172 for generator 23. -/
def ep_Q2_020_partial_23_0172 : Poly :=
[
  term ((436890672984589182 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((436890672984589182 : Rat) / 28298395017400811) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-218445336492294591 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)],
  term ((-218445336492294591 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 23. -/
theorem ep_Q2_020_partial_23_0172_valid :
    mulPoly ep_Q2_020_coefficient_23_0172
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0173 : Poly :=
[
  term ((2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 23. -/
def ep_Q2_020_partial_23_0173 : Poly :=
[
  term ((5196680961180000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((5196680961180000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 23. -/
theorem ep_Q2_020_partial_23_0173_valid :
    mulPoly ep_Q2_020_coefficient_23_0173
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0174 : Poly :=
[
  term ((119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 23. -/
def ep_Q2_020_partial_23_0174 : Poly :=
[
  term ((238476531355584 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((238476531355584 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 23. -/
theorem ep_Q2_020_partial_23_0174_valid :
    mulPoly ep_Q2_020_coefficient_23_0174
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0175 : Poly :=
[
  term ((-4044046716348529469 : Rat) / 56596790034801622) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 175 for generator 23. -/
def ep_Q2_020_partial_23_0175 : Poly :=
[
  term ((-4044046716348529469 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((4044046716348529469 : Rat) / 56596790034801622) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((4044046716348529469 : Rat) / 56596790034801622) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4044046716348529469 : Rat) / 28298395017400811) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 23. -/
theorem ep_Q2_020_partial_23_0175_valid :
    mulPoly ep_Q2_020_coefficient_23_0175
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0176 : Poly :=
[
  term ((14290872643245000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 176 for generator 23. -/
def ep_Q2_020_partial_23_0176 : Poly :=
[
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 23. -/
theorem ep_Q2_020_partial_23_0176_valid :
    mulPoly ep_Q2_020_coefficient_23_0176
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0177 : Poly :=
[
  term ((655810461227856 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 23. -/
def ep_Q2_020_partial_23_0177 : Poly :=
[
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 23. -/
theorem ep_Q2_020_partial_23_0177_valid :
    mulPoly ep_Q2_020_coefficient_23_0177
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0178 : Poly :=
[
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 178 for generator 23. -/
def ep_Q2_020_partial_23_0178 : Poly :=
[
  term ((-64008448354759680 : Rat) / 1230365000756557) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64008448354759680 : Rat) / 1230365000756557) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 23. -/
theorem ep_Q2_020_partial_23_0178_valid :
    mulPoly ep_Q2_020_coefficient_23_0178
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0179 : Poly :=
[
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 23. -/
def ep_Q2_020_partial_23_0179 : Poly :=
[
  term ((812746647284472000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((812746647284472000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 23. -/
theorem ep_Q2_020_partial_23_0179_valid :
    mulPoly ep_Q2_020_coefficient_23_0179
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0180 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 180 for generator 23. -/
def ep_Q2_020_partial_23_0180 : Poly :=
[
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 23. -/
theorem ep_Q2_020_partial_23_0180_valid :
    mulPoly ep_Q2_020_coefficient_23_0180
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0181 : Poly :=
[
  term ((13501085854476021 : Rat) / 3903226898951836) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 181 for generator 23. -/
def ep_Q2_020_partial_23_0181 : Poly :=
[
  term ((13501085854476021 : Rat) / 1951613449475918) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((13501085854476021 : Rat) / 1951613449475918) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13501085854476021 : Rat) / 3903226898951836) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13501085854476021 : Rat) / 3903226898951836) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 23. -/
theorem ep_Q2_020_partial_23_0181_valid :
    mulPoly ep_Q2_020_coefficient_23_0181
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0182 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 23. -/
def ep_Q2_020_partial_23_0182 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 23. -/
theorem ep_Q2_020_partial_23_0182_valid :
    mulPoly ep_Q2_020_coefficient_23_0182
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0183 : Poly :=
[
  term ((-1342519897938352764 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 23. -/
def ep_Q2_020_partial_23_0183 : Poly :=
[
  term ((-2685039795876705528 : Rat) / 28298395017400811) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2685039795876705528 : Rat) / 28298395017400811) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1342519897938352764 : Rat) / 28298395017400811) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1342519897938352764 : Rat) / 28298395017400811) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 23. -/
theorem ep_Q2_020_partial_23_0183_valid :
    mulPoly ep_Q2_020_coefficient_23_0183
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0184 : Poly :=
[
  term ((-28581745286490000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 184 for generator 23. -/
def ep_Q2_020_partial_23_0184 : Poly :=
[
  term ((-57163490572980000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57163490572980000 : Rat) / 28298395017400811) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 23. -/
theorem ep_Q2_020_partial_23_0184_valid :
    mulPoly ep_Q2_020_coefficient_23_0184
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0185 : Poly :=
[
  term ((-1311620922455712 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 23. -/
def ep_Q2_020_partial_23_0185 : Poly :=
[
  term ((-2623241844911424 : Rat) / 1230365000756557) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2623241844911424 : Rat) / 1230365000756557) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 23. -/
theorem ep_Q2_020_partial_23_0185_valid :
    mulPoly ep_Q2_020_coefficient_23_0185
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0186 : Poly :=
[
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 23. -/
def ep_Q2_020_partial_23_0186 : Poly :=
[
  term ((51966809611800000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((51966809611800000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 23. -/
theorem ep_Q2_020_partial_23_0186_valid :
    mulPoly ep_Q2_020_coefficient_23_0186
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0187 : Poly :=
[
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 187 for generator 23. -/
def ep_Q2_020_partial_23_0187 : Poly :=
[
  term ((2384765313555840 : Rat) / 1230365000756557) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2384765313555840 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 23. -/
theorem ep_Q2_020_partial_23_0187_valid :
    mulPoly ep_Q2_020_coefficient_23_0187
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0188 : Poly :=
[
  term ((1482374497569771120 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

/-- Partial product 188 for generator 23. -/
def ep_Q2_020_partial_23_0188 : Poly :=
[
  term ((2964748995139542240 : Rat) / 28298395017400811) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((2964748995139542240 : Rat) / 28298395017400811) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1482374497569771120 : Rat) / 28298395017400811) [(9, 2), (14, 2), (16, 1)],
  term ((-1482374497569771120 : Rat) / 28298395017400811) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 23. -/
theorem ep_Q2_020_partial_23_0188_valid :
    mulPoly ep_Q2_020_coefficient_23_0188
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0189 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 189 for generator 23. -/
def ep_Q2_020_partial_23_0189 : Poly :=
[
  term ((32004224177379840 : Rat) / 1230365000756557) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 23. -/
theorem ep_Q2_020_partial_23_0189_valid :
    mulPoly ep_Q2_020_coefficient_23_0189
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0190 : Poly :=
[
  term ((-1702436067084144 : Rat) / 1230365000756557) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 23. -/
def ep_Q2_020_partial_23_0190 : Poly :=
[
  term ((-3404872134168288 : Rat) / 1230365000756557) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1702436067084144 : Rat) / 1230365000756557) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1702436067084144 : Rat) / 1230365000756557) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3404872134168288 : Rat) / 1230365000756557) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 23. -/
theorem ep_Q2_020_partial_23_0190_valid :
    mulPoly ep_Q2_020_coefficient_23_0190
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0191 : Poly :=
[
  term ((-2598340480590000 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 191 for generator 23. -/
def ep_Q2_020_partial_23_0191 : Poly :=
[
  term ((-5196680961180000 : Rat) / 1230365000756557) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2598340480590000 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2598340480590000 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-5196680961180000 : Rat) / 1230365000756557) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 23. -/
theorem ep_Q2_020_partial_23_0191_valid :
    mulPoly ep_Q2_020_coefficient_23_0191
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0192 : Poly :=
[
  term ((-228997957566769218 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 192 for generator 23. -/
def ep_Q2_020_partial_23_0192 : Poly :=
[
  term ((-457995915133538436 : Rat) / 28298395017400811) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((228997957566769218 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((228997957566769218 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-457995915133538436 : Rat) / 28298395017400811) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 23. -/
theorem ep_Q2_020_partial_23_0192_valid :
    mulPoly ep_Q2_020_coefficient_23_0192
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0193 : Poly :=
[
  term ((1997240950103016 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 23. -/
def ep_Q2_020_partial_23_0193 : Poly :=
[
  term ((3994481900206032 : Rat) / 1230365000756557) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1997240950103016 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1997240950103016 : Rat) / 1230365000756557) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((3994481900206032 : Rat) / 1230365000756557) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 23. -/
theorem ep_Q2_020_partial_23_0193_valid :
    mulPoly ep_Q2_020_coefficient_23_0193
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0194 : Poly :=
[
  term ((-1336390307567996925 : Rat) / 56596790034801622) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 23. -/
def ep_Q2_020_partial_23_0194 : Poly :=
[
  term ((-1336390307567996925 : Rat) / 28298395017400811) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1336390307567996925 : Rat) / 56596790034801622) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1336390307567996925 : Rat) / 56596790034801622) [(11, 1), (15, 3), (16, 1)],
  term ((-1336390307567996925 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 23. -/
theorem ep_Q2_020_partial_23_0194_valid :
    mulPoly ep_Q2_020_coefficient_23_0194
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0195 : Poly :=
[
  term ((589410376663348278 : Rat) / 28298395017400811) [(11, 2), (16, 1)]
]

/-- Partial product 195 for generator 23. -/
def ep_Q2_020_partial_23_0195 : Poly :=
[
  term ((1178820753326696556 : Rat) / 28298395017400811) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(11, 2), (14, 2), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)],
  term ((1178820753326696556 : Rat) / 28298395017400811) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 23. -/
theorem ep_Q2_020_partial_23_0195_valid :
    mulPoly ep_Q2_020_coefficient_23_0195
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0196 : Poly :=
[
  term ((-935178421653215553 : Rat) / 113193580069603244) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 196 for generator 23. -/
def ep_Q2_020_partial_23_0196 : Poly :=
[
  term ((-935178421653215553 : Rat) / 56596790034801622) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-935178421653215553 : Rat) / 56596790034801622) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((935178421653215553 : Rat) / 113193580069603244) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((935178421653215553 : Rat) / 113193580069603244) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 23. -/
theorem ep_Q2_020_partial_23_0196_valid :
    mulPoly ep_Q2_020_coefficient_23_0196
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0197 : Poly :=
[
  term ((-424148439214976610 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 197 for generator 23. -/
def ep_Q2_020_partial_23_0197 : Poly :=
[
  term ((-848296878429953220 : Rat) / 28298395017400811) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-848296878429953220 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((424148439214976610 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((424148439214976610 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 23. -/
theorem ep_Q2_020_partial_23_0197_valid :
    mulPoly ep_Q2_020_coefficient_23_0197
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0198 : Poly :=
[
  term ((-134518482142185609 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

/-- Partial product 198 for generator 23. -/
def ep_Q2_020_partial_23_0198 : Poly :=
[
  term ((-134518482142185609 : Rat) / 28298395017400811) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-134518482142185609 : Rat) / 28298395017400811) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((134518482142185609 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((134518482142185609 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 23. -/
theorem ep_Q2_020_partial_23_0198_valid :
    mulPoly ep_Q2_020_coefficient_23_0198
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0199 : Poly :=
[
  term ((-1275922869278676177 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 23. -/
def ep_Q2_020_partial_23_0199 : Poly :=
[
  term ((-1275922869278676177 : Rat) / 56596790034801622) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1275922869278676177 : Rat) / 56596790034801622) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1275922869278676177 : Rat) / 113193580069603244) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1275922869278676177 : Rat) / 113193580069603244) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 23. -/
theorem ep_Q2_020_partial_23_0199_valid :
    mulPoly ep_Q2_020_coefficient_23_0199
        ep_Q2_020_generator_23_0100_0199 =
      ep_Q2_020_partial_23_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_23_0100_0199 : List Poly :=
[
  ep_Q2_020_partial_23_0100,
  ep_Q2_020_partial_23_0101,
  ep_Q2_020_partial_23_0102,
  ep_Q2_020_partial_23_0103,
  ep_Q2_020_partial_23_0104,
  ep_Q2_020_partial_23_0105,
  ep_Q2_020_partial_23_0106,
  ep_Q2_020_partial_23_0107,
  ep_Q2_020_partial_23_0108,
  ep_Q2_020_partial_23_0109,
  ep_Q2_020_partial_23_0110,
  ep_Q2_020_partial_23_0111,
  ep_Q2_020_partial_23_0112,
  ep_Q2_020_partial_23_0113,
  ep_Q2_020_partial_23_0114,
  ep_Q2_020_partial_23_0115,
  ep_Q2_020_partial_23_0116,
  ep_Q2_020_partial_23_0117,
  ep_Q2_020_partial_23_0118,
  ep_Q2_020_partial_23_0119,
  ep_Q2_020_partial_23_0120,
  ep_Q2_020_partial_23_0121,
  ep_Q2_020_partial_23_0122,
  ep_Q2_020_partial_23_0123,
  ep_Q2_020_partial_23_0124,
  ep_Q2_020_partial_23_0125,
  ep_Q2_020_partial_23_0126,
  ep_Q2_020_partial_23_0127,
  ep_Q2_020_partial_23_0128,
  ep_Q2_020_partial_23_0129,
  ep_Q2_020_partial_23_0130,
  ep_Q2_020_partial_23_0131,
  ep_Q2_020_partial_23_0132,
  ep_Q2_020_partial_23_0133,
  ep_Q2_020_partial_23_0134,
  ep_Q2_020_partial_23_0135,
  ep_Q2_020_partial_23_0136,
  ep_Q2_020_partial_23_0137,
  ep_Q2_020_partial_23_0138,
  ep_Q2_020_partial_23_0139,
  ep_Q2_020_partial_23_0140,
  ep_Q2_020_partial_23_0141,
  ep_Q2_020_partial_23_0142,
  ep_Q2_020_partial_23_0143,
  ep_Q2_020_partial_23_0144,
  ep_Q2_020_partial_23_0145,
  ep_Q2_020_partial_23_0146,
  ep_Q2_020_partial_23_0147,
  ep_Q2_020_partial_23_0148,
  ep_Q2_020_partial_23_0149,
  ep_Q2_020_partial_23_0150,
  ep_Q2_020_partial_23_0151,
  ep_Q2_020_partial_23_0152,
  ep_Q2_020_partial_23_0153,
  ep_Q2_020_partial_23_0154,
  ep_Q2_020_partial_23_0155,
  ep_Q2_020_partial_23_0156,
  ep_Q2_020_partial_23_0157,
  ep_Q2_020_partial_23_0158,
  ep_Q2_020_partial_23_0159,
  ep_Q2_020_partial_23_0160,
  ep_Q2_020_partial_23_0161,
  ep_Q2_020_partial_23_0162,
  ep_Q2_020_partial_23_0163,
  ep_Q2_020_partial_23_0164,
  ep_Q2_020_partial_23_0165,
  ep_Q2_020_partial_23_0166,
  ep_Q2_020_partial_23_0167,
  ep_Q2_020_partial_23_0168,
  ep_Q2_020_partial_23_0169,
  ep_Q2_020_partial_23_0170,
  ep_Q2_020_partial_23_0171,
  ep_Q2_020_partial_23_0172,
  ep_Q2_020_partial_23_0173,
  ep_Q2_020_partial_23_0174,
  ep_Q2_020_partial_23_0175,
  ep_Q2_020_partial_23_0176,
  ep_Q2_020_partial_23_0177,
  ep_Q2_020_partial_23_0178,
  ep_Q2_020_partial_23_0179,
  ep_Q2_020_partial_23_0180,
  ep_Q2_020_partial_23_0181,
  ep_Q2_020_partial_23_0182,
  ep_Q2_020_partial_23_0183,
  ep_Q2_020_partial_23_0184,
  ep_Q2_020_partial_23_0185,
  ep_Q2_020_partial_23_0186,
  ep_Q2_020_partial_23_0187,
  ep_Q2_020_partial_23_0188,
  ep_Q2_020_partial_23_0189,
  ep_Q2_020_partial_23_0190,
  ep_Q2_020_partial_23_0191,
  ep_Q2_020_partial_23_0192,
  ep_Q2_020_partial_23_0193,
  ep_Q2_020_partial_23_0194,
  ep_Q2_020_partial_23_0195,
  ep_Q2_020_partial_23_0196,
  ep_Q2_020_partial_23_0197,
  ep_Q2_020_partial_23_0198,
  ep_Q2_020_partial_23_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_23_0100_0199 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((200042314802096763 : Rat) / 28298395017400811) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-396696591801939438 : Rat) / 28298395017400811) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-396696591801939438 : Rat) / 28298395017400811) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((198348295900969719 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((198348295900969719 : Rat) / 28298395017400811) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((160849153834188300 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((160849153834188300 : Rat) / 28298395017400811) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-80424576917094150 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((-80424576917094150 : Rat) / 28298395017400811) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((61668711084931578 : Rat) / 975806724737959) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((154635815280567852 : Rat) / 1230365000756557) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((1318478839934728782 : Rat) / 28298395017400811) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((457352044429172676 : Rat) / 28298395017400811) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((1318478839934728782 : Rat) / 28298395017400811) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((457352044429172676 : Rat) / 28298395017400811) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-659239419967364391 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-659239419967364391 : Rat) / 28298395017400811) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-228676022214586338 : Rat) / 28298395017400811) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-228676022214586338 : Rat) / 28298395017400811) [(4, 1), (14, 3), (16, 1)],
  term ((-336458703276347562 : Rat) / 28298395017400811) [(4, 2), (10, 1), (14, 1), (16, 1)],
  term ((-336458703276347562 : Rat) / 28298395017400811) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((168229351638173781 : Rat) / 28298395017400811) [(4, 2), (14, 2), (16, 1)],
  term ((168229351638173781 : Rat) / 28298395017400811) [(4, 2), (15, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-152381362342933152 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((214719192392314896 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-152381362342933152 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-18419285293311378 : Rat) / 1230365000756557) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18419285293311378 : Rat) / 1230365000756557) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (14, 2), (16, 1)],
  term ((-107359596196157448 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((9209642646655689 : Rat) / 1230365000756557) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((9209642646655689 : Rat) / 1230365000756557) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-171490471718940000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-185621304339583200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((1172995315531099200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-249005406371283717 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((1172995315531099200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((241645664694870000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((92810652169791600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-249005406371283717 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((257359458805144560 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-171490471718940000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-172922857477672104 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((249005406371283717 : Rat) / 56596790034801622) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 3), (16, 1)],
  term ((249005406371283717 : Rat) / 56596790034801622) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((50793787447644384 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-46176170406949440 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-71573064130771632 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((50793787447644384 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((303885303799501296 : Rat) / 28298395017400811) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((4617617040694944 : Rat) / 1230365000756557) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((1025230011051953982 : Rat) / 28298395017400811) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((573946874706720012 : Rat) / 28298395017400811) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1025230011051953982 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2308808520347472 : Rat) / 1230365000756557) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-151942651899750648 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2308808520347472 : Rat) / 1230365000756557) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((10292785922121204 : Rat) / 690204756521971) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4617617040694944 : Rat) / 1230365000756557) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((303885303799501296 : Rat) / 28298395017400811) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-512615005525976991 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-512615005525976991 : Rat) / 28298395017400811) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-286973437353360006 : Rat) / 28298395017400811) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-286973437353360006 : Rat) / 28298395017400811) [(5, 1), (15, 3), (16, 1)],
  term ((152381362342933152 : Rat) / 28298395017400811) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-214719192392314896 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((152381362342933152 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-336458703276347562 : Rat) / 28298395017400811) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-336458703276347562 : Rat) / 28298395017400811) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((168229351638173781 : Rat) / 28298395017400811) [(5, 2), (14, 2), (16, 1)],
  term ((168229351638173781 : Rat) / 28298395017400811) [(5, 2), (15, 2), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((143926993881873840 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-345424785316497216 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-345424785316497216 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((143926993881873840 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 2), (14, 2), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 56596790034801622) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1209704629024493385 : Rat) / 56596790034801622) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 56596790034801622) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1209704629024493385 : Rat) / 56596790034801622) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((1540723537949905221 : Rat) / 113193580069603244) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((1540723537949905221 : Rat) / 113193580069603244) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1209704629024493385 : Rat) / 113193580069603244) [(6, 1), (14, 2), (16, 1)],
  term ((-1209704629024493385 : Rat) / 113193580069603244) [(6, 1), (15, 2), (16, 1)],
  term ((265130200483098927 : Rat) / 28298395017400811) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((265130200483098927 : Rat) / 28298395017400811) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-265130200483098927 : Rat) / 56596790034801622) [(6, 2), (14, 2), (16, 1)],
  term ((-265130200483098927 : Rat) / 56596790034801622) [(6, 2), (15, 2), (16, 1)],
  term ((171490471718940000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7869725534734272 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13973438316668256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((829751600609277420 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-575680206406485024 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-13973438316668256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-241645664694870000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-575680206406485024 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((829751600609277420 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11089158708034656 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((171490471718940000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((7869725534734272 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-414875800304638710 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-414875800304638710 : Rat) / 28298395017400811) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-425821835061483564 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1582074881556375477 : Rat) / 56596790034801622) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-310065279911532504 : Rat) / 28298395017400811) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1582074881556375477 : Rat) / 56596790034801622) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-102782849942783016 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((212910917530741782 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-3350150426923818 : Rat) / 975806724737959) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((120822832347435000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-425821835061483564 : Rat) / 28298395017400811) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((5544579354017328 : Rat) / 1230365000756557) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3934862767367136 : Rat) / 1230365000756557) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1582074881556375477 : Rat) / 113193580069603244) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19487553604425000 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((1582074881556375477 : Rat) / 113193580069603244) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((155032639955766252 : Rat) / 28298395017400811) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-894286992583440 : Rat) / 1230365000756557) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((155032639955766252 : Rat) / 28298395017400811) [(7, 1), (15, 3), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-767573608541980032 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-767573608541980032 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (14, 2), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((212361597579913575 : Rat) / 28298395017400811) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((212361597579913575 : Rat) / 28298395017400811) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-212361597579913575 : Rat) / 56596790034801622) [(7, 2), (14, 2), (16, 1)],
  term ((-212361597579913575 : Rat) / 56596790034801622) [(7, 2), (15, 2), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((436890672984589182 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-553503550101674076 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-553503550101674076 : Rat) / 28298395017400811) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((436890672984589182 : Rat) / 28298395017400811) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((276751775050837038 : Rat) / 28298395017400811) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-218445336492294591 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)],
  term ((276751775050837038 : Rat) / 28298395017400811) [(8, 1), (14, 3), (16, 1)],
  term ((-218445336492294591 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)],
  term ((5196680961180000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((238476531355584 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4044046716348529469 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-64008448354759680 : Rat) / 1230365000756557) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((812746647284472000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13501085854476021 : Rat) / 1951613449475918) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2685039795876705528 : Rat) / 28298395017400811) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64008448354759680 : Rat) / 1230365000756557) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((812746647284472000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13501085854476021 : Rat) / 1951613449475918) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((4044046716348529469 : Rat) / 56596790034801622) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1326032875404881587 : Rat) / 56596790034801622) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-9094191682065000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-4044046716348529469 : Rat) / 28298395017400811) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-417333929872272 : Rat) / 1230365000756557) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13501085854476021 : Rat) / 3903226898951836) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-13501085854476021 : Rat) / 3903226898951836) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((1342519897938352764 : Rat) / 28298395017400811) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((1342519897938352764 : Rat) / 28298395017400811) [(9, 1), (15, 3), (16, 1)],
  term ((-57163490572980000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2623241844911424 : Rat) / 1230365000756557) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((51966809611800000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2384765313555840 : Rat) / 1230365000756557) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2964748995139542240 : Rat) / 28298395017400811) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((80548554898290000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2964748995139542240 : Rat) / 28298395017400811) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3696386236011552 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-57163490572980000 : Rat) / 28298395017400811) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2623241844911424 : Rat) / 1230365000756557) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1482374497569771120 : Rat) / 28298395017400811) [(9, 2), (14, 2), (16, 1)],
  term ((-1482374497569771120 : Rat) / 28298395017400811) [(9, 2), (15, 2), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 2), (15, 4), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3404872134168288 : Rat) / 1230365000756557) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-457995915133538436 : Rat) / 28298395017400811) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5196680961180000 : Rat) / 1230365000756557) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1336390307567996925 : Rat) / 28298395017400811) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3994481900206032 : Rat) / 1230365000756557) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1178820753326696556 : Rat) / 28298395017400811) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-848296878429953220 : Rat) / 28298395017400811) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-935178421653215553 : Rat) / 56596790034801622) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-134518482142185609 : Rat) / 28298395017400811) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1275922869278676177 : Rat) / 56596790034801622) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-935178421653215553 : Rat) / 56596790034801622) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1702436067084144 : Rat) / 1230365000756557) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-848296878429953220 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1702436067084144 : Rat) / 1230365000756557) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-134518482142185609 : Rat) / 28298395017400811) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2598340480590000 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((228997957566769218 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2598340480590000 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-817926954145137741 : Rat) / 56596790034801622) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1997240950103016 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1336390307567996925 : Rat) / 56596790034801622) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1997240950103016 : Rat) / 1230365000756557) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((1336390307567996925 : Rat) / 56596790034801622) [(11, 1), (15, 3), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3404872134168288 : Rat) / 1230365000756557) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5196680961180000 : Rat) / 1230365000756557) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-457995915133538436 : Rat) / 28298395017400811) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3994481900206032 : Rat) / 1230365000756557) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(11, 2), (14, 2), (16, 1)],
  term ((-1925800684231345203 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)],
  term ((1178820753326696556 : Rat) / 28298395017400811) [(11, 3), (15, 1), (16, 1)],
  term ((935178421653215553 : Rat) / 113193580069603244) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((424148439214976610 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((935178421653215553 : Rat) / 113193580069603244) [(12, 1), (14, 3), (16, 1)],
  term ((424148439214976610 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)],
  term ((134518482142185609 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((134518482142185609 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)],
  term ((1275922869278676177 : Rat) / 113193580069603244) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1275922869278676177 : Rat) / 113193580069603244) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 100 through 199. -/
theorem ep_Q2_020_block_23_0100_0199_valid :
    checkProductSumEq ep_Q2_020_partials_23_0100_0199
      ep_Q2_020_block_23_0100_0199 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
