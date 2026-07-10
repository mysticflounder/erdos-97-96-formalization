/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0200 : Poly :=
[
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 200 for generator 9. -/
def ep_Q2_008_partial_09_0200 : Poly :=
[
  term ((11911384284348060000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 9. -/
theorem ep_Q2_008_partial_09_0200_valid :
    mulPoly ep_Q2_008_coefficient_09_0200
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0201 : Poly :=
[
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 9. -/
def ep_Q2_008_partial_09_0201 : Poly :=
[
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 9. -/
theorem ep_Q2_008_partial_09_0201_valid :
    mulPoly ep_Q2_008_coefficient_09_0201
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0202 : Poly :=
[
  term ((25891905370046625 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 202 for generator 9. -/
def ep_Q2_008_partial_09_0202 : Poly :=
[
  term ((-25891905370046625 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 9. -/
theorem ep_Q2_008_partial_09_0202_valid :
    mulPoly ep_Q2_008_coefficient_09_0202
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0203 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 9. -/
def ep_Q2_008_partial_09_0203 : Poly :=
[
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 9. -/
theorem ep_Q2_008_partial_09_0203_valid :
    mulPoly ep_Q2_008_coefficient_09_0203
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0204 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 9. -/
def ep_Q2_008_partial_09_0204 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 9. -/
theorem ep_Q2_008_partial_09_0204_valid :
    mulPoly ep_Q2_008_coefficient_09_0204
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0205 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 205 for generator 9. -/
def ep_Q2_008_partial_09_0205 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 9. -/
theorem ep_Q2_008_partial_09_0205_valid :
    mulPoly ep_Q2_008_coefficient_09_0205
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0206 : Poly :=
[
  term ((396082794497023885929929673633288000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 9. -/
def ep_Q2_008_partial_09_0206 : Poly :=
[
  term ((-396082794497023885929929673633288000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((792165588994047771859859347266576000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 9. -/
theorem ep_Q2_008_partial_09_0206_valid :
    mulPoly ep_Q2_008_coefficient_09_0206
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0207 : Poly :=
[
  term ((21856447400000286033 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 207 for generator 9. -/
def ep_Q2_008_partial_09_0207 : Poly :=
[
  term ((-21856447400000286033 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((21856447400000286033 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 9. -/
theorem ep_Q2_008_partial_09_0207_valid :
    mulPoly ep_Q2_008_coefficient_09_0207
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0208 : Poly :=
[
  term ((98593287434725242249548125513640737429509 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 9. -/
def ep_Q2_008_partial_09_0208 : Poly :=
[
  term ((-98593287434725242249548125513640737429509 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((98593287434725242249548125513640737429509 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 9. -/
theorem ep_Q2_008_partial_09_0208_valid :
    mulPoly ep_Q2_008_coefficient_09_0208
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0209 : Poly :=
[
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 9. -/
def ep_Q2_008_partial_09_0209 : Poly :=
[
  term ((-11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 9. -/
theorem ep_Q2_008_partial_09_0209_valid :
    mulPoly ep_Q2_008_coefficient_09_0209
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0210 : Poly :=
[
  term ((-1310542472713233018723285092142298510413587 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 9. -/
def ep_Q2_008_partial_09_0210 : Poly :=
[
  term ((1310542472713233018723285092142298510413587 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1310542472713233018723285092142298510413587 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 9. -/
theorem ep_Q2_008_partial_09_0210_valid :
    mulPoly ep_Q2_008_coefficient_09_0210
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0211 : Poly :=
[
  term ((51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 211 for generator 9. -/
def ep_Q2_008_partial_09_0211 : Poly :=
[
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 9. -/
theorem ep_Q2_008_partial_09_0211_valid :
    mulPoly ep_Q2_008_coefficient_09_0211
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0212 : Poly :=
[
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 9. -/
def ep_Q2_008_partial_09_0212 : Poly :=
[
  term ((374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 9. -/
theorem ep_Q2_008_partial_09_0212_valid :
    mulPoly ep_Q2_008_coefficient_09_0212
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0213 : Poly :=
[
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 9. -/
def ep_Q2_008_partial_09_0213 : Poly :=
[
  term ((-304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 9. -/
theorem ep_Q2_008_partial_09_0213_valid :
    mulPoly ep_Q2_008_coefficient_09_0213
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0214 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 214 for generator 9. -/
def ep_Q2_008_partial_09_0214 : Poly :=
[
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 9. -/
theorem ep_Q2_008_partial_09_0214_valid :
    mulPoly ep_Q2_008_coefficient_09_0214
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0215 : Poly :=
[
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 9. -/
def ep_Q2_008_partial_09_0215 : Poly :=
[
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 9. -/
theorem ep_Q2_008_partial_09_0215_valid :
    mulPoly ep_Q2_008_coefficient_09_0215
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0216 : Poly :=
[
  term ((-9747106795423086351482754335923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 216 for generator 9. -/
def ep_Q2_008_partial_09_0216 : Poly :=
[
  term ((9747106795423086351482754335923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-19494213590846172702965508671846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 9. -/
theorem ep_Q2_008_partial_09_0216_valid :
    mulPoly ep_Q2_008_coefficient_09_0216
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0217 : Poly :=
[
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (7, 2), (16, 1)]
]

/-- Partial product 217 for generator 9. -/
def ep_Q2_008_partial_09_0217 : Poly :=
[
  term ((1619646487561852949 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 9. -/
theorem ep_Q2_008_partial_09_0217_valid :
    mulPoly ep_Q2_008_coefficient_09_0217
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0218 : Poly :=
[
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 9. -/
def ep_Q2_008_partial_09_0218 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 9. -/
theorem ep_Q2_008_partial_09_0218_valid :
    mulPoly ep_Q2_008_coefficient_09_0218
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0219 : Poly :=
[
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 9. -/
def ep_Q2_008_partial_09_0219 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 9. -/
theorem ep_Q2_008_partial_09_0219_valid :
    mulPoly ep_Q2_008_coefficient_09_0219
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0220 : Poly :=
[
  term ((1929438861273630000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 9. -/
def ep_Q2_008_partial_09_0220 : Poly :=
[
  term ((-1929438861273630000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3858877722547260000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 9. -/
theorem ep_Q2_008_partial_09_0220_valid :
    mulPoly ep_Q2_008_coefficient_09_0220
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0221 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 9. -/
def ep_Q2_008_partial_09_0221 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 9. -/
theorem ep_Q2_008_partial_09_0221_valid :
    mulPoly ep_Q2_008_coefficient_09_0221
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0222 : Poly :=
[
  term ((937156870178249543124469579721463580800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 222 for generator 9. -/
def ep_Q2_008_partial_09_0222 : Poly :=
[
  term ((-937156870178249543124469579721463580800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1874313740356499086248939159442927161600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 9. -/
theorem ep_Q2_008_partial_09_0222_valid :
    mulPoly ep_Q2_008_coefficient_09_0222
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0223 : Poly :=
[
  term ((7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 9. -/
def ep_Q2_008_partial_09_0223 : Poly :=
[
  term ((-7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 9. -/
theorem ep_Q2_008_partial_09_0223_valid :
    mulPoly ep_Q2_008_coefficient_09_0223
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0224 : Poly :=
[
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 224 for generator 9. -/
def ep_Q2_008_partial_09_0224 : Poly :=
[
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 9. -/
theorem ep_Q2_008_partial_09_0224_valid :
    mulPoly ep_Q2_008_coefficient_09_0224
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0225 : Poly :=
[
  term ((-2484053566585162875 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 9. -/
def ep_Q2_008_partial_09_0225 : Poly :=
[
  term ((2484053566585162875 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2484053566585162875 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 9. -/
theorem ep_Q2_008_partial_09_0225_valid :
    mulPoly ep_Q2_008_coefficient_09_0225
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0226 : Poly :=
[
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 9. -/
def ep_Q2_008_partial_09_0226 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 9. -/
theorem ep_Q2_008_partial_09_0226_valid :
    mulPoly ep_Q2_008_coefficient_09_0226
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0227 : Poly :=
[
  term ((-1115993352694573016126162132123746147494921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 9. -/
def ep_Q2_008_partial_09_0227 : Poly :=
[
  term ((1115993352694573016126162132123746147494921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1115993352694573016126162132123746147494921 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 9. -/
theorem ep_Q2_008_partial_09_0227_valid :
    mulPoly ep_Q2_008_coefficient_09_0227
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0228 : Poly :=
[
  term ((27855559524908515659 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 9. -/
def ep_Q2_008_partial_09_0228 : Poly :=
[
  term ((-27855559524908515659 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((27855559524908515659 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 9. -/
theorem ep_Q2_008_partial_09_0228_valid :
    mulPoly ep_Q2_008_coefficient_09_0228
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0229 : Poly :=
[
  term ((-149290601779837558108166161035566880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 229 for generator 9. -/
def ep_Q2_008_partial_09_0229 : Poly :=
[
  term ((149290601779837558108166161035566880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 9. -/
theorem ep_Q2_008_partial_09_0229_valid :
    mulPoly ep_Q2_008_coefficient_09_0229
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0230 : Poly :=
[
  term ((13442312697672425776431349950816365664000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 9. -/
def ep_Q2_008_partial_09_0230 : Poly :=
[
  term ((-13442312697672425776431349950816365664000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((26884625395344851552862699901632731328000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 9. -/
theorem ep_Q2_008_partial_09_0230_valid :
    mulPoly ep_Q2_008_coefficient_09_0230
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0231 : Poly :=
[
  term ((-445405116347328656253755078351614909118657 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 9. -/
def ep_Q2_008_partial_09_0231 : Poly :=
[
  term ((445405116347328656253755078351614909118657 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-445405116347328656253755078351614909118657 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 9. -/
theorem ep_Q2_008_partial_09_0231_valid :
    mulPoly ep_Q2_008_coefficient_09_0231
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0232 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (15, 2), (16, 1)]
]

/-- Partial product 232 for generator 9. -/
def ep_Q2_008_partial_09_0232 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 9. -/
theorem ep_Q2_008_partial_09_0232_valid :
    mulPoly ep_Q2_008_coefficient_09_0232
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0233 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 9. -/
def ep_Q2_008_partial_09_0233 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 9. -/
theorem ep_Q2_008_partial_09_0233_valid :
    mulPoly ep_Q2_008_coefficient_09_0233
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0234 : Poly :=
[
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 234 for generator 9. -/
def ep_Q2_008_partial_09_0234 : Poly :=
[
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 9. -/
theorem ep_Q2_008_partial_09_0234_valid :
    mulPoly ep_Q2_008_coefficient_09_0234
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0235 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 235 for generator 9. -/
def ep_Q2_008_partial_09_0235 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 9. -/
theorem ep_Q2_008_partial_09_0235_valid :
    mulPoly ep_Q2_008_coefficient_09_0235
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0236 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 236 for generator 9. -/
def ep_Q2_008_partial_09_0236 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 9. -/
theorem ep_Q2_008_partial_09_0236_valid :
    mulPoly ep_Q2_008_coefficient_09_0236
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0237 : Poly :=
[
  term ((-2067183986819180328946057989946016964456000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 237 for generator 9. -/
def ep_Q2_008_partial_09_0237 : Poly :=
[
  term ((2067183986819180328946057989946016964456000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4134367973638360657892115979892033928912000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 9. -/
theorem ep_Q2_008_partial_09_0237_valid :
    mulPoly ep_Q2_008_coefficient_09_0237
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0238 : Poly :=
[
  term ((-3665933836419897000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 9. -/
def ep_Q2_008_partial_09_0238 : Poly :=
[
  term ((3665933836419897000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7331867672839794000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 9. -/
theorem ep_Q2_008_partial_09_0238_valid :
    mulPoly ep_Q2_008_coefficient_09_0238
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0239 : Poly :=
[
  term ((-35338844328770637459817416030000133630125 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 9. -/
def ep_Q2_008_partial_09_0239 : Poly :=
[
  term ((35338844328770637459817416030000133630125 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-35338844328770637459817416030000133630125 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 9. -/
theorem ep_Q2_008_partial_09_0239_valid :
    mulPoly ep_Q2_008_coefficient_09_0239
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0240 : Poly :=
[
  term ((4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 9. -/
def ep_Q2_008_partial_09_0240 : Poly :=
[
  term ((-4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 9. -/
theorem ep_Q2_008_partial_09_0240_valid :
    mulPoly ep_Q2_008_coefficient_09_0240
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0241 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 241 for generator 9. -/
def ep_Q2_008_partial_09_0241 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 9. -/
theorem ep_Q2_008_partial_09_0241_valid :
    mulPoly ep_Q2_008_coefficient_09_0241
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0242 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 9. -/
def ep_Q2_008_partial_09_0242 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 9. -/
theorem ep_Q2_008_partial_09_0242_valid :
    mulPoly ep_Q2_008_coefficient_09_0242
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0243 : Poly :=
[
  term ((4318109119297864125 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 243 for generator 9. -/
def ep_Q2_008_partial_09_0243 : Poly :=
[
  term ((-4318109119297864125 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((4318109119297864125 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 9. -/
theorem ep_Q2_008_partial_09_0243_valid :
    mulPoly ep_Q2_008_coefficient_09_0243
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0244 : Poly :=
[
  term ((190089024832007815743118758804140968732800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 9. -/
def ep_Q2_008_partial_09_0244 : Poly :=
[
  term ((-190089024832007815743118758804140968732800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((380178049664015631486237517608281937465600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 9. -/
theorem ep_Q2_008_partial_09_0244_valid :
    mulPoly ep_Q2_008_coefficient_09_0244
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0245 : Poly :=
[
  term ((-8255274095743650810831355799772940185600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 245 for generator 9. -/
def ep_Q2_008_partial_09_0245 : Poly :=
[
  term ((8255274095743650810831355799772940185600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16510548191487301621662711599545880371200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 9. -/
theorem ep_Q2_008_partial_09_0245_valid :
    mulPoly ep_Q2_008_coefficient_09_0245
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0246 : Poly :=
[
  term ((-5796092951062332393450327332167799786966400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 246 for generator 9. -/
def ep_Q2_008_partial_09_0246 : Poly :=
[
  term ((5796092951062332393450327332167799786966400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11592185902124664786900654664335599573932800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 9. -/
theorem ep_Q2_008_partial_09_0246_valid :
    mulPoly ep_Q2_008_coefficient_09_0246
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0247 : Poly :=
[
  term ((-5955692142174030000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 247 for generator 9. -/
def ep_Q2_008_partial_09_0247 : Poly :=
[
  term ((5955692142174030000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 9. -/
theorem ep_Q2_008_partial_09_0247_valid :
    mulPoly ep_Q2_008_coefficient_09_0247
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0248 : Poly :=
[
  term ((-493040851895273919544992734221892544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 9. -/
def ep_Q2_008_partial_09_0248 : Poly :=
[
  term ((493040851895273919544992734221892544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 9. -/
theorem ep_Q2_008_partial_09_0248_valid :
    mulPoly ep_Q2_008_coefficient_09_0248
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0249 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 249 for generator 9. -/
def ep_Q2_008_partial_09_0249 : Poly :=
[
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 9. -/
theorem ep_Q2_008_partial_09_0249_valid :
    mulPoly ep_Q2_008_coefficient_09_0249
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0250 : Poly :=
[
  term ((5534490500034563099055427268772064488750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 250 for generator 9. -/
def ep_Q2_008_partial_09_0250 : Poly :=
[
  term ((-5534490500034563099055427268772064488750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((11068981000069126198110854537544128977500 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 9. -/
theorem ep_Q2_008_partial_09_0250_valid :
    mulPoly ep_Q2_008_coefficient_09_0250
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0251 : Poly :=
[
  term ((-13609606106705191875 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 251 for generator 9. -/
def ep_Q2_008_partial_09_0251 : Poly :=
[
  term ((13609606106705191875 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-13609606106705191875 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 9. -/
theorem ep_Q2_008_partial_09_0251_valid :
    mulPoly ep_Q2_008_coefficient_09_0251
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0252 : Poly :=
[
  term ((107494107555464115841028036439138196800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 252 for generator 9. -/
def ep_Q2_008_partial_09_0252 : Poly :=
[
  term ((-107494107555464115841028036439138196800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((214988215110928231682056072878276393600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 9. -/
theorem ep_Q2_008_partial_09_0252_valid :
    mulPoly ep_Q2_008_coefficient_09_0252
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0253 : Poly :=
[
  term ((-18367379696263283985 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 253 for generator 9. -/
def ep_Q2_008_partial_09_0253 : Poly :=
[
  term ((18367379696263283985 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-18367379696263283985 : Rat) / 692956453614176359) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 9. -/
theorem ep_Q2_008_partial_09_0253_valid :
    mulPoly ep_Q2_008_coefficient_09_0253
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0254 : Poly :=
[
  term ((-569538475679168151685597517850167727653739 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 9. -/
def ep_Q2_008_partial_09_0254 : Poly :=
[
  term ((569538475679168151685597517850167727653739 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-569538475679168151685597517850167727653739 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 9. -/
theorem ep_Q2_008_partial_09_0254_valid :
    mulPoly ep_Q2_008_coefficient_09_0254
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0255 : Poly :=
[
  term ((-47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 255 for generator 9. -/
def ep_Q2_008_partial_09_0255 : Poly :=
[
  term ((47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-95855121505812862057965008824783296000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 9. -/
theorem ep_Q2_008_partial_09_0255_valid :
    mulPoly ep_Q2_008_coefficient_09_0255
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0256 : Poly :=
[
  term ((3161970324541726378145005286450060746155051 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 9. -/
def ep_Q2_008_partial_09_0256 : Poly :=
[
  term ((-3161970324541726378145005286450060746155051 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3161970324541726378145005286450060746155051 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 9. -/
theorem ep_Q2_008_partial_09_0256_valid :
    mulPoly ep_Q2_008_coefficient_09_0256
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0257 : Poly :=
[
  term ((147795218784743980616819995994150400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 257 for generator 9. -/
def ep_Q2_008_partial_09_0257 : Poly :=
[
  term ((-147795218784743980616819995994150400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((295590437569487961233639991988300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 9. -/
theorem ep_Q2_008_partial_09_0257_valid :
    mulPoly ep_Q2_008_coefficient_09_0257
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0258 : Poly :=
[
  term ((2554207703231479395334446151384198266199305 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 258 for generator 9. -/
def ep_Q2_008_partial_09_0258 : Poly :=
[
  term ((-2554207703231479395334446151384198266199305 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2554207703231479395334446151384198266199305 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 9. -/
theorem ep_Q2_008_partial_09_0258_valid :
    mulPoly ep_Q2_008_coefficient_09_0258
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0259 : Poly :=
[
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 259 for generator 9. -/
def ep_Q2_008_partial_09_0259 : Poly :=
[
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 9. -/
theorem ep_Q2_008_partial_09_0259_valid :
    mulPoly ep_Q2_008_coefficient_09_0259
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0260 : Poly :=
[
  term ((160223412553333273269 : Rat) / 11087303257826821744) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 260 for generator 9. -/
def ep_Q2_008_partial_09_0260 : Poly :=
[
  term ((-160223412553333273269 : Rat) / 11087303257826821744) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((160223412553333273269 : Rat) / 5543651628913410872) [(2, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 9. -/
theorem ep_Q2_008_partial_09_0260_valid :
    mulPoly ep_Q2_008_coefficient_09_0260
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0261 : Poly :=
[
  term ((-53051766740676201435215402298342730780503 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 9. -/
def ep_Q2_008_partial_09_0261 : Poly :=
[
  term ((53051766740676201435215402298342730780503 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-53051766740676201435215402298342730780503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 9. -/
theorem ep_Q2_008_partial_09_0261_valid :
    mulPoly ep_Q2_008_coefficient_09_0261
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0262 : Poly :=
[
  term ((152477333095523961442126405814184756699315 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 262 for generator 9. -/
def ep_Q2_008_partial_09_0262 : Poly :=
[
  term ((-152477333095523961442126405814184756699315 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((304954666191047922884252811628369513398630 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 9. -/
theorem ep_Q2_008_partial_09_0262_valid :
    mulPoly ep_Q2_008_coefficient_09_0262
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0263 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 263 for generator 9. -/
def ep_Q2_008_partial_09_0263 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 9. -/
theorem ep_Q2_008_partial_09_0263_valid :
    mulPoly ep_Q2_008_coefficient_09_0263
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0264 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 4), (16, 1)]
]

/-- Partial product 264 for generator 9. -/
def ep_Q2_008_partial_09_0264 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 9. -/
theorem ep_Q2_008_partial_09_0264_valid :
    mulPoly ep_Q2_008_coefficient_09_0264
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0265 : Poly :=
[
  term ((-3023864061132418179351956891186506909977985 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 9. -/
def ep_Q2_008_partial_09_0265 : Poly :=
[
  term ((3023864061132418179351956891186506909977985 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3023864061132418179351956891186506909977985 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 9. -/
theorem ep_Q2_008_partial_09_0265_valid :
    mulPoly ep_Q2_008_coefficient_09_0265
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0266 : Poly :=
[
  term ((358719488592699957335047576079709954719989 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 266 for generator 9. -/
def ep_Q2_008_partial_09_0266 : Poly :=
[
  term ((-358719488592699957335047576079709954719989 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((358719488592699957335047576079709954719989 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 9. -/
theorem ep_Q2_008_partial_09_0266_valid :
    mulPoly ep_Q2_008_coefficient_09_0266
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0267 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 9. -/
def ep_Q2_008_partial_09_0267 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 9. -/
theorem ep_Q2_008_partial_09_0267_valid :
    mulPoly ep_Q2_008_coefficient_09_0267
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0268 : Poly :=
[
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 268 for generator 9. -/
def ep_Q2_008_partial_09_0268 : Poly :=
[
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 9. -/
theorem ep_Q2_008_partial_09_0268_valid :
    mulPoly ep_Q2_008_coefficient_09_0268
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0269 : Poly :=
[
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 9. -/
def ep_Q2_008_partial_09_0269 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((47645537137392240000 : Rat) / 692956453614176359) [(2, 2), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 9. -/
theorem ep_Q2_008_partial_09_0269_valid :
    mulPoly ep_Q2_008_coefficient_09_0269
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0270 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 270 for generator 9. -/
def ep_Q2_008_partial_09_0270 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 9. -/
theorem ep_Q2_008_partial_09_0270_valid :
    mulPoly ep_Q2_008_coefficient_09_0270
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0271 : Poly :=
[
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 9. -/
def ep_Q2_008_partial_09_0271 : Poly :=
[
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 692956453614176359) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 9. -/
theorem ep_Q2_008_partial_09_0271_valid :
    mulPoly ep_Q2_008_coefficient_09_0271
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0272 : Poly :=
[
  term ((2240856262173183602634485044018675200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 9. -/
def ep_Q2_008_partial_09_0272 : Poly :=
[
  term ((-2240856262173183602634485044018675200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4481712524346367205268970088037350400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 9. -/
theorem ep_Q2_008_partial_09_0272_valid :
    mulPoly ep_Q2_008_coefficient_09_0272
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0273 : Poly :=
[
  term ((-1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 273 for generator 9. -/
def ep_Q2_008_partial_09_0273 : Poly :=
[
  term ((1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2639958101834397581263751744806425600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 9. -/
theorem ep_Q2_008_partial_09_0273_valid :
    mulPoly ep_Q2_008_coefficient_09_0273
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0274 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 274 for generator 9. -/
def ep_Q2_008_partial_09_0274 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 9. -/
theorem ep_Q2_008_partial_09_0274_valid :
    mulPoly ep_Q2_008_coefficient_09_0274
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0275 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 9. -/
def ep_Q2_008_partial_09_0275 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 9. -/
theorem ep_Q2_008_partial_09_0275_valid :
    mulPoly ep_Q2_008_coefficient_09_0275
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0276 : Poly :=
[
  term ((-154156417625679627441510053209238400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 276 for generator 9. -/
def ep_Q2_008_partial_09_0276 : Poly :=
[
  term ((154156417625679627441510053209238400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-308312835251359254883020106418476800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 9. -/
theorem ep_Q2_008_partial_09_0276_valid :
    mulPoly ep_Q2_008_coefficient_09_0276
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0277 : Poly :=
[
  term ((1663203050321205018 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (16, 1)]
]

/-- Partial product 277 for generator 9. -/
def ep_Q2_008_partial_09_0277 : Poly :=
[
  term ((-1663203050321205018 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((3326406100642410036 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 9. -/
theorem ep_Q2_008_partial_09_0277_valid :
    mulPoly ep_Q2_008_coefficient_09_0277
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0278 : Poly :=
[
  term ((-2598030247796611065229584358935842274539709 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 9. -/
def ep_Q2_008_partial_09_0278 : Poly :=
[
  term ((2598030247796611065229584358935842274539709 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2598030247796611065229584358935842274539709 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 9. -/
theorem ep_Q2_008_partial_09_0278_valid :
    mulPoly ep_Q2_008_coefficient_09_0278
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0279 : Poly :=
[
  term ((-1766995190419449736560765670817414400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 279 for generator 9. -/
def ep_Q2_008_partial_09_0279 : Poly :=
[
  term ((1766995190419449736560765670817414400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3533990380838899473121531341634828800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 9. -/
theorem ep_Q2_008_partial_09_0279_valid :
    mulPoly ep_Q2_008_coefficient_09_0279
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0280 : Poly :=
[
  term ((-409492422465091064703635603907338451414630 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 9. -/
def ep_Q2_008_partial_09_0280 : Poly :=
[
  term ((409492422465091064703635603907338451414630 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-818984844930182129407271207814676902829260 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 9. -/
theorem ep_Q2_008_partial_09_0280_valid :
    mulPoly ep_Q2_008_coefficient_09_0280
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0281 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 2), (15, 4), (16, 1)]
]

/-- Partial product 281 for generator 9. -/
def ep_Q2_008_partial_09_0281 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 9. -/
theorem ep_Q2_008_partial_09_0281_valid :
    mulPoly ep_Q2_008_coefficient_09_0281
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0282 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 2771825814456705436) [(2, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 282 for generator 9. -/
def ep_Q2_008_partial_09_0282 : Poly :=
[
  term ((1824694926321908115 : Rat) / 2771825814456705436) [(2, 1), (7, 2), (13, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(2, 2), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 9. -/
theorem ep_Q2_008_partial_09_0282_valid :
    mulPoly ep_Q2_008_coefficient_09_0282
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0283 : Poly :=
[
  term ((-9216838606328159813265866233152240000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 9. -/
def ep_Q2_008_partial_09_0283 : Poly :=
[
  term ((9216838606328159813265866233152240000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 9. -/
theorem ep_Q2_008_partial_09_0283_valid :
    mulPoly ep_Q2_008_coefficient_09_0283
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0284 : Poly :=
[
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 284 for generator 9. -/
def ep_Q2_008_partial_09_0284 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 9. -/
theorem ep_Q2_008_partial_09_0284_valid :
    mulPoly ep_Q2_008_coefficient_09_0284
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0285 : Poly :=
[
  term ((-237551182017078855925418119576003549751989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 285 for generator 9. -/
def ep_Q2_008_partial_09_0285 : Poly :=
[
  term ((237551182017078855925418119576003549751989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-237551182017078855925418119576003549751989 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 9. -/
theorem ep_Q2_008_partial_09_0285_valid :
    mulPoly ep_Q2_008_coefficient_09_0285
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0286 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (15, 4), (16, 1)]
]

/-- Partial product 286 for generator 9. -/
def ep_Q2_008_partial_09_0286 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (15, 4), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 9. -/
theorem ep_Q2_008_partial_09_0286_valid :
    mulPoly ep_Q2_008_coefficient_09_0286
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0287 : Poly :=
[
  term ((-29854699795745136765 : Rat) / 11087303257826821744) [(2, 1), (7, 2), (16, 1)]
]

/-- Partial product 287 for generator 9. -/
def ep_Q2_008_partial_09_0287 : Poly :=
[
  term ((29854699795745136765 : Rat) / 11087303257826821744) [(2, 1), (7, 2), (16, 1)],
  term ((-29854699795745136765 : Rat) / 5543651628913410872) [(2, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 9. -/
theorem ep_Q2_008_partial_09_0287_valid :
    mulPoly ep_Q2_008_coefficient_09_0287
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0288 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 288 for generator 9. -/
def ep_Q2_008_partial_09_0288 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 9. -/
theorem ep_Q2_008_partial_09_0288_valid :
    mulPoly ep_Q2_008_coefficient_09_0288
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0289 : Poly :=
[
  term ((82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 9. -/
def ep_Q2_008_partial_09_0289 : Poly :=
[
  term ((-82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((164273752925072513343636144208473600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 9. -/
theorem ep_Q2_008_partial_09_0289_valid :
    mulPoly ep_Q2_008_coefficient_09_0289
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0290 : Poly :=
[
  term ((815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 290 for generator 9. -/
def ep_Q2_008_partial_09_0290 : Poly :=
[
  term ((-815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 9. -/
theorem ep_Q2_008_partial_09_0290_valid :
    mulPoly ep_Q2_008_coefficient_09_0290
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0291 : Poly :=
[
  term ((222113309743557078086629171241877898222515 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 9. -/
def ep_Q2_008_partial_09_0291 : Poly :=
[
  term ((-222113309743557078086629171241877898222515 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((444226619487114156173258342483755796445030 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 9. -/
theorem ep_Q2_008_partial_09_0291_valid :
    mulPoly ep_Q2_008_coefficient_09_0291
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0292 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 292 for generator 9. -/
def ep_Q2_008_partial_09_0292 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 9. -/
theorem ep_Q2_008_partial_09_0292_valid :
    mulPoly ep_Q2_008_coefficient_09_0292
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0293 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 293 for generator 9. -/
def ep_Q2_008_partial_09_0293 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 9. -/
theorem ep_Q2_008_partial_09_0293_valid :
    mulPoly ep_Q2_008_coefficient_09_0293
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0294 : Poly :=
[
  term ((197156402992101326093511633255447314073589 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 9. -/
def ep_Q2_008_partial_09_0294 : Poly :=
[
  term ((-197156402992101326093511633255447314073589 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((197156402992101326093511633255447314073589 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 9. -/
theorem ep_Q2_008_partial_09_0294_valid :
    mulPoly ep_Q2_008_coefficient_09_0294
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0295 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (15, 3), (16, 1)]
]

/-- Partial product 295 for generator 9. -/
def ep_Q2_008_partial_09_0295 : Poly :=
[
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (15, 3), (16, 1)],
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 9. -/
theorem ep_Q2_008_partial_09_0295_valid :
    mulPoly ep_Q2_008_coefficient_09_0295
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0296 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 296 for generator 9. -/
def ep_Q2_008_partial_09_0296 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 4), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 9. -/
theorem ep_Q2_008_partial_09_0296_valid :
    mulPoly ep_Q2_008_coefficient_09_0296
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0297 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (15, 2), (16, 1)]
]

/-- Partial product 297 for generator 9. -/
def ep_Q2_008_partial_09_0297 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (15, 2), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 9. -/
theorem ep_Q2_008_partial_09_0297_valid :
    mulPoly ep_Q2_008_coefficient_09_0297
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0298 : Poly :=
[
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 298 for generator 9. -/
def ep_Q2_008_partial_09_0298 : Poly :=
[
  term ((234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 692956453614176359) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 9. -/
theorem ep_Q2_008_partial_09_0298_valid :
    mulPoly ep_Q2_008_coefficient_09_0298
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0299 : Poly :=
[
  term ((704993490517168125 : Rat) / 5543651628913410872) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 299 for generator 9. -/
def ep_Q2_008_partial_09_0299 : Poly :=
[
  term ((-704993490517168125 : Rat) / 5543651628913410872) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((704993490517168125 : Rat) / 2771825814456705436) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 9. -/
theorem ep_Q2_008_partial_09_0299_valid :
    mulPoly ep_Q2_008_coefficient_09_0299
        ep_Q2_008_generator_09_0200_0299 =
      ep_Q2_008_partial_09_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0200_0299 : List Poly :=
[
  ep_Q2_008_partial_09_0200,
  ep_Q2_008_partial_09_0201,
  ep_Q2_008_partial_09_0202,
  ep_Q2_008_partial_09_0203,
  ep_Q2_008_partial_09_0204,
  ep_Q2_008_partial_09_0205,
  ep_Q2_008_partial_09_0206,
  ep_Q2_008_partial_09_0207,
  ep_Q2_008_partial_09_0208,
  ep_Q2_008_partial_09_0209,
  ep_Q2_008_partial_09_0210,
  ep_Q2_008_partial_09_0211,
  ep_Q2_008_partial_09_0212,
  ep_Q2_008_partial_09_0213,
  ep_Q2_008_partial_09_0214,
  ep_Q2_008_partial_09_0215,
  ep_Q2_008_partial_09_0216,
  ep_Q2_008_partial_09_0217,
  ep_Q2_008_partial_09_0218,
  ep_Q2_008_partial_09_0219,
  ep_Q2_008_partial_09_0220,
  ep_Q2_008_partial_09_0221,
  ep_Q2_008_partial_09_0222,
  ep_Q2_008_partial_09_0223,
  ep_Q2_008_partial_09_0224,
  ep_Q2_008_partial_09_0225,
  ep_Q2_008_partial_09_0226,
  ep_Q2_008_partial_09_0227,
  ep_Q2_008_partial_09_0228,
  ep_Q2_008_partial_09_0229,
  ep_Q2_008_partial_09_0230,
  ep_Q2_008_partial_09_0231,
  ep_Q2_008_partial_09_0232,
  ep_Q2_008_partial_09_0233,
  ep_Q2_008_partial_09_0234,
  ep_Q2_008_partial_09_0235,
  ep_Q2_008_partial_09_0236,
  ep_Q2_008_partial_09_0237,
  ep_Q2_008_partial_09_0238,
  ep_Q2_008_partial_09_0239,
  ep_Q2_008_partial_09_0240,
  ep_Q2_008_partial_09_0241,
  ep_Q2_008_partial_09_0242,
  ep_Q2_008_partial_09_0243,
  ep_Q2_008_partial_09_0244,
  ep_Q2_008_partial_09_0245,
  ep_Q2_008_partial_09_0246,
  ep_Q2_008_partial_09_0247,
  ep_Q2_008_partial_09_0248,
  ep_Q2_008_partial_09_0249,
  ep_Q2_008_partial_09_0250,
  ep_Q2_008_partial_09_0251,
  ep_Q2_008_partial_09_0252,
  ep_Q2_008_partial_09_0253,
  ep_Q2_008_partial_09_0254,
  ep_Q2_008_partial_09_0255,
  ep_Q2_008_partial_09_0256,
  ep_Q2_008_partial_09_0257,
  ep_Q2_008_partial_09_0258,
  ep_Q2_008_partial_09_0259,
  ep_Q2_008_partial_09_0260,
  ep_Q2_008_partial_09_0261,
  ep_Q2_008_partial_09_0262,
  ep_Q2_008_partial_09_0263,
  ep_Q2_008_partial_09_0264,
  ep_Q2_008_partial_09_0265,
  ep_Q2_008_partial_09_0266,
  ep_Q2_008_partial_09_0267,
  ep_Q2_008_partial_09_0268,
  ep_Q2_008_partial_09_0269,
  ep_Q2_008_partial_09_0270,
  ep_Q2_008_partial_09_0271,
  ep_Q2_008_partial_09_0272,
  ep_Q2_008_partial_09_0273,
  ep_Q2_008_partial_09_0274,
  ep_Q2_008_partial_09_0275,
  ep_Q2_008_partial_09_0276,
  ep_Q2_008_partial_09_0277,
  ep_Q2_008_partial_09_0278,
  ep_Q2_008_partial_09_0279,
  ep_Q2_008_partial_09_0280,
  ep_Q2_008_partial_09_0281,
  ep_Q2_008_partial_09_0282,
  ep_Q2_008_partial_09_0283,
  ep_Q2_008_partial_09_0284,
  ep_Q2_008_partial_09_0285,
  ep_Q2_008_partial_09_0286,
  ep_Q2_008_partial_09_0287,
  ep_Q2_008_partial_09_0288,
  ep_Q2_008_partial_09_0289,
  ep_Q2_008_partial_09_0290,
  ep_Q2_008_partial_09_0291,
  ep_Q2_008_partial_09_0292,
  ep_Q2_008_partial_09_0293,
  ep_Q2_008_partial_09_0294,
  ep_Q2_008_partial_09_0295,
  ep_Q2_008_partial_09_0296,
  ep_Q2_008_partial_09_0297,
  ep_Q2_008_partial_09_0298,
  ep_Q2_008_partial_09_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0200_0299 : Poly :=
[
  term ((11911384284348060000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-396082794497023885929929673633288000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21856447400000286033 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-98593287434725242249548125513640737429509 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((1310542472713233018723285092142298510413587 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((9747106795423086351482754335923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((-1929438861273630000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-937156870178249543124469579721463580800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((2484053566585162875 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1115993352694573016126162132123746147494921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27855559524908515659 : Rat) / 5543651628913410872) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((149290601779837558108166161035566880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-13442312697672425776431349950816365664000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((445405116347328656253755078351614909118657 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((2067183986819180328946057989946016964456000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3665933836419897000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((35338844328770637459817416030000133630125 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4318109119297864125 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-190089024832007815743118758804140968732800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8255274095743650810831355799772940185600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((5796092951062332393450327332167799786966400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((5955692142174030000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((493040851895273919544992734221892544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-5534490500034563099055427268772064488750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((13609606106705191875 : Rat) / 5543651628913410872) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-107494107555464115841028036439138196800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((18367379696263283985 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((569538475679168151685597517850167727653739 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3161970324541726378145005286450060746155051 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-147795218784743980616819995994150400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2554207703231479395334446151384198266199305 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-160223412553333273269 : Rat) / 11087303257826821744) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((53051766740676201435215402298342730780503 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-152477333095523961442126405814184756699315 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((3023864061132418179351956891186506909977985 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-358719488592699957335047576079709954719989 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2240856262173183602634485044018675200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((154156417625679627441510053209238400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1663203050321205018 : Rat) / 692956453614176359) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((2598030247796611065229584358935842274539709 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1766995190419449736560765670817414400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((409492422465091064703635603907338451414630 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((1824694926321908115 : Rat) / 2771825814456705436) [(2, 1), (7, 2), (13, 2), (16, 1)],
  term ((9216838606328159813265866233152240000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((237551182017078855925418119576003549751989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 2), (15, 4), (16, 1)],
  term ((29854699795745136765 : Rat) / 11087303257826821744) [(2, 1), (7, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-222113309743557078086629171241877898222515 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((-197156402992101326093511633255447314073589 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 3), (15, 3), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 4), (15, 2), (16, 1)],
  term ((234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-704993490517168125 : Rat) / 5543651628913410872) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((792165588994047771859859347266576000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((21856447400000286033 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((98593287434725242249548125513640737429509 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1310542472713233018723285092142298510413587 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(2, 2), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-19494213590846172702965508671846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (7, 2), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((3858877722547260000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1874313740356499086248939159442927161600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2484053566585162875 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(2, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1115993352694573016126162132123746147494921 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((27855559524908515659 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((26884625395344851552862699901632731328000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-445405116347328656253755078351614909118657 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4134367973638360657892115979892033928912000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7331867672839794000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-35338844328770637459817416030000133630125 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((4318109119297864125 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((380178049664015631486237517608281937465600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16510548191487301621662711599545880371200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11592185902124664786900654664335599573932800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((11068981000069126198110854537544128977500 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13609606106705191875 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((214988215110928231682056072878276393600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18367379696263283985 : Rat) / 692956453614176359) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-569538475679168151685597517850167727653739 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-95855121505812862057965008824783296000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((3161970324541726378145005286450060746155051 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((295590437569487961233639991988300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((2554207703231479395334446151384198266199305 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((160223412553333273269 : Rat) / 5543651628913410872) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-53051766740676201435215402298342730780503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((304954666191047922884252811628369513398630 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-3023864061132418179351956891186506909977985 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((358719488592699957335047576079709954719989 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(2, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((47645537137392240000 : Rat) / 692956453614176359) [(2, 2), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-25891905370046625 : Rat) / 692956453614176359) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((4481712524346367205268970088037350400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2639958101834397581263751744806425600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-308312835251359254883020106418476800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((3326406100642410036 : Rat) / 692956453614176359) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((-2598030247796611065229584358935842274539709 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3533990380838899473121531341634828800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-818984844930182129407271207814676902829260 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(2, 2), (7, 2), (13, 2), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-237551182017078855925418119576003549751989 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (15, 4), (16, 1)],
  term ((-29854699795745136765 : Rat) / 5543651628913410872) [(2, 2), (7, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((164273752925072513343636144208473600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((444226619487114156173258342483755796445030 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 3), (15, 2), (16, 1)],
  term ((197156402992101326093511633255447314073589 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (15, 3), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 4), (13, 2), (15, 2), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 4), (15, 2), (16, 1)],
  term ((-234997830172389375 : Rat) / 692956453614176359) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((704993490517168125 : Rat) / 2771825814456705436) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 200 through 299. -/
theorem ep_Q2_008_block_09_0200_0299_valid :
    checkProductSumEq ep_Q2_008_partials_09_0200_0299
      ep_Q2_008_block_09_0200_0299 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
