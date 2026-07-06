/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0200 : Poly :=
[
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 27. -/
def ep_Q2_008_partial_27_0200 : Poly :=
[
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 27. -/
theorem ep_Q2_008_partial_27_0200_valid :
    mulPoly ep_Q2_008_coefficient_27_0200
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0201 : Poly :=
[
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 27. -/
def ep_Q2_008_partial_27_0201 : Poly :=
[
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 27. -/
theorem ep_Q2_008_partial_27_0201_valid :
    mulPoly ep_Q2_008_coefficient_27_0201
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0202 : Poly :=
[
  term ((1003049427712081822267897744037560800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 27. -/
def ep_Q2_008_partial_27_0202 : Poly :=
[
  term ((2006098855424163644535795488075121600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1003049427712081822267897744037560800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 27. -/
theorem ep_Q2_008_partial_27_0202_valid :
    mulPoly ep_Q2_008_coefficient_27_0202
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0203 : Poly :=
[
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 203 for generator 27. -/
def ep_Q2_008_partial_27_0203 : Poly :=
[
  term ((-16422254336897173035 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 27. -/
theorem ep_Q2_008_partial_27_0203_valid :
    mulPoly ep_Q2_008_coefficient_27_0203
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0204 : Poly :=
[
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 27. -/
def ep_Q2_008_partial_27_0204 : Poly :=
[
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 27. -/
theorem ep_Q2_008_partial_27_0204_valid :
    mulPoly ep_Q2_008_coefficient_27_0204
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0205 : Poly :=
[
  term ((-186223815592251689732535786080289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 27. -/
def ep_Q2_008_partial_27_0205 : Poly :=
[
  term ((-372447631184503379465071572160579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((186223815592251689732535786080289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 27. -/
theorem ep_Q2_008_partial_27_0205_valid :
    mulPoly ep_Q2_008_coefficient_27_0205
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0206 : Poly :=
[
  term ((-13117062446999150049 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 206 for generator 27. -/
def ep_Q2_008_partial_27_0206 : Poly :=
[
  term ((-13117062446999150049 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((13117062446999150049 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 27. -/
theorem ep_Q2_008_partial_27_0206_valid :
    mulPoly ep_Q2_008_coefficient_27_0206
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0207 : Poly :=
[
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 27. -/
def ep_Q2_008_partial_27_0207 : Poly :=
[
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 27. -/
theorem ep_Q2_008_partial_27_0207_valid :
    mulPoly ep_Q2_008_coefficient_27_0207
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0208 : Poly :=
[
  term ((29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 27. -/
def ep_Q2_008_partial_27_0208 : Poly :=
[
  term ((59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 27. -/
theorem ep_Q2_008_partial_27_0208_valid :
    mulPoly ep_Q2_008_coefficient_27_0208
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0209 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 209 for generator 27. -/
def ep_Q2_008_partial_27_0209 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 27. -/
theorem ep_Q2_008_partial_27_0209_valid :
    mulPoly ep_Q2_008_coefficient_27_0209
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0210 : Poly :=
[
  term ((-612315016245354375 : Rat) / 23895050124626771) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 210 for generator 27. -/
def ep_Q2_008_partial_27_0210 : Poly :=
[
  term ((-1224630032490708750 : Rat) / 23895050124626771) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((612315016245354375 : Rat) / 23895050124626771) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 27. -/
theorem ep_Q2_008_partial_27_0210_valid :
    mulPoly ep_Q2_008_coefficient_27_0210
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0211 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 27. -/
def ep_Q2_008_partial_27_0211 : Poly :=
[
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 27. -/
theorem ep_Q2_008_partial_27_0211_valid :
    mulPoly ep_Q2_008_coefficient_27_0211
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0212 : Poly :=
[
  term ((-64660240407785504436877169402385392230200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 27. -/
def ep_Q2_008_partial_27_0212 : Poly :=
[
  term ((-129320480815571008873754338804770784460400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((64660240407785504436877169402385392230200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 27. -/
theorem ep_Q2_008_partial_27_0212_valid :
    mulPoly ep_Q2_008_coefficient_27_0212
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0213 : Poly :=
[
  term ((-6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 27. -/
def ep_Q2_008_partial_27_0213 : Poly :=
[
  term ((-12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 27. -/
theorem ep_Q2_008_partial_27_0213_valid :
    mulPoly ep_Q2_008_coefficient_27_0213
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0214 : Poly :=
[
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 214 for generator 27. -/
def ep_Q2_008_partial_27_0214 : Poly :=
[
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 27. -/
theorem ep_Q2_008_partial_27_0214_valid :
    mulPoly ep_Q2_008_coefficient_27_0214
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0215 : Poly :=
[
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 27. -/
def ep_Q2_008_partial_27_0215 : Poly :=
[
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 27. -/
theorem ep_Q2_008_partial_27_0215_valid :
    mulPoly ep_Q2_008_coefficient_27_0215
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0216 : Poly :=
[
  term ((587490295841031375 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 216 for generator 27. -/
def ep_Q2_008_partial_27_0216 : Poly :=
[
  term ((587490295841031375 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-587490295841031375 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 27. -/
theorem ep_Q2_008_partial_27_0216_valid :
    mulPoly ep_Q2_008_coefficient_27_0216
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0217 : Poly :=
[
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 217 for generator 27. -/
def ep_Q2_008_partial_27_0217 : Poly :=
[
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 27. -/
theorem ep_Q2_008_partial_27_0217_valid :
    mulPoly ep_Q2_008_coefficient_27_0217
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0218 : Poly :=
[
  term ((313634488915970673567 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 218 for generator 27. -/
def ep_Q2_008_partial_27_0218 : Poly :=
[
  term ((313634488915970673567 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-313634488915970673567 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 27. -/
theorem ep_Q2_008_partial_27_0218_valid :
    mulPoly ep_Q2_008_coefficient_27_0218
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0219 : Poly :=
[
  term ((-78283337177484022003889761992886409030400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 27. -/
def ep_Q2_008_partial_27_0219 : Poly :=
[
  term ((-156566674354968044007779523985772818060800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((78283337177484022003889761992886409030400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 27. -/
theorem ep_Q2_008_partial_27_0219_valid :
    mulPoly ep_Q2_008_coefficient_27_0219
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0220 : Poly :=
[
  term ((2818671599093318677537863187271733119068069 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 27. -/
def ep_Q2_008_partial_27_0220 : Poly :=
[
  term ((2818671599093318677537863187271733119068069 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2818671599093318677537863187271733119068069 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 27. -/
theorem ep_Q2_008_partial_27_0220_valid :
    mulPoly ep_Q2_008_coefficient_27_0220
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0221 : Poly :=
[
  term ((321210250044198090138158889089491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 221 for generator 27. -/
def ep_Q2_008_partial_27_0221 : Poly :=
[
  term ((642420500088396180276317778178982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-321210250044198090138158889089491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 27. -/
theorem ep_Q2_008_partial_27_0221_valid :
    mulPoly ep_Q2_008_coefficient_27_0221
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0222 : Poly :=
[
  term ((169228083450922921875881522102976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 27. -/
def ep_Q2_008_partial_27_0222 : Poly :=
[
  term ((338456166901845843751763044205952000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-169228083450922921875881522102976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 27. -/
theorem ep_Q2_008_partial_27_0222_valid :
    mulPoly ep_Q2_008_coefficient_27_0222
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0223 : Poly :=
[
  term ((20248133453475582697002848786227200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 27. -/
def ep_Q2_008_partial_27_0223 : Poly :=
[
  term ((40496266906951165394005697572454400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20248133453475582697002848786227200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 27. -/
theorem ep_Q2_008_partial_27_0223_valid :
    mulPoly ep_Q2_008_coefficient_27_0223
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0224 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 224 for generator 27. -/
def ep_Q2_008_partial_27_0224 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 27. -/
theorem ep_Q2_008_partial_27_0224_valid :
    mulPoly ep_Q2_008_coefficient_27_0224
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0225 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 27. -/
def ep_Q2_008_partial_27_0225 : Poly :=
[
  term ((214382095697070000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 27. -/
theorem ep_Q2_008_partial_27_0225_valid :
    mulPoly ep_Q2_008_coefficient_27_0225
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0226 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 27. -/
def ep_Q2_008_partial_27_0226 : Poly :=
[
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 27. -/
theorem ep_Q2_008_partial_27_0226_valid :
    mulPoly ep_Q2_008_coefficient_27_0226
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0227 : Poly :=
[
  term ((-1059166222365251826631940790887783297583555 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 27. -/
def ep_Q2_008_partial_27_0227 : Poly :=
[
  term ((-2118332444730503653263881581775566595167110 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1059166222365251826631940790887783297583555 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 27. -/
theorem ep_Q2_008_partial_27_0227_valid :
    mulPoly ep_Q2_008_coefficient_27_0227
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0228 : Poly :=
[
  term ((40287087299278700271 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 228 for generator 27. -/
def ep_Q2_008_partial_27_0228 : Poly :=
[
  term ((80574174598557400542 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-40287087299278700271 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 27. -/
theorem ep_Q2_008_partial_27_0228_valid :
    mulPoly ep_Q2_008_coefficient_27_0228
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0229 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 27. -/
def ep_Q2_008_partial_27_0229 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 27. -/
theorem ep_Q2_008_partial_27_0229_valid :
    mulPoly ep_Q2_008_coefficient_27_0229
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0230 : Poly :=
[
  term ((22708984891249840147 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 230 for generator 27. -/
def ep_Q2_008_partial_27_0230 : Poly :=
[
  term ((22708984891249840147 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-22708984891249840147 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 27. -/
theorem ep_Q2_008_partial_27_0230_valid :
    mulPoly ep_Q2_008_coefficient_27_0230
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0231 : Poly :=
[
  term ((-839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 27. -/
def ep_Q2_008_partial_27_0231 : Poly :=
[
  term ((-1678064059956788916014111093158579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 27. -/
theorem ep_Q2_008_partial_27_0231_valid :
    mulPoly ep_Q2_008_coefficient_27_0231
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0232 : Poly :=
[
  term ((-53151350315373404579632478063846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 27. -/
def ep_Q2_008_partial_27_0232 : Poly :=
[
  term ((-106302700630746809159264956127692800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((53151350315373404579632478063846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 27. -/
theorem ep_Q2_008_partial_27_0232_valid :
    mulPoly ep_Q2_008_coefficient_27_0232
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0233 : Poly :=
[
  term ((1434026258708259315845961898188004800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 233 for generator 27. -/
def ep_Q2_008_partial_27_0233 : Poly :=
[
  term ((2868052517416518631691923796376009600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1434026258708259315845961898188004800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 27. -/
theorem ep_Q2_008_partial_27_0233_valid :
    mulPoly ep_Q2_008_coefficient_27_0233
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0234 : Poly :=
[
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 234 for generator 27. -/
def ep_Q2_008_partial_27_0234 : Poly :=
[
  term ((-4858939462685558847 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((4858939462685558847 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 27. -/
theorem ep_Q2_008_partial_27_0234_valid :
    mulPoly ep_Q2_008_coefficient_27_0234
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0235 : Poly :=
[
  term ((-25539819087116796181156375156582215252922335 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 27. -/
def ep_Q2_008_partial_27_0235 : Poly :=
[
  term ((-25539819087116796181156375156582215252922335 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((25539819087116796181156375156582215252922335 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 27. -/
theorem ep_Q2_008_partial_27_0235_valid :
    mulPoly ep_Q2_008_coefficient_27_0235
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0236 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 236 for generator 27. -/
def ep_Q2_008_partial_27_0236 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 27. -/
theorem ep_Q2_008_partial_27_0236_valid :
    mulPoly ep_Q2_008_coefficient_27_0236
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0237 : Poly :=
[
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 237 for generator 27. -/
def ep_Q2_008_partial_27_0237 : Poly :=
[
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 27. -/
theorem ep_Q2_008_partial_27_0237_valid :
    mulPoly ep_Q2_008_coefficient_27_0237
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0238 : Poly :=
[
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 238 for generator 27. -/
def ep_Q2_008_partial_27_0238 : Poly :=
[
  term ((-10948169557931448690 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((5474084778965724345 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 27. -/
theorem ep_Q2_008_partial_27_0238_valid :
    mulPoly ep_Q2_008_coefficient_27_0238
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0239 : Poly :=
[
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 27. -/
def ep_Q2_008_partial_27_0239 : Poly :=
[
  term ((-221204126551875835518380789595653760000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 27. -/
theorem ep_Q2_008_partial_27_0239_valid :
    mulPoly ep_Q2_008_coefficient_27_0239
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0240 : Poly :=
[
  term ((-629272858250546574114891769925392339507131 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 27. -/
def ep_Q2_008_partial_27_0240 : Poly :=
[
  term ((-629272858250546574114891769925392339507131 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((629272858250546574114891769925392339507131 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 27. -/
theorem ep_Q2_008_partial_27_0240_valid :
    mulPoly ep_Q2_008_coefficient_27_0240
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0241 : Poly :=
[
  term ((-209421436127353342182997216950902400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 241 for generator 27. -/
def ep_Q2_008_partial_27_0241 : Poly :=
[
  term ((-418842872254706684365994433901804800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((209421436127353342182997216950902400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 27. -/
theorem ep_Q2_008_partial_27_0241_valid :
    mulPoly ep_Q2_008_coefficient_27_0241
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0242 : Poly :=
[
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 27. -/
def ep_Q2_008_partial_27_0242 : Poly :=
[
  term ((-56382435440928018839792507125478400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 27. -/
theorem ep_Q2_008_partial_27_0242_valid :
    mulPoly ep_Q2_008_coefficient_27_0242
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0243 : Poly :=
[
  term ((877643497228772098415967893865792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 243 for generator 27. -/
def ep_Q2_008_partial_27_0243 : Poly :=
[
  term ((1755286994457544196831935787731584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-877643497228772098415967893865792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 27. -/
theorem ep_Q2_008_partial_27_0243_valid :
    mulPoly ep_Q2_008_coefficient_27_0243
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0244 : Poly :=
[
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 27. -/
def ep_Q2_008_partial_27_0244 : Poly :=
[
  term ((-6092211004233225187531734795707136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 27. -/
theorem ep_Q2_008_partial_27_0244_valid :
    mulPoly ep_Q2_008_coefficient_27_0244
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0245 : Poly :=
[
  term ((2706033792651989442884024339116800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 27. -/
def ep_Q2_008_partial_27_0245 : Poly :=
[
  term ((5412067585303978885768048678233600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2706033792651989442884024339116800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 27. -/
theorem ep_Q2_008_partial_27_0245_valid :
    mulPoly ep_Q2_008_coefficient_27_0245
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0246 : Poly :=
[
  term ((12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 27. -/
def ep_Q2_008_partial_27_0246 : Poly :=
[
  term ((25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 27. -/
theorem ep_Q2_008_partial_27_0246_valid :
    mulPoly ep_Q2_008_coefficient_27_0246
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0247 : Poly :=
[
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 247 for generator 27. -/
def ep_Q2_008_partial_27_0247 : Poly :=
[
  term ((-50937185937623832000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 27. -/
theorem ep_Q2_008_partial_27_0247_valid :
    mulPoly ep_Q2_008_coefficient_27_0247
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0248 : Poly :=
[
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 27. -/
def ep_Q2_008_partial_27_0248 : Poly :=
[
  term ((12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 27. -/
theorem ep_Q2_008_partial_27_0248_valid :
    mulPoly ep_Q2_008_coefficient_27_0248
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0249 : Poly :=
[
  term ((-1585796188954766625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 249 for generator 27. -/
def ep_Q2_008_partial_27_0249 : Poly :=
[
  term ((-1585796188954766625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1585796188954766625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 27. -/
theorem ep_Q2_008_partial_27_0249_valid :
    mulPoly ep_Q2_008_coefficient_27_0249
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0250 : Poly :=
[
  term ((149590140485446871549635110317777617783200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 27. -/
def ep_Q2_008_partial_27_0250 : Poly :=
[
  term ((299180280970893743099270220635555235566400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-149590140485446871549635110317777617783200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 27. -/
theorem ep_Q2_008_partial_27_0250_valid :
    mulPoly ep_Q2_008_coefficient_27_0250
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0251 : Poly :=
[
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 27. -/
def ep_Q2_008_partial_27_0251 : Poly :=
[
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 27. -/
theorem ep_Q2_008_partial_27_0251_valid :
    mulPoly ep_Q2_008_coefficient_27_0251
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0252 : Poly :=
[
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 252 for generator 27. -/
def ep_Q2_008_partial_27_0252 : Poly :=
[
  term ((-142936611412176720000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((71468305706088360000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 27. -/
theorem ep_Q2_008_partial_27_0252_valid :
    mulPoly ep_Q2_008_coefficient_27_0252
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0253 : Poly :=
[
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 27. -/
def ep_Q2_008_partial_27_0253 : Poly :=
[
  term ((-11832980445486574069079825621325421056000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 27. -/
theorem ep_Q2_008_partial_27_0253_valid :
    mulPoly ep_Q2_008_coefficient_27_0253
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0254 : Poly :=
[
  term ((287781644465156882957393563816813068336075 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 27. -/
def ep_Q2_008_partial_27_0254 : Poly :=
[
  term ((287781644465156882957393563816813068336075 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-287781644465156882957393563816813068336075 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 27. -/
theorem ep_Q2_008_partial_27_0254_valid :
    mulPoly ep_Q2_008_coefficient_27_0254
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0255 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 255 for generator 27. -/
def ep_Q2_008_partial_27_0255 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 27. -/
theorem ep_Q2_008_partial_27_0255_valid :
    mulPoly ep_Q2_008_coefficient_27_0255
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0256 : Poly :=
[
  term ((-139931639360558863662 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 256 for generator 27. -/
def ep_Q2_008_partial_27_0256 : Poly :=
[
  term ((-279863278721117727324 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((139931639360558863662 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 27. -/
theorem ep_Q2_008_partial_27_0256_valid :
    mulPoly ep_Q2_008_coefficient_27_0256
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0257 : Poly :=
[
  term ((-61441337169821144829 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 257 for generator 27. -/
def ep_Q2_008_partial_27_0257 : Poly :=
[
  term ((-61441337169821144829 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((61441337169821144829 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 27. -/
theorem ep_Q2_008_partial_27_0257_valid :
    mulPoly ep_Q2_008_coefficient_27_0257
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0258 : Poly :=
[
  term ((-8234196880166001192597465869374284590058597 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 27. -/
def ep_Q2_008_partial_27_0258 : Poly :=
[
  term ((-8234196880166001192597465869374284590058597 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8234196880166001192597465869374284590058597 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 27. -/
theorem ep_Q2_008_partial_27_0258_valid :
    mulPoly ep_Q2_008_coefficient_27_0258
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0259 : Poly :=
[
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 259 for generator 27. -/
def ep_Q2_008_partial_27_0259 : Poly :=
[
  term ((-3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 27. -/
theorem ep_Q2_008_partial_27_0259_valid :
    mulPoly ep_Q2_008_coefficient_27_0259
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0260 : Poly :=
[
  term ((13157917181928393088362709351589327228489340 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 260 for generator 27. -/
def ep_Q2_008_partial_27_0260 : Poly :=
[
  term ((26315834363856786176725418703178654456978680 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-13157917181928393088362709351589327228489340 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 27. -/
theorem ep_Q2_008_partial_27_0260_valid :
    mulPoly ep_Q2_008_coefficient_27_0260
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0261 : Poly :=
[
  term ((-95106792515234810787 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 261 for generator 27. -/
def ep_Q2_008_partial_27_0261 : Poly :=
[
  term ((-95106792515234810787 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((95106792515234810787 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 27. -/
theorem ep_Q2_008_partial_27_0261_valid :
    mulPoly ep_Q2_008_coefficient_27_0261
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0262 : Poly :=
[
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 27. -/
def ep_Q2_008_partial_27_0262 : Poly :=
[
  term ((-205684388472497618145672645264016490649600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 27. -/
theorem ep_Q2_008_partial_27_0262_valid :
    mulPoly ep_Q2_008_coefficient_27_0262
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0263 : Poly :=
[
  term ((-517251679757637299698254579239237765359674 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 263 for generator 27. -/
def ep_Q2_008_partial_27_0263 : Poly :=
[
  term ((-1034503359515274599396509158478475530719348 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((517251679757637299698254579239237765359674 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 27. -/
theorem ep_Q2_008_partial_27_0263_valid :
    mulPoly ep_Q2_008_coefficient_27_0263
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0264 : Poly :=
[
  term ((84315471915614805195 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 264 for generator 27. -/
def ep_Q2_008_partial_27_0264 : Poly :=
[
  term ((84315471915614805195 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-84315471915614805195 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 27. -/
theorem ep_Q2_008_partial_27_0264_valid :
    mulPoly ep_Q2_008_coefficient_27_0264
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0265 : Poly :=
[
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 27. -/
def ep_Q2_008_partial_27_0265 : Poly :=
[
  term ((68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 27. -/
theorem ep_Q2_008_partial_27_0265_valid :
    mulPoly ep_Q2_008_coefficient_27_0265
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0266 : Poly :=
[
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 266 for generator 27. -/
def ep_Q2_008_partial_27_0266 : Poly :=
[
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 27. -/
theorem ep_Q2_008_partial_27_0266_valid :
    mulPoly ep_Q2_008_coefficient_27_0266
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0267 : Poly :=
[
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 27. -/
def ep_Q2_008_partial_27_0267 : Poly :=
[
  term ((3872455522977205190801794830365952000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 27. -/
theorem ep_Q2_008_partial_27_0267_valid :
    mulPoly ep_Q2_008_coefficient_27_0267
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0268 : Poly :=
[
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 268 for generator 27. -/
def ep_Q2_008_partial_27_0268 : Poly :=
[
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 27. -/
theorem ep_Q2_008_partial_27_0268_valid :
    mulPoly ep_Q2_008_coefficient_27_0268
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0269 : Poly :=
[
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 269 for generator 27. -/
def ep_Q2_008_partial_27_0269 : Poly :=
[
  term ((15042639383838845127 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 27. -/
theorem ep_Q2_008_partial_27_0269_valid :
    mulPoly ep_Q2_008_coefficient_27_0269
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0270 : Poly :=
[
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 27. -/
def ep_Q2_008_partial_27_0270 : Poly :=
[
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 27. -/
theorem ep_Q2_008_partial_27_0270_valid :
    mulPoly ep_Q2_008_coefficient_27_0270
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0271 : Poly :=
[
  term ((322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (16, 1)]
]

/-- Partial product 271 for generator 27. -/
def ep_Q2_008_partial_27_0271 : Poly :=
[
  term ((645838335510271678440 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (14, 1), (16, 1)],
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 27. -/
theorem ep_Q2_008_partial_27_0271_valid :
    mulPoly ep_Q2_008_coefficient_27_0271
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0272 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 27. -/
def ep_Q2_008_partial_27_0272 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 27. -/
theorem ep_Q2_008_partial_27_0272_valid :
    mulPoly ep_Q2_008_coefficient_27_0272
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0273 : Poly :=
[
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 27. -/
def ep_Q2_008_partial_27_0273 : Poly :=
[
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 27. -/
theorem ep_Q2_008_partial_27_0273_valid :
    mulPoly ep_Q2_008_coefficient_27_0273
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0274 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 274 for generator 27. -/
def ep_Q2_008_partial_27_0274 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 27. -/
theorem ep_Q2_008_partial_27_0274_valid :
    mulPoly ep_Q2_008_coefficient_27_0274
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0275 : Poly :=
[
  term ((-396082794497023885929929673633288000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 27. -/
def ep_Q2_008_partial_27_0275 : Poly :=
[
  term ((-792165588994047771859859347266576000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((396082794497023885929929673633288000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 27. -/
theorem ep_Q2_008_partial_27_0275_valid :
    mulPoly ep_Q2_008_coefficient_27_0275
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0276 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 276 for generator 27. -/
def ep_Q2_008_partial_27_0276 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 27. -/
theorem ep_Q2_008_partial_27_0276_valid :
    mulPoly ep_Q2_008_coefficient_27_0276
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0277 : Poly :=
[
  term ((-11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 27. -/
def ep_Q2_008_partial_27_0277 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 27. -/
theorem ep_Q2_008_partial_27_0277_valid :
    mulPoly ep_Q2_008_coefficient_27_0277
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0278 : Poly :=
[
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 278 for generator 27. -/
def ep_Q2_008_partial_27_0278 : Poly :=
[
  term ((-103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 27. -/
theorem ep_Q2_008_partial_27_0278_valid :
    mulPoly ep_Q2_008_coefficient_27_0278
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0279 : Poly :=
[
  term ((10712807287636102867 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 279 for generator 27. -/
def ep_Q2_008_partial_27_0279 : Poly :=
[
  term ((10712807287636102867 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-10712807287636102867 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 27. -/
theorem ep_Q2_008_partial_27_0279_valid :
    mulPoly ep_Q2_008_coefficient_27_0279
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0280 : Poly :=
[
  term ((-304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 27. -/
def ep_Q2_008_partial_27_0280 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 27. -/
theorem ep_Q2_008_partial_27_0280_valid :
    mulPoly ep_Q2_008_coefficient_27_0280
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0281 : Poly :=
[
  term ((9747106795423086351482754335923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 27. -/
def ep_Q2_008_partial_27_0281 : Poly :=
[
  term ((19494213590846172702965508671846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9747106795423086351482754335923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 27. -/
theorem ep_Q2_008_partial_27_0281_valid :
    mulPoly ep_Q2_008_coefficient_27_0281
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0282 : Poly :=
[
  term ((-1929438861273630000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 282 for generator 27. -/
def ep_Q2_008_partial_27_0282 : Poly :=
[
  term ((-3858877722547260000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 27. -/
theorem ep_Q2_008_partial_27_0282_valid :
    mulPoly ep_Q2_008_coefficient_27_0282
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0283 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 283 for generator 27. -/
def ep_Q2_008_partial_27_0283 : Poly :=
[
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 27. -/
theorem ep_Q2_008_partial_27_0283_valid :
    mulPoly ep_Q2_008_coefficient_27_0283
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0284 : Poly :=
[
  term ((-937156870178249543124469579721463580800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 27. -/
def ep_Q2_008_partial_27_0284 : Poly :=
[
  term ((-1874313740356499086248939159442927161600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((937156870178249543124469579721463580800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 27. -/
theorem ep_Q2_008_partial_27_0284_valid :
    mulPoly ep_Q2_008_coefficient_27_0284
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0285 : Poly :=
[
  term ((-7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 285 for generator 27. -/
def ep_Q2_008_partial_27_0285 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 27. -/
theorem ep_Q2_008_partial_27_0285_valid :
    mulPoly ep_Q2_008_coefficient_27_0285
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0286 : Poly :=
[
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 27. -/
def ep_Q2_008_partial_27_0286 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 27. -/
theorem ep_Q2_008_partial_27_0286_valid :
    mulPoly ep_Q2_008_coefficient_27_0286
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0287 : Poly :=
[
  term ((2484053566585162875 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 287 for generator 27. -/
def ep_Q2_008_partial_27_0287 : Poly :=
[
  term ((2484053566585162875 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2484053566585162875 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 27. -/
theorem ep_Q2_008_partial_27_0287_valid :
    mulPoly ep_Q2_008_coefficient_27_0287
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0288 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 288 for generator 27. -/
def ep_Q2_008_partial_27_0288 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 27. -/
theorem ep_Q2_008_partial_27_0288_valid :
    mulPoly ep_Q2_008_coefficient_27_0288
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0289 : Poly :=
[
  term ((1115993352694573016126162132123746147494921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 27. -/
def ep_Q2_008_partial_27_0289 : Poly :=
[
  term ((1115993352694573016126162132123746147494921 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1115993352694573016126162132123746147494921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 27. -/
theorem ep_Q2_008_partial_27_0289_valid :
    mulPoly ep_Q2_008_coefficient_27_0289
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0290 : Poly :=
[
  term ((149290601779837558108166161035566880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 290 for generator 27. -/
def ep_Q2_008_partial_27_0290 : Poly :=
[
  term ((298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-149290601779837558108166161035566880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 27. -/
theorem ep_Q2_008_partial_27_0290_valid :
    mulPoly ep_Q2_008_coefficient_27_0290
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0291 : Poly :=
[
  term ((-27855559524908515659 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 291 for generator 27. -/
def ep_Q2_008_partial_27_0291 : Poly :=
[
  term ((-27855559524908515659 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((27855559524908515659 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 27. -/
theorem ep_Q2_008_partial_27_0291_valid :
    mulPoly ep_Q2_008_coefficient_27_0291
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0292 : Poly :=
[
  term ((-13442312697672425776431349950816365664000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 27. -/
def ep_Q2_008_partial_27_0292 : Poly :=
[
  term ((-26884625395344851552862699901632731328000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13442312697672425776431349950816365664000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 27. -/
theorem ep_Q2_008_partial_27_0292_valid :
    mulPoly ep_Q2_008_coefficient_27_0292
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0293 : Poly :=
[
  term ((445405116347328656253755078351614909118657 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 27. -/
def ep_Q2_008_partial_27_0293 : Poly :=
[
  term ((445405116347328656253755078351614909118657 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-445405116347328656253755078351614909118657 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 27. -/
theorem ep_Q2_008_partial_27_0293_valid :
    mulPoly ep_Q2_008_coefficient_27_0293
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0294 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 27. -/
def ep_Q2_008_partial_27_0294 : Poly :=
[
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 27. -/
theorem ep_Q2_008_partial_27_0294_valid :
    mulPoly ep_Q2_008_coefficient_27_0294
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0295 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 27. -/
def ep_Q2_008_partial_27_0295 : Poly :=
[
  term ((16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 27. -/
theorem ep_Q2_008_partial_27_0295_valid :
    mulPoly ep_Q2_008_coefficient_27_0295
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0296 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 296 for generator 27. -/
def ep_Q2_008_partial_27_0296 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 27. -/
theorem ep_Q2_008_partial_27_0296_valid :
    mulPoly ep_Q2_008_coefficient_27_0296
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0297 : Poly :=
[
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 297 for generator 27. -/
def ep_Q2_008_partial_27_0297 : Poly :=
[
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 27. -/
theorem ep_Q2_008_partial_27_0297_valid :
    mulPoly ep_Q2_008_coefficient_27_0297
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0298 : Poly :=
[
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 27. -/
def ep_Q2_008_partial_27_0298 : Poly :=
[
  term ((47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 27. -/
theorem ep_Q2_008_partial_27_0298_valid :
    mulPoly ep_Q2_008_coefficient_27_0298
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0299 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 299 for generator 27. -/
def ep_Q2_008_partial_27_0299 : Poly :=
[
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 27. -/
theorem ep_Q2_008_partial_27_0299_valid :
    mulPoly ep_Q2_008_coefficient_27_0299
        ep_Q2_008_generator_27_0200_0299 =
      ep_Q2_008_partial_27_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0200_0299 : List Poly :=
[
  ep_Q2_008_partial_27_0200,
  ep_Q2_008_partial_27_0201,
  ep_Q2_008_partial_27_0202,
  ep_Q2_008_partial_27_0203,
  ep_Q2_008_partial_27_0204,
  ep_Q2_008_partial_27_0205,
  ep_Q2_008_partial_27_0206,
  ep_Q2_008_partial_27_0207,
  ep_Q2_008_partial_27_0208,
  ep_Q2_008_partial_27_0209,
  ep_Q2_008_partial_27_0210,
  ep_Q2_008_partial_27_0211,
  ep_Q2_008_partial_27_0212,
  ep_Q2_008_partial_27_0213,
  ep_Q2_008_partial_27_0214,
  ep_Q2_008_partial_27_0215,
  ep_Q2_008_partial_27_0216,
  ep_Q2_008_partial_27_0217,
  ep_Q2_008_partial_27_0218,
  ep_Q2_008_partial_27_0219,
  ep_Q2_008_partial_27_0220,
  ep_Q2_008_partial_27_0221,
  ep_Q2_008_partial_27_0222,
  ep_Q2_008_partial_27_0223,
  ep_Q2_008_partial_27_0224,
  ep_Q2_008_partial_27_0225,
  ep_Q2_008_partial_27_0226,
  ep_Q2_008_partial_27_0227,
  ep_Q2_008_partial_27_0228,
  ep_Q2_008_partial_27_0229,
  ep_Q2_008_partial_27_0230,
  ep_Q2_008_partial_27_0231,
  ep_Q2_008_partial_27_0232,
  ep_Q2_008_partial_27_0233,
  ep_Q2_008_partial_27_0234,
  ep_Q2_008_partial_27_0235,
  ep_Q2_008_partial_27_0236,
  ep_Q2_008_partial_27_0237,
  ep_Q2_008_partial_27_0238,
  ep_Q2_008_partial_27_0239,
  ep_Q2_008_partial_27_0240,
  ep_Q2_008_partial_27_0241,
  ep_Q2_008_partial_27_0242,
  ep_Q2_008_partial_27_0243,
  ep_Q2_008_partial_27_0244,
  ep_Q2_008_partial_27_0245,
  ep_Q2_008_partial_27_0246,
  ep_Q2_008_partial_27_0247,
  ep_Q2_008_partial_27_0248,
  ep_Q2_008_partial_27_0249,
  ep_Q2_008_partial_27_0250,
  ep_Q2_008_partial_27_0251,
  ep_Q2_008_partial_27_0252,
  ep_Q2_008_partial_27_0253,
  ep_Q2_008_partial_27_0254,
  ep_Q2_008_partial_27_0255,
  ep_Q2_008_partial_27_0256,
  ep_Q2_008_partial_27_0257,
  ep_Q2_008_partial_27_0258,
  ep_Q2_008_partial_27_0259,
  ep_Q2_008_partial_27_0260,
  ep_Q2_008_partial_27_0261,
  ep_Q2_008_partial_27_0262,
  ep_Q2_008_partial_27_0263,
  ep_Q2_008_partial_27_0264,
  ep_Q2_008_partial_27_0265,
  ep_Q2_008_partial_27_0266,
  ep_Q2_008_partial_27_0267,
  ep_Q2_008_partial_27_0268,
  ep_Q2_008_partial_27_0269,
  ep_Q2_008_partial_27_0270,
  ep_Q2_008_partial_27_0271,
  ep_Q2_008_partial_27_0272,
  ep_Q2_008_partial_27_0273,
  ep_Q2_008_partial_27_0274,
  ep_Q2_008_partial_27_0275,
  ep_Q2_008_partial_27_0276,
  ep_Q2_008_partial_27_0277,
  ep_Q2_008_partial_27_0278,
  ep_Q2_008_partial_27_0279,
  ep_Q2_008_partial_27_0280,
  ep_Q2_008_partial_27_0281,
  ep_Q2_008_partial_27_0282,
  ep_Q2_008_partial_27_0283,
  ep_Q2_008_partial_27_0284,
  ep_Q2_008_partial_27_0285,
  ep_Q2_008_partial_27_0286,
  ep_Q2_008_partial_27_0287,
  ep_Q2_008_partial_27_0288,
  ep_Q2_008_partial_27_0289,
  ep_Q2_008_partial_27_0290,
  ep_Q2_008_partial_27_0291,
  ep_Q2_008_partial_27_0292,
  ep_Q2_008_partial_27_0293,
  ep_Q2_008_partial_27_0294,
  ep_Q2_008_partial_27_0295,
  ep_Q2_008_partial_27_0296,
  ep_Q2_008_partial_27_0297,
  ep_Q2_008_partial_27_0298,
  ep_Q2_008_partial_27_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0200_0299 : Poly :=
[
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((2006098855424163644535795488075121600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1003049427712081822267897744037560800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16422254336897173035 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-372447631184503379465071572160579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13117062446999150049 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((186223815592251689732535786080289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((13117062446999150049 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1224630032490708750 : Rat) / 23895050124626771) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((612315016245354375 : Rat) / 23895050124626771) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-129320480815571008873754338804770784460400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((64660240407785504436877169402385392230200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-107202458559132540000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((53601229279566270000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((587490295841031375 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-587490295841031375 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((313634488915970673567 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-313634488915970673567 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-156566674354968044007779523985772818060800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((78283337177484022003889761992886409030400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((2818671599093318677537863187271733119068069 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2818671599093318677537863187271733119068069 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((642420500088396180276317778178982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-321210250044198090138158889089491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((338456166901845843751763044205952000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-169228083450922921875881522102976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((40496266906951165394005697572454400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-20248133453475582697002848786227200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2118332444730503653263881581775566595167110 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1059166222365251826631940790887783297583555 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((80574174598557400542 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-40287087299278700271 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((22708984891249840147 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-22708984891249840147 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1678064059956788916014111093158579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-106302700630746809159264956127692800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((53151350315373404579632478063846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2868052517416518631691923796376009600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4858939462685558847 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1434026258708259315845961898188004800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4858939462685558847 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-25539819087116796181156375156582215252922335 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((25539819087116796181156375156582215252922335 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-10948169557931448690 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((5474084778965724345 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-221204126551875835518380789595653760000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-629272858250546574114891769925392339507131 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-418842872254706684365994433901804800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((629272858250546574114891769925392339507131 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((209421436127353342182997216950902400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-56382435440928018839792507125478400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1755286994457544196831935787731584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-877643497228772098415967893865792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-6092211004233225187531734795707136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((5412067585303978885768048678233600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2706033792651989442884024339116800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50937185937623832000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1585796188954766625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1585796188954766625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((299180280970893743099270220635555235566400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-149590140485446871549635110317777617783200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-142936611412176720000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((71468305706088360000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((-11832980445486574069079825621325421056000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((287781644465156882957393563816813068336075 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-287781644465156882957393563816813068336075 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-279863278721117727324 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((139931639360558863662 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-61441337169821144829 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((61441337169821144829 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-8234196880166001192597465869374284590058597 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((8234196880166001192597465869374284590058597 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((26315834363856786176725418703178654456978680 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-95106792515234810787 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-13157917181928393088362709351589327228489340 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((95106792515234810787 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-205684388472497618145672645264016490649600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1034503359515274599396509158478475530719348 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((84315471915614805195 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((517251679757637299698254579239237765359674 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-84315471915614805195 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((68337450405480091602384614653516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((3872455522977205190801794830365952000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((15042639383838845127 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((645838335510271678440 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (14, 1), (16, 1)],
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (16, 1)],
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-792165588994047771859859347266576000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((396082794497023885929929673633288000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((10712807287636102867 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-10712807287636102867 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((19494213590846172702965508671846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9747106795423086351482754335923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3858877722547260000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1874313740356499086248939159442927161600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((937156870178249543124469579721463580800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((2484053566585162875 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2484053566585162875 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((1115993352694573016126162132123746147494921 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1115993352694573016126162132123746147494921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((298581203559675116216332322071133760000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27855559524908515659 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-149290601779837558108166161035566880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((27855559524908515659 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-26884625395344851552862699901632731328000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13442312697672425776431349950816365664000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((445405116347328656253755078351614909118657 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-445405116347328656253755078351614909118657 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 200 through 299. -/
theorem ep_Q2_008_block_27_0200_0299_valid :
    checkProductSumEq ep_Q2_008_partials_27_0200_0299
      ep_Q2_008_block_27_0200_0299 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
