/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 4:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_04_0300_0399 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0300 : Poly :=
[
  term ((290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0300 : Poly :=
[
  term ((290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0300_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0300
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0301 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0301 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 3), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0301_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0301
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0302 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 302 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0302 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0302_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0302
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0303 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0303 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 3), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0303_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0303
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0304 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0304 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0304_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0304
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0305 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 305 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0305 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0305_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0305
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0306 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 306 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0306 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0306_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0306
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0307 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 307 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0307 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 3), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0307_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0307
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0308 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0308 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0308_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0308
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0309 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 309 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0309 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0309_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0309
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0310 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 310 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0310 : Poly :=
[
  term ((6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 3), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0310_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0310
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0311 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 311 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0311 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 3), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0311_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0311
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0312 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0312 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 3), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0312_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0312
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0313 : Poly :=
[
  term ((867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 313 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0313 : Poly :=
[
  term ((-1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0313_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0313
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0314 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0314 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0314_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0314
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0315 : Poly :=
[
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 315 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0315 : Poly :=
[
  term ((28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0315_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0315
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0316 : Poly :=
[
  term ((-446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 316 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0316 : Poly :=
[
  term ((893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0316_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0316
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0317 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0317 : Poly :=
[
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0317_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0317
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0318 : Poly :=
[
  term ((-511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0318 : Poly :=
[
  term ((1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0318_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0318
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0319 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 319 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0319 : Poly :=
[
  term ((3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0319_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0319
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0320 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 320 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0320 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0320_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0320
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0321 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0321 : Poly :=
[
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0321_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0321
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0322 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 322 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0322 : Poly :=
[
  term ((6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0322_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0322
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0323 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0323 : Poly :=
[
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0323_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0323
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0324 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 324 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0324 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 2), (8, 1), (10, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0324_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0324
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0325 : Poly :=
[
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0325 : Poly :=
[
  term ((1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0325_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0325
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0326 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 326 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0326 : Poly :=
[
  term ((1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0326_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0326
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0327 : Poly :=
[
  term ((-5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 327 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0327 : Poly :=
[
  term ((11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0327_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0327
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0328 : Poly :=
[
  term ((106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0328 : Poly :=
[
  term ((-212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0328_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0328
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0329 : Poly :=
[
  term ((11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 329 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0329 : Poly :=
[
  term ((-22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0329_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0329
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0330 : Poly :=
[
  term ((-301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 330 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0330 : Poly :=
[
  term ((602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0330_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0330
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0331 : Poly :=
[
  term ((-738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 331 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0331 : Poly :=
[
  term ((1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0331_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0331
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0332 : Poly :=
[
  term ((-241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (16, 1)]
]

/-- Partial product 332 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0332 : Poly :=
[
  term ((483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 3), (16, 1)],
  term ((-241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 3), (16, 1)],
  term ((-241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 3), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 2), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0332_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0332
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0333 : Poly :=
[
  term ((-297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0333 : Poly :=
[
  term ((595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0333_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0333
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0334 : Poly :=
[
  term ((3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 334 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0334 : Poly :=
[
  term ((-7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 3), (16, 1)],
  term ((3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 3), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0334_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0334
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0335 : Poly :=
[
  term ((-941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0335 : Poly :=
[
  term ((1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0335_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0335
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0336 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 336 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0336 : Poly :=
[
  term ((2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0336_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0336
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0337 : Poly :=
[
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 337 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0337 : Poly :=
[
  term ((814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0337_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0337
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0338 : Poly :=
[
  term ((2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0338 : Poly :=
[
  term ((-4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0338_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0338
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0339 : Poly :=
[
  term ((1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 339 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0339 : Poly :=
[
  term ((-3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (11, 2), (16, 1)],
  term ((1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 2), (11, 2), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0339_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0339
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0340 : Poly :=
[
  term ((7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0340 : Poly :=
[
  term ((-14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0340_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0340
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0341 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 341 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0341 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0341_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0341
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0342 : Poly :=
[
  term ((4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0342 : Poly :=
[
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0342_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0342
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0343 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 343 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0343 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0343_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0343
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0344 : Poly :=
[
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 344 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0344 : Poly :=
[
  term ((4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 3), (11, 1), (16, 1)],
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 3), (11, 1), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0344_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0344
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0345 : Poly :=
[
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0345 : Poly :=
[
  term ((5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 3), (15, 1), (16, 1)],
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0345_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0345
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0346 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (16, 1)]
]

/-- Partial product 346 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0346 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 4), (10, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 4), (10, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (9, 4), (10, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0346_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0346
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0347 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 347 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0347 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 4), (15, 2), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 4), (15, 2), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (9, 4), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 2), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0347_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0347
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0348 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0348 : Poly :=
[
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0348_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0348
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0349 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 349 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0349 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0349_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0349
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0350 : Poly :=
[
  term ((1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0350 : Poly :=
[
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0350_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0350
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0351 : Poly :=
[
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 351 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0351 : Poly :=
[
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (11, 2), (16, 1)],
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (11, 2), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 2), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0351_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0351
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0352 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 352 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0352 : Poly :=
[
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0352_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0352
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0353 : Poly :=
[
  term (8 : Rat) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 353 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0353 : Poly :=
[
  term (-16 : Rat) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0353_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0353
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0354 : Poly :=
[
  term ((297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0354 : Poly :=
[
  term ((297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0354_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0354
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0355 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 355 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0355 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0355_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0355
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0356 : Poly :=
[
  term ((-790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 356 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0356 : Poly :=
[
  term ((-790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 1), (16, 1)],
  term ((-790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0356_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0356
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0357 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 357 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0357 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0357_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0357
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0358 : Poly :=
[
  term ((-185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0358 : Poly :=
[
  term ((-185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0358_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0358
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0359 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 359 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0359 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 3), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (13, 2), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 3), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0359_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0359
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0360 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 360 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0360 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (11, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0360_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0360
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0361 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 361 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0361 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0361_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0361
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0362 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0362 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0362_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0362
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0363 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 363 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0363 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 3), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0363_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0363
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0364 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0364 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 3), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0364_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0364
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0365 : Poly :=
[
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 365 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0365 : Poly :=
[
  term ((93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0365_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0365
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0366 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0366 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 3), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0366_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0366
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0367 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (16, 1)]
]

/-- Partial product 367 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0367 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (7, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0367_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0367
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0368 : Poly :=
[
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 368 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0368 : Poly :=
[
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0368_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0368
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0369 : Poly :=
[
  term ((35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0369 : Poly :=
[
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0369_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0369
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0370 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 370 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0370 : Poly :=
[
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0370_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0370
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0371 : Poly :=
[
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0371 : Poly :=
[
  term ((250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0371_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0371
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0372 : Poly :=
[
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 372 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0372 : Poly :=
[
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0372_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0372
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0373 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 373 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0373 : Poly :=
[
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0373_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0373
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0374 : Poly :=
[
  term ((40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0374 : Poly :=
[
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0374_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0374
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0375 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 375 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0375 : Poly :=
[
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 3), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 3), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 2), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0375_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0375
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0376 : Poly :=
[
  term ((107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 376 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0376 : Poly :=
[
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0376_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0376
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0377 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0377 : Poly :=
[
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0377_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0377
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0378 : Poly :=
[
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 378 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0378 : Poly :=
[
  term ((422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0378_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0378
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0379 : Poly :=
[
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0379 : Poly :=
[
  term ((17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0379_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0379
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0380 : Poly :=
[
  term ((4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 380 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0380 : Poly :=
[
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0380_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0380
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0381 : Poly :=
[
  term ((62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 381 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0381 : Poly :=
[
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0381_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0381
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0382 : Poly :=
[
  term ((13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 382 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0382 : Poly :=
[
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 2), (9, 1), (16, 1)],
  term ((13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 2), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0382_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0382
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0383 : Poly :=
[
  term ((1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 383 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0383 : Poly :=
[
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0383_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0383
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0384 : Poly :=
[
  term ((5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0384 : Poly :=
[
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0384_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0384
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0385 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 385 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0385 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0385_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0385
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0386 : Poly :=
[
  term ((12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 386 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0386 : Poly :=
[
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0386_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0386
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0387 : Poly :=
[
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0387 : Poly :=
[
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0387_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0387
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0388 : Poly :=
[
  term ((386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 388 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0388 : Poly :=
[
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 2), (9, 3), (10, 1), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 2), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0388_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0388
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0389 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0389 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0389_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0389
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0390 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 390 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0390 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (9, 3), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 2), (9, 3), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0390_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0390
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0391 : Poly :=
[
  term ((1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (16, 1)]
]

/-- Partial product 391 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0391 : Poly :=
[
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 3), (16, 1)],
  term ((1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 3), (16, 1)],
  term ((1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 3), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 1), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 2), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0391_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0391
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0392 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0392 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 4), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 4), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 4), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 2), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0392_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0392
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0393 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 393 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0393 : Poly :=
[
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0393_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0393
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0394 : Poly :=
[
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (16, 1)]
]

/-- Partial product 394 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0394 : Poly :=
[
  term ((167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)],
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 2), (11, 1), (16, 1)],
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 2), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0394_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0394
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0395 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0395 : Poly :=
[
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (6, 2), (15, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0395_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0395
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0396 : Poly :=
[
  term ((-259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 396 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0396 : Poly :=
[
  term ((-259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0396_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0396
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0397 : Poly :=
[
  term ((-74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 397 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0397 : Poly :=
[
  term ((-74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (13, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (9, 2), (16, 1)],
  term ((-74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0397_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0397
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0398 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 398 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0398 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0398_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0398
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0399 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 399 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0399 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0399_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0399
        rs_R010_ueqv_R010YNN_generator_04_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_04_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_04_0300_0399 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_04_0300,
  rs_R010_ueqv_R010YNN_partial_04_0301,
  rs_R010_ueqv_R010YNN_partial_04_0302,
  rs_R010_ueqv_R010YNN_partial_04_0303,
  rs_R010_ueqv_R010YNN_partial_04_0304,
  rs_R010_ueqv_R010YNN_partial_04_0305,
  rs_R010_ueqv_R010YNN_partial_04_0306,
  rs_R010_ueqv_R010YNN_partial_04_0307,
  rs_R010_ueqv_R010YNN_partial_04_0308,
  rs_R010_ueqv_R010YNN_partial_04_0309,
  rs_R010_ueqv_R010YNN_partial_04_0310,
  rs_R010_ueqv_R010YNN_partial_04_0311,
  rs_R010_ueqv_R010YNN_partial_04_0312,
  rs_R010_ueqv_R010YNN_partial_04_0313,
  rs_R010_ueqv_R010YNN_partial_04_0314,
  rs_R010_ueqv_R010YNN_partial_04_0315,
  rs_R010_ueqv_R010YNN_partial_04_0316,
  rs_R010_ueqv_R010YNN_partial_04_0317,
  rs_R010_ueqv_R010YNN_partial_04_0318,
  rs_R010_ueqv_R010YNN_partial_04_0319,
  rs_R010_ueqv_R010YNN_partial_04_0320,
  rs_R010_ueqv_R010YNN_partial_04_0321,
  rs_R010_ueqv_R010YNN_partial_04_0322,
  rs_R010_ueqv_R010YNN_partial_04_0323,
  rs_R010_ueqv_R010YNN_partial_04_0324,
  rs_R010_ueqv_R010YNN_partial_04_0325,
  rs_R010_ueqv_R010YNN_partial_04_0326,
  rs_R010_ueqv_R010YNN_partial_04_0327,
  rs_R010_ueqv_R010YNN_partial_04_0328,
  rs_R010_ueqv_R010YNN_partial_04_0329,
  rs_R010_ueqv_R010YNN_partial_04_0330,
  rs_R010_ueqv_R010YNN_partial_04_0331,
  rs_R010_ueqv_R010YNN_partial_04_0332,
  rs_R010_ueqv_R010YNN_partial_04_0333,
  rs_R010_ueqv_R010YNN_partial_04_0334,
  rs_R010_ueqv_R010YNN_partial_04_0335,
  rs_R010_ueqv_R010YNN_partial_04_0336,
  rs_R010_ueqv_R010YNN_partial_04_0337,
  rs_R010_ueqv_R010YNN_partial_04_0338,
  rs_R010_ueqv_R010YNN_partial_04_0339,
  rs_R010_ueqv_R010YNN_partial_04_0340,
  rs_R010_ueqv_R010YNN_partial_04_0341,
  rs_R010_ueqv_R010YNN_partial_04_0342,
  rs_R010_ueqv_R010YNN_partial_04_0343,
  rs_R010_ueqv_R010YNN_partial_04_0344,
  rs_R010_ueqv_R010YNN_partial_04_0345,
  rs_R010_ueqv_R010YNN_partial_04_0346,
  rs_R010_ueqv_R010YNN_partial_04_0347,
  rs_R010_ueqv_R010YNN_partial_04_0348,
  rs_R010_ueqv_R010YNN_partial_04_0349,
  rs_R010_ueqv_R010YNN_partial_04_0350,
  rs_R010_ueqv_R010YNN_partial_04_0351,
  rs_R010_ueqv_R010YNN_partial_04_0352,
  rs_R010_ueqv_R010YNN_partial_04_0353,
  rs_R010_ueqv_R010YNN_partial_04_0354,
  rs_R010_ueqv_R010YNN_partial_04_0355,
  rs_R010_ueqv_R010YNN_partial_04_0356,
  rs_R010_ueqv_R010YNN_partial_04_0357,
  rs_R010_ueqv_R010YNN_partial_04_0358,
  rs_R010_ueqv_R010YNN_partial_04_0359,
  rs_R010_ueqv_R010YNN_partial_04_0360,
  rs_R010_ueqv_R010YNN_partial_04_0361,
  rs_R010_ueqv_R010YNN_partial_04_0362,
  rs_R010_ueqv_R010YNN_partial_04_0363,
  rs_R010_ueqv_R010YNN_partial_04_0364,
  rs_R010_ueqv_R010YNN_partial_04_0365,
  rs_R010_ueqv_R010YNN_partial_04_0366,
  rs_R010_ueqv_R010YNN_partial_04_0367,
  rs_R010_ueqv_R010YNN_partial_04_0368,
  rs_R010_ueqv_R010YNN_partial_04_0369,
  rs_R010_ueqv_R010YNN_partial_04_0370,
  rs_R010_ueqv_R010YNN_partial_04_0371,
  rs_R010_ueqv_R010YNN_partial_04_0372,
  rs_R010_ueqv_R010YNN_partial_04_0373,
  rs_R010_ueqv_R010YNN_partial_04_0374,
  rs_R010_ueqv_R010YNN_partial_04_0375,
  rs_R010_ueqv_R010YNN_partial_04_0376,
  rs_R010_ueqv_R010YNN_partial_04_0377,
  rs_R010_ueqv_R010YNN_partial_04_0378,
  rs_R010_ueqv_R010YNN_partial_04_0379,
  rs_R010_ueqv_R010YNN_partial_04_0380,
  rs_R010_ueqv_R010YNN_partial_04_0381,
  rs_R010_ueqv_R010YNN_partial_04_0382,
  rs_R010_ueqv_R010YNN_partial_04_0383,
  rs_R010_ueqv_R010YNN_partial_04_0384,
  rs_R010_ueqv_R010YNN_partial_04_0385,
  rs_R010_ueqv_R010YNN_partial_04_0386,
  rs_R010_ueqv_R010YNN_partial_04_0387,
  rs_R010_ueqv_R010YNN_partial_04_0388,
  rs_R010_ueqv_R010YNN_partial_04_0389,
  rs_R010_ueqv_R010YNN_partial_04_0390,
  rs_R010_ueqv_R010YNN_partial_04_0391,
  rs_R010_ueqv_R010YNN_partial_04_0392,
  rs_R010_ueqv_R010YNN_partial_04_0393,
  rs_R010_ueqv_R010YNN_partial_04_0394,
  rs_R010_ueqv_R010YNN_partial_04_0395,
  rs_R010_ueqv_R010YNN_partial_04_0396,
  rs_R010_ueqv_R010YNN_partial_04_0397,
  rs_R010_ueqv_R010YNN_partial_04_0398,
  rs_R010_ueqv_R010YNN_partial_04_0399
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_04_0300_0399 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 3), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 4), (10, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 4), (15, 2), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 2), (8, 1), (10, 1), (16, 1)],
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 3), (16, 1)],
  term ((-312393146367967146616 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-188487463445227520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 2), (11, 2), (16, 1)],
  term ((814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 3), (11, 1), (16, 1)],
  term ((-637438642703851520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 4), (10, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (9, 4), (15, 2), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((8306980240581067304 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (6, 2), (11, 2), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 3), (9, 1), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 3), (9, 2), (15, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 3), (9, 3), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 3), (11, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 3), (16, 1)],
  term ((-297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 2), (11, 2), (16, 1)],
  term ((7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 3), (11, 1), (16, 1)],
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (9, 4), (10, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (9, 4), (15, 2), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 2), (11, 2), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 3), (9, 1), (10, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 3), (9, 1), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 3), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 3), (9, 2), (15, 3), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 3), (9, 3), (10, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 3), (9, 3), (15, 2), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 2), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (13, 2), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (13, 2), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2414398072269209600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (12, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (13, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (12, 2), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (13, 2), (15, 2), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (12, 2), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (13, 2), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 1), (16, 1)],
  term ((297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (7, 2), (9, 3), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (12, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (13, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 3), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 4), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (7, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (8, 1), (9, 3), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-10328338201886954240 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((941451337042330624 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((127785741769710830992 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 2), (9, 1), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((16100635100296603904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-2387704769960676026048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (6, 2), (9, 3), (10, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (6, 2), (9, 3), (15, 2), (16, 1)],
  term ((3051836714973061120 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 2), (9, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (9, 4), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-46024795298997224192 : Rat) / 149717402626960975) [(3, 1), (5, 2), (6, 2), (11, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (6, 2), (15, 1), (16, 1)],
  term ((297153869582026240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 3), (9, 1), (11, 2), (16, 1)],
  term ((-790011652830280096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 3), (9, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 3), (9, 2), (11, 1), (16, 1)],
  term ((-185785469175424000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 3), (9, 2), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 3), (9, 3), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 3), (11, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 2), (8, 1), (9, 3), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 2), (9, 3), (15, 2), (16, 1)],
  term ((1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (9, 4), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 2), (11, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 3), (8, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 3), (9, 2), (10, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 3), (9, 2), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 3), (9, 3), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 3), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 2), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (13, 2), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 2), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 2), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (13, 2), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (13, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 2), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (13, 2), (15, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 2), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (13, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (9, 2), (16, 1)],
  term ((-259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 3), (9, 1), (11, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 3), (9, 2), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 3), (8, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 399. -/
theorem rs_R010_ueqv_R010YNN_block_04_0300_0399_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_04_0300_0399
      rs_R010_ueqv_R010YNN_block_04_0300_0399 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
