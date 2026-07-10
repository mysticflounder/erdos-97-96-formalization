/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 18:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0100 : Poly :=
[
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 100 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0100 : Poly :=
[
  term ((-76905767668 : Rat) / 6282915687) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(5, 1), (7, 1), (9, 3), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (8, 2), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (9, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0100
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0101 : Poly :=
[
  term ((4012116182972 : Rat) / 157072892175) [(5, 1), (11, 1)]
]

/-- Partial product 101 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0101 : Poly :=
[
  term ((8024232365944 : Rat) / 157072892175) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((8024232365944 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-4012116182972 : Rat) / 157072892175) [(5, 1), (8, 2), (11, 1)],
  term ((-4012116182972 : Rat) / 157072892175) [(5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0101
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0102 : Poly :=
[
  term ((41791359232 : Rat) / 330679773) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 102 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0102 : Poly :=
[
  term ((83582718464 : Rat) / 330679773) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((83582718464 : Rat) / 330679773) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-41791359232 : Rat) / 330679773) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((-41791359232 : Rat) / 330679773) [(5, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0102
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0103 : Poly :=
[
  term ((779878400 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 103 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0103 : Poly :=
[
  term ((1559756800 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((1559756800 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-779878400 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1), (15, 2)],
  term ((-779878400 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0103
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0104 : Poly :=
[
  term ((101749760 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 104 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0104 : Poly :=
[
  term ((203499520 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((203499520 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-101749760 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-101749760 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0104
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0105 : Poly :=
[
  term ((-710213229824 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 105 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0105 : Poly :=
[
  term ((-1420426459648 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1420426459648 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((710213229824 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((710213229824 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0105
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0106 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 106 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0106 : Poly :=
[
  term ((77987840 : Rat) / 36742197) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((77987840 : Rat) / 36742197) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (9, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0106
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0107 : Poly :=
[
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 107 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0107 : Poly :=
[
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0107
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0108 : Poly :=
[
  term ((-7600001600 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 108 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0108 : Poly :=
[
  term ((-15200003200 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-15200003200 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((7600001600 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (15, 2)],
  term ((7600001600 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0108
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0109 : Poly :=
[
  term ((-4640 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0109 : Poly :=
[
  term ((-9280 : Rat) / 201) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9280 : Rat) / 201) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0109
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0110 : Poly :=
[
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 110 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0110 : Poly :=
[
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0110
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0111 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 111 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0111 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0111
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0112 : Poly :=
[
  term ((652989988 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 112 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0112 : Poly :=
[
  term ((1305979976 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((1305979976 : Rat) / 12247399) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-652989988 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((-652989988 : Rat) / 12247399) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0112
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0113 : Poly :=
[
  term ((36556800 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 113 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0113 : Poly :=
[
  term ((73113600 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((73113600 : Rat) / 12247399) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36556800 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((-36556800 : Rat) / 12247399) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0113
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0114 : Poly :=
[
  term ((-37509172052 : Rat) / 330679773) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 114 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0114 : Poly :=
[
  term ((-75018344104 : Rat) / 330679773) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-75018344104 : Rat) / 330679773) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((37509172052 : Rat) / 330679773) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((37509172052 : Rat) / 330679773) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0114
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0115 : Poly :=
[
  term ((126 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0115 : Poly :=
[
  term ((252 : Rat) / 67) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 67) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0115
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0116 : Poly :=
[
  term ((-703283200 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 116 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0116 : Poly :=
[
  term ((-1406566400 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1406566400 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((703283200 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (15, 3)],
  term ((703283200 : Rat) / 110226591) [(5, 1), (9, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0116
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0117 : Poly :=
[
  term ((42446488021 : Rat) / 11635029050) [(5, 1), (13, 1)]
]

/-- Partial product 117 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0117 : Poly :=
[
  term ((42446488021 : Rat) / 5817514525) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((42446488021 : Rat) / 5817514525) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-42446488021 : Rat) / 11635029050) [(5, 1), (8, 2), (13, 1)],
  term ((-42446488021 : Rat) / 11635029050) [(5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0117
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0118 : Poly :=
[
  term ((-11097081716 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 118 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0118 : Poly :=
[
  term ((-22194163432 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-22194163432 : Rat) / 918554925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((11097081716 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((11097081716 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0118
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0119 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 119 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0119 : Poly :=
[
  term ((10967040 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((10967040 : Rat) / 12247399) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0119
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0120 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 120 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0120 : Poly :=
[
  term ((6458932858 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0120
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0121 : Poly :=
[
  term ((-5296609120 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 121 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0121 : Poly :=
[
  term ((-10593218240 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-10593218240 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((5296609120 : Rat) / 110226591) [(5, 1), (8, 2), (13, 1), (15, 2)],
  term ((5296609120 : Rat) / 110226591) [(5, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0121
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0122 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 122 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0122 : Poly :=
[
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0122
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0123 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 123 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0123 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (8, 2), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0123
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0124 : Poly :=
[
  term ((350251627552 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 124 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0124 : Poly :=
[
  term ((700503255104 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((700503255104 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-350251627552 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-350251627552 : Rat) / 24800982975) [(5, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0124
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0125 : Poly :=
[
  term ((-41282089588 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0125 : Poly :=
[
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0125
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0126 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 126 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0126 : Poly :=
[
  term ((-70328320 : Rat) / 36742197) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((-70328320 : Rat) / 36742197) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (8, 2), (14, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (9, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0126
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0127 : Poly :=
[
  term ((991328179694 : Rat) / 157072892175) [(5, 1), (15, 1)]
]

/-- Partial product 127 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0127 : Poly :=
[
  term ((1982656359388 : Rat) / 157072892175) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((1982656359388 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-991328179694 : Rat) / 157072892175) [(5, 1), (8, 2), (15, 1)],
  term ((-991328179694 : Rat) / 157072892175) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0127_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0127
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0128 : Poly :=
[
  term ((-60636377762 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0128 : Poly :=
[
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0128_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0128
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0129 : Poly :=
[
  term ((11284269440 : Rat) / 110226591) [(5, 1), (15, 3)]
]

/-- Partial product 129 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0129 : Poly :=
[
  term ((22568538880 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term ((22568538880 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-11284269440 : Rat) / 110226591) [(5, 1), (8, 2), (15, 3)],
  term ((-11284269440 : Rat) / 110226591) [(5, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0129_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0129
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0130 : Poly :=
[
  term ((1721 : Rat) / 67) [(5, 2)]
]

/-- Partial product 130 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0130 : Poly :=
[
  term ((3442 : Rat) / 67) [(5, 2), (6, 1), (8, 1)],
  term ((3442 : Rat) / 67) [(5, 2), (7, 1), (9, 1)],
  term ((-1721 : Rat) / 67) [(5, 2), (8, 2)],
  term ((-1721 : Rat) / 67) [(5, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0130_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0130
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0131 : Poly :=
[
  term ((4385912120576 : Rat) / 52357630725) [(5, 2), (7, 1), (11, 1)]
]

/-- Partial product 131 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0131 : Poly :=
[
  term ((8771824241152 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 2), (11, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(5, 2), (7, 1), (9, 2), (11, 1)],
  term ((8771824241152 : Rat) / 52357630725) [(5, 2), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0131_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0131
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0132 : Poly :=
[
  term ((205589630652 : Rat) / 5817514525) [(5, 2), (7, 1), (13, 1)]
]

/-- Partial product 132 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0132 : Poly :=
[
  term ((411179261304 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(5, 2), (7, 1), (8, 2), (13, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(5, 2), (7, 1), (9, 2), (13, 1)],
  term ((411179261304 : Rat) / 5817514525) [(5, 2), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0132_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0132
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0133 : Poly :=
[
  term ((-4789749157348 : Rat) / 52357630725) [(5, 2), (7, 1), (15, 1)]
]

/-- Partial product 133 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0133 : Poly :=
[
  term ((-9579498314696 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 2), (15, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(5, 2), (7, 1), (9, 2), (15, 1)],
  term ((-9579498314696 : Rat) / 52357630725) [(5, 2), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0133_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0133
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0134 : Poly :=
[
  term ((-44102409344 : Rat) / 6282915687) [(5, 2), (9, 1), (11, 1)]
]

/-- Partial product 134 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0134 : Poly :=
[
  term ((-88204818688 : Rat) / 6282915687) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-88204818688 : Rat) / 6282915687) [(5, 2), (7, 1), (9, 2), (11, 1)],
  term ((44102409344 : Rat) / 6282915687) [(5, 2), (8, 2), (9, 1), (11, 1)],
  term ((44102409344 : Rat) / 6282915687) [(5, 2), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0134_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0134
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0135 : Poly :=
[
  term ((-689100146 : Rat) / 232700581) [(5, 2), (9, 1), (13, 1)]
]

/-- Partial product 135 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0135 : Poly :=
[
  term ((-1378200292 : Rat) / 232700581) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1378200292 : Rat) / 232700581) [(5, 2), (7, 1), (9, 2), (13, 1)],
  term ((689100146 : Rat) / 232700581) [(5, 2), (8, 2), (9, 1), (13, 1)],
  term ((689100146 : Rat) / 232700581) [(5, 2), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0135_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0135
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0136 : Poly :=
[
  term ((76905767668 : Rat) / 6282915687) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 136 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0136 : Poly :=
[
  term ((153811535336 : Rat) / 6282915687) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((153811535336 : Rat) / 6282915687) [(5, 2), (7, 1), (9, 2), (15, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(5, 2), (8, 2), (9, 1), (15, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(5, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0136_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0136
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0137 : Poly :=
[
  term ((-1193529120 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1)]
]

/-- Partial product 137 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0137 : Poly :=
[
  term ((-2387058240 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2387058240 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1193529120 : Rat) / 12247399) [(5, 2), (8, 2), (11, 1), (13, 1)],
  term ((1193529120 : Rat) / 12247399) [(5, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0137_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0137
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0138 : Poly :=
[
  term ((5843604024 : Rat) / 12247399) [(5, 2), (11, 1), (15, 1)]
]

/-- Partial product 138 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0138 : Poly :=
[
  term ((11687208048 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((11687208048 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5843604024 : Rat) / 12247399) [(5, 2), (8, 2), (11, 1), (15, 1)],
  term ((-5843604024 : Rat) / 12247399) [(5, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0138_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0138
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0139 : Poly :=
[
  term ((-25461954560 : Rat) / 110226591) [(5, 2), (11, 2)]
]

/-- Partial product 139 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0139 : Poly :=
[
  term ((-50923909120 : Rat) / 110226591) [(5, 2), (6, 1), (8, 1), (11, 2)],
  term ((-50923909120 : Rat) / 110226591) [(5, 2), (7, 1), (9, 1), (11, 2)],
  term ((25461954560 : Rat) / 110226591) [(5, 2), (8, 2), (11, 2)],
  term ((25461954560 : Rat) / 110226591) [(5, 2), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0139_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0139
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0140 : Poly :=
[
  term ((1179820320 : Rat) / 12247399) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 140 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0140 : Poly :=
[
  term ((2359640640 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((2359640640 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1179820320 : Rat) / 12247399) [(5, 2), (8, 2), (13, 1), (15, 1)],
  term ((-1179820320 : Rat) / 12247399) [(5, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0140_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0140
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0141 : Poly :=
[
  term ((-19525602136 : Rat) / 110226591) [(5, 2), (15, 2)]
]

/-- Partial product 141 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0141 : Poly :=
[
  term ((-39051204272 : Rat) / 110226591) [(5, 2), (6, 1), (8, 1), (15, 2)],
  term ((-39051204272 : Rat) / 110226591) [(5, 2), (7, 1), (9, 1), (15, 2)],
  term ((19525602136 : Rat) / 110226591) [(5, 2), (8, 2), (15, 2)],
  term ((19525602136 : Rat) / 110226591) [(5, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0141_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0141
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0142 : Poly :=
[
  term ((-845 : Rat) / 134) [(7, 1), (9, 1)]
]

/-- Partial product 142 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0142 : Poly :=
[
  term ((-845 : Rat) / 67) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((845 : Rat) / 134) [(7, 1), (8, 2), (9, 1)],
  term ((845 : Rat) / 134) [(7, 1), (9, 3)],
  term ((-845 : Rat) / 67) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0142_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0142
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0143 : Poly :=
[
  term ((198921520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 143 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0143 : Poly :=
[
  term ((397843040 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 1), (9, 3), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0143_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0143
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0144 : Poly :=
[
  term ((-16876615721876 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 144 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0144 : Poly :=
[
  term ((-33753231443752 : Rat) / 157072892175) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 1), (9, 3), (11, 1), (15, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(7, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0144_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0144
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0145 : Poly :=
[
  term ((2192956060288 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0145 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0145_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0145
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0146 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 146 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0146 : Poly :=
[
  term ((25461954560 : Rat) / 330679773) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(7, 1), (8, 2), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(7, 1), (9, 3), (11, 2)],
  term ((25461954560 : Rat) / 330679773) [(7, 2), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0146_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0146
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0147 : Poly :=
[
  term ((-161932318884 : Rat) / 5817514525) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 147 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0147 : Poly :=
[
  term ((-323864637768 : Rat) / 5817514525) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((161932318884 : Rat) / 5817514525) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((161932318884 : Rat) / 5817514525) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((-323864637768 : Rat) / 5817514525) [(7, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0147_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0147
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0148 : Poly :=
[
  term ((34264938442 : Rat) / 5817514525) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0148 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0148_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0148
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0149 : Poly :=
[
  term ((196 : Rat) / 67) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 149 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0149 : Poly :=
[
  term ((392 : Rat) / 67) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(7, 1), (9, 3), (14, 1)],
  term ((392 : Rat) / 67) [(7, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0149_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0149
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0150 : Poly :=
[
  term ((1047453296072 : Rat) / 17452543575) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 150 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0150 : Poly :=
[
  term ((2094906592144 : Rat) / 17452543575) [(6, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 1), (8, 2), (9, 1), (15, 2)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 1), (9, 3), (15, 2)],
  term ((2094906592144 : Rat) / 17452543575) [(7, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0150_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0150
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0151 : Poly :=
[
  term ((-2394874578674 : Rat) / 157072892175) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0151 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(6, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0151_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0151
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0152 : Poly :=
[
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)]
]

/-- Partial product 152 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0152 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(6, 1), (7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (8, 2), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (9, 4), (11, 1)],
  term ((44102409344 : Rat) / 18848747061) [(7, 2), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0152_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0152
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0153 : Poly :=
[
  term ((344550073 : Rat) / 698101743) [(7, 1), (9, 2), (13, 1)]
]

/-- Partial product 153 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0153 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(6, 1), (7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 698101743) [(7, 1), (8, 2), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 698101743) [(7, 1), (9, 4), (13, 1)],
  term ((689100146 : Rat) / 698101743) [(7, 2), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0153_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0153
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0154 : Poly :=
[
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 154 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0154 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(6, 1), (7, 1), (8, 1), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (8, 2), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (9, 4), (15, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(7, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0154_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0154
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0155 : Poly :=
[
  term ((322551428864 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 155 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0155 : Poly :=
[
  term ((645102857728 : Rat) / 31414578435) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-322551428864 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((-322551428864 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (11, 1)],
  term ((645102857728 : Rat) / 31414578435) [(7, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0155_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0155
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0156 : Poly :=
[
  term ((5039866076 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 156 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0156 : Poly :=
[
  term ((10079732152 : Rat) / 1163502905) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-5039866076 : Rat) / 1163502905) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-5039866076 : Rat) / 1163502905) [(7, 1), (9, 2), (10, 1), (13, 1)],
  term ((10079732152 : Rat) / 1163502905) [(7, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0156_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0156
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0157 : Poly :=
[
  term ((-290872270672 : Rat) / 31414578435) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 157 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0157 : Poly :=
[
  term ((-581744541344 : Rat) / 31414578435) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((290872270672 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((290872270672 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (15, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0157_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0157
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0158 : Poly :=
[
  term ((-640499291746 : Rat) / 31414578435) [(7, 1), (11, 1)]
]

/-- Partial product 158 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0158 : Poly :=
[
  term ((-1280998583492 : Rat) / 31414578435) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((640499291746 : Rat) / 31414578435) [(7, 1), (8, 2), (11, 1)],
  term ((640499291746 : Rat) / 31414578435) [(7, 1), (9, 2), (11, 1)],
  term ((-1280998583492 : Rat) / 31414578435) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0158_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0158
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0159 : Poly :=
[
  term ((268424576 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 159 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0159 : Poly :=
[
  term ((536849152 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-268424576 : Rat) / 12247399) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-268424576 : Rat) / 12247399) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((536849152 : Rat) / 12247399) [(7, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0159_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0159
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0160 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 160 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0160 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9748480 : Rat) / 36742197) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-9748480 : Rat) / 36742197) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0160_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0160
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0161 : Poly :=
[
  term ((-5331542272 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 161 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0161 : Poly :=
[
  term ((-10663084544 : Rat) / 330679773) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((5331542272 : Rat) / 330679773) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((5331542272 : Rat) / 330679773) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((-10663084544 : Rat) / 330679773) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0161_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0161
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0162 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 162 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0162 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(7, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0162_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0162
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0163 : Poly :=
[
  term ((113241618 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 163 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0163 : Poly :=
[
  term ((226483236 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-113241618 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-113241618 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1)],
  term ((226483236 : Rat) / 12247399) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0163_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0163
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0164 : Poly :=
[
  term ((-235480756 : Rat) / 12247399) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 164 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0164 : Poly :=
[
  term ((-470961512 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((235480756 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((235480756 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-470961512 : Rat) / 12247399) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0164_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0164
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0165 : Poly :=
[
  term ((-10227586264 : Rat) / 1163502905) [(7, 1), (13, 1)]
]

/-- Partial product 165 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0165 : Poly :=
[
  term ((-20455172528 : Rat) / 1163502905) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((10227586264 : Rat) / 1163502905) [(7, 1), (8, 2), (13, 1)],
  term ((10227586264 : Rat) / 1163502905) [(7, 1), (9, 2), (13, 1)],
  term ((-20455172528 : Rat) / 1163502905) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0165_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0165
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0166 : Poly :=
[
  term ((-83305348 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 166 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0166 : Poly :=
[
  term ((-166610696 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((83305348 : Rat) / 12247399) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((83305348 : Rat) / 12247399) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-166610696 : Rat) / 12247399) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0166_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0166
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0167 : Poly :=
[
  term ((-6049280 : Rat) / 36742197) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 167 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0167 : Poly :=
[
  term ((-12098560 : Rat) / 36742197) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((6049280 : Rat) / 36742197) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((6049280 : Rat) / 36742197) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((-12098560 : Rat) / 36742197) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0167_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0167
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0168 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 168 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0168 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-1370880 : Rat) / 12247399) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((-1370880 : Rat) / 12247399) [(7, 1), (9, 2), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(7, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0168_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0168
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0169 : Poly :=
[
  term ((4985587340 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 169 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0169 : Poly :=
[
  term ((9971174680 : Rat) / 330679773) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-4985587340 : Rat) / 330679773) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-4985587340 : Rat) / 330679773) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((9971174680 : Rat) / 330679773) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0169_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0169
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0170 : Poly :=
[
  term ((623255328593 : Rat) / 31414578435) [(7, 1), (15, 1)]
]

/-- Partial product 170 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0170 : Poly :=
[
  term ((1246510657186 : Rat) / 31414578435) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-623255328593 : Rat) / 31414578435) [(7, 1), (8, 2), (15, 1)],
  term ((-623255328593 : Rat) / 31414578435) [(7, 1), (9, 2), (15, 1)],
  term ((1246510657186 : Rat) / 31414578435) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0170_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0170
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0171 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(7, 1), (15, 3)]
]

/-- Partial product 171 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0171 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(6, 1), (7, 1), (8, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(7, 1), (8, 2), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(7, 1), (9, 2), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0171_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0171
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0172 : Poly :=
[
  term ((-2192956060288 : Rat) / 157072892175) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 172 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0172 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(6, 1), (7, 2), (8, 1), (9, 1), (11, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 2), (8, 2), (9, 1), (11, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 2), (9, 3), (11, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 3), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0172_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0172
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0173 : Poly :=
[
  term ((-34264938442 : Rat) / 5817514525) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 173 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0173 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(6, 1), (7, 2), (8, 1), (9, 1), (13, 1)],
  term ((34264938442 : Rat) / 5817514525) [(7, 2), (8, 2), (9, 1), (13, 1)],
  term ((34264938442 : Rat) / 5817514525) [(7, 2), (9, 3), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 3), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0173_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0173
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0174 : Poly :=
[
  term ((2394874578674 : Rat) / 157072892175) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 174 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0174 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(6, 1), (7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 2), (8, 2), (9, 1), (15, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 2), (9, 3), (15, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 3), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0174_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0174
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0175 : Poly :=
[
  term ((322551428864 : Rat) / 31414578435) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 175 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0175 : Poly :=
[
  term ((645102857728 : Rat) / 31414578435) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((645102857728 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (11, 1)],
  term ((-322551428864 : Rat) / 31414578435) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-322551428864 : Rat) / 31414578435) [(9, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0175_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0175
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0176 : Poly :=
[
  term ((5039866076 : Rat) / 1163502905) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 176 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0176 : Poly :=
[
  term ((10079732152 : Rat) / 1163502905) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((10079732152 : Rat) / 1163502905) [(7, 1), (9, 2), (10, 1), (13, 1)],
  term ((-5039866076 : Rat) / 1163502905) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-5039866076 : Rat) / 1163502905) [(9, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0176_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0176
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0177 : Poly :=
[
  term ((-290872270672 : Rat) / 31414578435) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 177 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0177 : Poly :=
[
  term ((-581744541344 : Rat) / 31414578435) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (15, 1)],
  term ((290872270672 : Rat) / 31414578435) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((290872270672 : Rat) / 31414578435) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0177_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0177
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0178 : Poly :=
[
  term ((-992547202904 : Rat) / 17452543575) [(9, 1), (11, 1)]
]

/-- Partial product 178 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0178 : Poly :=
[
  term ((-1985094405808 : Rat) / 17452543575) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-1985094405808 : Rat) / 17452543575) [(7, 1), (9, 2), (11, 1)],
  term ((992547202904 : Rat) / 17452543575) [(8, 2), (9, 1), (11, 1)],
  term ((992547202904 : Rat) / 17452543575) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0178_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0178
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0179 : Poly :=
[
  term ((-4608126208 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 179 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0179 : Poly :=
[
  term ((-9216252416 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-9216252416 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((4608126208 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((4608126208 : Rat) / 110226591) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0179_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0179
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0180 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 180 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0180 : Poly :=
[
  term ((-779878400 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-779878400 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(9, 3), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0180_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0180
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0181 : Poly :=
[
  term ((-80120320 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 181 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0181 : Poly :=
[
  term ((-160240640 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-160240640 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((80120320 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((80120320 : Rat) / 110226591) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0181_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0181
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0182 : Poly :=
[
  term ((589733600512 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 182 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0182 : Poly :=
[
  term ((1179467201024 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((1179467201024 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((-589733600512 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-589733600512 : Rat) / 24800982975) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0182_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0182
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0183 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 183 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0183 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(7, 1), (9, 2), (11, 1), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(8, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(9, 3), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0183_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0183
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0184 : Poly :=
[
  term ((-103342925728 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 184 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0184 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0184_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0184
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0185 : Poly :=
[
  term ((3807312160 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 185 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0185 : Poly :=
[
  term ((7614624320 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((7614624320 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((-3807312160 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-3807312160 : Rat) / 110226591) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0185_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0185
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0186 : Poly :=
[
  term ((2320 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 186 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0186 : Poly :=
[
  term ((4640 : Rat) / 201) [(6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0186_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0186
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0187 : Poly :=
[
  term ((202546857628 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 187 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0187 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0187_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0187
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0188 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 188 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0188 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0188_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0188
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0189 : Poly :=
[
  term ((-216005916 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 189 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0189 : Poly :=
[
  term ((-432011832 : Rat) / 12247399) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-432011832 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1)],
  term ((216005916 : Rat) / 12247399) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((216005916 : Rat) / 12247399) [(9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0189_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0189
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0190 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 190 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0190 : Poly :=
[
  term ((-36556800 : Rat) / 12247399) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36556800 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(9, 3), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0190_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0190
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0191 : Poly :=
[
  term ((4096316156 : Rat) / 110226591) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 191 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0191 : Poly :=
[
  term ((8192632312 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((8192632312 : Rat) / 110226591) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-4096316156 : Rat) / 110226591) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4096316156 : Rat) / 110226591) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0191_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0191
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0192 : Poly :=
[
  term ((-63 : Rat) / 67) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0192 : Poly :=
[
  term ((-126 : Rat) / 67) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0192_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0192
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0193 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 193 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0193 : Poly :=
[
  term ((703283200 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((703283200 : Rat) / 110226591) [(7, 1), (9, 2), (12, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(8, 2), (9, 1), (12, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(9, 3), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0193_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0193
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0194 : Poly :=
[
  term ((-252388992573 : Rat) / 11635029050) [(9, 1), (13, 1)]
]

/-- Partial product 194 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0194 : Poly :=
[
  term ((-252388992573 : Rat) / 5817514525) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-252388992573 : Rat) / 5817514525) [(7, 1), (9, 2), (13, 1)],
  term ((252388992573 : Rat) / 11635029050) [(8, 2), (9, 1), (13, 1)],
  term ((252388992573 : Rat) / 11635029050) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0194_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0194
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0195 : Poly :=
[
  term ((9214587508 : Rat) / 918554925) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 195 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0195 : Poly :=
[
  term ((18429175016 : Rat) / 918554925) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((18429175016 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-9214587508 : Rat) / 918554925) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-9214587508 : Rat) / 918554925) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0195_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0195
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0196 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 196 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0196 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(7, 1), (9, 2), (13, 1), (14, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(8, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(9, 3), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0196_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0196
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0197 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 197 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0197 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0197_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0197
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0198 : Poly :=
[
  term ((2677762160 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 198 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0198 : Poly :=
[
  term ((5355524320 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((5355524320 : Rat) / 110226591) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((-2677762160 : Rat) / 110226591) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2677762160 : Rat) / 110226591) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0198_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0198
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0199 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 199 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0199 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0199_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0199
        rs_R009_ueqv_R009NNNYN_generator_18_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_18_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_18_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_18_0100,
  rs_R009_ueqv_R009NNNYN_partial_18_0101,
  rs_R009_ueqv_R009NNNYN_partial_18_0102,
  rs_R009_ueqv_R009NNNYN_partial_18_0103,
  rs_R009_ueqv_R009NNNYN_partial_18_0104,
  rs_R009_ueqv_R009NNNYN_partial_18_0105,
  rs_R009_ueqv_R009NNNYN_partial_18_0106,
  rs_R009_ueqv_R009NNNYN_partial_18_0107,
  rs_R009_ueqv_R009NNNYN_partial_18_0108,
  rs_R009_ueqv_R009NNNYN_partial_18_0109,
  rs_R009_ueqv_R009NNNYN_partial_18_0110,
  rs_R009_ueqv_R009NNNYN_partial_18_0111,
  rs_R009_ueqv_R009NNNYN_partial_18_0112,
  rs_R009_ueqv_R009NNNYN_partial_18_0113,
  rs_R009_ueqv_R009NNNYN_partial_18_0114,
  rs_R009_ueqv_R009NNNYN_partial_18_0115,
  rs_R009_ueqv_R009NNNYN_partial_18_0116,
  rs_R009_ueqv_R009NNNYN_partial_18_0117,
  rs_R009_ueqv_R009NNNYN_partial_18_0118,
  rs_R009_ueqv_R009NNNYN_partial_18_0119,
  rs_R009_ueqv_R009NNNYN_partial_18_0120,
  rs_R009_ueqv_R009NNNYN_partial_18_0121,
  rs_R009_ueqv_R009NNNYN_partial_18_0122,
  rs_R009_ueqv_R009NNNYN_partial_18_0123,
  rs_R009_ueqv_R009NNNYN_partial_18_0124,
  rs_R009_ueqv_R009NNNYN_partial_18_0125,
  rs_R009_ueqv_R009NNNYN_partial_18_0126,
  rs_R009_ueqv_R009NNNYN_partial_18_0127,
  rs_R009_ueqv_R009NNNYN_partial_18_0128,
  rs_R009_ueqv_R009NNNYN_partial_18_0129,
  rs_R009_ueqv_R009NNNYN_partial_18_0130,
  rs_R009_ueqv_R009NNNYN_partial_18_0131,
  rs_R009_ueqv_R009NNNYN_partial_18_0132,
  rs_R009_ueqv_R009NNNYN_partial_18_0133,
  rs_R009_ueqv_R009NNNYN_partial_18_0134,
  rs_R009_ueqv_R009NNNYN_partial_18_0135,
  rs_R009_ueqv_R009NNNYN_partial_18_0136,
  rs_R009_ueqv_R009NNNYN_partial_18_0137,
  rs_R009_ueqv_R009NNNYN_partial_18_0138,
  rs_R009_ueqv_R009NNNYN_partial_18_0139,
  rs_R009_ueqv_R009NNNYN_partial_18_0140,
  rs_R009_ueqv_R009NNNYN_partial_18_0141,
  rs_R009_ueqv_R009NNNYN_partial_18_0142,
  rs_R009_ueqv_R009NNNYN_partial_18_0143,
  rs_R009_ueqv_R009NNNYN_partial_18_0144,
  rs_R009_ueqv_R009NNNYN_partial_18_0145,
  rs_R009_ueqv_R009NNNYN_partial_18_0146,
  rs_R009_ueqv_R009NNNYN_partial_18_0147,
  rs_R009_ueqv_R009NNNYN_partial_18_0148,
  rs_R009_ueqv_R009NNNYN_partial_18_0149,
  rs_R009_ueqv_R009NNNYN_partial_18_0150,
  rs_R009_ueqv_R009NNNYN_partial_18_0151,
  rs_R009_ueqv_R009NNNYN_partial_18_0152,
  rs_R009_ueqv_R009NNNYN_partial_18_0153,
  rs_R009_ueqv_R009NNNYN_partial_18_0154,
  rs_R009_ueqv_R009NNNYN_partial_18_0155,
  rs_R009_ueqv_R009NNNYN_partial_18_0156,
  rs_R009_ueqv_R009NNNYN_partial_18_0157,
  rs_R009_ueqv_R009NNNYN_partial_18_0158,
  rs_R009_ueqv_R009NNNYN_partial_18_0159,
  rs_R009_ueqv_R009NNNYN_partial_18_0160,
  rs_R009_ueqv_R009NNNYN_partial_18_0161,
  rs_R009_ueqv_R009NNNYN_partial_18_0162,
  rs_R009_ueqv_R009NNNYN_partial_18_0163,
  rs_R009_ueqv_R009NNNYN_partial_18_0164,
  rs_R009_ueqv_R009NNNYN_partial_18_0165,
  rs_R009_ueqv_R009NNNYN_partial_18_0166,
  rs_R009_ueqv_R009NNNYN_partial_18_0167,
  rs_R009_ueqv_R009NNNYN_partial_18_0168,
  rs_R009_ueqv_R009NNNYN_partial_18_0169,
  rs_R009_ueqv_R009NNNYN_partial_18_0170,
  rs_R009_ueqv_R009NNNYN_partial_18_0171,
  rs_R009_ueqv_R009NNNYN_partial_18_0172,
  rs_R009_ueqv_R009NNNYN_partial_18_0173,
  rs_R009_ueqv_R009NNNYN_partial_18_0174,
  rs_R009_ueqv_R009NNNYN_partial_18_0175,
  rs_R009_ueqv_R009NNNYN_partial_18_0176,
  rs_R009_ueqv_R009NNNYN_partial_18_0177,
  rs_R009_ueqv_R009NNNYN_partial_18_0178,
  rs_R009_ueqv_R009NNNYN_partial_18_0179,
  rs_R009_ueqv_R009NNNYN_partial_18_0180,
  rs_R009_ueqv_R009NNNYN_partial_18_0181,
  rs_R009_ueqv_R009NNNYN_partial_18_0182,
  rs_R009_ueqv_R009NNNYN_partial_18_0183,
  rs_R009_ueqv_R009NNNYN_partial_18_0184,
  rs_R009_ueqv_R009NNNYN_partial_18_0185,
  rs_R009_ueqv_R009NNNYN_partial_18_0186,
  rs_R009_ueqv_R009NNNYN_partial_18_0187,
  rs_R009_ueqv_R009NNNYN_partial_18_0188,
  rs_R009_ueqv_R009NNNYN_partial_18_0189,
  rs_R009_ueqv_R009NNNYN_partial_18_0190,
  rs_R009_ueqv_R009NNNYN_partial_18_0191,
  rs_R009_ueqv_R009NNNYN_partial_18_0192,
  rs_R009_ueqv_R009NNNYN_partial_18_0193,
  rs_R009_ueqv_R009NNNYN_partial_18_0194,
  rs_R009_ueqv_R009NNNYN_partial_18_0195,
  rs_R009_ueqv_R009NNNYN_partial_18_0196,
  rs_R009_ueqv_R009NNNYN_partial_18_0197,
  rs_R009_ueqv_R009NNNYN_partial_18_0198,
  rs_R009_ueqv_R009NNNYN_partial_18_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_18_0100_0199 : Poly :=
[
  term ((-76905767668 : Rat) / 6282915687) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1)],
  term ((8024232365944 : Rat) / 157072892175) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((83582718464 : Rat) / 330679773) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((1559756800 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((203499520 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1420426459648 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((77987840 : Rat) / 36742197) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-15200003200 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-9280 : Rat) / 201) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((1305979976 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((73113600 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-75018344104 : Rat) / 330679773) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((252 : Rat) / 67) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1406566400 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((42446488021 : Rat) / 5817514525) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-22194163432 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((10967040 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10593218240 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((700503255104 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70328320 : Rat) / 36742197) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((1982656359388 : Rat) / 157072892175) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((22568538880 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term ((8024232365944 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((83582718464 : Rat) / 330679773) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((1559756800 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((203499520 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1420426459648 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((77987840 : Rat) / 36742197) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-15200003200 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-9280 : Rat) / 201) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((1305979976 : Rat) / 12247399) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((73113600 : Rat) / 12247399) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-75018344104 : Rat) / 330679773) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((252 : Rat) / 67) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1406566400 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((42446488021 : Rat) / 5817514525) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-22194163432 : Rat) / 918554925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((10967040 : Rat) / 12247399) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10593218240 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((700503255104 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70328320 : Rat) / 36742197) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 3)],
  term ((1982656359388 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((22568538880 : Rat) / 110226591) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-76905767668 : Rat) / 6282915687) [(5, 1), (7, 1), (9, 3), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (8, 2), (9, 2), (15, 1)],
  term ((-4012116182972 : Rat) / 157072892175) [(5, 1), (8, 2), (11, 1)],
  term ((-41791359232 : Rat) / 330679773) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1), (15, 2)],
  term ((-101749760 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((710213229824 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((7600001600 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((-652989988 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((37509172052 : Rat) / 330679773) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (15, 3)],
  term ((-42446488021 : Rat) / 11635029050) [(5, 1), (8, 2), (13, 1)],
  term ((11097081716 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((5296609120 : Rat) / 110226591) [(5, 1), (8, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (8, 2), (13, 2), (15, 1)],
  term ((-350251627552 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (8, 2), (14, 1), (15, 3)],
  term ((-991328179694 : Rat) / 157072892175) [(5, 1), (8, 2), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-11284269440 : Rat) / 110226591) [(5, 1), (8, 2), (15, 3)],
  term ((-4012116182972 : Rat) / 157072892175) [(5, 1), (9, 2), (11, 1)],
  term ((-41791359232 : Rat) / 330679773) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((-101749760 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((710213229824 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (9, 2), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((7600001600 : Rat) / 110226591) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((-652989988 : Rat) / 12247399) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((37509172052 : Rat) / 330679773) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(5, 1), (9, 2), (12, 1), (15, 3)],
  term ((-42446488021 : Rat) / 11635029050) [(5, 1), (9, 2), (13, 1)],
  term ((11097081716 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((5296609120 : Rat) / 110226591) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (9, 2), (13, 2), (15, 1)],
  term ((-350251627552 : Rat) / 24800982975) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (9, 2), (14, 1), (15, 3)],
  term ((-991328179694 : Rat) / 157072892175) [(5, 1), (9, 2), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-11284269440 : Rat) / 110226591) [(5, 1), (9, 2), (15, 3)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (9, 4), (15, 1)],
  term ((8771824241152 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((411179261304 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-9579498314696 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((3442 : Rat) / 67) [(5, 2), (6, 1), (8, 1)],
  term ((-88204818688 : Rat) / 6282915687) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-1378200292 : Rat) / 232700581) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((153811535336 : Rat) / 6282915687) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2387058240 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((11687208048 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-50923909120 : Rat) / 110226591) [(5, 2), (6, 1), (8, 1), (11, 2)],
  term ((2359640640 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-39051204272 : Rat) / 110226591) [(5, 2), (6, 1), (8, 1), (15, 2)],
  term ((-4385912120576 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 2), (11, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(5, 2), (7, 1), (8, 2), (13, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 2), (15, 1)],
  term ((3442 : Rat) / 67) [(5, 2), (7, 1), (9, 1)],
  term ((-2387058240 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((11687208048 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-50923909120 : Rat) / 110226591) [(5, 2), (7, 1), (9, 1), (11, 2)],
  term ((2359640640 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-39051204272 : Rat) / 110226591) [(5, 2), (7, 1), (9, 1), (15, 2)],
  term ((-15362856828928 : Rat) / 157072892175) [(5, 2), (7, 1), (9, 2), (11, 1)],
  term ((-240044637952 : Rat) / 5817514525) [(5, 2), (7, 1), (9, 2), (13, 1)],
  term ((18214535855444 : Rat) / 157072892175) [(5, 2), (7, 1), (9, 2), (15, 1)],
  term ((8771824241152 : Rat) / 52357630725) [(5, 2), (7, 2), (9, 1), (11, 1)],
  term ((411179261304 : Rat) / 5817514525) [(5, 2), (7, 2), (9, 1), (13, 1)],
  term ((-9579498314696 : Rat) / 52357630725) [(5, 2), (7, 2), (9, 1), (15, 1)],
  term ((-1721 : Rat) / 67) [(5, 2), (8, 2)],
  term ((44102409344 : Rat) / 6282915687) [(5, 2), (8, 2), (9, 1), (11, 1)],
  term ((689100146 : Rat) / 232700581) [(5, 2), (8, 2), (9, 1), (13, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(5, 2), (8, 2), (9, 1), (15, 1)],
  term ((1193529120 : Rat) / 12247399) [(5, 2), (8, 2), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(5, 2), (8, 2), (11, 1), (15, 1)],
  term ((25461954560 : Rat) / 110226591) [(5, 2), (8, 2), (11, 2)],
  term ((-1179820320 : Rat) / 12247399) [(5, 2), (8, 2), (13, 1), (15, 1)],
  term ((19525602136 : Rat) / 110226591) [(5, 2), (8, 2), (15, 2)],
  term ((-1721 : Rat) / 67) [(5, 2), (9, 2)],
  term ((1193529120 : Rat) / 12247399) [(5, 2), (9, 2), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((25461954560 : Rat) / 110226591) [(5, 2), (9, 2), (11, 2)],
  term ((-1179820320 : Rat) / 12247399) [(5, 2), (9, 2), (13, 1), (15, 1)],
  term ((19525602136 : Rat) / 110226591) [(5, 2), (9, 2), (15, 2)],
  term ((44102409344 : Rat) / 6282915687) [(5, 2), (9, 3), (11, 1)],
  term ((689100146 : Rat) / 232700581) [(5, 2), (9, 3), (13, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(5, 2), (9, 3), (15, 1)],
  term ((-845 : Rat) / 67) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((397843040 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-323864637768 : Rat) / 5817514525) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(6, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(6, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(6, 1), (7, 1), (8, 1), (9, 2), (11, 1)],
  term ((689100146 : Rat) / 698101743) [(6, 1), (7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(6, 1), (7, 1), (8, 1), (9, 2), (15, 1)],
  term ((645102857728 : Rat) / 31414578435) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((10079732152 : Rat) / 1163502905) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1280998583492 : Rat) / 31414578435) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((536849152 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 36742197) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10663084544 : Rat) / 330679773) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 110226591) [(6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((226483236 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-470961512 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-20455172528 : Rat) / 1163502905) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-166610696 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-12098560 : Rat) / 36742197) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((9971174680 : Rat) / 330679773) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((1246510657186 : Rat) / 31414578435) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(6, 1), (7, 1), (8, 1), (15, 3)],
  term ((-4385912120576 : Rat) / 157072892175) [(6, 1), (7, 2), (8, 1), (9, 1), (11, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(6, 1), (7, 2), (8, 1), (9, 1), (13, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(6, 1), (7, 2), (8, 1), (9, 1), (15, 1)],
  term ((645102857728 : Rat) / 31414578435) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((10079732152 : Rat) / 1163502905) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1985094405808 : Rat) / 17452543575) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-9216252416 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-160240640 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1179467201024 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((7614624320 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-194969600 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-432011832 : Rat) / 12247399) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((8192632312 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-252388992573 : Rat) / 5817514525) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((18429175016 : Rat) / 918554925) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((5355524320 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((845 : Rat) / 134) [(7, 1), (8, 2), (9, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(7, 1), (8, 2), (9, 1), (11, 2)],
  term ((161932318884 : Rat) / 5817514525) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 1), (8, 2), (9, 1), (15, 2)],
  term ((2394874578674 : Rat) / 157072892175) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (8, 2), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 698101743) [(7, 1), (8, 2), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (8, 2), (9, 2), (15, 1)],
  term ((-322551428864 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((-5039866076 : Rat) / 1163502905) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((290872270672 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((640499291746 : Rat) / 31414578435) [(7, 1), (8, 2), (11, 1)],
  term ((-268424576 : Rat) / 12247399) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-9748480 : Rat) / 36742197) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((5331542272 : Rat) / 330679773) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-113241618 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((235480756 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((10227586264 : Rat) / 1163502905) [(7, 1), (8, 2), (13, 1)],
  term ((83305348 : Rat) / 12247399) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((6049280 : Rat) / 36742197) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-1370880 : Rat) / 12247399) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((-4985587340 : Rat) / 330679773) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-623255328593 : Rat) / 31414578435) [(7, 1), (8, 2), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(7, 1), (8, 2), (15, 3)],
  term ((322551428864 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (11, 1)],
  term ((5039866076 : Rat) / 1163502905) [(7, 1), (9, 2), (10, 1), (13, 1)],
  term ((-290872270672 : Rat) / 31414578435) [(7, 1), (9, 2), (10, 1), (15, 1)],
  term ((-14663353193542 : Rat) / 157072892175) [(7, 1), (9, 2), (11, 1)],
  term ((-11632073600 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((-189486080 : Rat) / 110226591) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((1579332871424 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(7, 1), (9, 2), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((843903040 : Rat) / 12247399) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((-545253450 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(7, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((10311959116 : Rat) / 110226591) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(7, 1), (9, 2), (12, 1), (15, 3)],
  term ((-201251061253 : Rat) / 5817514525) [(7, 1), (9, 2), (13, 1)],
  term ((24677076116 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(7, 1), (9, 2), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((5373672160 : Rat) / 110226591) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1370880 : Rat) / 12247399) [(7, 1), (9, 2), (13, 2), (15, 1)],
  term ((-4985587340 : Rat) / 330679773) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-623255328593 : Rat) / 31414578435) [(7, 1), (9, 2), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(7, 1), (9, 2), (15, 3)],
  term ((845 : Rat) / 134) [(7, 1), (9, 3)],
  term ((-198921520 : Rat) / 12247399) [(7, 1), (9, 3), (11, 1), (13, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 1), (9, 3), (11, 1), (15, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(7, 1), (9, 3), (11, 2)],
  term ((161932318884 : Rat) / 5817514525) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(7, 1), (9, 3), (14, 1)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 1), (9, 3), (15, 2)],
  term ((2394874578674 : Rat) / 157072892175) [(7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (9, 4), (11, 1)],
  term ((-344550073 : Rat) / 698101743) [(7, 1), (9, 4), (13, 1)],
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (9, 4), (15, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 2), (8, 2), (9, 1), (11, 1)],
  term ((34264938442 : Rat) / 5817514525) [(7, 2), (8, 2), (9, 1), (13, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 2), (8, 2), (9, 1), (15, 1)],
  term ((645102857728 : Rat) / 31414578435) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((10079732152 : Rat) / 1163502905) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1280998583492 : Rat) / 31414578435) [(7, 2), (9, 1), (11, 1)],
  term ((536849152 : Rat) / 12247399) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 36742197) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10663084544 : Rat) / 330679773) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 110226591) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((226483236 : Rat) / 12247399) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-470961512 : Rat) / 12247399) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-20455172528 : Rat) / 1163502905) [(7, 2), (9, 1), (13, 1)],
  term ((-166610696 : Rat) / 12247399) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-12098560 : Rat) / 36742197) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(7, 2), (9, 1), (13, 2), (15, 1)],
  term ((9971174680 : Rat) / 330679773) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((1246510657186 : Rat) / 31414578435) [(7, 2), (9, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(7, 2), (9, 1), (15, 3)],
  term ((-845 : Rat) / 67) [(7, 2), (9, 2)],
  term ((397843040 : Rat) / 12247399) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(7, 2), (9, 2), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(7, 2), (9, 2), (11, 2)],
  term ((-323864637768 : Rat) / 5817514525) [(7, 2), (9, 2), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(7, 2), (9, 2), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(7, 2), (9, 2), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(7, 2), (9, 3), (11, 1)],
  term ((120022318976 : Rat) / 17452543575) [(7, 2), (9, 3), (13, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(7, 2), (9, 3), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 3), (9, 2), (11, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 3), (9, 2), (13, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 3), (9, 2), (15, 1)],
  term ((-322551428864 : Rat) / 31414578435) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-5039866076 : Rat) / 1163502905) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((290872270672 : Rat) / 31414578435) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((992547202904 : Rat) / 17452543575) [(8, 2), (9, 1), (11, 1)],
  term ((4608126208 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((80120320 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-589733600512 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(8, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((103342925728 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3807312160 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((97484800 : Rat) / 110226591) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((216005916 : Rat) / 12247399) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4096316156 : Rat) / 110226591) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(8, 2), (9, 1), (12, 1), (15, 3)],
  term ((252388992573 : Rat) / 11635029050) [(8, 2), (9, 1), (13, 1)],
  term ((-9214587508 : Rat) / 918554925) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(8, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2677762160 : Rat) / 110226591) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-322551428864 : Rat) / 31414578435) [(9, 3), (10, 1), (11, 1)],
  term ((-5039866076 : Rat) / 1163502905) [(9, 3), (10, 1), (13, 1)],
  term ((290872270672 : Rat) / 31414578435) [(9, 3), (10, 1), (15, 1)],
  term ((992547202904 : Rat) / 17452543575) [(9, 3), (11, 1)],
  term ((4608126208 : Rat) / 110226591) [(9, 3), (11, 1), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(9, 3), (11, 1), (12, 1), (15, 2)],
  term ((80120320 : Rat) / 110226591) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((-589733600512 : Rat) / 24800982975) [(9, 3), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(9, 3), (11, 1), (14, 1), (15, 2)],
  term ((103342925728 : Rat) / 24800982975) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-3807312160 : Rat) / 110226591) [(9, 3), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(9, 3), (11, 1), (16, 1)],
  term ((97484800 : Rat) / 110226591) [(9, 3), (11, 2), (15, 1)],
  term ((216005916 : Rat) / 12247399) [(9, 3), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(9, 3), (12, 1), (13, 1), (15, 2)],
  term ((-4096316156 : Rat) / 110226591) [(9, 3), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(9, 3), (12, 1), (15, 3)],
  term ((252388992573 : Rat) / 11635029050) [(9, 3), (13, 1)],
  term ((-9214587508 : Rat) / 918554925) [(9, 3), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(9, 3), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-2677762160 : Rat) / 110226591) [(9, 3), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NNNYN_block_18_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_18_0100_0199
      rs_R009_ueqv_R009NNNYN_block_18_0100_0199 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
