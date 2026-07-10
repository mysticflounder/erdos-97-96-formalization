/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0400 : Poly :=
[
  term ((-287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 3), (16, 1)]
]

/-- Partial product 400 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0400 : Poly :=
[
  term ((-575229955739580881576 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 3), (14, 1), (16, 1)],
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0400_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0400
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0401 : Poly :=
[
  term ((-12767616806943349806360125087042658469850538089012 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 401 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0401 : Poly :=
[
  term ((12767616806943349806360125087042658469850538089012 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-25535233613886699612720250174085316939701076178024 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0401_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0401
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0402 : Poly :=
[
  term ((-90867923078564077053 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0402 : Poly :=
[
  term ((90867923078564077053 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-181735846157128154106 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0402_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0402
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0403 : Poly :=
[
  term ((-6383808403471674903180062543521329234925269044506 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 403 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0403 : Poly :=
[
  term ((-12767616806943349806360125087042658469850538089012 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((6383808403471674903180062543521329234925269044506 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0403_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0403
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0404 : Poly :=
[
  term ((-90867923078564077053 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0404 : Poly :=
[
  term ((-90867923078564077053 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((90867923078564077053 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0404_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0404
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0405 : Poly :=
[
  term ((-31377347813528863926019858750100088853134033305696 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (13, 2)]
]

/-- Partial product 405 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0405 : Poly :=
[
  term ((31377347813528863926019858750100088853134033305696 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (13, 2)],
  term ((-62754695627057727852039717500200177706268066611392 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0405_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0405
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0406 : Poly :=
[
  term ((-62754695627057727852039717500200177706268066611392 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (13, 2), (14, 1)]
]

/-- Partial product 406 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0406 : Poly :=
[
  term ((62754695627057727852039717500200177706268066611392 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-125509391254115455704079435000400355412536133222784 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0406_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0406
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0407 : Poly :=
[
  term ((50531709342305378429881858090486944148643720466344 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 407 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0407 : Poly :=
[
  term ((-50531709342305378429881858090486944148643720466344 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (14, 1)],
  term ((101063418684610756859763716180973888297287440932688 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0407_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0407
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0408 : Poly :=
[
  term ((-31635569126971645121 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 408 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0408 : Poly :=
[
  term ((31635569126971645121 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-63271138253943290242 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0408_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0408
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0409 : Poly :=
[
  term ((28799759954053946947 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 409 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0409 : Poly :=
[
  term ((57599519908107893894 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-28799759954053946947 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0409_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0409
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0410 : Poly :=
[
  term ((644128488372408043874053456441737602442022896350 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1)]
]

/-- Partial product 410 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0410 : Poly :=
[
  term ((-644128488372408043874053456441737602442022896350 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1)],
  term ((1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0410_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0410
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0411 : Poly :=
[
  term ((-2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (12, 1)]
]

/-- Partial product 411 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0411 : Poly :=
[
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-5153027906979264350992427651533900819536183170800 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0411_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0411
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0412 : Poly :=
[
  term ((249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 412 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0412 : Poly :=
[
  term ((498315127045142391624 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0412_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0412
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0413 : Poly :=
[
  term ((1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (14, 1)]
]

/-- Partial product 413 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0413 : Poly :=
[
  term ((-1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0413_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0413
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0414 : Poly :=
[
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 414 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0414 : Poly :=
[
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0414_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0414
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0415 : Poly :=
[
  term ((-62289390880642798953 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (16, 1)]
]

/-- Partial product 415 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0415 : Poly :=
[
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((62289390880642798953 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0415_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0415
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0416 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (13, 1)]
]

/-- Partial product 416 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0416 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0416_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0416
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0417 : Poly :=
[
  term ((-77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (15, 1)]
]

/-- Partial product 417 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0417 : Poly :=
[
  term ((-155402199908496023427106249053588789307648533140296 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1)],
  term ((77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0417_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0417
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0418 : Poly :=
[
  term ((-168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 418 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0418 : Poly :=
[
  term ((-337058200434359369362 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0418_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0418
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0419 : Poly :=
[
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (13, 1)]
]

/-- Partial product 419 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0419 : Poly :=
[
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (13, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0419_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0419
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0420 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (13, 1), (14, 1)]
]

/-- Partial product 420 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0420 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0420_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0420
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0421 : Poly :=
[
  term ((38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (14, 1), (15, 1)]
]

/-- Partial product 421 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0421 : Poly :=
[
  term ((-38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0421_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0421
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0422 : Poly :=
[
  term ((168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0422 : Poly :=
[
  term ((-168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0422_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0422
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0423 : Poly :=
[
  term ((19425274988562002928388281131698598663456066642537 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (15, 1)]
]

/-- Partial product 423 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0423 : Poly :=
[
  term ((38850549977124005856776562263397197326912133285074 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-19425274988562002928388281131698598663456066642537 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0423_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0423
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0424 : Poly :=
[
  term ((168529100217179684681 : Rat) / 495915230246559808132) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0424 : Poly :=
[
  term ((168529100217179684681 : Rat) / 247957615123279904066) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-168529100217179684681 : Rat) / 495915230246559808132) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0424_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0424
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0425 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1)]
]

/-- Partial product 425 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0425 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0425_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0425
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0426 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (10, 2)]
]

/-- Partial product 426 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0426 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (10, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0426_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0426
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0427 : Poly :=
[
  term ((264287688237722470205615007224626811720531254058107931 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 1), (7, 1)]
]

/-- Partial product 427 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0427 : Poly :=
[
  term ((-264287688237722470205615007224626811720531254058107931 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 1), (7, 1)],
  term ((528575376475444940411230014449253623441062508116215862 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0427_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0427
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0428 : Poly :=
[
  term ((-528575376475444940411230014449253623441062508116215862 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 428 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0428 : Poly :=
[
  term ((528575376475444940411230014449253623441062508116215862 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 1), (14, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0428_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0428
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0429 : Poly :=
[
  term ((-2653110331780868983784429258347613393057951779420 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 429 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0429 : Poly :=
[
  term ((2653110331780868983784429258347613393057951779420 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1)],
  term ((-5306220663561737967568858516695226786115903558840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0429_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0429
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0430 : Poly :=
[
  term ((139059983406686764763855598931919637144872882854355832213934520216 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 430 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0430 : Poly :=
[
  term ((-139059983406686764763855598931919637144872882854355832213934520216 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((278119966813373529527711197863839274289745765708711664427869040432 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0430_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0430
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0431 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 431 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0431 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0431_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0431
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0432 : Poly :=
[
  term ((68682951761615765880 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 432 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0432 : Poly :=
[
  term ((137365903523231531760 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-68682951761615765880 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0432_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0432
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0433 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 433 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0433 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0433_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0433
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0434 : Poly :=
[
  term ((-34341475880807882940 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 434 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0434 : Poly :=
[
  term ((34341475880807882940 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-68682951761615765880 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0434_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0434
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0435 : Poly :=
[
  term ((-5546697881347557090736 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 435 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0435 : Poly :=
[
  term ((-11093395762695114181472 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((5546697881347557090736 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0435_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0435
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0436 : Poly :=
[
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 436 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0436 : Poly :=
[
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0436_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0436
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0437 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 437 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0437 : Poly :=
[
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0437_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0437
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0438 : Poly :=
[
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 438 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0438 : Poly :=
[
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0438_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0438
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0439 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0439 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0439_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0439
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0440 : Poly :=
[
  term ((4951615367038278247818963449964515740027416881800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 440 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0440 : Poly :=
[
  term ((-4951615367038278247818963449964515740027416881800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((9903230734076556495637926899929031480054833763600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0440_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0440
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0441 : Poly :=
[
  term ((1287832743909065430805643460721568897309536839040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 441 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0441 : Poly :=
[
  term ((-1287832743909065430805643460721568897309536839040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0441_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0441
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0442 : Poly :=
[
  term ((-13141401086713553004 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 442 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0442 : Poly :=
[
  term ((13141401086713553004 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0442_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0442
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0443 : Poly :=
[
  term ((-398362694792148187078 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 443 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0443 : Poly :=
[
  term ((-796725389584296374156 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((398362694792148187078 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0443_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0443
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0444 : Poly :=
[
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 2)]
]

/-- Partial product 444 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0444 : Poly :=
[
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((-5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0444_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0444
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0445 : Poly :=
[
  term ((26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 445 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0445 : Poly :=
[
  term ((52565604346854212016 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0445_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0445
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0446 : Poly :=
[
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 446 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0446 : Poly :=
[
  term ((9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0446_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0446
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0447 : Poly :=
[
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0447 : Poly :=
[
  term ((-322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0447_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0447
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0448 : Poly :=
[
  term ((-1831891311564606408506659994621473421358940021380 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 448 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0448 : Poly :=
[
  term ((1831891311564606408506659994621473421358940021380 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((-3663782623129212817013319989242946842717880042760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0448_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0448
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0449 : Poly :=
[
  term ((4650506603116280709 : Rat) / 6525200397981050107) [(1, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 449 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0449 : Poly :=
[
  term ((-4650506603116280709 : Rat) / 6525200397981050107) [(1, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((9301013206232561418 : Rat) / 6525200397981050107) [(1, 1), (8, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0449_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0449
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0450 : Poly :=
[
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (15, 2)]
]

/-- Partial product 450 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0450 : Poly :=
[
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0450_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0450
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0451 : Poly :=
[
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 451 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0451 : Poly :=
[
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0451_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0451
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0452 : Poly :=
[
  term ((-2479167985984961563 : Rat) / 35422516446182843438) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 452 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0452 : Poly :=
[
  term ((-2479167985984961563 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((2479167985984961563 : Rat) / 35422516446182843438) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0452_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0452
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0453 : Poly :=
[
  term ((-35095867430936551790593752958048623527523518509950519958488886064 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 453 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0453 : Poly :=
[
  term ((35095867430936551790593752958048623527523518509950519958488886064 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-70191734861873103581187505916097247055047037019901039916977772128 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0453_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0453
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0454 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 454 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0454 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0454_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0454
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0455 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 455 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0455 : Poly :=
[
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0455_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0455
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0456 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 456 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0456 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0456_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0456
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0457 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 457 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0457 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0457_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0457
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0458 : Poly :=
[
  term ((1123410090806685747166 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 458 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0458 : Poly :=
[
  term ((2246820181613371494332 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1123410090806685747166 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0458_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0458
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0459 : Poly :=
[
  term ((7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 459 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0459 : Poly :=
[
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0459_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0459
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0460 : Poly :=
[
  term ((195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 460 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0460 : Poly :=
[
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0460_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0460
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0461 : Poly :=
[
  term ((-3182630728671994853230598068223907835938184898240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 461 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0461 : Poly :=
[
  term ((-6365261457343989706461196136447815671876369796480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((3182630728671994853230598068223907835938184898240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0461_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0461
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0462 : Poly :=
[
  term ((-459782133108639387896 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0462 : Poly :=
[
  term ((-919564266217278775792 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((459782133108639387896 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0462_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0462
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0463 : Poly :=
[
  term ((-39939848866334079643678307394210793578923993946290685014756910056 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 463 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0463 : Poly :=
[
  term ((39939848866334079643678307394210793578923993946290685014756910056 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-79879697732668159287356614788421587157847987892581370029513820112 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0463_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0463
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0464 : Poly :=
[
  term ((-742345099588216616655076841870745403765554504960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 464 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0464 : Poly :=
[
  term ((742345099588216616655076841870745403765554504960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1484690199176433233310153683741490807531109009920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0464_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0464
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0465 : Poly :=
[
  term ((362177391847771939584 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 465 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0465 : Poly :=
[
  term ((-362177391847771939584 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((724354783695543879168 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0465_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0465
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0466 : Poly :=
[
  term ((-138221599666713429382 : Rat) / 685146041788010261235) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 466 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0466 : Poly :=
[
  term ((-276443199333426858764 : Rat) / 685146041788010261235) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((138221599666713429382 : Rat) / 685146041788010261235) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0466_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0466
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0467 : Poly :=
[
  term ((-73760716880312163778655621871733677882170241550852013200446836980 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 467 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0467 : Poly :=
[
  term ((-147521433760624327557311243743467355764340483101704026400893673960 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((73760716880312163778655621871733677882170241550852013200446836980 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0467_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0467
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0468 : Poly :=
[
  term ((1306862136752080371510 : Rat) / 867851652931479664231) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 468 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0468 : Poly :=
[
  term ((2613724273504160743020 : Rat) / 867851652931479664231) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1306862136752080371510 : Rat) / 867851652931479664231) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0468_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0468
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0469 : Poly :=
[
  term ((-10253375215455875671118492958841695418083321368516 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 469 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0469 : Poly :=
[
  term ((10253375215455875671118492958841695418083321368516 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (8, 1), (11, 1)],
  term ((-20506750430911751342236985917683390836166642737032 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0469_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0469
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0470 : Poly :=
[
  term ((561063303777330253251068378591880362621800589744 : Rat) / 6806637080640719176924635401287338414405811381) [(1, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 470 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0470 : Poly :=
[
  term ((-561063303777330253251068378591880362621800589744 : Rat) / 6806637080640719176924635401287338414405811381) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((1122126607554660506502136757183760725243601179488 : Rat) / 6806637080640719176924635401287338414405811381) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0470_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0470
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0471 : Poly :=
[
  term ((1287832743909065430805643460721568897309536839040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 471 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0471 : Poly :=
[
  term ((-1287832743909065430805643460721568897309536839040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0471_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0471
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0472 : Poly :=
[
  term ((-13141401086713553004 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 472 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0472 : Poly :=
[
  term ((13141401086713553004 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0472_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0472
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0473 : Poly :=
[
  term ((-205839436839540216098 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 473 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0473 : Poly :=
[
  term ((-411678873679080432196 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((205839436839540216098 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0473_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0473
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0474 : Poly :=
[
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 2)]
]

/-- Partial product 474 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0474 : Poly :=
[
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0474_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0474
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0475 : Poly :=
[
  term ((26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 475 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0475 : Poly :=
[
  term ((52565604346854212016 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0475_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0475
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0476 : Poly :=
[
  term ((-103850538836640749571494362109636904980989633029676 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 476 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0476 : Poly :=
[
  term ((-207701077673281499142988724219273809961979266059352 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((103850538836640749571494362109636904980989633029676 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0476_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0476
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0477 : Poly :=
[
  term ((195247272316376776 : Rat) / 89001297603474481) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 477 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0477 : Poly :=
[
  term ((390494544632753552 : Rat) / 89001297603474481) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-195247272316376776 : Rat) / 89001297603474481) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0477_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0477
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0478 : Poly :=
[
  term ((-1896562263624146155735905120600769208428063219580 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 478 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0478 : Poly :=
[
  term ((1896562263624146155735905120600769208428063219580 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-3793124527248292311471810241201538416856126439160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0478_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0478
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0479 : Poly :=
[
  term ((39228168700435909749 : Rat) / 247957615123279904066) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 479 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0479 : Poly :=
[
  term ((-39228168700435909749 : Rat) / 247957615123279904066) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((39228168700435909749 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0479_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0479
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0480 : Poly :=
[
  term ((135051278601416419980 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 480 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0480 : Poly :=
[
  term ((270102557202832839960 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-135051278601416419980 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0480_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0480
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0481 : Poly :=
[
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 2), (13, 1)]
]

/-- Partial product 481 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0481 : Poly :=
[
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0481_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0481
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0482 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 482 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0482 : Poly :=
[
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0482_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0482
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0483 : Poly :=
[
  term ((-83717715295952607443994330788472880322868928961456 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 483 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0483 : Poly :=
[
  term ((83717715295952607443994330788472880322868928961456 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-167435430591905214887988661576945760645737857922912 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0483_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0483
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0484 : Poly :=
[
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 484 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0484 : Poly :=
[
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0484_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0484
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0485 : Poly :=
[
  term ((248806433347357066610 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 485 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0485 : Poly :=
[
  term ((-248806433347357066610 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((497612866694714133220 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0485_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0485
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0486 : Poly :=
[
  term ((8902645787716082996 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 486 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0486 : Poly :=
[
  term ((17805291575432165992 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8902645787716082996 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0486_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0486
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0487 : Poly :=
[
  term ((349052848585569448643519715887319687519107387750 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 487 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0487 : Poly :=
[
  term ((698105697171138897287039431774639375038214775500 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-349052848585569448643519715887319687519107387750 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0487_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0487
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0488 : Poly :=
[
  term ((180449418564527510348 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 488 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0488 : Poly :=
[
  term ((360898837129055020696 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-180449418564527510348 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0488_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0488
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0489 : Poly :=
[
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 489 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0489 : Poly :=
[
  term ((5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0489_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0489
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0490 : Poly :=
[
  term ((-248806433347357066610 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 490 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0490 : Poly :=
[
  term ((-497612866694714133220 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((248806433347357066610 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0490_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0490
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0491 : Poly :=
[
  term ((28513101574982430009495954388419000626626663408 : Rat) / 2331361065486236000358007650354871505106293399) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 491 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0491 : Poly :=
[
  term ((-28513101574982430009495954388419000626626663408 : Rat) / 2331361065486236000358007650354871505106293399) [(1, 1), (8, 1), (13, 1)],
  term ((57026203149964860018991908776838001253253326816 : Rat) / 2331361065486236000358007650354871505106293399) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0491_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0491
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0492 : Poly :=
[
  term ((975977063196461766240040601550182435984955136760 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 492 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0492 : Poly :=
[
  term ((-975977063196461766240040601550182435984955136760 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((1951954126392923532480081203100364871969910273520 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0492_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0492
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0493 : Poly :=
[
  term ((-540484601428537912805 : Rat) / 247957615123279904066) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 493 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0493 : Poly :=
[
  term ((540484601428537912805 : Rat) / 247957615123279904066) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-540484601428537912805 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0493_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0493
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0494 : Poly :=
[
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 494 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0494 : Poly :=
[
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0494_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0494
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0495 : Poly :=
[
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 495 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0495 : Poly :=
[
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0495_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0495
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0496 : Poly :=
[
  term ((-2191991527190494597471 : Rat) / 743872845369839712198) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 496 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0496 : Poly :=
[
  term ((-2191991527190494597471 : Rat) / 371936422684919856099) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2191991527190494597471 : Rat) / 743872845369839712198) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0496_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0496
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0497 : Poly :=
[
  term ((14887830919533994081766006465847127961830959215107 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 497 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0497 : Poly :=
[
  term ((29775661839067988163532012931694255923661918430214 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-14887830919533994081766006465847127961830959215107 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0497_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0497
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0498 : Poly :=
[
  term ((14214473797065252785 : Rat) / 39151202387886300642) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0498 : Poly :=
[
  term ((14214473797065252785 : Rat) / 19575601193943150321) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14214473797065252785 : Rat) / 39151202387886300642) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0498_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0498
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0499 : Poly :=
[
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 499 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0499 : Poly :=
[
  term ((-518614545066938596432 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0499_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0499
        rs_R009_ueqv_R009NYNYN_generator_28_0400_0499 =
      rs_R009_ueqv_R009NYNYN_partial_28_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0400_0499 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0400,
  rs_R009_ueqv_R009NYNYN_partial_28_0401,
  rs_R009_ueqv_R009NYNYN_partial_28_0402,
  rs_R009_ueqv_R009NYNYN_partial_28_0403,
  rs_R009_ueqv_R009NYNYN_partial_28_0404,
  rs_R009_ueqv_R009NYNYN_partial_28_0405,
  rs_R009_ueqv_R009NYNYN_partial_28_0406,
  rs_R009_ueqv_R009NYNYN_partial_28_0407,
  rs_R009_ueqv_R009NYNYN_partial_28_0408,
  rs_R009_ueqv_R009NYNYN_partial_28_0409,
  rs_R009_ueqv_R009NYNYN_partial_28_0410,
  rs_R009_ueqv_R009NYNYN_partial_28_0411,
  rs_R009_ueqv_R009NYNYN_partial_28_0412,
  rs_R009_ueqv_R009NYNYN_partial_28_0413,
  rs_R009_ueqv_R009NYNYN_partial_28_0414,
  rs_R009_ueqv_R009NYNYN_partial_28_0415,
  rs_R009_ueqv_R009NYNYN_partial_28_0416,
  rs_R009_ueqv_R009NYNYN_partial_28_0417,
  rs_R009_ueqv_R009NYNYN_partial_28_0418,
  rs_R009_ueqv_R009NYNYN_partial_28_0419,
  rs_R009_ueqv_R009NYNYN_partial_28_0420,
  rs_R009_ueqv_R009NYNYN_partial_28_0421,
  rs_R009_ueqv_R009NYNYN_partial_28_0422,
  rs_R009_ueqv_R009NYNYN_partial_28_0423,
  rs_R009_ueqv_R009NYNYN_partial_28_0424,
  rs_R009_ueqv_R009NYNYN_partial_28_0425,
  rs_R009_ueqv_R009NYNYN_partial_28_0426,
  rs_R009_ueqv_R009NYNYN_partial_28_0427,
  rs_R009_ueqv_R009NYNYN_partial_28_0428,
  rs_R009_ueqv_R009NYNYN_partial_28_0429,
  rs_R009_ueqv_R009NYNYN_partial_28_0430,
  rs_R009_ueqv_R009NYNYN_partial_28_0431,
  rs_R009_ueqv_R009NYNYN_partial_28_0432,
  rs_R009_ueqv_R009NYNYN_partial_28_0433,
  rs_R009_ueqv_R009NYNYN_partial_28_0434,
  rs_R009_ueqv_R009NYNYN_partial_28_0435,
  rs_R009_ueqv_R009NYNYN_partial_28_0436,
  rs_R009_ueqv_R009NYNYN_partial_28_0437,
  rs_R009_ueqv_R009NYNYN_partial_28_0438,
  rs_R009_ueqv_R009NYNYN_partial_28_0439,
  rs_R009_ueqv_R009NYNYN_partial_28_0440,
  rs_R009_ueqv_R009NYNYN_partial_28_0441,
  rs_R009_ueqv_R009NYNYN_partial_28_0442,
  rs_R009_ueqv_R009NYNYN_partial_28_0443,
  rs_R009_ueqv_R009NYNYN_partial_28_0444,
  rs_R009_ueqv_R009NYNYN_partial_28_0445,
  rs_R009_ueqv_R009NYNYN_partial_28_0446,
  rs_R009_ueqv_R009NYNYN_partial_28_0447,
  rs_R009_ueqv_R009NYNYN_partial_28_0448,
  rs_R009_ueqv_R009NYNYN_partial_28_0449,
  rs_R009_ueqv_R009NYNYN_partial_28_0450,
  rs_R009_ueqv_R009NYNYN_partial_28_0451,
  rs_R009_ueqv_R009NYNYN_partial_28_0452,
  rs_R009_ueqv_R009NYNYN_partial_28_0453,
  rs_R009_ueqv_R009NYNYN_partial_28_0454,
  rs_R009_ueqv_R009NYNYN_partial_28_0455,
  rs_R009_ueqv_R009NYNYN_partial_28_0456,
  rs_R009_ueqv_R009NYNYN_partial_28_0457,
  rs_R009_ueqv_R009NYNYN_partial_28_0458,
  rs_R009_ueqv_R009NYNYN_partial_28_0459,
  rs_R009_ueqv_R009NYNYN_partial_28_0460,
  rs_R009_ueqv_R009NYNYN_partial_28_0461,
  rs_R009_ueqv_R009NYNYN_partial_28_0462,
  rs_R009_ueqv_R009NYNYN_partial_28_0463,
  rs_R009_ueqv_R009NYNYN_partial_28_0464,
  rs_R009_ueqv_R009NYNYN_partial_28_0465,
  rs_R009_ueqv_R009NYNYN_partial_28_0466,
  rs_R009_ueqv_R009NYNYN_partial_28_0467,
  rs_R009_ueqv_R009NYNYN_partial_28_0468,
  rs_R009_ueqv_R009NYNYN_partial_28_0469,
  rs_R009_ueqv_R009NYNYN_partial_28_0470,
  rs_R009_ueqv_R009NYNYN_partial_28_0471,
  rs_R009_ueqv_R009NYNYN_partial_28_0472,
  rs_R009_ueqv_R009NYNYN_partial_28_0473,
  rs_R009_ueqv_R009NYNYN_partial_28_0474,
  rs_R009_ueqv_R009NYNYN_partial_28_0475,
  rs_R009_ueqv_R009NYNYN_partial_28_0476,
  rs_R009_ueqv_R009NYNYN_partial_28_0477,
  rs_R009_ueqv_R009NYNYN_partial_28_0478,
  rs_R009_ueqv_R009NYNYN_partial_28_0479,
  rs_R009_ueqv_R009NYNYN_partial_28_0480,
  rs_R009_ueqv_R009NYNYN_partial_28_0481,
  rs_R009_ueqv_R009NYNYN_partial_28_0482,
  rs_R009_ueqv_R009NYNYN_partial_28_0483,
  rs_R009_ueqv_R009NYNYN_partial_28_0484,
  rs_R009_ueqv_R009NYNYN_partial_28_0485,
  rs_R009_ueqv_R009NYNYN_partial_28_0486,
  rs_R009_ueqv_R009NYNYN_partial_28_0487,
  rs_R009_ueqv_R009NYNYN_partial_28_0488,
  rs_R009_ueqv_R009NYNYN_partial_28_0489,
  rs_R009_ueqv_R009NYNYN_partial_28_0490,
  rs_R009_ueqv_R009NYNYN_partial_28_0491,
  rs_R009_ueqv_R009NYNYN_partial_28_0492,
  rs_R009_ueqv_R009NYNYN_partial_28_0493,
  rs_R009_ueqv_R009NYNYN_partial_28_0494,
  rs_R009_ueqv_R009NYNYN_partial_28_0495,
  rs_R009_ueqv_R009NYNYN_partial_28_0496,
  rs_R009_ueqv_R009NYNYN_partial_28_0497,
  rs_R009_ueqv_R009NYNYN_partial_28_0498,
  rs_R009_ueqv_R009NYNYN_partial_28_0499
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0400_0499 : Poly :=
[
  term ((-575229955739580881576 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 3), (14, 1), (16, 1)],
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((-25535233613886699612720250174085316939701076178024 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-181735846157128154106 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6383808403471674903180062543521329234925269044506 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((90867923078564077053 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((31377347813528863926019858750100088853134033305696 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (13, 2)],
  term ((-125509391254115455704079435000400355412536133222784 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (13, 2), (14, 2)],
  term ((-50531709342305378429881858090486944148643720466344 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (14, 1)],
  term ((89235089035079539015 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((101063418684610756859763716180973888297287440932688 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (14, 2)],
  term ((-63271138253943290242 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-28799759954053946947 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (16, 1)],
  term ((-644128488372408043874053456441737602442022896350 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1)],
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-5153027906979264350992427651533900819536183170800 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1)],
  term ((498315127045142391624 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (3, 2), (11, 1), (14, 2)],
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (14, 2), (16, 1)],
  term ((62289390880642798953 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1)],
  term ((-155402199908496023427106249053588789307648533140296 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1)],
  term ((-337058200434359369362 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (13, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((77701099954248011713553124526794394653824266570148 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((168529100217179684681 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)],
  term ((-19425274988562002928388281131698598663456066642537 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (15, 1)],
  term ((-168529100217179684681 : Rat) / 495915230246559808132) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (10, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (10, 2), (14, 1)],
  term ((-264287688237722470205615007224626811720531254058107931 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 1), (7, 1)],
  term ((2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 1), (14, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 1), (14, 2)],
  term ((2653110331780868983784429258347613393057951779420 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1)],
  term ((-139059983406686764763855598931919637144872882854355832213934520216 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((137365903523231531760 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-68682951761615765880 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((276982566123415515013965103809811964165704318266352152330333520432 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-2679734171897182861172 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 2)],
  term ((-68682951761615765880 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((5546697881347557090736 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4951615367038278247818963449964515740027416881800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((297082689316120381545940808248533192508458514640 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-704735581977301503128 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 2)],
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((398362694792148187078 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 2)],
  term ((-5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (12, 2), (14, 1)],
  term ((52565604346854212016 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3474329351997131559062198522073753364756963537460 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-105713801361104064412 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3663782623129212817013319989242946842717880042760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (9, 1), (14, 2)],
  term ((9301013206232561418 : Rat) / 6525200397981050107) [(1, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((2479167985984961563 : Rat) / 35422516446182843438) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((35095867430936551790593752958048623527523518509950519958488886064 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-70318112716312882971603738588766948179940531180163207927815052128 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((400071950872567735956 : Rat) / 88556291115457108595) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1123410090806685747166 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6365261457343989706461196136447815671876369796480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-919564266217278775792 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3182630728671994853230598068223907835938184898240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((459782133108639387896 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((39939848866334079643678307394210793578923993946290685014756910056 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-79696983220440199451278574943252925481942667684934724139938248912 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-43281046931351163972836 : Rat) / 13017774793972194963465) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1484690199176433233310153683741490807531109009920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((724354783695543879168 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((138221599666713429382 : Rat) / 685146041788010261235) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-147521433760624327557311243743467355764340483101704026400893673960 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((2613724273504160743020 : Rat) / 867851652931479664231) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((73760716880312163778655621871733677882170241550852013200446836980 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1306862136752080371510 : Rat) / 867851652931479664231) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((10253375215455875671118492958841695418083321368516 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (8, 1), (11, 1)],
  term ((-561063303777330253251068378591880362621800589744 : Rat) / 6806637080640719176924635401287338414405811381) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((222015362159468375363119571218846815426167097879072 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-319689066072085561168 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((205839436839540216098 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((-5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((52565604346854212016 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-207701077673281499142988724219273809961979266059352 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((390494544632753552 : Rat) / 89001297603474481) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((103850538836640749571494362109636904980989633029676 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-195247272316376776 : Rat) / 89001297603474481) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137857566225509820928451186061981428227882309500484 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((500976945705229770171 : Rat) / 247957615123279904066) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3793124527248292311471810241201538416856126439160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((39228168700435909749 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-135051278601416419980 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((83717715295952607443994330788472880322868928961456 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-144254441201542037133487079283957520494166194820192 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-621782259014046037886 : Rat) / 371936422684919856099) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((497612866694714133220 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8902645787716082996 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((698105697171138897287039431774639375038214775500 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((360898837129055020696 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-349052848585569448643519715887319687519107387750 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-180449418564527510348 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-497612866694714133220 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((248806433347357066610 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28513101574982430009495954388419000626626663408 : Rat) / 2331361065486236000358007650354871505106293399) [(1, 1), (8, 1), (13, 1)],
  term ((3757197798250621615336287826927371668035070988968 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2762529250095375456527 : Rat) / 743872845369839712198) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1951954126392923532480081203100364871969910273520 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((-540484601428537912805 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((2191991527190494597471 : Rat) / 743872845369839712198) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((29775661839067988163532012931694255923661918430214 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((14214473797065252785 : Rat) / 19575601193943150321) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14887830919533994081766006465847127961830959215107 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (15, 1)],
  term ((-14214473797065252785 : Rat) / 39151202387886300642) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-518614545066938596432 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 400 through 499. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0400_0499_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0400_0499
      rs_R009_ueqv_R009NYNYN_block_28_0400_0499 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
