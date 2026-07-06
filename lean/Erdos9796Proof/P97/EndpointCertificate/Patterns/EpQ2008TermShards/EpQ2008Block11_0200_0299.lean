/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 11:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_11_0200_0299 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0200 : Poly :=
[
  term ((-321210250044198090138158889089491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 200 for generator 11. -/
def ep_Q2_008_partial_11_0200 : Poly :=
[
  term ((-642420500088396180276317778178982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((321210250044198090138158889089491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((321210250044198090138158889089491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-642420500088396180276317778178982400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 11. -/
theorem ep_Q2_008_partial_11_0200_valid :
    mulPoly ep_Q2_008_coefficient_11_0200
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0201 : Poly :=
[
  term ((669803946527471536131174024476313600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 11. -/
def ep_Q2_008_partial_11_0201 : Poly :=
[
  term ((1339607893054943072262348048952627200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-669803946527471536131174024476313600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-669803946527471536131174024476313600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((1339607893054943072262348048952627200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 11. -/
theorem ep_Q2_008_partial_11_0201_valid :
    mulPoly ep_Q2_008_coefficient_11_0201
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0202 : Poly :=
[
  term ((-18349870942212246819158831712518400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 11. -/
def ep_Q2_008_partial_11_0202 : Poly :=
[
  term ((-36699741884424493638317663425036800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((18349870942212246819158831712518400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((18349870942212246819158831712518400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-36699741884424493638317663425036800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 11. -/
theorem ep_Q2_008_partial_11_0202_valid :
    mulPoly ep_Q2_008_coefficient_11_0202
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0203 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 203 for generator 11. -/
def ep_Q2_008_partial_11_0203 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 5), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 11. -/
theorem ep_Q2_008_partial_11_0203_valid :
    mulPoly ep_Q2_008_coefficient_11_0203
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0204 : Poly :=
[
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 204 for generator 11. -/
def ep_Q2_008_partial_11_0204 : Poly :=
[
  term ((-214382095697070000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-214382095697070000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 11. -/
theorem ep_Q2_008_partial_11_0204_valid :
    mulPoly ep_Q2_008_coefficient_11_0204
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0205 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 11. -/
def ep_Q2_008_partial_11_0205 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 11. -/
theorem ep_Q2_008_partial_11_0205_valid :
    mulPoly ep_Q2_008_coefficient_11_0205
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0206 : Poly :=
[
  term ((1059166222365251826631940790887783297583555 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 11. -/
def ep_Q2_008_partial_11_0206 : Poly :=
[
  term ((2118332444730503653263881581775566595167110 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1059166222365251826631940790887783297583555 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1059166222365251826631940790887783297583555 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((2118332444730503653263881581775566595167110 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 11. -/
theorem ep_Q2_008_partial_11_0206_valid :
    mulPoly ep_Q2_008_coefficient_11_0206
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0207 : Poly :=
[
  term ((99644552061280163391 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 207 for generator 11. -/
def ep_Q2_008_partial_11_0207 : Poly :=
[
  term ((199289104122560326782 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-99644552061280163391 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (14, 2), (16, 1)],
  term ((-99644552061280163391 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((199289104122560326782 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 11. -/
theorem ep_Q2_008_partial_11_0207_valid :
    mulPoly ep_Q2_008_coefficient_11_0207
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0208 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 208 for generator 11. -/
def ep_Q2_008_partial_11_0208 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (15, 4), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 11. -/
theorem ep_Q2_008_partial_11_0208_valid :
    mulPoly ep_Q2_008_coefficient_11_0208
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0209 : Poly :=
[
  term ((-9950704885569726053 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 209 for generator 11. -/
def ep_Q2_008_partial_11_0209 : Poly :=
[
  term ((-19901409771139452106 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((9950704885569726053 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((9950704885569726053 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-19901409771139452106 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 11. -/
theorem ep_Q2_008_partial_11_0209_valid :
    mulPoly ep_Q2_008_coefficient_11_0209
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0210 : Poly :=
[
  term ((709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 11. -/
def ep_Q2_008_partial_11_0210 : Poly :=
[
  term ((1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 11. -/
theorem ep_Q2_008_partial_11_0210_valid :
    mulPoly ep_Q2_008_coefficient_11_0210
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0211 : Poly :=
[
  term ((240494826655994366892598718659243200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 11. -/
def ep_Q2_008_partial_11_0211 : Poly :=
[
  term ((480989653311988733785197437318486400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-240494826655994366892598718659243200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-240494826655994366892598718659243200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((480989653311988733785197437318486400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 11. -/
theorem ep_Q2_008_partial_11_0211_valid :
    mulPoly ep_Q2_008_coefficient_11_0211
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0212 : Poly :=
[
  term ((-1151777510136373949328232692866692800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 212 for generator 11. -/
def ep_Q2_008_partial_11_0212 : Poly :=
[
  term ((-2303555020272747898656465385733385600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1151777510136373949328232692866692800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1151777510136373949328232692866692800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2303555020272747898656465385733385600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 11. -/
theorem ep_Q2_008_partial_11_0212_valid :
    mulPoly ep_Q2_008_coefficient_11_0212
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0213 : Poly :=
[
  term ((4858939462685558847 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 213 for generator 11. -/
def ep_Q2_008_partial_11_0213 : Poly :=
[
  term ((4858939462685558847 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4858939462685558847 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 11. -/
theorem ep_Q2_008_partial_11_0213_valid :
    mulPoly ep_Q2_008_coefficient_11_0213
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0214 : Poly :=
[
  term ((-666235584836883667343187760760453105995545 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 11. -/
def ep_Q2_008_partial_11_0214 : Poly :=
[
  term ((-666235584836883667343187760760453105995545 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((666235584836883667343187760760453105995545 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((666235584836883667343187760760453105995545 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-666235584836883667343187760760453105995545 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 11. -/
theorem ep_Q2_008_partial_11_0214_valid :
    mulPoly ep_Q2_008_coefficient_11_0214
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0215 : Poly :=
[
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 215 for generator 11. -/
def ep_Q2_008_partial_11_0215 : Poly :=
[
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 11. -/
theorem ep_Q2_008_partial_11_0215_valid :
    mulPoly ep_Q2_008_coefficient_11_0215
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0216 : Poly :=
[
  term ((5474084778965724345 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 216 for generator 11. -/
def ep_Q2_008_partial_11_0216 : Poly :=
[
  term ((10948169557931448690 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((10948169557931448690 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 11. -/
theorem ep_Q2_008_partial_11_0216_valid :
    mulPoly ep_Q2_008_coefficient_11_0216
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0217 : Poly :=
[
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 11. -/
def ep_Q2_008_partial_11_0217 : Poly :=
[
  term ((221204126551875835518380789595653760000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 3), (16, 1)],
  term ((221204126551875835518380789595653760000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 11. -/
theorem ep_Q2_008_partial_11_0217_valid :
    mulPoly ep_Q2_008_coefficient_11_0217
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0218 : Poly :=
[
  term ((-591538476485587612807978142944916324620767 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 11. -/
def ep_Q2_008_partial_11_0218 : Poly :=
[
  term ((-591538476485587612807978142944916324620767 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((591538476485587612807978142944916324620767 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((591538476485587612807978142944916324620767 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-591538476485587612807978142944916324620767 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 11. -/
theorem ep_Q2_008_partial_11_0218_valid :
    mulPoly ep_Q2_008_coefficient_11_0218
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0219 : Poly :=
[
  term ((14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 219 for generator 11. -/
def ep_Q2_008_partial_11_0219 : Poly :=
[
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 5), (16, 1)],
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 11. -/
theorem ep_Q2_008_partial_11_0219_valid :
    mulPoly ep_Q2_008_coefficient_11_0219
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0220 : Poly :=
[
  term ((28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 11. -/
def ep_Q2_008_partial_11_0220 : Poly :=
[
  term ((56382435440928018839792507125478400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((56382435440928018839792507125478400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 11. -/
theorem ep_Q2_008_partial_11_0220_valid :
    mulPoly ep_Q2_008_coefficient_11_0220
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0221 : Poly :=
[
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 221 for generator 11. -/
def ep_Q2_008_partial_11_0221 : Poly :=
[
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 11. -/
theorem ep_Q2_008_partial_11_0221_valid :
    mulPoly ep_Q2_008_coefficient_11_0221
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0222 : Poly :=
[
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 11. -/
def ep_Q2_008_partial_11_0222 : Poly :=
[
  term ((6092211004233225187531734795707136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((6092211004233225187531734795707136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 11. -/
theorem ep_Q2_008_partial_11_0222_valid :
    mulPoly ep_Q2_008_coefficient_11_0222
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0223 : Poly :=
[
  term ((-14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 11. -/
def ep_Q2_008_partial_11_0223 : Poly :=
[
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 4), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 11. -/
theorem ep_Q2_008_partial_11_0223_valid :
    mulPoly ep_Q2_008_coefficient_11_0223
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0224 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 224 for generator 11. -/
def ep_Q2_008_partial_11_0224 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 11. -/
theorem ep_Q2_008_partial_11_0224_valid :
    mulPoly ep_Q2_008_coefficient_11_0224
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0225 : Poly :=
[
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 11. -/
def ep_Q2_008_partial_11_0225 : Poly :=
[
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 11. -/
theorem ep_Q2_008_partial_11_0225_valid :
    mulPoly ep_Q2_008_coefficient_11_0225
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0226 : Poly :=
[
  term ((25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 226 for generator 11. -/
def ep_Q2_008_partial_11_0226 : Poly :=
[
  term ((50937185937623832000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((50937185937623832000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 11. -/
theorem ep_Q2_008_partial_11_0226_valid :
    mulPoly ep_Q2_008_coefficient_11_0226
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0227 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 227 for generator 11. -/
def ep_Q2_008_partial_11_0227 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 11. -/
theorem ep_Q2_008_partial_11_0227_valid :
    mulPoly ep_Q2_008_coefficient_11_0227
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0228 : Poly :=
[
  term ((-6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 228 for generator 11. -/
def ep_Q2_008_partial_11_0228 : Poly :=
[
  term ((-12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 11. -/
theorem ep_Q2_008_partial_11_0228_valid :
    mulPoly ep_Q2_008_coefficient_11_0228
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0229 : Poly :=
[
  term ((1401694617601348875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 229 for generator 11. -/
def ep_Q2_008_partial_11_0229 : Poly :=
[
  term ((1401694617601348875 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1401694617601348875 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 11. -/
theorem ep_Q2_008_partial_11_0229_valid :
    mulPoly ep_Q2_008_coefficient_11_0229
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0230 : Poly :=
[
  term ((-4337636013455194310139724322981298746829600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 11. -/
def ep_Q2_008_partial_11_0230 : Poly :=
[
  term ((-8675272026910388620279448645962597493659200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4337636013455194310139724322981298746829600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((4337636013455194310139724322981298746829600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-8675272026910388620279448645962597493659200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 11. -/
theorem ep_Q2_008_partial_11_0230_valid :
    mulPoly ep_Q2_008_coefficient_11_0230
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0231 : Poly :=
[
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 11. -/
def ep_Q2_008_partial_11_0231 : Poly :=
[
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 11. -/
theorem ep_Q2_008_partial_11_0231_valid :
    mulPoly ep_Q2_008_coefficient_11_0231
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0232 : Poly :=
[
  term ((71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 232 for generator 11. -/
def ep_Q2_008_partial_11_0232 : Poly :=
[
  term ((142936611412176720000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((142936611412176720000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 11. -/
theorem ep_Q2_008_partial_11_0232_valid :
    mulPoly ep_Q2_008_coefficient_11_0232
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0233 : Poly :=
[
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 11. -/
def ep_Q2_008_partial_11_0233 : Poly :=
[
  term ((11832980445486574069079825621325421056000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((11832980445486574069079825621325421056000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 11. -/
theorem ep_Q2_008_partial_11_0233_valid :
    mulPoly ep_Q2_008_coefficient_11_0233
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0234 : Poly :=
[
  term ((-1401694617601348875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 11. -/
def ep_Q2_008_partial_11_0234 : Poly :=
[
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 11. -/
theorem ep_Q2_008_partial_11_0234_valid :
    mulPoly ep_Q2_008_coefficient_11_0234
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0235 : Poly :=
[
  term ((118403694843549807714 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 235 for generator 11. -/
def ep_Q2_008_partial_11_0235 : Poly :=
[
  term ((236807389687099615428 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-118403694843549807714 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-118403694843549807714 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((236807389687099615428 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 11. -/
theorem ep_Q2_008_partial_11_0235_valid :
    mulPoly ep_Q2_008_coefficient_11_0235
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0236 : Poly :=
[
  term ((28945077616502169639 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 236 for generator 11. -/
def ep_Q2_008_partial_11_0236 : Poly :=
[
  term ((28945077616502169639 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-28945077616502169639 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-28945077616502169639 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((28945077616502169639 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 11. -/
theorem ep_Q2_008_partial_11_0236_valid :
    mulPoly ep_Q2_008_coefficient_11_0236
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0237 : Poly :=
[
  term ((-8603261047386025820453142613221097849541903 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 11. -/
def ep_Q2_008_partial_11_0237 : Poly :=
[
  term ((-8603261047386025820453142613221097849541903 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8603261047386025820453142613221097849541903 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8603261047386025820453142613221097849541903 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8603261047386025820453142613221097849541903 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 11. -/
theorem ep_Q2_008_partial_11_0237_valid :
    mulPoly ep_Q2_008_coefficient_11_0237
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0238 : Poly :=
[
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 238 for generator 11. -/
def ep_Q2_008_partial_11_0238 : Poly :=
[
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 5), (16, 1)],
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 11. -/
theorem ep_Q2_008_partial_11_0238_valid :
    mulPoly ep_Q2_008_coefficient_11_0238
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0239 : Poly :=
[
  term ((-54900847675239985366185703060946816179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 239 for generator 11. -/
def ep_Q2_008_partial_11_0239 : Poly :=
[
  term ((-109801695350479970732371406121893632358400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((54900847675239985366185703060946816179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((54900847675239985366185703060946816179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 4), (16, 1)],
  term ((-109801695350479970732371406121893632358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 11. -/
theorem ep_Q2_008_partial_11_0239_valid :
    mulPoly ep_Q2_008_coefficient_11_0239
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0240 : Poly :=
[
  term ((-109719915076804339245 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 240 for generator 11. -/
def ep_Q2_008_partial_11_0240 : Poly :=
[
  term ((-109719915076804339245 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((109719915076804339245 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 2), (14, 2), (16, 1)],
  term ((109719915076804339245 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-109719915076804339245 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 11. -/
theorem ep_Q2_008_partial_11_0240_valid :
    mulPoly ep_Q2_008_coefficient_11_0240
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0241 : Poly :=
[
  term ((102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 11. -/
def ep_Q2_008_partial_11_0241 : Poly :=
[
  term ((205684388472497618145672645264016490649600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 3), (16, 1)],
  term ((205684388472497618145672645264016490649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 11. -/
theorem ep_Q2_008_partial_11_0241_valid :
    mulPoly ep_Q2_008_coefficient_11_0241
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0242 : Poly :=
[
  term ((4173645954211731293768558624477927457247073 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 242 for generator 11. -/
def ep_Q2_008_partial_11_0242 : Poly :=
[
  term ((4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4173645954211731293768558624477927457247073 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4173645954211731293768558624477927457247073 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 11. -/
theorem ep_Q2_008_partial_11_0242_valid :
    mulPoly ep_Q2_008_coefficient_11_0242
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0243 : Poly :=
[
  term ((-35690220179020741603 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 243 for generator 11. -/
def ep_Q2_008_partial_11_0243 : Poly :=
[
  term ((-35690220179020741603 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((35690220179020741603 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((35690220179020741603 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-35690220179020741603 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 11. -/
theorem ep_Q2_008_partial_11_0243_valid :
    mulPoly ep_Q2_008_coefficient_11_0243
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0244 : Poly :=
[
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 11. -/
def ep_Q2_008_partial_11_0244 : Poly :=
[
  term ((-68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 11. -/
theorem ep_Q2_008_partial_11_0244_valid :
    mulPoly ep_Q2_008_coefficient_11_0244
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0245 : Poly :=
[
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 11. -/
def ep_Q2_008_partial_11_0245 : Poly :=
[
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 11. -/
theorem ep_Q2_008_partial_11_0245_valid :
    mulPoly ep_Q2_008_coefficient_11_0245
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0246 : Poly :=
[
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 11. -/
def ep_Q2_008_partial_11_0246 : Poly :=
[
  term ((-3872455522977205190801794830365952000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3872455522977205190801794830365952000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 11. -/
theorem ep_Q2_008_partial_11_0246_valid :
    mulPoly ep_Q2_008_coefficient_11_0246
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0247 : Poly :=
[
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 247 for generator 11. -/
def ep_Q2_008_partial_11_0247 : Poly :=
[
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 4), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 11. -/
theorem ep_Q2_008_partial_11_0247_valid :
    mulPoly ep_Q2_008_coefficient_11_0247
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0248 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 248 for generator 11. -/
def ep_Q2_008_partial_11_0248 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (13, 1), (14, 2), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-15042639383838845127 : Rat) / 1385912907228352718) [(3, 2), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 11. -/
theorem ep_Q2_008_partial_11_0248_valid :
    mulPoly ep_Q2_008_coefficient_11_0248
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0249 : Poly :=
[
  term ((161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 11. -/
def ep_Q2_008_partial_11_0249 : Poly :=
[
  term ((322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 3), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 11. -/
theorem ep_Q2_008_partial_11_0249_valid :
    mulPoly ep_Q2_008_coefficient_11_0249
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0250 : Poly :=
[
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)]
]

/-- Partial product 250 for generator 11. -/
def ep_Q2_008_partial_11_0250 : Poly :=
[
  term ((-645838335510271678440 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (14, 1), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (14, 2), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (15, 2), (16, 1)],
  term ((-645838335510271678440 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 11. -/
theorem ep_Q2_008_partial_11_0250_valid :
    mulPoly ep_Q2_008_coefficient_11_0250
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0251 : Poly :=
[
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 11. -/
def ep_Q2_008_partial_11_0251 : Poly :=
[
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 11. -/
theorem ep_Q2_008_partial_11_0251_valid :
    mulPoly ep_Q2_008_coefficient_11_0251
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0252 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 11. -/
def ep_Q2_008_partial_11_0252 : Poly :=
[
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 11. -/
theorem ep_Q2_008_partial_11_0252_valid :
    mulPoly ep_Q2_008_coefficient_11_0252
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0253 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 253 for generator 11. -/
def ep_Q2_008_partial_11_0253 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 11. -/
theorem ep_Q2_008_partial_11_0253_valid :
    mulPoly ep_Q2_008_coefficient_11_0253
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0254 : Poly :=
[
  term ((-509429933844214244720981026454726400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 11. -/
def ep_Q2_008_partial_11_0254 : Poly :=
[
  term ((-1018859867688428489441962052909452800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((509429933844214244720981026454726400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((509429933844214244720981026454726400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1018859867688428489441962052909452800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 11. -/
theorem ep_Q2_008_partial_11_0254_valid :
    mulPoly ep_Q2_008_coefficient_11_0254
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0255 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 255 for generator 11. -/
def ep_Q2_008_partial_11_0255 : Poly :=
[
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 11. -/
theorem ep_Q2_008_partial_11_0255_valid :
    mulPoly ep_Q2_008_coefficient_11_0255
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0256 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 11. -/
def ep_Q2_008_partial_11_0256 : Poly :=
[
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 11. -/
theorem ep_Q2_008_partial_11_0256_valid :
    mulPoly ep_Q2_008_coefficient_11_0256
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0257 : Poly :=
[
  term ((51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 257 for generator 11. -/
def ep_Q2_008_partial_11_0257 : Poly :=
[
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 11. -/
theorem ep_Q2_008_partial_11_0257_valid :
    mulPoly ep_Q2_008_coefficient_11_0257
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0258 : Poly :=
[
  term ((-1541556721899744477 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 258 for generator 11. -/
def ep_Q2_008_partial_11_0258 : Poly :=
[
  term ((-3083113443799488954 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((1541556721899744477 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((1541556721899744477 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-3083113443799488954 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 11. -/
theorem ep_Q2_008_partial_11_0258_valid :
    mulPoly ep_Q2_008_coefficient_11_0258
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0259 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 11. -/
def ep_Q2_008_partial_11_0259 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 11. -/
theorem ep_Q2_008_partial_11_0259_valid :
    mulPoly ep_Q2_008_coefficient_11_0259
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0260 : Poly :=
[
  term ((-14445643082167087921465463263046400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 11. -/
def ep_Q2_008_partial_11_0260 : Poly :=
[
  term ((-28891286164334175842930926526092800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((14445643082167087921465463263046400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((14445643082167087921465463263046400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((-28891286164334175842930926526092800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 11. -/
theorem ep_Q2_008_partial_11_0260_valid :
    mulPoly ep_Q2_008_coefficient_11_0260
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0261 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 11. -/
def ep_Q2_008_partial_11_0261 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 11. -/
theorem ep_Q2_008_partial_11_0261_valid :
    mulPoly ep_Q2_008_coefficient_11_0261
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0262 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 262 for generator 11. -/
def ep_Q2_008_partial_11_0262 : Poly :=
[
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 11. -/
theorem ep_Q2_008_partial_11_0262_valid :
    mulPoly ep_Q2_008_coefficient_11_0262
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0263 : Poly :=
[
  term ((-10033082078622876000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 263 for generator 11. -/
def ep_Q2_008_partial_11_0263 : Poly :=
[
  term ((-20066164157245752000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((10033082078622876000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((10033082078622876000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20066164157245752000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 11. -/
theorem ep_Q2_008_partial_11_0263_valid :
    mulPoly ep_Q2_008_coefficient_11_0263
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0264 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 264 for generator 11. -/
def ep_Q2_008_partial_11_0264 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 11. -/
theorem ep_Q2_008_partial_11_0264_valid :
    mulPoly ep_Q2_008_coefficient_11_0264
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0265 : Poly :=
[
  term ((-3454865766536128224803881592990986137600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 11. -/
def ep_Q2_008_partial_11_0265 : Poly :=
[
  term ((-6909731533072256449607763185981972275200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3454865766536128224803881592990986137600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3454865766536128224803881592990986137600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6909731533072256449607763185981972275200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 11. -/
theorem ep_Q2_008_partial_11_0265_valid :
    mulPoly ep_Q2_008_coefficient_11_0265
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0266 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 266 for generator 11. -/
def ep_Q2_008_partial_11_0266 : Poly :=
[
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 11. -/
theorem ep_Q2_008_partial_11_0266_valid :
    mulPoly ep_Q2_008_coefficient_11_0266
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0267 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 11. -/
def ep_Q2_008_partial_11_0267 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 11. -/
theorem ep_Q2_008_partial_11_0267_valid :
    mulPoly ep_Q2_008_coefficient_11_0267
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0268 : Poly :=
[
  term ((-16740180167415750 : Rat) / 23895050124626771) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 268 for generator 11. -/
def ep_Q2_008_partial_11_0268 : Poly :=
[
  term ((-33480360334831500 : Rat) / 23895050124626771) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((16740180167415750 : Rat) / 23895050124626771) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((16740180167415750 : Rat) / 23895050124626771) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-33480360334831500 : Rat) / 23895050124626771) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 11. -/
theorem ep_Q2_008_partial_11_0268_valid :
    mulPoly ep_Q2_008_coefficient_11_0268
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0269 : Poly :=
[
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 269 for generator 11. -/
def ep_Q2_008_partial_11_0269 : Poly :=
[
  term ((7995170523765116349 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 11. -/
theorem ep_Q2_008_partial_11_0269_valid :
    mulPoly ep_Q2_008_coefficient_11_0269
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0270 : Poly :=
[
  term ((-1174648995977519021446063076431609808224521 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 11. -/
def ep_Q2_008_partial_11_0270 : Poly :=
[
  term ((-1174648995977519021446063076431609808224521 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1174648995977519021446063076431609808224521 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1174648995977519021446063076431609808224521 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1174648995977519021446063076431609808224521 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 11. -/
theorem ep_Q2_008_partial_11_0270_valid :
    mulPoly ep_Q2_008_coefficient_11_0270
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0271 : Poly :=
[
  term ((-144404727539770147115535268492584691200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 11. -/
def ep_Q2_008_partial_11_0271 : Poly :=
[
  term ((-288809455079540294231070536985169382400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((144404727539770147115535268492584691200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((144404727539770147115535268492584691200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((-288809455079540294231070536985169382400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 11. -/
theorem ep_Q2_008_partial_11_0271_valid :
    mulPoly ep_Q2_008_coefficient_11_0271
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0272 : Poly :=
[
  term ((29857327814239513503 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 272 for generator 11. -/
def ep_Q2_008_partial_11_0272 : Poly :=
[
  term ((29857327814239513503 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29857327814239513503 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-29857327814239513503 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((29857327814239513503 : Rat) / 692956453614176359) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 11. -/
theorem ep_Q2_008_partial_11_0272_valid :
    mulPoly ep_Q2_008_coefficient_11_0272
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0273 : Poly :=
[
  term ((-28782948161407572345593682297924799968000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 11. -/
def ep_Q2_008_partial_11_0273 : Poly :=
[
  term ((-57565896322815144691187364595849599936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((28782948161407572345593682297924799968000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((28782948161407572345593682297924799968000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-57565896322815144691187364595849599936000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 11. -/
theorem ep_Q2_008_partial_11_0273_valid :
    mulPoly ep_Q2_008_coefficient_11_0273
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0274 : Poly :=
[
  term ((-326120127030018828318780599257975860522407 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 11. -/
def ep_Q2_008_partial_11_0274 : Poly :=
[
  term ((-326120127030018828318780599257975860522407 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((326120127030018828318780599257975860522407 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((326120127030018828318780599257975860522407 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-326120127030018828318780599257975860522407 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 11. -/
theorem ep_Q2_008_partial_11_0274_valid :
    mulPoly ep_Q2_008_coefficient_11_0274
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0275 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 11. -/
def ep_Q2_008_partial_11_0275 : Poly :=
[
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 11. -/
theorem ep_Q2_008_partial_11_0275_valid :
    mulPoly ep_Q2_008_coefficient_11_0275
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0276 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 276 for generator 11. -/
def ep_Q2_008_partial_11_0276 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 11. -/
theorem ep_Q2_008_partial_11_0276_valid :
    mulPoly ep_Q2_008_coefficient_11_0276
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0277 : Poly :=
[
  term ((54557096725901158631014601818785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 11. -/
def ep_Q2_008_partial_11_0277 : Poly :=
[
  term ((109114193451802317262029203637571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54557096725901158631014601818785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-54557096725901158631014601818785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((109114193451802317262029203637571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 11. -/
theorem ep_Q2_008_partial_11_0277_valid :
    mulPoly ep_Q2_008_coefficient_11_0277
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0278 : Poly :=
[
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 278 for generator 11. -/
def ep_Q2_008_partial_11_0278 : Poly :=
[
  term ((-4014328837908197853 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4014328837908197853 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 11. -/
theorem ep_Q2_008_partial_11_0278_valid :
    mulPoly ep_Q2_008_coefficient_11_0278
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0279 : Poly :=
[
  term ((-40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 11. -/
def ep_Q2_008_partial_11_0279 : Poly :=
[
  term ((-81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 11. -/
theorem ep_Q2_008_partial_11_0279_valid :
    mulPoly ep_Q2_008_coefficient_11_0279
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0280 : Poly :=
[
  term ((-6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 11. -/
def ep_Q2_008_partial_11_0280 : Poly :=
[
  term ((-13422466125741460072414787393529600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-13422466125741460072414787393529600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 11. -/
theorem ep_Q2_008_partial_11_0280_valid :
    mulPoly ep_Q2_008_coefficient_11_0280
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0281 : Poly :=
[
  term ((34726194858866092749 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 281 for generator 11. -/
def ep_Q2_008_partial_11_0281 : Poly :=
[
  term ((34726194858866092749 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-34726194858866092749 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-34726194858866092749 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((34726194858866092749 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 11. -/
theorem ep_Q2_008_partial_11_0281_valid :
    mulPoly ep_Q2_008_coefficient_11_0281
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0282 : Poly :=
[
  term ((504720859204354363061160310050665403969 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 11. -/
def ep_Q2_008_partial_11_0282 : Poly :=
[
  term ((1009441718408708726122320620101330807938 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-504720859204354363061160310050665403969 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-504720859204354363061160310050665403969 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1009441718408708726122320620101330807938 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 11. -/
theorem ep_Q2_008_partial_11_0282_valid :
    mulPoly ep_Q2_008_coefficient_11_0282
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0283 : Poly :=
[
  term ((-1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 283 for generator 11. -/
def ep_Q2_008_partial_11_0283 : Poly :=
[
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 5), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 11. -/
theorem ep_Q2_008_partial_11_0283_valid :
    mulPoly ep_Q2_008_coefficient_11_0283
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0284 : Poly :=
[
  term ((2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 284 for generator 11. -/
def ep_Q2_008_partial_11_0284 : Poly :=
[
  term ((4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 11. -/
theorem ep_Q2_008_partial_11_0284_valid :
    mulPoly ep_Q2_008_coefficient_11_0284
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0285 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 285 for generator 11. -/
def ep_Q2_008_partial_11_0285 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 11. -/
theorem ep_Q2_008_partial_11_0285_valid :
    mulPoly ep_Q2_008_coefficient_11_0285
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0286 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 11. -/
def ep_Q2_008_partial_11_0286 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 11. -/
theorem ep_Q2_008_partial_11_0286_valid :
    mulPoly ep_Q2_008_coefficient_11_0286
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0287 : Poly :=
[
  term ((-14817096371287005912723112072842021887901 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 287 for generator 11. -/
def ep_Q2_008_partial_11_0287 : Poly :=
[
  term ((-14817096371287005912723112072842021887901 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((14817096371287005912723112072842021887901 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((14817096371287005912723112072842021887901 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-14817096371287005912723112072842021887901 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 11. -/
theorem ep_Q2_008_partial_11_0287_valid :
    mulPoly ep_Q2_008_coefficient_11_0287
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0288 : Poly :=
[
  term ((-16609879550066481557 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 288 for generator 11. -/
def ep_Q2_008_partial_11_0288 : Poly :=
[
  term ((-16609879550066481557 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((16609879550066481557 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((16609879550066481557 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16609879550066481557 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 11. -/
theorem ep_Q2_008_partial_11_0288_valid :
    mulPoly ep_Q2_008_coefficient_11_0288
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0289 : Poly :=
[
  term ((-1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 11. -/
def ep_Q2_008_partial_11_0289 : Poly :=
[
  term ((-2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 11. -/
theorem ep_Q2_008_partial_11_0289_valid :
    mulPoly ep_Q2_008_coefficient_11_0289
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0290 : Poly :=
[
  term ((480276122013428756469412097567376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 11. -/
def ep_Q2_008_partial_11_0290 : Poly :=
[
  term ((960552244026857512938824195134752000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-480276122013428756469412097567376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-480276122013428756469412097567376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((960552244026857512938824195134752000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 11. -/
theorem ep_Q2_008_partial_11_0290_valid :
    mulPoly ep_Q2_008_coefficient_11_0290
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0291 : Poly :=
[
  term ((67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 291 for generator 11. -/
def ep_Q2_008_partial_11_0291 : Poly :=
[
  term ((135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 11. -/
theorem ep_Q2_008_partial_11_0291_valid :
    mulPoly ep_Q2_008_coefficient_11_0291
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0292 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 11. -/
def ep_Q2_008_partial_11_0292 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 11. -/
theorem ep_Q2_008_partial_11_0292_valid :
    mulPoly ep_Q2_008_coefficient_11_0292
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0293 : Poly :=
[
  term ((2360487188946843195616910120025600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 11. -/
def ep_Q2_008_partial_11_0293 : Poly :=
[
  term ((4720974377893686391233820240051200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2360487188946843195616910120025600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2360487188946843195616910120025600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((4720974377893686391233820240051200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 11. -/
theorem ep_Q2_008_partial_11_0293_valid :
    mulPoly ep_Q2_008_coefficient_11_0293
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0294 : Poly :=
[
  term ((-33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 294 for generator 11. -/
def ep_Q2_008_partial_11_0294 : Poly :=
[
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 2), (15, 3), (16, 1)],
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 5), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 11. -/
theorem ep_Q2_008_partial_11_0294_valid :
    mulPoly ep_Q2_008_coefficient_11_0294
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0295 : Poly :=
[
  term ((-234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 295 for generator 11. -/
def ep_Q2_008_partial_11_0295 : Poly :=
[
  term ((-469995660344778750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-469995660344778750 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 11. -/
theorem ep_Q2_008_partial_11_0295_valid :
    mulPoly ep_Q2_008_coefficient_11_0295
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0296 : Poly :=
[
  term ((234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 11. -/
def ep_Q2_008_partial_11_0296 : Poly :=
[
  term ((234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 11. -/
theorem ep_Q2_008_partial_11_0296_valid :
    mulPoly ep_Q2_008_coefficient_11_0296
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0297 : Poly :=
[
  term ((-37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 11. -/
def ep_Q2_008_partial_11_0297 : Poly :=
[
  term ((-75135467655888909367688745185022516660600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-75135467655888909367688745185022516660600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 11. -/
theorem ep_Q2_008_partial_11_0297_valid :
    mulPoly ep_Q2_008_coefficient_11_0297
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0298 : Poly :=
[
  term ((18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 298 for generator 11. -/
def ep_Q2_008_partial_11_0298 : Poly :=
[
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 11. -/
theorem ep_Q2_008_partial_11_0298_valid :
    mulPoly ep_Q2_008_coefficient_11_0298
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0299 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 299 for generator 11. -/
def ep_Q2_008_partial_11_0299 : Poly :=
[
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 11. -/
theorem ep_Q2_008_partial_11_0299_valid :
    mulPoly ep_Q2_008_coefficient_11_0299
        ep_Q2_008_generator_11_0200_0299 =
      ep_Q2_008_partial_11_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_11_0200_0299 : List Poly :=
[
  ep_Q2_008_partial_11_0200,
  ep_Q2_008_partial_11_0201,
  ep_Q2_008_partial_11_0202,
  ep_Q2_008_partial_11_0203,
  ep_Q2_008_partial_11_0204,
  ep_Q2_008_partial_11_0205,
  ep_Q2_008_partial_11_0206,
  ep_Q2_008_partial_11_0207,
  ep_Q2_008_partial_11_0208,
  ep_Q2_008_partial_11_0209,
  ep_Q2_008_partial_11_0210,
  ep_Q2_008_partial_11_0211,
  ep_Q2_008_partial_11_0212,
  ep_Q2_008_partial_11_0213,
  ep_Q2_008_partial_11_0214,
  ep_Q2_008_partial_11_0215,
  ep_Q2_008_partial_11_0216,
  ep_Q2_008_partial_11_0217,
  ep_Q2_008_partial_11_0218,
  ep_Q2_008_partial_11_0219,
  ep_Q2_008_partial_11_0220,
  ep_Q2_008_partial_11_0221,
  ep_Q2_008_partial_11_0222,
  ep_Q2_008_partial_11_0223,
  ep_Q2_008_partial_11_0224,
  ep_Q2_008_partial_11_0225,
  ep_Q2_008_partial_11_0226,
  ep_Q2_008_partial_11_0227,
  ep_Q2_008_partial_11_0228,
  ep_Q2_008_partial_11_0229,
  ep_Q2_008_partial_11_0230,
  ep_Q2_008_partial_11_0231,
  ep_Q2_008_partial_11_0232,
  ep_Q2_008_partial_11_0233,
  ep_Q2_008_partial_11_0234,
  ep_Q2_008_partial_11_0235,
  ep_Q2_008_partial_11_0236,
  ep_Q2_008_partial_11_0237,
  ep_Q2_008_partial_11_0238,
  ep_Q2_008_partial_11_0239,
  ep_Q2_008_partial_11_0240,
  ep_Q2_008_partial_11_0241,
  ep_Q2_008_partial_11_0242,
  ep_Q2_008_partial_11_0243,
  ep_Q2_008_partial_11_0244,
  ep_Q2_008_partial_11_0245,
  ep_Q2_008_partial_11_0246,
  ep_Q2_008_partial_11_0247,
  ep_Q2_008_partial_11_0248,
  ep_Q2_008_partial_11_0249,
  ep_Q2_008_partial_11_0250,
  ep_Q2_008_partial_11_0251,
  ep_Q2_008_partial_11_0252,
  ep_Q2_008_partial_11_0253,
  ep_Q2_008_partial_11_0254,
  ep_Q2_008_partial_11_0255,
  ep_Q2_008_partial_11_0256,
  ep_Q2_008_partial_11_0257,
  ep_Q2_008_partial_11_0258,
  ep_Q2_008_partial_11_0259,
  ep_Q2_008_partial_11_0260,
  ep_Q2_008_partial_11_0261,
  ep_Q2_008_partial_11_0262,
  ep_Q2_008_partial_11_0263,
  ep_Q2_008_partial_11_0264,
  ep_Q2_008_partial_11_0265,
  ep_Q2_008_partial_11_0266,
  ep_Q2_008_partial_11_0267,
  ep_Q2_008_partial_11_0268,
  ep_Q2_008_partial_11_0269,
  ep_Q2_008_partial_11_0270,
  ep_Q2_008_partial_11_0271,
  ep_Q2_008_partial_11_0272,
  ep_Q2_008_partial_11_0273,
  ep_Q2_008_partial_11_0274,
  ep_Q2_008_partial_11_0275,
  ep_Q2_008_partial_11_0276,
  ep_Q2_008_partial_11_0277,
  ep_Q2_008_partial_11_0278,
  ep_Q2_008_partial_11_0279,
  ep_Q2_008_partial_11_0280,
  ep_Q2_008_partial_11_0281,
  ep_Q2_008_partial_11_0282,
  ep_Q2_008_partial_11_0283,
  ep_Q2_008_partial_11_0284,
  ep_Q2_008_partial_11_0285,
  ep_Q2_008_partial_11_0286,
  ep_Q2_008_partial_11_0287,
  ep_Q2_008_partial_11_0288,
  ep_Q2_008_partial_11_0289,
  ep_Q2_008_partial_11_0290,
  ep_Q2_008_partial_11_0291,
  ep_Q2_008_partial_11_0292,
  ep_Q2_008_partial_11_0293,
  ep_Q2_008_partial_11_0294,
  ep_Q2_008_partial_11_0295,
  ep_Q2_008_partial_11_0296,
  ep_Q2_008_partial_11_0297,
  ep_Q2_008_partial_11_0298,
  ep_Q2_008_partial_11_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_11_0200_0299 : Poly :=
[
  term ((-642420500088396180276317778178982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1339607893054943072262348048952627200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-36699741884424493638317663425036800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-214382095697070000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2118332444730503653263881581775566595167110 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((199289104122560326782 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19901409771139452106 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((480989653311988733785197437318486400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2303555020272747898656465385733385600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4858939462685558847 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-666235584836883667343187760760453105995545 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((10948169557931448690 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((221204126551875835518380789595653760000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-591538476485587612807978142944916324620767 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((56382435440928018839792507125478400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((6092211004233225187531734795707136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((50937185937623832000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1401694617601348875 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8675272026910388620279448645962597493659200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((142936611412176720000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((11832980445486574069079825621325421056000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((236807389687099615428 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((28945077616502169639 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8603261047386025820453142613221097849541903 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-109801695350479970732371406121893632358400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-109719915076804339245 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((205684388472497618145672645264016490649600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35690220179020741603 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3872455522977205190801794830365952000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15042639383838845127 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-645838335510271678440 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (14, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1018859867688428489441962052909452800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3083113443799488954 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28891286164334175842930926526092800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-20066164157245752000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6909731533072256449607763185981972275200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-33480360334831500 : Rat) / 23895050124626771) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1174648995977519021446063076431609808224521 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-288809455079540294231070536985169382400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((29857327814239513503 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-57565896322815144691187364595849599936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-326120127030018828318780599257975860522407 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((109114193451802317262029203637571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4014328837908197853 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-13422466125741460072414787393529600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((34726194858866092749 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((1009441718408708726122320620101330807938 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-14817096371287005912723112072842021887901 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16609879550066481557 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((960552244026857512938824195134752000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4720974377893686391233820240051200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-469995660344778750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75135467655888909367688745185022516660600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((321210250044198090138158889089491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((321210250044198090138158889089491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-669803946527471536131174024476313600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-669803946527471536131174024476313600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((18349870942212246819158831712518400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((18349870942212246819158831712518400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 5), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1059166222365251826631940790887783297583555 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1059166222365251826631940790887783297583555 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-99644552061280163391 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (14, 2), (16, 1)],
  term ((-99644552061280163391 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((9950704885569726053 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((9950704885569726053 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (15, 4), (16, 1)],
  term ((-709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-240494826655994366892598718659243200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-240494826655994366892598718659243200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1151777510136373949328232692866692800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1151777510136373949328232692866692800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((666235584836883667343187760760453105995545 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((666235584836883667343187760760453105995545 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 3), (16, 1)],
  term ((591538476485587612807978142944916324620767 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((591538476485587612807978142944916324620767 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 5), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 4), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((4337636013455194310139724322981298746829600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((4337636013455194310139724322981298746829600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 3), (16, 1)],
  term ((1401694617601348875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-118403694843549807714 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-118403694843549807714 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-28945077616502169639 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-28945077616502169639 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((8603261047386025820453142613221097849541903 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((8603261047386025820453142613221097849541903 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 5), (16, 1)],
  term ((54900847675239985366185703060946816179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((109719915076804339245 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 2), (14, 2), (16, 1)],
  term ((109719915076804339245 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((54900847675239985366185703060946816179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 4), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 3), (16, 1)],
  term ((-4173645954211731293768558624477927457247073 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((35690220179020741603 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((35690220179020741603 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-4173645954211731293768558624477927457247073 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 4), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (13, 1), (14, 2), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 3), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (14, 2), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (15, 2), (16, 1)],
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((509429933844214244720981026454726400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((509429933844214244720981026454726400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((1541556721899744477 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((1541556721899744477 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((14445643082167087921465463263046400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((14445643082167087921465463263046400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((10033082078622876000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((10033082078622876000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3454865766536128224803881592990986137600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3454865766536128224803881592990986137600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((16740180167415750 : Rat) / 23895050124626771) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((16740180167415750 : Rat) / 23895050124626771) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1174648995977519021446063076431609808224521 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1174648995977519021446063076431609808224521 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((144404727539770147115535268492584691200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-29857327814239513503 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-29857327814239513503 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((144404727539770147115535268492584691200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((28782948161407572345593682297924799968000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((28782948161407572345593682297924799968000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((326120127030018828318780599257975860522407 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((326120127030018828318780599257975860522407 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-54557096725901158631014601818785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-54557096725901158631014601818785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-34726194858866092749 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-34726194858866092749 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-504720859204354363061160310050665403969 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-504720859204354363061160310050665403969 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 5), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((14817096371287005912723112072842021887901 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((16609879550066481557 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((16609879550066481557 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((14817096371287005912723112072842021887901 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-480276122013428756469412097567376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-480276122013428756469412097567376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 4), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-2360487188946843195616910120025600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 2), (15, 3), (16, 1)],
  term ((-2360487188946843195616910120025600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 5), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((-642420500088396180276317778178982400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1339607893054943072262348048952627200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-36699741884424493638317663425036800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((-214382095697070000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2118332444730503653263881581775566595167110 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((199289104122560326782 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19901409771139452106 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((1419900358424975236627324771134182400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((480989653311988733785197437318486400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((4858939462685558847 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2303555020272747898656465385733385600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-666235584836883667343187760760453105995545 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((10948169557931448690 : Rat) / 692956453614176359) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((221204126551875835518380789595653760000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-591538476485587612807978142944916324620767 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((56382435440928018839792507125478400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((6092211004233225187531734795707136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((50937185937623832000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8675272026910388620279448645962597493659200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((142936611412176720000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((11832980445486574069079825621325421056000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1401694617601348875 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((236807389687099615428 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((28945077616502169639 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8603261047386025820453142613221097849541903 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-109719915076804339245 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-109801695350479970732371406121893632358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((205684388472497618145672645264016490649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-35690220179020741603 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((4173645954211731293768558624477927457247073 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3872455522977205190801794830365952000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-15042639383838845127 : Rat) / 1385912907228352718) [(3, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-645838335510271678440 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 3), (15, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1018859867688428489441962052909452800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3083113443799488954 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-28891286164334175842930926526092800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20066164157245752000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6909731533072256449607763185981972275200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-33480360334831500 : Rat) / 23895050124626771) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1174648995977519021446063076431609808224521 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((29857327814239513503 : Rat) / 692956453614176359) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288809455079540294231070536985169382400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-57565896322815144691187364595849599936000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-326120127030018828318780599257975860522407 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((109114193451802317262029203637571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4014328837908197853 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((34726194858866092749 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13422466125741460072414787393529600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1009441718408708726122320620101330807938 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-16609879550066481557 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-14817096371287005912723112072842021887901 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((960552244026857512938824195134752000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((4720974377893686391233820240051200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 4), (16, 1)],
  term ((-469995660344778750 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-75135467655888909367688745185022516660600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 200 through 299. -/
theorem ep_Q2_008_block_11_0200_0299_valid :
    checkProductSumEq ep_Q2_008_partials_11_0200_0299
      ep_Q2_008_block_11_0200_0299 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
