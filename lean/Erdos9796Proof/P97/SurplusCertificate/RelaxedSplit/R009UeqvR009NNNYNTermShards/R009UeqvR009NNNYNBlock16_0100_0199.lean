/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 16:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0100 : Poly :=
[
  term ((8067298240 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 100 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0100 : Poly :=
[
  term ((16134596480 : Rat) / 330679773) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0100
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0101 : Poly :=
[
  term ((301998080 : Rat) / 110226591) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 101 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0101 : Poly :=
[
  term ((603996160 : Rat) / 110226591) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-301998080 : Rat) / 110226591) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0101
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0102 : Poly :=
[
  term ((-814724984 : Rat) / 36742197) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 102 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0102 : Poly :=
[
  term ((-1629449968 : Rat) / 36742197) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((814724984 : Rat) / 36742197) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0102
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0103 : Poly :=
[
  term ((127048698 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 103 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0103 : Poly :=
[
  term ((254097396 : Rat) / 12247399) [(0, 1), (6, 1), (13, 2)],
  term ((-127048698 : Rat) / 12247399) [(0, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0103
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0104 : Poly :=
[
  term ((-15697920 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 104 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0104 : Poly :=
[
  term ((-31395840 : Rat) / 12247399) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((15697920 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0104
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0105 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (11, 1)]
]

/-- Partial product 105 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0105 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (2, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0105
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0106 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (13, 1)]
]

/-- Partial product 106 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0106 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (2, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0106
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0107 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (15, 1)]
]

/-- Partial product 107 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0107 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (2, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0107
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0108 : Poly :=
[
  term ((-1717452800 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 108 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0108 : Poly :=
[
  term ((-3434905600 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((1717452800 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0108
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0109 : Poly :=
[
  term ((-1792134400 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1)]
]

/-- Partial product 109 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0109 : Poly :=
[
  term ((-3584268800 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1)],
  term ((1792134400 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0109
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0110 : Poly :=
[
  term ((-809768960 : Rat) / 110226591) [(1, 1), (2, 1), (11, 1), (14, 1)]
]

/-- Partial product 110 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0110 : Poly :=
[
  term ((-1619537920 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((809768960 : Rat) / 110226591) [(1, 1), (2, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0110
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0111 : Poly :=
[
  term ((-28002100 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 111 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0111 : Poly :=
[
  term ((-56004200 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1)],
  term ((28002100 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0111
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0112 : Poly :=
[
  term ((1616121200 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 112 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0112 : Poly :=
[
  term ((3232242400 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((-1616121200 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0112
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0113 : Poly :=
[
  term ((-26835200 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 113 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0113 : Poly :=
[
  term ((-53670400 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((26835200 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0113
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0114 : Poly :=
[
  term ((-37957920 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

/-- Partial product 114 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0114 : Poly :=
[
  term ((-75915840 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((37957920 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0114
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0115 : Poly :=
[
  term ((730238080 : Rat) / 110226591) [(1, 1), (2, 1), (14, 1), (15, 1)]
]

/-- Partial product 115 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0115 : Poly :=
[
  term ((1460476160 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-730238080 : Rat) / 110226591) [(1, 1), (2, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0115
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0116 : Poly :=
[
  term ((1548774400 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 116 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0116 : Poly :=
[
  term ((3097548800 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-1548774400 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0116
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0117 : Poly :=
[
  term ((-294 : Rat) / 67) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 117 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0117 : Poly :=
[
  term ((-588 : Rat) / 67) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((294 : Rat) / 67) [(1, 1), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0117
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0118 : Poly :=
[
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (4, 1), (10, 1), (11, 1)]
]

/-- Partial product 118 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0118 : Poly :=
[
  term ((2580411430912 : Rat) / 31414578435) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1)],
  term ((-1290205715456 : Rat) / 31414578435) [(1, 1), (4, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0118
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0119 : Poly :=
[
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (4, 1), (10, 1), (13, 1)]
]

/-- Partial product 119 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0119 : Poly :=
[
  term ((40318928608 : Rat) / 1163502905) [(1, 1), (4, 1), (6, 1), (10, 1), (13, 1)],
  term ((-20159464304 : Rat) / 1163502905) [(1, 1), (4, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0119
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0120 : Poly :=
[
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (4, 1), (10, 1), (15, 1)]
]

/-- Partial product 120 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0120 : Poly :=
[
  term ((-2326978165376 : Rat) / 31414578435) [(1, 1), (4, 1), (6, 1), (10, 1), (15, 1)],
  term ((1163489082688 : Rat) / 31414578435) [(1, 1), (4, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0120
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0121 : Poly :=
[
  term ((2512096726048 : Rat) / 94243735305) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 121 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0121 : Poly :=
[
  term ((5024193452096 : Rat) / 94243735305) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((-2512096726048 : Rat) / 94243735305) [(1, 1), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0121
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0122 : Poly :=
[
  term ((-9224029696 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 122 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0122 : Poly :=
[
  term ((-18448059392 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((9224029696 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0122
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0123 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 123 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0123 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0123
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0124 : Poly :=
[
  term ((-6490663424 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (14, 1)]
]

/-- Partial product 124 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0124 : Poly :=
[
  term ((-12981326848 : Rat) / 330679773) [(1, 1), (4, 1), (6, 1), (11, 1), (14, 1)],
  term ((6490663424 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0124
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0125 : Poly :=
[
  term ((185221120 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (15, 2)]
]

/-- Partial product 125 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0125 : Poly :=
[
  term ((370442240 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (11, 1), (15, 2)],
  term ((-185221120 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0125
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0126 : Poly :=
[
  term ((-432376392 : Rat) / 12247399) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 126 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0126 : Poly :=
[
  term ((-864752784 : Rat) / 12247399) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((432376392 : Rat) / 12247399) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0126
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0127 : Poly :=
[
  term ((8081193296 : Rat) / 110226591) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 127 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0127 : Poly :=
[
  term ((16162386592 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((-8081193296 : Rat) / 110226591) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0127_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0127
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0128 : Poly :=
[
  term ((78503022689 : Rat) / 6981017430) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 128 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0128 : Poly :=
[
  term ((78503022689 : Rat) / 3490508715) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((-78503022689 : Rat) / 6981017430) [(1, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0128_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0128
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0129 : Poly :=
[
  term ((-101416616 : Rat) / 12247399) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 129 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0129 : Poly :=
[
  term ((-202833232 : Rat) / 12247399) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((101416616 : Rat) / 12247399) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0129_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0129
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0130 : Poly :=
[
  term ((1806080 : Rat) / 2079747) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

/-- Partial product 130 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0130 : Poly :=
[
  term ((3612160 : Rat) / 2079747) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1806080 : Rat) / 2079747) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0130_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0130
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0131 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(1, 1), (4, 1), (13, 2), (15, 1)]
]

/-- Partial product 131 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0131 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(1, 1), (4, 1), (6, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (4, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0131_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0131
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0132 : Poly :=
[
  term ((5853187552 : Rat) / 330679773) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 132 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0132 : Poly :=
[
  term ((11706375104 : Rat) / 330679773) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5853187552 : Rat) / 330679773) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0132_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0132
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0133 : Poly :=
[
  term ((-2403221986124 : Rat) / 94243735305) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 133 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0133 : Poly :=
[
  term ((-4806443972248 : Rat) / 94243735305) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((2403221986124 : Rat) / 94243735305) [(1, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0133_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0133
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0134 : Poly :=
[
  term ((-167029760 : Rat) / 110226591) [(1, 1), (4, 1), (15, 3)]
]

/-- Partial product 134 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0134 : Poly :=
[
  term ((-334059520 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (15, 3)],
  term ((167029760 : Rat) / 110226591) [(1, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0134_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0134
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0135 : Poly :=
[
  term ((17016832 : Rat) / 182797) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 135 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0135 : Poly :=
[
  term ((34033664 : Rat) / 182797) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0135_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0135
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0136 : Poly :=
[
  term ((-975505376 : Rat) / 12247399) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 136 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0136 : Poly :=
[
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0136_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0136
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0137 : Poly :=
[
  term ((7178976 : Rat) / 182797) [(1, 1), (5, 1), (13, 2)]
]

/-- Partial product 137 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0137 : Poly :=
[
  term ((14357952 : Rat) / 182797) [(1, 1), (5, 1), (6, 1), (13, 2)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0137_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0137
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0138 : Poly :=
[
  term ((294 : Rat) / 67) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 138 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0138 : Poly :=
[
  term ((-294 : Rat) / 67) [(1, 1), (6, 1), (9, 1)],
  term ((588 : Rat) / 67) [(1, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0138_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0138
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0139 : Poly :=
[
  term ((227029927264 : Rat) / 18848747061) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 139 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0139 : Poly :=
[
  term ((-227029927264 : Rat) / 18848747061) [(1, 1), (6, 1), (11, 1)],
  term ((454059854528 : Rat) / 18848747061) [(1, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0139_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0139
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0140 : Poly :=
[
  term ((791983360 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 140 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0140 : Poly :=
[
  term ((-791983360 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((1583966720 : Rat) / 330679773) [(1, 1), (6, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0140_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0140
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0141 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 141 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0141 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0141_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0141
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0142 : Poly :=
[
  term ((-317623040 : Rat) / 36742197) [(1, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 142 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0142 : Poly :=
[
  term ((317623040 : Rat) / 36742197) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-635246080 : Rat) / 36742197) [(1, 1), (6, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0142_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0142
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0143 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(1, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 143 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0143 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (6, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0143_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0143
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0144 : Poly :=
[
  term ((12374740 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 144 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0144 : Poly :=
[
  term ((-12374740 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((24749480 : Rat) / 12247399) [(1, 1), (6, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0144_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0144
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0145 : Poly :=
[
  term ((-714199280 : Rat) / 330679773) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 145 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0145 : Poly :=
[
  term ((714199280 : Rat) / 330679773) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-1428398560 : Rat) / 330679773) [(1, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0145_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0145
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0146 : Poly :=
[
  term ((7094685227 : Rat) / 1396203486) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 146 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0146 : Poly :=
[
  term ((-7094685227 : Rat) / 1396203486) [(1, 1), (6, 1), (13, 1)],
  term ((7094685227 : Rat) / 698101743) [(1, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0146_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0146
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0147 : Poly :=
[
  term ((-44665740 : Rat) / 12247399) [(1, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 147 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0147 : Poly :=
[
  term ((44665740 : Rat) / 12247399) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-89331480 : Rat) / 12247399) [(1, 1), (6, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0147_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0147
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0148 : Poly :=
[
  term ((-29920000 : Rat) / 110226591) [(1, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 148 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0148 : Poly :=
[
  term ((29920000 : Rat) / 110226591) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (6, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0148_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0148
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0149 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(1, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 149 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0149 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (6, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0149_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0149
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0150 : Poly :=
[
  term ((286427920 : Rat) / 36742197) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 150 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0150 : Poly :=
[
  term ((-286427920 : Rat) / 36742197) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((572855840 : Rat) / 36742197) [(1, 1), (6, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0150_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0150
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0151 : Poly :=
[
  term ((-177162535988 : Rat) / 18848747061) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 151 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0151 : Poly :=
[
  term ((177162535988 : Rat) / 18848747061) [(1, 1), (6, 1), (15, 1)],
  term ((-354325071976 : Rat) / 18848747061) [(1, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0151_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0151
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0152 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(1, 1), (6, 1), (15, 3)]
]

/-- Partial product 152 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0152 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(1, 1), (6, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (6, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0152_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0152
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0153 : Poly :=
[
  term ((174 : Rat) / 67) [(1, 1), (9, 1)]
]

/-- Partial product 153 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0153 : Poly :=
[
  term ((348 : Rat) / 67) [(1, 1), (6, 1), (9, 1)],
  term ((-174 : Rat) / 67) [(1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0153_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0153
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0154 : Poly :=
[
  term ((-8508416 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 154 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0154 : Poly :=
[
  term ((-17016832 : Rat) / 182797) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((8508416 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0154_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0154
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0155 : Poly :=
[
  term ((487752688 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 155 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0155 : Poly :=
[
  term ((975505376 : Rat) / 12247399) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-487752688 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0155_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0155
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0156 : Poly :=
[
  term ((-3589488 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 156 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0156 : Poly :=
[
  term ((-7178976 : Rat) / 182797) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((3589488 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0156_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0156
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0157 : Poly :=
[
  term ((645102857728 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 157 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0157 : Poly :=
[
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-645102857728 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0157_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0157
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0158 : Poly :=
[
  term ((10079732152 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 158 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0158 : Poly :=
[
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-10079732152 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0158_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0158
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0159 : Poly :=
[
  term ((-581744541344 : Rat) / 31414578435) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 159 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0159 : Poly :=
[
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((581744541344 : Rat) / 31414578435) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0159_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0159
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0160 : Poly :=
[
  term ((-2515506219388 : Rat) / 94243735305) [(1, 1), (11, 1)]
]

/-- Partial product 160 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0160 : Poly :=
[
  term ((-5031012438776 : Rat) / 94243735305) [(1, 1), (6, 1), (11, 1)],
  term ((2515506219388 : Rat) / 94243735305) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0160_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0160
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0161 : Poly :=
[
  term ((6763885184 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 161 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0161 : Poly :=
[
  term ((13527770368 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-6763885184 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0161_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0161
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0162 : Poly :=
[
  term ((9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 162 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0162 : Poly :=
[
  term ((19901163520 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0162_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0162
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0163 : Poly :=
[
  term ((-576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2)]
]

/-- Partial product 163 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0163 : Poly :=
[
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0163_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0163
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0164 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 164 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0164 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0164_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0164
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0165 : Poly :=
[
  term ((-27104896 : Rat) / 4935519) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 165 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0165 : Poly :=
[
  term ((-54209792 : Rat) / 4935519) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((27104896 : Rat) / 4935519) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0165_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0165
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0166 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 166 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0166 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((-9748480 : Rat) / 110226591) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0166_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0166
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0167 : Poly :=
[
  term ((105685706 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 167 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0167 : Poly :=
[
  term ((211371412 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-105685706 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0167_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0167
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0168 : Poly :=
[
  term ((155477840 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 168 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0168 : Poly :=
[
  term ((310955680 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-155477840 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0168_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0168
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0169 : Poly :=
[
  term ((-8973292480 : Rat) / 330679773) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 169 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0169 : Poly :=
[
  term ((-17946584960 : Rat) / 330679773) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((8973292480 : Rat) / 330679773) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0169_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0169
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0170 : Poly :=
[
  term ((-85734592 : Rat) / 4935519) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 170 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0170 : Poly :=
[
  term ((-171469184 : Rat) / 4935519) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((85734592 : Rat) / 4935519) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0170_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0170
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0171 : Poly :=
[
  term ((-9013760 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 171 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0171 : Poly :=
[
  term ((-18027520 : Rat) / 12247399) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0171_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0171
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0172 : Poly :=
[
  term ((520222720 : Rat) / 330679773) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 172 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0172 : Poly :=
[
  term ((1040445440 : Rat) / 330679773) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0172_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0172
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0173 : Poly :=
[
  term ((-162493974643 : Rat) / 13962034860) [(1, 1), (13, 1)]
]

/-- Partial product 173 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0173 : Poly :=
[
  term ((-162493974643 : Rat) / 6981017430) [(1, 1), (6, 1), (13, 1)],
  term ((162493974643 : Rat) / 13962034860) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0173_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0173
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0174 : Poly :=
[
  term ((-423514 : Rat) / 182797) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 174 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0174 : Poly :=
[
  term ((-847028 : Rat) / 182797) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((423514 : Rat) / 182797) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0174_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0174
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0175 : Poly :=
[
  term ((-13469440 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 175 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0175 : Poly :=
[
  term ((-26938880 : Rat) / 110226591) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((13469440 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0175_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0175
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0176 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 176 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0176 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0176_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0176
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0177 : Poly :=
[
  term ((24442808 : Rat) / 4935519) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 177 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0177 : Poly :=
[
  term ((48885616 : Rat) / 4935519) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-24442808 : Rat) / 4935519) [(1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0177_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0177
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0178 : Poly :=
[
  term ((2482404965519 : Rat) / 94243735305) [(1, 1), (15, 1)]
]

/-- Partial product 178 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0178 : Poly :=
[
  term ((4964809931038 : Rat) / 94243735305) [(1, 1), (6, 1), (15, 1)],
  term ((-2482404965519 : Rat) / 94243735305) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0178_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0178
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0179 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(1, 1), (15, 3)]
]

/-- Partial product 179 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0179 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(1, 1), (6, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0179_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0179
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0180 : Poly :=
[
  term ((-317542400 : Rat) / 110226591) [(2, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 180 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0180 : Poly :=
[
  term ((-635084800 : Rat) / 110226591) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((317542400 : Rat) / 110226591) [(2, 1), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0180_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0180
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0181 : Poly :=
[
  term ((-14884800 : Rat) / 12247399) [(2, 1), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 181 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0181 : Poly :=
[
  term ((-29769600 : Rat) / 12247399) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((14884800 : Rat) / 12247399) [(2, 1), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0181_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0181
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0182 : Poly :=
[
  term ((286355200 : Rat) / 110226591) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 182 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0182 : Poly :=
[
  term ((572710400 : Rat) / 110226591) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0182_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0182
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0183 : Poly :=
[
  term ((-511114240 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1)]
]

/-- Partial product 183 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0183 : Poly :=
[
  term ((-1022228480 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (7, 1), (11, 1)],
  term ((511114240 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0183_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0183
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0184 : Poly :=
[
  term ((-7986160 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1)]
]

/-- Partial product 184 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0184 : Poly :=
[
  term ((-15972320 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((7986160 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0184_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0184
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0185 : Poly :=
[
  term ((460915520 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 185 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0185 : Poly :=
[
  term ((921831040 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-460915520 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0185_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0185
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0186 : Poly :=
[
  term ((-1902064640 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1)]
]

/-- Partial product 186 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0186 : Poly :=
[
  term ((-3804129280 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((1902064640 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0186_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0186
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0187 : Poly :=
[
  term ((-29719760 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1)]
]

/-- Partial product 187 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0187 : Poly :=
[
  term ((-59439520 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((29719760 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0187_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0187
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0188 : Poly :=
[
  term ((1715254720 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 188 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0188 : Poly :=
[
  term ((3430509440 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1715254720 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0188_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0188
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0189 : Poly :=
[
  term ((1745121280 : Rat) / 330679773) [(2, 1), (4, 1), (11, 1), (13, 1)]
]

/-- Partial product 189 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0189 : Poly :=
[
  term ((3490242560 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1745121280 : Rat) / 330679773) [(2, 1), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0189_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0189
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0190 : Poly :=
[
  term ((14336000 : Rat) / 12247399) [(2, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 190 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0190 : Poly :=
[
  term ((28672000 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-14336000 : Rat) / 12247399) [(2, 1), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0190_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0190
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0191 : Poly :=
[
  term ((-1410429440 : Rat) / 330679773) [(2, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 191 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0191 : Poly :=
[
  term ((-2820858880 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((1410429440 : Rat) / 330679773) [(2, 1), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0191_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0191
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0192 : Poly :=
[
  term ((27267520 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2)]
]

/-- Partial product 192 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0192 : Poly :=
[
  term ((54535040 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (13, 2)],
  term ((-27267520 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0192_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0192
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0193 : Poly :=
[
  term ((-12928000 : Rat) / 12247399) [(2, 1), (4, 1), (15, 2)]
]

/-- Partial product 193 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0193 : Poly :=
[
  term ((-25856000 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((12928000 : Rat) / 12247399) [(2, 1), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0193_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0193
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0194 : Poly :=
[
  term ((511114240 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1)]
]

/-- Partial product 194 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0194 : Poly :=
[
  term ((-511114240 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((1022228480 : Rat) / 330679773) [(2, 1), (5, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0194_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0194
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0195 : Poly :=
[
  term ((7986160 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 195 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0195 : Poly :=
[
  term ((-7986160 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((15972320 : Rat) / 12247399) [(2, 1), (5, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0195_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0195
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0196 : Poly :=
[
  term ((-460915520 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 196 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0196 : Poly :=
[
  term ((460915520 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-921831040 : Rat) / 330679773) [(2, 1), (5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0196_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0196
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0197 : Poly :=
[
  term ((2156358400 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 197 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0197 : Poly :=
[
  term ((4312716800 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((-2156358400 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0197_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0197
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0198 : Poly :=
[
  term ((-1073730560 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 198 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0198 : Poly :=
[
  term ((-2147461120 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((1073730560 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0198_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0198
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0199 : Poly :=
[
  term ((1619537920 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 199 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0199 : Poly :=
[
  term ((3239075840 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-1619537920 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0199_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0199
        rs_R009_ueqv_R009NNNYN_generator_16_0100_0199 =
      rs_R009_ueqv_R009NNNYN_partial_16_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_16_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_16_0100,
  rs_R009_ueqv_R009NNNYN_partial_16_0101,
  rs_R009_ueqv_R009NNNYN_partial_16_0102,
  rs_R009_ueqv_R009NNNYN_partial_16_0103,
  rs_R009_ueqv_R009NNNYN_partial_16_0104,
  rs_R009_ueqv_R009NNNYN_partial_16_0105,
  rs_R009_ueqv_R009NNNYN_partial_16_0106,
  rs_R009_ueqv_R009NNNYN_partial_16_0107,
  rs_R009_ueqv_R009NNNYN_partial_16_0108,
  rs_R009_ueqv_R009NNNYN_partial_16_0109,
  rs_R009_ueqv_R009NNNYN_partial_16_0110,
  rs_R009_ueqv_R009NNNYN_partial_16_0111,
  rs_R009_ueqv_R009NNNYN_partial_16_0112,
  rs_R009_ueqv_R009NNNYN_partial_16_0113,
  rs_R009_ueqv_R009NNNYN_partial_16_0114,
  rs_R009_ueqv_R009NNNYN_partial_16_0115,
  rs_R009_ueqv_R009NNNYN_partial_16_0116,
  rs_R009_ueqv_R009NNNYN_partial_16_0117,
  rs_R009_ueqv_R009NNNYN_partial_16_0118,
  rs_R009_ueqv_R009NNNYN_partial_16_0119,
  rs_R009_ueqv_R009NNNYN_partial_16_0120,
  rs_R009_ueqv_R009NNNYN_partial_16_0121,
  rs_R009_ueqv_R009NNNYN_partial_16_0122,
  rs_R009_ueqv_R009NNNYN_partial_16_0123,
  rs_R009_ueqv_R009NNNYN_partial_16_0124,
  rs_R009_ueqv_R009NNNYN_partial_16_0125,
  rs_R009_ueqv_R009NNNYN_partial_16_0126,
  rs_R009_ueqv_R009NNNYN_partial_16_0127,
  rs_R009_ueqv_R009NNNYN_partial_16_0128,
  rs_R009_ueqv_R009NNNYN_partial_16_0129,
  rs_R009_ueqv_R009NNNYN_partial_16_0130,
  rs_R009_ueqv_R009NNNYN_partial_16_0131,
  rs_R009_ueqv_R009NNNYN_partial_16_0132,
  rs_R009_ueqv_R009NNNYN_partial_16_0133,
  rs_R009_ueqv_R009NNNYN_partial_16_0134,
  rs_R009_ueqv_R009NNNYN_partial_16_0135,
  rs_R009_ueqv_R009NNNYN_partial_16_0136,
  rs_R009_ueqv_R009NNNYN_partial_16_0137,
  rs_R009_ueqv_R009NNNYN_partial_16_0138,
  rs_R009_ueqv_R009NNNYN_partial_16_0139,
  rs_R009_ueqv_R009NNNYN_partial_16_0140,
  rs_R009_ueqv_R009NNNYN_partial_16_0141,
  rs_R009_ueqv_R009NNNYN_partial_16_0142,
  rs_R009_ueqv_R009NNNYN_partial_16_0143,
  rs_R009_ueqv_R009NNNYN_partial_16_0144,
  rs_R009_ueqv_R009NNNYN_partial_16_0145,
  rs_R009_ueqv_R009NNNYN_partial_16_0146,
  rs_R009_ueqv_R009NNNYN_partial_16_0147,
  rs_R009_ueqv_R009NNNYN_partial_16_0148,
  rs_R009_ueqv_R009NNNYN_partial_16_0149,
  rs_R009_ueqv_R009NNNYN_partial_16_0150,
  rs_R009_ueqv_R009NNNYN_partial_16_0151,
  rs_R009_ueqv_R009NNNYN_partial_16_0152,
  rs_R009_ueqv_R009NNNYN_partial_16_0153,
  rs_R009_ueqv_R009NNNYN_partial_16_0154,
  rs_R009_ueqv_R009NNNYN_partial_16_0155,
  rs_R009_ueqv_R009NNNYN_partial_16_0156,
  rs_R009_ueqv_R009NNNYN_partial_16_0157,
  rs_R009_ueqv_R009NNNYN_partial_16_0158,
  rs_R009_ueqv_R009NNNYN_partial_16_0159,
  rs_R009_ueqv_R009NNNYN_partial_16_0160,
  rs_R009_ueqv_R009NNNYN_partial_16_0161,
  rs_R009_ueqv_R009NNNYN_partial_16_0162,
  rs_R009_ueqv_R009NNNYN_partial_16_0163,
  rs_R009_ueqv_R009NNNYN_partial_16_0164,
  rs_R009_ueqv_R009NNNYN_partial_16_0165,
  rs_R009_ueqv_R009NNNYN_partial_16_0166,
  rs_R009_ueqv_R009NNNYN_partial_16_0167,
  rs_R009_ueqv_R009NNNYN_partial_16_0168,
  rs_R009_ueqv_R009NNNYN_partial_16_0169,
  rs_R009_ueqv_R009NNNYN_partial_16_0170,
  rs_R009_ueqv_R009NNNYN_partial_16_0171,
  rs_R009_ueqv_R009NNNYN_partial_16_0172,
  rs_R009_ueqv_R009NNNYN_partial_16_0173,
  rs_R009_ueqv_R009NNNYN_partial_16_0174,
  rs_R009_ueqv_R009NNNYN_partial_16_0175,
  rs_R009_ueqv_R009NNNYN_partial_16_0176,
  rs_R009_ueqv_R009NNNYN_partial_16_0177,
  rs_R009_ueqv_R009NNNYN_partial_16_0178,
  rs_R009_ueqv_R009NNNYN_partial_16_0179,
  rs_R009_ueqv_R009NNNYN_partial_16_0180,
  rs_R009_ueqv_R009NNNYN_partial_16_0181,
  rs_R009_ueqv_R009NNNYN_partial_16_0182,
  rs_R009_ueqv_R009NNNYN_partial_16_0183,
  rs_R009_ueqv_R009NNNYN_partial_16_0184,
  rs_R009_ueqv_R009NNNYN_partial_16_0185,
  rs_R009_ueqv_R009NNNYN_partial_16_0186,
  rs_R009_ueqv_R009NNNYN_partial_16_0187,
  rs_R009_ueqv_R009NNNYN_partial_16_0188,
  rs_R009_ueqv_R009NNNYN_partial_16_0189,
  rs_R009_ueqv_R009NNNYN_partial_16_0190,
  rs_R009_ueqv_R009NNNYN_partial_16_0191,
  rs_R009_ueqv_R009NNNYN_partial_16_0192,
  rs_R009_ueqv_R009NNNYN_partial_16_0193,
  rs_R009_ueqv_R009NNNYN_partial_16_0194,
  rs_R009_ueqv_R009NNNYN_partial_16_0195,
  rs_R009_ueqv_R009NNNYN_partial_16_0196,
  rs_R009_ueqv_R009NNNYN_partial_16_0197,
  rs_R009_ueqv_R009NNNYN_partial_16_0198,
  rs_R009_ueqv_R009NNNYN_partial_16_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_16_0100_0199 : Poly :=
[
  term ((16134596480 : Rat) / 330679773) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((603996160 : Rat) / 110226591) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1629449968 : Rat) / 36742197) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((254097396 : Rat) / 12247399) [(0, 1), (6, 1), (13, 2)],
  term ((-31395840 : Rat) / 12247399) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)],
  term ((-301998080 : Rat) / 110226591) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((814724984 : Rat) / 36742197) [(0, 1), (13, 1), (15, 1)],
  term ((-127048698 : Rat) / 12247399) [(0, 1), (13, 2)],
  term ((15697920 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)],
  term ((-3376414720 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-3584268800 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1)],
  term ((-1619537920 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((-56004200 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1)],
  term ((3232242400 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((-52756480 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-75915840 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((1460476160 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((3044802560 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((1717452800 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)],
  term ((1792134400 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((809768960 : Rat) / 110226591) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((28002100 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1)],
  term ((-1616121200 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((26835200 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)],
  term ((37957920 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-730238080 : Rat) / 110226591) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-1548774400 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)],
  term ((-588 : Rat) / 67) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((2580411430912 : Rat) / 31414578435) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1)],
  term ((40318928608 : Rat) / 1163502905) [(1, 1), (4, 1), (6, 1), (10, 1), (13, 1)],
  term ((-2326978165376 : Rat) / 31414578435) [(1, 1), (4, 1), (6, 1), (10, 1), (15, 1)],
  term ((5024193452096 : Rat) / 94243735305) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((-18448059392 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12981326848 : Rat) / 330679773) [(1, 1), (4, 1), (6, 1), (11, 1), (14, 1)],
  term ((370442240 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (11, 1), (15, 2)],
  term ((-864752784 : Rat) / 12247399) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((16162386592 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((78503022689 : Rat) / 3490508715) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((-202833232 : Rat) / 12247399) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((3612160 : Rat) / 2079747) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (4, 1), (6, 1), (13, 2), (15, 1)],
  term ((11706375104 : Rat) / 330679773) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-4806443972248 : Rat) / 94243735305) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((-334059520 : Rat) / 110226591) [(1, 1), (4, 1), (6, 1), (15, 3)],
  term ((294 : Rat) / 67) [(1, 1), (4, 1), (9, 1)],
  term ((-1290205715456 : Rat) / 31414578435) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-20159464304 : Rat) / 1163502905) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((1163489082688 : Rat) / 31414578435) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((-2512096726048 : Rat) / 94243735305) [(1, 1), (4, 1), (11, 1)],
  term ((9224029696 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((6490663424 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (14, 1)],
  term ((-185221120 : Rat) / 110226591) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((432376392 : Rat) / 12247399) [(1, 1), (4, 1), (12, 1), (13, 1)],
  term ((-8081193296 : Rat) / 110226591) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-78503022689 : Rat) / 6981017430) [(1, 1), (4, 1), (13, 1)],
  term ((101416616 : Rat) / 12247399) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term ((-1806080 : Rat) / 2079747) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-5853187552 : Rat) / 330679773) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((2403221986124 : Rat) / 94243735305) [(1, 1), (4, 1), (15, 1)],
  term ((167029760 : Rat) / 110226591) [(1, 1), (4, 1), (15, 3)],
  term ((34033664 : Rat) / 182797) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((14357952 : Rat) / 182797) [(1, 1), (5, 1), (6, 1), (13, 2)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (5, 1), (13, 2)],
  term ((54 : Rat) / 67) [(1, 1), (6, 1), (9, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-6166162075096 : Rat) / 94243735305) [(1, 1), (6, 1), (11, 1)],
  term ((4245262336 : Rat) / 110226591) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((19901163520 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-773448704 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((48742400 : Rat) / 110226591) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((198996672 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((310955680 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-17946584960 : Rat) / 330679773) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3591412016 : Rat) / 110226591) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-98983700389 : Rat) / 3490508715) [(1, 1), (6, 1), (13, 1)],
  term ((-12085136 : Rat) / 12247399) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((2981120 : Rat) / 110226591) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((697484992 : Rat) / 330679773) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((5850622610978 : Rat) / 94243735305) [(1, 1), (6, 1), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(1, 1), (6, 1), (15, 3)],
  term ((588 : Rat) / 67) [(1, 1), (6, 2), (9, 1)],
  term ((454059854528 : Rat) / 18848747061) [(1, 1), (6, 2), (11, 1)],
  term ((1583966720 : Rat) / 330679773) [(1, 1), (6, 2), (11, 1), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((-635246080 : Rat) / 36742197) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (6, 2), (11, 1), (15, 2)],
  term ((24749480 : Rat) / 12247399) [(1, 1), (6, 2), (12, 1), (13, 1)],
  term ((-1428398560 : Rat) / 330679773) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((7094685227 : Rat) / 698101743) [(1, 1), (6, 2), (13, 1)],
  term ((-89331480 : Rat) / 12247399) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (6, 2), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (6, 2), (13, 2), (15, 1)],
  term ((572855840 : Rat) / 36742197) [(1, 1), (6, 2), (14, 1), (15, 1)],
  term ((-354325071976 : Rat) / 18848747061) [(1, 1), (6, 2), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (6, 2), (15, 3)],
  term ((-174 : Rat) / 67) [(1, 1), (9, 1)],
  term ((8508416 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-487752688 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((3589488 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)],
  term ((-645102857728 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1)],
  term ((-10079732152 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)],
  term ((581744541344 : Rat) / 31414578435) [(1, 1), (10, 1), (15, 1)],
  term ((2515506219388 : Rat) / 94243735305) [(1, 1), (11, 1)],
  term ((-6763885184 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)],
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2)],
  term ((-19496960 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((27104896 : Rat) / 4935519) [(1, 1), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 110226591) [(1, 1), (11, 1), (15, 2)],
  term ((-105685706 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)],
  term ((-155477840 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((8973292480 : Rat) / 330679773) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((85734592 : Rat) / 4935519) [(1, 1), (12, 1), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (12, 2), (15, 1)],
  term ((162493974643 : Rat) / 13962034860) [(1, 1), (13, 1)],
  term ((423514 : Rat) / 182797) [(1, 1), (13, 1), (14, 1)],
  term ((13469440 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)],
  term ((-24442808 : Rat) / 4935519) [(1, 1), (14, 1), (15, 1)],
  term ((-2482404965519 : Rat) / 94243735305) [(1, 1), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(1, 1), (15, 3)],
  term ((-635084800 : Rat) / 110226591) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-29769600 : Rat) / 12247399) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((572710400 : Rat) / 110226591) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((317542400 : Rat) / 110226591) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((14884800 : Rat) / 12247399) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-286355200 : Rat) / 110226591) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-1022228480 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-15972320 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((921831040 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-3804129280 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-59439520 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((3430509440 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((3490242560 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((28672000 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2820858880 : Rat) / 330679773) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((54535040 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (13, 2)],
  term ((-25856000 : Rat) / 12247399) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((511114240 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((7986160 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-460915520 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((1902064640 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((29719760 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-1715254720 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-1745121280 : Rat) / 330679773) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-14336000 : Rat) / 12247399) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((1410429440 : Rat) / 330679773) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-27267520 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2)],
  term ((12928000 : Rat) / 12247399) [(2, 1), (4, 1), (15, 2)],
  term ((3801602560 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((-2147461120 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((3239075840 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-7986160 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((460915520 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((1022228480 : Rat) / 330679773) [(2, 1), (5, 1), (6, 2), (11, 1)],
  term ((15972320 : Rat) / 12247399) [(2, 1), (5, 1), (6, 2), (13, 1)],
  term ((-921831040 : Rat) / 330679773) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((-2156358400 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)],
  term ((1073730560 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-1619537920 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NNNYN_block_16_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_16_0100_0199
      rs_R009_ueqv_R009NNNYN_block_16_0100_0199 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
