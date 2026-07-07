/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0300 : Poly :=
[
  term ((83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 300 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0300 : Poly :=
[
  term ((166105042348380797208 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0300_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0300
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0301 : Poly :=
[
  term ((2685375784722532480004470702460746465115438525292 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (11, 1), (14, 1)]
]

/-- Partial product 301 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0301 : Poly :=
[
  term ((-2685375784722532480004470702460746465115438525292 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((5370751569445064960008941404921492930230877050584 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0301_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0301
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0302 : Poly :=
[
  term ((86081215757259356093 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 302 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0302 : Poly :=
[
  term ((-86081215757259356093 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((86081215757259356093 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0302_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0302
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0303 : Poly :=
[
  term ((-438190776482523931921 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 303 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0303 : Poly :=
[
  term ((-438190776482523931921 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((438190776482523931921 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0303_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0303
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0304 : Poly :=
[
  term ((956538730833695909509017008155028151627116532398480 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 304 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0304 : Poly :=
[
  term ((-956538730833695909509017008155028151627116532398480 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (12, 1), (13, 1)],
  term ((1913077461667391819018034016310056303254233064796960 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0304_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0304
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0305 : Poly :=
[
  term ((-530083913144919770100679848137709154414453951096 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 305 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0305 : Poly :=
[
  term ((530083913144919770100679848137709154414453951096 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0305_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0305
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0306 : Poly :=
[
  term ((-96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 306 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0306 : Poly :=
[
  term ((96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0306_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0306
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0307 : Poly :=
[
  term ((-2230363914499769613851 : Rat) / 743872845369839712198) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 307 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0307 : Poly :=
[
  term ((-2230363914499769613851 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2230363914499769613851 : Rat) / 743872845369839712198) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0307_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0307
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0308 : Poly :=
[
  term ((51435002332639824713332420225407190806945341106260 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 308 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0308 : Poly :=
[
  term ((102870004665279649426664840450814381613890682212520 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-51435002332639824713332420225407190806945341106260 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0308_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0308
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0309 : Poly :=
[
  term ((14561667535337519552 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0309 : Poly :=
[
  term ((29123335070675039104 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14561667535337519552 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0309_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0309
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0310 : Poly :=
[
  term ((-23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 2), (13, 1)]
]

/-- Partial product 310 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0310 : Poly :=
[
  term ((23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((-47430290955821883443950536415557065042332868640960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0310_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0310
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0311 : Poly :=
[
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 311 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0311 : Poly :=
[
  term ((575229955739580881576 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0311_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0311
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0312 : Poly :=
[
  term ((252809319430620216960985999020958681938727981864 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (12, 2), (15, 1)]
]

/-- Partial product 312 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0312 : Poly :=
[
  term ((505618638861240433921971998041917363877455963728 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1)],
  term ((-252809319430620216960985999020958681938727981864 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0312_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0312
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0313 : Poly :=
[
  term ((7592599573464264628 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0313 : Poly :=
[
  term ((15185199146928529256 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7592599573464264628 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0313_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0313
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0314 : Poly :=
[
  term ((-24185376349720988808735314662246918383186690502085 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 314 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0314 : Poly :=
[
  term ((24185376349720988808735314662246918383186690502085 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (13, 1)],
  term ((-48370752699441977617470629324493836766373381004170 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0314_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0314
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0315 : Poly :=
[
  term ((-896369185593156322655846659591561431788959839080 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

/-- Partial product 315 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0315 : Poly :=
[
  term ((896369185593156322655846659591561431788959839080 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-1792738371186312645311693319183122863577919678160 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0315_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0315
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0316 : Poly :=
[
  term ((11602254242445340919 : Rat) / 26100801591924200428) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 316 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0316 : Poly :=
[
  term ((-11602254242445340919 : Rat) / 26100801591924200428) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((11602254242445340919 : Rat) / 13050400795962100214) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0316_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0316
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0317 : Poly :=
[
  term ((76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (13, 1), (15, 2)]
]

/-- Partial product 317 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0317 : Poly :=
[
  term ((152116002570732284800929127039973457803485419032068 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((-76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0317_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0317
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0318 : Poly :=
[
  term ((13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 318 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0318 : Poly :=
[
  term ((13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0318_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0318
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0319 : Poly :=
[
  term ((1764751130992843587233 : Rat) / 495915230246559808132) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 319 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0319 : Poly :=
[
  term ((1764751130992843587233 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1764751130992843587233 : Rat) / 495915230246559808132) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0319_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0319
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0320 : Poly :=
[
  term ((-410708229074336688692213041119774789624079481378828 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 2), (15, 1)]
]

/-- Partial product 320 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0320 : Poly :=
[
  term ((-821416458148673377384426082239549579248158962757656 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1)],
  term ((410708229074336688692213041119774789624079481378828 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0320_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0320
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0321 : Poly :=
[
  term ((-13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0321 : Poly :=
[
  term ((-26413491879896938850 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0321_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0321
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0322 : Poly :=
[
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 3)]
]

/-- Partial product 322 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0322 : Poly :=
[
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 3)],
  term ((-182559114551440662842297360000582335145507102869504 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0322_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0322
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0323 : Poly :=
[
  term ((9005731817854161813686799792141614475307417439284 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 323 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0323 : Poly :=
[
  term ((18011463635708323627373599584283228950614834878568 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-9005731817854161813686799792141614475307417439284 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0323_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0323
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0324 : Poly :=
[
  term ((24848364551812434694 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0324 : Poly :=
[
  term ((49696729103624869388 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24848364551812434694 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0324_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0324
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0325 : Poly :=
[
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 325 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0325 : Poly :=
[
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1)],
  term ((2933770076035833330282398496493012408945904855040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0325_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0325
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0326 : Poly :=
[
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 326 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0326 : Poly :=
[
  term ((88402926265569820256 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0326_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0326
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0327 : Poly :=
[
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 327 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0327 : Poly :=
[
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0327_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0327
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0328 : Poly :=
[
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0328 : Poly :=
[
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0328_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0328
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0329 : Poly :=
[
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (13, 1)]
]

/-- Partial product 329 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0329 : Poly :=
[
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((-2933770076035833330282398496493012408945904855040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0329_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0329
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0330 : Poly :=
[
  term ((267920196562264305996 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 330 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0330 : Poly :=
[
  term ((535840393124528611992 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-267920196562264305996 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0330_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0330
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0331 : Poly :=
[
  term ((183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (15, 1)]
]

/-- Partial product 331 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0331 : Poly :=
[
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (14, 1), (15, 1)],
  term ((-183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0331_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0331
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0332 : Poly :=
[
  term ((-150535646955926494296 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0332 : Poly :=
[
  term ((-301071293911852988592 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((150535646955926494296 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0332_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0332
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0333 : Poly :=
[
  term ((-27893816399541844559469542377288036383161600567216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (11, 1)]
]

/-- Partial product 333 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0333 : Poly :=
[
  term ((27893816399541844559469542377288036383161600567216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (11, 1)],
  term ((-55787632799083689118939084754576072766323201134432 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0333_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0333
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0334 : Poly :=
[
  term ((62289390880642798953 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (16, 1)]
]

/-- Partial product 334 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0334 : Poly :=
[
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((-62289390880642798953 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0334_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0334
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0335 : Poly :=
[
  term ((1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (13, 1)]
]

/-- Partial product 335 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0335 : Poly :=
[
  term ((-1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((2120335652579679080402719392550836617657815804384 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0335_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0335
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0336 : Poly :=
[
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 336 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0336 : Poly :=
[
  term ((384089174440954997768 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0336_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0336
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0337 : Poly :=
[
  term ((-530083913144919770100679848137709154414453951096 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (15, 1)]
]

/-- Partial product 337 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0337 : Poly :=
[
  term ((-1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1)],
  term ((530083913144919770100679848137709154414453951096 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0337_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0337
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0338 : Poly :=
[
  term ((-96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0338 : Poly :=
[
  term ((-192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0338_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0338
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0339 : Poly :=
[
  term ((2190104191988940590898640459732830815840178464788 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (2, 2), (13, 1)]
]

/-- Partial product 339 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0339 : Poly :=
[
  term ((-2190104191988940590898640459732830815840178464788 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (2, 2), (13, 1)],
  term ((4380208383977881181797280919465661631680356929576 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (2, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0339_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0339
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0340 : Poly :=
[
  term ((-508509711437177725787 : Rat) / 247957615123279904066) [(1, 1), (2, 2), (13, 1), (16, 1)]
]

/-- Partial product 340 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0340 : Poly :=
[
  term ((-508509711437177725787 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((508509711437177725787 : Rat) / 247957615123279904066) [(1, 1), (2, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0340_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0340
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0341 : Poly :=
[
  term ((-70803989005240267456040478381482652428053680562873 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (15, 1)]
]

/-- Partial product 341 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0341 : Poly :=
[
  term ((-141607978010480534912080956762965304856107361125746 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((70803989005240267456040478381482652428053680562873 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0341_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0341
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0342 : Poly :=
[
  term ((1854061799617206885 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0342 : Poly :=
[
  term ((3708123599234413770 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1854061799617206885 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0342_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0342
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0343 : Poly :=
[
  term ((-197215540272037744556430980352155358453600498808892 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1)]
]

/-- Partial product 343 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0343 : Poly :=
[
  term ((197215540272037744556430980352155358453600498808892 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1)],
  term ((-394431080544075489112861960704310716907200997617784 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0343_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0343
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0344 : Poly :=
[
  term ((-3131261118261230481432906519096944278479652939820 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 344 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0344 : Poly :=
[
  term ((3131261118261230481432906519096944278479652939820 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1)],
  term ((-6262522236522460962865813038193888556959305879640 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0344_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0344
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0345 : Poly :=
[
  term ((440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1)]
]

/-- Partial product 345 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0345 : Poly :=
[
  term ((-440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1)],
  term ((880978394474803589522623923612291898126028581440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0345_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0345
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0346 : Poly :=
[
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1)]
]

/-- Partial product 346 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0346 : Poly :=
[
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0346_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0346
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0347 : Poly :=
[
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 347 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0347 : Poly :=
[
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0347_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0347
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0348 : Poly :=
[
  term ((-366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1)]
]

/-- Partial product 348 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0348 : Poly :=
[
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0348_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0348
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0349 : Poly :=
[
  term ((-11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 349 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0349 : Poly :=
[
  term ((11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0349_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0349
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0350 : Poly :=
[
  term ((-40880684928629759962 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 350 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0350 : Poly :=
[
  term ((-81761369857259519924 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((40880684928629759962 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0350_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0350
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0351 : Poly :=
[
  term ((6189283906079571828413491122614611768665940398880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (12, 1)]
]

/-- Partial product 351 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0351 : Poly :=
[
  term ((-6189283906079571828413491122614611768665940398880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (12, 1)],
  term ((12378567812159143656826982245229223537331880797760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0351_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0351
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0352 : Poly :=
[
  term ((-64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 352 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0352 : Poly :=
[
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0352_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0352
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0353 : Poly :=
[
  term ((-98458160789863224220 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 353 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0353 : Poly :=
[
  term ((-196916321579726448440 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((98458160789863224220 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0353_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0353
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0354 : Poly :=
[
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 2), (16, 1)]
]

/-- Partial product 354 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0354 : Poly :=
[
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0354_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0354
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0355 : Poly :=
[
  term ((-3296444567225256154468398504774249009378283298840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

/-- Partial product 355 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0355 : Poly :=
[
  term ((3296444567225256154468398504774249009378283298840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((-6592889134450512308936797009548498018756566597680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0355_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0355
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0356 : Poly :=
[
  term ((185799823655906932 : Rat) / 623009083224321367) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 356 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0356 : Poly :=
[
  term ((-185799823655906932 : Rat) / 623009083224321367) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term ((371599647311813864 : Rat) / 623009083224321367) [(1, 1), (3, 1), (8, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0356_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0356
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0357 : Poly :=
[
  term ((5514948155549271435 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (8, 1), (16, 1)]
]

/-- Partial product 357 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0357 : Poly :=
[
  term ((11029896311098542870 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term ((-5514948155549271435 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0357_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0357
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0358 : Poly :=
[
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 358 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0358 : Poly :=
[
  term ((-293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)],
  term ((587318929649869059681749282408194598750685720960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0358_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0358
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0359 : Poly :=
[
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 359 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0359 : Poly :=
[
  term ((4944164798979218360 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0359_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0359
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0360 : Poly :=
[
  term ((-73414866206233632460218660301024324843835715120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 360 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0360 : Poly :=
[
  term ((73414866206233632460218660301024324843835715120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0360_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0360
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0361 : Poly :=
[
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 361 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0361 : Poly :=
[
  term ((146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0361_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0361
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0362 : Poly :=
[
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 362 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0362 : Poly :=
[
  term ((1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0362_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0362
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0363 : Poly :=
[
  term ((-618020599872402295 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 363 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0363 : Poly :=
[
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((618020599872402295 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0363_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0363
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0364 : Poly :=
[
  term ((-26930654978332524035306740025293047444967009831028 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 364 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0364 : Poly :=
[
  term ((26930654978332524035306740025293047444967009831028 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (10, 1)],
  term ((-53861309956665048070613480050586094889934019662056 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0364_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0364
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0365 : Poly :=
[
  term ((-817984160272213568933895445976892803531958760456 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (10, 1), (12, 1)]
]

/-- Partial product 365 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0365 : Poly :=
[
  term ((817984160272213568933895445976892803531958760456 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (10, 1), (12, 1)],
  term ((-1635968320544427137867790891953785607063917520912 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0365_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0365
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0366 : Poly :=
[
  term ((-8431335532450786476730114290765839543805445666560 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 366 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0366 : Poly :=
[
  term ((8431335532450786476730114290765839543805445666560 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1)],
  term ((-16862671064901572953460228581531679087610891333120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0366_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0366
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0367 : Poly :=
[
  term ((-191487187749509778088 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 367 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0367 : Poly :=
[
  term ((191487187749509778088 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-382974375499019556176 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0367_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0367
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0368 : Poly :=
[
  term ((-20101021599926338084 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 368 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0368 : Poly :=
[
  term ((-40202043199852676168 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((20101021599926338084 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0368_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0368
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0369 : Poly :=
[
  term ((36487550206202630302888603132004945286129588349120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2)]
]

/-- Partial product 369 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0369 : Poly :=
[
  term ((-36487550206202630302888603132004945286129588349120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2)],
  term ((72975100412405260605777206264009890572259176698240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0369_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0369
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0370 : Poly :=
[
  term ((7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 1)]
]

/-- Partial product 370 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0370 : Poly :=
[
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0370_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0370
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0371 : Poly :=
[
  term ((195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 371 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0371 : Poly :=
[
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0371_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0371
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0372 : Poly :=
[
  term ((870998081803356797736 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)]
]

/-- Partial product 372 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0372 : Poly :=
[
  term ((1741996163606713595472 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-870998081803356797736 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0372_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0372
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0373 : Poly :=
[
  term ((-15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 3)]
]

/-- Partial product 373 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0373 : Poly :=
[
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 3)],
  term ((-31399806626081691759085399280757225917629915225600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0373_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0373
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0374 : Poly :=
[
  term ((-390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 3), (16, 1)]
]

/-- Partial product 374 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0374 : Poly :=
[
  term ((-780837930086939586496 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 3), (14, 1), (16, 1)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0374_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0374
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0375 : Poly :=
[
  term ((2853085421137949669381713232249513121814252728812 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (14, 1)]
]

/-- Partial product 375 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0375 : Poly :=
[
  term ((-2853085421137949669381713232249513121814252728812 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((5706170842275899338763426464499026243628505457624 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0375_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0375
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0376 : Poly :=
[
  term ((-38631404860049564603 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 376 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0376 : Poly :=
[
  term ((38631404860049564603 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-38631404860049564603 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0376_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0376
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0377 : Poly :=
[
  term ((-38631404860049564603 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 377 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0377 : Poly :=
[
  term ((-77262809720099129206 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((38631404860049564603 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0377_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0377
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0378 : Poly :=
[
  term ((205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 378 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0378 : Poly :=
[
  term ((-205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((410158792619943160048358352389377995320189700932672 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0378_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0378
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0379 : Poly :=
[
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 379 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0379 : Poly :=
[
  term ((-166105042348380797208 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0379_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0379
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0380 : Poly :=
[
  term ((1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 380 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0380 : Poly :=
[
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0380_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0380
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0381 : Poly :=
[
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0381 : Poly :=
[
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0381_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0381
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0382 : Poly :=
[
  term ((-31341054934670199208167535168566537664627384080562 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (3, 1), (11, 1), (13, 1)]
]

/-- Partial product 382 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0382 : Poly :=
[
  term ((31341054934670199208167535168566537664627384080562 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-62682109869340398416335070337133075329254768161124 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0382_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0382
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0383 : Poly :=
[
  term ((-62682109869340398416335070337133075329254768161124 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 383 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0383 : Poly :=
[
  term ((62682109869340398416335070337133075329254768161124 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-125364219738680796832670140674266150658509536322248 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0383_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0383
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0384 : Poly :=
[
  term ((166105042348380797208 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 384 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0384 : Poly :=
[
  term ((-166105042348380797208 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((332210084696761594416 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0384_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0384
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0385 : Poly :=
[
  term ((83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 385 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0385 : Poly :=
[
  term ((166105042348380797208 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0385_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0385
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0386 : Poly :=
[
  term ((624319690759268307908230002103650633998821735151048 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 386 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0386 : Poly :=
[
  term ((-624319690759268307908230002103650633998821735151048 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1)],
  term ((1248639381518536615816460004207301267997643470302096 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0386_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0386
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0387 : Poly :=
[
  term ((52606991633488268504916973179997218592260838665580 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 387 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0387 : Poly :=
[
  term ((105213983266976537009833946359994437184521677331160 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-52606991633488268504916973179997218592260838665580 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0387_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0387
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0388 : Poly :=
[
  term ((13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0388 : Poly :=
[
  term ((26413491879896938850 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0388_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0388
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0389 : Poly :=
[
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1), (13, 2)]
]

/-- Partial product 389 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0389 : Poly :=
[
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((182559114551440662842297360000582335145507102869504 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0389_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0389
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0390 : Poly :=
[
  term ((24562613097676985964680608144282018470536731660480 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (14, 1)]
]

/-- Partial product 390 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0390 : Poly :=
[
  term ((-24562613097676985964680608144282018470536731660480 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((49125226195353971929361216288564036941073463320960 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0390_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0390
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0391 : Poly :=
[
  term ((-1222807686033651456017 : Rat) / 1487745690739679424396) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 391 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0391 : Poly :=
[
  term ((1222807686033651456017 : Rat) / 1487745690739679424396) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1222807686033651456017 : Rat) / 743872845369839712198) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0391_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0391
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0392 : Poly :=
[
  term ((38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 392 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0392 : Poly :=
[
  term ((77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((-38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0392_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0392
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0393 : Poly :=
[
  term ((168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 393 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0393 : Poly :=
[
  term ((168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0393_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0393
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0394 : Poly :=
[
  term ((-624895980635059223971 : Rat) / 212535098677097060628) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 394 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0394 : Poly :=
[
  term ((-624895980635059223971 : Rat) / 106267549338548530314) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((624895980635059223971 : Rat) / 212535098677097060628) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0394_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0394
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0395 : Poly :=
[
  term ((-2817490239541224558913642287096602732560154939240 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (3, 1), (12, 2)]
]

/-- Partial product 395 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0395 : Poly :=
[
  term ((2817490239541224558913642287096602732560154939240 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (3, 1), (12, 2)],
  term ((-5634980479082449117827284574193205465120309878480 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (3, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0395_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0395
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0396 : Poly :=
[
  term ((-11857572738955470860987634103889266260583217160240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 2), (14, 1)]
]

/-- Partial product 396 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0396 : Poly :=
[
  term ((11857572738955470860987634103889266260583217160240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 2), (14, 1)],
  term ((-23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0396_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0396
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0397 : Poly :=
[
  term ((143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 397 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0397 : Poly :=
[
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0397_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0397
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0398 : Poly :=
[
  term ((647281710236042519329 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (12, 2), (16, 1)]
]

/-- Partial product 398 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0398 : Poly :=
[
  term ((647281710236042519329 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((-647281710236042519329 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0398_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0398
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0399 : Poly :=
[
  term ((23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 3)]
]

/-- Partial product 399 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0399 : Poly :=
[
  term ((-23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 3)],
  term ((47430290955821883443950536415557065042332868640960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0399_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0399
        rs_R009_ueqv_R009NYNYN_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_28_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0300,
  rs_R009_ueqv_R009NYNYN_partial_28_0301,
  rs_R009_ueqv_R009NYNYN_partial_28_0302,
  rs_R009_ueqv_R009NYNYN_partial_28_0303,
  rs_R009_ueqv_R009NYNYN_partial_28_0304,
  rs_R009_ueqv_R009NYNYN_partial_28_0305,
  rs_R009_ueqv_R009NYNYN_partial_28_0306,
  rs_R009_ueqv_R009NYNYN_partial_28_0307,
  rs_R009_ueqv_R009NYNYN_partial_28_0308,
  rs_R009_ueqv_R009NYNYN_partial_28_0309,
  rs_R009_ueqv_R009NYNYN_partial_28_0310,
  rs_R009_ueqv_R009NYNYN_partial_28_0311,
  rs_R009_ueqv_R009NYNYN_partial_28_0312,
  rs_R009_ueqv_R009NYNYN_partial_28_0313,
  rs_R009_ueqv_R009NYNYN_partial_28_0314,
  rs_R009_ueqv_R009NYNYN_partial_28_0315,
  rs_R009_ueqv_R009NYNYN_partial_28_0316,
  rs_R009_ueqv_R009NYNYN_partial_28_0317,
  rs_R009_ueqv_R009NYNYN_partial_28_0318,
  rs_R009_ueqv_R009NYNYN_partial_28_0319,
  rs_R009_ueqv_R009NYNYN_partial_28_0320,
  rs_R009_ueqv_R009NYNYN_partial_28_0321,
  rs_R009_ueqv_R009NYNYN_partial_28_0322,
  rs_R009_ueqv_R009NYNYN_partial_28_0323,
  rs_R009_ueqv_R009NYNYN_partial_28_0324,
  rs_R009_ueqv_R009NYNYN_partial_28_0325,
  rs_R009_ueqv_R009NYNYN_partial_28_0326,
  rs_R009_ueqv_R009NYNYN_partial_28_0327,
  rs_R009_ueqv_R009NYNYN_partial_28_0328,
  rs_R009_ueqv_R009NYNYN_partial_28_0329,
  rs_R009_ueqv_R009NYNYN_partial_28_0330,
  rs_R009_ueqv_R009NYNYN_partial_28_0331,
  rs_R009_ueqv_R009NYNYN_partial_28_0332,
  rs_R009_ueqv_R009NYNYN_partial_28_0333,
  rs_R009_ueqv_R009NYNYN_partial_28_0334,
  rs_R009_ueqv_R009NYNYN_partial_28_0335,
  rs_R009_ueqv_R009NYNYN_partial_28_0336,
  rs_R009_ueqv_R009NYNYN_partial_28_0337,
  rs_R009_ueqv_R009NYNYN_partial_28_0338,
  rs_R009_ueqv_R009NYNYN_partial_28_0339,
  rs_R009_ueqv_R009NYNYN_partial_28_0340,
  rs_R009_ueqv_R009NYNYN_partial_28_0341,
  rs_R009_ueqv_R009NYNYN_partial_28_0342,
  rs_R009_ueqv_R009NYNYN_partial_28_0343,
  rs_R009_ueqv_R009NYNYN_partial_28_0344,
  rs_R009_ueqv_R009NYNYN_partial_28_0345,
  rs_R009_ueqv_R009NYNYN_partial_28_0346,
  rs_R009_ueqv_R009NYNYN_partial_28_0347,
  rs_R009_ueqv_R009NYNYN_partial_28_0348,
  rs_R009_ueqv_R009NYNYN_partial_28_0349,
  rs_R009_ueqv_R009NYNYN_partial_28_0350,
  rs_R009_ueqv_R009NYNYN_partial_28_0351,
  rs_R009_ueqv_R009NYNYN_partial_28_0352,
  rs_R009_ueqv_R009NYNYN_partial_28_0353,
  rs_R009_ueqv_R009NYNYN_partial_28_0354,
  rs_R009_ueqv_R009NYNYN_partial_28_0355,
  rs_R009_ueqv_R009NYNYN_partial_28_0356,
  rs_R009_ueqv_R009NYNYN_partial_28_0357,
  rs_R009_ueqv_R009NYNYN_partial_28_0358,
  rs_R009_ueqv_R009NYNYN_partial_28_0359,
  rs_R009_ueqv_R009NYNYN_partial_28_0360,
  rs_R009_ueqv_R009NYNYN_partial_28_0361,
  rs_R009_ueqv_R009NYNYN_partial_28_0362,
  rs_R009_ueqv_R009NYNYN_partial_28_0363,
  rs_R009_ueqv_R009NYNYN_partial_28_0364,
  rs_R009_ueqv_R009NYNYN_partial_28_0365,
  rs_R009_ueqv_R009NYNYN_partial_28_0366,
  rs_R009_ueqv_R009NYNYN_partial_28_0367,
  rs_R009_ueqv_R009NYNYN_partial_28_0368,
  rs_R009_ueqv_R009NYNYN_partial_28_0369,
  rs_R009_ueqv_R009NYNYN_partial_28_0370,
  rs_R009_ueqv_R009NYNYN_partial_28_0371,
  rs_R009_ueqv_R009NYNYN_partial_28_0372,
  rs_R009_ueqv_R009NYNYN_partial_28_0373,
  rs_R009_ueqv_R009NYNYN_partial_28_0374,
  rs_R009_ueqv_R009NYNYN_partial_28_0375,
  rs_R009_ueqv_R009NYNYN_partial_28_0376,
  rs_R009_ueqv_R009NYNYN_partial_28_0377,
  rs_R009_ueqv_R009NYNYN_partial_28_0378,
  rs_R009_ueqv_R009NYNYN_partial_28_0379,
  rs_R009_ueqv_R009NYNYN_partial_28_0380,
  rs_R009_ueqv_R009NYNYN_partial_28_0381,
  rs_R009_ueqv_R009NYNYN_partial_28_0382,
  rs_R009_ueqv_R009NYNYN_partial_28_0383,
  rs_R009_ueqv_R009NYNYN_partial_28_0384,
  rs_R009_ueqv_R009NYNYN_partial_28_0385,
  rs_R009_ueqv_R009NYNYN_partial_28_0386,
  rs_R009_ueqv_R009NYNYN_partial_28_0387,
  rs_R009_ueqv_R009NYNYN_partial_28_0388,
  rs_R009_ueqv_R009NYNYN_partial_28_0389,
  rs_R009_ueqv_R009NYNYN_partial_28_0390,
  rs_R009_ueqv_R009NYNYN_partial_28_0391,
  rs_R009_ueqv_R009NYNYN_partial_28_0392,
  rs_R009_ueqv_R009NYNYN_partial_28_0393,
  rs_R009_ueqv_R009NYNYN_partial_28_0394,
  rs_R009_ueqv_R009NYNYN_partial_28_0395,
  rs_R009_ueqv_R009NYNYN_partial_28_0396,
  rs_R009_ueqv_R009NYNYN_partial_28_0397,
  rs_R009_ueqv_R009NYNYN_partial_28_0398,
  rs_R009_ueqv_R009NYNYN_partial_28_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0300_0399 : Poly :=
[
  term ((166105042348380797208 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2685375784722532480004470702460746465115438525292 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-962462768722307219935 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((5370751569445064960008941404921492930230877050584 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((86081215757259356093 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((438190776482523931921 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-956538730833695909509017008155028151627116532398480 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (12, 1), (13, 1)],
  term ((1927389727322304652810752372209774450423423321476552 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1942297033669053365525 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2)],
  term ((-192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((2230363914499769613851 : Rat) / 743872845369839712198) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((102870004665279649426664840450814381613890682212520 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((29123335070675039104 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51435002332639824713332420225407190806945341106260 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-14561667535337519552 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((-47430290955821883443950536415557065042332868640960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (12, 2), (13, 1), (14, 1)],
  term ((575229955739580881576 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)],
  term ((505618638861240433921971998041917363877455963728 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1)],
  term ((15185199146928529256 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-252809319430620216960985999020958681938727981864 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-7592599573464264628 : Rat) / 19575601193943150321) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((24185376349720988808735314662246918383186690502085 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (13, 1)],
  term ((-42096168400289883358879702707352906743850662130610 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((152116002570732284800929127039973457803485419032068 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((472722775911317956715 : Rat) / 70845032892365686876) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1792738371186312645311693319183122863577919678160 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((11602254242445340919 : Rat) / 13050400795962100214) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((-76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1764751130992843587233 : Rat) / 495915230246559808132) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-821416458148673377384426082239549579248158962757656 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1)],
  term ((-26413491879896938850 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((410708229074336688692213041119774789624079481378828 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 3)],
  term ((-182559114551440662842297360000582335145507102869504 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (13, 3), (14, 1)],
  term ((18011463635708323627373599584283228950614834878568 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((49696729103624869388 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9005731817854161813686799792141614475307417439284 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (15, 1)],
  term ((-24848364551812434694 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1)],
  term ((2933770076035833330282398496493012408945904855040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((88402926265569820256 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1)],
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((-2933770076035833330282398496493012408945904855040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (13, 1), (14, 1)],
  term ((535840393124528611992 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-267920196562264305996 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (14, 1), (15, 1)],
  term ((-301071293911852988592 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-183360629752239583142649906030813275559119053440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((150535646955926494296 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((27893816399541844559469542377288036383161600567216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (11, 1)],
  term ((-55787632799083689118939084754576072766323201134432 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((-62289390880642798953 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((2120335652579679080402719392550836617657815804384 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (13, 1), (14, 1)],
  term ((384089174440954997768 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1060167826289839540201359696275418308828907902192 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1)],
  term ((-192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((530083913144919770100679848137709154414453951096 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2190104191988940590898640459732830815840178464788 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (2, 2), (13, 1)],
  term ((4380208383977881181797280919465661631680356929576 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((-508509711437177725787 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((508509711437177725787 : Rat) / 247957615123279904066) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-141607978010480534912080956762965304856107361125746 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((3708123599234413770 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((70803989005240267456040478381482652428053680562873 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (15, 1)],
  term ((-1854061799617206885 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((197215540272037744556430980352155358453600498808892 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1)],
  term ((3131261118261230481432906519096944278479652939820 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1)],
  term ((-440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (14, 1)],
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((1247699653979282755807923735673918449244266688320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1)],
  term ((-561279223217620411936 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 2)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((40880684928629759962 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((-6189283906079571828413491122614611768665940398880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (12, 1)],
  term ((12378567812159143656826982245229223537331880797760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1)],
  term ((-132089503446359123886 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((98458160789863224220 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (12, 2), (16, 1)],
  term ((-423725381328172115485344933345662792511574654400 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((40235109270164320622 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term ((-6592889134450512308936797009548498018756566597680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (8, 1), (14, 2)],
  term ((371599647311813864 : Rat) / 623009083224321367) [(1, 1), (3, 1), (8, 1), (14, 2), (16, 1)],
  term ((-5514948155549271435 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)],
  term ((587318929649869059681749282408194598750685720960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((4944164798979218360 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((73414866206233632460218660301024324843835715120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2)],
  term ((-2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((618020599872402295 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((26930654978332524035306740025293047444967009831028 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (10, 1)],
  term ((817984160272213568933895445976892803531958760456 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (10, 1), (12, 1)],
  term ((-39011745763337600521435821575893943061048162439888 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1)],
  term ((-89927114649458955088 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16862671064901572953460228581531679087610891333120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 2)],
  term ((-382974375499019556176 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((20101021599926338084 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((-36487550206202630302888603132004945286129588349120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2)],
  term ((65125148755884837666005856443820584092851697891840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 1)],
  term ((220969525869282671264 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 2)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 2), (14, 2), (16, 1)],
  term ((-870998081803356797736 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 2), (16, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 3)],
  term ((-31399806626081691759085399280757225917629915225600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (12, 3), (14, 1)],
  term ((-780837930086939586496 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 3), (14, 1), (16, 1)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (12, 3), (16, 1)],
  term ((-62420566220078897078758619747334634255376777848492 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-115894214580148693809 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((5706170842275899338763426464499026243628505457624 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (14, 2)],
  term ((-38631404860049564603 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((38631404860049564603 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((410158792619943160048358352389377995320189700932672 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-166105042348380797208 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((31341054934670199208167535168566537664627384080562 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-125364219738680796832670140674266150658509536322248 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2)],
  term ((332210084696761594416 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-624319690759268307908230002103650633998821735151048 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1)],
  term ((105213983266976537009833946359994437184521677331160 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((26413491879896938850 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52606991633488268504916973179997218592260838665580 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((182559114551440662842297360000582335145507102869504 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (12, 1), (13, 2), (14, 1)],
  term ((146796551948491963162047790129823300251830412193968 : Rat) / 5224580147754654876802295144445267042943203507159) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-132030456892231187361 : Rat) / 26100801591924200428) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((49125226195353971929361216288564036941073463320960 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((-1222807686033651456017 : Rat) / 743872845369839712198) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((-38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((624895980635059223971 : Rat) / 212535098677097060628) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((2817490239541224558913642287096602732560154939240 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (3, 1), (12, 2)],
  term ((-240541325258173594190574041823799269009145532564800 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (12, 2), (14, 1)],
  term ((1798037641773232337593 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((-23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 2), (14, 2)],
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 2), (14, 2), (16, 1)],
  term ((-647281710236042519329 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((-23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 3)],
  term ((47430290955821883443950536415557065042332868640960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (12, 3), (14, 1)],
  term ((-394431080544075489112861960704310716907200997617784 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0300_0399
      rs_R009_ueqv_R009NYNYN_block_28_0300_0399 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
