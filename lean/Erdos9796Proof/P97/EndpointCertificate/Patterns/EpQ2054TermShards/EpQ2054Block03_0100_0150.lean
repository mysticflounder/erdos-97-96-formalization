/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 3:100-150

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_03_0100_0150 : Poly :=
[
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0100 : Poly :=
[
  term ((423311487840 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 100 for generator 3. -/
def ep_Q2_054_partial_03_0100 : Poly :=
[
  term ((423311487840 : Rat) / 45033486517) [(4, 2), (6, 1)],
  term ((423311487840 : Rat) / 45033486517) [(5, 2), (6, 1)],
  term ((-423311487840 : Rat) / 45033486517) [(6, 1), (8, 2)],
  term ((-423311487840 : Rat) / 45033486517) [(6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem ep_Q2_054_partial_03_0100_valid :
    mulPoly ep_Q2_054_coefficient_03_0100
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0101 : Poly :=
[
  term ((-82367887500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 101 for generator 3. -/
def ep_Q2_054_partial_03_0101 : Poly :=
[
  term ((-82367887500 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (9, 1)],
  term ((82367887500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((82367887500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 3. -/
theorem ep_Q2_054_partial_03_0101_valid :
    mulPoly ep_Q2_054_coefficient_03_0101
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0102 : Poly :=
[
  term ((-1981405293750 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 102 for generator 3. -/
def ep_Q2_054_partial_03_0102 : Poly :=
[
  term ((-1981405293750 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term ((-1981405293750 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((1981405293750 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((1981405293750 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 3. -/
theorem ep_Q2_054_partial_03_0102_valid :
    mulPoly ep_Q2_054_coefficient_03_0102
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0103 : Poly :=
[
  term ((9510965937900 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 103 for generator 3. -/
def ep_Q2_054_partial_03_0103 : Poly :=
[
  term ((9510965937900 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((9510965937900 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((-9510965937900 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((-9510965937900 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 3. -/
theorem ep_Q2_054_partial_03_0103_valid :
    mulPoly ep_Q2_054_coefficient_03_0103
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0104 : Poly :=
[
  term ((-9787526138574 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 104 for generator 3. -/
def ep_Q2_054_partial_03_0104 : Poly :=
[
  term ((-9787526138574 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-9787526138574 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((9787526138574 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((9787526138574 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 3. -/
theorem ep_Q2_054_partial_03_0104_valid :
    mulPoly ep_Q2_054_coefficient_03_0104
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0105 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 3. -/
def ep_Q2_054_partial_03_0105 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 3. -/
theorem ep_Q2_054_partial_03_0105_valid :
    mulPoly ep_Q2_054_coefficient_03_0105
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0106 : Poly :=
[
  term ((-9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2)]
]

/-- Partial product 106 for generator 3. -/
def ep_Q2_054_partial_03_0106 : Poly :=
[
  term ((-9240141746682 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 2)],
  term ((-9240141746682 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 2)],
  term ((9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2)],
  term ((9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 3. -/
theorem ep_Q2_054_partial_03_0106_valid :
    mulPoly ep_Q2_054_coefficient_03_0106
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0107 : Poly :=
[
  term ((646209843723 : Rat) / 45033486517) [(6, 1), (8, 1)]
]

/-- Partial product 107 for generator 3. -/
def ep_Q2_054_partial_03_0107 : Poly :=
[
  term ((646209843723 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1)],
  term ((646209843723 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1)],
  term ((-646209843723 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2)],
  term ((-646209843723 : Rat) / 45033486517) [(6, 1), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 3. -/
theorem ep_Q2_054_partial_03_0107_valid :
    mulPoly ep_Q2_054_coefficient_03_0107
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0108 : Poly :=
[
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 108 for generator 3. -/
def ep_Q2_054_partial_03_0108 : Poly :=
[
  term ((367433671446 : Rat) / 45033486517) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((367433671446 : Rat) / 45033486517) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 3. -/
theorem ep_Q2_054_partial_03_0108_valid :
    mulPoly ep_Q2_054_coefficient_03_0108
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0109 : Poly :=
[
  term ((-2814301406502 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 109 for generator 3. -/
def ep_Q2_054_partial_03_0109 : Poly :=
[
  term ((-2814301406502 : Rat) / 45033486517) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-2814301406502 : Rat) / 45033486517) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((2814301406502 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((2814301406502 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 3. -/
theorem ep_Q2_054_partial_03_0109_valid :
    mulPoly ep_Q2_054_coefficient_03_0109
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0110 : Poly :=
[
  term ((49317158554686 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 110 for generator 3. -/
def ep_Q2_054_partial_03_0110 : Poly :=
[
  term ((49317158554686 : Rat) / 45033486517) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((49317158554686 : Rat) / 45033486517) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-49317158554686 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((-49317158554686 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 3. -/
theorem ep_Q2_054_partial_03_0110_valid :
    mulPoly ep_Q2_054_coefficient_03_0110
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0111 : Poly :=
[
  term ((-4067550000 : Rat) / 45033486517) [(6, 1), (12, 1)]
]

/-- Partial product 111 for generator 3. -/
def ep_Q2_054_partial_03_0111 : Poly :=
[
  term ((-4067550000 : Rat) / 45033486517) [(4, 2), (6, 1), (12, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(5, 2), (6, 1), (12, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 3. -/
theorem ep_Q2_054_partial_03_0111_valid :
    mulPoly ep_Q2_054_coefficient_03_0111
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0112 : Poly :=
[
  term ((-40347326414430 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 112 for generator 3. -/
def ep_Q2_054_partial_03_0112 : Poly :=
[
  term ((-40347326414430 : Rat) / 45033486517) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-40347326414430 : Rat) / 45033486517) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((40347326414430 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((40347326414430 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 3. -/
theorem ep_Q2_054_partial_03_0112_valid :
    mulPoly ep_Q2_054_coefficient_03_0112
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0113 : Poly :=
[
  term ((-19335678712956 : Rat) / 45033486517) [(6, 1), (15, 2)]
]

/-- Partial product 113 for generator 3. -/
def ep_Q2_054_partial_03_0113 : Poly :=
[
  term ((-19335678712956 : Rat) / 45033486517) [(4, 2), (6, 1), (15, 2)],
  term ((-19335678712956 : Rat) / 45033486517) [(5, 2), (6, 1), (15, 2)],
  term ((19335678712956 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2)],
  term ((19335678712956 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 3. -/
theorem ep_Q2_054_partial_03_0113_valid :
    mulPoly ep_Q2_054_coefficient_03_0113
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0114 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 3. -/
def ep_Q2_054_partial_03_0114 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 3. -/
theorem ep_Q2_054_partial_03_0114_valid :
    mulPoly ep_Q2_054_coefficient_03_0114
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0115 : Poly :=
[
  term ((2954143252881 : Rat) / 45033486517) [(6, 2)]
]

/-- Partial product 115 for generator 3. -/
def ep_Q2_054_partial_03_0115 : Poly :=
[
  term ((2954143252881 : Rat) / 45033486517) [(4, 2), (6, 2)],
  term ((2954143252881 : Rat) / 45033486517) [(5, 2), (6, 2)],
  term ((-2954143252881 : Rat) / 45033486517) [(6, 2), (8, 2)],
  term ((-2954143252881 : Rat) / 45033486517) [(6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 3. -/
theorem ep_Q2_054_partial_03_0115_valid :
    mulPoly ep_Q2_054_coefficient_03_0115
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0116 : Poly :=
[
  term ((-22879968750 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 116 for generator 3. -/
def ep_Q2_054_partial_03_0116 : Poly :=
[
  term ((-22879968750 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (11, 1)],
  term ((-22879968750 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term ((22879968750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((22879968750 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 3. -/
theorem ep_Q2_054_partial_03_0116_valid :
    mulPoly ep_Q2_054_coefficient_03_0116
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0117 : Poly :=
[
  term ((1901925691380 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 117 for generator 3. -/
def ep_Q2_054_partial_03_0117 : Poly :=
[
  term ((1901925691380 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((1901925691380 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((-1901925691380 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((-1901925691380 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 3. -/
theorem ep_Q2_054_partial_03_0117_valid :
    mulPoly ep_Q2_054_coefficient_03_0117
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0118 : Poly :=
[
  term ((-1195507001691 : Rat) / 45033486517) [(7, 1), (9, 1)]
]

/-- Partial product 118 for generator 3. -/
def ep_Q2_054_partial_03_0118 : Poly :=
[
  term ((-1195507001691 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1)],
  term ((-1195507001691 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1)],
  term ((1195507001691 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1)],
  term ((1195507001691 : Rat) / 45033486517) [(7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 3. -/
theorem ep_Q2_054_partial_03_0118_valid :
    mulPoly ep_Q2_054_coefficient_03_0118
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0119 : Poly :=
[
  term ((-367433671446 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 119 for generator 3. -/
def ep_Q2_054_partial_03_0119 : Poly :=
[
  term ((-367433671446 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((367433671446 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((367433671446 : Rat) / 45033486517) [(7, 1), (9, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 3. -/
theorem ep_Q2_054_partial_03_0119_valid :
    mulPoly ep_Q2_054_coefficient_03_0119
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0120 : Poly :=
[
  term ((826812798327 : Rat) / 90066973034) [(7, 1), (11, 1)]
]

/-- Partial product 120 for generator 3. -/
def ep_Q2_054_partial_03_0120 : Poly :=
[
  term ((826812798327 : Rat) / 90066973034) [(4, 2), (7, 1), (11, 1)],
  term ((826812798327 : Rat) / 90066973034) [(5, 2), (7, 1), (11, 1)],
  term ((-826812798327 : Rat) / 90066973034) [(7, 1), (8, 2), (11, 1)],
  term ((-826812798327 : Rat) / 90066973034) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 3. -/
theorem ep_Q2_054_partial_03_0120_valid :
    mulPoly ep_Q2_054_coefficient_03_0120
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0121 : Poly :=
[
  term ((-233375681250 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 121 for generator 3. -/
def ep_Q2_054_partial_03_0121 : Poly :=
[
  term ((-233375681250 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 3. -/
theorem ep_Q2_054_partial_03_0121_valid :
    mulPoly ep_Q2_054_coefficient_03_0121
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0122 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 122 for generator 3. -/
def ep_Q2_054_partial_03_0122 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((3050662500 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 3. -/
theorem ep_Q2_054_partial_03_0122_valid :
    mulPoly ep_Q2_054_coefficient_03_0122
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0123 : Poly :=
[
  term ((1360589118183 : Rat) / 45033486517) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 123 for generator 3. -/
def ep_Q2_054_partial_03_0123 : Poly :=
[
  term ((1360589118183 : Rat) / 45033486517) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((1360589118183 : Rat) / 45033486517) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1360589118183 : Rat) / 45033486517) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-1360589118183 : Rat) / 45033486517) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 3. -/
theorem ep_Q2_054_partial_03_0123_valid :
    mulPoly ep_Q2_054_coefficient_03_0123
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0124 : Poly :=
[
  term ((-3432202137711 : Rat) / 90066973034) [(7, 1), (13, 1)]
]

/-- Partial product 124 for generator 3. -/
def ep_Q2_054_partial_03_0124 : Poly :=
[
  term ((-3432202137711 : Rat) / 90066973034) [(4, 2), (7, 1), (13, 1)],
  term ((-3432202137711 : Rat) / 90066973034) [(5, 2), (7, 1), (13, 1)],
  term ((3432202137711 : Rat) / 90066973034) [(7, 1), (8, 2), (13, 1)],
  term ((3432202137711 : Rat) / 90066973034) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 3. -/
theorem ep_Q2_054_partial_03_0124_valid :
    mulPoly ep_Q2_054_coefficient_03_0124
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0125 : Poly :=
[
  term ((27983516608899 : Rat) / 90066973034) [(7, 1), (15, 1)]
]

/-- Partial product 125 for generator 3. -/
def ep_Q2_054_partial_03_0125 : Poly :=
[
  term ((27983516608899 : Rat) / 90066973034) [(4, 2), (7, 1), (15, 1)],
  term ((27983516608899 : Rat) / 90066973034) [(5, 2), (7, 1), (15, 1)],
  term ((-27983516608899 : Rat) / 90066973034) [(7, 1), (8, 2), (15, 1)],
  term ((-27983516608899 : Rat) / 90066973034) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 3. -/
theorem ep_Q2_054_partial_03_0125_valid :
    mulPoly ep_Q2_054_coefficient_03_0125
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0126 : Poly :=
[
  term ((476093879505 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 3. -/
def ep_Q2_054_partial_03_0126 : Poly :=
[
  term ((476093879505 : Rat) / 45033486517) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((476093879505 : Rat) / 45033486517) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-476093879505 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-476093879505 : Rat) / 45033486517) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 3. -/
theorem ep_Q2_054_partial_03_0126_valid :
    mulPoly ep_Q2_054_coefficient_03_0126
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0127 : Poly :=
[
  term ((-729377331345 : Rat) / 45033486517) [(7, 2)]
]

/-- Partial product 127 for generator 3. -/
def ep_Q2_054_partial_03_0127 : Poly :=
[
  term ((-729377331345 : Rat) / 45033486517) [(4, 2), (7, 2)],
  term ((-729377331345 : Rat) / 45033486517) [(5, 2), (7, 2)],
  term ((729377331345 : Rat) / 45033486517) [(7, 2), (8, 2)],
  term ((729377331345 : Rat) / 45033486517) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 3. -/
theorem ep_Q2_054_partial_03_0127_valid :
    mulPoly ep_Q2_054_coefficient_03_0127
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0128 : Poly :=
[
  term ((-183039750000 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 128 for generator 3. -/
def ep_Q2_054_partial_03_0128 : Poly :=
[
  term ((-183039750000 : Rat) / 45033486517) [(4, 2), (7, 2), (8, 1)],
  term ((-183039750000 : Rat) / 45033486517) [(5, 2), (7, 2), (8, 1)],
  term ((183039750000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2)],
  term ((183039750000 : Rat) / 45033486517) [(7, 2), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 3. -/
theorem ep_Q2_054_partial_03_0128_valid :
    mulPoly ep_Q2_054_coefficient_03_0128
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0129 : Poly :=
[
  term ((-207157710114 : Rat) / 45033486517) [(7, 2), (12, 1)]
]

/-- Partial product 129 for generator 3. -/
def ep_Q2_054_partial_03_0129 : Poly :=
[
  term ((-207157710114 : Rat) / 45033486517) [(4, 2), (7, 2), (12, 1)],
  term ((-207157710114 : Rat) / 45033486517) [(5, 2), (7, 2), (12, 1)],
  term ((207157710114 : Rat) / 45033486517) [(7, 2), (8, 2), (12, 1)],
  term ((207157710114 : Rat) / 45033486517) [(7, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 3. -/
theorem ep_Q2_054_partial_03_0129_valid :
    mulPoly ep_Q2_054_coefficient_03_0129
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0130 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (16, 1)]
]

/-- Partial product 130 for generator 3. -/
def ep_Q2_054_partial_03_0130 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(4, 2), (7, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(5, 2), (7, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 3. -/
theorem ep_Q2_054_partial_03_0130_valid :
    mulPoly ep_Q2_054_coefficient_03_0130
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0131 : Poly :=
[
  term ((-2500632363669 : Rat) / 180133946068) [(8, 1)]
]

/-- Partial product 131 for generator 3. -/
def ep_Q2_054_partial_03_0131 : Poly :=
[
  term ((-2500632363669 : Rat) / 180133946068) [(4, 2), (8, 1)],
  term ((-2500632363669 : Rat) / 180133946068) [(5, 2), (8, 1)],
  term ((2500632363669 : Rat) / 180133946068) [(8, 1), (9, 2)],
  term ((2500632363669 : Rat) / 180133946068) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 3. -/
theorem ep_Q2_054_partial_03_0131_valid :
    mulPoly ep_Q2_054_coefficient_03_0131
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0132 : Poly :=
[
  term ((-89484995937 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 132 for generator 3. -/
def ep_Q2_054_partial_03_0132 : Poly :=
[
  term ((-89484995937 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((89484995937 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((89484995937 : Rat) / 45033486517) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 3. -/
theorem ep_Q2_054_partial_03_0132_valid :
    mulPoly ep_Q2_054_coefficient_03_0132
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0133 : Poly :=
[
  term ((-670413261276 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 133 for generator 3. -/
def ep_Q2_054_partial_03_0133 : Poly :=
[
  term ((-670413261276 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-670413261276 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((670413261276 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((670413261276 : Rat) / 45033486517) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 3. -/
theorem ep_Q2_054_partial_03_0133_valid :
    mulPoly ep_Q2_054_coefficient_03_0133
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0134 : Poly :=
[
  term ((89484995937 : Rat) / 45033486517) [(8, 1), (11, 2)]
]

/-- Partial product 134 for generator 3. -/
def ep_Q2_054_partial_03_0134 : Poly :=
[
  term ((89484995937 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 2)],
  term ((89484995937 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 2)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 2)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 3. -/
theorem ep_Q2_054_partial_03_0134_valid :
    mulPoly ep_Q2_054_coefficient_03_0134
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0135 : Poly :=
[
  term ((-89484995937 : Rat) / 90066973034) [(8, 1), (12, 1)]
]

/-- Partial product 135 for generator 3. -/
def ep_Q2_054_partial_03_0135 : Poly :=
[
  term ((-89484995937 : Rat) / 90066973034) [(4, 2), (8, 1), (12, 1)],
  term ((-89484995937 : Rat) / 90066973034) [(5, 2), (8, 1), (12, 1)],
  term ((89484995937 : Rat) / 90066973034) [(8, 1), (9, 2), (12, 1)],
  term ((89484995937 : Rat) / 90066973034) [(8, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 3. -/
theorem ep_Q2_054_partial_03_0135_valid :
    mulPoly ep_Q2_054_coefficient_03_0135
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0136 : Poly :=
[
  term ((536909975622 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 136 for generator 3. -/
def ep_Q2_054_partial_03_0136 : Poly :=
[
  term ((536909975622 : Rat) / 45033486517) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 3. -/
theorem ep_Q2_054_partial_03_0136_valid :
    mulPoly ep_Q2_054_coefficient_03_0136
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0137 : Poly :=
[
  term ((163510728168 : Rat) / 45033486517) [(9, 1), (11, 1)]
]

/-- Partial product 137 for generator 3. -/
def ep_Q2_054_partial_03_0137 : Poly :=
[
  term ((163510728168 : Rat) / 45033486517) [(4, 2), (9, 1), (11, 1)],
  term ((163510728168 : Rat) / 45033486517) [(5, 2), (9, 1), (11, 1)],
  term ((-163510728168 : Rat) / 45033486517) [(8, 2), (9, 1), (11, 1)],
  term ((-163510728168 : Rat) / 45033486517) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 3. -/
theorem ep_Q2_054_partial_03_0137_valid :
    mulPoly ep_Q2_054_coefficient_03_0137
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0138 : Poly :=
[
  term ((571563488916 : Rat) / 45033486517) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 138 for generator 3. -/
def ep_Q2_054_partial_03_0138 : Poly :=
[
  term ((571563488916 : Rat) / 45033486517) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((571563488916 : Rat) / 45033486517) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 3. -/
theorem ep_Q2_054_partial_03_0138_valid :
    mulPoly ep_Q2_054_coefficient_03_0138
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0139 : Poly :=
[
  term ((260621918862 : Rat) / 45033486517) [(9, 1), (13, 1)]
]

/-- Partial product 139 for generator 3. -/
def ep_Q2_054_partial_03_0139 : Poly :=
[
  term ((260621918862 : Rat) / 45033486517) [(4, 2), (9, 1), (13, 1)],
  term ((260621918862 : Rat) / 45033486517) [(5, 2), (9, 1), (13, 1)],
  term ((-260621918862 : Rat) / 45033486517) [(8, 2), (9, 1), (13, 1)],
  term ((-260621918862 : Rat) / 45033486517) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 3. -/
theorem ep_Q2_054_partial_03_0139_valid :
    mulPoly ep_Q2_054_coefficient_03_0139
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0140 : Poly :=
[
  term ((34170602184 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 140 for generator 3. -/
def ep_Q2_054_partial_03_0140 : Poly :=
[
  term ((34170602184 : Rat) / 45033486517) [(4, 2), (9, 1), (15, 1)],
  term ((34170602184 : Rat) / 45033486517) [(5, 2), (9, 1), (15, 1)],
  term ((-34170602184 : Rat) / 45033486517) [(8, 2), (9, 1), (15, 1)],
  term ((-34170602184 : Rat) / 45033486517) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 3. -/
theorem ep_Q2_054_partial_03_0140_valid :
    mulPoly ep_Q2_054_coefficient_03_0140
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0141 : Poly :=
[
  term ((3377885020038 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 141 for generator 3. -/
def ep_Q2_054_partial_03_0141 : Poly :=
[
  term ((3377885020038 : Rat) / 45033486517) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3377885020038 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3377885020038 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 3. -/
theorem ep_Q2_054_partial_03_0141_valid :
    mulPoly ep_Q2_054_coefficient_03_0141
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0142 : Poly :=
[
  term ((-1097348024922 : Rat) / 45033486517) [(11, 1), (13, 1)]
]

/-- Partial product 142 for generator 3. -/
def ep_Q2_054_partial_03_0142 : Poly :=
[
  term ((-1097348024922 : Rat) / 45033486517) [(4, 2), (11, 1), (13, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(5, 2), (11, 1), (13, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 3. -/
theorem ep_Q2_054_partial_03_0142_valid :
    mulPoly ep_Q2_054_coefficient_03_0142
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0143 : Poly :=
[
  term ((-81549561314555 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 143 for generator 3. -/
def ep_Q2_054_partial_03_0143 : Poly :=
[
  term ((-81549561314555 : Rat) / 90066973034) [(4, 2), (11, 1), (15, 1)],
  term ((-81549561314555 : Rat) / 90066973034) [(5, 2), (11, 1), (15, 1)],
  term ((81549561314555 : Rat) / 90066973034) [(8, 2), (11, 1), (15, 1)],
  term ((81549561314555 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 3. -/
theorem ep_Q2_054_partial_03_0143_valid :
    mulPoly ep_Q2_054_coefficient_03_0143
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0144 : Poly :=
[
  term ((159714847335 : Rat) / 90066973034) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 3. -/
def ep_Q2_054_partial_03_0144 : Poly :=
[
  term ((159714847335 : Rat) / 90066973034) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 90066973034) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 3. -/
theorem ep_Q2_054_partial_03_0144_valid :
    mulPoly ep_Q2_054_coefficient_03_0144
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0145 : Poly :=
[
  term ((1097348024922 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 145 for generator 3. -/
def ep_Q2_054_partial_03_0145 : Poly :=
[
  term ((1097348024922 : Rat) / 45033486517) [(4, 2), (11, 2)],
  term ((1097348024922 : Rat) / 45033486517) [(5, 2), (11, 2)],
  term ((-1097348024922 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((-1097348024922 : Rat) / 45033486517) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 3. -/
theorem ep_Q2_054_partial_03_0145_valid :
    mulPoly ep_Q2_054_coefficient_03_0145
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0146 : Poly :=
[
  term ((-4260671167009 : Rat) / 90066973034) [(12, 1)]
]

/-- Partial product 146 for generator 3. -/
def ep_Q2_054_partial_03_0146 : Poly :=
[
  term ((-4260671167009 : Rat) / 90066973034) [(4, 2), (12, 1)],
  term ((-4260671167009 : Rat) / 90066973034) [(5, 2), (12, 1)],
  term ((4260671167009 : Rat) / 90066973034) [(8, 2), (12, 1)],
  term ((4260671167009 : Rat) / 90066973034) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 3. -/
theorem ep_Q2_054_partial_03_0146_valid :
    mulPoly ep_Q2_054_coefficient_03_0146
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0147 : Poly :=
[
  term ((-5533560238413 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 147 for generator 3. -/
def ep_Q2_054_partial_03_0147 : Poly :=
[
  term ((-5533560238413 : Rat) / 45033486517) [(4, 2), (12, 1), (15, 2)],
  term ((-5533560238413 : Rat) / 45033486517) [(5, 2), (12, 1), (15, 2)],
  term ((5533560238413 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((5533560238413 : Rat) / 45033486517) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 3. -/
theorem ep_Q2_054_partial_03_0147_valid :
    mulPoly ep_Q2_054_coefficient_03_0147
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0148 : Poly :=
[
  term ((66269200629419 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 148 for generator 3. -/
def ep_Q2_054_partial_03_0148 : Poly :=
[
  term ((66269200629419 : Rat) / 90066973034) [(4, 2), (13, 1), (15, 1)],
  term ((66269200629419 : Rat) / 90066973034) [(5, 2), (13, 1), (15, 1)],
  term ((-66269200629419 : Rat) / 90066973034) [(8, 2), (13, 1), (15, 1)],
  term ((-66269200629419 : Rat) / 90066973034) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 3. -/
theorem ep_Q2_054_partial_03_0148_valid :
    mulPoly ep_Q2_054_coefficient_03_0148
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0149 : Poly :=
[
  term ((16983175352367 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 149 for generator 3. -/
def ep_Q2_054_partial_03_0149 : Poly :=
[
  term ((16983175352367 : Rat) / 45033486517) [(4, 2), (15, 2)],
  term ((16983175352367 : Rat) / 45033486517) [(5, 2), (15, 2)],
  term ((-16983175352367 : Rat) / 45033486517) [(8, 2), (15, 2)],
  term ((-16983175352367 : Rat) / 45033486517) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 3. -/
theorem ep_Q2_054_partial_03_0149_valid :
    mulPoly ep_Q2_054_coefficient_03_0149
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 3. -/
def ep_Q2_054_coefficient_03_0150 : Poly :=
[
  term ((-159714847335 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 150 for generator 3. -/
def ep_Q2_054_partial_03_0150 : Poly :=
[
  term ((-159714847335 : Rat) / 90066973034) [(4, 2), (15, 2), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(5, 2), (15, 2), (16, 1)],
  term ((159714847335 : Rat) / 90066973034) [(8, 2), (15, 2), (16, 1)],
  term ((159714847335 : Rat) / 90066973034) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 3. -/
theorem ep_Q2_054_partial_03_0150_valid :
    mulPoly ep_Q2_054_coefficient_03_0150
        ep_Q2_054_generator_03_0100_0150 =
      ep_Q2_054_partial_03_0150 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_03_0100_0150 : List Poly :=
[
  ep_Q2_054_partial_03_0100,
  ep_Q2_054_partial_03_0101,
  ep_Q2_054_partial_03_0102,
  ep_Q2_054_partial_03_0103,
  ep_Q2_054_partial_03_0104,
  ep_Q2_054_partial_03_0105,
  ep_Q2_054_partial_03_0106,
  ep_Q2_054_partial_03_0107,
  ep_Q2_054_partial_03_0108,
  ep_Q2_054_partial_03_0109,
  ep_Q2_054_partial_03_0110,
  ep_Q2_054_partial_03_0111,
  ep_Q2_054_partial_03_0112,
  ep_Q2_054_partial_03_0113,
  ep_Q2_054_partial_03_0114,
  ep_Q2_054_partial_03_0115,
  ep_Q2_054_partial_03_0116,
  ep_Q2_054_partial_03_0117,
  ep_Q2_054_partial_03_0118,
  ep_Q2_054_partial_03_0119,
  ep_Q2_054_partial_03_0120,
  ep_Q2_054_partial_03_0121,
  ep_Q2_054_partial_03_0122,
  ep_Q2_054_partial_03_0123,
  ep_Q2_054_partial_03_0124,
  ep_Q2_054_partial_03_0125,
  ep_Q2_054_partial_03_0126,
  ep_Q2_054_partial_03_0127,
  ep_Q2_054_partial_03_0128,
  ep_Q2_054_partial_03_0129,
  ep_Q2_054_partial_03_0130,
  ep_Q2_054_partial_03_0131,
  ep_Q2_054_partial_03_0132,
  ep_Q2_054_partial_03_0133,
  ep_Q2_054_partial_03_0134,
  ep_Q2_054_partial_03_0135,
  ep_Q2_054_partial_03_0136,
  ep_Q2_054_partial_03_0137,
  ep_Q2_054_partial_03_0138,
  ep_Q2_054_partial_03_0139,
  ep_Q2_054_partial_03_0140,
  ep_Q2_054_partial_03_0141,
  ep_Q2_054_partial_03_0142,
  ep_Q2_054_partial_03_0143,
  ep_Q2_054_partial_03_0144,
  ep_Q2_054_partial_03_0145,
  ep_Q2_054_partial_03_0146,
  ep_Q2_054_partial_03_0147,
  ep_Q2_054_partial_03_0148,
  ep_Q2_054_partial_03_0149,
  ep_Q2_054_partial_03_0150
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_03_0100_0150 : Poly :=
[
  term ((423311487840 : Rat) / 45033486517) [(4, 2), (6, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1981405293750 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term ((9510965937900 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((-9787526138574 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-9240141746682 : Rat) / 45033486517) [(4, 2), (6, 1), (7, 2)],
  term ((646209843723 : Rat) / 45033486517) [(4, 2), (6, 1), (8, 1)],
  term ((367433671446 : Rat) / 45033486517) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-2814301406502 : Rat) / 45033486517) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((49317158554686 : Rat) / 45033486517) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(4, 2), (6, 1), (12, 1)],
  term ((-40347326414430 : Rat) / 45033486517) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-19335678712956 : Rat) / 45033486517) [(4, 2), (6, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((2954143252881 : Rat) / 45033486517) [(4, 2), (6, 2)],
  term ((-22879968750 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (11, 1)],
  term ((1901925691380 : Rat) / 45033486517) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((-1195507001691 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((826812798327 : Rat) / 90066973034) [(4, 2), (7, 1), (11, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((3050662500 : Rat) / 45033486517) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((1360589118183 : Rat) / 45033486517) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-3432202137711 : Rat) / 90066973034) [(4, 2), (7, 1), (13, 1)],
  term ((27983516608899 : Rat) / 90066973034) [(4, 2), (7, 1), (15, 1)],
  term ((476093879505 : Rat) / 45033486517) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-729377331345 : Rat) / 45033486517) [(4, 2), (7, 2)],
  term ((-183039750000 : Rat) / 45033486517) [(4, 2), (7, 2), (8, 1)],
  term ((-207157710114 : Rat) / 45033486517) [(4, 2), (7, 2), (12, 1)],
  term ((18303975000 : Rat) / 45033486517) [(4, 2), (7, 2), (16, 1)],
  term ((-2500632363669 : Rat) / 180133946068) [(4, 2), (8, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-670413261276 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((89484995937 : Rat) / 45033486517) [(4, 2), (8, 1), (11, 2)],
  term ((-89484995937 : Rat) / 90066973034) [(4, 2), (8, 1), (12, 1)],
  term ((536909975622 : Rat) / 45033486517) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((163510728168 : Rat) / 45033486517) [(4, 2), (9, 1), (11, 1)],
  term ((571563488916 : Rat) / 45033486517) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((260621918862 : Rat) / 45033486517) [(4, 2), (9, 1), (13, 1)],
  term ((34170602184 : Rat) / 45033486517) [(4, 2), (9, 1), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(4, 2), (11, 1), (13, 1)],
  term ((-81549561314555 : Rat) / 90066973034) [(4, 2), (11, 1), (15, 1)],
  term ((159714847335 : Rat) / 90066973034) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(4, 2), (11, 2)],
  term ((-4260671167009 : Rat) / 90066973034) [(4, 2), (12, 1)],
  term ((-5533560238413 : Rat) / 45033486517) [(4, 2), (12, 1), (15, 2)],
  term ((66269200629419 : Rat) / 90066973034) [(4, 2), (13, 1), (15, 1)],
  term ((16983175352367 : Rat) / 45033486517) [(4, 2), (15, 2)],
  term ((-159714847335 : Rat) / 90066973034) [(4, 2), (15, 2), (16, 1)],
  term ((423311487840 : Rat) / 45033486517) [(5, 2), (6, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1981405293750 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((9510965937900 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((-9787526138574 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-9240141746682 : Rat) / 45033486517) [(5, 2), (6, 1), (7, 2)],
  term ((646209843723 : Rat) / 45033486517) [(5, 2), (6, 1), (8, 1)],
  term ((367433671446 : Rat) / 45033486517) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-2814301406502 : Rat) / 45033486517) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((49317158554686 : Rat) / 45033486517) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-4067550000 : Rat) / 45033486517) [(5, 2), (6, 1), (12, 1)],
  term ((-40347326414430 : Rat) / 45033486517) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-19335678712956 : Rat) / 45033486517) [(5, 2), (6, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((2954143252881 : Rat) / 45033486517) [(5, 2), (6, 2)],
  term ((-22879968750 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term ((1901925691380 : Rat) / 45033486517) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((-1195507001691 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((826812798327 : Rat) / 90066973034) [(5, 2), (7, 1), (11, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((3050662500 : Rat) / 45033486517) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((1360589118183 : Rat) / 45033486517) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-3432202137711 : Rat) / 90066973034) [(5, 2), (7, 1), (13, 1)],
  term ((27983516608899 : Rat) / 90066973034) [(5, 2), (7, 1), (15, 1)],
  term ((476093879505 : Rat) / 45033486517) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-729377331345 : Rat) / 45033486517) [(5, 2), (7, 2)],
  term ((-183039750000 : Rat) / 45033486517) [(5, 2), (7, 2), (8, 1)],
  term ((-207157710114 : Rat) / 45033486517) [(5, 2), (7, 2), (12, 1)],
  term ((18303975000 : Rat) / 45033486517) [(5, 2), (7, 2), (16, 1)],
  term ((-2500632363669 : Rat) / 180133946068) [(5, 2), (8, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((-670413261276 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((89484995937 : Rat) / 45033486517) [(5, 2), (8, 1), (11, 2)],
  term ((-89484995937 : Rat) / 90066973034) [(5, 2), (8, 1), (12, 1)],
  term ((536909975622 : Rat) / 45033486517) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((163510728168 : Rat) / 45033486517) [(5, 2), (9, 1), (11, 1)],
  term ((571563488916 : Rat) / 45033486517) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((260621918862 : Rat) / 45033486517) [(5, 2), (9, 1), (13, 1)],
  term ((34170602184 : Rat) / 45033486517) [(5, 2), (9, 1), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(5, 2), (11, 1), (13, 1)],
  term ((-81549561314555 : Rat) / 90066973034) [(5, 2), (11, 1), (15, 1)],
  term ((159714847335 : Rat) / 90066973034) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(5, 2), (11, 2)],
  term ((-4260671167009 : Rat) / 90066973034) [(5, 2), (12, 1)],
  term ((-5533560238413 : Rat) / 45033486517) [(5, 2), (12, 1), (15, 2)],
  term ((66269200629419 : Rat) / 90066973034) [(5, 2), (13, 1), (15, 1)],
  term ((16983175352367 : Rat) / 45033486517) [(5, 2), (15, 2)],
  term ((-159714847335 : Rat) / 90066973034) [(5, 2), (15, 2), (16, 1)],
  term ((82367887500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((1981405293750 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((-9510965937900 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((9787526138574 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((1981405293750 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)],
  term ((-9510965937900 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((9787526138574 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((82367887500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3)],
  term ((9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2)],
  term ((9240141746682 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)],
  term ((-646209843723 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2)],
  term ((-423311487840 : Rat) / 45033486517) [(6, 1), (8, 2)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((2814301406502 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((-49317158554686 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1)],
  term ((40347326414430 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((19335678712956 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-646209843723 : Rat) / 45033486517) [(6, 1), (8, 3)],
  term ((-423311487840 : Rat) / 45033486517) [(6, 1), (9, 2)],
  term ((-49317158554686 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)],
  term ((40347326414430 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((19335678712956 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 3), (13, 1)],
  term ((2814301406502 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1)],
  term ((-2954143252881 : Rat) / 45033486517) [(6, 2), (8, 2)],
  term ((-2954143252881 : Rat) / 45033486517) [(6, 2), (9, 2)],
  term ((22879968750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-1901925691380 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((1195507001691 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1)],
  term ((367433671446 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((-826812798327 : Rat) / 90066973034) [(7, 1), (8, 2), (11, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-1360589118183 : Rat) / 45033486517) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((3432202137711 : Rat) / 90066973034) [(7, 1), (8, 2), (13, 1)],
  term ((-27983516608899 : Rat) / 90066973034) [(7, 1), (8, 2), (15, 1)],
  term ((-476093879505 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((22879968750 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1)],
  term ((-1901925691380 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1)],
  term ((-826812798327 : Rat) / 90066973034) [(7, 1), (9, 2), (11, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1360589118183 : Rat) / 45033486517) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((3432202137711 : Rat) / 90066973034) [(7, 1), (9, 2), (13, 1)],
  term ((-27983516608899 : Rat) / 90066973034) [(7, 1), (9, 2), (15, 1)],
  term ((-476093879505 : Rat) / 45033486517) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1195507001691 : Rat) / 45033486517) [(7, 1), (9, 3)],
  term ((367433671446 : Rat) / 45033486517) [(7, 1), (9, 3), (12, 1)],
  term ((183039750000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2)],
  term ((729377331345 : Rat) / 45033486517) [(7, 2), (8, 2)],
  term ((207157710114 : Rat) / 45033486517) [(7, 2), (8, 2), (12, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 2), (16, 1)],
  term ((183039750000 : Rat) / 45033486517) [(7, 2), (8, 3)],
  term ((729377331345 : Rat) / 45033486517) [(7, 2), (9, 2)],
  term ((207157710114 : Rat) / 45033486517) [(7, 2), (9, 2), (12, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (9, 2), (16, 1)],
  term ((2500632363669 : Rat) / 180133946068) [(8, 1), (9, 2)],
  term ((89484995937 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((670413261276 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(8, 1), (9, 2), (12, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-163510728168 : Rat) / 45033486517) [(8, 2), (9, 1), (11, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-260621918862 : Rat) / 45033486517) [(8, 2), (9, 1), (13, 1)],
  term ((-34170602184 : Rat) / 45033486517) [(8, 2), (9, 1), (15, 1)],
  term ((-3377885020038 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)],
  term ((81549561314555 : Rat) / 90066973034) [(8, 2), (11, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((4260671167009 : Rat) / 90066973034) [(8, 2), (12, 1)],
  term ((5533560238413 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((-66269200629419 : Rat) / 90066973034) [(8, 2), (13, 1), (15, 1)],
  term ((-16983175352367 : Rat) / 45033486517) [(8, 2), (15, 2)],
  term ((159714847335 : Rat) / 90066973034) [(8, 2), (15, 2), (16, 1)],
  term ((2500632363669 : Rat) / 180133946068) [(8, 3)],
  term ((89484995937 : Rat) / 45033486517) [(8, 3), (11, 1), (13, 1)],
  term ((670413261276 : Rat) / 45033486517) [(8, 3), (11, 1), (15, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 3), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(8, 3), (12, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1)],
  term ((-3377885020038 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(9, 2), (11, 1), (13, 1)],
  term ((81549561314555 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(9, 2), (11, 2)],
  term ((4260671167009 : Rat) / 90066973034) [(9, 2), (12, 1)],
  term ((5533560238413 : Rat) / 45033486517) [(9, 2), (12, 1), (15, 2)],
  term ((-66269200629419 : Rat) / 90066973034) [(9, 2), (13, 1), (15, 1)],
  term ((-16983175352367 : Rat) / 45033486517) [(9, 2), (15, 2)],
  term ((159714847335 : Rat) / 90066973034) [(9, 2), (15, 2), (16, 1)],
  term ((-163510728168 : Rat) / 45033486517) [(9, 3), (11, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(9, 3), (12, 1), (15, 1)],
  term ((-260621918862 : Rat) / 45033486517) [(9, 3), (13, 1)],
  term ((-34170602184 : Rat) / 45033486517) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 150. -/
theorem ep_Q2_054_block_03_0100_0150_valid :
    checkProductSumEq ep_Q2_054_partials_03_0100_0150
      ep_Q2_054_block_03_0100_0150 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
