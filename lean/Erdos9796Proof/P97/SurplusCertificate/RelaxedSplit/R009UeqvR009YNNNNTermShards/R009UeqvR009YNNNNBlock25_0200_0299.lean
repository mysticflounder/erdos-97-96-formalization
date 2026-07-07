/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 25:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0200 : Poly :=
[
  term ((-44359900237595099 : Rat) / 52219282713192) [(3, 1), (15, 1)]
]

/-- Partial product 200 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0200 : Poly :=
[
  term ((44359900237595099 : Rat) / 26109641356596) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-44359900237595099 : Rat) / 52219282713192) [(0, 2), (3, 1), (15, 1)],
  term ((44359900237595099 : Rat) / 26109641356596) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-44359900237595099 : Rat) / 52219282713192) [(1, 2), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0200
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0201 : Poly :=
[
  term ((93440 : Rat) / 3087) [(3, 1), (15, 3)]
]

/-- Partial product 201 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0201 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((93440 : Rat) / 3087) [(0, 2), (3, 1), (15, 3)],
  term ((-186880 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((93440 : Rat) / 3087) [(1, 2), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0201
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0202 : Poly :=
[
  term ((8 : Rat) / 3) [(5, 1), (15, 1)]
]

/-- Partial product 202 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0202 : Poly :=
[
  term ((-16 : Rat) / 3) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((8 : Rat) / 3) [(0, 2), (5, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(1, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0202
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0203 : Poly :=
[
  term ((-2 : Rat) / 3) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0203 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0203
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0204 : Poly :=
[
  term ((-1447371201224659 : Rat) / 2901071261844) [(6, 1)]
]

/-- Partial product 204 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0204 : Poly :=
[
  term ((1447371201224659 : Rat) / 1450535630922) [(0, 1), (6, 1), (12, 1)],
  term ((-1447371201224659 : Rat) / 2901071261844) [(0, 2), (6, 1)],
  term ((1447371201224659 : Rat) / 1450535630922) [(1, 1), (6, 1), (13, 1)],
  term ((-1447371201224659 : Rat) / 2901071261844) [(1, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0204
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0205 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 205 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0205 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 2), (6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0205
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0206 : Poly :=
[
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 206 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0206 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 2)],
  term ((1532199782809 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0206
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0207 : Poly :=
[
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 207 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0207 : Poly :=
[
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0207
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0208 : Poly :=
[
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 208 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0208 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0208
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0209 : Poly :=
[
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 209 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0209 : Poly :=
[
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((2237011682901140 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0209
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0210 : Poly :=
[
  term ((-4101698818579693 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 210 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0210 : Poly :=
[
  term ((4101698818579693 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4101698818579693 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((4101698818579693 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-4101698818579693 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0210
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0211 : Poly :=
[
  term ((-1288941318816035 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 211 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0211 : Poly :=
[
  term ((1288941318816035 : Rat) / 399637367703) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1288941318816035 : Rat) / 799274735406) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((1288941318816035 : Rat) / 399637367703) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1288941318816035 : Rat) / 799274735406) [(1, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0211
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0212 : Poly :=
[
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 212 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0212 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 2)],
  term ((119808 : Rat) / 553) [(0, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (6, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0212
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0213 : Poly :=
[
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 213 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0213 : Poly :=
[
  term ((-941242657 : Rat) / 83270796) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((941242657 : Rat) / 166541592) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0213
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0214 : Poly :=
[
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 214 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0214 : Poly :=
[
  term ((-725 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0214
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0215 : Poly :=
[
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 215 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0215 : Poly :=
[
  term ((223016262790904647 : Rat) / 156657848139576) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0215
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0216 : Poly :=
[
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0216 : Poly :=
[
  term ((314 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0216
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0217 : Poly :=
[
  term ((-27838687559453 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 217 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0217 : Poly :=
[
  term ((27838687559453 : Rat) / 20234803428) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-27838687559453 : Rat) / 40469606856) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((27838687559453 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((-27838687559453 : Rat) / 40469606856) [(1, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0217
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0218 : Poly :=
[
  term ((-725 : Rat) / 28) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 218 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0218 : Poly :=
[
  term ((725 : Rat) / 14) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 14) [(1, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 28) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0218
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0219 : Poly :=
[
  term ((249392288927861449 : Rat) / 313315696279152) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 219 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0219 : Poly :=
[
  term ((-249392288927861449 : Rat) / 156657848139576) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((249392288927861449 : Rat) / 313315696279152) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-249392288927861449 : Rat) / 156657848139576) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((249392288927861449 : Rat) / 313315696279152) [(1, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0219
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0220 : Poly :=
[
  term ((157 : Rat) / 7) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0220 : Poly :=
[
  term ((-314 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 7) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 7) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 7) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0220
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0221 : Poly :=
[
  term ((-79407948033839 : Rat) / 11604285047376) [(6, 1), (9, 2)]
]

/-- Partial product 221 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0221 : Poly :=
[
  term ((79407948033839 : Rat) / 5802142523688) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((-79407948033839 : Rat) / 11604285047376) [(0, 2), (6, 1), (9, 2)],
  term ((79407948033839 : Rat) / 5802142523688) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((-79407948033839 : Rat) / 11604285047376) [(1, 2), (6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0221
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0222 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1)]
]

/-- Partial product 222 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0222 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(0, 1), (6, 1), (9, 2), (12, 2)],
  term ((-2172201733 : Rat) / 333083184) [(0, 2), (6, 1), (9, 2), (12, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((-2172201733 : Rat) / 333083184) [(1, 2), (6, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0222
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0223 : Poly :=
[
  term ((18669123962701 : Rat) / 414438751692) [(6, 1), (10, 1)]
]

/-- Partial product 223 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0223 : Poly :=
[
  term ((-18669123962701 : Rat) / 207219375846) [(0, 1), (6, 1), (10, 1), (12, 1)],
  term ((18669123962701 : Rat) / 414438751692) [(0, 2), (6, 1), (10, 1)],
  term ((-18669123962701 : Rat) / 207219375846) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((18669123962701 : Rat) / 414438751692) [(1, 2), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0223
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0224 : Poly :=
[
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1)]
]

/-- Partial product 224 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0224 : Poly :=
[
  term ((1005180329591 : Rat) / 14801383989) [(0, 1), (6, 1), (10, 1), (12, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(0, 2), (6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(1, 2), (6, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0224
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0225 : Poly :=
[
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 225 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0225 : Poly :=
[
  term ((-706121836024930 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0225
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0226 : Poly :=
[
  term ((22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 226 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0226 : Poly :=
[
  term ((-45633955946145352 : Rat) / 19582231017447) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((22816977973072676 : Rat) / 19582231017447) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-45633955946145352 : Rat) / 19582231017447) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((22816977973072676 : Rat) / 19582231017447) [(1, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0226
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0227 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 227 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0227 : Poly :=
[
  term ((-340 : Rat) / 63) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0227
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0228 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 228 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0228 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0228
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0229 : Poly :=
[
  term ((87732728901446 : Rat) / 2175803446383) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 229 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0229 : Poly :=
[
  term ((-175465457802892 : Rat) / 2175803446383) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((87732728901446 : Rat) / 2175803446383) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-175465457802892 : Rat) / 2175803446383) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((87732728901446 : Rat) / 2175803446383) [(1, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0229
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0230 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0230 : Poly :=
[
  term ((64 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0230
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0231 : Poly :=
[
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2)]
]

/-- Partial product 231 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0231 : Poly :=
[
  term ((-6891415608682258 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 2), (12, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 2)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0231
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0232 : Poly :=
[
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 232 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0232 : Poly :=
[
  term ((-2224986028928059 : Rat) / 1598549470812) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0232
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0233 : Poly :=
[
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0233 : Poly :=
[
  term ((1495 : Rat) / 126) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0233
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0234 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 234 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0234 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0234
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0235 : Poly :=
[
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 235 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0235 : Poly :=
[
  term ((140138745041977 : Rat) / 165250894662) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((140138745041977 : Rat) / 165250894662) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(1, 2), (6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0235
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0236 : Poly :=
[
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0236 : Poly :=
[
  term ((-494 : Rat) / 63) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-494 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0236
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0237 : Poly :=
[
  term ((-845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 237 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0237 : Poly :=
[
  term ((845559837599 : Rat) / 241755938487) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((845559837599 : Rat) / 241755938487) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0237
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0238 : Poly :=
[
  term ((-85325767403932235 : Rat) / 78328924069788) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 238 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0238 : Poly :=
[
  term ((85325767403932235 : Rat) / 39164462034894) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-85325767403932235 : Rat) / 78328924069788) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((85325767403932235 : Rat) / 39164462034894) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-85325767403932235 : Rat) / 78328924069788) [(1, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0238
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0239 : Poly :=
[
  term ((707 : Rat) / 36) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0239 : Poly :=
[
  term ((-707 : Rat) / 18) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((707 : Rat) / 36) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-707 : Rat) / 18) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((707 : Rat) / 36) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0239_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0239
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0240 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)]
]

/-- Partial product 240 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0240 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 2)],
  term ((-560763766053622 : Rat) / 399637367703) [(1, 1), (6, 1), (13, 3)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0240_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0240
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0241 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 241 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0241 : Poly :=
[
  term ((-340 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0241_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0241
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0242 : Poly :=
[
  term ((3109727131719745 : Rat) / 5802142523688) [(6, 1), (14, 1)]
]

/-- Partial product 242 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0242 : Poly :=
[
  term ((-3109727131719745 : Rat) / 2901071261844) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((3109727131719745 : Rat) / 5802142523688) [(0, 2), (6, 1), (14, 1)],
  term ((-3109727131719745 : Rat) / 2901071261844) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((3109727131719745 : Rat) / 5802142523688) [(1, 2), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0242_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0242
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0243 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 243 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0243 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0243_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0243
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0244 : Poly :=
[
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (14, 2)]
]

/-- Partial product 244 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0244 : Poly :=
[
  term ((28425155928161 : Rat) / 483511876974) [(0, 1), (6, 1), (12, 1), (14, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(0, 2), (6, 1), (14, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(1, 2), (6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0244_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0244
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0245 : Poly :=
[
  term ((7764931457384161 : Rat) / 26109641356596) [(6, 1), (15, 2)]
]

/-- Partial product 245 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0245 : Poly :=
[
  term ((-7764931457384161 : Rat) / 13054820678298) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((7764931457384161 : Rat) / 26109641356596) [(0, 2), (6, 1), (15, 2)],
  term ((-7764931457384161 : Rat) / 13054820678298) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((7764931457384161 : Rat) / 26109641356596) [(1, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0245_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0245
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0246 : Poly :=
[
  term ((-1189 : Rat) / 63) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 246 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0246 : Poly :=
[
  term ((2378 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1189 : Rat) / 63) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((2378 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1189 : Rat) / 63) [(1, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0246_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0246
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0247 : Poly :=
[
  term ((-12968180462857 : Rat) / 2578730010528) [(7, 1), (9, 1)]
]

/-- Partial product 247 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0247 : Poly :=
[
  term ((12968180462857 : Rat) / 1289365005264) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-12968180462857 : Rat) / 2578730010528) [(0, 2), (7, 1), (9, 1)],
  term ((12968180462857 : Rat) / 1289365005264) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-12968180462857 : Rat) / 2578730010528) [(1, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0247_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0247
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0248 : Poly :=
[
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 248 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0248 : Poly :=
[
  term ((3849005354029 : Rat) / 1289365005264) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((-3849005354029 : Rat) / 2578730010528) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((3849005354029 : Rat) / 1289365005264) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(1, 2), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0248_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0248
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0249 : Poly :=
[
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 249 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0249 : Poly :=
[
  term ((-53777198303881 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0249_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0249
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0250 : Poly :=
[
  term ((-198127765725258661 : Rat) / 313315696279152) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 250 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0250 : Poly :=
[
  term ((198127765725258661 : Rat) / 156657848139576) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-198127765725258661 : Rat) / 313315696279152) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((198127765725258661 : Rat) / 156657848139576) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-198127765725258661 : Rat) / 313315696279152) [(1, 2), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0250_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0250
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0251 : Poly :=
[
  term ((18472825908142915 : Rat) / 8703213785532) [(7, 1), (11, 1)]
]

/-- Partial product 251 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0251 : Poly :=
[
  term ((-18472825908142915 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((18472825908142915 : Rat) / 8703213785532) [(0, 2), (7, 1), (11, 1)],
  term ((-18472825908142915 : Rat) / 4351606892766) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((18472825908142915 : Rat) / 8703213785532) [(1, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0251_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0251
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0252 : Poly :=
[
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 252 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0252 : Poly :=
[
  term ((333108 : Rat) / 553) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-166554 : Rat) / 553) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((333108 : Rat) / 553) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-166554 : Rat) / 553) [(1, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0252_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0252
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0253 : Poly :=
[
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 253 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0253 : Poly :=
[
  term ((706121836024930 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0253_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0253
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0254 : Poly :=
[
  term ((-919021700700953 : Rat) / 967023753948) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 254 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0254 : Poly :=
[
  term ((919021700700953 : Rat) / 483511876974) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-919021700700953 : Rat) / 967023753948) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((919021700700953 : Rat) / 483511876974) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-919021700700953 : Rat) / 967023753948) [(1, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0254_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0254
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0255 : Poly :=
[
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 255 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0255 : Poly :=
[
  term ((941242657 : Rat) / 166541592) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-941242657 : Rat) / 333083184) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-941242657 : Rat) / 333083184) [(1, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0255_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0255
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0256 : Poly :=
[
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 256 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0256 : Poly :=
[
  term ((2224986028928059 : Rat) / 1598549470812) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0256_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0256
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0257 : Poly :=
[
  term ((1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 257 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0257 : Poly :=
[
  term ((-1495 : Rat) / 126) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0257_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0257
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0258 : Poly :=
[
  term ((-725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0258 : Poly :=
[
  term ((725 : Rat) / 84) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 168) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0258_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0258
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0259 : Poly :=
[
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 259 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0259 : Poly :=
[
  term ((-150142660556857 : Rat) / 165250894662) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0259_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0259
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0260 : Poly :=
[
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0260 : Poly :=
[
  term ((494 : Rat) / 63) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0260_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0260
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0261 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 261 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0261 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (7, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0261_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0261
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0262 : Poly :=
[
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 262 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0262 : Poly :=
[
  term ((-148780745730977 : Rat) / 2901071261844) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-148780745730977 : Rat) / 2901071261844) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(1, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0262_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0262
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0263 : Poly :=
[
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0263 : Poly :=
[
  term ((-157 : Rat) / 21) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0263_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0263
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0264 : Poly :=
[
  term ((812380957570663 : Rat) / 11604285047376) [(7, 1), (13, 1)]
]

/-- Partial product 264 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0264 : Poly :=
[
  term ((-812380957570663 : Rat) / 5802142523688) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((812380957570663 : Rat) / 11604285047376) [(0, 2), (7, 1), (13, 1)],
  term ((-812380957570663 : Rat) / 5802142523688) [(1, 1), (7, 1), (13, 2)],
  term ((812380957570663 : Rat) / 11604285047376) [(1, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0264_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0264
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0265 : Poly :=
[
  term ((39830630716677613 : Rat) / 156657848139576) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 265 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0265 : Poly :=
[
  term ((-39830630716677613 : Rat) / 78328924069788) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((39830630716677613 : Rat) / 156657848139576) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-39830630716677613 : Rat) / 78328924069788) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((39830630716677613 : Rat) / 156657848139576) [(1, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0265_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0265
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0266 : Poly :=
[
  term ((-835 : Rat) / 36) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 266 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0266 : Poly :=
[
  term ((835 : Rat) / 18) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-835 : Rat) / 36) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((835 : Rat) / 18) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-835 : Rat) / 36) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0266_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0266
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0267 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 267 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0267 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 2), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 2), (7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0267_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0267
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0268 : Poly :=
[
  term ((725 : Rat) / 56) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 268 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0268 : Poly :=
[
  term ((-725 : Rat) / 28) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 56) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 56) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0268_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0268
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0269 : Poly :=
[
  term ((-2703004545502594 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 269 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0269 : Poly :=
[
  term ((5406009091005188 : Rat) / 6527410339149) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2703004545502594 : Rat) / 6527410339149) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((5406009091005188 : Rat) / 6527410339149) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2703004545502594 : Rat) / 6527410339149) [(1, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0269_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0269
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0270 : Poly :=
[
  term ((1189 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0270 : Poly :=
[
  term ((-2378 : Rat) / 63) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1189 : Rat) / 63) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2378 : Rat) / 63) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1189 : Rat) / 63) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0270_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0270
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0271 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 271 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0271 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0271_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0271
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0272 : Poly :=
[
  term ((-639195568324249 : Rat) / 5802142523688) [(7, 1), (15, 1)]
]

/-- Partial product 272 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0272 : Poly :=
[
  term ((639195568324249 : Rat) / 2901071261844) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-639195568324249 : Rat) / 5802142523688) [(0, 2), (7, 1), (15, 1)],
  term ((639195568324249 : Rat) / 2901071261844) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-639195568324249 : Rat) / 5802142523688) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0272_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0272
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0273 : Poly :=
[
  term ((-157 : Rat) / 14) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0273 : Poly :=
[
  term ((157 : Rat) / 7) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 14) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 7) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 14) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0273_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0273
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0274 : Poly :=
[
  term ((-114914983710675 : Rat) / 107447083772) [(7, 2)]
]

/-- Partial product 274 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0274 : Poly :=
[
  term ((114914983710675 : Rat) / 53723541886) [(0, 1), (7, 2), (12, 1)],
  term ((-114914983710675 : Rat) / 107447083772) [(0, 2), (7, 2)],
  term ((114914983710675 : Rat) / 53723541886) [(1, 1), (7, 2), (13, 1)],
  term ((-114914983710675 : Rat) / 107447083772) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0274_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0274
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0275 : Poly :=
[
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1)]
]

/-- Partial product 275 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0275 : Poly :=
[
  term ((1532199782809 : Rat) / 161170625658) [(0, 1), (7, 2), (12, 2)],
  term ((-1532199782809 : Rat) / 322341251316) [(0, 2), (7, 2), (12, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(1, 2), (7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0275_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0275
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0276 : Poly :=
[
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1)]
]

/-- Partial product 276 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0276 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0276_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0276
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0277 : Poly :=
[
  term ((4101698818579693 : Rat) / 13054820678298) [(7, 2), (14, 1)]
]

/-- Partial product 277 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0277 : Poly :=
[
  term ((-4101698818579693 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term ((4101698818579693 : Rat) / 13054820678298) [(0, 2), (7, 2), (14, 1)],
  term ((-4101698818579693 : Rat) / 6527410339149) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((4101698818579693 : Rat) / 13054820678298) [(1, 2), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0277_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0277
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0278 : Poly :=
[
  term ((2496 : Rat) / 79) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 278 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0278 : Poly :=
[
  term ((-4992 : Rat) / 79) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((2496 : Rat) / 79) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4992 : Rat) / 79) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((2496 : Rat) / 79) [(1, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0278_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0278
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0279 : Poly :=
[
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 279 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0279 : Poly :=
[
  term ((9984 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-4992 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((9984 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4992 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0279_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0279
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0280 : Poly :=
[
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 280 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0280 : Poly :=
[
  term ((59904 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-29952 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-29952 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0280_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0280
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0281 : Poly :=
[
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 281 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0281 : Poly :=
[
  term ((-6090608323475 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0281_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0281
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0282 : Poly :=
[
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 282 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0282 : Poly :=
[
  term ((5 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 3) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0282_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0282
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0283 : Poly :=
[
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 283 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0283 : Poly :=
[
  term ((30188368622915 : Rat) / 177616607868) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0283_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0283
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0284 : Poly :=
[
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0284 : Poly :=
[
  term ((-32 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0284_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0284
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0285 : Poly :=
[
  term ((-49159772403685 : Rat) / 1065699647208) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 285 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0285 : Poly :=
[
  term ((49159772403685 : Rat) / 532849823604) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-49159772403685 : Rat) / 1065699647208) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((49159772403685 : Rat) / 532849823604) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-49159772403685 : Rat) / 1065699647208) [(1, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0285_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0285
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0286 : Poly :=
[
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 286 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0286 : Poly :=
[
  term ((8926828802611 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0286_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0286
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0287 : Poly :=
[
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 287 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0287 : Poly :=
[
  term ((55 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0287_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0287
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0288 : Poly :=
[
  term ((235 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 288 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0288 : Poly :=
[
  term ((-235 : Rat) / 84) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((235 : Rat) / 168) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-235 : Rat) / 84) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((235 : Rat) / 168) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0288_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0288
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0289 : Poly :=
[
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 289 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0289 : Poly :=
[
  term ((-170525183774905 : Rat) / 355233215736) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0289_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0289
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0290 : Poly :=
[
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0290 : Poly :=
[
  term ((-22 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0290_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0290
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0291 : Poly :=
[
  term ((-12691597676045 : Rat) / 473644287648) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 291 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0291 : Poly :=
[
  term ((12691597676045 : Rat) / 236822143824) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-12691597676045 : Rat) / 473644287648) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((12691597676045 : Rat) / 236822143824) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-12691597676045 : Rat) / 473644287648) [(1, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0291_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0291
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0292 : Poly :=
[
  term ((-7 : Rat) / 6) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0292 : Poly :=
[
  term ((7 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 3) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0292_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0292
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0293 : Poly :=
[
  term ((1852146342481265 : Rat) / 8525597177664) [(9, 1), (11, 1)]
]

/-- Partial product 293 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0293 : Poly :=
[
  term ((-1852146342481265 : Rat) / 4262798588832) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((1852146342481265 : Rat) / 8525597177664) [(0, 2), (9, 1), (11, 1)],
  term ((-1852146342481265 : Rat) / 4262798588832) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((1852146342481265 : Rat) / 8525597177664) [(1, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0293_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0293
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0294 : Poly :=
[
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 294 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0294 : Poly :=
[
  term ((-33225805736000 : Rat) / 133212455901) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((16612902868000 : Rat) / 133212455901) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-33225805736000 : Rat) / 133212455901) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(1, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0294_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0294
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0295 : Poly :=
[
  term ((2888652791893481 : Rat) / 3197098941624) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 295 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0295 : Poly :=
[
  term ((-2888652791893481 : Rat) / 1598549470812) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((2888652791893481 : Rat) / 3197098941624) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2888652791893481 : Rat) / 1598549470812) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((2888652791893481 : Rat) / 3197098941624) [(1, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0295_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0295
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0296 : Poly :=
[
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 296 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0296 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0296_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0296
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0297 : Poly :=
[
  term ((9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 297 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0297 : Poly :=
[
  term ((-9008294618453 : Rat) / 118411071912) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 118411071912) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(1, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0297_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0297
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0298 : Poly :=
[
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 298 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0298 : Poly :=
[
  term ((97923607474811 : Rat) / 532849823604) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((97923607474811 : Rat) / 532849823604) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(1, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0298_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0298
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0299 : Poly :=
[
  term ((475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 299 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0299 : Poly :=
[
  term ((-475 : Rat) / 42) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((475 : Rat) / 84) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-475 : Rat) / 42) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((475 : Rat) / 84) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0299_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0299
        rs_R009_ueqv_R009YNNNN_generator_25_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_25_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_25_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_25_0200,
  rs_R009_ueqv_R009YNNNN_partial_25_0201,
  rs_R009_ueqv_R009YNNNN_partial_25_0202,
  rs_R009_ueqv_R009YNNNN_partial_25_0203,
  rs_R009_ueqv_R009YNNNN_partial_25_0204,
  rs_R009_ueqv_R009YNNNN_partial_25_0205,
  rs_R009_ueqv_R009YNNNN_partial_25_0206,
  rs_R009_ueqv_R009YNNNN_partial_25_0207,
  rs_R009_ueqv_R009YNNNN_partial_25_0208,
  rs_R009_ueqv_R009YNNNN_partial_25_0209,
  rs_R009_ueqv_R009YNNNN_partial_25_0210,
  rs_R009_ueqv_R009YNNNN_partial_25_0211,
  rs_R009_ueqv_R009YNNNN_partial_25_0212,
  rs_R009_ueqv_R009YNNNN_partial_25_0213,
  rs_R009_ueqv_R009YNNNN_partial_25_0214,
  rs_R009_ueqv_R009YNNNN_partial_25_0215,
  rs_R009_ueqv_R009YNNNN_partial_25_0216,
  rs_R009_ueqv_R009YNNNN_partial_25_0217,
  rs_R009_ueqv_R009YNNNN_partial_25_0218,
  rs_R009_ueqv_R009YNNNN_partial_25_0219,
  rs_R009_ueqv_R009YNNNN_partial_25_0220,
  rs_R009_ueqv_R009YNNNN_partial_25_0221,
  rs_R009_ueqv_R009YNNNN_partial_25_0222,
  rs_R009_ueqv_R009YNNNN_partial_25_0223,
  rs_R009_ueqv_R009YNNNN_partial_25_0224,
  rs_R009_ueqv_R009YNNNN_partial_25_0225,
  rs_R009_ueqv_R009YNNNN_partial_25_0226,
  rs_R009_ueqv_R009YNNNN_partial_25_0227,
  rs_R009_ueqv_R009YNNNN_partial_25_0228,
  rs_R009_ueqv_R009YNNNN_partial_25_0229,
  rs_R009_ueqv_R009YNNNN_partial_25_0230,
  rs_R009_ueqv_R009YNNNN_partial_25_0231,
  rs_R009_ueqv_R009YNNNN_partial_25_0232,
  rs_R009_ueqv_R009YNNNN_partial_25_0233,
  rs_R009_ueqv_R009YNNNN_partial_25_0234,
  rs_R009_ueqv_R009YNNNN_partial_25_0235,
  rs_R009_ueqv_R009YNNNN_partial_25_0236,
  rs_R009_ueqv_R009YNNNN_partial_25_0237,
  rs_R009_ueqv_R009YNNNN_partial_25_0238,
  rs_R009_ueqv_R009YNNNN_partial_25_0239,
  rs_R009_ueqv_R009YNNNN_partial_25_0240,
  rs_R009_ueqv_R009YNNNN_partial_25_0241,
  rs_R009_ueqv_R009YNNNN_partial_25_0242,
  rs_R009_ueqv_R009YNNNN_partial_25_0243,
  rs_R009_ueqv_R009YNNNN_partial_25_0244,
  rs_R009_ueqv_R009YNNNN_partial_25_0245,
  rs_R009_ueqv_R009YNNNN_partial_25_0246,
  rs_R009_ueqv_R009YNNNN_partial_25_0247,
  rs_R009_ueqv_R009YNNNN_partial_25_0248,
  rs_R009_ueqv_R009YNNNN_partial_25_0249,
  rs_R009_ueqv_R009YNNNN_partial_25_0250,
  rs_R009_ueqv_R009YNNNN_partial_25_0251,
  rs_R009_ueqv_R009YNNNN_partial_25_0252,
  rs_R009_ueqv_R009YNNNN_partial_25_0253,
  rs_R009_ueqv_R009YNNNN_partial_25_0254,
  rs_R009_ueqv_R009YNNNN_partial_25_0255,
  rs_R009_ueqv_R009YNNNN_partial_25_0256,
  rs_R009_ueqv_R009YNNNN_partial_25_0257,
  rs_R009_ueqv_R009YNNNN_partial_25_0258,
  rs_R009_ueqv_R009YNNNN_partial_25_0259,
  rs_R009_ueqv_R009YNNNN_partial_25_0260,
  rs_R009_ueqv_R009YNNNN_partial_25_0261,
  rs_R009_ueqv_R009YNNNN_partial_25_0262,
  rs_R009_ueqv_R009YNNNN_partial_25_0263,
  rs_R009_ueqv_R009YNNNN_partial_25_0264,
  rs_R009_ueqv_R009YNNNN_partial_25_0265,
  rs_R009_ueqv_R009YNNNN_partial_25_0266,
  rs_R009_ueqv_R009YNNNN_partial_25_0267,
  rs_R009_ueqv_R009YNNNN_partial_25_0268,
  rs_R009_ueqv_R009YNNNN_partial_25_0269,
  rs_R009_ueqv_R009YNNNN_partial_25_0270,
  rs_R009_ueqv_R009YNNNN_partial_25_0271,
  rs_R009_ueqv_R009YNNNN_partial_25_0272,
  rs_R009_ueqv_R009YNNNN_partial_25_0273,
  rs_R009_ueqv_R009YNNNN_partial_25_0274,
  rs_R009_ueqv_R009YNNNN_partial_25_0275,
  rs_R009_ueqv_R009YNNNN_partial_25_0276,
  rs_R009_ueqv_R009YNNNN_partial_25_0277,
  rs_R009_ueqv_R009YNNNN_partial_25_0278,
  rs_R009_ueqv_R009YNNNN_partial_25_0279,
  rs_R009_ueqv_R009YNNNN_partial_25_0280,
  rs_R009_ueqv_R009YNNNN_partial_25_0281,
  rs_R009_ueqv_R009YNNNN_partial_25_0282,
  rs_R009_ueqv_R009YNNNN_partial_25_0283,
  rs_R009_ueqv_R009YNNNN_partial_25_0284,
  rs_R009_ueqv_R009YNNNN_partial_25_0285,
  rs_R009_ueqv_R009YNNNN_partial_25_0286,
  rs_R009_ueqv_R009YNNNN_partial_25_0287,
  rs_R009_ueqv_R009YNNNN_partial_25_0288,
  rs_R009_ueqv_R009YNNNN_partial_25_0289,
  rs_R009_ueqv_R009YNNNN_partial_25_0290,
  rs_R009_ueqv_R009YNNNN_partial_25_0291,
  rs_R009_ueqv_R009YNNNN_partial_25_0292,
  rs_R009_ueqv_R009YNNNN_partial_25_0293,
  rs_R009_ueqv_R009YNNNN_partial_25_0294,
  rs_R009_ueqv_R009YNNNN_partial_25_0295,
  rs_R009_ueqv_R009YNNNN_partial_25_0296,
  rs_R009_ueqv_R009YNNNN_partial_25_0297,
  rs_R009_ueqv_R009YNNNN_partial_25_0298,
  rs_R009_ueqv_R009YNNNN_partial_25_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_25_0200_0299 : Poly :=
[
  term ((44359900237595099 : Rat) / 26109641356596) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((-16 : Rat) / 3) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((4 : Rat) / 3) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 2)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((4101698818579693 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((1288941318816035 : Rat) / 399637367703) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 2)],
  term ((27838687559453 : Rat) / 20234803428) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 14) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-249392288927861449 : Rat) / 156657848139576) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-314 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 83270796) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-725 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((314 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((79407948033839 : Rat) / 5802142523688) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((2172201733 : Rat) / 166541592) [(0, 1), (6, 1), (9, 2), (12, 2)],
  term ((-18669123962701 : Rat) / 207219375846) [(0, 1), (6, 1), (10, 1), (12, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(0, 1), (6, 1), (10, 1), (12, 1), (14, 1)],
  term ((-45633955946145352 : Rat) / 19582231017447) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-175465457802892 : Rat) / 2175803446383) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((64 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 2), (12, 1)],
  term ((1447371201224659 : Rat) / 1450535630922) [(0, 1), (6, 1), (12, 1)],
  term ((845559837599 : Rat) / 241755938487) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((85325767403932235 : Rat) / 39164462034894) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-707 : Rat) / 18) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((-340 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3109727131719745 : Rat) / 2901071261844) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(0, 1), (6, 1), (12, 1), (14, 2)],
  term ((-7764931457384161 : Rat) / 13054820678298) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((2378 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((1495 : Rat) / 126) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 165250894662) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((-494 : Rat) / 63) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((12968180462857 : Rat) / 1289365005264) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((198127765725258661 : Rat) / 156657848139576) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((3849005354029 : Rat) / 1289365005264) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((-53777198303881 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-18472825908142915 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((919021700700953 : Rat) / 483511876974) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((333108 : Rat) / 553) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((706121836024930 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-812380957570663 : Rat) / 5802142523688) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-39830630716677613 : Rat) / 78328924069788) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((835 : Rat) / 18) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-725 : Rat) / 28) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((5406009091005188 : Rat) / 6527410339149) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2378 : Rat) / 63) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((639195568324249 : Rat) / 2901071261844) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 7) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 126) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 2901071261844) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-157 : Rat) / 21) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((114914983710675 : Rat) / 53723541886) [(0, 1), (7, 2), (12, 1)],
  term ((-4101698818579693 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(0, 1), (7, 2), (12, 2)],
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 2), (14, 1)],
  term ((-4992 : Rat) / 79) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((59904 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((9984 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((49159772403685 : Rat) / 532849823604) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-235 : Rat) / 84) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12691597676045 : Rat) / 236822143824) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((7 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((5 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-32 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1852146342481265 : Rat) / 4262798588832) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-2888652791893481 : Rat) / 1598549470812) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-9008294618453 : Rat) / 118411071912) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-33225805736000 : Rat) / 133212455901) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((97923607474811 : Rat) / 532849823604) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-475 : Rat) / 42) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-44359900237595099 : Rat) / 52219282713192) [(0, 2), (3, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(0, 2), (3, 1), (15, 3)],
  term ((8 : Rat) / 3) [(0, 2), (5, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1447371201224659 : Rat) / 2901071261844) [(0, 2), (6, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4101698818579693 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-1288941318816035 : Rat) / 799274735406) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((941242657 : Rat) / 166541592) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27838687559453 : Rat) / 40469606856) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 28) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((249392288927861449 : Rat) / 313315696279152) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((157 : Rat) / 7) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-79407948033839 : Rat) / 11604285047376) [(0, 2), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 333083184) [(0, 2), (6, 1), (9, 2), (12, 1)],
  term ((18669123962701 : Rat) / 414438751692) [(0, 2), (6, 1), (10, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(0, 2), (6, 1), (10, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((22816977973072676 : Rat) / 19582231017447) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((87732728901446 : Rat) / 2175803446383) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 252) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((247 : Rat) / 63) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-85325767403932235 : Rat) / 78328924069788) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((707 : Rat) / 36) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((3109727131719745 : Rat) / 5802142523688) [(0, 2), (6, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(0, 2), (6, 1), (14, 2)],
  term ((7764931457384161 : Rat) / 26109641356596) [(0, 2), (6, 1), (15, 2)],
  term ((-1189 : Rat) / 63) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-12968180462857 : Rat) / 2578730010528) [(0, 2), (7, 1), (9, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-198127765725258661 : Rat) / 313315696279152) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((18472825908142915 : Rat) / 8703213785532) [(0, 2), (7, 1), (11, 1)],
  term ((-166554 : Rat) / 553) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-919021700700953 : Rat) / 967023753948) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-941242657 : Rat) / 333083184) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 42) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((812380957570663 : Rat) / 11604285047376) [(0, 2), (7, 1), (13, 1)],
  term ((39830630716677613 : Rat) / 156657848139576) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-835 : Rat) / 36) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((725 : Rat) / 56) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2703004545502594 : Rat) / 6527410339149) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((1189 : Rat) / 63) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-639195568324249 : Rat) / 5802142523688) [(0, 2), (7, 1), (15, 1)],
  term ((-157 : Rat) / 14) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-114914983710675 : Rat) / 107447083772) [(0, 2), (7, 2)],
  term ((-1532199782809 : Rat) / 322341251316) [(0, 2), (7, 2), (12, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 2), (12, 1), (14, 1)],
  term ((4101698818579693 : Rat) / 13054820678298) [(0, 2), (7, 2), (14, 1)],
  term ((2496 : Rat) / 79) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4992 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-29952 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 6) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((16 : Rat) / 21) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49159772403685 : Rat) / 1065699647208) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-55 : Rat) / 28) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((235 : Rat) / 168) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12691597676045 : Rat) / 473644287648) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1852146342481265 : Rat) / 8525597177664) [(0, 2), (9, 1), (11, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((2888652791893481 : Rat) / 3197098941624) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (14, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((475 : Rat) / 84) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((44359900237595099 : Rat) / 26109641356596) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-16 : Rat) / 3) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((4101698818579693 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((-239616 : Rat) / 553) [(1, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((1288941318816035 : Rat) / 399637367703) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((314 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 83270796) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((-725 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-249392288927861449 : Rat) / 156657848139576) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-314 : Rat) / 7) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27838687559453 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((725 : Rat) / 14) [(1, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((79407948033839 : Rat) / 5802142523688) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((-18669123962701 : Rat) / 207219375846) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-175465457802892 : Rat) / 2175803446383) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((64 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45633955946145352 : Rat) / 19582231017447) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-340 : Rat) / 63) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 165250894662) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-494 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((1495 : Rat) / 126) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1447371201224659 : Rat) / 1450535630922) [(1, 1), (6, 1), (13, 1)],
  term ((-3109727131719745 : Rat) / 2901071261844) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-7764931457384161 : Rat) / 13054820678298) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((2378 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((845559837599 : Rat) / 241755938487) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((85325767403932235 : Rat) / 39164462034894) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-707 : Rat) / 18) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(1, 1), (6, 1), (13, 3)],
  term ((-340 : Rat) / 63) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((3849005354029 : Rat) / 1289365005264) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((12968180462857 : Rat) / 1289365005264) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((198127765725258661 : Rat) / 156657848139576) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((333108 : Rat) / 553) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18472825908142915 : Rat) / 4351606892766) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((919021700700953 : Rat) / 483511876974) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 2901071261844) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((2224986028928059 : Rat) / 1598549470812) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 126) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((5406009091005188 : Rat) / 6527410339149) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2378 : Rat) / 63) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((639195568324249 : Rat) / 2901071261844) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((157 : Rat) / 7) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-812380957570663 : Rat) / 5802142523688) [(1, 1), (7, 1), (13, 2)],
  term ((-39830630716677613 : Rat) / 78328924069788) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((835 : Rat) / 18) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 2), (14, 2)],
  term ((-725 : Rat) / 28) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((114914983710675 : Rat) / 53723541886) [(1, 1), (7, 2), (13, 1)],
  term ((-4101698818579693 : Rat) / 6527410339149) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((9984 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4992 : Rat) / 79) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((5 : Rat) / 3) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-22 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12691597676045 : Rat) / 236822143824) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((7 : Rat) / 3) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((49159772403685 : Rat) / 532849823604) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((8926828802611 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-235 : Rat) / 84) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-33225805736000 : Rat) / 133212455901) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1852146342481265 : Rat) / 4262798588832) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2888652791893481 : Rat) / 1598549470812) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-9008294618453 : Rat) / 118411071912) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((97923607474811 : Rat) / 532849823604) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-475 : Rat) / 42) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-44359900237595099 : Rat) / 52219282713192) [(1, 2), (3, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(1, 2), (3, 1), (15, 3)],
  term ((8 : Rat) / 3) [(1, 2), (5, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1447371201224659 : Rat) / 2901071261844) [(1, 2), (6, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4101698818579693 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((-1288941318816035 : Rat) / 799274735406) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((941242657 : Rat) / 166541592) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27838687559453 : Rat) / 40469606856) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 28) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((249392288927861449 : Rat) / 313315696279152) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((157 : Rat) / 7) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-79407948033839 : Rat) / 11604285047376) [(1, 2), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 333083184) [(1, 2), (6, 1), (9, 2), (12, 1)],
  term ((18669123962701 : Rat) / 414438751692) [(1, 2), (6, 1), (10, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(1, 2), (6, 1), (10, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((22816977973072676 : Rat) / 19582231017447) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((87732728901446 : Rat) / 2175803446383) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 252) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((247 : Rat) / 63) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-85325767403932235 : Rat) / 78328924069788) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((707 : Rat) / 36) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((3109727131719745 : Rat) / 5802142523688) [(1, 2), (6, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(1, 2), (6, 1), (14, 2)],
  term ((7764931457384161 : Rat) / 26109641356596) [(1, 2), (6, 1), (15, 2)],
  term ((-1189 : Rat) / 63) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-12968180462857 : Rat) / 2578730010528) [(1, 2), (7, 1), (9, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-198127765725258661 : Rat) / 313315696279152) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((18472825908142915 : Rat) / 8703213785532) [(1, 2), (7, 1), (11, 1)],
  term ((-166554 : Rat) / 553) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-919021700700953 : Rat) / 967023753948) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-941242657 : Rat) / 333083184) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 42) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((812380957570663 : Rat) / 11604285047376) [(1, 2), (7, 1), (13, 1)],
  term ((39830630716677613 : Rat) / 156657848139576) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-835 : Rat) / 36) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((725 : Rat) / 56) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2703004545502594 : Rat) / 6527410339149) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((1189 : Rat) / 63) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-639195568324249 : Rat) / 5802142523688) [(1, 2), (7, 1), (15, 1)],
  term ((-157 : Rat) / 14) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-114914983710675 : Rat) / 107447083772) [(1, 2), (7, 2)],
  term ((-1532199782809 : Rat) / 322341251316) [(1, 2), (7, 2), (12, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 2), (12, 1), (14, 1)],
  term ((4101698818579693 : Rat) / 13054820678298) [(1, 2), (7, 2), (14, 1)],
  term ((2496 : Rat) / 79) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4992 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-29952 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 6) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((16 : Rat) / 21) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49159772403685 : Rat) / 1065699647208) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-55 : Rat) / 28) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((235 : Rat) / 168) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12691597676045 : Rat) / 473644287648) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1852146342481265 : Rat) / 8525597177664) [(1, 2), (9, 1), (11, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((2888652791893481 : Rat) / 3197098941624) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (14, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((475 : Rat) / 84) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 200 through 299. -/
theorem rs_R009_ueqv_R009YNNNN_block_25_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_25_0200_0299
      rs_R009_ueqv_R009YNNNN_block_25_0200_0299 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
