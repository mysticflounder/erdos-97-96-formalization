/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 4:100-126

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0100 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 100 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0100 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0100
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0101 : Poly :=
[
  term ((36239329 : Rat) / 12247399) [(9, 1), (13, 1)]
]

/-- Partial product 101 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0101 : Poly :=
[
  term ((-72478658 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1)],
  term ((36239329 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1)],
  term ((36239329 : Rat) / 12247399) [(5, 2), (9, 1), (13, 1)],
  term ((72478658 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)],
  term ((-36239329 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1)],
  term ((-36239329 : Rat) / 12247399) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0101
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0102 : Poly :=
[
  term ((17026660 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 102 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0102 : Poly :=
[
  term ((-34053320 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((17026660 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((17026660 : Rat) / 12247399) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((34053320 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-17026660 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-17026660 : Rat) / 12247399) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0102
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0103 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 103 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0103 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0103
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0104 : Poly :=
[
  term ((-1338038888 : Rat) / 330679773) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 104 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0104 : Poly :=
[
  term ((2676077776 : Rat) / 330679773) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1338038888 : Rat) / 330679773) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1338038888 : Rat) / 330679773) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-2676077776 : Rat) / 330679773) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1338038888 : Rat) / 330679773) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((1338038888 : Rat) / 330679773) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0104
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0105 : Poly :=
[
  term ((-2002687646 : Rat) / 330679773) [(9, 1), (15, 1)]
]

/-- Partial product 105 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0105 : Poly :=
[
  term ((4005375292 : Rat) / 330679773) [(4, 1), (9, 1), (15, 1)],
  term ((-2002687646 : Rat) / 330679773) [(4, 2), (9, 1), (15, 1)],
  term ((-2002687646 : Rat) / 330679773) [(5, 2), (9, 1), (15, 1)],
  term ((-4005375292 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)],
  term ((2002687646 : Rat) / 330679773) [(9, 1), (12, 2), (15, 1)],
  term ((2002687646 : Rat) / 330679773) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0105
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0106 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(9, 1), (15, 3)]
]

/-- Partial product 106 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0106 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(4, 1), (9, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(4, 2), (9, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(5, 2), (9, 1), (15, 3)],
  term ((35164160 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (12, 2), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0106
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0107 : Poly :=
[
  term ((-72 : Rat) / 67) [(9, 2)]
]

/-- Partial product 107 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0107 : Poly :=
[
  term ((144 : Rat) / 67) [(4, 1), (9, 2)],
  term ((-72 : Rat) / 67) [(4, 2), (9, 2)],
  term ((-72 : Rat) / 67) [(5, 2), (9, 2)],
  term ((-144 : Rat) / 67) [(9, 2), (12, 1)],
  term ((72 : Rat) / 67) [(9, 2), (12, 2)],
  term ((72 : Rat) / 67) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0107
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0108 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 108 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0108 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0108
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0109 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 109 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0109 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0109
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0110 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(10, 1), (15, 2)]
]

/-- Partial product 110 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0110 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(4, 1), (10, 1), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(4, 2), (10, 1), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(5, 2), (10, 1), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(10, 1), (12, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (12, 2), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0110
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0111 : Poly :=
[
  term ((-636805120 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 111 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0111 : Poly :=
[
  term ((1273610240 : Rat) / 330679773) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-636805120 : Rat) / 330679773) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-636805120 : Rat) / 330679773) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((636805120 : Rat) / 330679773) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1273610240 : Rat) / 330679773) [(11, 1), (12, 2), (15, 1)],
  term ((636805120 : Rat) / 330679773) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0111
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0112 : Poly :=
[
  term ((-99541120 : Rat) / 110226591) [(11, 1), (13, 1)]
]

/-- Partial product 112 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0112 : Poly :=
[
  term ((199082240 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1)],
  term ((-99541120 : Rat) / 110226591) [(4, 2), (11, 1), (13, 1)],
  term ((-99541120 : Rat) / 110226591) [(5, 2), (11, 1), (13, 1)],
  term ((-199082240 : Rat) / 110226591) [(11, 1), (12, 1), (13, 1)],
  term ((99541120 : Rat) / 110226591) [(11, 1), (12, 2), (13, 1)],
  term ((99541120 : Rat) / 110226591) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0112
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0113 : Poly :=
[
  term ((661480960 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 113 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0113 : Poly :=
[
  term ((-1322961920 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((661480960 : Rat) / 330679773) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((661480960 : Rat) / 330679773) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((1322961920 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-661480960 : Rat) / 330679773) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-661480960 : Rat) / 330679773) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0113
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0114 : Poly :=
[
  term ((-41605120 : Rat) / 36742197) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 114 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0114 : Poly :=
[
  term ((83210240 : Rat) / 36742197) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-41605120 : Rat) / 36742197) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-41605120 : Rat) / 36742197) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-83210240 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((41605120 : Rat) / 36742197) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((41605120 : Rat) / 36742197) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0114
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0115 : Poly :=
[
  term ((1530117760 : Rat) / 110226591) [(11, 1), (15, 1)]
]

/-- Partial product 115 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0115 : Poly :=
[
  term ((-3060235520 : Rat) / 110226591) [(4, 1), (11, 1), (15, 1)],
  term ((1530117760 : Rat) / 110226591) [(4, 2), (11, 1), (15, 1)],
  term ((1530117760 : Rat) / 110226591) [(5, 2), (11, 1), (15, 1)],
  term ((3060235520 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)],
  term ((-1530117760 : Rat) / 110226591) [(11, 1), (12, 2), (15, 1)],
  term ((-1530117760 : Rat) / 110226591) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0115
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0116 : Poly :=
[
  term ((-4874240 : Rat) / 110226591) [(11, 2)]
]

/-- Partial product 116 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0116 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(4, 1), (11, 2)],
  term ((-4874240 : Rat) / 110226591) [(4, 2), (11, 2)],
  term ((-4874240 : Rat) / 110226591) [(5, 2), (11, 2)],
  term ((-9748480 : Rat) / 110226591) [(11, 2), (12, 1)],
  term ((4874240 : Rat) / 110226591) [(11, 2), (12, 2)],
  term ((4874240 : Rat) / 110226591) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0116
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0117 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(11, 2), (14, 1)]
]

/-- Partial product 117 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0117 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(4, 1), (11, 2), (14, 1)],
  term ((19496960 : Rat) / 110226591) [(4, 2), (11, 2), (14, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 2), (11, 2), (14, 1)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)],
  term ((-19496960 : Rat) / 110226591) [(11, 2), (12, 2), (14, 1)],
  term ((-19496960 : Rat) / 110226591) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0117
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0118 : Poly :=
[
  term ((-9950080 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 118 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0118 : Poly :=
[
  term ((19900160 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9950080 : Rat) / 12247399) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-9950080 : Rat) / 12247399) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((9950080 : Rat) / 12247399) [(12, 1), (13, 3), (15, 1)],
  term ((-19900160 : Rat) / 12247399) [(12, 2), (13, 1), (15, 1)],
  term ((9950080 : Rat) / 12247399) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0118
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0119 : Poly :=
[
  term ((574261760 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 119 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0119 : Poly :=
[
  term ((-1148523520 : Rat) / 330679773) [(4, 1), (12, 1), (15, 2)],
  term ((574261760 : Rat) / 330679773) [(4, 2), (12, 1), (15, 2)],
  term ((574261760 : Rat) / 330679773) [(5, 2), (12, 1), (15, 2)],
  term ((-574261760 : Rat) / 330679773) [(12, 1), (13, 2), (15, 2)],
  term ((1148523520 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((-574261760 : Rat) / 330679773) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0119
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0120 : Poly :=
[
  term ((-709978880 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 120 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0120 : Poly :=
[
  term ((1419957760 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-709978880 : Rat) / 330679773) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-709978880 : Rat) / 330679773) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1419957760 : Rat) / 330679773) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((709978880 : Rat) / 330679773) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((709978880 : Rat) / 330679773) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0120
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0121 : Poly :=
[
  term ((731574470 : Rat) / 110226591) [(13, 1), (15, 1)]
]

/-- Partial product 121 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0121 : Poly :=
[
  term ((-1463148940 : Rat) / 110226591) [(4, 1), (13, 1), (15, 1)],
  term ((731574470 : Rat) / 110226591) [(4, 2), (13, 1), (15, 1)],
  term ((731574470 : Rat) / 110226591) [(5, 2), (13, 1), (15, 1)],
  term ((1463148940 : Rat) / 110226591) [(12, 1), (13, 1), (15, 1)],
  term ((-731574470 : Rat) / 110226591) [(12, 2), (13, 1), (15, 1)],
  term ((-731574470 : Rat) / 110226591) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0121
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0122 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 122 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0122 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(4, 1), (13, 2)],
  term ((-4569600 : Rat) / 12247399) [(4, 2), (13, 2)],
  term ((-4569600 : Rat) / 12247399) [(5, 2), (13, 2)],
  term ((-9139200 : Rat) / 12247399) [(12, 1), (13, 2)],
  term ((4569600 : Rat) / 12247399) [(12, 2), (13, 2)],
  term ((4569600 : Rat) / 12247399) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0122
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0123 : Poly :=
[
  term ((9950080 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 123 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0123 : Poly :=
[
  term ((-19900160 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((9950080 : Rat) / 12247399) [(4, 2), (13, 2), (14, 1)],
  term ((9950080 : Rat) / 12247399) [(5, 2), (13, 2), (14, 1)],
  term ((19900160 : Rat) / 12247399) [(12, 1), (13, 2), (14, 1)],
  term ((-9950080 : Rat) / 12247399) [(12, 2), (13, 2), (14, 1)],
  term ((-9950080 : Rat) / 12247399) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0123
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0124 : Poly :=
[
  term ((-9 : Rat) / 67) [(14, 1)]
]

/-- Partial product 124 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0124 : Poly :=
[
  term ((18 : Rat) / 67) [(4, 1), (14, 1)],
  term ((-9 : Rat) / 67) [(4, 2), (14, 1)],
  term ((-9 : Rat) / 67) [(5, 2), (14, 1)],
  term ((-18 : Rat) / 67) [(12, 1), (14, 1)],
  term ((9 : Rat) / 67) [(12, 2), (14, 1)],
  term ((9 : Rat) / 67) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0124
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0125 : Poly :=
[
  term ((96701440 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 125 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0125 : Poly :=
[
  term ((-193402880 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)],
  term ((96701440 : Rat) / 110226591) [(4, 2), (14, 1), (15, 2)],
  term ((96701440 : Rat) / 110226591) [(5, 2), (14, 1), (15, 2)],
  term ((193402880 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)],
  term ((-96701440 : Rat) / 110226591) [(12, 2), (14, 1), (15, 2)],
  term ((-96701440 : Rat) / 110226591) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0125
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNYN_coefficient_04_0126 : Poly :=
[
  term ((-458624840 : Rat) / 36742197) [(15, 2)]
]

/-- Partial product 126 for generator 4. -/
def rs_R009_ueqv_R009NNNYN_partial_04_0126 : Poly :=
[
  term ((917249680 : Rat) / 36742197) [(4, 1), (15, 2)],
  term ((-458624840 : Rat) / 36742197) [(4, 2), (15, 2)],
  term ((-458624840 : Rat) / 36742197) [(5, 2), (15, 2)],
  term ((-917249680 : Rat) / 36742197) [(12, 1), (15, 2)],
  term ((458624840 : Rat) / 36742197) [(12, 2), (15, 2)],
  term ((458624840 : Rat) / 36742197) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 4. -/
theorem rs_R009_ueqv_R009NNNYN_partial_04_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_04_0126
        rs_R009_ueqv_R009NNNYN_generator_04_0100_0126 =
      rs_R009_ueqv_R009NNNYN_partial_04_0126 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_04_0100_0126 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_04_0100,
  rs_R009_ueqv_R009NNNYN_partial_04_0101,
  rs_R009_ueqv_R009NNNYN_partial_04_0102,
  rs_R009_ueqv_R009NNNYN_partial_04_0103,
  rs_R009_ueqv_R009NNNYN_partial_04_0104,
  rs_R009_ueqv_R009NNNYN_partial_04_0105,
  rs_R009_ueqv_R009NNNYN_partial_04_0106,
  rs_R009_ueqv_R009NNNYN_partial_04_0107,
  rs_R009_ueqv_R009NNNYN_partial_04_0108,
  rs_R009_ueqv_R009NNNYN_partial_04_0109,
  rs_R009_ueqv_R009NNNYN_partial_04_0110,
  rs_R009_ueqv_R009NNNYN_partial_04_0111,
  rs_R009_ueqv_R009NNNYN_partial_04_0112,
  rs_R009_ueqv_R009NNNYN_partial_04_0113,
  rs_R009_ueqv_R009NNNYN_partial_04_0114,
  rs_R009_ueqv_R009NNNYN_partial_04_0115,
  rs_R009_ueqv_R009NNNYN_partial_04_0116,
  rs_R009_ueqv_R009NNNYN_partial_04_0117,
  rs_R009_ueqv_R009NNNYN_partial_04_0118,
  rs_R009_ueqv_R009NNNYN_partial_04_0119,
  rs_R009_ueqv_R009NNNYN_partial_04_0120,
  rs_R009_ueqv_R009NNNYN_partial_04_0121,
  rs_R009_ueqv_R009NNNYN_partial_04_0122,
  rs_R009_ueqv_R009NNNYN_partial_04_0123,
  rs_R009_ueqv_R009NNNYN_partial_04_0124,
  rs_R009_ueqv_R009NNNYN_partial_04_0125,
  rs_R009_ueqv_R009NNNYN_partial_04_0126
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_04_0100_0126 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-72478658 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1)],
  term ((-34053320 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((2676077776 : Rat) / 330679773) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((4005375292 : Rat) / 330679773) [(4, 1), (9, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(4, 1), (9, 1), (15, 3)],
  term ((144 : Rat) / 67) [(4, 1), (9, 2)],
  term ((38993920 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(4, 1), (10, 1), (15, 2)],
  term ((1273610240 : Rat) / 330679773) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((199082240 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1)],
  term ((-1322961920 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((83210240 : Rat) / 36742197) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3060235520 : Rat) / 110226591) [(4, 1), (11, 1), (15, 1)],
  term ((9748480 : Rat) / 110226591) [(4, 1), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(4, 1), (11, 2), (14, 1)],
  term ((19900160 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1148523520 : Rat) / 330679773) [(4, 1), (12, 1), (15, 2)],
  term ((1419957760 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1463148940 : Rat) / 110226591) [(4, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (13, 2)],
  term ((-19900160 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((18 : Rat) / 67) [(4, 1), (14, 1)],
  term ((-193402880 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)],
  term ((917249680 : Rat) / 36742197) [(4, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((36239329 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1)],
  term ((17026660 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1338038888 : Rat) / 330679773) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-2002687646 : Rat) / 330679773) [(4, 2), (9, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(4, 2), (9, 1), (15, 3)],
  term ((-72 : Rat) / 67) [(4, 2), (9, 2)],
  term ((-19496960 : Rat) / 110226591) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(4, 2), (10, 1), (15, 2)],
  term ((-636805120 : Rat) / 330679773) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-99541120 : Rat) / 110226591) [(4, 2), (11, 1), (13, 1)],
  term ((661480960 : Rat) / 330679773) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-41605120 : Rat) / 36742197) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((1530117760 : Rat) / 110226591) [(4, 2), (11, 1), (15, 1)],
  term ((-4874240 : Rat) / 110226591) [(4, 2), (11, 2)],
  term ((19496960 : Rat) / 110226591) [(4, 2), (11, 2), (14, 1)],
  term ((-9950080 : Rat) / 12247399) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((574261760 : Rat) / 330679773) [(4, 2), (12, 1), (15, 2)],
  term ((-709978880 : Rat) / 330679773) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((731574470 : Rat) / 110226591) [(4, 2), (13, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(4, 2), (13, 2)],
  term ((9950080 : Rat) / 12247399) [(4, 2), (13, 2), (14, 1)],
  term ((-9 : Rat) / 67) [(4, 2), (14, 1)],
  term ((96701440 : Rat) / 110226591) [(4, 2), (14, 1), (15, 2)],
  term ((-458624840 : Rat) / 36742197) [(4, 2), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((36239329 : Rat) / 12247399) [(5, 2), (9, 1), (13, 1)],
  term ((17026660 : Rat) / 12247399) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1338038888 : Rat) / 330679773) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-2002687646 : Rat) / 330679773) [(5, 2), (9, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(5, 2), (9, 1), (15, 3)],
  term ((-72 : Rat) / 67) [(5, 2), (9, 2)],
  term ((-19496960 : Rat) / 110226591) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(5, 2), (10, 1), (15, 2)],
  term ((-636805120 : Rat) / 330679773) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-99541120 : Rat) / 110226591) [(5, 2), (11, 1), (13, 1)],
  term ((661480960 : Rat) / 330679773) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-41605120 : Rat) / 36742197) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((1530117760 : Rat) / 110226591) [(5, 2), (11, 1), (15, 1)],
  term ((-4874240 : Rat) / 110226591) [(5, 2), (11, 2)],
  term ((19496960 : Rat) / 110226591) [(5, 2), (11, 2), (14, 1)],
  term ((-9950080 : Rat) / 12247399) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((574261760 : Rat) / 330679773) [(5, 2), (12, 1), (15, 2)],
  term ((-709978880 : Rat) / 330679773) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((731574470 : Rat) / 110226591) [(5, 2), (13, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(5, 2), (13, 2)],
  term ((9950080 : Rat) / 12247399) [(5, 2), (13, 2), (14, 1)],
  term ((-9 : Rat) / 67) [(5, 2), (14, 1)],
  term ((96701440 : Rat) / 110226591) [(5, 2), (14, 1), (15, 2)],
  term ((-458624840 : Rat) / 36742197) [(5, 2), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((72478658 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)],
  term ((34053320 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2676077776 : Rat) / 330679773) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4005375292 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)],
  term ((-36239329 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1)],
  term ((-17026660 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((1338038888 : Rat) / 330679773) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((2002687646 : Rat) / 330679773) [(9, 1), (12, 2), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (12, 2), (15, 3)],
  term ((1338038888 : Rat) / 330679773) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((2002687646 : Rat) / 330679773) [(9, 1), (13, 2), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (13, 2), (15, 3)],
  term ((-36239329 : Rat) / 12247399) [(9, 1), (13, 3)],
  term ((-17026660 : Rat) / 12247399) [(9, 1), (13, 3), (14, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 3), (15, 2)],
  term ((-144 : Rat) / 67) [(9, 2), (12, 1)],
  term ((72 : Rat) / 67) [(9, 2), (12, 2)],
  term ((72 : Rat) / 67) [(9, 2), (13, 2)],
  term ((-38993920 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(10, 1), (12, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (12, 2), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 3), (15, 1)],
  term ((-199082240 : Rat) / 110226591) [(11, 1), (12, 1), (13, 1)],
  term ((1322961920 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((636805120 : Rat) / 330679773) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-83210240 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3060235520 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)],
  term ((99541120 : Rat) / 110226591) [(11, 1), (12, 2), (13, 1)],
  term ((-661480960 : Rat) / 330679773) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((41605120 : Rat) / 36742197) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5863963520 : Rat) / 330679773) [(11, 1), (12, 2), (15, 1)],
  term ((636805120 : Rat) / 330679773) [(11, 1), (12, 3), (15, 1)],
  term ((41605120 : Rat) / 36742197) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1530117760 : Rat) / 110226591) [(11, 1), (13, 2), (15, 1)],
  term ((99541120 : Rat) / 110226591) [(11, 1), (13, 3)],
  term ((-661480960 : Rat) / 330679773) [(11, 1), (13, 3), (14, 1)],
  term ((-9748480 : Rat) / 110226591) [(11, 2), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)],
  term ((4874240 : Rat) / 110226591) [(11, 2), (12, 2)],
  term ((-19496960 : Rat) / 110226591) [(11, 2), (12, 2), (14, 1)],
  term ((4874240 : Rat) / 110226591) [(11, 2), (13, 2)],
  term ((-19496960 : Rat) / 110226591) [(11, 2), (13, 2), (14, 1)],
  term ((-1419957760 : Rat) / 330679773) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1463148940 : Rat) / 110226591) [(12, 1), (13, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(12, 1), (13, 2)],
  term ((19900160 : Rat) / 12247399) [(12, 1), (13, 2), (14, 1)],
  term ((-574261760 : Rat) / 330679773) [(12, 1), (13, 2), (15, 2)],
  term ((9950080 : Rat) / 12247399) [(12, 1), (13, 3), (15, 1)],
  term ((-18 : Rat) / 67) [(12, 1), (14, 1)],
  term ((193402880 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)],
  term ((-917249680 : Rat) / 36742197) [(12, 1), (15, 2)],
  term ((709978880 : Rat) / 330679773) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-910675910 : Rat) / 110226591) [(12, 2), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(12, 2), (13, 2)],
  term ((-9950080 : Rat) / 12247399) [(12, 2), (13, 2), (14, 1)],
  term ((9 : Rat) / 67) [(12, 2), (14, 1)],
  term ((-96701440 : Rat) / 110226591) [(12, 2), (14, 1), (15, 2)],
  term ((5276147080 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((9950080 : Rat) / 12247399) [(12, 3), (13, 1), (15, 1)],
  term ((-574261760 : Rat) / 330679773) [(12, 3), (15, 2)],
  term ((9 : Rat) / 67) [(13, 2), (14, 1)],
  term ((-96701440 : Rat) / 110226591) [(13, 2), (14, 1), (15, 2)],
  term ((458624840 : Rat) / 36742197) [(13, 2), (15, 2)],
  term ((709978880 : Rat) / 330679773) [(13, 3), (14, 1), (15, 1)],
  term ((-731574470 : Rat) / 110226591) [(13, 3), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(13, 4)],
  term ((-9950080 : Rat) / 12247399) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 100 through 126. -/
theorem rs_R009_ueqv_R009NNNYN_block_04_0100_0126_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_04_0100_0126
      rs_R009_ueqv_R009NNNYN_block_04_0100_0126 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
