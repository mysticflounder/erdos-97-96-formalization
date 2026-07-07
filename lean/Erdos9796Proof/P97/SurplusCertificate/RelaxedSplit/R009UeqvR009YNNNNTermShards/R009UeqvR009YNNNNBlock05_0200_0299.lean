/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 5:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0200 : Poly :=
[
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 200 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0200 : Poly :=
[
  term ((-194560 : Rat) / 343) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (4, 2), (5, 1), (15, 2)],
  term ((194560 : Rat) / 343) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (5, 1), (15, 4)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0200
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0201 : Poly :=
[
  term ((10813215080142800 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 201 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0201 : Poly :=
[
  term ((-21626430160285600 : Rat) / 19582231017447) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((10813215080142800 : Rat) / 19582231017447) [(3, 1), (4, 2), (6, 1), (11, 1)],
  term ((10813215080142800 : Rat) / 19582231017447) [(3, 1), (5, 2), (6, 1), (11, 1)],
  term ((21626430160285600 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-10813215080142800 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-10813215080142800 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0201
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0202 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 202 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0202 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (4, 2), (6, 1), (12, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (5, 2), (6, 1), (12, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0202
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0203 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 203 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0203 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (4, 2), (6, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (5, 2), (6, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0203
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0204 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 204 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0204 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (4, 2), (6, 1), (13, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (5, 2), (6, 1), (13, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 2), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0204
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0205 : Poly :=
[
  term ((93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 205 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0205 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(3, 1), (4, 2), (6, 1), (14, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(3, 1), (5, 2), (6, 1), (14, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0205
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0206 : Poly :=
[
  term ((-5276120282676857 : Rat) / 3729948765228) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 206 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0206 : Poly :=
[
  term ((5276120282676857 : Rat) / 1864974382614) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-5276120282676857 : Rat) / 3729948765228) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((-5276120282676857 : Rat) / 3729948765228) [(3, 1), (5, 2), (6, 1), (15, 1)],
  term ((-5276120282676857 : Rat) / 1864974382614) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((5276120282676857 : Rat) / 3729948765228) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((5276120282676857 : Rat) / 3729948765228) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0206
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0207 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 207 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0207 : Poly :=
[
  term ((747520 : Rat) / 3087) [(3, 1), (4, 1), (6, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (4, 2), (6, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (5, 2), (6, 1), (15, 3)],
  term ((-747520 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (14, 2), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0207
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0208 : Poly :=
[
  term ((11510454542524643 : Rat) / 39164462034894) [(3, 1), (7, 1)]
]

/-- Partial product 208 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0208 : Poly :=
[
  term ((-11510454542524643 : Rat) / 19582231017447) [(3, 1), (4, 1), (7, 1)],
  term ((11510454542524643 : Rat) / 39164462034894) [(3, 1), (4, 2), (7, 1)],
  term ((11510454542524643 : Rat) / 39164462034894) [(3, 1), (5, 2), (7, 1)],
  term ((11510454542524643 : Rat) / 19582231017447) [(3, 1), (7, 1), (14, 1)],
  term ((-11510454542524643 : Rat) / 39164462034894) [(3, 1), (7, 1), (14, 2)],
  term ((-11510454542524643 : Rat) / 39164462034894) [(3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0208
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0209 : Poly :=
[
  term ((-4418471521965217 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 209 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0209 : Poly :=
[
  term ((4418471521965217 : Rat) / 39164462034894) [(3, 1), (4, 1), (7, 1), (10, 1)],
  term ((-4418471521965217 : Rat) / 78328924069788) [(3, 1), (4, 2), (7, 1), (10, 1)],
  term ((-4418471521965217 : Rat) / 78328924069788) [(3, 1), (5, 2), (7, 1), (10, 1)],
  term ((-4418471521965217 : Rat) / 39164462034894) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((4418471521965217 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((4418471521965217 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0209
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0210 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 210 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0210 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (4, 2), (7, 1), (12, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (5, 2), (7, 1), (12, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (12, 1), (14, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0210
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0211 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 211 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0211 : Poly :=
[
  term ((373760 : Rat) / 3087) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (4, 2), (7, 1), (12, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0211
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0212 : Poly :=
[
  term ((51465843808083379 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 212 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0212 : Poly :=
[
  term ((-51465843808083379 : Rat) / 26109641356596) [(3, 1), (4, 1), (7, 1), (14, 1)],
  term ((51465843808083379 : Rat) / 52219282713192) [(3, 1), (4, 2), (7, 1), (14, 1)],
  term ((51465843808083379 : Rat) / 52219282713192) [(3, 1), (5, 2), (7, 1), (14, 1)],
  term ((-51465843808083379 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((51465843808083379 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 2)],
  term ((-51465843808083379 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0212
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0213 : Poly :=
[
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 213 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0213 : Poly :=
[
  term ((-747520 : Rat) / 3087) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (4, 2), (7, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (5, 2), (7, 1), (14, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 4)],
  term ((747520 : Rat) / 3087) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0213
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0214 : Poly :=
[
  term ((-93440 : Rat) / 3087) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 214 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0214 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(3, 1), (4, 2), (7, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(3, 1), (5, 2), (7, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((93440 : Rat) / 3087) [(3, 1), (7, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0214
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0215 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 1), (9, 1)]
]

/-- Partial product 215 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0215 : Poly :=
[
  term ((-1280 : Rat) / 21) [(3, 1), (4, 1), (9, 1)],
  term ((640 : Rat) / 21) [(3, 1), (4, 2), (9, 1)],
  term ((640 : Rat) / 21) [(3, 1), (5, 2), (9, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (9, 1), (14, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (9, 1), (14, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0215
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0216 : Poly :=
[
  term ((8121862279687 : Rat) / 13489868952) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 216 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0216 : Poly :=
[
  term ((-8121862279687 : Rat) / 6744934476) [(3, 1), (4, 1), (9, 1), (10, 1)],
  term ((8121862279687 : Rat) / 13489868952) [(3, 1), (4, 2), (9, 1), (10, 1)],
  term ((8121862279687 : Rat) / 13489868952) [(3, 1), (5, 2), (9, 1), (10, 1)],
  term ((8121862279687 : Rat) / 6744934476) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-8121862279687 : Rat) / 13489868952) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((-8121862279687 : Rat) / 13489868952) [(3, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0216
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0217 : Poly :=
[
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 217 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0217 : Poly :=
[
  term ((640 : Rat) / 7) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (4, 2), (9, 1), (14, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (5, 2), (9, 1), (14, 1)],
  term ((320 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-640 : Rat) / 7) [(3, 1), (9, 1), (14, 2)],
  term ((320 : Rat) / 7) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0217
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0218 : Poly :=
[
  term ((-97280 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 218 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0218 : Poly :=
[
  term ((194560 : Rat) / 343) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (4, 2), (9, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (5, 2), (9, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0218
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0219 : Poly :=
[
  term ((-1024430348060099 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 219 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0219 : Poly :=
[
  term ((1024430348060099 : Rat) / 2175803446383) [(3, 1), (4, 1), (10, 1), (11, 1)],
  term ((-1024430348060099 : Rat) / 4351606892766) [(3, 1), (4, 2), (10, 1), (11, 1)],
  term ((-1024430348060099 : Rat) / 4351606892766) [(3, 1), (5, 2), (10, 1), (11, 1)],
  term ((-1024430348060099 : Rat) / 2175803446383) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((1024430348060099 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((1024430348060099 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0219
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0220 : Poly :=
[
  term ((-333576329821813 : Rat) / 532849823604) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 220 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0220 : Poly :=
[
  term ((333576329821813 : Rat) / 266424911802) [(3, 1), (4, 1), (10, 1), (13, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(3, 1), (4, 2), (10, 1), (13, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(3, 1), (5, 2), (10, 1), (13, 1)],
  term ((-333576329821813 : Rat) / 266424911802) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((333576329821813 : Rat) / 532849823604) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0220
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0221 : Poly :=
[
  term ((505 : Rat) / 42) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 221 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0221 : Poly :=
[
  term ((-505 : Rat) / 21) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((505 : Rat) / 42) [(3, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((505 : Rat) / 42) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((505 : Rat) / 21) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-505 : Rat) / 42) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-505 : Rat) / 42) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0221
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0222 : Poly :=
[
  term ((104270354348416189 : Rat) / 78328924069788) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 222 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0222 : Poly :=
[
  term ((-104270354348416189 : Rat) / 39164462034894) [(3, 1), (4, 1), (10, 1), (15, 1)],
  term ((104270354348416189 : Rat) / 78328924069788) [(3, 1), (4, 2), (10, 1), (15, 1)],
  term ((104270354348416189 : Rat) / 78328924069788) [(3, 1), (5, 2), (10, 1), (15, 1)],
  term ((104270354348416189 : Rat) / 39164462034894) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-104270354348416189 : Rat) / 78328924069788) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-104270354348416189 : Rat) / 78328924069788) [(3, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0222
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0223 : Poly :=
[
  term ((-194 : Rat) / 21) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0223 : Poly :=
[
  term ((388 : Rat) / 21) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-194 : Rat) / 21) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-194 : Rat) / 21) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-388 : Rat) / 21) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((194 : Rat) / 21) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((194 : Rat) / 21) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0223
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0224 : Poly :=
[
  term ((-311105777369507 : Rat) / 2175803446383) [(3, 1), (11, 1)]
]

/-- Partial product 224 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0224 : Poly :=
[
  term ((622211554739014 : Rat) / 2175803446383) [(3, 1), (4, 1), (11, 1)],
  term ((-311105777369507 : Rat) / 2175803446383) [(3, 1), (4, 2), (11, 1)],
  term ((-311105777369507 : Rat) / 2175803446383) [(3, 1), (5, 2), (11, 1)],
  term ((-622211554739014 : Rat) / 2175803446383) [(3, 1), (11, 1), (14, 1)],
  term ((311105777369507 : Rat) / 2175803446383) [(3, 1), (11, 1), (14, 2)],
  term ((311105777369507 : Rat) / 2175803446383) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0224
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0225 : Poly :=
[
  term ((-11509472182985360 : Rat) / 19582231017447) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 225 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0225 : Poly :=
[
  term ((23018944365970720 : Rat) / 19582231017447) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-11509472182985360 : Rat) / 19582231017447) [(3, 1), (4, 2), (11, 1), (14, 1)],
  term ((-11509472182985360 : Rat) / 19582231017447) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term ((11509472182985360 : Rat) / 19582231017447) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-23018944365970720 : Rat) / 19582231017447) [(3, 1), (11, 1), (14, 2)],
  term ((11509472182985360 : Rat) / 19582231017447) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0225
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0226 : Poly :=
[
  term ((-320 : Rat) / 21) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 226 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0226 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((320 : Rat) / 21) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((320 : Rat) / 21) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0226
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0227 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 227 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0227 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(3, 1), (4, 1), (12, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (4, 2), (12, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (5, 2), (12, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-186880 : Rat) / 3087) [(3, 1), (12, 1), (14, 2), (15, 3)],
  term ((-186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0227
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0228 : Poly :=
[
  term ((-640 : Rat) / 21) [(3, 1), (13, 1)]
]

/-- Partial product 228 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0228 : Poly :=
[
  term ((1280 : Rat) / 21) [(3, 1), (4, 1), (13, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (4, 2), (13, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 2), (13, 1)],
  term ((-1280 : Rat) / 21) [(3, 1), (13, 1), (14, 1)],
  term ((640 : Rat) / 21) [(3, 1), (13, 1), (14, 2)],
  term ((640 : Rat) / 21) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0228
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0229 : Poly :=
[
  term ((-29767204022951165 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 229 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0229 : Poly :=
[
  term ((29767204022951165 : Rat) / 39164462034894) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((-29767204022951165 : Rat) / 78328924069788) [(3, 1), (4, 2), (13, 1), (14, 1)],
  term ((-29767204022951165 : Rat) / 78328924069788) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term ((29767204022951165 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-29767204022951165 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 2)],
  term ((29767204022951165 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0229
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0230 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 230 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0230 : Poly :=
[
  term ((373760 : Rat) / 3087) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (4, 2), (13, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (5, 2), (13, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 4)],
  term ((-373760 : Rat) / 3087) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0230
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0231 : Poly :=
[
  term ((97280 : Rat) / 343) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 231 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0231 : Poly :=
[
  term ((-194560 : Rat) / 343) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (4, 2), (13, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((194560 : Rat) / 343) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0231
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0232 : Poly :=
[
  term ((6042928589578607 : Rat) / 26109641356596) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 232 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0232 : Poly :=
[
  term ((-6042928589578607 : Rat) / 13054820678298) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((6042928589578607 : Rat) / 26109641356596) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((6042928589578607 : Rat) / 26109641356596) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((-6042928589578607 : Rat) / 26109641356596) [(3, 1), (14, 1), (15, 3)],
  term ((6042928589578607 : Rat) / 13054820678298) [(3, 1), (14, 2), (15, 1)],
  term ((-6042928589578607 : Rat) / 26109641356596) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0232
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0233 : Poly :=
[
  term ((-93440 : Rat) / 3087) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 233 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0233 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-93440 : Rat) / 3087) [(3, 1), (4, 2), (14, 2), (15, 1)],
  term ((-93440 : Rat) / 3087) [(3, 1), (5, 2), (14, 2), (15, 1)],
  term ((93440 : Rat) / 3087) [(3, 1), (14, 2), (15, 3)],
  term ((-186880 : Rat) / 3087) [(3, 1), (14, 3), (15, 1)],
  term ((93440 : Rat) / 3087) [(3, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0233
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0234 : Poly :=
[
  term ((-75424944733720517 : Rat) / 156657848139576) [(3, 1), (15, 1)]
]

/-- Partial product 234 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0234 : Poly :=
[
  term ((75424944733720517 : Rat) / 78328924069788) [(3, 1), (4, 1), (15, 1)],
  term ((-75424944733720517 : Rat) / 156657848139576) [(3, 1), (4, 2), (15, 1)],
  term ((-75424944733720517 : Rat) / 156657848139576) [(3, 1), (5, 2), (15, 1)],
  term ((-75424944733720517 : Rat) / 78328924069788) [(3, 1), (14, 1), (15, 1)],
  term ((75424944733720517 : Rat) / 156657848139576) [(3, 1), (14, 2), (15, 1)],
  term ((75424944733720517 : Rat) / 156657848139576) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0234
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0235 : Poly :=
[
  term ((93440 : Rat) / 3087) [(3, 1), (15, 3)]
]

/-- Partial product 235 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0235 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (4, 1), (15, 3)],
  term ((93440 : Rat) / 3087) [(3, 1), (4, 2), (15, 3)],
  term ((93440 : Rat) / 3087) [(3, 1), (5, 2), (15, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (14, 1), (15, 3)],
  term ((-93440 : Rat) / 3087) [(3, 1), (14, 2), (15, 3)],
  term ((-93440 : Rat) / 3087) [(3, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0235
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0236 : Poly :=
[
  term ((-1328274198856205 : Rat) / 26109641356596) [(3, 2)]
]

/-- Partial product 236 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0236 : Poly :=
[
  term ((1328274198856205 : Rat) / 13054820678298) [(3, 2), (4, 1)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(3, 2), (4, 2)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(3, 2), (5, 2)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(3, 2), (14, 1)],
  term ((1328274198856205 : Rat) / 26109641356596) [(3, 2), (14, 2)],
  term ((1328274198856205 : Rat) / 26109641356596) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0236
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0237 : Poly :=
[
  term ((-1372480999036685 : Rat) / 13054820678298) [(3, 2), (10, 1)]
]

/-- Partial product 237 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0237 : Poly :=
[
  term ((1372480999036685 : Rat) / 6527410339149) [(3, 2), (4, 1), (10, 1)],
  term ((-1372480999036685 : Rat) / 13054820678298) [(3, 2), (4, 2), (10, 1)],
  term ((-1372480999036685 : Rat) / 13054820678298) [(3, 2), (5, 2), (10, 1)],
  term ((-1372480999036685 : Rat) / 6527410339149) [(3, 2), (10, 1), (14, 1)],
  term ((1372480999036685 : Rat) / 13054820678298) [(3, 2), (10, 1), (14, 2)],
  term ((1372480999036685 : Rat) / 13054820678298) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0237
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0238 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 2), (14, 1)]
]

/-- Partial product 238 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0238 : Poly :=
[
  term ((-1280 : Rat) / 21) [(3, 2), (4, 1), (14, 1)],
  term ((640 : Rat) / 21) [(3, 2), (4, 2), (14, 1)],
  term ((640 : Rat) / 21) [(3, 2), (5, 2), (14, 1)],
  term ((-640 : Rat) / 21) [(3, 2), (14, 1), (15, 2)],
  term ((1280 : Rat) / 21) [(3, 2), (14, 2)],
  term ((-640 : Rat) / 21) [(3, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0238
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0239 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1)]
]

/-- Partial product 239 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0239 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1), (5, 2)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(4, 1), (14, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (14, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (15, 2)],
  term ((1994038900525423 : Rat) / 8703213785532) [(4, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0239_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0239
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0240 : Poly :=
[
  term ((8 : Rat) / 3) [(5, 1), (15, 1)]
]

/-- Partial product 240 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0240 : Poly :=
[
  term ((-16 : Rat) / 3) [(4, 1), (5, 1), (15, 1)],
  term ((8 : Rat) / 3) [(4, 2), (5, 1), (15, 1)],
  term ((16 : Rat) / 3) [(5, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (14, 2), (15, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (15, 3)],
  term ((8 : Rat) / 3) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0240_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0240
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0241 : Poly :=
[
  term ((-2 : Rat) / 3) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0241 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(5, 1), (15, 3), (16, 1)],
  term ((-2 : Rat) / 3) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0241_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0241
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0242 : Poly :=
[
  term ((3679075579250557 : Rat) / 17406427571064) [(6, 1)]
]

/-- Partial product 242 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0242 : Poly :=
[
  term ((-3679075579250557 : Rat) / 8703213785532) [(4, 1), (6, 1)],
  term ((3679075579250557 : Rat) / 17406427571064) [(4, 2), (6, 1)],
  term ((3679075579250557 : Rat) / 17406427571064) [(5, 2), (6, 1)],
  term ((3679075579250557 : Rat) / 8703213785532) [(6, 1), (14, 1)],
  term ((-3679075579250557 : Rat) / 17406427571064) [(6, 1), (14, 2)],
  term ((-3679075579250557 : Rat) / 17406427571064) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0242_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0242
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0243 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 243 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0243 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(5, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0243_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0243
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0244 : Poly :=
[
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 244 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0244 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(4, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(4, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(5, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0244_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0244
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0245 : Poly :=
[
  term ((11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 245 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0245 : Poly :=
[
  term ((-11548189763031433 : Rat) / 6527410339149) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((11548189763031433 : Rat) / 13054820678298) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term ((11548189763031433 : Rat) / 13054820678298) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((11548189763031433 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((-11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0245_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0245
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0246 : Poly :=
[
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 246 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0246 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(4, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(5, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0246_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0246
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0247 : Poly :=
[
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 247 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0247 : Poly :=
[
  term ((-4474023365802280 : Rat) / 6527410339149) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0247_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0247
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0248 : Poly :=
[
  term ((-4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 248 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0248 : Poly :=
[
  term ((4349915183394751 : Rat) / 2175803446383) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0248_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0248
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0249 : Poly :=
[
  term ((-1288941318816035 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 249 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0249 : Poly :=
[
  term ((1288941318816035 : Rat) / 399637367703) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-1288941318816035 : Rat) / 799274735406) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((-1288941318816035 : Rat) / 799274735406) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((-1288941318816035 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((1288941318816035 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((1288941318816035 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0249_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0249
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0250 : Poly :=
[
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 250 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0250 : Poly :=
[
  term ((-239616 : Rat) / 553) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((119808 : Rat) / 553) [(4, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((119808 : Rat) / 553) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0250_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0250
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0251 : Poly :=
[
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 251 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0251 : Poly :=
[
  term ((-941242657 : Rat) / 83270796) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0251_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0251
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0252 : Poly :=
[
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0252 : Poly :=
[
  term ((-725 : Rat) / 42) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0252_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0252
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0253 : Poly :=
[
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 253 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0253 : Poly :=
[
  term ((223016262790904647 : Rat) / 156657848139576) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0253_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0253
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0254 : Poly :=
[
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0254 : Poly :=
[
  term ((314 : Rat) / 21) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0254_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0254
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0255 : Poly :=
[
  term ((-27838687559453 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 255 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0255 : Poly :=
[
  term ((27838687559453 : Rat) / 20234803428) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-27838687559453 : Rat) / 40469606856) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-27838687559453 : Rat) / 40469606856) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-27838687559453 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((27838687559453 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((27838687559453 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0255_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0255
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0256 : Poly :=
[
  term ((-725 : Rat) / 28) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 256 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0256 : Poly :=
[
  term ((725 : Rat) / 14) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(4, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 14) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 28) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((725 : Rat) / 28) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0256_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0256
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0257 : Poly :=
[
  term ((223273978116670483 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 257 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0257 : Poly :=
[
  term ((-223273978116670483 : Rat) / 52219282713192) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((223273978116670483 : Rat) / 104438565426384) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((223273978116670483 : Rat) / 104438565426384) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((223273978116670483 : Rat) / 52219282713192) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-223273978116670483 : Rat) / 104438565426384) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-223273978116670483 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0257_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0257
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0258 : Poly :=
[
  term ((157 : Rat) / 7) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0258 : Poly :=
[
  term ((-314 : Rat) / 7) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 7) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 7) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 7) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 7) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 7) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0258_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0258
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0259 : Poly :=
[
  term ((-79407948033839 : Rat) / 11604285047376) [(6, 1), (9, 2)]
]

/-- Partial product 259 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0259 : Poly :=
[
  term ((79407948033839 : Rat) / 5802142523688) [(4, 1), (6, 1), (9, 2)],
  term ((-79407948033839 : Rat) / 11604285047376) [(4, 2), (6, 1), (9, 2)],
  term ((-79407948033839 : Rat) / 11604285047376) [(5, 2), (6, 1), (9, 2)],
  term ((-79407948033839 : Rat) / 5802142523688) [(6, 1), (9, 2), (14, 1)],
  term ((79407948033839 : Rat) / 11604285047376) [(6, 1), (9, 2), (14, 2)],
  term ((79407948033839 : Rat) / 11604285047376) [(6, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0259_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0259
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0260 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1)]
]

/-- Partial product 260 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0260 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(4, 1), (6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(4, 2), (6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(5, 2), (6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (14, 2)],
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0260_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0260
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0261 : Poly :=
[
  term ((-11208305311973983 : Rat) / 17406427571064) [(6, 1), (10, 1)]
]

/-- Partial product 261 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0261 : Poly :=
[
  term ((11208305311973983 : Rat) / 8703213785532) [(4, 1), (6, 1), (10, 1)],
  term ((-11208305311973983 : Rat) / 17406427571064) [(4, 2), (6, 1), (10, 1)],
  term ((-11208305311973983 : Rat) / 17406427571064) [(5, 2), (6, 1), (10, 1)],
  term ((-11208305311973983 : Rat) / 8703213785532) [(6, 1), (10, 1), (14, 1)],
  term ((11208305311973983 : Rat) / 17406427571064) [(6, 1), (10, 1), (14, 2)],
  term ((11208305311973983 : Rat) / 17406427571064) [(6, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0261_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0261
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0262 : Poly :=
[
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1)]
]

/-- Partial product 262 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0262 : Poly :=
[
  term ((1005180329591 : Rat) / 14801383989) [(4, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(4, 2), (6, 1), (10, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(5, 2), (6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (14, 2)],
  term ((1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0262_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0262
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0263 : Poly :=
[
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 263 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0263 : Poly :=
[
  term ((-706121836024930 : Rat) / 6527410339149) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(4, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0263_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0263
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0264 : Poly :=
[
  term ((22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 264 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0264 : Poly :=
[
  term ((-45633955946145352 : Rat) / 19582231017447) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((22816977973072676 : Rat) / 19582231017447) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((22816977973072676 : Rat) / 19582231017447) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((45633955946145352 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0264_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0264
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0265 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 265 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0265 : Poly :=
[
  term ((-340 : Rat) / 63) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0265_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0265
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0266 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 266 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0266 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(4, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(5, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 3)],
  term ((6128799131236 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0266_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0266
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0267 : Poly :=
[
  term ((174698622767525 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 267 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0267 : Poly :=
[
  term ((-174698622767525 : Rat) / 13054820678298) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((174698622767525 : Rat) / 26109641356596) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((174698622767525 : Rat) / 26109641356596) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((174698622767525 : Rat) / 13054820678298) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-174698622767525 : Rat) / 26109641356596) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-174698622767525 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0267_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0267
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0268 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0268 : Poly :=
[
  term ((64 : Rat) / 9) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0268_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0268
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0269 : Poly :=
[
  term ((-7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2)]
]

/-- Partial product 269 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0269 : Poly :=
[
  term ((7337393541563251 : Rat) / 13054820678298) [(4, 1), (6, 1), (11, 2)],
  term ((-7337393541563251 : Rat) / 26109641356596) [(4, 2), (6, 1), (11, 2)],
  term ((-7337393541563251 : Rat) / 26109641356596) [(5, 2), (6, 1), (11, 2)],
  term ((-7337393541563251 : Rat) / 13054820678298) [(6, 1), (11, 2), (14, 1)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2), (14, 2)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0269_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0269
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0270 : Poly :=
[
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 270 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0270 : Poly :=
[
  term ((-2224986028928059 : Rat) / 1598549470812) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0270_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0270
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0271 : Poly :=
[
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0271 : Poly :=
[
  term ((1495 : Rat) / 126) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0271_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0271
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0272 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 272 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0272 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(5, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 4)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0272_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0272
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0273 : Poly :=
[
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 273 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0273 : Poly :=
[
  term ((140138745041977 : Rat) / 165250894662) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(4, 2), (6, 1), (12, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(5, 2), (6, 1), (12, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 165250894662) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0273_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0273
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0274 : Poly :=
[
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 274 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0274 : Poly :=
[
  term ((-494 : Rat) / 63) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(4, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 63) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(6, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0274_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0274
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0275 : Poly :=
[
  term ((-845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 275 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0275 : Poly :=
[
  term ((845559837599 : Rat) / 241755938487) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(4, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(5, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-845559837599 : Rat) / 241755938487) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0275_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0275
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0276 : Poly :=
[
  term ((-21692829505604683 : Rat) / 8703213785532) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 276 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0276 : Poly :=
[
  term ((21692829505604683 : Rat) / 4351606892766) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 8703213785532) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 8703213785532) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 4351606892766) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((21692829505604683 : Rat) / 8703213785532) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((21692829505604683 : Rat) / 8703213785532) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0276_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0276
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0277 : Poly :=
[
  term ((3589 : Rat) / 252) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0277 : Poly :=
[
  term ((-3589 : Rat) / 126) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3589 : Rat) / 252) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3589 : Rat) / 252) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3589 : Rat) / 126) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3589 : Rat) / 252) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3589 : Rat) / 252) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0277_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0277
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0278 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)]
]

/-- Partial product 278 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0278 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(4, 1), (6, 1), (13, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(4, 2), (6, 1), (13, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(5, 2), (6, 1), (13, 2)],
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (13, 2), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2), (14, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0278_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0278
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0279 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 279 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0279 : Poly :=
[
  term ((-340 : Rat) / 63) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(4, 2), (6, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(5, 2), (6, 1), (13, 2), (16, 1)],
  term ((340 : Rat) / 63) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0279_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0279
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0280 : Poly :=
[
  term ((3021914984422465 : Rat) / 5802142523688) [(6, 1), (14, 1)]
]

/-- Partial product 280 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0280 : Poly :=
[
  term ((-3021914984422465 : Rat) / 2901071261844) [(4, 1), (6, 1), (14, 1)],
  term ((3021914984422465 : Rat) / 5802142523688) [(4, 2), (6, 1), (14, 1)],
  term ((3021914984422465 : Rat) / 5802142523688) [(5, 2), (6, 1), (14, 1)],
  term ((-3021914984422465 : Rat) / 5802142523688) [(6, 1), (14, 1), (15, 2)],
  term ((3021914984422465 : Rat) / 2901071261844) [(6, 1), (14, 2)],
  term ((-3021914984422465 : Rat) / 5802142523688) [(6, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0280_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0280
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0281 : Poly :=
[
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 281 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0281 : Poly :=
[
  term ((9193198696854 : Rat) / 26861770943) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(4, 2), (6, 1), (14, 1), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(5, 2), (6, 1), (14, 1), (15, 2)],
  term ((4596599348427 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 4)],
  term ((-9193198696854 : Rat) / 26861770943) [(6, 1), (14, 2), (15, 2)],
  term ((4596599348427 : Rat) / 26861770943) [(6, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0281_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0281
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0282 : Poly :=
[
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (14, 2)]
]

/-- Partial product 282 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0282 : Poly :=
[
  term ((28425155928161 : Rat) / 483511876974) [(4, 1), (6, 1), (14, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(4, 2), (6, 1), (14, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(5, 2), (6, 1), (14, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(6, 1), (14, 2), (15, 2)],
  term ((-28425155928161 : Rat) / 483511876974) [(6, 1), (14, 3)],
  term ((28425155928161 : Rat) / 967023753948) [(6, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0282_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0282
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0283 : Poly :=
[
  term ((7172661377277335 : Rat) / 4351606892766) [(6, 1), (15, 2)]
]

/-- Partial product 283 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0283 : Poly :=
[
  term ((-7172661377277335 : Rat) / 2175803446383) [(4, 1), (6, 1), (15, 2)],
  term ((7172661377277335 : Rat) / 4351606892766) [(4, 2), (6, 1), (15, 2)],
  term ((7172661377277335 : Rat) / 4351606892766) [(5, 2), (6, 1), (15, 2)],
  term ((7172661377277335 : Rat) / 2175803446383) [(6, 1), (14, 1), (15, 2)],
  term ((-7172661377277335 : Rat) / 4351606892766) [(6, 1), (14, 2), (15, 2)],
  term ((-7172661377277335 : Rat) / 4351606892766) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0283_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0283
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0284 : Poly :=
[
  term ((-247 : Rat) / 21) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 284 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0284 : Poly :=
[
  term ((494 : Rat) / 21) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 21) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 21) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-494 : Rat) / 21) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 21) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((247 : Rat) / 21) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0284_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0284
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0285 : Poly :=
[
  term ((417278377569675749 : Rat) / 626631392558304) [(7, 1), (9, 1)]
]

/-- Partial product 285 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0285 : Poly :=
[
  term ((-417278377569675749 : Rat) / 313315696279152) [(4, 1), (7, 1), (9, 1)],
  term ((417278377569675749 : Rat) / 626631392558304) [(4, 2), (7, 1), (9, 1)],
  term ((417278377569675749 : Rat) / 626631392558304) [(5, 2), (7, 1), (9, 1)],
  term ((417278377569675749 : Rat) / 313315696279152) [(7, 1), (9, 1), (14, 1)],
  term ((-417278377569675749 : Rat) / 626631392558304) [(7, 1), (9, 1), (14, 2)],
  term ((-417278377569675749 : Rat) / 626631392558304) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0285_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0285
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0286 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 286 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0286 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(4, 1), (7, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(4, 2), (7, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(5, 2), (7, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0286_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0286
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0287 : Poly :=
[
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 287 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0287 : Poly :=
[
  term ((3849005354029 : Rat) / 1289365005264) [(4, 1), (7, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0287_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0287
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0288 : Poly :=
[
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 288 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0288 : Poly :=
[
  term ((-53777198303881 : Rat) / 40469606856) [(4, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(4, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0288_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0288
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0289 : Poly :=
[
  term ((-206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 289 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0289 : Poly :=
[
  term ((206185803715802887 : Rat) / 52219282713192) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-206185803715802887 : Rat) / 52219282713192) [(7, 1), (9, 1), (14, 2)],
  term ((206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0289_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0289
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0290 : Poly :=
[
  term ((-671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 290 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0290 : Poly :=
[
  term ((1343248370880734 : Rat) / 6527410339149) [(4, 1), (7, 1), (10, 1), (11, 1)],
  term ((-671624185440367 : Rat) / 6527410339149) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((-671624185440367 : Rat) / 6527410339149) [(5, 2), (7, 1), (10, 1), (11, 1)],
  term ((-1343248370880734 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0290_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0290
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0291 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 291 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0291 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0291_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0291
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0292 : Poly :=
[
  term ((170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 292 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0292 : Poly :=
[
  term ((-340 : Rat) / 63) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(4, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0292_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0292
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0293 : Poly :=
[
  term ((-778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 293 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0293 : Poly :=
[
  term ((1556277381736670 : Rat) / 725267815461) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-778138690868335 : Rat) / 725267815461) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-778138690868335 : Rat) / 725267815461) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-1556277381736670 : Rat) / 725267815461) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0293_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0293
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0294 : Poly :=
[
  term ((-32 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0294 : Poly :=
[
  term ((64 : Rat) / 9) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0294_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0294
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0295 : Poly :=
[
  term ((24982748456159909 : Rat) / 52219282713192) [(7, 1), (11, 1)]
]

/-- Partial product 295 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0295 : Poly :=
[
  term ((-24982748456159909 : Rat) / 26109641356596) [(4, 1), (7, 1), (11, 1)],
  term ((24982748456159909 : Rat) / 52219282713192) [(4, 2), (7, 1), (11, 1)],
  term ((24982748456159909 : Rat) / 52219282713192) [(5, 2), (7, 1), (11, 1)],
  term ((24982748456159909 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1)],
  term ((-24982748456159909 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 2)],
  term ((-24982748456159909 : Rat) / 52219282713192) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0295_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0295
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0296 : Poly :=
[
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 296 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0296 : Poly :=
[
  term ((333108 : Rat) / 553) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-166554 : Rat) / 553) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-166554 : Rat) / 553) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-333108 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0296_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0296
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0297 : Poly :=
[
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 297 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0297 : Poly :=
[
  term ((706121836024930 : Rat) / 6527410339149) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(4, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0297_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0297
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0298 : Poly :=
[
  term ((-6728522043164150 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 298 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0298 : Poly :=
[
  term ((13457044086328300 : Rat) / 6527410339149) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-6728522043164150 : Rat) / 6527410339149) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((-6728522043164150 : Rat) / 6527410339149) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((6728522043164150 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13457044086328300 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 2)],
  term ((6728522043164150 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0298_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0298
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0299 : Poly :=
[
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 299 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0299 : Poly :=
[
  term ((941242657 : Rat) / 166541592) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 333083184) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 333083184) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 166541592) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0299_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0299
        rs_R009_ueqv_R009YNNNN_generator_05_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_05_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_05_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_05_0200,
  rs_R009_ueqv_R009YNNNN_partial_05_0201,
  rs_R009_ueqv_R009YNNNN_partial_05_0202,
  rs_R009_ueqv_R009YNNNN_partial_05_0203,
  rs_R009_ueqv_R009YNNNN_partial_05_0204,
  rs_R009_ueqv_R009YNNNN_partial_05_0205,
  rs_R009_ueqv_R009YNNNN_partial_05_0206,
  rs_R009_ueqv_R009YNNNN_partial_05_0207,
  rs_R009_ueqv_R009YNNNN_partial_05_0208,
  rs_R009_ueqv_R009YNNNN_partial_05_0209,
  rs_R009_ueqv_R009YNNNN_partial_05_0210,
  rs_R009_ueqv_R009YNNNN_partial_05_0211,
  rs_R009_ueqv_R009YNNNN_partial_05_0212,
  rs_R009_ueqv_R009YNNNN_partial_05_0213,
  rs_R009_ueqv_R009YNNNN_partial_05_0214,
  rs_R009_ueqv_R009YNNNN_partial_05_0215,
  rs_R009_ueqv_R009YNNNN_partial_05_0216,
  rs_R009_ueqv_R009YNNNN_partial_05_0217,
  rs_R009_ueqv_R009YNNNN_partial_05_0218,
  rs_R009_ueqv_R009YNNNN_partial_05_0219,
  rs_R009_ueqv_R009YNNNN_partial_05_0220,
  rs_R009_ueqv_R009YNNNN_partial_05_0221,
  rs_R009_ueqv_R009YNNNN_partial_05_0222,
  rs_R009_ueqv_R009YNNNN_partial_05_0223,
  rs_R009_ueqv_R009YNNNN_partial_05_0224,
  rs_R009_ueqv_R009YNNNN_partial_05_0225,
  rs_R009_ueqv_R009YNNNN_partial_05_0226,
  rs_R009_ueqv_R009YNNNN_partial_05_0227,
  rs_R009_ueqv_R009YNNNN_partial_05_0228,
  rs_R009_ueqv_R009YNNNN_partial_05_0229,
  rs_R009_ueqv_R009YNNNN_partial_05_0230,
  rs_R009_ueqv_R009YNNNN_partial_05_0231,
  rs_R009_ueqv_R009YNNNN_partial_05_0232,
  rs_R009_ueqv_R009YNNNN_partial_05_0233,
  rs_R009_ueqv_R009YNNNN_partial_05_0234,
  rs_R009_ueqv_R009YNNNN_partial_05_0235,
  rs_R009_ueqv_R009YNNNN_partial_05_0236,
  rs_R009_ueqv_R009YNNNN_partial_05_0237,
  rs_R009_ueqv_R009YNNNN_partial_05_0238,
  rs_R009_ueqv_R009YNNNN_partial_05_0239,
  rs_R009_ueqv_R009YNNNN_partial_05_0240,
  rs_R009_ueqv_R009YNNNN_partial_05_0241,
  rs_R009_ueqv_R009YNNNN_partial_05_0242,
  rs_R009_ueqv_R009YNNNN_partial_05_0243,
  rs_R009_ueqv_R009YNNNN_partial_05_0244,
  rs_R009_ueqv_R009YNNNN_partial_05_0245,
  rs_R009_ueqv_R009YNNNN_partial_05_0246,
  rs_R009_ueqv_R009YNNNN_partial_05_0247,
  rs_R009_ueqv_R009YNNNN_partial_05_0248,
  rs_R009_ueqv_R009YNNNN_partial_05_0249,
  rs_R009_ueqv_R009YNNNN_partial_05_0250,
  rs_R009_ueqv_R009YNNNN_partial_05_0251,
  rs_R009_ueqv_R009YNNNN_partial_05_0252,
  rs_R009_ueqv_R009YNNNN_partial_05_0253,
  rs_R009_ueqv_R009YNNNN_partial_05_0254,
  rs_R009_ueqv_R009YNNNN_partial_05_0255,
  rs_R009_ueqv_R009YNNNN_partial_05_0256,
  rs_R009_ueqv_R009YNNNN_partial_05_0257,
  rs_R009_ueqv_R009YNNNN_partial_05_0258,
  rs_R009_ueqv_R009YNNNN_partial_05_0259,
  rs_R009_ueqv_R009YNNNN_partial_05_0260,
  rs_R009_ueqv_R009YNNNN_partial_05_0261,
  rs_R009_ueqv_R009YNNNN_partial_05_0262,
  rs_R009_ueqv_R009YNNNN_partial_05_0263,
  rs_R009_ueqv_R009YNNNN_partial_05_0264,
  rs_R009_ueqv_R009YNNNN_partial_05_0265,
  rs_R009_ueqv_R009YNNNN_partial_05_0266,
  rs_R009_ueqv_R009YNNNN_partial_05_0267,
  rs_R009_ueqv_R009YNNNN_partial_05_0268,
  rs_R009_ueqv_R009YNNNN_partial_05_0269,
  rs_R009_ueqv_R009YNNNN_partial_05_0270,
  rs_R009_ueqv_R009YNNNN_partial_05_0271,
  rs_R009_ueqv_R009YNNNN_partial_05_0272,
  rs_R009_ueqv_R009YNNNN_partial_05_0273,
  rs_R009_ueqv_R009YNNNN_partial_05_0274,
  rs_R009_ueqv_R009YNNNN_partial_05_0275,
  rs_R009_ueqv_R009YNNNN_partial_05_0276,
  rs_R009_ueqv_R009YNNNN_partial_05_0277,
  rs_R009_ueqv_R009YNNNN_partial_05_0278,
  rs_R009_ueqv_R009YNNNN_partial_05_0279,
  rs_R009_ueqv_R009YNNNN_partial_05_0280,
  rs_R009_ueqv_R009YNNNN_partial_05_0281,
  rs_R009_ueqv_R009YNNNN_partial_05_0282,
  rs_R009_ueqv_R009YNNNN_partial_05_0283,
  rs_R009_ueqv_R009YNNNN_partial_05_0284,
  rs_R009_ueqv_R009YNNNN_partial_05_0285,
  rs_R009_ueqv_R009YNNNN_partial_05_0286,
  rs_R009_ueqv_R009YNNNN_partial_05_0287,
  rs_R009_ueqv_R009YNNNN_partial_05_0288,
  rs_R009_ueqv_R009YNNNN_partial_05_0289,
  rs_R009_ueqv_R009YNNNN_partial_05_0290,
  rs_R009_ueqv_R009YNNNN_partial_05_0291,
  rs_R009_ueqv_R009YNNNN_partial_05_0292,
  rs_R009_ueqv_R009YNNNN_partial_05_0293,
  rs_R009_ueqv_R009YNNNN_partial_05_0294,
  rs_R009_ueqv_R009YNNNN_partial_05_0295,
  rs_R009_ueqv_R009YNNNN_partial_05_0296,
  rs_R009_ueqv_R009YNNNN_partial_05_0297,
  rs_R009_ueqv_R009YNNNN_partial_05_0298,
  rs_R009_ueqv_R009YNNNN_partial_05_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_05_0200_0299 : Poly :=
[
  term ((-194560 : Rat) / 343) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-21626430160285600 : Rat) / 19582231017447) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((5276120282676857 : Rat) / 1864974382614) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((747520 : Rat) / 3087) [(3, 1), (4, 1), (6, 1), (15, 3)],
  term ((-11510454542524643 : Rat) / 19582231017447) [(3, 1), (4, 1), (7, 1)],
  term ((4418471521965217 : Rat) / 39164462034894) [(3, 1), (4, 1), (7, 1), (10, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (4, 1), (7, 1), (12, 1), (15, 2)],
  term ((-51465843808083379 : Rat) / 26109641356596) [(3, 1), (4, 1), (7, 1), (14, 1)],
  term ((-747520 : Rat) / 3087) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-1280 : Rat) / 21) [(3, 1), (4, 1), (9, 1)],
  term ((-8121862279687 : Rat) / 6744934476) [(3, 1), (4, 1), (9, 1), (10, 1)],
  term ((640 : Rat) / 7) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term ((194560 : Rat) / 343) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((1024430348060099 : Rat) / 2175803446383) [(3, 1), (4, 1), (10, 1), (11, 1)],
  term ((333576329821813 : Rat) / 266424911802) [(3, 1), (4, 1), (10, 1), (13, 1)],
  term ((-505 : Rat) / 21) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-104270354348416189 : Rat) / 39164462034894) [(3, 1), (4, 1), (10, 1), (15, 1)],
  term ((388 : Rat) / 21) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((622211554739014 : Rat) / 2175803446383) [(3, 1), (4, 1), (11, 1)],
  term ((23018944365970720 : Rat) / 19582231017447) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((640 : Rat) / 21) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (4, 1), (12, 1), (15, 3)],
  term ((1280 : Rat) / 21) [(3, 1), (4, 1), (13, 1)],
  term ((29767204022951165 : Rat) / 39164462034894) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-6042928589578607 : Rat) / 13054820678298) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((75424944733720517 : Rat) / 78328924069788) [(3, 1), (4, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (4, 1), (15, 3)],
  term ((97280 : Rat) / 343) [(3, 1), (4, 2), (5, 1), (15, 2)],
  term ((10813215080142800 : Rat) / 19582231017447) [(3, 1), (4, 2), (6, 1), (11, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (4, 2), (6, 1), (12, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (4, 2), (6, 1), (13, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (4, 2), (6, 1), (13, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(3, 1), (4, 2), (6, 1), (14, 1), (15, 1)],
  term ((-5276120282676857 : Rat) / 3729948765228) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (4, 2), (6, 1), (15, 3)],
  term ((11510454542524643 : Rat) / 39164462034894) [(3, 1), (4, 2), (7, 1)],
  term ((-4418471521965217 : Rat) / 78328924069788) [(3, 1), (4, 2), (7, 1), (10, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (4, 2), (7, 1), (12, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (4, 2), (7, 1), (12, 1), (15, 2)],
  term ((51465843808083379 : Rat) / 52219282713192) [(3, 1), (4, 2), (7, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (4, 2), (7, 1), (14, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(3, 1), (4, 2), (7, 1), (15, 2)],
  term ((640 : Rat) / 21) [(3, 1), (4, 2), (9, 1)],
  term ((8121862279687 : Rat) / 13489868952) [(3, 1), (4, 2), (9, 1), (10, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (4, 2), (9, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(3, 1), (4, 2), (9, 1), (15, 2)],
  term ((-1024430348060099 : Rat) / 4351606892766) [(3, 1), (4, 2), (10, 1), (11, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(3, 1), (4, 2), (10, 1), (13, 1)],
  term ((505 : Rat) / 42) [(3, 1), (4, 2), (10, 1), (13, 1), (16, 1)],
  term ((104270354348416189 : Rat) / 78328924069788) [(3, 1), (4, 2), (10, 1), (15, 1)],
  term ((-194 : Rat) / 21) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-311105777369507 : Rat) / 2175803446383) [(3, 1), (4, 2), (11, 1)],
  term ((-11509472182985360 : Rat) / 19582231017447) [(3, 1), (4, 2), (11, 1), (14, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (4, 2), (12, 1), (15, 3)],
  term ((-640 : Rat) / 21) [(3, 1), (4, 2), (13, 1)],
  term ((-29767204022951165 : Rat) / 78328924069788) [(3, 1), (4, 2), (13, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (4, 2), (13, 1), (14, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (4, 2), (13, 1), (15, 2)],
  term ((6042928589578607 : Rat) / 26109641356596) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(3, 1), (4, 2), (14, 2), (15, 1)],
  term ((-75424944733720517 : Rat) / 156657848139576) [(3, 1), (4, 2), (15, 1)],
  term ((93440 : Rat) / 3087) [(3, 1), (4, 2), (15, 3)],
  term ((194560 : Rat) / 343) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (5, 1), (15, 4)],
  term ((10813215080142800 : Rat) / 19582231017447) [(3, 1), (5, 2), (6, 1), (11, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (5, 2), (6, 1), (12, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (5, 2), (6, 1), (13, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (5, 2), (6, 1), (13, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(3, 1), (5, 2), (6, 1), (14, 1), (15, 1)],
  term ((-5276120282676857 : Rat) / 3729948765228) [(3, 1), (5, 2), (6, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (5, 2), (6, 1), (15, 3)],
  term ((11510454542524643 : Rat) / 39164462034894) [(3, 1), (5, 2), (7, 1)],
  term ((-4418471521965217 : Rat) / 78328924069788) [(3, 1), (5, 2), (7, 1), (10, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (5, 2), (7, 1), (12, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2)],
  term ((51465843808083379 : Rat) / 52219282713192) [(3, 1), (5, 2), (7, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (5, 2), (7, 1), (14, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(3, 1), (5, 2), (7, 1), (15, 2)],
  term ((640 : Rat) / 21) [(3, 1), (5, 2), (9, 1)],
  term ((8121862279687 : Rat) / 13489868952) [(3, 1), (5, 2), (9, 1), (10, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (5, 2), (9, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(3, 1), (5, 2), (9, 1), (15, 2)],
  term ((-1024430348060099 : Rat) / 4351606892766) [(3, 1), (5, 2), (10, 1), (11, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(3, 1), (5, 2), (10, 1), (13, 1)],
  term ((505 : Rat) / 42) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((104270354348416189 : Rat) / 78328924069788) [(3, 1), (5, 2), (10, 1), (15, 1)],
  term ((-194 : Rat) / 21) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-311105777369507 : Rat) / 2175803446383) [(3, 1), (5, 2), (11, 1)],
  term ((-11509472182985360 : Rat) / 19582231017447) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (5, 2), (12, 1), (15, 3)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 2), (13, 1)],
  term ((-29767204022951165 : Rat) / 78328924069788) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (5, 2), (13, 1), (14, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((6042928589578607 : Rat) / 26109641356596) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(3, 1), (5, 2), (14, 2), (15, 1)],
  term ((-75424944733720517 : Rat) / 156657848139576) [(3, 1), (5, 2), (15, 1)],
  term ((93440 : Rat) / 3087) [(3, 1), (5, 2), (15, 3)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 3), (15, 2)],
  term ((21626430160285600 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-10813215080142800 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-10813215080142800 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 2), (15, 2)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 4)],
  term ((-5276120282676857 : Rat) / 1864974382614) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-93440 : Rat) / 343) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((5501922947155577 : Rat) / 3729948765228) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (14, 2), (15, 3)],
  term ((-93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 3), (15, 1)],
  term ((5276120282676857 : Rat) / 3729948765228) [(3, 1), (6, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 5)],
  term ((-4418471521965217 : Rat) / 39164462034894) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((4418471521965217 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((4418471521965217 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((24461034731900285 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (12, 1), (14, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 4)],
  term ((11510454542524643 : Rat) / 19582231017447) [(3, 1), (7, 1), (14, 1)],
  term ((-54627081110785459 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 4)],
  term ((131376622339200851 : Rat) / 78328924069788) [(3, 1), (7, 1), (14, 2)],
  term ((93440 : Rat) / 343) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-51465843808083379 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 3), (15, 2)],
  term ((-11510454542524643 : Rat) / 39164462034894) [(3, 1), (7, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(3, 1), (7, 1), (15, 4)],
  term ((8121862279687 : Rat) / 6744934476) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-8121862279687 : Rat) / 13489868952) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((-8121862279687 : Rat) / 13489868952) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((1280 : Rat) / 21) [(3, 1), (9, 1), (14, 1)],
  term ((-178880 : Rat) / 343) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-2560 : Rat) / 21) [(3, 1), (9, 1), (14, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((320 : Rat) / 7) [(3, 1), (9, 1), (14, 3)],
  term ((-640 : Rat) / 21) [(3, 1), (9, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (15, 4)],
  term ((-1024430348060099 : Rat) / 2175803446383) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((1024430348060099 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((1024430348060099 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-333576329821813 : Rat) / 266424911802) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((505 : Rat) / 21) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-505 : Rat) / 42) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-505 : Rat) / 42) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((104270354348416189 : Rat) / 39164462034894) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-388 : Rat) / 21) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-104270354348416189 : Rat) / 78328924069788) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((194 : Rat) / 21) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-104270354348416189 : Rat) / 78328924069788) [(3, 1), (10, 1), (15, 3)],
  term ((194 : Rat) / 21) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-622211554739014 : Rat) / 2175803446383) [(3, 1), (11, 1), (14, 1)],
  term ((11509472182985360 : Rat) / 19582231017447) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-20218992369645157 : Rat) / 19582231017447) [(3, 1), (11, 1), (14, 2)],
  term ((11509472182985360 : Rat) / 19582231017447) [(3, 1), (11, 1), (14, 3)],
  term ((311105777369507 : Rat) / 2175803446383) [(3, 1), (11, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((320 : Rat) / 21) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (12, 1), (14, 2), (15, 3)],
  term ((320 : Rat) / 21) [(3, 1), (12, 1), (15, 3)],
  term ((-186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 5)],
  term ((-1280 : Rat) / 21) [(3, 1), (13, 1), (14, 1)],
  term ((74197744743120125 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 4)],
  term ((-28573620418078205 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 2)],
  term ((-1249280 : Rat) / 3087) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((29767204022951165 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 3), (15, 2)],
  term ((640 : Rat) / 21) [(3, 1), (13, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (13, 1), (15, 4)],
  term ((-75424944733720517 : Rat) / 78328924069788) [(3, 1), (14, 1), (15, 1)],
  term ((-4462309938227567 : Rat) / 26109641356596) [(3, 1), (14, 1), (15, 3)],
  term ((21134298258380543 : Rat) / 22379692591368) [(3, 1), (14, 2), (15, 1)],
  term ((-7623547240929647 : Rat) / 26109641356596) [(3, 1), (14, 3), (15, 1)],
  term ((93440 : Rat) / 3087) [(3, 1), (14, 4), (15, 1)],
  term ((75424944733720517 : Rat) / 156657848139576) [(3, 1), (15, 3)],
  term ((-93440 : Rat) / 3087) [(3, 1), (15, 5)],
  term ((1328274198856205 : Rat) / 13054820678298) [(3, 2), (4, 1)],
  term ((1372480999036685 : Rat) / 6527410339149) [(3, 2), (4, 1), (10, 1)],
  term ((-1280 : Rat) / 21) [(3, 2), (4, 1), (14, 1)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(3, 2), (4, 2)],
  term ((-1372480999036685 : Rat) / 13054820678298) [(3, 2), (4, 2), (10, 1)],
  term ((640 : Rat) / 21) [(3, 2), (4, 2), (14, 1)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(3, 2), (5, 2)],
  term ((-1372480999036685 : Rat) / 13054820678298) [(3, 2), (5, 2), (10, 1)],
  term ((640 : Rat) / 21) [(3, 2), (5, 2), (14, 1)],
  term ((-1372480999036685 : Rat) / 6527410339149) [(3, 2), (10, 1), (14, 1)],
  term ((1372480999036685 : Rat) / 13054820678298) [(3, 2), (10, 1), (14, 2)],
  term ((1372480999036685 : Rat) / 13054820678298) [(3, 2), (10, 1), (15, 2)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(3, 2), (14, 1)],
  term ((-640 : Rat) / 21) [(3, 2), (14, 1), (15, 2)],
  term ((2919719005353485 : Rat) / 26109641356596) [(3, 2), (14, 2)],
  term ((-640 : Rat) / 21) [(3, 2), (14, 3)],
  term ((1328274198856205 : Rat) / 26109641356596) [(3, 2), (15, 2)],
  term ((-16 : Rat) / 3) [(4, 1), (5, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1), (5, 2)],
  term ((-3679075579250557 : Rat) / 8703213785532) [(4, 1), (6, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(4, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-11548189763031433 : Rat) / 6527410339149) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((1288941318816035 : Rat) / 399637367703) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-239616 : Rat) / 553) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-941242657 : Rat) / 83270796) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-725 : Rat) / 42) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((314 : Rat) / 21) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((27838687559453 : Rat) / 20234803428) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((725 : Rat) / 14) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-223273978116670483 : Rat) / 52219282713192) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-314 : Rat) / 7) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((79407948033839 : Rat) / 5802142523688) [(4, 1), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 166541592) [(4, 1), (6, 1), (9, 2), (12, 1)],
  term ((11208305311973983 : Rat) / 8703213785532) [(4, 1), (6, 1), (10, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(4, 1), (6, 1), (10, 1), (14, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-45633955946145352 : Rat) / 19582231017447) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-174698622767525 : Rat) / 13054820678298) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((64 : Rat) / 9) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((7337393541563251 : Rat) / 13054820678298) [(4, 1), (6, 1), (11, 2)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1495 : Rat) / 126) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 165250894662) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-494 : Rat) / 63) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((845559837599 : Rat) / 241755938487) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((21692829505604683 : Rat) / 4351606892766) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-3589 : Rat) / 126) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(4, 1), (6, 1), (13, 2)],
  term ((-340 : Rat) / 63) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-3021914984422465 : Rat) / 2901071261844) [(4, 1), (6, 1), (14, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(4, 1), (6, 1), (14, 2)],
  term ((-7172661377277335 : Rat) / 2175803446383) [(4, 1), (6, 1), (15, 2)],
  term ((494 : Rat) / 21) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-417278377569675749 : Rat) / 313315696279152) [(4, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(4, 1), (7, 1), (9, 1), (10, 1)],
  term ((3849005354029 : Rat) / 1289365005264) [(4, 1), (7, 1), (9, 1), (12, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(4, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 52219282713192) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((1343248370880734 : Rat) / 6527410339149) [(4, 1), (7, 1), (10, 1), (11, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((1556277381736670 : Rat) / 725267815461) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((64 : Rat) / 9) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24982748456159909 : Rat) / 26109641356596) [(4, 1), (7, 1), (11, 1)],
  term ((333108 : Rat) / 553) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((13457044086328300 : Rat) / 6527410339149) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 166541592) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(4, 1), (14, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (14, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (15, 2)],
  term ((1994038900525423 : Rat) / 8703213785532) [(4, 2)],
  term ((8 : Rat) / 3) [(4, 2), (5, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((3679075579250557 : Rat) / 17406427571064) [(4, 2), (6, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(4, 2), (6, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(4, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((11548189763031433 : Rat) / 13054820678298) [(4, 2), (6, 1), (7, 1), (11, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(4, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-1288941318816035 : Rat) / 799274735406) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(4, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((941242657 : Rat) / 166541592) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 84) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27838687559453 : Rat) / 40469606856) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 28) [(4, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((223273978116670483 : Rat) / 104438565426384) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((157 : Rat) / 7) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-79407948033839 : Rat) / 11604285047376) [(4, 2), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 333083184) [(4, 2), (6, 1), (9, 2), (12, 1)],
  term ((-11208305311973983 : Rat) / 17406427571064) [(4, 2), (6, 1), (10, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(4, 2), (6, 1), (10, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(4, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((22816977973072676 : Rat) / 19582231017447) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(4, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((174698622767525 : Rat) / 26109641356596) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7337393541563251 : Rat) / 26109641356596) [(4, 2), (6, 1), (11, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 252) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(4, 2), (6, 1), (12, 1), (15, 2)],
  term ((247 : Rat) / 63) [(4, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(4, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 8703213785532) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((3589 : Rat) / 252) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(4, 2), (6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(4, 2), (6, 1), (13, 2), (16, 1)],
  term ((3021914984422465 : Rat) / 5802142523688) [(4, 2), (6, 1), (14, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(4, 2), (6, 1), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(4, 2), (6, 1), (14, 2)],
  term ((7172661377277335 : Rat) / 4351606892766) [(4, 2), (6, 1), (15, 2)],
  term ((-247 : Rat) / 21) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((417278377569675749 : Rat) / 626631392558304) [(4, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(4, 2), (7, 1), (9, 1), (10, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(4, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-671624185440367 : Rat) / 6527410339149) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((170 : Rat) / 63) [(4, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-778138690868335 : Rat) / 725267815461) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((24982748456159909 : Rat) / 52219282713192) [(4, 2), (7, 1), (11, 1)],
  term ((-166554 : Rat) / 553) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(4, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-6728522043164150 : Rat) / 6527410339149) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((-941242657 : Rat) / 333083184) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 3)],
  term ((16 : Rat) / 3) [(5, 1), (14, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (14, 2), (15, 1)],
  term ((2 : Rat) / 3) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (15, 3)],
  term ((2 : Rat) / 3) [(5, 1), (15, 3), (16, 1)],
  term ((3679075579250557 : Rat) / 17406427571064) [(5, 2), (6, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(5, 2), (6, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(5, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((11548189763031433 : Rat) / 13054820678298) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(5, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-1288941318816035 : Rat) / 799274735406) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((941242657 : Rat) / 166541592) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 84) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27838687559453 : Rat) / 40469606856) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 28) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((223273978116670483 : Rat) / 104438565426384) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((157 : Rat) / 7) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-79407948033839 : Rat) / 11604285047376) [(5, 2), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 333083184) [(5, 2), (6, 1), (9, 2), (12, 1)],
  term ((-11208305311973983 : Rat) / 17406427571064) [(5, 2), (6, 1), (10, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(5, 2), (6, 1), (10, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((22816977973072676 : Rat) / 19582231017447) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(5, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((174698622767525 : Rat) / 26109641356596) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7337393541563251 : Rat) / 26109641356596) [(5, 2), (6, 1), (11, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 252) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(5, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(5, 2), (6, 1), (12, 1), (15, 2)],
  term ((247 : Rat) / 63) [(5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(5, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 8703213785532) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((3589 : Rat) / 252) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(5, 2), (6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(5, 2), (6, 1), (13, 2), (16, 1)],
  term ((3021914984422465 : Rat) / 5802142523688) [(5, 2), (6, 1), (14, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(5, 2), (6, 1), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(5, 2), (6, 1), (14, 2)],
  term ((7172661377277335 : Rat) / 4351606892766) [(5, 2), (6, 1), (15, 2)],
  term ((-247 : Rat) / 21) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((417278377569675749 : Rat) / 626631392558304) [(5, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(5, 2), (7, 1), (9, 1), (10, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-671624185440367 : Rat) / 6527410339149) [(5, 2), (7, 1), (10, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((170 : Rat) / 63) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-778138690868335 : Rat) / 725267815461) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((24982748456159909 : Rat) / 52219282713192) [(5, 2), (7, 1), (11, 1)],
  term ((-166554 : Rat) / 553) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-6728522043164150 : Rat) / 6527410339149) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-941242657 : Rat) / 333083184) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((8 : Rat) / 3) [(5, 3), (15, 1)],
  term ((-2 : Rat) / 3) [(5, 3), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (7, 1), (9, 1), (15, 2)],
  term ((11548189763031433 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((-11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 3)],
  term ((4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (15, 3)],
  term ((239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1288941318816035 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((1288941318816035 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((1288941318816035 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 3)],
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-27838687559453 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 14) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((27838687559453 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((725 : Rat) / 28) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((27838687559453 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((725 : Rat) / 28) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((223273978116670483 : Rat) / 52219282713192) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((314 : Rat) / 7) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-223273978116670483 : Rat) / 104438565426384) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-157 : Rat) / 7) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-223273978116670483 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 3)],
  term ((-157 : Rat) / 7) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (14, 2)],
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (15, 2)],
  term ((-79407948033839 : Rat) / 5802142523688) [(6, 1), (9, 2), (14, 1)],
  term ((79407948033839 : Rat) / 11604285047376) [(6, 1), (9, 2), (14, 2)],
  term ((79407948033839 : Rat) / 11604285047376) [(6, 1), (9, 2), (15, 2)],
  term ((-11208305311973983 : Rat) / 8703213785532) [(6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((10026213244374967 : Rat) / 17406427571064) [(6, 1), (10, 1), (14, 2)],
  term ((1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 3)],
  term ((11208305311973983 : Rat) / 17406427571064) [(6, 1), (10, 1), (15, 2)],
  term ((706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((45633955946145352 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((174698622767525 : Rat) / 13054820678298) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 3)],
  term ((5782494132793867 : Rat) / 26109641356596) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 3), (15, 1)],
  term ((-174698622767525 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 3)],
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-7337393541563251 : Rat) / 13054820678298) [(6, 1), (11, 2), (14, 1)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2), (14, 2)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2), (15, 2)],
  term ((2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1495 : Rat) / 126) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-140138745041977 : Rat) / 165250894662) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((494 : Rat) / 63) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 4)],
  term ((2007079605156697 : Rat) / 3729948765228) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-247 : Rat) / 63) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 3), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 4)],
  term ((-247 : Rat) / 63) [(6, 1), (12, 1), (15, 4), (16, 1)],
  term ((-21692829505604683 : Rat) / 4351606892766) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((3589 : Rat) / 126) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((21662389351451119 : Rat) / 8703213785532) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3589 : Rat) / 252) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 3), (15, 1)],
  term ((21692829505604683 : Rat) / 8703213785532) [(6, 1), (13, 1), (15, 3)],
  term ((-3589 : Rat) / 252) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (13, 2), (14, 1)],
  term ((340 : Rat) / 63) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2), (14, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2), (15, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((3679075579250557 : Rat) / 8703213785532) [(6, 1), (14, 1)],
  term ((48315546064951285 : Rat) / 17406427571064) [(6, 1), (14, 1), (15, 2)],
  term ((-494 : Rat) / 21) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 4)],
  term ((182941953509927 : Rat) / 220334526216) [(6, 1), (14, 2)],
  term ((-2438298961283131 : Rat) / 1243316255076) [(6, 1), (14, 2), (15, 2)],
  term ((247 : Rat) / 21) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-68632997052253 : Rat) / 118411071912) [(6, 1), (14, 3)],
  term ((4596599348427 : Rat) / 26861770943) [(6, 1), (14, 3), (15, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(6, 1), (14, 4)],
  term ((-3679075579250557 : Rat) / 17406427571064) [(6, 1), (15, 2)],
  term ((-7172661377277335 : Rat) / 4351606892766) [(6, 1), (15, 4)],
  term ((247 : Rat) / 21) [(6, 1), (15, 4), (16, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term ((-3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((833621446838322451 : Rat) / 626631392558304) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 3)],
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((417278377569675749 : Rat) / 313315696279152) [(7, 1), (9, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-413072574594187199 : Rat) / 89518770365472) [(7, 1), (9, 1), (14, 2)],
  term ((206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 3)],
  term ((-417278377569675749 : Rat) / 626631392558304) [(7, 1), (9, 1), (15, 2)],
  term ((-1343248370880734 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((560763766053622 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1556277381736670 : Rat) / 725267815461) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((32 : Rat) / 9) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (15, 3)],
  term ((32 : Rat) / 9) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-333108 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((1259820843227552 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 3)],
  term ((166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((24982748456159909 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1)],
  term ((6728522043164150 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1678975963883371 : Rat) / 661003578648) [(7, 1), (11, 1), (14, 2)],
  term ((6728522043164150 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 3)],
  term ((-24982748456159909 : Rat) / 52219282713192) [(7, 1), (11, 1), (15, 2)],
  term ((-941242657 : Rat) / 166541592) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 299. -/
theorem rs_R009_ueqv_R009YNNNN_block_05_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_05_0200_0299
      rs_R009_ueqv_R009YNNNN_block_05_0200_0299 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
