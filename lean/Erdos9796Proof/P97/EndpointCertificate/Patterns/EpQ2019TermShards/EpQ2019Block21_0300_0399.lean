/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 21:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_21_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0300 : Poly :=
[
  term ((196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 300 for generator 21. -/
def ep_Q2_019_partial_21_0300 : Poly :=
[
  term ((392009479050932365435306458136848192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 21. -/
theorem ep_Q2_019_partial_21_0300_valid :
    mulPoly ep_Q2_019_coefficient_21_0300
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0301 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 21. -/
def ep_Q2_019_partial_21_0301 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 21. -/
theorem ep_Q2_019_partial_21_0301_valid :
    mulPoly ep_Q2_019_coefficient_21_0301
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0302 : Poly :=
[
  term ((-1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 21. -/
def ep_Q2_019_partial_21_0302 : Poly :=
[
  term ((-3025376823014443772588891709638342384 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 21. -/
theorem ep_Q2_019_partial_21_0302_valid :
    mulPoly ep_Q2_019_coefficient_21_0302
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0303 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 303 for generator 21. -/
def ep_Q2_019_partial_21_0303 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 21. -/
theorem ep_Q2_019_partial_21_0303_valid :
    mulPoly ep_Q2_019_coefficient_21_0303
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0304 : Poly :=
[
  term ((-196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 304 for generator 21. -/
def ep_Q2_019_partial_21_0304 : Poly :=
[
  term ((196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-392009479050932365435306458136848192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 21. -/
theorem ep_Q2_019_partial_21_0304_valid :
    mulPoly ep_Q2_019_coefficient_21_0304
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0305 : Poly :=
[
  term ((10725573835607132448580701496137928936 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 305 for generator 21. -/
def ep_Q2_019_partial_21_0305 : Poly :=
[
  term ((21451147671214264897161402992275857872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10725573835607132448580701496137928936 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 21. -/
theorem ep_Q2_019_partial_21_0305_valid :
    mulPoly ep_Q2_019_coefficient_21_0305
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0306 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 306 for generator 21. -/
def ep_Q2_019_partial_21_0306 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 21. -/
theorem ep_Q2_019_partial_21_0306_valid :
    mulPoly ep_Q2_019_coefficient_21_0306
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0307 : Poly :=
[
  term ((-98002369762733091358826614534212048 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 307 for generator 21. -/
def ep_Q2_019_partial_21_0307 : Poly :=
[
  term ((-196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((98002369762733091358826614534212048 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 21. -/
theorem ep_Q2_019_partial_21_0307_valid :
    mulPoly ep_Q2_019_coefficient_21_0307
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0308 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 21. -/
def ep_Q2_019_partial_21_0308 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 21. -/
theorem ep_Q2_019_partial_21_0308_valid :
    mulPoly ep_Q2_019_coefficient_21_0308
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0309 : Poly :=
[
  term ((1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 21. -/
def ep_Q2_019_partial_21_0309 : Poly :=
[
  term ((-1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2197046533130209579968823157343014976 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 21. -/
theorem ep_Q2_019_partial_21_0309_valid :
    mulPoly ep_Q2_019_coefficient_21_0309
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0310 : Poly :=
[
  term ((-1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 310 for generator 21. -/
def ep_Q2_019_partial_21_0310 : Poly :=
[
  term ((-2197046533130209579968823157343014976 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 21. -/
theorem ep_Q2_019_partial_21_0310_valid :
    mulPoly ep_Q2_019_coefficient_21_0310
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0311 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 311 for generator 21. -/
def ep_Q2_019_partial_21_0311 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 21. -/
theorem ep_Q2_019_partial_21_0311_valid :
    mulPoly ep_Q2_019_coefficient_21_0311
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0312 : Poly :=
[
  term ((549261633282552394992205789335753744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 21. -/
def ep_Q2_019_partial_21_0312 : Poly :=
[
  term ((1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-549261633282552394992205789335753744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 21. -/
theorem ep_Q2_019_partial_21_0312_valid :
    mulPoly ep_Q2_019_coefficient_21_0312
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0313 : Poly :=
[
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 21. -/
def ep_Q2_019_partial_21_0313 : Poly :=
[
  term ((5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 21. -/
theorem ep_Q2_019_partial_21_0313_valid :
    mulPoly ep_Q2_019_coefficient_21_0313
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0314 : Poly :=
[
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 314 for generator 21. -/
def ep_Q2_019_partial_21_0314 : Poly :=
[
  term ((-4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 21. -/
theorem ep_Q2_019_partial_21_0314_valid :
    mulPoly ep_Q2_019_coefficient_21_0314
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0315 : Poly :=
[
  term ((21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 21. -/
def ep_Q2_019_partial_21_0315 : Poly :=
[
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 21. -/
theorem ep_Q2_019_partial_21_0315_valid :
    mulPoly ep_Q2_019_coefficient_21_0315
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0316 : Poly :=
[
  term ((34305008194880141604715141284383625760964 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 21. -/
def ep_Q2_019_partial_21_0316 : Poly :=
[
  term ((68610016389760283209430282568767251521928 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34305008194880141604715141284383625760964 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 21. -/
theorem ep_Q2_019_partial_21_0316_valid :
    mulPoly ep_Q2_019_coefficient_21_0316
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0317 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 317 for generator 21. -/
def ep_Q2_019_partial_21_0317 : Poly :=
[
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 21. -/
theorem ep_Q2_019_partial_21_0317_valid :
    mulPoly ep_Q2_019_coefficient_21_0317
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0318 : Poly :=
[
  term ((-1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 21. -/
def ep_Q2_019_partial_21_0318 : Poly :=
[
  term ((-3091933433761568231511596866782498269792 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 21. -/
theorem ep_Q2_019_partial_21_0318_valid :
    mulPoly ep_Q2_019_coefficient_21_0318
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0319 : Poly :=
[
  term ((-43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 21. -/
def ep_Q2_019_partial_21_0319 : Poly :=
[
  term ((-87881939985554563454146423002264151112992 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 21. -/
theorem ep_Q2_019_partial_21_0319_valid :
    mulPoly ep_Q2_019_coefficient_21_0319
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0320 : Poly :=
[
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 320 for generator 21. -/
def ep_Q2_019_partial_21_0320 : Poly :=
[
  term ((-13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 21. -/
theorem ep_Q2_019_partial_21_0320_valid :
    mulPoly ep_Q2_019_coefficient_21_0320
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0321 : Poly :=
[
  term ((43779849397204074425001584333853362008436 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 321 for generator 21. -/
def ep_Q2_019_partial_21_0321 : Poly :=
[
  term ((87559698794408148850003168667706724016872 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-43779849397204074425001584333853362008436 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 21. -/
theorem ep_Q2_019_partial_21_0321_valid :
    mulPoly ep_Q2_019_coefficient_21_0321
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0322 : Poly :=
[
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 322 for generator 21. -/
def ep_Q2_019_partial_21_0322 : Poly :=
[
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 21. -/
theorem ep_Q2_019_partial_21_0322_valid :
    mulPoly ep_Q2_019_coefficient_21_0322
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0323 : Poly :=
[
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 21. -/
def ep_Q2_019_partial_21_0323 : Poly :=
[
  term ((21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 21. -/
theorem ep_Q2_019_partial_21_0323_valid :
    mulPoly ep_Q2_019_coefficient_21_0323
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0324 : Poly :=
[
  term ((-36229282558935953660064266709657085699172 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 21. -/
def ep_Q2_019_partial_21_0324 : Poly :=
[
  term ((36229282558935953660064266709657085699172 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72458565117871907320128533419314171398344 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 21. -/
theorem ep_Q2_019_partial_21_0324_valid :
    mulPoly ep_Q2_019_coefficient_21_0324
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0325 : Poly :=
[
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 325 for generator 21. -/
def ep_Q2_019_partial_21_0325 : Poly :=
[
  term ((2013892584045852491207875902954955456 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 21. -/
theorem ep_Q2_019_partial_21_0325_valid :
    mulPoly ep_Q2_019_coefficient_21_0325
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0326 : Poly :=
[
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 21. -/
def ep_Q2_019_partial_21_0326 : Poly :=
[
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 21. -/
theorem ep_Q2_019_partial_21_0326_valid :
    mulPoly ep_Q2_019_coefficient_21_0326
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0327 : Poly :=
[
  term ((1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 327 for generator 21. -/
def ep_Q2_019_partial_21_0327 : Poly :=
[
  term ((3091933433761568231511596866782498269792 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 21. -/
theorem ep_Q2_019_partial_21_0327_valid :
    mulPoly ep_Q2_019_coefficient_21_0327
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0328 : Poly :=
[
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 328 for generator 21. -/
def ep_Q2_019_partial_21_0328 : Poly :=
[
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 21. -/
theorem ep_Q2_019_partial_21_0328_valid :
    mulPoly ep_Q2_019_coefficient_21_0328
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0329 : Poly :=
[
  term ((-10953018379079678971353977441827276179512 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 21. -/
def ep_Q2_019_partial_21_0329 : Poly :=
[
  term ((-21906036758159357942707954883654552359024 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10953018379079678971353977441827276179512 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 21. -/
theorem ep_Q2_019_partial_21_0329_valid :
    mulPoly ep_Q2_019_coefficient_21_0329
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0330 : Poly :=
[
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 21. -/
def ep_Q2_019_partial_21_0330 : Poly :=
[
  term ((87881939985554563454146423002264151112992 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 21. -/
theorem ep_Q2_019_partial_21_0330_valid :
    mulPoly ep_Q2_019_coefficient_21_0330
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0331 : Poly :=
[
  term ((-18114641279467976830032133354828542849586 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 331 for generator 21. -/
def ep_Q2_019_partial_21_0331 : Poly :=
[
  term ((-36229282558935953660064266709657085699172 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((18114641279467976830032133354828542849586 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 21. -/
theorem ep_Q2_019_partial_21_0331_valid :
    mulPoly ep_Q2_019_coefficient_21_0331
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0332 : Poly :=
[
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 332 for generator 21. -/
def ep_Q2_019_partial_21_0332 : Poly :=
[
  term ((-5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 21. -/
theorem ep_Q2_019_partial_21_0332_valid :
    mulPoly ep_Q2_019_coefficient_21_0332
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0333 : Poly :=
[
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 21. -/
def ep_Q2_019_partial_21_0333 : Poly :=
[
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 21. -/
theorem ep_Q2_019_partial_21_0333_valid :
    mulPoly ep_Q2_019_coefficient_21_0333
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0334 : Poly :=
[
  term ((21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 334 for generator 21. -/
def ep_Q2_019_partial_21_0334 : Poly :=
[
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 21. -/
theorem ep_Q2_019_partial_21_0334_valid :
    mulPoly ep_Q2_019_coefficient_21_0334
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0335 : Poly :=
[
  term ((38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 335 for generator 21. -/
def ep_Q2_019_partial_21_0335 : Poly :=
[
  term ((-38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((76989921095253085238397475384584224554216 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 21. -/
theorem ep_Q2_019_partial_21_0335_valid :
    mulPoly ep_Q2_019_coefficient_21_0335
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0336 : Poly :=
[
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 336 for generator 21. -/
def ep_Q2_019_partial_21_0336 : Poly :=
[
  term ((4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 21. -/
theorem ep_Q2_019_partial_21_0336_valid :
    mulPoly ep_Q2_019_coefficient_21_0336
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0337 : Poly :=
[
  term ((-38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 21. -/
def ep_Q2_019_partial_21_0337 : Poly :=
[
  term ((-76989921095253085238397475384584224554216 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 21. -/
theorem ep_Q2_019_partial_21_0337_valid :
    mulPoly ep_Q2_019_coefficient_21_0337
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0338 : Poly :=
[
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 21. -/
def ep_Q2_019_partial_21_0338 : Poly :=
[
  term ((-43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 21. -/
theorem ep_Q2_019_partial_21_0338_valid :
    mulPoly ep_Q2_019_coefficient_21_0338
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0339 : Poly :=
[
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 339 for generator 21. -/
def ep_Q2_019_partial_21_0339 : Poly :=
[
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 21. -/
theorem ep_Q2_019_partial_21_0339_valid :
    mulPoly ep_Q2_019_coefficient_21_0339
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0340 : Poly :=
[
  term ((-1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 21. -/
def ep_Q2_019_partial_21_0340 : Poly :=
[
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 21. -/
theorem ep_Q2_019_partial_21_0340_valid :
    mulPoly ep_Q2_019_coefficient_21_0340
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0341 : Poly :=
[
  term ((10910574292733428164260611915510581985892 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 341 for generator 21. -/
def ep_Q2_019_partial_21_0341 : Poly :=
[
  term ((21821148585466856328521223831021163971784 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10910574292733428164260611915510581985892 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 21. -/
theorem ep_Q2_019_partial_21_0341_valid :
    mulPoly ep_Q2_019_coefficient_21_0341
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0342 : Poly :=
[
  term ((48164712882830439075511338294615597816 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 342 for generator 21. -/
def ep_Q2_019_partial_21_0342 : Poly :=
[
  term ((96329425765660878151022676589231195632 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-48164712882830439075511338294615597816 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 21. -/
theorem ep_Q2_019_partial_21_0342_valid :
    mulPoly ep_Q2_019_coefficient_21_0342
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0343 : Poly :=
[
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 2), (16, 1)]
]

/-- Partial product 343 for generator 21. -/
def ep_Q2_019_partial_21_0343 : Poly :=
[
  term ((-2000434879057189328629406882159891808 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 21. -/
theorem ep_Q2_019_partial_21_0343_valid :
    mulPoly ep_Q2_019_coefficient_21_0343
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0344 : Poly :=
[
  term ((19247480273813271309599368846146056138554 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 344 for generator 21. -/
def ep_Q2_019_partial_21_0344 : Poly :=
[
  term ((38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-19247480273813271309599368846146056138554 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 21. -/
theorem ep_Q2_019_partial_21_0344_valid :
    mulPoly ep_Q2_019_coefficient_21_0344
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0345 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 345 for generator 21. -/
def ep_Q2_019_partial_21_0345 : Poly :=
[
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 21. -/
theorem ep_Q2_019_partial_21_0345_valid :
    mulPoly ep_Q2_019_coefficient_21_0345
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0346 : Poly :=
[
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 346 for generator 21. -/
def ep_Q2_019_partial_21_0346 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 21. -/
theorem ep_Q2_019_partial_21_0346_valid :
    mulPoly ep_Q2_019_coefficient_21_0346
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0347 : Poly :=
[
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 21. -/
def ep_Q2_019_partial_21_0347 : Poly :=
[
  term ((-4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 21. -/
theorem ep_Q2_019_partial_21_0347_valid :
    mulPoly ep_Q2_019_coefficient_21_0347
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0348 : Poly :=
[
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 21. -/
def ep_Q2_019_partial_21_0348 : Poly :=
[
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 21. -/
theorem ep_Q2_019_partial_21_0348_valid :
    mulPoly ep_Q2_019_coefficient_21_0348
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0349 : Poly :=
[
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 21. -/
def ep_Q2_019_partial_21_0349 : Poly :=
[
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 21. -/
theorem ep_Q2_019_partial_21_0349_valid :
    mulPoly ep_Q2_019_coefficient_21_0349
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0350 : Poly :=
[
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 350 for generator 21. -/
def ep_Q2_019_partial_21_0350 : Poly :=
[
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 21. -/
theorem ep_Q2_019_partial_21_0350_valid :
    mulPoly ep_Q2_019_coefficient_21_0350
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0351 : Poly :=
[
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 351 for generator 21. -/
def ep_Q2_019_partial_21_0351 : Poly :=
[
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 21. -/
theorem ep_Q2_019_partial_21_0351_valid :
    mulPoly ep_Q2_019_coefficient_21_0351
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0352 : Poly :=
[
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 352 for generator 21. -/
def ep_Q2_019_partial_21_0352 : Poly :=
[
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 21. -/
theorem ep_Q2_019_partial_21_0352_valid :
    mulPoly ep_Q2_019_coefficient_21_0352
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0353 : Poly :=
[
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 21. -/
def ep_Q2_019_partial_21_0353 : Poly :=
[
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 21. -/
theorem ep_Q2_019_partial_21_0353_valid :
    mulPoly ep_Q2_019_coefficient_21_0353
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0354 : Poly :=
[
  term ((-1184891486527909296170540233258876536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 21. -/
def ep_Q2_019_partial_21_0354 : Poly :=
[
  term ((-2369782973055818592341080466517753072 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1184891486527909296170540233258876536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 21. -/
theorem ep_Q2_019_partial_21_0354_valid :
    mulPoly ep_Q2_019_coefficient_21_0354
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0355 : Poly :=
[
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 21. -/
def ep_Q2_019_partial_21_0355 : Poly :=
[
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 21. -/
theorem ep_Q2_019_partial_21_0355_valid :
    mulPoly ep_Q2_019_coefficient_21_0355
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0356 : Poly :=
[
  term ((-16127051236502865923823233111275152 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 356 for generator 21. -/
def ep_Q2_019_partial_21_0356 : Poly :=
[
  term ((-32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((16127051236502865923823233111275152 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 21. -/
theorem ep_Q2_019_partial_21_0356_valid :
    mulPoly ep_Q2_019_coefficient_21_0356
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0357 : Poly :=
[
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 357 for generator 21. -/
def ep_Q2_019_partial_21_0357 : Poly :=
[
  term ((4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 21. -/
theorem ep_Q2_019_partial_21_0357_valid :
    mulPoly ep_Q2_019_coefficient_21_0357
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0358 : Poly :=
[
  term ((98002369762733091358826614534212048 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 358 for generator 21. -/
def ep_Q2_019_partial_21_0358 : Poly :=
[
  term ((196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-98002369762733091358826614534212048 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 21. -/
theorem ep_Q2_019_partial_21_0358_valid :
    mulPoly ep_Q2_019_coefficient_21_0358
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0359 : Poly :=
[
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 21. -/
def ep_Q2_019_partial_21_0359 : Poly :=
[
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 21. -/
theorem ep_Q2_019_partial_21_0359_valid :
    mulPoly ep_Q2_019_coefficient_21_0359
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0360 : Poly :=
[
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 360 for generator 21. -/
def ep_Q2_019_partial_21_0360 : Poly :=
[
  term ((-4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 21. -/
theorem ep_Q2_019_partial_21_0360_valid :
    mulPoly ep_Q2_019_coefficient_21_0360
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0361 : Poly :=
[
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 21. -/
def ep_Q2_019_partial_21_0361 : Poly :=
[
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 21. -/
theorem ep_Q2_019_partial_21_0361_valid :
    mulPoly ep_Q2_019_coefficient_21_0361
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0362 : Poly :=
[
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 362 for generator 21. -/
def ep_Q2_019_partial_21_0362 : Poly :=
[
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 21. -/
theorem ep_Q2_019_partial_21_0362_valid :
    mulPoly ep_Q2_019_coefficient_21_0362
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0363 : Poly :=
[
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 363 for generator 21. -/
def ep_Q2_019_partial_21_0363 : Poly :=
[
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 21. -/
theorem ep_Q2_019_partial_21_0363_valid :
    mulPoly ep_Q2_019_coefficient_21_0363
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0364 : Poly :=
[
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 21. -/
def ep_Q2_019_partial_21_0364 : Poly :=
[
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 21. -/
theorem ep_Q2_019_partial_21_0364_valid :
    mulPoly ep_Q2_019_coefficient_21_0364
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0365 : Poly :=
[
  term ((50344639211176196522428105344113616 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 365 for generator 21. -/
def ep_Q2_019_partial_21_0365 : Poly :=
[
  term ((100689278422352393044856210688227232 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-50344639211176196522428105344113616 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 21. -/
theorem ep_Q2_019_partial_21_0365_valid :
    mulPoly ep_Q2_019_coefficient_21_0365
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0366 : Poly :=
[
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 366 for generator 21. -/
def ep_Q2_019_partial_21_0366 : Poly :=
[
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 21. -/
theorem ep_Q2_019_partial_21_0366_valid :
    mulPoly ep_Q2_019_coefficient_21_0366
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0367 : Poly :=
[
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 367 for generator 21. -/
def ep_Q2_019_partial_21_0367 : Poly :=
[
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 21. -/
theorem ep_Q2_019_partial_21_0367_valid :
    mulPoly ep_Q2_019_coefficient_21_0367
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0368 : Poly :=
[
  term ((178427540664166073398154462877170208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 368 for generator 21. -/
def ep_Q2_019_partial_21_0368 : Poly :=
[
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-178427540664166073398154462877170208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 21. -/
theorem ep_Q2_019_partial_21_0368_valid :
    mulPoly ep_Q2_019_coefficient_21_0368
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0369 : Poly :=
[
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 21. -/
def ep_Q2_019_partial_21_0369 : Poly :=
[
  term ((765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 21. -/
theorem ep_Q2_019_partial_21_0369_valid :
    mulPoly ep_Q2_019_coefficient_21_0369
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0370 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 21. -/
def ep_Q2_019_partial_21_0370 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 21. -/
theorem ep_Q2_019_partial_21_0370_valid :
    mulPoly ep_Q2_019_coefficient_21_0370
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0371 : Poly :=
[
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 21. -/
def ep_Q2_019_partial_21_0371 : Poly :=
[
  term ((-1864833718227385979939373956618291795488 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 21. -/
theorem ep_Q2_019_partial_21_0371_valid :
    mulPoly ep_Q2_019_coefficient_21_0371
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0372 : Poly :=
[
  term ((-1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 372 for generator 21. -/
def ep_Q2_019_partial_21_0372 : Poly :=
[
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 21. -/
theorem ep_Q2_019_partial_21_0372_valid :
    mulPoly ep_Q2_019_coefficient_21_0372
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0373 : Poly :=
[
  term ((11006827520955084202619297600467279164596 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 21. -/
def ep_Q2_019_partial_21_0373 : Poly :=
[
  term ((22013655041910168405238595200934558329192 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11006827520955084202619297600467279164596 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 21. -/
theorem ep_Q2_019_partial_21_0373_valid :
    mulPoly ep_Q2_019_coefficient_21_0373
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0374 : Poly :=
[
  term ((-213437808724372785045562319933394693611978 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 21. -/
def ep_Q2_019_partial_21_0374 : Poly :=
[
  term ((-426875617448745570091124639866789387223956 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((213437808724372785045562319933394693611978 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 21. -/
theorem ep_Q2_019_partial_21_0374_valid :
    mulPoly ep_Q2_019_coefficient_21_0374
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0375 : Poly :=
[
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 375 for generator 21. -/
def ep_Q2_019_partial_21_0375 : Poly :=
[
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 21. -/
theorem ep_Q2_019_partial_21_0375_valid :
    mulPoly ep_Q2_019_coefficient_21_0375
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0376 : Poly :=
[
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 21. -/
def ep_Q2_019_partial_21_0376 : Poly :=
[
  term ((-765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 21. -/
theorem ep_Q2_019_partial_21_0376_valid :
    mulPoly ep_Q2_019_coefficient_21_0376
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0377 : Poly :=
[
  term ((720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 377 for generator 21. -/
def ep_Q2_019_partial_21_0377 : Poly :=
[
  term ((1441130114941631249262935854914341994448 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 21. -/
theorem ep_Q2_019_partial_21_0377_valid :
    mulPoly ep_Q2_019_coefficient_21_0377
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0378 : Poly :=
[
  term ((191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 378 for generator 21. -/
def ep_Q2_019_partial_21_0378 : Poly :=
[
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 21. -/
theorem ep_Q2_019_partial_21_0378_valid :
    mulPoly ep_Q2_019_coefficient_21_0378
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0379 : Poly :=
[
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 21. -/
def ep_Q2_019_partial_21_0379 : Poly :=
[
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 21. -/
theorem ep_Q2_019_partial_21_0379_valid :
    mulPoly ep_Q2_019_coefficient_21_0379
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0380 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 380 for generator 21. -/
def ep_Q2_019_partial_21_0380 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 21. -/
theorem ep_Q2_019_partial_21_0380_valid :
    mulPoly ep_Q2_019_coefficient_21_0380
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0381 : Poly :=
[
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 21. -/
def ep_Q2_019_partial_21_0381 : Poly :=
[
  term ((1864833718227385979939373956618291795488 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 21. -/
theorem ep_Q2_019_partial_21_0381_valid :
    mulPoly ep_Q2_019_coefficient_21_0381
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0382 : Poly :=
[
  term ((-191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 21. -/
def ep_Q2_019_partial_21_0382 : Poly :=
[
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 21. -/
theorem ep_Q2_019_partial_21_0382_valid :
    mulPoly ep_Q2_019_coefficient_21_0382
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0383 : Poly :=
[
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 21. -/
def ep_Q2_019_partial_21_0383 : Poly :=
[
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 21. -/
theorem ep_Q2_019_partial_21_0383_valid :
    mulPoly ep_Q2_019_coefficient_21_0383
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0384 : Poly :=
[
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 384 for generator 21. -/
def ep_Q2_019_partial_21_0384 : Poly :=
[
  term ((-1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 21. -/
theorem ep_Q2_019_partial_21_0384_valid :
    mulPoly ep_Q2_019_coefficient_21_0384
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0385 : Poly :=
[
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 385 for generator 21. -/
def ep_Q2_019_partial_21_0385 : Poly :=
[
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 21. -/
theorem ep_Q2_019_partial_21_0385_valid :
    mulPoly ep_Q2_019_coefficient_21_0385
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0386 : Poly :=
[
  term ((-19206546135168388861158692279781805888282 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 21. -/
def ep_Q2_019_partial_21_0386 : Poly :=
[
  term ((-38413092270336777722317384559563611776564 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((19206546135168388861158692279781805888282 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 21. -/
theorem ep_Q2_019_partial_21_0386_valid :
    mulPoly ep_Q2_019_coefficient_21_0386
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0387 : Poly :=
[
  term ((-1862120133705482853442141281527625647380 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 21. -/
def ep_Q2_019_partial_21_0387 : Poly :=
[
  term ((-3724240267410965706884282563055251294760 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1862120133705482853442141281527625647380 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 21. -/
theorem ep_Q2_019_partial_21_0387_valid :
    mulPoly ep_Q2_019_coefficient_21_0387
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0388 : Poly :=
[
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 21. -/
def ep_Q2_019_partial_21_0388 : Poly :=
[
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 21. -/
theorem ep_Q2_019_partial_21_0388_valid :
    mulPoly ep_Q2_019_coefficient_21_0388
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0389 : Poly :=
[
  term ((-15565876592472530412607344065160680856 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 389 for generator 21. -/
def ep_Q2_019_partial_21_0389 : Poly :=
[
  term ((-31131753184945060825214688130321361712 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((15565876592472530412607344065160680856 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 21. -/
theorem ep_Q2_019_partial_21_0389_valid :
    mulPoly ep_Q2_019_coefficient_21_0389
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0390 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 390 for generator 21. -/
def ep_Q2_019_partial_21_0390 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 21. -/
theorem ep_Q2_019_partial_21_0390_valid :
    mulPoly ep_Q2_019_coefficient_21_0390
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0391 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 21. -/
def ep_Q2_019_partial_21_0391 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 21. -/
theorem ep_Q2_019_partial_21_0391_valid :
    mulPoly ep_Q2_019_coefficient_21_0391
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0392 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 392 for generator 21. -/
def ep_Q2_019_partial_21_0392 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 21. -/
theorem ep_Q2_019_partial_21_0392_valid :
    mulPoly ep_Q2_019_coefficient_21_0392
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0393 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 393 for generator 21. -/
def ep_Q2_019_partial_21_0393 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 21. -/
theorem ep_Q2_019_partial_21_0393_valid :
    mulPoly ep_Q2_019_coefficient_21_0393
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0394 : Poly :=
[
  term ((410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 394 for generator 21. -/
def ep_Q2_019_partial_21_0394 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 21. -/
theorem ep_Q2_019_partial_21_0394_valid :
    mulPoly ep_Q2_019_coefficient_21_0394
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0395 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 21. -/
def ep_Q2_019_partial_21_0395 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 21. -/
theorem ep_Q2_019_partial_21_0395_valid :
    mulPoly ep_Q2_019_coefficient_21_0395
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0396 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 396 for generator 21. -/
def ep_Q2_019_partial_21_0396 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 21. -/
theorem ep_Q2_019_partial_21_0396_valid :
    mulPoly ep_Q2_019_coefficient_21_0396
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0397 : Poly :=
[
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 397 for generator 21. -/
def ep_Q2_019_partial_21_0397 : Poly :=
[
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 21. -/
theorem ep_Q2_019_partial_21_0397_valid :
    mulPoly ep_Q2_019_coefficient_21_0397
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0398 : Poly :=
[
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 21. -/
def ep_Q2_019_partial_21_0398 : Poly :=
[
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 21. -/
theorem ep_Q2_019_partial_21_0398_valid :
    mulPoly ep_Q2_019_coefficient_21_0398
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0399 : Poly :=
[
  term ((-136754955056579244519580512403730592 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 21. -/
def ep_Q2_019_partial_21_0399 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((136754955056579244519580512403730592 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 21. -/
theorem ep_Q2_019_partial_21_0399_valid :
    mulPoly ep_Q2_019_coefficient_21_0399
        ep_Q2_019_generator_21_0300_0399 =
      ep_Q2_019_partial_21_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_21_0300_0399 : List Poly :=
[
  ep_Q2_019_partial_21_0300,
  ep_Q2_019_partial_21_0301,
  ep_Q2_019_partial_21_0302,
  ep_Q2_019_partial_21_0303,
  ep_Q2_019_partial_21_0304,
  ep_Q2_019_partial_21_0305,
  ep_Q2_019_partial_21_0306,
  ep_Q2_019_partial_21_0307,
  ep_Q2_019_partial_21_0308,
  ep_Q2_019_partial_21_0309,
  ep_Q2_019_partial_21_0310,
  ep_Q2_019_partial_21_0311,
  ep_Q2_019_partial_21_0312,
  ep_Q2_019_partial_21_0313,
  ep_Q2_019_partial_21_0314,
  ep_Q2_019_partial_21_0315,
  ep_Q2_019_partial_21_0316,
  ep_Q2_019_partial_21_0317,
  ep_Q2_019_partial_21_0318,
  ep_Q2_019_partial_21_0319,
  ep_Q2_019_partial_21_0320,
  ep_Q2_019_partial_21_0321,
  ep_Q2_019_partial_21_0322,
  ep_Q2_019_partial_21_0323,
  ep_Q2_019_partial_21_0324,
  ep_Q2_019_partial_21_0325,
  ep_Q2_019_partial_21_0326,
  ep_Q2_019_partial_21_0327,
  ep_Q2_019_partial_21_0328,
  ep_Q2_019_partial_21_0329,
  ep_Q2_019_partial_21_0330,
  ep_Q2_019_partial_21_0331,
  ep_Q2_019_partial_21_0332,
  ep_Q2_019_partial_21_0333,
  ep_Q2_019_partial_21_0334,
  ep_Q2_019_partial_21_0335,
  ep_Q2_019_partial_21_0336,
  ep_Q2_019_partial_21_0337,
  ep_Q2_019_partial_21_0338,
  ep_Q2_019_partial_21_0339,
  ep_Q2_019_partial_21_0340,
  ep_Q2_019_partial_21_0341,
  ep_Q2_019_partial_21_0342,
  ep_Q2_019_partial_21_0343,
  ep_Q2_019_partial_21_0344,
  ep_Q2_019_partial_21_0345,
  ep_Q2_019_partial_21_0346,
  ep_Q2_019_partial_21_0347,
  ep_Q2_019_partial_21_0348,
  ep_Q2_019_partial_21_0349,
  ep_Q2_019_partial_21_0350,
  ep_Q2_019_partial_21_0351,
  ep_Q2_019_partial_21_0352,
  ep_Q2_019_partial_21_0353,
  ep_Q2_019_partial_21_0354,
  ep_Q2_019_partial_21_0355,
  ep_Q2_019_partial_21_0356,
  ep_Q2_019_partial_21_0357,
  ep_Q2_019_partial_21_0358,
  ep_Q2_019_partial_21_0359,
  ep_Q2_019_partial_21_0360,
  ep_Q2_019_partial_21_0361,
  ep_Q2_019_partial_21_0362,
  ep_Q2_019_partial_21_0363,
  ep_Q2_019_partial_21_0364,
  ep_Q2_019_partial_21_0365,
  ep_Q2_019_partial_21_0366,
  ep_Q2_019_partial_21_0367,
  ep_Q2_019_partial_21_0368,
  ep_Q2_019_partial_21_0369,
  ep_Q2_019_partial_21_0370,
  ep_Q2_019_partial_21_0371,
  ep_Q2_019_partial_21_0372,
  ep_Q2_019_partial_21_0373,
  ep_Q2_019_partial_21_0374,
  ep_Q2_019_partial_21_0375,
  ep_Q2_019_partial_21_0376,
  ep_Q2_019_partial_21_0377,
  ep_Q2_019_partial_21_0378,
  ep_Q2_019_partial_21_0379,
  ep_Q2_019_partial_21_0380,
  ep_Q2_019_partial_21_0381,
  ep_Q2_019_partial_21_0382,
  ep_Q2_019_partial_21_0383,
  ep_Q2_019_partial_21_0384,
  ep_Q2_019_partial_21_0385,
  ep_Q2_019_partial_21_0386,
  ep_Q2_019_partial_21_0387,
  ep_Q2_019_partial_21_0388,
  ep_Q2_019_partial_21_0389,
  ep_Q2_019_partial_21_0390,
  ep_Q2_019_partial_21_0391,
  ep_Q2_019_partial_21_0392,
  ep_Q2_019_partial_21_0393,
  ep_Q2_019_partial_21_0394,
  ep_Q2_019_partial_21_0395,
  ep_Q2_019_partial_21_0396,
  ep_Q2_019_partial_21_0397,
  ep_Q2_019_partial_21_0398,
  ep_Q2_019_partial_21_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_21_0300_0399 : Poly :=
[
  term ((392009479050932365435306458136848192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3025376823014443772588891709638342384 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3025376823014443772588891709638342384 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-392009479050932365435306458136848192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-10725573835607132448580701496137928936 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((98002369762733091358826614534212048 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-2197046533130209579968823157343014976 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((2197046533130209579968823157343014976 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-549261633282552394992205789335753744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((68610016389760283209430282568767251521928 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3091933433761568231511596866782498269792 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-87881939985554563454146423002264151112992 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((87559698794408148850003168667706724016872 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34305008194880141604715141284383625760964 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-43779849397204074425001584333853362008436 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((2013892584045852491207875902954955456 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3091933433761568231511596866782498269792 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-87559698794408148850003168667706724016872 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((87881939985554563454146423002264151112992 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-72458565117871907320128533419314171398344 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((10953018379079678971353977441827276179512 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((18114641279467976830032133354828542849586 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term ((4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-76989921095253085238397475384584224554216 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((96329425765660878151022676589231195632 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2000434879057189328629406882159891808 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((-4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((76989921095253085238397475384584224554216 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10910574292733428164260611915510581985892 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-48164712882830439075511338294615597816 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (16, 1)],
  term ((1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 2), (16, 1)],
  term ((-19247480273813271309599368846146056138554 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (15, 2), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (8, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2369782973055818592341080466517753072 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1184891486527909296170540233258876536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((16127051236502865923823233111275152 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-98002369762733091358826614534212048 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (8, 1), (16, 1)],
  term ((-4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((100689278422352393044856210688227232 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50344639211176196522428105344113616 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((573916245560474883369761083108967184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-178427540664166073398154462877170208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (16, 1)],
  term ((765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1864833718227385979939373956618291795488 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((22013655041910168405238595200934558329192 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-426875617448745570091124639866789387223956 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1010107648084738385981821810525088208 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-11006827520955084202619297600467279164596 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((213437808724372785045562319933394693611978 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1441130114941631249262935854914341994448 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1864833718227385979939373956618291795488 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((191305415186824961123253694369655728 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38413092270336777722317384559563611776564 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3724240267410965706884282563055251294760 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((19206546135168388861158692279781805888282 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1862120133705482853442141281527625647380 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (15, 1), (16, 1)],
  term ((-31131753184945060825214688130321361712 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((15565876592472530412607344065160680856 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-410264865169737733558741537211191776 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((136754955056579244519580512403730592 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 300 through 399. -/
theorem ep_Q2_019_block_21_0300_0399_valid :
    checkProductSumEq ep_Q2_019_partials_21_0300_0399
      ep_Q2_019_block_21_0300_0399 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
