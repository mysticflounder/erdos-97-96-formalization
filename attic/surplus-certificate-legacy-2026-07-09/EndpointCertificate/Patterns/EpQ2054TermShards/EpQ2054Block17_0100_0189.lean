/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 17:100-189

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 17 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_17_0100_0189 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0100 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 17. -/
def ep_Q2_054_partial_17_0100 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 17. -/
theorem ep_Q2_054_partial_17_0100_valid :
    mulPoly ep_Q2_054_coefficient_17_0100
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0101 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 101 for generator 17. -/
def ep_Q2_054_partial_17_0101 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 17. -/
theorem ep_Q2_054_partial_17_0101_valid :
    mulPoly ep_Q2_054_coefficient_17_0101
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0102 : Poly :=
[
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 102 for generator 17. -/
def ep_Q2_054_partial_17_0102 : Poly :=
[
  term ((25390813573440 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 17. -/
theorem ep_Q2_054_partial_17_0102_valid :
    mulPoly ep_Q2_054_coefficient_17_0102
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0103 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 17. -/
def ep_Q2_054_partial_17_0103 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(3, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 17. -/
theorem ep_Q2_054_partial_17_0103_valid :
    mulPoly ep_Q2_054_coefficient_17_0103
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0104 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 17. -/
def ep_Q2_054_partial_17_0104 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 17. -/
theorem ep_Q2_054_partial_17_0104_valid :
    mulPoly ep_Q2_054_coefficient_17_0104
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0105 : Poly :=
[
  term ((2716060041945 : Rat) / 45033486517) [(3, 1), (13, 1)]
]

/-- Partial product 105 for generator 17. -/
def ep_Q2_054_partial_17_0105 : Poly :=
[
  term ((5432120083890 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((5432120083890 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-2716060041945 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1)],
  term ((-2716060041945 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 17. -/
theorem ep_Q2_054_partial_17_0105_valid :
    mulPoly ep_Q2_054_coefficient_17_0105
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0106 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 17. -/
def ep_Q2_054_partial_17_0106 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 17. -/
theorem ep_Q2_054_partial_17_0106_valid :
    mulPoly ep_Q2_054_coefficient_17_0106
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0107 : Poly :=
[
  term ((-6347703393360 : Rat) / 45033486517) [(3, 1), (15, 1)]
]

/-- Partial product 107 for generator 17. -/
def ep_Q2_054_partial_17_0107 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(3, 1), (8, 2), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 17. -/
theorem ep_Q2_054_partial_17_0107_valid :
    mulPoly ep_Q2_054_coefficient_17_0107
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0108 : Poly :=
[
  term ((-437344995900 : Rat) / 45033486517) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 17. -/
def ep_Q2_054_partial_17_0108 : Poly :=
[
  term ((-874689991800 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-874689991800 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((437344995900 : Rat) / 45033486517) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((437344995900 : Rat) / 45033486517) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 17. -/
theorem ep_Q2_054_partial_17_0108_valid :
    mulPoly ep_Q2_054_coefficient_17_0108
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0109 : Poly :=
[
  term ((-1153415058465 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 109 for generator 17. -/
def ep_Q2_054_partial_17_0109 : Poly :=
[
  term ((-2306830116930 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)],
  term ((1153415058465 : Rat) / 45033486517) [(6, 1), (8, 2)],
  term ((1153415058465 : Rat) / 45033486517) [(6, 1), (9, 2)],
  term ((-2306830116930 : Rat) / 45033486517) [(6, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 17. -/
theorem ep_Q2_054_partial_17_0109_valid :
    mulPoly ep_Q2_054_coefficient_17_0109
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0110 : Poly :=
[
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 110 for generator 17. -/
def ep_Q2_054_partial_17_0110 : Poly :=
[
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 3), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (9, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 17. -/
theorem ep_Q2_054_partial_17_0110_valid :
    mulPoly ep_Q2_054_coefficient_17_0110
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0111 : Poly :=
[
  term ((-305353589886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 111 for generator 17. -/
def ep_Q2_054_partial_17_0111 : Poly :=
[
  term ((305353589886 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((305353589886 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3)],
  term ((-610707179772 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)],
  term ((-610707179772 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 17. -/
theorem ep_Q2_054_partial_17_0111_valid :
    mulPoly ep_Q2_054_coefficient_17_0111
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0112 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 112 for generator 17. -/
def ep_Q2_054_partial_17_0112 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 17. -/
theorem ep_Q2_054_partial_17_0112_valid :
    mulPoly ep_Q2_054_coefficient_17_0112
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0113 : Poly :=
[
  term ((-2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 113 for generator 17. -/
def ep_Q2_054_partial_17_0113 : Poly :=
[
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (11, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 17. -/
theorem ep_Q2_054_partial_17_0113_valid :
    mulPoly ep_Q2_054_coefficient_17_0113
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0114 : Poly :=
[
  term ((7837787075787 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 114 for generator 17. -/
def ep_Q2_054_partial_17_0114 : Poly :=
[
  term ((-7837787075787 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((-7837787075787 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((15675574151574 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((15675574151574 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 17. -/
theorem ep_Q2_054_partial_17_0114_valid :
    mulPoly ep_Q2_054_coefficient_17_0114
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0115 : Poly :=
[
  term ((-2779032076398 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 115 for generator 17. -/
def ep_Q2_054_partial_17_0115 : Poly :=
[
  term ((2779032076398 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((2779032076398 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1)],
  term ((-5558064152796 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((-5558064152796 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 17. -/
theorem ep_Q2_054_partial_17_0115_valid :
    mulPoly ep_Q2_054_coefficient_17_0115
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0116 : Poly :=
[
  term ((-9706893109182 : Rat) / 45033486517) [(6, 1), (7, 2)]
]

/-- Partial product 116 for generator 17. -/
def ep_Q2_054_partial_17_0116 : Poly :=
[
  term ((9706893109182 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2)],
  term ((9706893109182 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)],
  term ((-19413786218364 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 17. -/
theorem ep_Q2_054_partial_17_0116_valid :
    mulPoly ep_Q2_054_coefficient_17_0116
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0117 : Poly :=
[
  term ((3288997778166 : Rat) / 45033486517) [(6, 1), (8, 1)]
]

/-- Partial product 117 for generator 17. -/
def ep_Q2_054_partial_17_0117 : Poly :=
[
  term ((6577995556332 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-3288997778166 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2)],
  term ((-3288997778166 : Rat) / 45033486517) [(6, 1), (8, 3)],
  term ((6577995556332 : Rat) / 45033486517) [(6, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 17. -/
theorem ep_Q2_054_partial_17_0117_valid :
    mulPoly ep_Q2_054_coefficient_17_0117
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0118 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 118 for generator 17. -/
def ep_Q2_054_partial_17_0118 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 3), (12, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 2), (8, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 17. -/
theorem ep_Q2_054_partial_17_0118_valid :
    mulPoly ep_Q2_054_coefficient_17_0118
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0119 : Poly :=
[
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 119 for generator 17. -/
def ep_Q2_054_partial_17_0119 : Poly :=
[
  term ((-91905676988148 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 3), (13, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(6, 2), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 17. -/
theorem ep_Q2_054_partial_17_0119_valid :
    mulPoly ep_Q2_054_coefficient_17_0119
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0120 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 17. -/
def ep_Q2_054_partial_17_0120 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 2), (8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 17. -/
theorem ep_Q2_054_partial_17_0120_valid :
    mulPoly ep_Q2_054_coefficient_17_0120
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0121 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 121 for generator 17. -/
def ep_Q2_054_partial_17_0121 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 3), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 2), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 17. -/
theorem ep_Q2_054_partial_17_0121_valid :
    mulPoly ep_Q2_054_coefficient_17_0121
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0122 : Poly :=
[
  term ((-408259634940 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 122 for generator 17. -/
def ep_Q2_054_partial_17_0122 : Poly :=
[
  term ((-816519269880 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((408259634940 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((408259634940 : Rat) / 45033486517) [(6, 1), (9, 3), (13, 1)],
  term ((-816519269880 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 17. -/
theorem ep_Q2_054_partial_17_0122_valid :
    mulPoly ep_Q2_054_coefficient_17_0122
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0123 : Poly :=
[
  term ((6388336575990 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 123 for generator 17. -/
def ep_Q2_054_partial_17_0123 : Poly :=
[
  term ((12776673151980 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1)],
  term ((-6388336575990 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((-6388336575990 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1)],
  term ((12776673151980 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 17. -/
theorem ep_Q2_054_partial_17_0123_valid :
    mulPoly ep_Q2_054_coefficient_17_0123
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0124 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 17. -/
def ep_Q2_054_partial_17_0124 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 17. -/
theorem ep_Q2_054_partial_17_0124_valid :
    mulPoly ep_Q2_054_coefficient_17_0124
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0125 : Poly :=
[
  term ((367433671446 : Rat) / 45033486517) [(6, 1), (9, 2)]
]

/-- Partial product 125 for generator 17. -/
def ep_Q2_054_partial_17_0125 : Poly :=
[
  term ((734867342892 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 2)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 4)],
  term ((734867342892 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 17. -/
theorem ep_Q2_054_partial_17_0125_valid :
    mulPoly ep_Q2_054_coefficient_17_0125
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0126 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 17. -/
def ep_Q2_054_partial_17_0126 : Poly :=
[
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 17. -/
theorem ep_Q2_054_partial_17_0126_valid :
    mulPoly ep_Q2_054_coefficient_17_0126
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0127 : Poly :=
[
  term ((1420928166735 : Rat) / 45033486517) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 127 for generator 17. -/
def ep_Q2_054_partial_17_0127 : Poly :=
[
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 17. -/
theorem ep_Q2_054_partial_17_0127_valid :
    mulPoly ep_Q2_054_coefficient_17_0127
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0128 : Poly :=
[
  term ((18834094305009 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 128 for generator 17. -/
def ep_Q2_054_partial_17_0128 : Poly :=
[
  term ((37668188610018 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-18834094305009 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((-18834094305009 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((37668188610018 : Rat) / 45033486517) [(6, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 17. -/
theorem ep_Q2_054_partial_17_0128_valid :
    mulPoly ep_Q2_054_coefficient_17_0128
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0129 : Poly :=
[
  term ((-2841856333470 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 17. -/
def ep_Q2_054_partial_17_0129 : Poly :=
[
  term ((-5683712666940 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 17. -/
theorem ep_Q2_054_partial_17_0129_valid :
    mulPoly ep_Q2_054_coefficient_17_0129
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0130 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 17. -/
def ep_Q2_054_partial_17_0130 : Poly :=
[
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 17. -/
theorem ep_Q2_054_partial_17_0130_valid :
    mulPoly ep_Q2_054_coefficient_17_0130
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0131 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (16, 1)]
]

/-- Partial product 131 for generator 17. -/
def ep_Q2_054_partial_17_0131 : Poly :=
[
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (8, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (9, 2), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 17. -/
theorem ep_Q2_054_partial_17_0131_valid :
    mulPoly ep_Q2_054_coefficient_17_0131
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0132 : Poly :=
[
  term ((736679955627 : Rat) / 45033486517) [(6, 2)]
]

/-- Partial product 132 for generator 17. -/
def ep_Q2_054_partial_17_0132 : Poly :=
[
  term ((1473359911254 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (8, 2)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (9, 2)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 17. -/
theorem ep_Q2_054_partial_17_0132_valid :
    mulPoly ep_Q2_054_coefficient_17_0132
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0133 : Poly :=
[
  term ((-632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 133 for generator 17. -/
def ep_Q2_054_partial_17_0133 : Poly :=
[
  term ((-1265682617892 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 3)],
  term ((632841308946 : Rat) / 45033486517) [(7, 1), (8, 3), (9, 1)],
  term ((-1265682617892 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 17. -/
theorem ep_Q2_054_partial_17_0133_valid :
    mulPoly ep_Q2_054_coefficient_17_0133
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0134 : Poly :=
[
  term ((-1825821506250 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 134 for generator 17. -/
def ep_Q2_054_partial_17_0134 : Poly :=
[
  term ((-3651643012500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((1825821506250 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((1825821506250 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1)],
  term ((-3651643012500 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 17. -/
theorem ep_Q2_054_partial_17_0134_valid :
    mulPoly ep_Q2_054_coefficient_17_0134
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0135 : Poly :=
[
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 135 for generator 17. -/
def ep_Q2_054_partial_17_0135 : Poly :=
[
  term ((367622707952592 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1), (13, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 17. -/
theorem ep_Q2_054_partial_17_0135_valid :
    mulPoly ep_Q2_054_coefficient_17_0135
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0136 : Poly :=
[
  term ((-217171717272 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 136 for generator 17. -/
def ep_Q2_054_partial_17_0136 : Poly :=
[
  term ((-434343434544 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((217171717272 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((217171717272 : Rat) / 45033486517) [(7, 1), (8, 3), (13, 1)],
  term ((-434343434544 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 17. -/
theorem ep_Q2_054_partial_17_0136_valid :
    mulPoly ep_Q2_054_coefficient_17_0136
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0137 : Poly :=
[
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 137 for generator 17. -/
def ep_Q2_054_partial_17_0137 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 3), (13, 1), (15, 2)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 17. -/
theorem ep_Q2_054_partial_17_0137_valid :
    mulPoly ep_Q2_054_coefficient_17_0137
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0138 : Poly :=
[
  term ((-15278771015991 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 138 for generator 17. -/
def ep_Q2_054_partial_17_0138 : Poly :=
[
  term ((-30557542031982 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((15278771015991 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((15278771015991 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1)],
  term ((-30557542031982 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 17. -/
theorem ep_Q2_054_partial_17_0138_valid :
    mulPoly ep_Q2_054_coefficient_17_0138
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0139 : Poly :=
[
  term ((-460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 17. -/
def ep_Q2_054_partial_17_0139 : Poly :=
[
  term ((-921681134010 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1), (16, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 17. -/
theorem ep_Q2_054_partial_17_0139_valid :
    mulPoly ep_Q2_054_coefficient_17_0139
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0140 : Poly :=
[
  term ((-2815908835833 : Rat) / 90066973034) [(7, 1), (9, 1)]
]

/-- Partial product 140 for generator 17. -/
def ep_Q2_054_partial_17_0140 : Poly :=
[
  term ((-2815908835833 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((2815908835833 : Rat) / 90066973034) [(7, 1), (8, 2), (9, 1)],
  term ((2815908835833 : Rat) / 90066973034) [(7, 1), (9, 3)],
  term ((-2815908835833 : Rat) / 45033486517) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 17. -/
theorem ep_Q2_054_partial_17_0140_valid :
    mulPoly ep_Q2_054_coefficient_17_0140
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0141 : Poly :=
[
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 141 for generator 17. -/
def ep_Q2_054_partial_17_0141 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 3), (11, 1), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 17. -/
theorem ep_Q2_054_partial_17_0141_valid :
    mulPoly ep_Q2_054_coefficient_17_0141
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0142 : Poly :=
[
  term ((419869613718 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 142 for generator 17. -/
def ep_Q2_054_partial_17_0142 : Poly :=
[
  term ((839739227436 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((-419869613718 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((-419869613718 : Rat) / 45033486517) [(7, 1), (9, 3), (12, 1)],
  term ((839739227436 : Rat) / 45033486517) [(7, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 17. -/
theorem ep_Q2_054_partial_17_0142_valid :
    mulPoly ep_Q2_054_coefficient_17_0142
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0143 : Poly :=
[
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 143 for generator 17. -/
def ep_Q2_054_partial_17_0143 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 17. -/
theorem ep_Q2_054_partial_17_0143_valid :
    mulPoly ep_Q2_054_coefficient_17_0143
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0144 : Poly :=
[
  term ((15253312500 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 144 for generator 17. -/
def ep_Q2_054_partial_17_0144 : Poly :=
[
  term ((30506625000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(7, 1), (9, 3), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 17. -/
theorem ep_Q2_054_partial_17_0144_valid :
    mulPoly ep_Q2_054_coefficient_17_0144
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0145 : Poly :=
[
  term ((-13105015129599 : Rat) / 180133946068) [(7, 1), (11, 1)]
]

/-- Partial product 145 for generator 17. -/
def ep_Q2_054_partial_17_0145 : Poly :=
[
  term ((-13105015129599 : Rat) / 90066973034) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((13105015129599 : Rat) / 180133946068) [(7, 1), (8, 2), (11, 1)],
  term ((13105015129599 : Rat) / 180133946068) [(7, 1), (9, 2), (11, 1)],
  term ((-13105015129599 : Rat) / 90066973034) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 17. -/
theorem ep_Q2_054_partial_17_0145_valid :
    mulPoly ep_Q2_054_coefficient_17_0145
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0146 : Poly :=
[
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 146 for generator 17. -/
def ep_Q2_054_partial_17_0146 : Poly :=
[
  term ((-159038119382616 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 17. -/
theorem ep_Q2_054_partial_17_0146_valid :
    mulPoly ep_Q2_054_coefficient_17_0146
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0147 : Poly :=
[
  term ((208118815077 : Rat) / 45033486517) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 147 for generator 17. -/
def ep_Q2_054_partial_17_0147 : Poly :=
[
  term ((416237630154 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((416237630154 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 17. -/
theorem ep_Q2_054_partial_17_0147_valid :
    mulPoly ep_Q2_054_coefficient_17_0147
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0148 : Poly :=
[
  term ((-200815870941 : Rat) / 90066973034) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 148 for generator 17. -/
def ep_Q2_054_partial_17_0148 : Poly :=
[
  term ((-200815870941 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((200815870941 : Rat) / 90066973034) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((200815870941 : Rat) / 90066973034) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-200815870941 : Rat) / 45033486517) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 17. -/
theorem ep_Q2_054_partial_17_0148_valid :
    mulPoly ep_Q2_054_coefficient_17_0148
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0149 : Poly :=
[
  term ((-26754410417553 : Rat) / 180133946068) [(7, 1), (13, 1)]
]

/-- Partial product 149 for generator 17. -/
def ep_Q2_054_partial_17_0149 : Poly :=
[
  term ((-26754410417553 : Rat) / 90066973034) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((26754410417553 : Rat) / 180133946068) [(7, 1), (8, 2), (13, 1)],
  term ((26754410417553 : Rat) / 180133946068) [(7, 1), (9, 2), (13, 1)],
  term ((-26754410417553 : Rat) / 90066973034) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 17. -/
theorem ep_Q2_054_partial_17_0149_valid :
    mulPoly ep_Q2_054_coefficient_17_0149
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0150 : Poly :=
[
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 150 for generator 17. -/
def ep_Q2_054_partial_17_0150 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 17. -/
theorem ep_Q2_054_partial_17_0150_valid :
    mulPoly ep_Q2_054_coefficient_17_0150
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0151 : Poly :=
[
  term ((48865819275705 : Rat) / 180133946068) [(7, 1), (15, 1)]
]

/-- Partial product 151 for generator 17. -/
def ep_Q2_054_partial_17_0151 : Poly :=
[
  term ((48865819275705 : Rat) / 90066973034) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-48865819275705 : Rat) / 180133946068) [(7, 1), (8, 2), (15, 1)],
  term ((-48865819275705 : Rat) / 180133946068) [(7, 1), (9, 2), (15, 1)],
  term ((48865819275705 : Rat) / 90066973034) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 17. -/
theorem ep_Q2_054_partial_17_0151_valid :
    mulPoly ep_Q2_054_coefficient_17_0151
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0152 : Poly :=
[
  term ((644554082082 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 17. -/
def ep_Q2_054_partial_17_0152 : Poly :=
[
  term ((1289108164164 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-644554082082 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-644554082082 : Rat) / 45033486517) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1289108164164 : Rat) / 45033486517) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 17. -/
theorem ep_Q2_054_partial_17_0152_valid :
    mulPoly ep_Q2_054_coefficient_17_0152
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0153 : Poly :=
[
  term ((-384383475000 : Rat) / 45033486517) [(7, 2)]
]

/-- Partial product 153 for generator 17. -/
def ep_Q2_054_partial_17_0153 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1)],
  term ((384383475000 : Rat) / 45033486517) [(7, 2), (8, 2)],
  term ((384383475000 : Rat) / 45033486517) [(7, 2), (9, 2)],
  term ((-768766950000 : Rat) / 45033486517) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 17. -/
theorem ep_Q2_054_partial_17_0153_valid :
    mulPoly ep_Q2_054_coefficient_17_0153
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0154 : Poly :=
[
  term ((772104952386 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 154 for generator 17. -/
def ep_Q2_054_partial_17_0154 : Poly :=
[
  term ((1544209904772 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2)],
  term ((-772104952386 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2)],
  term ((-772104952386 : Rat) / 45033486517) [(7, 2), (8, 3)],
  term ((1544209904772 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 17. -/
theorem ep_Q2_054_partial_17_0154_valid :
    mulPoly ep_Q2_054_coefficient_17_0154
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0155 : Poly :=
[
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 155 for generator 17. -/
def ep_Q2_054_partial_17_0155 : Poly :=
[
  term ((-13727981250000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 3), (11, 1), (13, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 17. -/
theorem ep_Q2_054_partial_17_0155_valid :
    mulPoly ep_Q2_054_coefficient_17_0155
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0156 : Poly :=
[
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 156 for generator 17. -/
def ep_Q2_054_partial_17_0156 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 3), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 17. -/
theorem ep_Q2_054_partial_17_0156_valid :
    mulPoly ep_Q2_054_coefficient_17_0156
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0157 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 157 for generator 17. -/
def ep_Q2_054_partial_17_0157 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 3), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 17. -/
theorem ep_Q2_054_partial_17_0157_valid :
    mulPoly ep_Q2_054_coefficient_17_0157
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0158 : Poly :=
[
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 158 for generator 17. -/
def ep_Q2_054_partial_17_0158 : Poly :=
[
  term ((-1057909264920 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(7, 3), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 17. -/
theorem ep_Q2_054_partial_17_0158_valid :
    mulPoly ep_Q2_054_coefficient_17_0158
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0159 : Poly :=
[
  term ((-26217971136 : Rat) / 45033486517) [(7, 2), (12, 1)]
]

/-- Partial product 159 for generator 17. -/
def ep_Q2_054_partial_17_0159 : Poly :=
[
  term ((-52435942272 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (12, 1)],
  term ((26217971136 : Rat) / 45033486517) [(7, 2), (8, 2), (12, 1)],
  term ((26217971136 : Rat) / 45033486517) [(7, 2), (9, 2), (12, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(7, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 17. -/
theorem ep_Q2_054_partial_17_0159_valid :
    mulPoly ep_Q2_054_coefficient_17_0159
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0160 : Poly :=
[
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 160 for generator 17. -/
def ep_Q2_054_partial_17_0160 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (8, 2), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (9, 2), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 17. -/
theorem ep_Q2_054_partial_17_0160_valid :
    mulPoly ep_Q2_054_coefficient_17_0160
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0161 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (16, 1)]
]

/-- Partial product 161 for generator 17. -/
def ep_Q2_054_partial_17_0161 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (9, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 17. -/
theorem ep_Q2_054_partial_17_0161_valid :
    mulPoly ep_Q2_054_coefficient_17_0161
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0162 : Poly :=
[
  term ((-1481833872837 : Rat) / 45033486517) [(8, 1)]
]

/-- Partial product 162 for generator 17. -/
def ep_Q2_054_partial_17_0162 : Poly :=
[
  term ((-2963667745674 : Rat) / 45033486517) [(6, 1), (8, 2)],
  term ((-2963667745674 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)],
  term ((1481833872837 : Rat) / 45033486517) [(8, 1), (9, 2)],
  term ((1481833872837 : Rat) / 45033486517) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 17. -/
theorem ep_Q2_054_partial_17_0162_valid :
    mulPoly ep_Q2_054_coefficient_17_0162
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0163 : Poly :=
[
  term ((734867342892 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 163 for generator 17. -/
def ep_Q2_054_partial_17_0163 : Poly :=
[
  term ((1469734685784 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 1), (9, 3), (13, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 17. -/
theorem ep_Q2_054_partial_17_0163_valid :
    mulPoly ep_Q2_054_coefficient_17_0163
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0164 : Poly :=
[
  term ((-912375715122 : Rat) / 45033486517) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 164 for generator 17. -/
def ep_Q2_054_partial_17_0164 : Poly :=
[
  term ((-1824751430244 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((-1824751430244 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((912375715122 : Rat) / 45033486517) [(8, 1), (9, 3), (15, 1)],
  term ((912375715122 : Rat) / 45033486517) [(8, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 17. -/
theorem ep_Q2_054_partial_17_0164_valid :
    mulPoly ep_Q2_054_coefficient_17_0164
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0165 : Poly :=
[
  term ((47766468035034 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 165 for generator 17. -/
def ep_Q2_054_partial_17_0165 : Poly :=
[
  term ((95532936070068 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((95532936070068 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-47766468035034 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-47766468035034 : Rat) / 45033486517) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 17. -/
theorem ep_Q2_054_partial_17_0165_valid :
    mulPoly ep_Q2_054_coefficient_17_0165
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0166 : Poly :=
[
  term ((301737198393 : Rat) / 90066973034) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 166 for generator 17. -/
def ep_Q2_054_partial_17_0166 : Poly :=
[
  term ((301737198393 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 17. -/
theorem ep_Q2_054_partial_17_0166_valid :
    mulPoly ep_Q2_054_coefficient_17_0166
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0167 : Poly :=
[
  term ((15069684201408 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 167 for generator 17. -/
def ep_Q2_054_partial_17_0167 : Poly :=
[
  term ((30139368402816 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((30139368402816 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-15069684201408 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-15069684201408 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 17. -/
theorem ep_Q2_054_partial_17_0167_valid :
    mulPoly ep_Q2_054_coefficient_17_0167
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0168 : Poly :=
[
  term ((-301737198393 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 17. -/
def ep_Q2_054_partial_17_0168 : Poly :=
[
  term ((-603474396786 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 17. -/
theorem ep_Q2_054_partial_17_0168_valid :
    mulPoly ep_Q2_054_coefficient_17_0168
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0169 : Poly :=
[
  term ((-3593150724636 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 169 for generator 17. -/
def ep_Q2_054_partial_17_0169 : Poly :=
[
  term ((-7186301449272 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2)],
  term ((-7186301449272 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((3593150724636 : Rat) / 45033486517) [(8, 1), (9, 2), (15, 2)],
  term ((3593150724636 : Rat) / 45033486517) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 17. -/
theorem ep_Q2_054_partial_17_0169_valid :
    mulPoly ep_Q2_054_coefficient_17_0169
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0170 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 170 for generator 17. -/
def ep_Q2_054_partial_17_0170 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 17. -/
theorem ep_Q2_054_partial_17_0170_valid :
    mulPoly ep_Q2_054_coefficient_17_0170
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0171 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (16, 1)]
]

/-- Partial product 171 for generator 17. -/
def ep_Q2_054_partial_17_0171 : Poly :=
[
  term ((-201158132262 : Rat) / 45033486517) [(6, 1), (8, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (9, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 17. -/
theorem ep_Q2_054_partial_17_0171_valid :
    mulPoly ep_Q2_054_coefficient_17_0171
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0172 : Poly :=
[
  term ((311355318438 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 172 for generator 17. -/
def ep_Q2_054_partial_17_0172 : Poly :=
[
  term ((622710636876 : Rat) / 45033486517) [(6, 1), (8, 3)],
  term ((622710636876 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(8, 2), (9, 2)],
  term ((-311355318438 : Rat) / 45033486517) [(8, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 17. -/
theorem ep_Q2_054_partial_17_0172_valid :
    mulPoly ep_Q2_054_coefficient_17_0172
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0173 : Poly :=
[
  term ((673628397651 : Rat) / 180133946068) [(9, 1), (11, 1)]
]

/-- Partial product 173 for generator 17. -/
def ep_Q2_054_partial_17_0173 : Poly :=
[
  term ((673628397651 : Rat) / 90066973034) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((673628397651 : Rat) / 90066973034) [(7, 1), (9, 2), (11, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(8, 2), (9, 1), (11, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 17. -/
theorem ep_Q2_054_partial_17_0173_valid :
    mulPoly ep_Q2_054_coefficient_17_0173
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0174 : Poly :=
[
  term ((-2243449205307 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 174 for generator 17. -/
def ep_Q2_054_partial_17_0174 : Poly :=
[
  term ((-2243449205307 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2243449205307 : Rat) / 45033486517) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 17. -/
theorem ep_Q2_054_partial_17_0174_valid :
    mulPoly ep_Q2_054_coefficient_17_0174
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0175 : Poly :=
[
  term ((19531922648949 : Rat) / 180133946068) [(9, 1), (13, 1)]
]

/-- Partial product 175 for generator 17. -/
def ep_Q2_054_partial_17_0175 : Poly :=
[
  term ((19531922648949 : Rat) / 90066973034) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((19531922648949 : Rat) / 90066973034) [(7, 1), (9, 2), (13, 1)],
  term ((-19531922648949 : Rat) / 180133946068) [(8, 2), (9, 1), (13, 1)],
  term ((-19531922648949 : Rat) / 180133946068) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 17. -/
theorem ep_Q2_054_partial_17_0175_valid :
    mulPoly ep_Q2_054_coefficient_17_0175
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0176 : Poly :=
[
  term ((36941552751627 : Rat) / 180133946068) [(9, 1), (15, 1)]
]

/-- Partial product 176 for generator 17. -/
def ep_Q2_054_partial_17_0176 : Poly :=
[
  term ((36941552751627 : Rat) / 90066973034) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((36941552751627 : Rat) / 90066973034) [(7, 1), (9, 2), (15, 1)],
  term ((-36941552751627 : Rat) / 180133946068) [(8, 2), (9, 1), (15, 1)],
  term ((-36941552751627 : Rat) / 180133946068) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 17. -/
theorem ep_Q2_054_partial_17_0176_valid :
    mulPoly ep_Q2_054_coefficient_17_0176
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0177 : Poly :=
[
  term ((798574236675 : Rat) / 90066973034) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 17. -/
def ep_Q2_054_partial_17_0177 : Poly :=
[
  term ((798574236675 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((798574236675 : Rat) / 45033486517) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 17. -/
theorem ep_Q2_054_partial_17_0177_valid :
    mulPoly ep_Q2_054_coefficient_17_0177
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0178 : Poly :=
[
  term ((-1596713436351 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 178 for generator 17. -/
def ep_Q2_054_partial_17_0178 : Poly :=
[
  term ((-3193426872702 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2)],
  term ((-3193426872702 : Rat) / 45033486517) [(7, 1), (9, 3)],
  term ((1596713436351 : Rat) / 45033486517) [(8, 2), (9, 2)],
  term ((1596713436351 : Rat) / 45033486517) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 17. -/
theorem ep_Q2_054_partial_17_0178_valid :
    mulPoly ep_Q2_054_coefficient_17_0178
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0179 : Poly :=
[
  term ((-734867342892 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 179 for generator 17. -/
def ep_Q2_054_partial_17_0179 : Poly :=
[
  term ((-1469734685784 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (12, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(7, 1), (9, 3), (12, 1)],
  term ((734867342892 : Rat) / 45033486517) [(8, 2), (9, 2), (12, 1)],
  term ((734867342892 : Rat) / 45033486517) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 17. -/
theorem ep_Q2_054_partial_17_0179_valid :
    mulPoly ep_Q2_054_coefficient_17_0179
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0180 : Poly :=
[
  term ((-24313961979357 : Rat) / 45033486517) [(11, 1), (15, 1)]
]

/-- Partial product 180 for generator 17. -/
def ep_Q2_054_partial_17_0180 : Poly :=
[
  term ((-48627923958714 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-48627923958714 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((24313961979357 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)],
  term ((24313961979357 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 17. -/
theorem ep_Q2_054_partial_17_0180_valid :
    mulPoly ep_Q2_054_coefficient_17_0180
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0181 : Poly :=
[
  term ((-883122138717 : Rat) / 90066973034) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 17. -/
def ep_Q2_054_partial_17_0181 : Poly :=
[
  term ((-883122138717 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-883122138717 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((883122138717 : Rat) / 90066973034) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((883122138717 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 17. -/
theorem ep_Q2_054_partial_17_0181_valid :
    mulPoly ep_Q2_054_coefficient_17_0181
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0182 : Poly :=
[
  term ((-1628229563431 : Rat) / 45033486517) [(12, 1)]
]

/-- Partial product 182 for generator 17. -/
def ep_Q2_054_partial_17_0182 : Poly :=
[
  term ((-3256459126862 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)],
  term ((-3256459126862 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1)],
  term ((1628229563431 : Rat) / 45033486517) [(8, 2), (12, 1)],
  term ((1628229563431 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 17. -/
theorem ep_Q2_054_partial_17_0182_valid :
    mulPoly ep_Q2_054_coefficient_17_0182
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0183 : Poly :=
[
  term ((-2016170337060 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 183 for generator 17. -/
def ep_Q2_054_partial_17_0183 : Poly :=
[
  term ((-4032340674120 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-4032340674120 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((2016170337060 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((2016170337060 : Rat) / 45033486517) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 17. -/
theorem ep_Q2_054_partial_17_0183_valid :
    mulPoly ep_Q2_054_coefficient_17_0183
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0184 : Poly :=
[
  term ((45403677525 : Rat) / 45033486517) [(12, 1), (16, 1)]
]

/-- Partial product 184 for generator 17. -/
def ep_Q2_054_partial_17_0184 : Poly :=
[
  term ((90807355050 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(8, 2), (12, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 17. -/
theorem ep_Q2_054_partial_17_0184_valid :
    mulPoly ep_Q2_054_coefficient_17_0184
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0185 : Poly :=
[
  term ((4210052195507 : Rat) / 45033486517) [(13, 1), (15, 1)]
]

/-- Partial product 185 for generator 17. -/
def ep_Q2_054_partial_17_0185 : Poly :=
[
  term ((8420104391014 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((8420104391014 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4210052195507 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1)],
  term ((-4210052195507 : Rat) / 45033486517) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 17. -/
theorem ep_Q2_054_partial_17_0185_valid :
    mulPoly ep_Q2_054_coefficient_17_0185
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0186 : Poly :=
[
  term ((-90807355050 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 17. -/
def ep_Q2_054_partial_17_0186 : Poly :=
[
  term ((-181614710100 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 17. -/
theorem ep_Q2_054_partial_17_0186_valid :
    mulPoly ep_Q2_054_coefficient_17_0186
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0187 : Poly :=
[
  term ((-39843615199805 : Rat) / 90066973034) [(15, 2)]
]

/-- Partial product 187 for generator 17. -/
def ep_Q2_054_partial_17_0187 : Poly :=
[
  term ((-39843615199805 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2)],
  term ((-39843615199805 : Rat) / 45033486517) [(7, 1), (9, 1), (15, 2)],
  term ((39843615199805 : Rat) / 90066973034) [(8, 2), (15, 2)],
  term ((39843615199805 : Rat) / 90066973034) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 17. -/
theorem ep_Q2_054_partial_17_0187_valid :
    mulPoly ep_Q2_054_coefficient_17_0187
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0188 : Poly :=
[
  term ((-3119130001407 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 188 for generator 17. -/
def ep_Q2_054_partial_17_0188 : Poly :=
[
  term ((-3119130001407 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 45033486517) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 90066973034) [(8, 2), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 90066973034) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 17. -/
theorem ep_Q2_054_partial_17_0188_valid :
    mulPoly ep_Q2_054_coefficient_17_0188
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 17. -/
def ep_Q2_054_coefficient_17_0189 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(16, 1)]
]

/-- Partial product 189 for generator 17. -/
def ep_Q2_054_partial_17_0189 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(8, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 17. -/
theorem ep_Q2_054_partial_17_0189_valid :
    mulPoly ep_Q2_054_coefficient_17_0189
        ep_Q2_054_generator_17_0100_0189 =
      ep_Q2_054_partial_17_0189 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_17_0100_0189 : List Poly :=
[
  ep_Q2_054_partial_17_0100,
  ep_Q2_054_partial_17_0101,
  ep_Q2_054_partial_17_0102,
  ep_Q2_054_partial_17_0103,
  ep_Q2_054_partial_17_0104,
  ep_Q2_054_partial_17_0105,
  ep_Q2_054_partial_17_0106,
  ep_Q2_054_partial_17_0107,
  ep_Q2_054_partial_17_0108,
  ep_Q2_054_partial_17_0109,
  ep_Q2_054_partial_17_0110,
  ep_Q2_054_partial_17_0111,
  ep_Q2_054_partial_17_0112,
  ep_Q2_054_partial_17_0113,
  ep_Q2_054_partial_17_0114,
  ep_Q2_054_partial_17_0115,
  ep_Q2_054_partial_17_0116,
  ep_Q2_054_partial_17_0117,
  ep_Q2_054_partial_17_0118,
  ep_Q2_054_partial_17_0119,
  ep_Q2_054_partial_17_0120,
  ep_Q2_054_partial_17_0121,
  ep_Q2_054_partial_17_0122,
  ep_Q2_054_partial_17_0123,
  ep_Q2_054_partial_17_0124,
  ep_Q2_054_partial_17_0125,
  ep_Q2_054_partial_17_0126,
  ep_Q2_054_partial_17_0127,
  ep_Q2_054_partial_17_0128,
  ep_Q2_054_partial_17_0129,
  ep_Q2_054_partial_17_0130,
  ep_Q2_054_partial_17_0131,
  ep_Q2_054_partial_17_0132,
  ep_Q2_054_partial_17_0133,
  ep_Q2_054_partial_17_0134,
  ep_Q2_054_partial_17_0135,
  ep_Q2_054_partial_17_0136,
  ep_Q2_054_partial_17_0137,
  ep_Q2_054_partial_17_0138,
  ep_Q2_054_partial_17_0139,
  ep_Q2_054_partial_17_0140,
  ep_Q2_054_partial_17_0141,
  ep_Q2_054_partial_17_0142,
  ep_Q2_054_partial_17_0143,
  ep_Q2_054_partial_17_0144,
  ep_Q2_054_partial_17_0145,
  ep_Q2_054_partial_17_0146,
  ep_Q2_054_partial_17_0147,
  ep_Q2_054_partial_17_0148,
  ep_Q2_054_partial_17_0149,
  ep_Q2_054_partial_17_0150,
  ep_Q2_054_partial_17_0151,
  ep_Q2_054_partial_17_0152,
  ep_Q2_054_partial_17_0153,
  ep_Q2_054_partial_17_0154,
  ep_Q2_054_partial_17_0155,
  ep_Q2_054_partial_17_0156,
  ep_Q2_054_partial_17_0157,
  ep_Q2_054_partial_17_0158,
  ep_Q2_054_partial_17_0159,
  ep_Q2_054_partial_17_0160,
  ep_Q2_054_partial_17_0161,
  ep_Q2_054_partial_17_0162,
  ep_Q2_054_partial_17_0163,
  ep_Q2_054_partial_17_0164,
  ep_Q2_054_partial_17_0165,
  ep_Q2_054_partial_17_0166,
  ep_Q2_054_partial_17_0167,
  ep_Q2_054_partial_17_0168,
  ep_Q2_054_partial_17_0169,
  ep_Q2_054_partial_17_0170,
  ep_Q2_054_partial_17_0171,
  ep_Q2_054_partial_17_0172,
  ep_Q2_054_partial_17_0173,
  ep_Q2_054_partial_17_0174,
  ep_Q2_054_partial_17_0175,
  ep_Q2_054_partial_17_0176,
  ep_Q2_054_partial_17_0177,
  ep_Q2_054_partial_17_0178,
  ep_Q2_054_partial_17_0179,
  ep_Q2_054_partial_17_0180,
  ep_Q2_054_partial_17_0181,
  ep_Q2_054_partial_17_0182,
  ep_Q2_054_partial_17_0183,
  ep_Q2_054_partial_17_0184,
  ep_Q2_054_partial_17_0185,
  ep_Q2_054_partial_17_0186,
  ep_Q2_054_partial_17_0187,
  ep_Q2_054_partial_17_0188,
  ep_Q2_054_partial_17_0189
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_17_0100_0189 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((5432120083890 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-874689991800 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((25390813573440 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5432120083890 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-874689991800 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2716060041945 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(3, 1), (8, 2), (15, 1)],
  term ((437344995900 : Rat) / 45033486517) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (8, 3), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(3, 1), (8, 3), (15, 1), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2716060041945 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(3, 1), (9, 2), (15, 1)],
  term ((437344995900 : Rat) / 45033486517) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((3762086720499 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((326607707952 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((839739227436 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-92068980842124 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-13105015129599 : Rat) / 90066973034) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((416237630154 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-200815870941 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-26754410417553 : Rat) / 90066973034) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((48865819275705 : Rat) / 90066973034) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((1289108164164 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-960329028006 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-704923189992 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-8272130510331 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-27778509955584 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 3), (13, 1)],
  term ((-2306830116930 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((37668188610018 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (11, 1)],
  term ((-8654306345667 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((15555705228378 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1040220932778 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 3), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (9, 1), (13, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (12, 1)],
  term ((528954632460 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((11251103013954 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2)],
  term ((-13727981250000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 2), (16, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (11, 1)],
  term ((15675574151574 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((-5558064152796 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((9096185929410 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(6, 1), (7, 3), (9, 1)],
  term ((673628397651 : Rat) / 90066973034) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-2243449205307 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((19531922648949 : Rat) / 90066973034) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((36941552751627 : Rat) / 90066973034) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((798574236675 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6482424650868 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2)],
  term ((-1469734685784 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (12, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-48627923958714 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-883122138717 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3256459126862 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)],
  term ((-4032340674120 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2)],
  term ((90807355050 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((8420104391014 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39843615199805 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2)],
  term ((-3119130001407 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)],
  term ((-1810252687209 : Rat) / 45033486517) [(6, 1), (8, 2)],
  term ((1877994320724 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((-8213088006234 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (8, 2), (9, 2)],
  term ((95532936070068 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1119190968342 : Rat) / 45033486517) [(6, 1), (8, 2), (12, 1), (16, 1)],
  term ((11305274097807 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((2238381936684 : Rat) / 45033486517) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7186301449272 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2)],
  term ((323518744674 : Rat) / 45033486517) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((746127312228 : Rat) / 45033486517) [(6, 1), (8, 2), (16, 1)],
  term ((-2666287141290 : Rat) / 45033486517) [(6, 1), (8, 3)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 3), (12, 1), (16, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (8, 3), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 3), (13, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 3), (16, 1)],
  term ((1153415058465 : Rat) / 45033486517) [(6, 1), (9, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-18834094305009 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (9, 2), (16, 1)],
  term ((408259634940 : Rat) / 45033486517) [(6, 1), (9, 3), (13, 1)],
  term ((-6388336575990 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-367433671446 : Rat) / 45033486517) [(6, 1), (9, 4)],
  term ((-610707179772 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (9, 1)],
  term ((36607950000 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (11, 1)],
  term ((15675574151574 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (13, 1)],
  term ((-5558064152796 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 2), (13, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1)],
  term ((-2306830116930 : Rat) / 45033486517) [(6, 2), (8, 1)],
  term ((-816519269880 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 1), (13, 1)],
  term ((12776673151980 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((734867342892 : Rat) / 45033486517) [(6, 2), (8, 1), (9, 2)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2841856333470 : Rat) / 45033486517) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((37668188610018 : Rat) / 45033486517) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-5683712666940 : Rat) / 45033486517) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 2), (8, 1), (16, 1)],
  term ((5841315600705 : Rat) / 45033486517) [(6, 2), (8, 2)],
  term ((36607950000 : Rat) / 45033486517) [(6, 2), (8, 2), (12, 1), (16, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(6, 2), (8, 2), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(6, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 2), (8, 2), (16, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (9, 2)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 3), (8, 1)],
  term ((-2963667745674 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)],
  term ((95532936070068 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((301737198393 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((30139368402816 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7186301449272 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((1825821506250 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((1686906403056 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (13, 1), (15, 2)],
  term ((13454019585747 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((632841308946 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 3)],
  term ((4061330109585 : Rat) / 90066973034) [(7, 1), (8, 2), (9, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-419869613718 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((13105015129599 : Rat) / 180133946068) [(7, 1), (8, 2), (11, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((200815870941 : Rat) / 90066973034) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((26754410417553 : Rat) / 180133946068) [(7, 1), (8, 2), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-48865819275705 : Rat) / 180133946068) [(7, 1), (8, 2), (15, 1)],
  term ((-644554082082 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((632841308946 : Rat) / 45033486517) [(7, 1), (8, 3), (9, 1)],
  term ((1825821506250 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 3), (11, 1), (13, 1), (15, 1)],
  term ((217171717272 : Rat) / 45033486517) [(7, 1), (8, 3), (13, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 3), (13, 1), (15, 2)],
  term ((15278771015991 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1)],
  term ((460840567005 : Rat) / 45033486517) [(7, 1), (8, 3), (15, 1), (16, 1)],
  term ((-48627923958714 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-883122138717 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3256459126862 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1)],
  term ((-4032340674120 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((90807355050 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((8420104391014 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39843615199805 : Rat) / 45033486517) [(7, 1), (9, 1), (15, 2)],
  term ((-3119130001407 : Rat) / 45033486517) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)],
  term ((14452271924901 : Rat) / 180133946068) [(7, 1), (9, 2), (11, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-208118815077 : Rat) / 45033486517) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-4286082539673 : Rat) / 90066973034) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((65818255715451 : Rat) / 180133946068) [(7, 1), (9, 2), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((25017286227549 : Rat) / 180133946068) [(7, 1), (9, 2), (15, 1)],
  term ((154020154593 : Rat) / 45033486517) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3570944909571 : Rat) / 90066973034) [(7, 1), (9, 3)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 3), (11, 1), (13, 1)],
  term ((-1889604299502 : Rat) / 45033486517) [(7, 1), (9, 3), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(7, 1), (9, 3), (16, 1)],
  term ((-3651643012500 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-434343434544 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-30557542031982 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-921681134010 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2037787570278 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (9, 2), (16, 1)],
  term ((384383475000 : Rat) / 45033486517) [(7, 2), (8, 2)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((26217971136 : Rat) / 45033486517) [(7, 2), (8, 2), (12, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 2), (8, 2), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 2), (16, 1)],
  term ((-772104952386 : Rat) / 45033486517) [(7, 2), (8, 3)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 3), (11, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 3), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 3), (16, 1)],
  term ((-13105015129599 : Rat) / 90066973034) [(7, 2), (9, 1), (11, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((416237630154 : Rat) / 45033486517) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-200815870941 : Rat) / 45033486517) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-26754410417553 : Rat) / 90066973034) [(7, 2), (9, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((48865819275705 : Rat) / 90066973034) [(7, 2), (9, 1), (15, 1)],
  term ((1289108164164 : Rat) / 45033486517) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2431525360833 : Rat) / 45033486517) [(7, 2), (9, 2)],
  term ((855562340412 : Rat) / 45033486517) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((865957198572 : Rat) / 45033486517) [(7, 2), (9, 2), (12, 1)],
  term ((-427781170206 : Rat) / 45033486517) [(7, 2), (9, 2), (13, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 2), (9, 2), (16, 1)],
  term ((1544209904772 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 3), (8, 1), (9, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(7, 3), (9, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(7, 3), (9, 1), (11, 1), (13, 1)],
  term ((-52435942272 : Rat) / 45033486517) [(7, 3), (9, 1), (12, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 3), (9, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 3), (9, 1), (16, 1)],
  term ((1481833872837 : Rat) / 45033486517) [(8, 1), (9, 2)],
  term ((-47766468035034 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-15069684201408 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3593150724636 : Rat) / 45033486517) [(8, 1), (9, 2), (15, 2)],
  term ((-479144542005 : Rat) / 45033486517) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (9, 2), (16, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 1), (9, 3), (13, 1)],
  term ((912375715122 : Rat) / 45033486517) [(8, 1), (9, 3), (15, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(8, 2), (9, 1), (11, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-19531922648949 : Rat) / 180133946068) [(8, 2), (9, 1), (13, 1)],
  term ((-36941552751627 : Rat) / 180133946068) [(8, 2), (9, 1), (15, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1285358117913 : Rat) / 45033486517) [(8, 2), (9, 2)],
  term ((734867342892 : Rat) / 45033486517) [(8, 2), (9, 2), (12, 1)],
  term ((24313961979357 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)],
  term ((883122138717 : Rat) / 90066973034) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1628229563431 : Rat) / 45033486517) [(8, 2), (12, 1)],
  term ((2016170337060 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((-45403677525 : Rat) / 45033486517) [(8, 2), (12, 1), (16, 1)],
  term ((-4210052195507 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1)],
  term ((90807355050 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((39843615199805 : Rat) / 90066973034) [(8, 2), (15, 2)],
  term ((3119130001407 : Rat) / 90066973034) [(8, 2), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(8, 2), (16, 1)],
  term ((1481833872837 : Rat) / 45033486517) [(8, 3)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 3), (9, 1), (13, 1)],
  term ((912375715122 : Rat) / 45033486517) [(8, 3), (9, 1), (15, 1)],
  term ((-47766468035034 : Rat) / 45033486517) [(8, 3), (11, 1), (15, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 3), (12, 1), (16, 1)],
  term ((-15069684201408 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1)],
  term ((301737198393 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((3593150724636 : Rat) / 45033486517) [(8, 3), (15, 2)],
  term ((-479144542005 : Rat) / 45033486517) [(8, 3), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 3), (16, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(8, 4)],
  term ((24313961979357 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1)],
  term ((883122138717 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1628229563431 : Rat) / 45033486517) [(9, 2), (12, 1)],
  term ((2016170337060 : Rat) / 45033486517) [(9, 2), (12, 1), (15, 2)],
  term ((-45403677525 : Rat) / 45033486517) [(9, 2), (12, 1), (16, 1)],
  term ((-4210052195507 : Rat) / 45033486517) [(9, 2), (13, 1), (15, 1)],
  term ((90807355050 : Rat) / 45033486517) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((39843615199805 : Rat) / 90066973034) [(9, 2), (15, 2)],
  term ((3119130001407 : Rat) / 90066973034) [(9, 2), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(9, 2), (16, 1)],
  term ((-673628397651 : Rat) / 180133946068) [(9, 3), (11, 1)],
  term ((2243449205307 : Rat) / 90066973034) [(9, 3), (12, 1), (15, 1)],
  term ((-19531922648949 : Rat) / 180133946068) [(9, 3), (13, 1)],
  term ((-36941552751627 : Rat) / 180133946068) [(9, 3), (15, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(9, 3), (15, 1), (16, 1)],
  term ((1596713436351 : Rat) / 45033486517) [(9, 4)],
  term ((734867342892 : Rat) / 45033486517) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 100 through 189. -/
theorem ep_Q2_054_block_17_0100_0189_valid :
    checkProductSumEq ep_Q2_054_partials_17_0100_0189
      ep_Q2_054_block_17_0100_0189 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
