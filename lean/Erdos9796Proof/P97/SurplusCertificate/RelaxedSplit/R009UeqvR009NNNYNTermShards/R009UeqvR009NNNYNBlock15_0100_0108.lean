/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 15:100-108

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0100 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 100 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0100 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0100
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0101 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(12, 1), (15, 2)]
]

/-- Partial product 101 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0101 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(2, 2), (12, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(3, 2), (12, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(12, 1), (14, 2), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0101
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0102 : Poly :=
[
  term ((60509120 : Rat) / 36742197) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 102 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0102 : Poly :=
[
  term ((-121018240 : Rat) / 36742197) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((60509120 : Rat) / 36742197) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-121018240 : Rat) / 36742197) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((60509120 : Rat) / 36742197) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((121018240 : Rat) / 36742197) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((121018240 : Rat) / 36742197) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-60509120 : Rat) / 36742197) [(13, 1), (14, 1), (15, 3)],
  term ((-60509120 : Rat) / 36742197) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0102
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0103 : Poly :=
[
  term ((1036585072 : Rat) / 330679773) [(13, 1), (15, 1)]
]

/-- Partial product 103 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0103 : Poly :=
[
  term ((-2073170144 : Rat) / 330679773) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((1036585072 : Rat) / 330679773) [(2, 2), (13, 1), (15, 1)],
  term ((-2073170144 : Rat) / 330679773) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((1036585072 : Rat) / 330679773) [(3, 2), (13, 1), (15, 1)],
  term ((2073170144 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((2073170144 : Rat) / 330679773) [(5, 1), (13, 1), (15, 2)],
  term ((-1036585072 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)],
  term ((-1036585072 : Rat) / 330679773) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0103
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0104 : Poly :=
[
  term ((762370 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 104 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0104 : Poly :=
[
  term ((-1524740 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2)],
  term ((762370 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((-1524740 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2)],
  term ((762370 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((1524740 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((1524740 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)],
  term ((-762370 : Rat) / 12247399) [(13, 2), (14, 2)],
  term ((-762370 : Rat) / 12247399) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0104
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0105 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 105 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0105 : Poly :=
[
  term ((19192320 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(2, 2), (13, 2), (14, 1)],
  term ((19192320 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(3, 2), (13, 2), (14, 1)],
  term ((-19192320 : Rat) / 12247399) [(4, 1), (13, 2), (14, 2)],
  term ((-19192320 : Rat) / 12247399) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 1), (15, 2)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0105
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0106 : Poly :=
[
  term ((-92 : Rat) / 67) [(14, 1)]
]

/-- Partial product 106 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0106 : Poly :=
[
  term ((184 : Rat) / 67) [(2, 1), (4, 1), (14, 1)],
  term ((-92 : Rat) / 67) [(2, 2), (14, 1)],
  term ((184 : Rat) / 67) [(3, 1), (5, 1), (14, 1)],
  term ((-92 : Rat) / 67) [(3, 2), (14, 1)],
  term ((-184 : Rat) / 67) [(4, 1), (14, 2)],
  term ((-184 : Rat) / 67) [(5, 1), (14, 1), (15, 1)],
  term ((92 : Rat) / 67) [(14, 1), (15, 2)],
  term ((92 : Rat) / 67) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0106
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0107 : Poly :=
[
  term ((2197760 : Rat) / 36742197) [(14, 1), (15, 2)]
]

/-- Partial product 107 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0107 : Poly :=
[
  term ((-4395520 : Rat) / 36742197) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((2197760 : Rat) / 36742197) [(2, 2), (14, 1), (15, 2)],
  term ((-4395520 : Rat) / 36742197) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((2197760 : Rat) / 36742197) [(3, 2), (14, 1), (15, 2)],
  term ((4395520 : Rat) / 36742197) [(4, 1), (14, 2), (15, 2)],
  term ((4395520 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)],
  term ((-2197760 : Rat) / 36742197) [(14, 1), (15, 4)],
  term ((-2197760 : Rat) / 36742197) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0107
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NNNYN_coefficient_15_0108 : Poly :=
[
  term ((-706640440 : Rat) / 110226591) [(15, 2)]
]

/-- Partial product 108 for generator 15. -/
def rs_R009_ueqv_R009NNNYN_partial_15_0108 : Poly :=
[
  term ((1413280880 : Rat) / 110226591) [(2, 1), (4, 1), (15, 2)],
  term ((-706640440 : Rat) / 110226591) [(2, 2), (15, 2)],
  term ((1413280880 : Rat) / 110226591) [(3, 1), (5, 1), (15, 2)],
  term ((-706640440 : Rat) / 110226591) [(3, 2), (15, 2)],
  term ((-1413280880 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)],
  term ((-1413280880 : Rat) / 110226591) [(5, 1), (15, 3)],
  term ((706640440 : Rat) / 110226591) [(14, 2), (15, 2)],
  term ((706640440 : Rat) / 110226591) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 15. -/
theorem rs_R009_ueqv_R009NNNYN_partial_15_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_15_0108
        rs_R009_ueqv_R009NNNYN_generator_15_0100_0108 =
      rs_R009_ueqv_R009NNNYN_partial_15_0108 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_15_0100_0108 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_15_0100,
  rs_R009_ueqv_R009NNNYN_partial_15_0101,
  rs_R009_ueqv_R009NNNYN_partial_15_0102,
  rs_R009_ueqv_R009NNNYN_partial_15_0103,
  rs_R009_ueqv_R009NNNYN_partial_15_0104,
  rs_R009_ueqv_R009NNNYN_partial_15_0105,
  rs_R009_ueqv_R009NNNYN_partial_15_0106,
  rs_R009_ueqv_R009NNNYN_partial_15_0107,
  rs_R009_ueqv_R009NNNYN_partial_15_0108
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_15_0100_0108 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-121018240 : Rat) / 36742197) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2073170144 : Rat) / 330679773) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-1524740 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2)],
  term ((19192320 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((184 : Rat) / 67) [(2, 1), (4, 1), (14, 1)],
  term ((-4395520 : Rat) / 36742197) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((1413280880 : Rat) / 110226591) [(2, 1), (4, 1), (15, 2)],
  term ((4569600 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(2, 2), (12, 1), (15, 2)],
  term ((60509120 : Rat) / 36742197) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((1036585072 : Rat) / 330679773) [(2, 2), (13, 1), (15, 1)],
  term ((762370 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((-9596160 : Rat) / 12247399) [(2, 2), (13, 2), (14, 1)],
  term ((-92 : Rat) / 67) [(2, 2), (14, 1)],
  term ((2197760 : Rat) / 36742197) [(2, 2), (14, 1), (15, 2)],
  term ((-706640440 : Rat) / 110226591) [(2, 2), (15, 2)],
  term ((-9139200 : Rat) / 12247399) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-121018240 : Rat) / 36742197) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2073170144 : Rat) / 330679773) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-1524740 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2)],
  term ((19192320 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((184 : Rat) / 67) [(3, 1), (5, 1), (14, 1)],
  term ((-4395520 : Rat) / 36742197) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((1413280880 : Rat) / 110226591) [(3, 1), (5, 1), (15, 2)],
  term ((4569600 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(3, 2), (12, 1), (15, 2)],
  term ((60509120 : Rat) / 36742197) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((1036585072 : Rat) / 330679773) [(3, 2), (13, 1), (15, 1)],
  term ((762370 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((-9596160 : Rat) / 12247399) [(3, 2), (13, 2), (14, 1)],
  term ((-92 : Rat) / 67) [(3, 2), (14, 1)],
  term ((2197760 : Rat) / 36742197) [(3, 2), (14, 1), (15, 2)],
  term ((-706640440 : Rat) / 110226591) [(3, 2), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((2073170144 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((121018240 : Rat) / 36742197) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((1524740 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((-19192320 : Rat) / 12247399) [(4, 1), (13, 2), (14, 2)],
  term ((-1413280880 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)],
  term ((-184 : Rat) / 67) [(4, 1), (14, 2)],
  term ((4395520 : Rat) / 36742197) [(4, 1), (14, 2), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)],
  term ((121018240 : Rat) / 36742197) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((2073170144 : Rat) / 330679773) [(5, 1), (13, 1), (15, 2)],
  term ((-19192320 : Rat) / 12247399) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((1524740 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)],
  term ((-184 : Rat) / 67) [(5, 1), (14, 1), (15, 1)],
  term ((4395520 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)],
  term ((-1413280880 : Rat) / 110226591) [(5, 1), (15, 3)],
  term ((-4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(12, 1), (13, 1), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(12, 1), (14, 2), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(12, 1), (15, 4)],
  term ((-60509120 : Rat) / 36742197) [(13, 1), (14, 1), (15, 3)],
  term ((-1036585072 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)],
  term ((-60509120 : Rat) / 36742197) [(13, 1), (14, 3), (15, 1)],
  term ((-1036585072 : Rat) / 330679773) [(13, 1), (15, 3)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 1), (15, 2)],
  term ((-762370 : Rat) / 12247399) [(13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 3)],
  term ((-762370 : Rat) / 12247399) [(13, 2), (15, 2)],
  term ((92 : Rat) / 67) [(14, 1), (15, 2)],
  term ((-2197760 : Rat) / 36742197) [(14, 1), (15, 4)],
  term ((706640440 : Rat) / 110226591) [(14, 2), (15, 2)],
  term ((92 : Rat) / 67) [(14, 3)],
  term ((-2197760 : Rat) / 36742197) [(14, 3), (15, 2)],
  term ((706640440 : Rat) / 110226591) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 100 through 108. -/
theorem rs_R009_ueqv_R009NNNYN_block_15_0100_0108_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_15_0100_0108
      rs_R009_ueqv_R009NNNYN_block_15_0100_0108 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
