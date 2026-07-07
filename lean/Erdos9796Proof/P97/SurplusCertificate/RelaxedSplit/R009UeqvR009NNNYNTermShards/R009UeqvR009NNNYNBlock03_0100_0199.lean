/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 3:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0100 : Poly :=
[
  term ((1193529120 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 100 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0100 : Poly :=
[
  term ((-2387058240 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((1193529120 : Rat) / 12247399) [(4, 2), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((2387058240 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((1193529120 : Rat) / 12247399) [(5, 3), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0100
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0101 : Poly :=
[
  term ((-5843604024 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 101 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0101 : Poly :=
[
  term ((11687208048 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-5843604024 : Rat) / 12247399) [(4, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-11687208048 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((-5843604024 : Rat) / 12247399) [(5, 3), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0101
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0102 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0102 : Poly :=
[
  term ((8771824241152 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(4, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0102
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0103 : Poly :=
[
  term ((25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (11, 2)]
]

/-- Partial product 103 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0103 : Poly :=
[
  term ((-50923909120 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (11, 2)],
  term ((25461954560 : Rat) / 110226591) [(4, 2), (5, 1), (7, 1), (11, 2)],
  term ((50923909120 : Rat) / 110226591) [(5, 1), (7, 1), (8, 1), (11, 2)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (8, 2), (11, 2)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (9, 2), (11, 2)],
  term ((25461954560 : Rat) / 110226591) [(5, 3), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0103
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0104 : Poly :=
[
  term ((-1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 104 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0104 : Poly :=
[
  term ((2359640640 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1179820320 : Rat) / 12247399) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2359640640 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-1179820320 : Rat) / 12247399) [(5, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0104
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0105 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0105 : Poly :=
[
  term ((137059753768 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0105
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0106 : Poly :=
[
  term ((19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 106 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0106 : Poly :=
[
  term ((-39051204272 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((19525602136 : Rat) / 110226591) [(4, 2), (5, 1), (7, 1), (15, 2)],
  term ((39051204272 : Rat) / 110226591) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (8, 2), (15, 2)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((19525602136 : Rat) / 110226591) [(5, 3), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0106
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0107 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0107 : Poly :=
[
  term ((-9579498314696 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(4, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0107
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0108 : Poly :=
[
  term ((-4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 108 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0108 : Poly :=
[
  term ((8771824241152 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (11, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(4, 2), (5, 1), (7, 2), (11, 1)],
  term ((-8771824241152 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 1), (11, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 2), (11, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (9, 2), (11, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(5, 3), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0108
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0109 : Poly :=
[
  term ((-205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 109 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0109 : Poly :=
[
  term ((411179261304 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(4, 2), (5, 1), (7, 2), (13, 1)],
  term ((-411179261304 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 2), (13, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (9, 2), (13, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(5, 3), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0109
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0110 : Poly :=
[
  term ((4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 110 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0110 : Poly :=
[
  term ((-9579498314696 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(4, 2), (5, 1), (7, 2), (15, 1)],
  term ((9579498314696 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 2), (15, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (9, 2), (15, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(5, 3), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0110
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0111 : Poly :=
[
  term ((2307 : Rat) / 134) [(5, 1), (9, 1)]
]

/-- Partial product 111 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0111 : Poly :=
[
  term ((-2307 : Rat) / 67) [(4, 1), (5, 1), (9, 1)],
  term ((2307 : Rat) / 134) [(4, 2), (5, 1), (9, 1)],
  term ((2307 : Rat) / 67) [(5, 1), (8, 1), (9, 1)],
  term ((-2307 : Rat) / 134) [(5, 1), (8, 2), (9, 1)],
  term ((-2307 : Rat) / 134) [(5, 1), (9, 3)],
  term ((2307 : Rat) / 134) [(5, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0111
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0112 : Poly :=
[
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 112 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0112 : Poly :=
[
  term ((-392 : Rat) / 67) [(4, 1), (5, 1), (9, 1), (10, 1)],
  term ((196 : Rat) / 67) [(4, 2), (5, 1), (9, 1), (10, 1)],
  term ((392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (8, 2), (9, 1), (10, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (9, 3), (10, 1)],
  term ((196 : Rat) / 67) [(5, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0112
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0113 : Poly :=
[
  term ((-596764560 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 113 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0113 : Poly :=
[
  term ((1193529120 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((596764560 : Rat) / 12247399) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((596764560 : Rat) / 12247399) [(5, 1), (9, 3), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 3), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0113
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0114 : Poly :=
[
  term ((2921802012 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 114 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0114 : Poly :=
[
  term ((-5843604024 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((2921802012 : Rat) / 12247399) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2921802012 : Rat) / 12247399) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-2921802012 : Rat) / 12247399) [(5, 1), (9, 3), (11, 1), (15, 1)],
  term ((2921802012 : Rat) / 12247399) [(5, 3), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0114
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0115 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0115 : Poly :=
[
  term ((-88204818688 : Rat) / 18848747061) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0115
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0116 : Poly :=
[
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)]
]

/-- Partial product 116 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0116 : Poly :=
[
  term ((25461954560 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(4, 2), (5, 1), (9, 1), (11, 2)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (8, 1), (9, 1), (11, 2)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (8, 2), (9, 1), (11, 2)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (9, 3), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(5, 3), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0116
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0117 : Poly :=
[
  term ((589910160 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 117 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0117 : Poly :=
[
  term ((-1179820320 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((589910160 : Rat) / 12247399) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (9, 3), (13, 1), (15, 1)],
  term ((589910160 : Rat) / 12247399) [(5, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0117
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0118 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0118 : Poly :=
[
  term ((-1378200292 : Rat) / 698101743) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0118
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0119 : Poly :=
[
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 119 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0119 : Poly :=
[
  term ((392 : Rat) / 67) [(4, 1), (5, 1), (9, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((196 : Rat) / 67) [(5, 1), (8, 2), (9, 1), (14, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 3), (14, 1)],
  term ((-196 : Rat) / 67) [(5, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0119
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0120 : Poly :=
[
  term ((-9762801068 : Rat) / 110226591) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 120 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0120 : Poly :=
[
  term ((19525602136 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (15, 2)],
  term ((-9762801068 : Rat) / 110226591) [(4, 2), (5, 1), (9, 1), (15, 2)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (8, 2), (9, 1), (15, 2)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (9, 3), (15, 2)],
  term ((-9762801068 : Rat) / 110226591) [(5, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0120
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0121 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0121 : Poly :=
[
  term ((153811535336 : Rat) / 18848747061) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(4, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0121
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0122 : Poly :=
[
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 122 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0122 : Poly :=
[
  term ((44102409344 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(4, 2), (5, 1), (9, 2), (11, 1)],
  term ((-44102409344 : Rat) / 6282915687) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (8, 2), (9, 2), (11, 1)],
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (9, 4), (11, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 3), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0122
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0123 : Poly :=
[
  term ((-344550073 : Rat) / 232700581) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 123 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0123 : Poly :=
[
  term ((689100146 : Rat) / 232700581) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(4, 2), (5, 1), (9, 2), (13, 1)],
  term ((-689100146 : Rat) / 232700581) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (8, 2), (9, 2), (13, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (9, 4), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 3), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0123
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0124 : Poly :=
[
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 124 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0124 : Poly :=
[
  term ((-76905767668 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(4, 2), (5, 1), (9, 2), (15, 1)],
  term ((76905767668 : Rat) / 6282915687) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (8, 2), (9, 2), (15, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (9, 4), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 3), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0124
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0125 : Poly :=
[
  term ((-532389340672 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 125 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0125 : Poly :=
[
  term ((1064778681344 : Rat) / 31414578435) [(4, 1), (5, 1), (10, 1), (11, 1)],
  term ((-532389340672 : Rat) / 31414578435) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term ((-1064778681344 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((532389340672 : Rat) / 31414578435) [(5, 1), (8, 2), (10, 1), (11, 1)],
  term ((532389340672 : Rat) / 31414578435) [(5, 1), (9, 2), (10, 1), (11, 1)],
  term ((-532389340672 : Rat) / 31414578435) [(5, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0125
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0126 : Poly :=
[
  term ((-8318583448 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 126 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0126 : Poly :=
[
  term ((16637166896 : Rat) / 1163502905) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term ((-8318583448 : Rat) / 1163502905) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((-16637166896 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((8318583448 : Rat) / 1163502905) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((8318583448 : Rat) / 1163502905) [(5, 1), (9, 2), (10, 1), (13, 1)],
  term ((-8318583448 : Rat) / 1163502905) [(5, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0126
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0127 : Poly :=
[
  term ((510734223116 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 127 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0127 : Poly :=
[
  term ((-1021468446232 : Rat) / 31414578435) [(4, 1), (5, 1), (10, 1), (15, 1)],
  term ((510734223116 : Rat) / 31414578435) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((1021468446232 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-510734223116 : Rat) / 31414578435) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((-510734223116 : Rat) / 31414578435) [(5, 1), (9, 2), (10, 1), (15, 1)],
  term ((510734223116 : Rat) / 31414578435) [(5, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0127_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0127
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0128 : Poly :=
[
  term ((3775945525624 : Rat) / 94243735305) [(5, 1), (11, 1)]
]

/-- Partial product 128 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0128 : Poly :=
[
  term ((-7551891051248 : Rat) / 94243735305) [(4, 1), (5, 1), (11, 1)],
  term ((3775945525624 : Rat) / 94243735305) [(4, 2), (5, 1), (11, 1)],
  term ((7551891051248 : Rat) / 94243735305) [(5, 1), (8, 1), (11, 1)],
  term ((-3775945525624 : Rat) / 94243735305) [(5, 1), (8, 2), (11, 1)],
  term ((-3775945525624 : Rat) / 94243735305) [(5, 1), (9, 2), (11, 1)],
  term ((3775945525624 : Rat) / 94243735305) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0128_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0128
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0129 : Poly :=
[
  term ((-625802240 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 129 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0129 : Poly :=
[
  term ((1251604480 : Rat) / 110226591) [(4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-625802240 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1)],
  term ((-1251604480 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((625802240 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((625802240 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((-625802240 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0129_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0129
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0130 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 130 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0130 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0130_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0130
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0131 : Poly :=
[
  term ((81034240 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 131 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0131 : Poly :=
[
  term ((-162068480 : Rat) / 110226591) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((81034240 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((162068480 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-81034240 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-81034240 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((81034240 : Rat) / 110226591) [(5, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0131_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0131
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0132 : Poly :=
[
  term ((10226961920 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 132 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0132 : Poly :=
[
  term ((-20453923840 : Rat) / 330679773) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term ((10226961920 : Rat) / 330679773) [(4, 2), (5, 1), (11, 1), (14, 1)],
  term ((20453923840 : Rat) / 330679773) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-10226961920 : Rat) / 330679773) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((-10226961920 : Rat) / 330679773) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((10226961920 : Rat) / 330679773) [(5, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0132_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0132
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0133 : Poly :=
[
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 133 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0133 : Poly :=
[
  term ((-413371702912 : Rat) / 24800982975) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(5, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0133_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0133
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0134 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(5, 1), (11, 1), (14, 2)]
]

/-- Partial product 134 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0134 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(4, 2), (5, 1), (11, 1), (14, 2)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (9, 2), (11, 1), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 3), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0134_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0134
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0135 : Poly :=
[
  term ((-348160 : Rat) / 1645173) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 135 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0135 : Poly :=
[
  term ((696320 : Rat) / 1645173) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term ((-348160 : Rat) / 1645173) [(4, 2), (5, 1), (11, 1), (15, 2)],
  term ((-696320 : Rat) / 1645173) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((348160 : Rat) / 1645173) [(5, 1), (8, 2), (11, 1), (15, 2)],
  term ((348160 : Rat) / 1645173) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((-348160 : Rat) / 1645173) [(5, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0135_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0135
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0136 : Poly :=
[
  term ((-4640 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 136 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0136 : Poly :=
[
  term ((9280 : Rat) / 201) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4640 : Rat) / 201) [(4, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9280 : Rat) / 201) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-4640 : Rat) / 201) [(5, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0136_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0136
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0137 : Poly :=
[
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 137 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0137 : Poly :=
[
  term ((810187430512 : Rat) / 24800982975) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0137_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0137
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0138 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 138 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0138 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0138_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0138
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0139 : Poly :=
[
  term ((-29334480 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 139 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0139 : Poly :=
[
  term ((58668960 : Rat) / 12247399) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-29334480 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((-58668960 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((29334480 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((29334480 : Rat) / 12247399) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-29334480 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0139_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0139
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0140 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 140 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0140 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((18278400 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0140_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0140
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0141 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 141 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0141 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-351641600 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(5, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0141_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0141
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0142 : Poly :=
[
  term ((682791976 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 142 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0142 : Poly :=
[
  term ((-1365583952 : Rat) / 110226591) [(4, 1), (5, 1), (12, 1), (15, 1)],
  term ((682791976 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((1365583952 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-682791976 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((-682791976 : Rat) / 110226591) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((682791976 : Rat) / 110226591) [(5, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0142_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0142
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0143 : Poly :=
[
  term ((126 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0143 : Poly :=
[
  term ((-252 : Rat) / 67) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 67) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 67) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 67) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0143_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0143
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0144 : Poly :=
[
  term ((59526632431 : Rat) / 3490508715) [(5, 1), (13, 1)]
]

/-- Partial product 144 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0144 : Poly :=
[
  term ((-119053264862 : Rat) / 3490508715) [(4, 1), (5, 1), (13, 1)],
  term ((59526632431 : Rat) / 3490508715) [(4, 2), (5, 1), (13, 1)],
  term ((119053264862 : Rat) / 3490508715) [(5, 1), (8, 1), (13, 1)],
  term ((-59526632431 : Rat) / 3490508715) [(5, 1), (8, 2), (13, 1)],
  term ((-59526632431 : Rat) / 3490508715) [(5, 1), (9, 2), (13, 1)],
  term ((59526632431 : Rat) / 3490508715) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0144_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0144
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0145 : Poly :=
[
  term ((159796280 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 145 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0145 : Poly :=
[
  term ((-319592560 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((159796280 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((319592560 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-159796280 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-159796280 : Rat) / 12247399) [(5, 1), (9, 2), (13, 1), (14, 1)],
  term ((159796280 : Rat) / 12247399) [(5, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0145_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0145
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0146 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 146 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0146 : Poly :=
[
  term ((-6458932858 : Rat) / 918554925) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0146_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0146
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0147 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)]
]

/-- Partial product 147 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0147 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((1370880 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 2)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (9, 2), (13, 1), (14, 2)],
  term ((1370880 : Rat) / 12247399) [(5, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0147_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0147
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0148 : Poly :=
[
  term ((-112586240 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 148 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0148 : Poly :=
[
  term ((225172480 : Rat) / 110226591) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-112586240 : Rat) / 110226591) [(4, 2), (5, 1), (13, 1), (15, 2)],
  term ((-225172480 : Rat) / 110226591) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((112586240 : Rat) / 110226591) [(5, 1), (8, 2), (13, 1), (15, 2)],
  term ((112586240 : Rat) / 110226591) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((-112586240 : Rat) / 110226591) [(5, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0148_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0148
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0149 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 149 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0149 : Poly :=
[
  term ((6458932858 : Rat) / 918554925) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0149_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0149
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0150 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 150 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0150 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(4, 1), (5, 1), (13, 2), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 2), (5, 1), (13, 2), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(5, 1), (8, 2), (13, 2), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(5, 1), (9, 2), (13, 2), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(5, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0150_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0150
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0151 : Poly :=
[
  term ((-9544982068 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 151 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0151 : Poly :=
[
  term ((19089964136 : Rat) / 330679773) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-9544982068 : Rat) / 330679773) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-19089964136 : Rat) / 330679773) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((9544982068 : Rat) / 330679773) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((9544982068 : Rat) / 330679773) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-9544982068 : Rat) / 330679773) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0151_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0151
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0152 : Poly :=
[
  term ((-41282089588 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0152 : Poly :=
[
  term ((82564179176 : Rat) / 24800982975) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0152_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0152
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0153 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 153 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0153 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(4, 2), (5, 1), (14, 2), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (8, 2), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (9, 2), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0153_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0153
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0154 : Poly :=
[
  term ((-3261584704577 : Rat) / 94243735305) [(5, 1), (15, 1)]
]

/-- Partial product 154 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0154 : Poly :=
[
  term ((6523169409154 : Rat) / 94243735305) [(4, 1), (5, 1), (15, 1)],
  term ((-3261584704577 : Rat) / 94243735305) [(4, 2), (5, 1), (15, 1)],
  term ((-6523169409154 : Rat) / 94243735305) [(5, 1), (8, 1), (15, 1)],
  term ((3261584704577 : Rat) / 94243735305) [(5, 1), (8, 2), (15, 1)],
  term ((3261584704577 : Rat) / 94243735305) [(5, 1), (9, 2), (15, 1)],
  term ((-3261584704577 : Rat) / 94243735305) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0154_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0154
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0155 : Poly :=
[
  term ((-60636377762 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0155 : Poly :=
[
  term ((121272755524 : Rat) / 24800982975) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0155_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0155
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0156 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(5, 1), (15, 3)]
]

/-- Partial product 156 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0156 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(4, 1), (5, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(4, 2), (5, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (8, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 2), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (9, 2), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(5, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0156_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0156
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0157 : Poly :=
[
  term ((507 : Rat) / 134) [(7, 1), (9, 1)]
]

/-- Partial product 157 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0157 : Poly :=
[
  term ((-507 : Rat) / 67) [(4, 1), (7, 1), (9, 1)],
  term ((507 : Rat) / 134) [(4, 2), (7, 1), (9, 1)],
  term ((507 : Rat) / 134) [(5, 2), (7, 1), (9, 1)],
  term ((507 : Rat) / 67) [(7, 1), (8, 1), (9, 1)],
  term ((-507 : Rat) / 134) [(7, 1), (8, 2), (9, 1)],
  term ((-507 : Rat) / 134) [(7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0157_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0157
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0158 : Poly :=
[
  term ((-198921520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 158 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0158 : Poly :=
[
  term ((397843040 : Rat) / 12247399) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-397843040 : Rat) / 12247399) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((198921520 : Rat) / 12247399) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((198921520 : Rat) / 12247399) [(7, 1), (9, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0158_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0158
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0159 : Poly :=
[
  term ((52834967632828 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 159 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0159 : Poly :=
[
  term ((-105669935265656 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((52834967632828 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((52834967632828 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((105669935265656 : Rat) / 471218676525) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-52834967632828 : Rat) / 471218676525) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-52834967632828 : Rat) / 471218676525) [(7, 1), (9, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0159_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0159
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0160 : Poly :=
[
  term ((-7681428414464 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0160 : Poly :=
[
  term ((15362856828928 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7681428414464 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7681428414464 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15362856828928 : Rat) / 471218676525) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0160_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0160
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0161 : Poly :=
[
  term ((-12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 161 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0161 : Poly :=
[
  term ((25461954560 : Rat) / 330679773) [(4, 1), (7, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(4, 2), (7, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(5, 2), (7, 1), (9, 1), (11, 2)],
  term ((-25461954560 : Rat) / 330679773) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((12730977280 : Rat) / 330679773) [(7, 1), (8, 2), (9, 1), (11, 2)],
  term ((12730977280 : Rat) / 330679773) [(7, 1), (9, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0161_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0161
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0162 : Poly :=
[
  term ((520251963952 : Rat) / 17452543575) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 162 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0162 : Poly :=
[
  term ((-1040503927904 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((520251963952 : Rat) / 17452543575) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((520251963952 : Rat) / 17452543575) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1040503927904 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-520251963952 : Rat) / 17452543575) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-520251963952 : Rat) / 17452543575) [(7, 1), (9, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0162_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0162
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0163 : Poly :=
[
  term ((-120022318976 : Rat) / 17452543575) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0163 : Poly :=
[
  term ((240044637952 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240044637952 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((120022318976 : Rat) / 17452543575) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((120022318976 : Rat) / 17452543575) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0163_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0163
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0164 : Poly :=
[
  term ((-196 : Rat) / 67) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 164 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0164 : Poly :=
[
  term ((392 : Rat) / 67) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((196 : Rat) / 67) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((196 : Rat) / 67) [(7, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0164_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0164
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0165 : Poly :=
[
  term ((-32126527377344 : Rat) / 471218676525) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 165 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0165 : Poly :=
[
  term ((64253054754688 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-32126527377344 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (15, 2)],
  term ((-32126527377344 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (15, 2)],
  term ((-64253054754688 : Rat) / 471218676525) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((32126527377344 : Rat) / 471218676525) [(7, 1), (8, 2), (9, 1), (15, 2)],
  term ((32126527377344 : Rat) / 471218676525) [(7, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0165_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0165
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0166 : Poly :=
[
  term ((9107267927722 : Rat) / 471218676525) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0166 : Poly :=
[
  term ((-18214535855444 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((18214535855444 : Rat) / 471218676525) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0166_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0166
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0167 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)]
]

/-- Partial product 167 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0167 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(4, 2), (7, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(5, 2), (7, 1), (9, 2), (11, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (8, 2), (9, 2), (11, 1)],
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (9, 4), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0167_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0167
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0168 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(7, 1), (9, 2), (13, 1)]
]

/-- Partial product 168 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0168 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(4, 1), (7, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 698101743) [(4, 2), (7, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 698101743) [(5, 2), (7, 1), (9, 2), (13, 1)],
  term ((-689100146 : Rat) / 698101743) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 1), (8, 2), (9, 2), (13, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 1), (9, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0168_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0168
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0169 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 169 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0169 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 18848747061) [(4, 2), (7, 1), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 18848747061) [(5, 2), (7, 1), (9, 2), (15, 1)],
  term ((76905767668 : Rat) / 18848747061) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (8, 2), (9, 2), (15, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (9, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0169_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0169
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0170 : Poly :=
[
  term ((-331812484864 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 170 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0170 : Poly :=
[
  term ((663624969728 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (11, 1)],
  term ((-331812484864 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((-331812484864 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (11, 1)],
  term ((-663624969728 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0170_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0170
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0171 : Poly :=
[
  term ((-5184570076 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 171 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0171 : Poly :=
[
  term ((10369140152 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-5184570076 : Rat) / 1163502905) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((-5184570076 : Rat) / 1163502905) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((-10369140152 : Rat) / 1163502905) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (9, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0171_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0171
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0172 : Poly :=
[
  term ((299223758672 : Rat) / 31414578435) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 172 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0172 : Poly :=
[
  term ((-598447517344 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((299223758672 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((299223758672 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((598447517344 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0172_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0172
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0173 : Poly :=
[
  term ((-36215939755826 : Rat) / 471218676525) [(7, 1), (11, 1)]
]

/-- Partial product 173 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0173 : Poly :=
[
  term ((72431879511652 : Rat) / 471218676525) [(4, 1), (7, 1), (11, 1)],
  term ((-36215939755826 : Rat) / 471218676525) [(4, 2), (7, 1), (11, 1)],
  term ((-36215939755826 : Rat) / 471218676525) [(5, 2), (7, 1), (11, 1)],
  term ((-72431879511652 : Rat) / 471218676525) [(7, 1), (8, 1), (11, 1)],
  term ((36215939755826 : Rat) / 471218676525) [(7, 1), (8, 2), (11, 1)],
  term ((36215939755826 : Rat) / 471218676525) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0173_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0173
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0174 : Poly :=
[
  term ((-47015484544 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 174 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0174 : Poly :=
[
  term ((94030969088 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-47015484544 : Rat) / 330679773) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-47015484544 : Rat) / 330679773) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-94030969088 : Rat) / 330679773) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((47015484544 : Rat) / 330679773) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((47015484544 : Rat) / 330679773) [(7, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0174_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0174
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0175 : Poly :=
[
  term ((-779878400 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 175 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0175 : Poly :=
[
  term ((1559756800 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-779878400 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-779878400 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1559756800 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((779878400 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (12, 1), (15, 2)],
  term ((779878400 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0175_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0175
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0176 : Poly :=
[
  term ((-14318080 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 176 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0176 : Poly :=
[
  term ((28636160 : Rat) / 12247399) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14318080 : Rat) / 12247399) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14318080 : Rat) / 12247399) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-28636160 : Rat) / 12247399) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((14318080 : Rat) / 12247399) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((14318080 : Rat) / 12247399) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0176_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0176
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0177 : Poly :=
[
  term ((1003999399424 : Rat) / 24800982975) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 177 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0177 : Poly :=
[
  term ((-2007998798848 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((1003999399424 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((1003999399424 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((2007998798848 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1003999399424 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((-1003999399424 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0177_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0177
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0178 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 178 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0178 : Poly :=
[
  term ((77987840 : Rat) / 36742197) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(4, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(5, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-77987840 : Rat) / 36742197) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(7, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(7, 1), (9, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0178_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0178
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0179 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 179 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0179 : Poly :=
[
  term ((413371702912 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-413371702912 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0179_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0179
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0180 : Poly :=
[
  term ((7477971520 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 180 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0180 : Poly :=
[
  term ((-14955943040 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((7477971520 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (15, 2)],
  term ((7477971520 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (15, 2)],
  term ((14955943040 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-7477971520 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-7477971520 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0180_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0180
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0181 : Poly :=
[
  term ((4640 : Rat) / 201) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 181 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0181 : Poly :=
[
  term ((-9280 : Rat) / 201) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(4, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((9280 : Rat) / 201) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4640 : Rat) / 201) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-4640 : Rat) / 201) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0181_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0181
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0182 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 182 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0182 : Poly :=
[
  term ((-810187430512 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((810187430512 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0182_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0182
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0183 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 183 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0183 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(7, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0183_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0183
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0184 : Poly :=
[
  term ((-734616946 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 184 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0184 : Poly :=
[
  term ((1469233892 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-734616946 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-734616946 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-1469233892 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((734616946 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((734616946 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0184_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0184
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0185 : Poly :=
[
  term ((-36556800 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 185 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0185 : Poly :=
[
  term ((73113600 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36556800 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36556800 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-73113600 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((36556800 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((36556800 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0185_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0185
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0186 : Poly :=
[
  term ((41154141524 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 186 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0186 : Poly :=
[
  term ((-82308283048 : Rat) / 330679773) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((41154141524 : Rat) / 330679773) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((41154141524 : Rat) / 330679773) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((82308283048 : Rat) / 330679773) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-41154141524 : Rat) / 330679773) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-41154141524 : Rat) / 330679773) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0186_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0186
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0187 : Poly :=
[
  term ((-126 : Rat) / 67) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0187 : Poly :=
[
  term ((252 : Rat) / 67) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 67) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 67) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 67) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0187_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0187
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0188 : Poly :=
[
  term ((703283200 : Rat) / 110226591) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 188 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0188 : Poly :=
[
  term ((-1406566400 : Rat) / 110226591) [(4, 1), (7, 1), (12, 1), (15, 3)],
  term ((703283200 : Rat) / 110226591) [(4, 2), (7, 1), (12, 1), (15, 3)],
  term ((703283200 : Rat) / 110226591) [(5, 2), (7, 1), (12, 1), (15, 3)],
  term ((1406566400 : Rat) / 110226591) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-703283200 : Rat) / 110226591) [(7, 1), (8, 2), (12, 1), (15, 3)],
  term ((-703283200 : Rat) / 110226591) [(7, 1), (9, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0188_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0188
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0189 : Poly :=
[
  term ((-889545234193 : Rat) / 34905087150) [(7, 1), (13, 1)]
]

/-- Partial product 189 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0189 : Poly :=
[
  term ((889545234193 : Rat) / 17452543575) [(4, 1), (7, 1), (13, 1)],
  term ((-889545234193 : Rat) / 34905087150) [(4, 2), (7, 1), (13, 1)],
  term ((-889545234193 : Rat) / 34905087150) [(5, 2), (7, 1), (13, 1)],
  term ((-889545234193 : Rat) / 17452543575) [(7, 1), (8, 1), (13, 1)],
  term ((889545234193 : Rat) / 34905087150) [(7, 1), (8, 2), (13, 1)],
  term ((889545234193 : Rat) / 34905087150) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0189_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0189
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0190 : Poly :=
[
  term ((15687490616 : Rat) / 918554925) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 190 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0190 : Poly :=
[
  term ((-31374981232 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((15687490616 : Rat) / 918554925) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((15687490616 : Rat) / 918554925) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((31374981232 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-15687490616 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-15687490616 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0190_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0190
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0191 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 191 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0191 : Poly :=
[
  term ((10967040 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-10967040 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(7, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(7, 1), (9, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0191_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0191
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0192 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 192 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0192 : Poly :=
[
  term ((6458932858 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6458932858 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0192_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0192
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0193 : Poly :=
[
  term ((593750240 : Rat) / 12247399) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 193 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0193 : Poly :=
[
  term ((-1187500480 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((593750240 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1), (15, 2)],
  term ((593750240 : Rat) / 12247399) [(5, 2), (7, 1), (13, 1), (15, 2)],
  term ((1187500480 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-593750240 : Rat) / 12247399) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-593750240 : Rat) / 12247399) [(7, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0193_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0193
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0194 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 194 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0194 : Poly :=
[
  term ((-6458932858 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((6458932858 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0194_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0194
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0195 : Poly :=
[
  term ((-4112640 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 195 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0195 : Poly :=
[
  term ((8225280 : Rat) / 12247399) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-4112640 : Rat) / 12247399) [(4, 2), (7, 1), (13, 2), (15, 1)],
  term ((-4112640 : Rat) / 12247399) [(5, 2), (7, 1), (13, 2), (15, 1)],
  term ((-8225280 : Rat) / 12247399) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((4112640 : Rat) / 12247399) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((4112640 : Rat) / 12247399) [(7, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0195_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0195
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0196 : Poly :=
[
  term ((-628509699652 : Rat) / 24800982975) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 196 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0196 : Poly :=
[
  term ((1257019399304 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-628509699652 : Rat) / 24800982975) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((-628509699652 : Rat) / 24800982975) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1257019399304 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((628509699652 : Rat) / 24800982975) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((628509699652 : Rat) / 24800982975) [(7, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0196_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0196
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0197 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0197 : Poly :=
[
  term ((-82564179176 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((82564179176 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0197_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0197
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0198 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(7, 1), (14, 1), (15, 3)]
]

/-- Partial product 198 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0198 : Poly :=
[
  term ((-70328320 : Rat) / 36742197) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(4, 2), (7, 1), (14, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(5, 2), (7, 1), (14, 1), (15, 3)],
  term ((70328320 : Rat) / 36742197) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(7, 1), (8, 2), (14, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(7, 1), (9, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0198_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0198
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0199 : Poly :=
[
  term ((18868712106973 : Rat) / 471218676525) [(7, 1), (15, 1)]
]

/-- Partial product 199 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0199 : Poly :=
[
  term ((-37737424213946 : Rat) / 471218676525) [(4, 1), (7, 1), (15, 1)],
  term ((18868712106973 : Rat) / 471218676525) [(4, 2), (7, 1), (15, 1)],
  term ((18868712106973 : Rat) / 471218676525) [(5, 2), (7, 1), (15, 1)],
  term ((37737424213946 : Rat) / 471218676525) [(7, 1), (8, 1), (15, 1)],
  term ((-18868712106973 : Rat) / 471218676525) [(7, 1), (8, 2), (15, 1)],
  term ((-18868712106973 : Rat) / 471218676525) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0199_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0199
        rs_R009_ueqv_R009NNNYN_generator_03_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_03_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_03_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_03_0100,
  rs_R009_ueqv_R009NNNYN_partial_03_0101,
  rs_R009_ueqv_R009NNNYN_partial_03_0102,
  rs_R009_ueqv_R009NNNYN_partial_03_0103,
  rs_R009_ueqv_R009NNNYN_partial_03_0104,
  rs_R009_ueqv_R009NNNYN_partial_03_0105,
  rs_R009_ueqv_R009NNNYN_partial_03_0106,
  rs_R009_ueqv_R009NNNYN_partial_03_0107,
  rs_R009_ueqv_R009NNNYN_partial_03_0108,
  rs_R009_ueqv_R009NNNYN_partial_03_0109,
  rs_R009_ueqv_R009NNNYN_partial_03_0110,
  rs_R009_ueqv_R009NNNYN_partial_03_0111,
  rs_R009_ueqv_R009NNNYN_partial_03_0112,
  rs_R009_ueqv_R009NNNYN_partial_03_0113,
  rs_R009_ueqv_R009NNNYN_partial_03_0114,
  rs_R009_ueqv_R009NNNYN_partial_03_0115,
  rs_R009_ueqv_R009NNNYN_partial_03_0116,
  rs_R009_ueqv_R009NNNYN_partial_03_0117,
  rs_R009_ueqv_R009NNNYN_partial_03_0118,
  rs_R009_ueqv_R009NNNYN_partial_03_0119,
  rs_R009_ueqv_R009NNNYN_partial_03_0120,
  rs_R009_ueqv_R009NNNYN_partial_03_0121,
  rs_R009_ueqv_R009NNNYN_partial_03_0122,
  rs_R009_ueqv_R009NNNYN_partial_03_0123,
  rs_R009_ueqv_R009NNNYN_partial_03_0124,
  rs_R009_ueqv_R009NNNYN_partial_03_0125,
  rs_R009_ueqv_R009NNNYN_partial_03_0126,
  rs_R009_ueqv_R009NNNYN_partial_03_0127,
  rs_R009_ueqv_R009NNNYN_partial_03_0128,
  rs_R009_ueqv_R009NNNYN_partial_03_0129,
  rs_R009_ueqv_R009NNNYN_partial_03_0130,
  rs_R009_ueqv_R009NNNYN_partial_03_0131,
  rs_R009_ueqv_R009NNNYN_partial_03_0132,
  rs_R009_ueqv_R009NNNYN_partial_03_0133,
  rs_R009_ueqv_R009NNNYN_partial_03_0134,
  rs_R009_ueqv_R009NNNYN_partial_03_0135,
  rs_R009_ueqv_R009NNNYN_partial_03_0136,
  rs_R009_ueqv_R009NNNYN_partial_03_0137,
  rs_R009_ueqv_R009NNNYN_partial_03_0138,
  rs_R009_ueqv_R009NNNYN_partial_03_0139,
  rs_R009_ueqv_R009NNNYN_partial_03_0140,
  rs_R009_ueqv_R009NNNYN_partial_03_0141,
  rs_R009_ueqv_R009NNNYN_partial_03_0142,
  rs_R009_ueqv_R009NNNYN_partial_03_0143,
  rs_R009_ueqv_R009NNNYN_partial_03_0144,
  rs_R009_ueqv_R009NNNYN_partial_03_0145,
  rs_R009_ueqv_R009NNNYN_partial_03_0146,
  rs_R009_ueqv_R009NNNYN_partial_03_0147,
  rs_R009_ueqv_R009NNNYN_partial_03_0148,
  rs_R009_ueqv_R009NNNYN_partial_03_0149,
  rs_R009_ueqv_R009NNNYN_partial_03_0150,
  rs_R009_ueqv_R009NNNYN_partial_03_0151,
  rs_R009_ueqv_R009NNNYN_partial_03_0152,
  rs_R009_ueqv_R009NNNYN_partial_03_0153,
  rs_R009_ueqv_R009NNNYN_partial_03_0154,
  rs_R009_ueqv_R009NNNYN_partial_03_0155,
  rs_R009_ueqv_R009NNNYN_partial_03_0156,
  rs_R009_ueqv_R009NNNYN_partial_03_0157,
  rs_R009_ueqv_R009NNNYN_partial_03_0158,
  rs_R009_ueqv_R009NNNYN_partial_03_0159,
  rs_R009_ueqv_R009NNNYN_partial_03_0160,
  rs_R009_ueqv_R009NNNYN_partial_03_0161,
  rs_R009_ueqv_R009NNNYN_partial_03_0162,
  rs_R009_ueqv_R009NNNYN_partial_03_0163,
  rs_R009_ueqv_R009NNNYN_partial_03_0164,
  rs_R009_ueqv_R009NNNYN_partial_03_0165,
  rs_R009_ueqv_R009NNNYN_partial_03_0166,
  rs_R009_ueqv_R009NNNYN_partial_03_0167,
  rs_R009_ueqv_R009NNNYN_partial_03_0168,
  rs_R009_ueqv_R009NNNYN_partial_03_0169,
  rs_R009_ueqv_R009NNNYN_partial_03_0170,
  rs_R009_ueqv_R009NNNYN_partial_03_0171,
  rs_R009_ueqv_R009NNNYN_partial_03_0172,
  rs_R009_ueqv_R009NNNYN_partial_03_0173,
  rs_R009_ueqv_R009NNNYN_partial_03_0174,
  rs_R009_ueqv_R009NNNYN_partial_03_0175,
  rs_R009_ueqv_R009NNNYN_partial_03_0176,
  rs_R009_ueqv_R009NNNYN_partial_03_0177,
  rs_R009_ueqv_R009NNNYN_partial_03_0178,
  rs_R009_ueqv_R009NNNYN_partial_03_0179,
  rs_R009_ueqv_R009NNNYN_partial_03_0180,
  rs_R009_ueqv_R009NNNYN_partial_03_0181,
  rs_R009_ueqv_R009NNNYN_partial_03_0182,
  rs_R009_ueqv_R009NNNYN_partial_03_0183,
  rs_R009_ueqv_R009NNNYN_partial_03_0184,
  rs_R009_ueqv_R009NNNYN_partial_03_0185,
  rs_R009_ueqv_R009NNNYN_partial_03_0186,
  rs_R009_ueqv_R009NNNYN_partial_03_0187,
  rs_R009_ueqv_R009NNNYN_partial_03_0188,
  rs_R009_ueqv_R009NNNYN_partial_03_0189,
  rs_R009_ueqv_R009NNNYN_partial_03_0190,
  rs_R009_ueqv_R009NNNYN_partial_03_0191,
  rs_R009_ueqv_R009NNNYN_partial_03_0192,
  rs_R009_ueqv_R009NNNYN_partial_03_0193,
  rs_R009_ueqv_R009NNNYN_partial_03_0194,
  rs_R009_ueqv_R009NNNYN_partial_03_0195,
  rs_R009_ueqv_R009NNNYN_partial_03_0196,
  rs_R009_ueqv_R009NNNYN_partial_03_0197,
  rs_R009_ueqv_R009NNNYN_partial_03_0198,
  rs_R009_ueqv_R009NNNYN_partial_03_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_03_0100_0199 : Poly :=
[
  term ((-2387058240 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((11687208048 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-50923909120 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (11, 2)],
  term ((2359640640 : Rat) / 12247399) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((137059753768 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39051204272 : Rat) / 110226591) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((-9579498314696 : Rat) / 157072892175) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((8771824241152 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (11, 1)],
  term ((411179261304 : Rat) / 5817514525) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((-9579498314696 : Rat) / 52357630725) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((-2307 : Rat) / 67) [(4, 1), (5, 1), (9, 1)],
  term ((-392 : Rat) / 67) [(4, 1), (5, 1), (9, 1), (10, 1)],
  term ((1193529120 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (11, 2)],
  term ((-1179820320 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1378200292 : Rat) / 698101743) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(4, 1), (5, 1), (9, 1), (14, 1)],
  term ((19525602136 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (15, 2)],
  term ((153811535336 : Rat) / 18848747061) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((44102409344 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (11, 1)],
  term ((689100146 : Rat) / 232700581) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (15, 1)],
  term ((1064778681344 : Rat) / 31414578435) [(4, 1), (5, 1), (10, 1), (11, 1)],
  term ((16637166896 : Rat) / 1163502905) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term ((-1021468446232 : Rat) / 31414578435) [(4, 1), (5, 1), (10, 1), (15, 1)],
  term ((-7551891051248 : Rat) / 94243735305) [(4, 1), (5, 1), (11, 1)],
  term ((1251604480 : Rat) / 110226591) [(4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-389939200 : Rat) / 110226591) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-162068480 : Rat) / 110226591) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-20453923840 : Rat) / 330679773) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term ((-413371702912 : Rat) / 24800982975) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term ((696320 : Rat) / 1645173) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term ((9280 : Rat) / 201) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((810187430512 : Rat) / 24800982975) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((77987840 : Rat) / 110226591) [(4, 1), (5, 1), (11, 2), (15, 1)],
  term ((58668960 : Rat) / 12247399) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-18278400 : Rat) / 12247399) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((351641600 : Rat) / 110226591) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1365583952 : Rat) / 110226591) [(4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-252 : Rat) / 67) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-119053264862 : Rat) / 3490508715) [(4, 1), (5, 1), (13, 1)],
  term ((-319592560 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-6458932858 : Rat) / 918554925) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2741760 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((225172480 : Rat) / 110226591) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (5, 1), (13, 2), (15, 1)],
  term ((19089964136 : Rat) / 330679773) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((82564179176 : Rat) / 24800982975) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((6523169409154 : Rat) / 94243735305) [(4, 1), (5, 1), (15, 1)],
  term ((121272755524 : Rat) / 24800982975) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-35164160 : Rat) / 36742197) [(4, 1), (5, 1), (15, 3)],
  term ((-507 : Rat) / 67) [(4, 1), (7, 1), (9, 1)],
  term ((397843040 : Rat) / 12247399) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-105669935265656 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((15362856828928 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(4, 1), (7, 1), (9, 1), (11, 2)],
  term ((-1040503927904 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((240044637952 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((64253054754688 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-18214535855444 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (11, 1)],
  term ((689100146 : Rat) / 698101743) [(4, 1), (7, 1), (9, 2), (13, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (15, 1)],
  term ((663624969728 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (11, 1)],
  term ((10369140152 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-598447517344 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((72431879511652 : Rat) / 471218676525) [(4, 1), (7, 1), (11, 1)],
  term ((94030969088 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((1559756800 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((28636160 : Rat) / 12247399) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2007998798848 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((77987840 : Rat) / 36742197) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((413371702912 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14955943040 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-9280 : Rat) / 201) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((1469233892 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((73113600 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-82308283048 : Rat) / 330679773) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((252 : Rat) / 67) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1406566400 : Rat) / 110226591) [(4, 1), (7, 1), (12, 1), (15, 3)],
  term ((889545234193 : Rat) / 17452543575) [(4, 1), (7, 1), (13, 1)],
  term ((-31374981232 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((10967040 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1187500480 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((8225280 : Rat) / 12247399) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((1257019399304 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70328320 : Rat) / 36742197) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((-37737424213946 : Rat) / 471218676525) [(4, 1), (7, 1), (15, 1)],
  term ((1193529120 : Rat) / 12247399) [(4, 2), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(4, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(4, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 110226591) [(4, 2), (5, 1), (7, 1), (11, 2)],
  term ((-1179820320 : Rat) / 12247399) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19525602136 : Rat) / 110226591) [(4, 2), (5, 1), (7, 1), (15, 2)],
  term ((4789749157348 : Rat) / 157072892175) [(4, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(4, 2), (5, 1), (7, 2), (11, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(4, 2), (5, 1), (7, 2), (13, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(4, 2), (5, 1), (7, 2), (15, 1)],
  term ((2307 : Rat) / 134) [(4, 2), (5, 1), (9, 1)],
  term ((196 : Rat) / 67) [(4, 2), (5, 1), (9, 1), (10, 1)],
  term ((-596764560 : Rat) / 12247399) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((2921802012 : Rat) / 12247399) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 110226591) [(4, 2), (5, 1), (9, 1), (11, 2)],
  term ((589910160 : Rat) / 12247399) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((-9762801068 : Rat) / 110226591) [(4, 2), (5, 1), (9, 1), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(4, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(4, 2), (5, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 232700581) [(4, 2), (5, 1), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 6282915687) [(4, 2), (5, 1), (9, 2), (15, 1)],
  term ((-532389340672 : Rat) / 31414578435) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term ((-8318583448 : Rat) / 1163502905) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((510734223116 : Rat) / 31414578435) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((3775945525624 : Rat) / 94243735305) [(4, 2), (5, 1), (11, 1)],
  term ((-625802240 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((81034240 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((10226961920 : Rat) / 330679773) [(4, 2), (5, 1), (11, 1), (14, 1)],
  term ((206685851456 : Rat) / 24800982975) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((9748480 : Rat) / 36742197) [(4, 2), (5, 1), (11, 1), (14, 2)],
  term ((-348160 : Rat) / 1645173) [(4, 2), (5, 1), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(4, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-29334480 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((9139200 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((682791976 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((59526632431 : Rat) / 3490508715) [(4, 2), (5, 1), (13, 1)],
  term ((159796280 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((3229466429 : Rat) / 918554925) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((1370880 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 2)],
  term ((-112586240 : Rat) / 110226591) [(4, 2), (5, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 2), (5, 1), (13, 2), (15, 1)],
  term ((-9544982068 : Rat) / 330679773) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(4, 2), (5, 1), (14, 2), (15, 1)],
  term ((-3261584704577 : Rat) / 94243735305) [(4, 2), (5, 1), (15, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(4, 2), (5, 1), (15, 3)],
  term ((507 : Rat) / 134) [(4, 2), (7, 1), (9, 1)],
  term ((-198921520 : Rat) / 12247399) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((52834967632828 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-7681428414464 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(4, 2), (7, 1), (9, 1), (11, 2)],
  term ((520251963952 : Rat) / 17452543575) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-32126527377344 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (15, 2)],
  term ((9107267927722 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(4, 2), (7, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 698101743) [(4, 2), (7, 1), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 18848747061) [(4, 2), (7, 1), (9, 2), (15, 1)],
  term ((-331812484864 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((-5184570076 : Rat) / 1163502905) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((299223758672 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-36215939755826 : Rat) / 471218676525) [(4, 2), (7, 1), (11, 1)],
  term ((-47015484544 : Rat) / 330679773) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-14318080 : Rat) / 12247399) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1003999399424 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((7477971520 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(4, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-97484800 : Rat) / 110226591) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-734616946 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((41154141524 : Rat) / 330679773) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(4, 2), (7, 1), (12, 1), (15, 3)],
  term ((-889545234193 : Rat) / 34905087150) [(4, 2), (7, 1), (13, 1)],
  term ((15687490616 : Rat) / 918554925) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((593750240 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-4112640 : Rat) / 12247399) [(4, 2), (7, 1), (13, 2), (15, 1)],
  term ((-628509699652 : Rat) / 24800982975) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(4, 2), (7, 1), (14, 1), (15, 3)],
  term ((18868712106973 : Rat) / 471218676525) [(4, 2), (7, 1), (15, 1)],
  term ((2387058240 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-11687208048 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((50923909120 : Rat) / 110226591) [(5, 1), (7, 1), (8, 1), (11, 2)],
  term ((-2359640640 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((39051204272 : Rat) / 110226591) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (8, 2), (11, 2)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (8, 2), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (9, 2), (11, 2)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-8771824241152 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 1), (11, 1)],
  term ((-411179261304 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((9579498314696 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 2), (11, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 2), (13, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 2), (15, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (9, 2), (11, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (9, 2), (13, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (9, 2), (15, 1)],
  term ((2307 : Rat) / 67) [(5, 1), (8, 1), (9, 1)],
  term ((392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (8, 1), (9, 1), (11, 2)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-44102409344 : Rat) / 6282915687) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((-689100146 : Rat) / 232700581) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((76905767668 : Rat) / 6282915687) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((-1064778681344 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-16637166896 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((1021468446232 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((7551891051248 : Rat) / 94243735305) [(5, 1), (8, 1), (11, 1)],
  term ((-1251604480 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((162068480 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((20453923840 : Rat) / 330679773) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((-696320 : Rat) / 1645173) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-9280 : Rat) / 201) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-77987840 : Rat) / 110226591) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-58668960 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-351641600 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((1365583952 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((252 : Rat) / 67) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((119053264862 : Rat) / 3490508715) [(5, 1), (8, 1), (13, 1)],
  term ((319592560 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-225172480 : Rat) / 110226591) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((-19089964136 : Rat) / 330679773) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-6523169409154 : Rat) / 94243735305) [(5, 1), (8, 1), (15, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (8, 1), (15, 3)],
  term ((-2307 : Rat) / 134) [(5, 1), (8, 2), (9, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (8, 2), (9, 1), (10, 1)],
  term ((596764560 : Rat) / 12247399) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-2921802012 : Rat) / 12247399) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (8, 2), (9, 1), (11, 2)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 67) [(5, 1), (8, 2), (9, 1), (14, 1)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (8, 2), (9, 1), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (8, 2), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (8, 2), (9, 2), (13, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (8, 2), (9, 2), (15, 1)],
  term ((532389340672 : Rat) / 31414578435) [(5, 1), (8, 2), (10, 1), (11, 1)],
  term ((8318583448 : Rat) / 1163502905) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((-510734223116 : Rat) / 31414578435) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((-3775945525624 : Rat) / 94243735305) [(5, 1), (8, 2), (11, 1)],
  term ((625802240 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1), (14, 1)],
  term ((-81034240 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-10226961920 : Rat) / 330679773) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (14, 2)],
  term ((348160 : Rat) / 1645173) [(5, 1), (8, 2), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((29334480 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((-682791976 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-59526632431 : Rat) / 3490508715) [(5, 1), (8, 2), (13, 1)],
  term ((-159796280 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 2)],
  term ((112586240 : Rat) / 110226591) [(5, 1), (8, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-4569600 : Rat) / 12247399) [(5, 1), (8, 2), (13, 2), (15, 1)],
  term ((9544982068 : Rat) / 330679773) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (8, 2), (14, 2), (15, 1)],
  term ((3261584704577 : Rat) / 94243735305) [(5, 1), (8, 2), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 2), (15, 3)],
  term ((532389340672 : Rat) / 31414578435) [(5, 1), (9, 2), (10, 1), (11, 1)],
  term ((8318583448 : Rat) / 1163502905) [(5, 1), (9, 2), (10, 1), (13, 1)],
  term ((-510734223116 : Rat) / 31414578435) [(5, 1), (9, 2), (10, 1), (15, 1)],
  term ((-3775945525624 : Rat) / 94243735305) [(5, 1), (9, 2), (11, 1)],
  term ((625802240 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((-81034240 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-10226961920 : Rat) / 330679773) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (9, 2), (11, 1), (14, 2)],
  term ((348160 : Rat) / 1645173) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((29334480 : Rat) / 12247399) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((-682791976 : Rat) / 110226591) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-59526632431 : Rat) / 3490508715) [(5, 1), (9, 2), (13, 1)],
  term ((-159796280 : Rat) / 12247399) [(5, 1), (9, 2), (13, 1), (14, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (9, 2), (13, 1), (14, 2)],
  term ((112586240 : Rat) / 110226591) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-4569600 : Rat) / 12247399) [(5, 1), (9, 2), (13, 2), (15, 1)],
  term ((9544982068 : Rat) / 330679773) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (9, 2), (14, 2), (15, 1)],
  term ((3261584704577 : Rat) / 94243735305) [(5, 1), (9, 2), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (9, 2), (15, 3)],
  term ((-2307 : Rat) / 134) [(5, 1), (9, 3)],
  term ((-196 : Rat) / 67) [(5, 1), (9, 3), (10, 1)],
  term ((596764560 : Rat) / 12247399) [(5, 1), (9, 3), (11, 1), (13, 1)],
  term ((-2921802012 : Rat) / 12247399) [(5, 1), (9, 3), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (9, 3), (11, 2)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (9, 3), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 3), (14, 1)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (9, 3), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (9, 4), (11, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (9, 4), (13, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (9, 4), (15, 1)],
  term ((507 : Rat) / 134) [(5, 2), (7, 1), (9, 1)],
  term ((-198921520 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((52834967632828 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-7681428414464 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(5, 2), (7, 1), (9, 1), (11, 2)],
  term ((520251963952 : Rat) / 17452543575) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-32126527377344 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (15, 2)],
  term ((9107267927722 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(5, 2), (7, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 698101743) [(5, 2), (7, 1), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 18848747061) [(5, 2), (7, 1), (9, 2), (15, 1)],
  term ((-331812484864 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (11, 1)],
  term ((-5184570076 : Rat) / 1163502905) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((299223758672 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-36215939755826 : Rat) / 471218676525) [(5, 2), (7, 1), (11, 1)],
  term ((-47015484544 : Rat) / 330679773) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-14318080 : Rat) / 12247399) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1003999399424 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((7477971520 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-97484800 : Rat) / 110226591) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-734616946 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((41154141524 : Rat) / 330679773) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(5, 2), (7, 1), (12, 1), (15, 3)],
  term ((-889545234193 : Rat) / 34905087150) [(5, 2), (7, 1), (13, 1)],
  term ((15687490616 : Rat) / 918554925) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((593750240 : Rat) / 12247399) [(5, 2), (7, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-4112640 : Rat) / 12247399) [(5, 2), (7, 1), (13, 2), (15, 1)],
  term ((-628509699652 : Rat) / 24800982975) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(5, 2), (7, 1), (14, 1), (15, 3)],
  term ((18868712106973 : Rat) / 471218676525) [(5, 2), (7, 1), (15, 1)],
  term ((1193529120 : Rat) / 12247399) [(5, 3), (7, 1), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(5, 3), (7, 1), (11, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 110226591) [(5, 3), (7, 1), (11, 2)],
  term ((-1179820320 : Rat) / 12247399) [(5, 3), (7, 1), (13, 1), (15, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19525602136 : Rat) / 110226591) [(5, 3), (7, 1), (15, 2)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 3), (7, 1), (15, 2), (16, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(5, 3), (7, 2), (11, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(5, 3), (7, 2), (13, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(5, 3), (7, 2), (15, 1)],
  term ((2307 : Rat) / 134) [(5, 3), (9, 1)],
  term ((196 : Rat) / 67) [(5, 3), (9, 1), (10, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 3), (9, 1), (11, 1), (13, 1)],
  term ((2921802012 : Rat) / 12247399) [(5, 3), (9, 1), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 110226591) [(5, 3), (9, 1), (11, 2)],
  term ((589910160 : Rat) / 12247399) [(5, 3), (9, 1), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(5, 3), (9, 1), (14, 1)],
  term ((-9762801068 : Rat) / 110226591) [(5, 3), (9, 1), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(5, 3), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 3), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 3), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 3), (9, 2), (15, 1)],
  term ((-532389340672 : Rat) / 31414578435) [(5, 3), (10, 1), (11, 1)],
  term ((-8318583448 : Rat) / 1163502905) [(5, 3), (10, 1), (13, 1)],
  term ((510734223116 : Rat) / 31414578435) [(5, 3), (10, 1), (15, 1)],
  term ((3775945525624 : Rat) / 94243735305) [(5, 3), (11, 1)],
  term ((-625802240 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1), (14, 1)],
  term ((81034240 : Rat) / 110226591) [(5, 3), (11, 1), (13, 1), (15, 1)],
  term ((10226961920 : Rat) / 330679773) [(5, 3), (11, 1), (14, 1)],
  term ((206685851456 : Rat) / 24800982975) [(5, 3), (11, 1), (14, 1), (16, 1)],
  term ((9748480 : Rat) / 36742197) [(5, 3), (11, 1), (14, 2)],
  term ((-348160 : Rat) / 1645173) [(5, 3), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(5, 3), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(5, 3), (11, 1), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 3), (11, 2), (15, 1)],
  term ((-29334480 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(5, 3), (12, 1), (14, 1), (15, 1)],
  term ((682791976 : Rat) / 110226591) [(5, 3), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((59526632431 : Rat) / 3490508715) [(5, 3), (13, 1)],
  term ((159796280 : Rat) / 12247399) [(5, 3), (13, 1), (14, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 3), (13, 1), (14, 1), (16, 1)],
  term ((1370880 : Rat) / 12247399) [(5, 3), (13, 1), (14, 2)],
  term ((-112586240 : Rat) / 110226591) [(5, 3), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 3), (13, 1), (16, 1)],
  term ((4569600 : Rat) / 12247399) [(5, 3), (13, 2), (15, 1)],
  term ((-9544982068 : Rat) / 330679773) [(5, 3), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 3), (14, 2), (15, 1)],
  term ((-3261584704577 : Rat) / 94243735305) [(5, 3), (15, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(5, 3), (15, 1), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(5, 3), (15, 3)],
  term ((507 : Rat) / 67) [(7, 1), (8, 1), (9, 1)],
  term ((-397843040 : Rat) / 12247399) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((105669935265656 : Rat) / 471218676525) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-15362856828928 : Rat) / 471218676525) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 330679773) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((1040503927904 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-240044637952 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-64253054754688 : Rat) / 471218676525) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((18214535855444 : Rat) / 471218676525) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-689100146 : Rat) / 698101743) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((76905767668 : Rat) / 18848747061) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((-663624969728 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-10369140152 : Rat) / 1163502905) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((598447517344 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-72431879511652 : Rat) / 471218676525) [(7, 1), (8, 1), (11, 1)],
  term ((-94030969088 : Rat) / 330679773) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1559756800 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-28636160 : Rat) / 12247399) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2007998798848 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-77987840 : Rat) / 36742197) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-413371702912 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((14955943040 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((9280 : Rat) / 201) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((810187430512 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1469233892 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-73113600 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((82308283048 : Rat) / 330679773) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-252 : Rat) / 67) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1406566400 : Rat) / 110226591) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-889545234193 : Rat) / 17452543575) [(7, 1), (8, 1), (13, 1)],
  term ((31374981232 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-10967040 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1187500480 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-8225280 : Rat) / 12247399) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-1257019399304 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((82564179176 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((70328320 : Rat) / 36742197) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((37737424213946 : Rat) / 471218676525) [(7, 1), (8, 1), (15, 1)],
  term ((-507 : Rat) / 134) [(7, 1), (8, 2), (9, 1)],
  term ((198921520 : Rat) / 12247399) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-52834967632828 : Rat) / 471218676525) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(7, 1), (8, 2), (9, 1), (11, 2)],
  term ((-520251963952 : Rat) / 17452543575) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((120022318976 : Rat) / 17452543575) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 67) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((32126527377344 : Rat) / 471218676525) [(7, 1), (8, 2), (9, 1), (15, 2)],
  term ((-9107267927722 : Rat) / 471218676525) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (8, 2), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 1), (8, 2), (9, 2), (13, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (8, 2), (9, 2), (15, 1)],
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((36215939755826 : Rat) / 471218676525) [(7, 1), (8, 2), (11, 1)],
  term ((47015484544 : Rat) / 330679773) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((779878400 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (12, 1), (15, 2)],
  term ((14318080 : Rat) / 12247399) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1003999399424 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(7, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((206685851456 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-7477971520 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((97484800 : Rat) / 110226591) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((734616946 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((36556800 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((-41154141524 : Rat) / 330679773) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-703283200 : Rat) / 110226591) [(7, 1), (8, 2), (12, 1), (15, 3)],
  term ((889545234193 : Rat) / 34905087150) [(7, 1), (8, 2), (13, 1)],
  term ((-15687490616 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((5483520 : Rat) / 12247399) [(7, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-593750240 : Rat) / 12247399) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((4112640 : Rat) / 12247399) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((628509699652 : Rat) / 24800982975) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35164160 : Rat) / 36742197) [(7, 1), (8, 2), (14, 1), (15, 3)],
  term ((-18868712106973 : Rat) / 471218676525) [(7, 1), (8, 2), (15, 1)],
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (11, 1)],
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (9, 2), (10, 1), (13, 1)],
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (15, 1)],
  term ((36215939755826 : Rat) / 471218676525) [(7, 1), (9, 2), (11, 1)],
  term ((47015484544 : Rat) / 330679773) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((779878400 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((14318080 : Rat) / 12247399) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1003999399424 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(7, 1), (9, 2), (11, 1), (14, 1), (15, 2)],
  term ((206685851456 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-7477971520 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((97484800 : Rat) / 110226591) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((734616946 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1)],
  term ((36556800 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((-41154141524 : Rat) / 330679773) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-703283200 : Rat) / 110226591) [(7, 1), (9, 2), (12, 1), (15, 3)],
  term ((889545234193 : Rat) / 34905087150) [(7, 1), (9, 2), (13, 1)],
  term ((-15687490616 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((5483520 : Rat) / 12247399) [(7, 1), (9, 2), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-593750240 : Rat) / 12247399) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((4112640 : Rat) / 12247399) [(7, 1), (9, 2), (13, 2), (15, 1)],
  term ((628509699652 : Rat) / 24800982975) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35164160 : Rat) / 36742197) [(7, 1), (9, 2), (14, 1), (15, 3)],
  term ((-18868712106973 : Rat) / 471218676525) [(7, 1), (9, 2), (15, 1)],
  term ((-507 : Rat) / 134) [(7, 1), (9, 3)],
  term ((198921520 : Rat) / 12247399) [(7, 1), (9, 3), (11, 1), (13, 1)],
  term ((-52834967632828 : Rat) / 471218676525) [(7, 1), (9, 3), (11, 1), (15, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(7, 1), (9, 3), (11, 2)],
  term ((-520251963952 : Rat) / 17452543575) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((120022318976 : Rat) / 17452543575) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 67) [(7, 1), (9, 3), (14, 1)],
  term ((32126527377344 : Rat) / 471218676525) [(7, 1), (9, 3), (15, 2)],
  term ((-9107267927722 : Rat) / 471218676525) [(7, 1), (9, 3), (15, 2), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (9, 4), (11, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 1), (9, 4), (13, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (9, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NNNYN_block_03_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_03_0100_0199
      rs_R009_ueqv_R009NNNYN_block_03_0100_0199 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
