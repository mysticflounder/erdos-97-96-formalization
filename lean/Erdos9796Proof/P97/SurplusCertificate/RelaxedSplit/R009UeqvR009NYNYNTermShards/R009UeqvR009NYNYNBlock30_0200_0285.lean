/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 30:200-285

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0200 : Poly :=
[
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0200 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0200
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0201 : Poly :=
[
  term ((-942980811549215442906411730769140937020331 : Rat) / 52756233300863930890950490901821065714000) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 201 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0201 : Poly :=
[
  term ((-942980811549215442906411730769140937020331 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((942980811549215442906411730769140937020331 : Rat) / 52756233300863930890950490901821065714000) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-942980811549215442906411730769140937020331 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((942980811549215442906411730769140937020331 : Rat) / 52756233300863930890950490901821065714000) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0201
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0202 : Poly :=
[
  term ((601615892560884783381 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0202 : Poly :=
[
  term ((1203231785121769566762 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-601615892560884783381 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1203231785121769566762 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-601615892560884783381 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0202
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0203 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2)]
]

/-- Partial product 203 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0203 : Poly :=
[
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (12, 2)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0203
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0204 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (16, 1)]
]

/-- Partial product 204 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0204 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0204
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0205 : Poly :=
[
  term ((-403567108456204754586117316770253036884617072860235 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1)]
]

/-- Partial product 205 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0205 : Poly :=
[
  term ((-807134216912409509172234633540506073769234145720470 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((403567108456204754586117316770253036884617072860235 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 2)],
  term ((-807134216912409509172234633540506073769234145720470 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((403567108456204754586117316770253036884617072860235 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0205
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0206 : Poly :=
[
  term ((28643534027182045681063155821227334656739431272728300520736660288 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 206 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0206 : Poly :=
[
  term ((57287068054364091362126311642454669313478862545456601041473320576 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-28643534027182045681063155821227334656739431272728300520736660288 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((57287068054364091362126311642454669313478862545456601041473320576 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-28643534027182045681063155821227334656739431272728300520736660288 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0206
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0207 : Poly :=
[
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 207 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0207 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0207
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0208 : Poly :=
[
  term ((-220316310852082072304436757577228703512883471252038252780460294800496380401 : Rat) / 1961589846315780509757129524895862309879948727683124239972069054742327250) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 208 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0208 : Poly :=
[
  term ((-220316310852082072304436757577228703512883471252038252780460294800496380401 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((220316310852082072304436757577228703512883471252038252780460294800496380401 : Rat) / 1961589846315780509757129524895862309879948727683124239972069054742327250) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-220316310852082072304436757577228703512883471252038252780460294800496380401 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((220316310852082072304436757577228703512883471252038252780460294800496380401 : Rat) / 1961589846315780509757129524895862309879948727683124239972069054742327250) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0208
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0209 : Poly :=
[
  term ((-17216537216322979932 : Rat) / 17287881532499594905) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0209 : Poly :=
[
  term ((-34433074432645959864 : Rat) / 17287881532499594905) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17216537216322979932 : Rat) / 17287881532499594905) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34433074432645959864 : Rat) / 17287881532499594905) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((17216537216322979932 : Rat) / 17287881532499594905) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0209
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0210 : Poly :=
[
  term ((18446768521368429626560300145307356779404495541999391213820882532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2)]
]

/-- Partial product 210 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0210 : Poly :=
[
  term ((36893537042736859253120600290614713558808991083998782427641765064 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-18446768521368429626560300145307356779404495541999391213820882532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (12, 2)],
  term ((36893537042736859253120600290614713558808991083998782427641765064 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-18446768521368429626560300145307356779404495541999391213820882532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0210
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0211 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 211 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0211 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0211
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0212 : Poly :=
[
  term ((23154031506073556009180707251438144644648694875176 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 1)]
]

/-- Partial product 212 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0212 : Poly :=
[
  term ((46308063012147112018361414502876289289297389750352 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-23154031506073556009180707251438144644648694875176 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 1), (13, 2)],
  term ((46308063012147112018361414502876289289297389750352 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 2), (14, 1)],
  term ((-23154031506073556009180707251438144644648694875176 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0212
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0213 : Poly :=
[
  term ((72330256375033410683794318339243812479651788744791789242442450697 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 213 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0213 : Poly :=
[
  term ((72330256375033410683794318339243812479651788744791789242442450697 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-72330256375033410683794318339243812479651788744791789242442450697 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((72330256375033410683794318339243812479651788744791789242442450697 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(8, 1), (13, 2), (15, 2)],
  term ((-72330256375033410683794318339243812479651788744791789242442450697 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0213
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0214 : Poly :=
[
  term ((2687898888702664994681 : Rat) / 4339258264657398321155) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0214 : Poly :=
[
  term ((5375797777405329989362 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2687898888702664994681 : Rat) / 4339258264657398321155) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5375797777405329989362 : Rat) / 4339258264657398321155) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2687898888702664994681 : Rat) / 4339258264657398321155) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0214
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0215 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 2)]
]

/-- Partial product 215 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0215 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (12, 2), (13, 2)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 3), (15, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0215
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0216 : Poly :=
[
  term ((-15819127922296789267682991608600391314488419634045188564674467278659 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (15, 2)]
]

/-- Partial product 216 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0216 : Poly :=
[
  term ((-15819127922296789267682991608600391314488419634045188564674467278659 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((15819127922296789267682991608600391314488419634045188564674467278659 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (12, 2), (15, 2)],
  term ((-15819127922296789267682991608600391314488419634045188564674467278659 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (13, 1), (15, 3)],
  term ((15819127922296789267682991608600391314488419634045188564674467278659 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0216
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0217 : Poly :=
[
  term ((-1775643679141299 : Rat) / 7342292683791569) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 217 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0217 : Poly :=
[
  term ((-3551287358282598 : Rat) / 7342292683791569) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1775643679141299 : Rat) / 7342292683791569) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3551287358282598 : Rat) / 7342292683791569) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1775643679141299 : Rat) / 7342292683791569) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0217
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0218 : Poly :=
[
  term ((-885272285358968285437319 : Rat) / 96422029330519883472300) [(8, 1), (16, 1)]
]

/-- Partial product 218 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0218 : Poly :=
[
  term ((-885272285358968285437319 : Rat) / 48211014665259941736150) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((885272285358968285437319 : Rat) / 96422029330519883472300) [(8, 1), (12, 2), (16, 1)],
  term ((-885272285358968285437319 : Rat) / 48211014665259941736150) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((885272285358968285437319 : Rat) / 96422029330519883472300) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0218
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0219 : Poly :=
[
  term ((6938829885856004535845170793004593587746123891494872679819495452 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 219 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0219 : Poly :=
[
  term ((13877659771712009071690341586009187175492247782989745359638990904 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-6938829885856004535845170793004593587746123891494872679819495452 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((13877659771712009071690341586009187175492247782989745359638990904 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6938829885856004535845170793004593587746123891494872679819495452 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0219
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0220 : Poly :=
[
  term ((-1164670077761153054368 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 220 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0220 : Poly :=
[
  term ((-2329340155522306108736 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1164670077761153054368 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2329340155522306108736 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1164670077761153054368 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0220
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0221 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 221 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0221 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0221
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0222 : Poly :=
[
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0222 : Poly :=
[
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0222
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0223 : Poly :=
[
  term ((250148007047313924191962073189963332754353 : Rat) / 2374030498538876890092772090581947957130) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 223 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0223 : Poly :=
[
  term ((250148007047313924191962073189963332754353 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-250148007047313924191962073189963332754353 : Rat) / 2374030498538876890092772090581947957130) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((250148007047313924191962073189963332754353 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-250148007047313924191962073189963332754353 : Rat) / 2374030498538876890092772090581947957130) [(9, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0223
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0224 : Poly :=
[
  term ((20653264609286964135464 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 224 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0224 : Poly :=
[
  term ((41306529218573928270928 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20653264609286964135464 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((41306529218573928270928 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20653264609286964135464 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0224
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0225 : Poly :=
[
  term ((21320208101521224265926982426823843629910084634535025028252399431411249479357 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 225 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0225 : Poly :=
[
  term ((21320208101521224265926982426823843629910084634535025028252399431411249479357 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21320208101521224265926982426823843629910084634535025028252399431411249479357 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((21320208101521224265926982426823843629910084634535025028252399431411249479357 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-21320208101521224265926982426823843629910084634535025028252399431411249479357 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0225
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0226 : Poly :=
[
  term ((280314723296419870344 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0226 : Poly :=
[
  term ((560629446592839740688 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-280314723296419870344 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((560629446592839740688 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-280314723296419870344 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0226
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0227 : Poly :=
[
  term ((-19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 1), (11, 1)]
]

/-- Partial product 227 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0227 : Poly :=
[
  term ((-19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 1), (11, 1), (12, 2)],
  term ((-19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0227
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0228 : Poly :=
[
  term ((-257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 228 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0228 : Poly :=
[
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0228
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0229 : Poly :=
[
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 229 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0229 : Poly :=
[
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0229
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0230 : Poly :=
[
  term ((-1389344748575474640948 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 230 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0230 : Poly :=
[
  term ((-2778689497150949281896 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1389344748575474640948 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2778689497150949281896 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1389344748575474640948 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0230
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0231 : Poly :=
[
  term ((944670600904739502583305361878242786457019 : Rat) / 4748060997077753780185544181163895914260) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 231 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0231 : Poly :=
[
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 4748060997077753780185544181163895914260) [(9, 1), (12, 1), (13, 3)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 4748060997077753780185544181163895914260) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0231
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0232 : Poly :=
[
  term ((38997975877156222521436 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 232 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0232 : Poly :=
[
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-38997975877156222521436 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38997975877156222521436 : Rat) / 13017774793972194963465) [(9, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0232
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0233 : Poly :=
[
  term ((324580717641125053294263122587649906188062402067586654947120914930449408579 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 233 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0233 : Poly :=
[
  term ((649161435282250106588526245175299812376124804135173309894241829860898817158 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-324580717641125053294263122587649906188062402067586654947120914930449408579 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((649161435282250106588526245175299812376124804135173309894241829860898817158 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-324580717641125053294263122587649906188062402067586654947120914930449408579 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0233
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0234 : Poly :=
[
  term ((-105869680848451165638 : Rat) / 17711258223091421719) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0234 : Poly :=
[
  term ((-211739361696902331276 : Rat) / 17711258223091421719) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((105869680848451165638 : Rat) / 17711258223091421719) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-211739361696902331276 : Rat) / 17711258223091421719) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((105869680848451165638 : Rat) / 17711258223091421719) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0234
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0235 : Poly :=
[
  term ((1477316781310803480742726969561761864524118607805691405878910902280438898142997359 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (13, 1)]
]

/-- Partial product 235 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0235 : Poly :=
[
  term ((1477316781310803480742726969561761864524118607805691405878910902280438898142997359 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1477316781310803480742726969561761864524118607805691405878910902280438898142997359 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (12, 2), (13, 1)],
  term ((1477316781310803480742726969561761864524118607805691405878910902280438898142997359 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (13, 2), (15, 1)],
  term ((-1477316781310803480742726969561761864524118607805691405878910902280438898142997359 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0235
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0236 : Poly :=
[
  term ((11051558667072872659789021 : Rat) / 1515268986018363493747326) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 236 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0236 : Poly :=
[
  term ((11051558667072872659789021 : Rat) / 757634493009181746873663) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11051558667072872659789021 : Rat) / 1515268986018363493747326) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((11051558667072872659789021 : Rat) / 757634493009181746873663) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11051558667072872659789021 : Rat) / 1515268986018363493747326) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0236
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0237 : Poly :=
[
  term ((1764527790123293332381623633241430131896270689432270302179027882032087496054461013737 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (15, 1)]
]

/-- Partial product 237 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0237 : Poly :=
[
  term ((1764527790123293332381623633241430131896270689432270302179027882032087496054461013737 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1764527790123293332381623633241430131896270689432270302179027882032087496054461013737 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (12, 2), (15, 1)],
  term ((1764527790123293332381623633241430131896270689432270302179027882032087496054461013737 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(9, 1), (13, 1), (15, 2)],
  term ((-1764527790123293332381623633241430131896270689432270302179027882032087496054461013737 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0237
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0238 : Poly :=
[
  term ((25431436812177153778548826 : Rat) / 1262724155015302911456105) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0238 : Poly :=
[
  term ((50862873624354307557097652 : Rat) / 1262724155015302911456105) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25431436812177153778548826 : Rat) / 1262724155015302911456105) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((50862873624354307557097652 : Rat) / 1262724155015302911456105) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25431436812177153778548826 : Rat) / 1262724155015302911456105) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0238
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0239 : Poly :=
[
  term ((-962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 2)]
]

/-- Partial product 239 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0239 : Poly :=
[
  term ((-962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 2), (12, 1), (14, 1)],
  term ((962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 2), (12, 2)],
  term ((-962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 2), (13, 1), (15, 1)],
  term ((962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0239
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0240 : Poly :=
[
  term ((-905708930508086124635904967269532695242383 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (10, 1)]
]

/-- Partial product 240 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0240 : Poly :=
[
  term ((-905708930508086124635904967269532695242383 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((905708930508086124635904967269532695242383 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (10, 1), (12, 2)],
  term ((-905708930508086124635904967269532695242383 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((905708930508086124635904967269532695242383 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0240
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0241 : Poly :=
[
  term ((1540897771419952496088 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 241 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0241 : Poly :=
[
  term ((3081795542839904992176 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1540897771419952496088 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (12, 2), (16, 1)],
  term ((3081795542839904992176 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1540897771419952496088 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0241
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0242 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (12, 1)]
]

/-- Partial product 242 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0242 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (12, 1), (13, 2)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (12, 2), (14, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0242
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0243 : Poly :=
[
  term ((2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 243 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0243 : Poly :=
[
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 2), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0243
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0244 : Poly :=
[
  term ((-9789524612843978156027693 : Rat) / 7576344930091817468736630) [(9, 2), (16, 1)]
]

/-- Partial product 244 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0244 : Poly :=
[
  term ((-9789524612843978156027693 : Rat) / 3788172465045908734368315) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((9789524612843978156027693 : Rat) / 7576344930091817468736630) [(9, 2), (12, 2), (16, 1)],
  term ((-9789524612843978156027693 : Rat) / 3788172465045908734368315) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((9789524612843978156027693 : Rat) / 7576344930091817468736630) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0244
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0245 : Poly :=
[
  term ((-2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 20028220835171822389773579823886860040410070294699691019141785904227340800) [(10, 1)]
]

/-- Partial product 245 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0245 : Poly :=
[
  term ((-2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 10014110417585911194886789911943430020205035147349845509570892952113670400) [(10, 1), (12, 1), (14, 1)],
  term ((2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 20028220835171822389773579823886860040410070294699691019141785904227340800) [(10, 1), (12, 2)],
  term ((-2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 10014110417585911194886789911943430020205035147349845509570892952113670400) [(10, 1), (13, 1), (15, 1)],
  term ((2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 20028220835171822389773579823886860040410070294699691019141785904227340800) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0245
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0246 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 246 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0246 : Poly :=
[
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0246
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0247 : Poly :=
[
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0247 : Poly :=
[
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0247
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0248 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 248 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0248 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0248
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0249 : Poly :=
[
  term ((8994570087803475104663333510339097345100660786617685416064797112 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 249 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0249 : Poly :=
[
  term ((17989140175606950209326667020678194690201321573235370832129594224 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8994570087803475104663333510339097345100660786617685416064797112 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((17989140175606950209326667020678194690201321573235370832129594224 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8994570087803475104663333510339097345100660786617685416064797112 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0249
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0250 : Poly :=
[
  term ((-242871078740986239808 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0250 : Poly :=
[
  term ((-485742157481972479616 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((242871078740986239808 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-485742157481972479616 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((242871078740986239808 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0250
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0251 : Poly :=
[
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2)]
]

/-- Partial product 251 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0251 : Poly :=
[
  term ((-151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2), (12, 2)],
  term ((-151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0251
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0252 : Poly :=
[
  term ((909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(10, 1), (12, 1)]
]

/-- Partial product 252 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0252 : Poly :=
[
  term ((909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 782352376373899312100530461870580470328518370886706680435226011883880500) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(10, 1), (12, 1), (13, 2)],
  term ((909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 782352376373899312100530461870580470328518370886706680435226011883880500) [(10, 1), (12, 2), (14, 1)],
  term ((-909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0252
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0253 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 253 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0253 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 1), (13, 3), (15, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0253_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0253
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0254 : Poly :=
[
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0254 : Poly :=
[
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0254_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0254
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0255 : Poly :=
[
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 255 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0255 : Poly :=
[
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0255_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0255
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0256 : Poly :=
[
  term ((-850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 256 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0256 : Poly :=
[
  term ((-1700851510399536 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0256_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0256
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0257 : Poly :=
[
  term ((334694819791852282016 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 257 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0257 : Poly :=
[
  term ((669389639583704564032 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((669389639583704564032 : Rat) / 32049107564750198685) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0257_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0257
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0258 : Poly :=
[
  term ((26081942636182392581381632454957734649609 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 258 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0258 : Poly :=
[
  term ((52163885272364785162763264909915469299218 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26081942636182392581381632454957734649609 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((52163885272364785162763264909915469299218 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (13, 2), (15, 2)],
  term ((-26081942636182392581381632454957734649609 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0258_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0258
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0259 : Poly :=
[
  term ((4306868314864736325584 : Rat) / 13017774793972194963465) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0259 : Poly :=
[
  term ((8613736629729472651168 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4306868314864736325584 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8613736629729472651168 : Rat) / 13017774793972194963465) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4306868314864736325584 : Rat) / 13017774793972194963465) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0259_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0259
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0260 : Poly :=
[
  term ((-74687833214381782263871774479344484478495587599742512897462491373 : Rat) / 4798743665759789441695183709227627395897562734399724475206521462) [(10, 1), (15, 2)]
]

/-- Partial product 260 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0260 : Poly :=
[
  term ((-74687833214381782263871774479344484478495587599742512897462491373 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((74687833214381782263871774479344484478495587599742512897462491373 : Rat) / 4798743665759789441695183709227627395897562734399724475206521462) [(10, 1), (12, 2), (15, 2)],
  term ((-74687833214381782263871774479344484478495587599742512897462491373 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(10, 1), (13, 1), (15, 3)],
  term ((74687833214381782263871774479344484478495587599742512897462491373 : Rat) / 4798743665759789441695183709227627395897562734399724475206521462) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0260_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0260
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0261 : Poly :=
[
  term ((-1977896382560208 : Rat) / 7342292683791569) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 261 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0261 : Poly :=
[
  term ((-3955792765120416 : Rat) / 7342292683791569) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1977896382560208 : Rat) / 7342292683791569) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3955792765120416 : Rat) / 7342292683791569) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1977896382560208 : Rat) / 7342292683791569) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0261_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0261
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0262 : Poly :=
[
  term ((-12016529305664170181 : Rat) / 6409821512950039737) [(10, 1), (16, 1)]
]

/-- Partial product 262 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0262 : Poly :=
[
  term ((-24033058611328340362 : Rat) / 6409821512950039737) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((12016529305664170181 : Rat) / 6409821512950039737) [(10, 1), (12, 2), (16, 1)],
  term ((-24033058611328340362 : Rat) / 6409821512950039737) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12016529305664170181 : Rat) / 6409821512950039737) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0262_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0262
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0263 : Poly :=
[
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(10, 2)]
]

/-- Partial product 263 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0263 : Poly :=
[
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(10, 2), (12, 1), (14, 1)],
  term ((-117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(10, 2), (12, 2)],
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(10, 2), (13, 1), (15, 1)],
  term ((-117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0263_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0263
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0264 : Poly :=
[
  term ((386907211679381238010496 : Rat) / 24105507332629970868075) [(10, 2), (16, 1)]
]

/-- Partial product 264 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0264 : Poly :=
[
  term ((773814423358762476020992 : Rat) / 24105507332629970868075) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-386907211679381238010496 : Rat) / 24105507332629970868075) [(10, 2), (12, 2), (16, 1)],
  term ((773814423358762476020992 : Rat) / 24105507332629970868075) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-386907211679381238010496 : Rat) / 24105507332629970868075) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0264_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0264
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0265 : Poly :=
[
  term ((18095049532321035385910510383317893822199306288523082755052222741 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 265 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0265 : Poly :=
[
  term ((36190099064642070771821020766635787644398612577046165510104445482 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18095049532321035385910510383317893822199306288523082755052222741 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((36190099064642070771821020766635787644398612577046165510104445482 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-18095049532321035385910510383317893822199306288523082755052222741 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0265_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0265
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0266 : Poly :=
[
  term ((2900446370125562841080 : Rat) / 123978807561639952033) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0266 : Poly :=
[
  term ((5800892740251125682160 : Rat) / 123978807561639952033) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2900446370125562841080 : Rat) / 123978807561639952033) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5800892740251125682160 : Rat) / 123978807561639952033) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2900446370125562841080 : Rat) / 123978807561639952033) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0266_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0266
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0267 : Poly :=
[
  term ((-15573125057189338557159113572093229274776370894571930886993423236483 : Rat) / 66678045987933441821355096415927313465016510736748648497097061000) [(11, 1), (13, 1)]
]

/-- Partial product 267 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0267 : Poly :=
[
  term ((-15573125057189338557159113572093229274776370894571930886993423236483 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((15573125057189338557159113572093229274776370894571930886993423236483 : Rat) / 66678045987933441821355096415927313465016510736748648497097061000) [(11, 1), (12, 2), (13, 1)],
  term ((-15573125057189338557159113572093229274776370894571930886993423236483 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(11, 1), (13, 2), (15, 1)],
  term ((15573125057189338557159113572093229274776370894571930886993423236483 : Rat) / 66678045987933441821355096415927313465016510736748648497097061000) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0267_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0267
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0268 : Poly :=
[
  term ((-5734700695582349527474 : Rat) / 1859682113424599280495) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 268 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0268 : Poly :=
[
  term ((-11469401391164699054948 : Rat) / 1859682113424599280495) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5734700695582349527474 : Rat) / 1859682113424599280495) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-11469401391164699054948 : Rat) / 1859682113424599280495) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5734700695582349527474 : Rat) / 1859682113424599280495) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0268_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0268
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0269 : Poly :=
[
  term ((-3662118553478658907024364531463507678229589627078620228444092644234326023920749477 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 1), (15, 1)]
]

/-- Partial product 269 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0269 : Poly :=
[
  term ((-3662118553478658907024364531463507678229589627078620228444092644234326023920749477 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3662118553478658907024364531463507678229589627078620228444092644234326023920749477 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 1), (12, 2), (15, 1)],
  term ((-3662118553478658907024364531463507678229589627078620228444092644234326023920749477 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(11, 1), (13, 1), (15, 2)],
  term ((3662118553478658907024364531463507678229589627078620228444092644234326023920749477 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0269_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0269
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0270 : Poly :=
[
  term ((-38788106328174044678126284 : Rat) / 3788172465045908734368315) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0270 : Poly :=
[
  term ((-77576212656348089356252568 : Rat) / 3788172465045908734368315) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((38788106328174044678126284 : Rat) / 3788172465045908734368315) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-77576212656348089356252568 : Rat) / 3788172465045908734368315) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((38788106328174044678126284 : Rat) / 3788172465045908734368315) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0270_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0270
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0271 : Poly :=
[
  term ((15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 14319757612849192147778241450876573571472889955179565969935843115548811640313750) [(11, 2)]
]

/-- Partial product 271 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0271 : Poly :=
[
  term ((15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 7159878806424596073889120725438286785736444977589782984967921557774405820156875) [(11, 2), (12, 1), (14, 1)],
  term ((-15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 14319757612849192147778241450876573571472889955179565969935843115548811640313750) [(11, 2), (12, 2)],
  term ((15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 7159878806424596073889120725438286785736444977589782984967921557774405820156875) [(11, 2), (13, 1), (15, 1)],
  term ((-15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 14319757612849192147778241450876573571472889955179565969935843115548811640313750) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0271_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0271
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0272 : Poly :=
[
  term ((53144333905059950461628093704 : Rat) / 2849246861209529926635596925) [(11, 2), (16, 1)]
]

/-- Partial product 272 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0272 : Poly :=
[
  term ((106288667810119900923256187408 : Rat) / 2849246861209529926635596925) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-53144333905059950461628093704 : Rat) / 2849246861209529926635596925) [(11, 2), (12, 2), (16, 1)],
  term ((106288667810119900923256187408 : Rat) / 2849246861209529926635596925) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53144333905059950461628093704 : Rat) / 2849246861209529926635596925) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0272_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0272
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0273 : Poly :=
[
  term ((5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 12517638021982388993608487389929287525256293934187306886963616190142088000) [(12, 1)]
]

/-- Partial product 273 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0273 : Poly :=
[
  term ((5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 6258819010991194496804243694964643762628146967093653443481808095071044000) [(12, 1), (13, 1), (15, 1)],
  term ((-5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 12517638021982388993608487389929287525256293934187306886963616190142088000) [(12, 1), (13, 2)],
  term ((5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 6258819010991194496804243694964643762628146967093653443481808095071044000) [(12, 2), (14, 1)],
  term ((-5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 12517638021982388993608487389929287525256293934187306886963616190142088000) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0273_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0273
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0274 : Poly :=
[
  term ((-699908628349828955741474436369573416909472130915552502162967371551 : Rat) / 533424367903467534570840771327418507720132085893989187976776488) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 274 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0274 : Poly :=
[
  term ((-699908628349828955741474436369573416909472130915552502162967371551 : Rat) / 266712183951733767285420385663709253860066042946994593988388244) [(12, 1), (13, 2), (15, 2)],
  term ((699908628349828955741474436369573416909472130915552502162967371551 : Rat) / 533424367903467534570840771327418507720132085893989187976776488) [(12, 1), (13, 3), (15, 1)],
  term ((-699908628349828955741474436369573416909472130915552502162967371551 : Rat) / 266712183951733767285420385663709253860066042946994593988388244) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((699908628349828955741474436369573416909472130915552502162967371551 : Rat) / 533424367903467534570840771327418507720132085893989187976776488) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0274_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0274
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0275 : Poly :=
[
  term ((-51434039142142354538590 : Rat) / 2603554958794438992693) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0275 : Poly :=
[
  term ((-102868078284284709077180 : Rat) / 2603554958794438992693) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((51434039142142354538590 : Rat) / 2603554958794438992693) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-102868078284284709077180 : Rat) / 2603554958794438992693) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((51434039142142354538590 : Rat) / 2603554958794438992693) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0275_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0275
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0276 : Poly :=
[
  term ((339465004796066631860653065022569058688350448894095372437051680201353 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(12, 1), (15, 2)]
]

/-- Partial product 276 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0276 : Poly :=
[
  term ((339465004796066631860653065022569058688350448894095372437051680201353 : Rat) / 172754771967352419901026613532194586252312258438390081107434772632) [(12, 1), (13, 1), (15, 3)],
  term ((-339465004796066631860653065022569058688350448894095372437051680201353 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(12, 1), (13, 2), (15, 2)],
  term ((339465004796066631860653065022569058688350448894095372437051680201353 : Rat) / 172754771967352419901026613532194586252312258438390081107434772632) [(12, 2), (14, 1), (15, 2)],
  term ((-339465004796066631860653065022569058688350448894095372437051680201353 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0276_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0276
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0277 : Poly :=
[
  term ((54485624304914022 : Rat) / 7342292683791569) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 277 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0277 : Poly :=
[
  term ((108971248609828044 : Rat) / 7342292683791569) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-54485624304914022 : Rat) / 7342292683791569) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((108971248609828044 : Rat) / 7342292683791569) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-54485624304914022 : Rat) / 7342292683791569) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0277_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0277
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0278 : Poly :=
[
  term ((237384941890460369017 : Rat) / 32049107564750198685) [(12, 1), (16, 1)]
]

/-- Partial product 278 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0278 : Poly :=
[
  term ((474769883780920738034 : Rat) / 32049107564750198685) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-237384941890460369017 : Rat) / 32049107564750198685) [(12, 1), (13, 2), (16, 1)],
  term ((474769883780920738034 : Rat) / 32049107564750198685) [(12, 2), (14, 1), (16, 1)],
  term ((-237384941890460369017 : Rat) / 32049107564750198685) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0278_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0278
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0279 : Poly :=
[
  term ((-75263769578977909639533831088201881214452555940066106238392718180632297555497812113 : Rat) / 48234056867865662530970264992673410512047259187300378867470126523910511900091200) [(13, 1), (15, 1)]
]

/-- Partial product 279 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0279 : Poly :=
[
  term ((-75263769578977909639533831088201881214452555940066106238392718180632297555497812113 : Rat) / 24117028433932831265485132496336705256023629593650189433735063261955255950045600) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((75263769578977909639533831088201881214452555940066106238392718180632297555497812113 : Rat) / 48234056867865662530970264992673410512047259187300378867470126523910511900091200) [(12, 2), (13, 1), (15, 1)],
  term ((-75263769578977909639533831088201881214452555940066106238392718180632297555497812113 : Rat) / 24117028433932831265485132496336705256023629593650189433735063261955255950045600) [(13, 2), (15, 2)],
  term ((75263769578977909639533831088201881214452555940066106238392718180632297555497812113 : Rat) / 48234056867865662530970264992673410512047259187300378867470126523910511900091200) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0279_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0279
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0280 : Poly :=
[
  term ((-3939770321507344450339016 : Rat) / 108233499001311678124809) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0280 : Poly :=
[
  term ((-7879540643014688900678032 : Rat) / 108233499001311678124809) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3939770321507344450339016 : Rat) / 108233499001311678124809) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7879540643014688900678032 : Rat) / 108233499001311678124809) [(13, 2), (15, 2), (16, 1)],
  term ((3939770321507344450339016 : Rat) / 108233499001311678124809) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0280_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0280
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0281 : Poly :=
[
  term ((257159257007732820132231849747927594981415889664652563350392780103 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(13, 2)]
]

/-- Partial product 281 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0281 : Poly :=
[
  term ((257159257007732820132231849747927594981415889664652563350392780103 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(12, 1), (13, 2), (14, 1)],
  term ((-257159257007732820132231849747927594981415889664652563350392780103 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(12, 2), (13, 2)],
  term ((257159257007732820132231849747927594981415889664652563350392780103 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(13, 3), (15, 1)],
  term ((-257159257007732820132231849747927594981415889664652563350392780103 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0281_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0281
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0282 : Poly :=
[
  term ((9749493969289055630359 : Rat) / 13017774793972194963465) [(13, 2), (16, 1)]
]

/-- Partial product 282 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0282 : Poly :=
[
  term ((19498987938578111260718 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9749493969289055630359 : Rat) / 13017774793972194963465) [(12, 2), (13, 2), (16, 1)],
  term ((19498987938578111260718 : Rat) / 13017774793972194963465) [(13, 3), (15, 1), (16, 1)],
  term ((-9749493969289055630359 : Rat) / 13017774793972194963465) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0282_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0282
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0283 : Poly :=
[
  term ((280975892583722544855621183224473392685882835853201059580038426006819285296596264917 : Rat) / 300792082143704937026355403396810217416645104839796523348016736696371697912480000) [(15, 2)]
]

/-- Partial product 283 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0283 : Poly :=
[
  term ((280975892583722544855621183224473392685882835853201059580038426006819285296596264917 : Rat) / 150396041071852468513177701698405108708322552419898261674008368348185848956240000) [(12, 1), (14, 1), (15, 2)],
  term ((-280975892583722544855621183224473392685882835853201059580038426006819285296596264917 : Rat) / 300792082143704937026355403396810217416645104839796523348016736696371697912480000) [(12, 2), (15, 2)],
  term ((280975892583722544855621183224473392685882835853201059580038426006819285296596264917 : Rat) / 150396041071852468513177701698405108708322552419898261674008368348185848956240000) [(13, 1), (15, 3)],
  term ((-280975892583722544855621183224473392685882835853201059580038426006819285296596264917 : Rat) / 300792082143704937026355403396810217416645104839796523348016736696371697912480000) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0283_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0283
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0284 : Poly :=
[
  term ((4821135904380579001392569 : Rat) / 168738551328409796076525) [(15, 2), (16, 1)]
]

/-- Partial product 284 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0284 : Poly :=
[
  term ((9642271808761158002785138 : Rat) / 168738551328409796076525) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4821135904380579001392569 : Rat) / 168738551328409796076525) [(12, 2), (15, 2), (16, 1)],
  term ((9642271808761158002785138 : Rat) / 168738551328409796076525) [(13, 1), (15, 3), (16, 1)],
  term ((-4821135904380579001392569 : Rat) / 168738551328409796076525) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0284_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0284
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0285 : Poly :=
[
  term ((-145873980819114582099647 : Rat) / 32140676443506627824100) [(16, 1)]
]

/-- Partial product 285 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0285 : Poly :=
[
  term ((-145873980819114582099647 : Rat) / 16070338221753313912050) [(12, 1), (14, 1), (16, 1)],
  term ((145873980819114582099647 : Rat) / 32140676443506627824100) [(12, 2), (16, 1)],
  term ((-145873980819114582099647 : Rat) / 16070338221753313912050) [(13, 1), (15, 1), (16, 1)],
  term ((145873980819114582099647 : Rat) / 32140676443506627824100) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0285_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0285
        rs_R009_ueqv_R009NYNYN_generator_30_0200_0285 =
      rs_R009_ueqv_R009NYNYN_partial_30_0285 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_30_0200_0285 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_30_0200,
  rs_R009_ueqv_R009NYNYN_partial_30_0201,
  rs_R009_ueqv_R009NYNYN_partial_30_0202,
  rs_R009_ueqv_R009NYNYN_partial_30_0203,
  rs_R009_ueqv_R009NYNYN_partial_30_0204,
  rs_R009_ueqv_R009NYNYN_partial_30_0205,
  rs_R009_ueqv_R009NYNYN_partial_30_0206,
  rs_R009_ueqv_R009NYNYN_partial_30_0207,
  rs_R009_ueqv_R009NYNYN_partial_30_0208,
  rs_R009_ueqv_R009NYNYN_partial_30_0209,
  rs_R009_ueqv_R009NYNYN_partial_30_0210,
  rs_R009_ueqv_R009NYNYN_partial_30_0211,
  rs_R009_ueqv_R009NYNYN_partial_30_0212,
  rs_R009_ueqv_R009NYNYN_partial_30_0213,
  rs_R009_ueqv_R009NYNYN_partial_30_0214,
  rs_R009_ueqv_R009NYNYN_partial_30_0215,
  rs_R009_ueqv_R009NYNYN_partial_30_0216,
  rs_R009_ueqv_R009NYNYN_partial_30_0217,
  rs_R009_ueqv_R009NYNYN_partial_30_0218,
  rs_R009_ueqv_R009NYNYN_partial_30_0219,
  rs_R009_ueqv_R009NYNYN_partial_30_0220,
  rs_R009_ueqv_R009NYNYN_partial_30_0221,
  rs_R009_ueqv_R009NYNYN_partial_30_0222,
  rs_R009_ueqv_R009NYNYN_partial_30_0223,
  rs_R009_ueqv_R009NYNYN_partial_30_0224,
  rs_R009_ueqv_R009NYNYN_partial_30_0225,
  rs_R009_ueqv_R009NYNYN_partial_30_0226,
  rs_R009_ueqv_R009NYNYN_partial_30_0227,
  rs_R009_ueqv_R009NYNYN_partial_30_0228,
  rs_R009_ueqv_R009NYNYN_partial_30_0229,
  rs_R009_ueqv_R009NYNYN_partial_30_0230,
  rs_R009_ueqv_R009NYNYN_partial_30_0231,
  rs_R009_ueqv_R009NYNYN_partial_30_0232,
  rs_R009_ueqv_R009NYNYN_partial_30_0233,
  rs_R009_ueqv_R009NYNYN_partial_30_0234,
  rs_R009_ueqv_R009NYNYN_partial_30_0235,
  rs_R009_ueqv_R009NYNYN_partial_30_0236,
  rs_R009_ueqv_R009NYNYN_partial_30_0237,
  rs_R009_ueqv_R009NYNYN_partial_30_0238,
  rs_R009_ueqv_R009NYNYN_partial_30_0239,
  rs_R009_ueqv_R009NYNYN_partial_30_0240,
  rs_R009_ueqv_R009NYNYN_partial_30_0241,
  rs_R009_ueqv_R009NYNYN_partial_30_0242,
  rs_R009_ueqv_R009NYNYN_partial_30_0243,
  rs_R009_ueqv_R009NYNYN_partial_30_0244,
  rs_R009_ueqv_R009NYNYN_partial_30_0245,
  rs_R009_ueqv_R009NYNYN_partial_30_0246,
  rs_R009_ueqv_R009NYNYN_partial_30_0247,
  rs_R009_ueqv_R009NYNYN_partial_30_0248,
  rs_R009_ueqv_R009NYNYN_partial_30_0249,
  rs_R009_ueqv_R009NYNYN_partial_30_0250,
  rs_R009_ueqv_R009NYNYN_partial_30_0251,
  rs_R009_ueqv_R009NYNYN_partial_30_0252,
  rs_R009_ueqv_R009NYNYN_partial_30_0253,
  rs_R009_ueqv_R009NYNYN_partial_30_0254,
  rs_R009_ueqv_R009NYNYN_partial_30_0255,
  rs_R009_ueqv_R009NYNYN_partial_30_0256,
  rs_R009_ueqv_R009NYNYN_partial_30_0257,
  rs_R009_ueqv_R009NYNYN_partial_30_0258,
  rs_R009_ueqv_R009NYNYN_partial_30_0259,
  rs_R009_ueqv_R009NYNYN_partial_30_0260,
  rs_R009_ueqv_R009NYNYN_partial_30_0261,
  rs_R009_ueqv_R009NYNYN_partial_30_0262,
  rs_R009_ueqv_R009NYNYN_partial_30_0263,
  rs_R009_ueqv_R009NYNYN_partial_30_0264,
  rs_R009_ueqv_R009NYNYN_partial_30_0265,
  rs_R009_ueqv_R009NYNYN_partial_30_0266,
  rs_R009_ueqv_R009NYNYN_partial_30_0267,
  rs_R009_ueqv_R009NYNYN_partial_30_0268,
  rs_R009_ueqv_R009NYNYN_partial_30_0269,
  rs_R009_ueqv_R009NYNYN_partial_30_0270,
  rs_R009_ueqv_R009NYNYN_partial_30_0271,
  rs_R009_ueqv_R009NYNYN_partial_30_0272,
  rs_R009_ueqv_R009NYNYN_partial_30_0273,
  rs_R009_ueqv_R009NYNYN_partial_30_0274,
  rs_R009_ueqv_R009NYNYN_partial_30_0275,
  rs_R009_ueqv_R009NYNYN_partial_30_0276,
  rs_R009_ueqv_R009NYNYN_partial_30_0277,
  rs_R009_ueqv_R009NYNYN_partial_30_0278,
  rs_R009_ueqv_R009NYNYN_partial_30_0279,
  rs_R009_ueqv_R009NYNYN_partial_30_0280,
  rs_R009_ueqv_R009NYNYN_partial_30_0281,
  rs_R009_ueqv_R009NYNYN_partial_30_0282,
  rs_R009_ueqv_R009NYNYN_partial_30_0283,
  rs_R009_ueqv_R009NYNYN_partial_30_0284,
  rs_R009_ueqv_R009NYNYN_partial_30_0285
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_30_0200_0285 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-942980811549215442906411730769140937020331 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1203231785121769566762 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((942980811549215442906411730769140937020331 : Rat) / 52756233300863930890950490901821065714000) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-601615892560884783381 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-942980811549215442906411730769140937020331 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((1203231785121769566762 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((942980811549215442906411730769140937020331 : Rat) / 52756233300863930890950490901821065714000) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-693355382894932025071 : Rat) / 265668873346371325785) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (13, 3), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (12, 2)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (13, 2)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-807134216912409509172234633540506073769234145720470 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((403567108456204754586117316770253036884617072860235 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 2)],
  term ((-807134216912409509172234633540506073769234145720470 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((403567108456204754586117316770253036884617072860235 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (13, 2)],
  term ((57287068054364091362126311642454669313478862545456601041473320576 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-220316310852082072304436757577228703512883471252038252780460294800496380401 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-34433074432645959864 : Rat) / 17287881532499594905) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28643534027182045681063155821227334656739431272728300520736660288 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((220316310852082072304436757577228703512883471252038252780460294800496380401 : Rat) / 1961589846315780509757129524895862309879948727683124239972069054742327250) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((17216537216322979932 : Rat) / 17287881532499594905) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-220316310852082072304436757577228703512883471252038252780460294800496380401 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-34433074432645959864 : Rat) / 17287881532499594905) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((45147777616893850093116724916810637519137777053045220100717700170643031855681 : Rat) / 158888777551578221290327491516564847100275846942333063437737593434128507250) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((35359970365836303426844 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28643534027182045681063155821227334656739431272728300520736660288 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (13, 3)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((36893537042736859253120600290614713558808991083998782427641765064 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-18446768521368429626560300145307356779404495541999391213820882532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (12, 2)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((36893537042736859253120600290614713558808991083998782427641765064 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18446768521368429626560300145307356779404495541999391213820882532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (13, 2)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((72330256375033410683794318339243812479651788744791789242442450697 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5375797777405329989362 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((46308063012147112018361414502876289289297389750352 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-23154031506073556009180707251438144644648694875176 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 1), (13, 2)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-15819127922296789267682991608600391314488419634045188564674467278659 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3551287358282598 : Rat) / 7342292683791569) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-885272285358968285437319 : Rat) / 48211014665259941736150) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72330256375033410683794318339243812479651788744791789242442450697 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2687898888702664994681 : Rat) / 4339258264657398321155) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (12, 2), (13, 2)],
  term ((46308063012147112018361414502876289289297389750352 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 2), (14, 1)],
  term ((15819127922296789267682991608600391314488419634045188564674467278659 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (12, 2), (15, 2)],
  term ((1775643679141299 : Rat) / 7342292683791569) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((885272285358968285437319 : Rat) / 96422029330519883472300) [(8, 1), (12, 2), (16, 1)],
  term ((-23154031506073556009180707251438144644648694875176 : Rat) / 1354520779047503116208002444856180344466756464819) [(8, 1), (12, 3)],
  term ((-885272285358968285437319 : Rat) / 48211014665259941736150) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15819127922296789267682991608600391314488419634045188564674467278659 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (13, 1), (15, 3)],
  term ((-3551287358282598 : Rat) / 7342292683791569) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((5085628479883794864257649422622021253591499901272113909296935922184388783477 : Rat) / 33896272544336687208603198190200500714725514014364386866717353265947414880) [(8, 1), (13, 2), (15, 2)],
  term ((6425194313559441991867 : Rat) / 4339258264657398321155) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((885272285358968285437319 : Rat) / 96422029330519883472300) [(8, 1), (13, 2), (16, 1)],
  term ((-67337639870251228727865194130150766271701184553504937666577690377 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(8, 1), (13, 3), (15, 1)],
  term ((-2687898888702664994681 : Rat) / 4339258264657398321155) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 4)],
  term ((13877659771712009071690341586009187175492247782989745359638990904 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2329340155522306108736 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6938829885856004535845170793004593587746123891494872679819495452 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((1164670077761153054368 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((13877659771712009071690341586009187175492247782989745359638990904 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2329340155522306108736 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6938829885856004535845170793004593587746123891494872679819495452 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((1164670077761153054368 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((250148007047313924191962073189963332754353 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((41306529218573928270928 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((21320208101521224265926982426823843629910084634535025028252399431411249479357 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((560629446592839740688 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-250148007047313924191962073189963332754353 : Rat) / 2374030498538876890092772090581947957130) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-20653264609286964135464 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21320208101521224265926982426823843629910084634535025028252399431411249479357 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-280314723296419870344 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 3), (15, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((21320208101521224265926982426823843629910084634535025028252399431411249479357 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((560629446592839740688 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3006857488401021044875828431455277572813551409418456566795548790049970476829 : Rat) / 317777555103156442580654983033129694200551693884666126875475186868257014500) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((35419920029349110993704 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-250148007047313924191962073189963332754353 : Rat) / 2374030498538876890092772090581947957130) [(9, 1), (10, 1), (13, 3)],
  term ((-20653264609286964135464 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2778689497150949281896 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 1), (11, 1), (12, 2)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1389344748575474640948 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 3)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((-19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2778689497150949281896 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19436331561596237653029837862405995715813922272330992670336134173687 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 1), (11, 1), (13, 2)],
  term ((1389344748575474640948 : Rat) / 88556291115457108595) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1477316781310803480742726969561761864524118607805691405878910902280438898142997359 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((11051558667072872659789021 : Rat) / 757634493009181746873663) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((649161435282250106588526245175299812376124804135173309894241829860898817158 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-211739361696902331276 : Rat) / 17711258223091421719) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((581506910720148388626045546988016392553052345533413512374840227304663576653 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((155810167177924051786802 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 4748060997077753780185544181163895914260) [(9, 1), (12, 1), (13, 3)],
  term ((-38997975877156222521436 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((1764527790123293332381623633241430131896270689432270302179027882032087496054461013737 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((50862873624354307557097652 : Rat) / 1262724155015302911456105) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1477316781310803480742726969561761864524118607805691405878910902280438898142997359 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (12, 2), (13, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11051558667072872659789021 : Rat) / 1515268986018363493747326) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((649161435282250106588526245175299812376124804135173309894241829860898817158 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-211739361696902331276 : Rat) / 17711258223091421719) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1764527790123293332381623633241430131896270689432270302179027882032087496054461013737 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (12, 2), (15, 1)],
  term ((-25431436812177153778548826 : Rat) / 1262724155015302911456105) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 4748060997077753780185544181163895914260) [(9, 1), (12, 3), (13, 1)],
  term ((-38997975877156222521436 : Rat) / 13017774793972194963465) [(9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-324580717641125053294263122587649906188062402067586654947120914930449408579 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(9, 1), (12, 3), (15, 1)],
  term ((105869680848451165638 : Rat) / 17711258223091421719) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((1764527790123293332381623633241430131896270689432270302179027882032087496054461013737 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(9, 1), (13, 1), (15, 2)],
  term ((50862873624354307557097652 : Rat) / 1262724155015302911456105) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2412100960947270958409192973509859489668990590017675466527315620198506804550491183333 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (13, 2), (15, 1)],
  term ((-21036517101167098036701373 : Rat) / 3788172465045908734368315) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1477316781310803480742726969561761864524118607805691405878910902280438898142997359 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (13, 3)],
  term ((-11051558667072872659789021 : Rat) / 1515268986018363493747326) [(9, 1), (13, 3), (16, 1)],
  term ((-905708930508086124635904967269532695242383 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((3081795542839904992176 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((905708930508086124635904967269532695242383 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (10, 1), (12, 2)],
  term ((-1540897771419952496088 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-905708930508086124635904967269532695242383 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((3081795542839904992176 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((905708930508086124635904967269532695242383 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (10, 1), (13, 2)],
  term ((-1540897771419952496088 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (12, 1), (13, 2)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 2), (16, 1)],
  term ((-962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 2), (12, 1), (14, 1)],
  term ((-9789524612843978156027693 : Rat) / 3788172465045908734368315) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 2), (12, 2)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(9, 2), (12, 2), (14, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((9789524612843978156027693 : Rat) / 7576344930091817468736630) [(9, 2), (12, 2), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (12, 3)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (12, 3), (16, 1)],
  term ((-962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 2), (13, 1), (15, 1)],
  term ((-9789524612843978156027693 : Rat) / 3788172465045908734368315) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((962013185613330236799174698276511606421728146511386211065758068510372552585395767 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 2), (13, 2)],
  term ((9789524612843978156027693 : Rat) / 7576344930091817468736630) [(9, 2), (13, 2), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((17989140175606950209326667020678194690201321573235370832129594224 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-485742157481972479616 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8994570087803475104663333510339097345100660786617685416064797112 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((242871078740986239808 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((17989140175606950209326667020678194690201321573235370832129594224 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-485742157481972479616 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8127796389056568515092305001815999045109236447852607017477165112 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((242871078740986239808 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (13, 3)],
  term ((-151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2), (12, 2)],
  term ((-151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2), (13, 2)],
  term ((52163885272364785162763264909915469299218 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((8613736629729472651168 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 782352376373899312100530461870580470328518370886706680435226011883880500) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((669389639583704564032 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(10, 1), (12, 1), (13, 2)],
  term ((-1251434127900836305796836115684884489363177794597819016479467790523654713617 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-62194654952936167141496 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 1), (13, 3), (15, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 10014110417585911194886789911943430020205035147349845509570892952113670400) [(10, 1), (12, 1), (14, 1)],
  term ((-74687833214381782263871774479344484478495587599742512897462491373 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3955792765120416 : Rat) / 7342292683791569) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24033058611328340362 : Rat) / 6409821512950039737) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 20028220835171822389773579823886860040410070294699691019141785904227340800) [(10, 1), (12, 2)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26081942636182392581381632454957734649609 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4306868314864736325584 : Rat) / 13017774793972194963465) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 782352376373899312100530461870580470328518370886706680435226011883880500) [(10, 1), (12, 2), (14, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((669389639583704564032 : Rat) / 32049107564750198685) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((74687833214381782263871774479344484478495587599742512897462491373 : Rat) / 4798743665759789441695183709227627395897562734399724475206521462) [(10, 1), (12, 2), (15, 2)],
  term ((1977896382560208 : Rat) / 7342292683791569) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((12016529305664170181 : Rat) / 6409821512950039737) [(10, 1), (12, 2), (16, 1)],
  term ((-909652435045815666803899713330674128907037263945211802069045401239330104099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(10, 1), (12, 3)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 3), (13, 1), (15, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 3), (15, 2)],
  term ((850425755199768 : Rat) / 7342292683791569) [(10, 1), (12, 3), (15, 2), (16, 1)],
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(10, 1), (12, 3), (16, 1)],
  term ((-2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 10014110417585911194886789911943430020205035147349845509570892952113670400) [(10, 1), (13, 1), (15, 1)],
  term ((-24033058611328340362 : Rat) / 6409821512950039737) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74687833214381782263871774479344484478495587599742512897462491373 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(10, 1), (13, 1), (15, 3)],
  term ((-3955792765120416 : Rat) / 7342292683791569) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2788416044507925641831413840528867682247189422328770571273800760812443740799 : Rat) / 20028220835171822389773579823886860040410070294699691019141785904227340800) [(10, 1), (13, 2)],
  term ((378215415816123422117693659741462656335543467257443668098838277736602922923 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (13, 2), (15, 2)],
  term ((12120517247562983032048 : Rat) / 13017774793972194963465) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((12016529305664170181 : Rat) / 6409821512950039737) [(10, 1), (13, 2), (16, 1)],
  term ((-26081942636182392581381632454957734649609 : Rat) / 1187015249269438445046386045290973978565) [(10, 1), (13, 3), (15, 1)],
  term ((-4306868314864736325584 : Rat) / 13017774793972194963465) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(10, 2), (12, 1), (14, 1)],
  term ((773814423358762476020992 : Rat) / 24105507332629970868075) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(10, 2), (12, 2)],
  term ((-386907211679381238010496 : Rat) / 24105507332629970868075) [(10, 2), (12, 2), (16, 1)],
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(10, 2), (13, 1), (15, 1)],
  term ((773814423358762476020992 : Rat) / 24105507332629970868075) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(10, 2), (13, 2)],
  term ((-386907211679381238010496 : Rat) / 24105507332629970868075) [(10, 2), (13, 2), (16, 1)],
  term ((-15573125057189338557159113572093229274776370894571930886993423236483 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11469401391164699054948 : Rat) / 1859682113424599280495) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((36190099064642070771821020766635787644398612577046165510104445482 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5800892740251125682160 : Rat) / 123978807561639952033) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18095049532321035385910510383317893822199306288523082755052222741 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2900446370125562841080 : Rat) / 123978807561639952033) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3662118553478658907024364531463507678229589627078620228444092644234326023920749477 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-77576212656348089356252568 : Rat) / 3788172465045908734368315) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15573125057189338557159113572093229274776370894571930886993423236483 : Rat) / 66678045987933441821355096415927313465016510736748648497097061000) [(11, 1), (12, 2), (13, 1)],
  term ((5734700695582349527474 : Rat) / 1859682113424599280495) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((36190099064642070771821020766635787644398612577046165510104445482 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((5800892740251125682160 : Rat) / 123978807561639952033) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3662118553478658907024364531463507678229589627078620228444092644234326023920749477 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 1), (12, 2), (15, 1)],
  term ((38788106328174044678126284 : Rat) / 3788172465045908734368315) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-18095049532321035385910510383317893822199306288523082755052222741 : Rat) / 12347786294061748485436128965912465456484539025323823795758715) [(11, 1), (12, 3), (15, 1)],
  term ((-2900446370125562841080 : Rat) / 123978807561639952033) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-3662118553478658907024364531463507678229589627078620228444092644234326023920749477 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(11, 1), (13, 1), (15, 2)],
  term ((-77576212656348089356252568 : Rat) / 3788172465045908734368315) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((897602699531037138578779482915457543560727909952289457353388672087443341991020389 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 1), (13, 2), (15, 1)],
  term ((15424935694371552703197208 : Rat) / 3788172465045908734368315) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((15573125057189338557159113572093229274776370894571930886993423236483 : Rat) / 66678045987933441821355096415927313465016510736748648497097061000) [(11, 1), (13, 3)],
  term ((5734700695582349527474 : Rat) / 1859682113424599280495) [(11, 1), (13, 3), (16, 1)],
  term ((15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 7159878806424596073889120725438286785736444977589782984967921557774405820156875) [(11, 2), (12, 1), (14, 1)],
  term ((106288667810119900923256187408 : Rat) / 2849246861209529926635596925) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 14319757612849192147778241450876573571472889955179565969935843115548811640313750) [(11, 2), (12, 2)],
  term ((-53144333905059950461628093704 : Rat) / 2849246861209529926635596925) [(11, 2), (12, 2), (16, 1)],
  term ((15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 7159878806424596073889120725438286785736444977589782984967921557774405820156875) [(11, 2), (13, 1), (15, 1)],
  term ((106288667810119900923256187408 : Rat) / 2849246861209529926635596925) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15323706383011056680736065722729357707655948629170292779687312042362552550265236419 : Rat) / 14319757612849192147778241450876573571472889955179565969935843115548811640313750) [(11, 2), (13, 2)],
  term ((-53144333905059950461628093704 : Rat) / 2849246861209529926635596925) [(11, 2), (13, 2), (16, 1)],
  term ((-75263769578977909639533831088201881214452555940066106238392718180632297555497812113 : Rat) / 24117028433932831265485132496336705256023629593650189433735063261955255950045600) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7879540643014688900678032 : Rat) / 108233499001311678124809) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 6258819010991194496804243694964643762628146967093653443481808095071044000) [(12, 1), (13, 1), (15, 1)],
  term ((474769883780920738034 : Rat) / 32049107564750198685) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((339465004796066631860653065022569058688350448894095372437051680201353 : Rat) / 172754771967352419901026613532194586252312258438390081107434772632) [(12, 1), (13, 1), (15, 3)],
  term ((108971248609828044 : Rat) / 7342292683791569) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 12517638021982388993608487389929287525256293934187306886963616190142088000) [(12, 1), (13, 2)],
  term ((257159257007732820132231849747927594981415889664652563350392780103 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(12, 1), (13, 2), (14, 1)],
  term ((19498987938578111260718 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-36676257022052604637581862174699310309882910748107217833264792506401067679059 : Rat) / 10168881763301006162580959457060150214417654204309316060015205979784224464) [(12, 1), (13, 2), (15, 2)],
  term ((-122188517205934306536314 : Rat) / 2603554958794438992693) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-237384941890460369017 : Rat) / 32049107564750198685) [(12, 1), (13, 2), (16, 1)],
  term ((699908628349828955741474436369573416909472130915552502162967371551 : Rat) / 533424367903467534570840771327418507720132085893989187976776488) [(12, 1), (13, 3), (15, 1)],
  term ((51434039142142354538590 : Rat) / 2603554958794438992693) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((280975892583722544855621183224473392685882835853201059580038426006819285296596264917 : Rat) / 150396041071852468513177701698405108708322552419898261674008368348185848956240000) [(12, 1), (14, 1), (15, 2)],
  term ((9642271808761158002785138 : Rat) / 168738551328409796076525) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-145873980819114582099647 : Rat) / 16070338221753313912050) [(12, 1), (14, 1), (16, 1)],
  term ((-699908628349828955741474436369573416909472130915552502162967371551 : Rat) / 266712183951733767285420385663709253860066042946994593988388244) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-102868078284284709077180 : Rat) / 2603554958794438992693) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((75263769578977909639533831088201881214452555940066106238392718180632297555497812113 : Rat) / 48234056867865662530970264992673410512047259187300378867470126523910511900091200) [(12, 2), (13, 1), (15, 1)],
  term ((3939770321507344450339016 : Rat) / 108233499001311678124809) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-257159257007732820132231849747927594981415889664652563350392780103 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(12, 2), (13, 2)],
  term ((-9749493969289055630359 : Rat) / 13017774793972194963465) [(12, 2), (13, 2), (16, 1)],
  term ((5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 6258819010991194496804243694964643762628146967093653443481808095071044000) [(12, 2), (14, 1)],
  term ((339465004796066631860653065022569058688350448894095372437051680201353 : Rat) / 172754771967352419901026613532194586252312258438390081107434772632) [(12, 2), (14, 1), (15, 2)],
  term ((108971248609828044 : Rat) / 7342292683791569) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((474769883780920738034 : Rat) / 32049107564750198685) [(12, 2), (14, 1), (16, 1)],
  term ((-280975892583722544855621183224473392685882835853201059580038426006819285296596264917 : Rat) / 300792082143704937026355403396810217416645104839796523348016736696371697912480000) [(12, 2), (15, 2)],
  term ((-4821135904380579001392569 : Rat) / 168738551328409796076525) [(12, 2), (15, 2), (16, 1)],
  term ((145873980819114582099647 : Rat) / 32140676443506627824100) [(12, 2), (16, 1)],
  term ((-5396420910831967195770883946438004373212003725740274972712178007163200082289 : Rat) / 12517638021982388993608487389929287525256293934187306886963616190142088000) [(12, 3)],
  term ((699908628349828955741474436369573416909472130915552502162967371551 : Rat) / 533424367903467534570840771327418507720132085893989187976776488) [(12, 3), (13, 1), (15, 1)],
  term ((51434039142142354538590 : Rat) / 2603554958794438992693) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-339465004796066631860653065022569058688350448894095372437051680201353 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(12, 3), (15, 2)],
  term ((-54485624304914022 : Rat) / 7342292683791569) [(12, 3), (15, 2), (16, 1)],
  term ((-237384941890460369017 : Rat) / 32049107564750198685) [(12, 3), (16, 1)],
  term ((-145873980819114582099647 : Rat) / 16070338221753313912050) [(13, 1), (15, 1), (16, 1)],
  term ((280975892583722544855621183224473392685882835853201059580038426006819285296596264917 : Rat) / 150396041071852468513177701698405108708322552419898261674008368348185848956240000) [(13, 1), (15, 3)],
  term ((9642271808761158002785138 : Rat) / 168738551328409796076525) [(13, 1), (15, 3), (16, 1)],
  term ((-1486236274647759334742168474496667462148707456513999648019994918118228512980280995194939 : Rat) / 366529106363956493315238993052572895757010667494423806837239487224478745583064160000) [(13, 2), (15, 2)],
  term ((-20843874172715586129464377423 : Rat) / 205615752870790819447929675) [(13, 2), (15, 2), (16, 1)],
  term ((145873980819114582099647 : Rat) / 32140676443506627824100) [(13, 2), (16, 1)],
  term ((79914413596370739695788628258466695147485344155174863939146323957240794046527360553 : Rat) / 48234056867865662530970264992673410512047259187300378867470126523910511900091200) [(13, 3), (15, 1)],
  term ((143566166742883286138734498 : Rat) / 3788172465045908734368315) [(13, 3), (15, 1), (16, 1)],
  term ((-257159257007732820132231849747927594981415889664652563350392780103 : Rat) / 5334243679034675345708407713274185077201320858939891879767764880) [(13, 4)],
  term ((-9749493969289055630359 : Rat) / 13017774793972194963465) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 200 through 285. -/
theorem rs_R009_ueqv_R009NYNYN_block_30_0200_0285_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_30_0200_0285
      rs_R009_ueqv_R009NYNYN_block_30_0200_0285 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
