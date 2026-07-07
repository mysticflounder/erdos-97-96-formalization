/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0000 : Poly :=
[
  term ((-809285644874120282110073302040092694725593031747645483298142517470490756268141967733 : Rat) / 6416897752399038656562248605798617971555095569915659164757690382855929555466240000) []
]

/-- Partial product 0 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0000 : Poly :=
[
  term ((809285644874120282110073302040092694725593031747645483298142517470490756268141967733 : Rat) / 6416897752399038656562248605798617971555095569915659164757690382855929555466240000) [],
  term ((-809285644874120282110073302040092694725593031747645483298142517470490756268141967733 : Rat) / 3208448876199519328281124302899308985777547784957829582378845191427964777733120000) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0000_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0000
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0001 : Poly :=
[
  term ((-17127002608606982881582071430988332166854766121964 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1)]
]

/-- Partial product 1 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0001 : Poly :=
[
  term ((17127002608606982881582071430988332166854766121964 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1)],
  term ((-34254005217213965763164142861976664333709532243928 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0001_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0001
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0002 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (9, 1), (10, 1)]
]

/-- Partial product 2 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0002 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((-2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0002_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0002
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0003 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 3 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0003 : Poly :=
[
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0003_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0003
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0004 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (10, 1), (11, 1)]
]

/-- Partial product 4 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0004 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0004_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0004
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0005 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0005 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0005_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0005
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0006 : Poly :=
[
  term ((-240007942040352965294909133214036433484342227073596 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1)]
]

/-- Partial product 6 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0006 : Poly :=
[
  term ((240007942040352965294909133214036433484342227073596 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1)],
  term ((-480015884080705930589818266428072866968684454147192 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0006_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0006
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0007 : Poly :=
[
  term ((13807850239117351545628538306684288519310595247054 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1)]
]

/-- Partial product 7 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0007 : Poly :=
[
  term ((-13807850239117351545628538306684288519310595247054 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((27615700478234703091257076613368577038621190494108 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0007_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0007
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0008 : Poly :=
[
  term ((55125120028504083102078553994479711283611904087856 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 8 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0008 : Poly :=
[
  term ((-55125120028504083102078553994479711283611904087856 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((110250240057008166204157107988959422567223808175712 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0008_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0008
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0009 : Poly :=
[
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 9 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0009 : Poly :=
[
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0009_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0009
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0010 : Poly :=
[
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2)]
]

/-- Partial product 10 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0010 : Poly :=
[
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-73500160038005444136104738659306281711482538783808 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0010_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0010
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0011 : Poly :=
[
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 11 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0011 : Poly :=
[
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0011_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0011
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0012 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 12 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0012 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0012_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0012
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0013 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 13 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0013 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0013_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0013
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0014 : Poly :=
[
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 14 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0014 : Poly :=
[
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0014_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0014
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0015 : Poly :=
[
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 15 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0015 : Poly :=
[
  term ((43200500460563834011516660001647706722910483681680 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0015_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0015
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0016 : Poly :=
[
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 2), (13, 1)]
]

/-- Partial product 16 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0016 : Poly :=
[
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 2), (13, 1)],
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0016_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0016
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0017 : Poly :=
[
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 2), (15, 1)]
]

/-- Partial product 17 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0017 : Poly :=
[
  term ((-86401000921127668023033320003295413445820967363360 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0017_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0017
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0018 : Poly :=
[
  term ((-171008447500057459537069734285121472006192713702340 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (13, 1)]
]

/-- Partial product 18 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0018 : Poly :=
[
  term ((171008447500057459537069734285121472006192713702340 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((-342016895000114919074139468570242944012385427404680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0018_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0018
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0019 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 19 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0019 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0019_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0019
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0020 : Poly :=
[
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 20 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0020 : Poly :=
[
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0020_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0020
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0021 : Poly :=
[
  term ((138170784650753623923579056933579055926940963640900 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (15, 1)]
]

/-- Partial product 21 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0021 : Poly :=
[
  term ((276341569301507247847158113867158111853881927281800 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-138170784650753623923579056933579055926940963640900 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0021_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0021
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0022 : Poly :=
[
  term ((-293884819988880201334329108846270573736121557153120 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 22 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0022 : Poly :=
[
  term ((293884819988880201334329108846270573736121557153120 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-587769639977760402668658217692541147472243114306240 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0022_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0022
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0023 : Poly :=
[
  term ((146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 23 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0023 : Poly :=
[
  term ((293884819988880201334329108846270573736121557153120 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0023_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0023
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0024 : Poly :=
[
  term ((-288161441748508186709466897144342550049571595983280 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 24 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0024 : Poly :=
[
  term ((-576322883497016373418933794288685100099143191966560 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((288161441748508186709466897144342550049571595983280 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0024_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0024
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0025 : Poly :=
[
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 2)]
]

/-- Partial product 25 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0025 : Poly :=
[
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 2)],
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0025_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0025
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0026 : Poly :=
[
  term ((51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (8, 1), (15, 2)]
]

/-- Partial product 26 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0026 : Poly :=
[
  term ((103660443689146089854918022381471780647586661280656 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0026_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0026
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0027 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1)]
]

/-- Partial product 27 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0027 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0027_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0027
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0028 : Poly :=
[
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 28 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0028 : Poly :=
[
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0028_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0028
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0029 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 29 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0029 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0029_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0029
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0030 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 30 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0030 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0030_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0030
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0031 : Poly :=
[
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 31 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0031 : Poly :=
[
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0031_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0031
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0032 : Poly :=
[
  term ((28387544638268997602582018823467103789348653272696 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1)]
]

/-- Partial product 32 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0032 : Poly :=
[
  term ((-28387544638268997602582018823467103789348653272696 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((56775089276537995205164037646934207578697306545392 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0032_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0032
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0033 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 33 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0033 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0033_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0033
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0034 : Poly :=
[
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 34 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0034 : Poly :=
[
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0034_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0034
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0035 : Poly :=
[
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 35 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0035 : Poly :=
[
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0035_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0035
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0036 : Poly :=
[
  term ((211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 36 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0036 : Poly :=
[
  term ((-211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((422452189973818940967467478604579290176311701033728 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0036_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0036
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0037 : Poly :=
[
  term ((-105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 37 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0037 : Poly :=
[
  term ((-211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0037_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0037
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0038 : Poly :=
[
  term ((71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 38 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0038 : Poly :=
[
  term ((143507014958346931400442829263161019210543462555520 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0038_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0038
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0039 : Poly :=
[
  term ((-35876753739586732850110707315790254802635865638880 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (15, 2)]
]

/-- Partial product 39 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0039 : Poly :=
[
  term ((-71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (14, 1), (15, 2)],
  term ((35876753739586732850110707315790254802635865638880 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0039_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0039
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0040 : Poly :=
[
  term ((-419841309839790197936252583791716004922638354056424 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 40 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0040 : Poly :=
[
  term ((419841309839790197936252583791716004922638354056424 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-839682619679580395872505167583432009845276708112848 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0040_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0040
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0041 : Poly :=
[
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 41 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0041 : Poly :=
[
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0041_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0041
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0042 : Poly :=
[
  term ((85889134855760911988449545408278652073192392830536 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 42 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0042 : Poly :=
[
  term ((171778269711521823976899090816557304146384785661072 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-85889134855760911988449545408278652073192392830536 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0042_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0042
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0043 : Poly :=
[
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 43 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0043 : Poly :=
[
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0043_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0043
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0044 : Poly :=
[
  term ((533124719376341451236477695627582629538949447141386 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (11, 1), (13, 1)]
]

/-- Partial product 44 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0044 : Poly :=
[
  term ((-533124719376341451236477695627582629538949447141386 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((1066249438752682902472955391255165259077898894282772 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0044_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0044
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0045 : Poly :=
[
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 45 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0045 : Poly :=
[
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0045_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0045
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0046 : Poly :=
[
  term ((-13000267681155830850312751615752852298035395675248 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 46 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0046 : Poly :=
[
  term ((-26000535362311661700625503231505704596070791350496 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((13000267681155830850312751615752852298035395675248 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0046_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0046
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0047 : Poly :=
[
  term ((-105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 2)]
]

/-- Partial product 47 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0047 : Poly :=
[
  term ((105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 2)],
  term ((-211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0047_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0047
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0048 : Poly :=
[
  term ((-256255954370621740492412176077676118613466173899 : Rat) / 48568474149113657553274988062572203586457403121) [(0, 1), (2, 1), (12, 1)]
]

/-- Partial product 48 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0048 : Poly :=
[
  term ((256255954370621740492412176077676118613466173899 : Rat) / 48568474149113657553274988062572203586457403121) [(0, 1), (2, 1), (12, 1)],
  term ((-512511908741243480984824352155352237226932347798 : Rat) / 48568474149113657553274988062572203586457403121) [(0, 1), (2, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0048_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0048
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0049 : Poly :=
[
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 49 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0049 : Poly :=
[
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0049_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0049
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0050 : Poly :=
[
  term ((882761303463756505672306128057377718231969625054148 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 50 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0050 : Poly :=
[
  term ((1765522606927513011344612256114755436463939250108296 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-882761303463756505672306128057377718231969625054148 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0050_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0050
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0051 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 746368592536379268114613592063609577563314786737) [(0, 1), (2, 1), (12, 1), (13, 2)]
]

/-- Partial product 51 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0051 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 746368592536379268114613592063609577563314786737) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 746368592536379268114613592063609577563314786737) [(0, 1), (2, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0051_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0051
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0052 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 52 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0052 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0052_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0052
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0053 : Poly :=
[
  term ((-142408839707651612749023196343447450490997013352524 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (15, 2)]
]

/-- Partial product 53 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0053 : Poly :=
[
  term ((-284817679415303225498046392686894900981994026705048 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (14, 1), (15, 2)],
  term ((142408839707651612749023196343447450490997013352524 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0053_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0053
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0054 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 54 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0054 : Poly :=
[
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0054_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0054
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0055 : Poly :=
[
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 2), (15, 2)]
]

/-- Partial product 55 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0055 : Poly :=
[
  term ((43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 2), (14, 1), (15, 2)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0055_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0055
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0056 : Poly :=
[
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 56 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0056 : Poly :=
[
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0056_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0056
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0057 : Poly :=
[
  term ((-265140789233308731630382942572355938308587389017596 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (15, 1)]
]

/-- Partial product 57 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0057 : Poly :=
[
  term ((-530281578466617463260765885144711876617174778035192 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((265140789233308731630382942572355938308587389017596 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0057_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0057
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0058 : Poly :=
[
  term ((34159165370412267341913174336439129985201242490804 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (2, 1), (13, 2)]
]

/-- Partial product 58 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0058 : Poly :=
[
  term ((-34159165370412267341913174336439129985201242490804 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (2, 1), (13, 2)],
  term ((68318330740824534683826348672878259970402484981608 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (2, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0058_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0058
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0059 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (13, 2), (14, 1)]
]

/-- Partial product 59 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0059 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (13, 2), (14, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0059_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0059
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0060 : Poly :=
[
  term ((-111231482895170376482322279233557524574950801683332 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (14, 1)]
]

/-- Partial product 60 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0060 : Poly :=
[
  term ((111231482895170376482322279233557524574950801683332 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (14, 1)],
  term ((-222462965790340752964644558467115049149901603366664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0060_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0060
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0061 : Poly :=
[
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (15, 2)]
]

/-- Partial product 61 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0061 : Poly :=
[
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0061_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0061
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0062 : Poly :=
[
  term ((2069773019820520474928340839703935368962395978389 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 2)]
]

/-- Partial product 62 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0062 : Poly :=
[
  term ((-2069773019820520474928340839703935368962395978389 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 2)],
  term ((4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0062_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0062
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0063 : Poly :=
[
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 63 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0063 : Poly :=
[
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((73500160038005444136104738659306281711482538783808 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0063_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0063
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0064 : Poly :=
[
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 64 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0064 : Poly :=
[
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0064_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0064
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0065 : Poly :=
[
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (13, 1)]
]

/-- Partial product 65 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0065 : Poly :=
[
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-73500160038005444136104738659306281711482538783808 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0065_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0065
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0066 : Poly :=
[
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (15, 1)]
]

/-- Partial product 66 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0066 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0066_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0066
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0067 : Poly :=
[
  term ((-25259167496226414554344849998570668956654679894384 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 67 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0067 : Poly :=
[
  term ((-50518334992452829108689699997141337913309359788768 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((25259167496226414554344849998570668956654679894384 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0067_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0067
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0068 : Poly :=
[
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (12, 1), (13, 2)]
]

/-- Partial product 68 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0068 : Poly :=
[
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0068_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0068
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0069 : Poly :=
[
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (15, 2)]
]

/-- Partial product 69 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0069 : Poly :=
[
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (14, 1), (15, 2)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0069_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0069
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0070 : Poly :=
[
  term ((-26085583471366271870051282501593112803019192787664 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (13, 1), (15, 1)]
]

/-- Partial product 70 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0070 : Poly :=
[
  term ((-52171166942732543740102565003186225606038385575328 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((26085583471366271870051282501593112803019192787664 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0070_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0070
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0071 : Poly :=
[
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (13, 2)]
]

/-- Partial product 71 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0071 : Poly :=
[
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (13, 2)],
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0071_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0071
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0072 : Poly :=
[
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (15, 2)]
]

/-- Partial product 72 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0072 : Poly :=
[
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0072_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0072
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0073 : Poly :=
[
  term ((-82658725001970730850595369543980928647965706636256 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1)]
]

/-- Partial product 73 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0073 : Poly :=
[
  term ((82658725001970730850595369543980928647965706636256 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((-165317450003941461701190739087961857295931413272512 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0073_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0073
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0074 : Poly :=
[
  term ((312259859998381562368355293511097144163992191849072 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 74 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0074 : Poly :=
[
  term ((-312259859998381562368355293511097144163992191849072 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (12, 1)],
  term ((624519719996763124736710587022194288327984383698144 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0074_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0074
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0075 : Poly :=
[
  term ((-156129929999190781184177646755548572081996095924536 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 75 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0075 : Poly :=
[
  term ((156129929999190781184177646755548572081996095924536 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-312259859998381562368355293511097144163992191849072 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0075_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0075
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0076 : Poly :=
[
  term ((114099446594650414276435850000363959465941939293440 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 76 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0076 : Poly :=
[
  term ((-114099446594650414276435850000363959465941939293440 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1)],
  term ((228198893189300828552871700000727918931883878586880 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0076_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0076
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0077 : Poly :=
[
  term ((332581581297720186570512397145239195304215225682808 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 77 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0077 : Poly :=
[
  term ((665163162595440373141024794290478390608430451365616 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-332581581297720186570512397145239195304215225682808 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0077_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0077
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0078 : Poly :=
[
  term ((-96572578574272034235389641470437707314640153747432 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (13, 1)]
]

/-- Partial product 78 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0078 : Poly :=
[
  term ((96572578574272034235389641470437707314640153747432 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (13, 1)],
  term ((-193145157148544068470779282940875414629280307494864 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0078_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0078
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0079 : Poly :=
[
  term ((-57049723297325207138217925000181979732970969646720 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 79 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0079 : Poly :=
[
  term ((57049723297325207138217925000181979732970969646720 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-114099446594650414276435850000363959465941939293440 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0079_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0079
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0080 : Poly :=
[
  term ((-166290790648860093285256198572619597652107612841404 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 80 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0080 : Poly :=
[
  term ((166290790648860093285256198572619597652107612841404 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-332581581297720186570512397145239195304215225682808 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0080_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0080
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0081 : Poly :=
[
  term ((-3053291651103466410140264889190198695393710926928 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (3, 1), (8, 1), (15, 1)]
]

/-- Partial product 81 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0081 : Poly :=
[
  term ((-6106583302206932820280529778380397390787421853856 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((3053291651103466410140264889190198695393710926928 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0081_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0081
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0082 : Poly :=
[
  term ((158419571240182102862800304476717233816116887887648 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1)]
]

/-- Partial product 82 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0082 : Poly :=
[
  term ((-158419571240182102862800304476717233816116887887648 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((316839142480364205725600608953434467632233775775296 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0082_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0082
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0083 : Poly :=
[
  term ((-211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 83 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0083 : Poly :=
[
  term ((211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((-422452189973818940967467478604579290176311701033728 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0083_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0083
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0084 : Poly :=
[
  term ((105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 84 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0084 : Poly :=
[
  term ((-105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0084_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0084
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0085 : Poly :=
[
  term ((-71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 85 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0085 : Poly :=
[
  term ((-143507014958346931400442829263161019210543462555520 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0085_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0085
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0086 : Poly :=
[
  term ((-5659199992934652058312811274476902614251486447784 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (13, 1)]
]

/-- Partial product 86 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0086 : Poly :=
[
  term ((5659199992934652058312811274476902614251486447784 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((-11318399985869304116625622548953805228502972895568 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0086_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0086
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0087 : Poly :=
[
  term ((35876753739586732850110707315790254802635865638880 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 87 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0087 : Poly :=
[
  term ((-35876753739586732850110707315790254802635865638880 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0087_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0087
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0088 : Poly :=
[
  term ((17938376869793366425055353657895127401317932819440 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (15, 1)]
]

/-- Partial product 88 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0088 : Poly :=
[
  term ((35876753739586732850110707315790254802635865638880 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17938376869793366425055353657895127401317932819440 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0088_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0088
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0089 : Poly :=
[
  term ((119394327500580756017386508149764750364980901280396 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 89 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0089 : Poly :=
[
  term ((-119394327500580756017386508149764750364980901280396 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1)],
  term ((238788655001161512034773016299529500729961802560792 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0089_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0089
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0090 : Poly :=
[
  term ((-1382632280043302405376853402392961046730973759321378 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 90 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0090 : Poly :=
[
  term ((1382632280043302405376853402392961046730973759321378 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-2765264560086604810753706804785922093461947518642756 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0090_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0090
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0091 : Poly :=
[
  term ((-91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 91 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0091 : Poly :=
[
  term ((91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0091_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0091
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0092 : Poly :=
[
  term ((182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 2)]
]

/-- Partial product 92 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0092 : Poly :=
[
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((365349533028396193295070957370103188904239255984 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0092_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0092
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0093 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 93 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0093 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0093_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0093
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0094 : Poly :=
[
  term ((-108182468440969322739561315509335587928900824437084 : Rat) / 5224580147754654876802295144445267042943203507159) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 94 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0094 : Poly :=
[
  term ((108182468440969322739561315509335587928900824437084 : Rat) / 5224580147754654876802295144445267042943203507159) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-216364936881938645479122631018671175857801648874168 : Rat) / 5224580147754654876802295144445267042943203507159) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0094_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0094
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0095 : Poly :=
[
  term ((-176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 95 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0095 : Poly :=
[
  term ((176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0095_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0095
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0096 : Poly :=
[
  term ((15223197461120125944175957093693498572292578099146 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 96 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0096 : Poly :=
[
  term ((-15223197461120125944175957093693498572292578099146 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0096_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0096
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0097 : Poly :=
[
  term ((31309372747913808341571060820954596757236796123750 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 97 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0097 : Poly :=
[
  term ((62618745495827616683142121641909193514473592247500 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-31309372747913808341571060820954596757236796123750 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0097_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0097
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0098 : Poly :=
[
  term ((353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 2), (13, 1)]
]

/-- Partial product 98 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0098 : Poly :=
[
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((707416568886832568513902270002256548688840023619328 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0098_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0098
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0099 : Poly :=
[
  term ((-30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 2), (15, 1)]
]

/-- Partial product 99 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0099 : Poly :=
[
  term ((-60892789844480503776703828374773994289170312396584 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0099_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0099
        rs_R009_ueqv_R009NYNYN_generator_28_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_28_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0000,
  rs_R009_ueqv_R009NYNYN_partial_28_0001,
  rs_R009_ueqv_R009NYNYN_partial_28_0002,
  rs_R009_ueqv_R009NYNYN_partial_28_0003,
  rs_R009_ueqv_R009NYNYN_partial_28_0004,
  rs_R009_ueqv_R009NYNYN_partial_28_0005,
  rs_R009_ueqv_R009NYNYN_partial_28_0006,
  rs_R009_ueqv_R009NYNYN_partial_28_0007,
  rs_R009_ueqv_R009NYNYN_partial_28_0008,
  rs_R009_ueqv_R009NYNYN_partial_28_0009,
  rs_R009_ueqv_R009NYNYN_partial_28_0010,
  rs_R009_ueqv_R009NYNYN_partial_28_0011,
  rs_R009_ueqv_R009NYNYN_partial_28_0012,
  rs_R009_ueqv_R009NYNYN_partial_28_0013,
  rs_R009_ueqv_R009NYNYN_partial_28_0014,
  rs_R009_ueqv_R009NYNYN_partial_28_0015,
  rs_R009_ueqv_R009NYNYN_partial_28_0016,
  rs_R009_ueqv_R009NYNYN_partial_28_0017,
  rs_R009_ueqv_R009NYNYN_partial_28_0018,
  rs_R009_ueqv_R009NYNYN_partial_28_0019,
  rs_R009_ueqv_R009NYNYN_partial_28_0020,
  rs_R009_ueqv_R009NYNYN_partial_28_0021,
  rs_R009_ueqv_R009NYNYN_partial_28_0022,
  rs_R009_ueqv_R009NYNYN_partial_28_0023,
  rs_R009_ueqv_R009NYNYN_partial_28_0024,
  rs_R009_ueqv_R009NYNYN_partial_28_0025,
  rs_R009_ueqv_R009NYNYN_partial_28_0026,
  rs_R009_ueqv_R009NYNYN_partial_28_0027,
  rs_R009_ueqv_R009NYNYN_partial_28_0028,
  rs_R009_ueqv_R009NYNYN_partial_28_0029,
  rs_R009_ueqv_R009NYNYN_partial_28_0030,
  rs_R009_ueqv_R009NYNYN_partial_28_0031,
  rs_R009_ueqv_R009NYNYN_partial_28_0032,
  rs_R009_ueqv_R009NYNYN_partial_28_0033,
  rs_R009_ueqv_R009NYNYN_partial_28_0034,
  rs_R009_ueqv_R009NYNYN_partial_28_0035,
  rs_R009_ueqv_R009NYNYN_partial_28_0036,
  rs_R009_ueqv_R009NYNYN_partial_28_0037,
  rs_R009_ueqv_R009NYNYN_partial_28_0038,
  rs_R009_ueqv_R009NYNYN_partial_28_0039,
  rs_R009_ueqv_R009NYNYN_partial_28_0040,
  rs_R009_ueqv_R009NYNYN_partial_28_0041,
  rs_R009_ueqv_R009NYNYN_partial_28_0042,
  rs_R009_ueqv_R009NYNYN_partial_28_0043,
  rs_R009_ueqv_R009NYNYN_partial_28_0044,
  rs_R009_ueqv_R009NYNYN_partial_28_0045,
  rs_R009_ueqv_R009NYNYN_partial_28_0046,
  rs_R009_ueqv_R009NYNYN_partial_28_0047,
  rs_R009_ueqv_R009NYNYN_partial_28_0048,
  rs_R009_ueqv_R009NYNYN_partial_28_0049,
  rs_R009_ueqv_R009NYNYN_partial_28_0050,
  rs_R009_ueqv_R009NYNYN_partial_28_0051,
  rs_R009_ueqv_R009NYNYN_partial_28_0052,
  rs_R009_ueqv_R009NYNYN_partial_28_0053,
  rs_R009_ueqv_R009NYNYN_partial_28_0054,
  rs_R009_ueqv_R009NYNYN_partial_28_0055,
  rs_R009_ueqv_R009NYNYN_partial_28_0056,
  rs_R009_ueqv_R009NYNYN_partial_28_0057,
  rs_R009_ueqv_R009NYNYN_partial_28_0058,
  rs_R009_ueqv_R009NYNYN_partial_28_0059,
  rs_R009_ueqv_R009NYNYN_partial_28_0060,
  rs_R009_ueqv_R009NYNYN_partial_28_0061,
  rs_R009_ueqv_R009NYNYN_partial_28_0062,
  rs_R009_ueqv_R009NYNYN_partial_28_0063,
  rs_R009_ueqv_R009NYNYN_partial_28_0064,
  rs_R009_ueqv_R009NYNYN_partial_28_0065,
  rs_R009_ueqv_R009NYNYN_partial_28_0066,
  rs_R009_ueqv_R009NYNYN_partial_28_0067,
  rs_R009_ueqv_R009NYNYN_partial_28_0068,
  rs_R009_ueqv_R009NYNYN_partial_28_0069,
  rs_R009_ueqv_R009NYNYN_partial_28_0070,
  rs_R009_ueqv_R009NYNYN_partial_28_0071,
  rs_R009_ueqv_R009NYNYN_partial_28_0072,
  rs_R009_ueqv_R009NYNYN_partial_28_0073,
  rs_R009_ueqv_R009NYNYN_partial_28_0074,
  rs_R009_ueqv_R009NYNYN_partial_28_0075,
  rs_R009_ueqv_R009NYNYN_partial_28_0076,
  rs_R009_ueqv_R009NYNYN_partial_28_0077,
  rs_R009_ueqv_R009NYNYN_partial_28_0078,
  rs_R009_ueqv_R009NYNYN_partial_28_0079,
  rs_R009_ueqv_R009NYNYN_partial_28_0080,
  rs_R009_ueqv_R009NYNYN_partial_28_0081,
  rs_R009_ueqv_R009NYNYN_partial_28_0082,
  rs_R009_ueqv_R009NYNYN_partial_28_0083,
  rs_R009_ueqv_R009NYNYN_partial_28_0084,
  rs_R009_ueqv_R009NYNYN_partial_28_0085,
  rs_R009_ueqv_R009NYNYN_partial_28_0086,
  rs_R009_ueqv_R009NYNYN_partial_28_0087,
  rs_R009_ueqv_R009NYNYN_partial_28_0088,
  rs_R009_ueqv_R009NYNYN_partial_28_0089,
  rs_R009_ueqv_R009NYNYN_partial_28_0090,
  rs_R009_ueqv_R009NYNYN_partial_28_0091,
  rs_R009_ueqv_R009NYNYN_partial_28_0092,
  rs_R009_ueqv_R009NYNYN_partial_28_0093,
  rs_R009_ueqv_R009NYNYN_partial_28_0094,
  rs_R009_ueqv_R009NYNYN_partial_28_0095,
  rs_R009_ueqv_R009NYNYN_partial_28_0096,
  rs_R009_ueqv_R009NYNYN_partial_28_0097,
  rs_R009_ueqv_R009NYNYN_partial_28_0098,
  rs_R009_ueqv_R009NYNYN_partial_28_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0000_0099 : Poly :=
[
  term ((809285644874120282110073302040092694725593031747645483298142517470490756268141967733 : Rat) / 6416897752399038656562248605798617971555095569915659164757690382855929555466240000) [],
  term ((17127002608606982881582071430988332166854766121964 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((-2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((240007942040352965294909133214036433484342227073596 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1)],
  term ((-13807850239117351545628538306684288519310595247054 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((-55125120028504083102078553994479711283611904087856 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((91875200047506805170130923324132852139353173479760 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-73500160038005444136104738659306281711482538783808 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((32209460480610043349763622779575219645588849168096 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((114099446594650414276435850000363959465941939293440 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (14, 2)],
  term ((108001251151409585028791650004119266807276209204200 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 2), (13, 1)],
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-86401000921127668023033320003295413445820967363360 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (12, 2), (15, 1)],
  term ((171008447500057459537069734285121472006192713702340 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((-324901978010917356932674091070188350092494136510664 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 2)],
  term ((281741631859077727098597696367364075194245737742010 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-138170784650753623923579056933579055926940963640900 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((293884819988880201334329108846270573736121557153120 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-587769639977760402668658217692541147472243114306240 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((293884819988880201334329108846270573736121557153120 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-576322883497016373418933794288685100099143191966560 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((288161441748508186709466897144342550049571595983280 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 2)],
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (8, 1), (13, 2), (14, 1)],
  term ((103660443689146089854918022381471780647586661280656 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 2)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-28387544638268997602582018823467103789348653272696 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((45365144617072953777520452646897811632103112616048 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 2)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((422452189973818940967467478604579290176311701033728 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((143507014958346931400442829263161019210543462555520 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (14, 1), (15, 2)],
  term ((35876753739586732850110707315790254802635865638880 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((419841309839790197936252583791716004922638354056424 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-674307259594068146566269505599992875994440995849280 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((171778269711521823976899090816557304146384785661072 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-85889134855760911988449545408278652073192392830536 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-533124719376341451236477695627582629538949447141386 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((1052468158745556881697435752756545331256995918260808 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-26000535362311661700625503231505704596070791350496 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((13000267681155830850312751615752852298035395675248 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((105613047493454735241866869651144822544077925258432 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 2)],
  term ((-211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((256255954370621740492412176077676118613466173899 : Rat) / 48568474149113657553274988062572203586457403121) [(0, 1), (2, 1), (12, 1)],
  term ((1830323357618358762361887246117226996548304975630816 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-882761303463756505672306128057377718231969625054148 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 746368592536379268114613592063609577563314786737) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((-912795572757203314211486800002911675727535514347520 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 1), (13, 2), (14, 2)],
  term ((-512511908741243480984824352155352237226932347798 : Rat) / 48568474149113657553274988062572203586457403121) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((-284817679415303225498046392686894900981994026705048 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (14, 1), (15, 2)],
  term ((142408839707651612749023196343447450490997013352524 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (12, 2), (13, 1), (15, 1)],
  term ((43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 2), (14, 1), (15, 2)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (12, 2), (15, 2)],
  term ((-535681641024187942512205467644917839957538588495402 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (14, 2), (15, 1)],
  term ((265140789233308731630382942572355938308587389017596 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-34159165370412267341913174336439129985201242490804 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (2, 1), (13, 2)],
  term ((461113398196574180645319063210093225872926103977240 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 2), (14, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (13, 2), (14, 2)],
  term ((-40976044576170617123055109688279482488192628051540 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (14, 1)],
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-222462965790340752964644558467115049149901603366664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (14, 2)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (15, 2)],
  term ((-2069773019820520474928340839703935368962395978389 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 2)],
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((73500160038005444136104738659306281711482538783808 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-73500160038005444136104738659306281711482538783808 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (13, 1), (14, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-50518334992452829108689699997141337913309359788768 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((25259167496226414554344849998570668956654679894384 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (12, 1), (13, 2), (14, 1)],
  term ((-43200500460563834011516660001647706722910483681680 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (14, 1), (15, 2)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((-52171166942732543740102565003186225606038385575328 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((26085583471366271870051282501593112803019192787664 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (13, 2)],
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (13, 2), (14, 1)],
  term ((4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 2), (14, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (15, 2)],
  term ((82658725001970730850595369543980928647965706636256 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((-312259859998381562368355293511097144163992191849072 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (12, 1)],
  term ((624519719996763124736710587022194288327984383698144 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-312259859998381562368355293511097144163992191849072 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 2)],
  term ((-114099446594650414276435850000363959465941939293440 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1)],
  term ((228198893189300828552871700000727918931883878586880 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((665163162595440373141024794290478390608430451365616 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-332581581297720186570512397145239195304215225682808 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((96572578574272034235389641470437707314640153747432 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (13, 1)],
  term ((-45365144617072953777520452646897811632103112616048 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-114099446594650414276435850000363959465941939293440 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (13, 1), (14, 2)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-332581581297720186570512397145239195304215225682808 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (8, 1), (14, 2), (15, 1)],
  term ((3053291651103466410140264889190198695393710926928 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((-158419571240182102862800304476717233816116887887648 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((-422452189973818940967467478604579290176311701033728 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((211226094986909470483733739302289645088155850516864 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-143507014958346931400442829263161019210543462555520 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((5659199992934652058312811274476902614251486447784 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((-11318399985869304116625622548953805228502972895568 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((71753507479173465700221414631580509605271731277760 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-17938376869793366425055353657895127401317932819440 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-119394327500580756017386508149764750364980901280396 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1)],
  term ((1382632280043302405376853402392961046730973759321378 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-2638031585209465836438698343881783657926046197746328 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((365349533028396193295070957370103188904239255984 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((229601134996410831517759923967116215516026485212816 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((108182468440969322739561315509335587928900824437084 : Rat) / 5224580147754654876802295144445267042943203507159) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-1337700415951862376225382849630134093832401536214344 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 2)],
  term ((16949153112467238850614250360828697797595857950062 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-31309372747913808341571060820954596757236796123750 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((707416568886832568513902270002256548688840023619328 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-60892789844480503776703828374773994289170312396584 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((30446394922240251888351914187386997144585156198292 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-34254005217213965763164142861976664333709532243928 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (14, 1)],
  term ((-809285644874120282110073302040092694725593031747645483298142517470490756268141967733 : Rat) / 3208448876199519328281124302899308985777547784957829582378845191427964777733120000) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0000_0099
      rs_R009_ueqv_R009NYNYN_block_28_0000_0099 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
