/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 13:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0000 : Poly :=
[
  term ((-888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 348223999587520751950196641204646206569263088857178627852811850921499365376000) []
]

/-- Partial product 0 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0000 : Poly :=
[
  term ((-888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 174111999793760375975098320602323103284631544428589313926405925460749682688000) [(2, 1), (4, 1)],
  term ((888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 348223999587520751950196641204646206569263088857178627852811850921499365376000) [(2, 2)],
  term ((-888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 174111999793760375975098320602323103284631544428589313926405925460749682688000) [(3, 1), (5, 1)],
  term ((888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 348223999587520751950196641204646206569263088857178627852811850921499365376000) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0000_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0000
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0001 : Poly :=
[
  term ((-16480369433574628132561767347991532916182009141445 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1)]
]

/-- Partial product 1 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0001 : Poly :=
[
  term ((-32960738867149256265123534695983065832364018282890 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (4, 1)],
  term ((16480369433574628132561767347991532916182009141445 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2)],
  term ((-32960738867149256265123534695983065832364018282890 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (5, 1)],
  term ((16480369433574628132561767347991532916182009141445 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0001_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0001
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0002 : Poly :=
[
  term ((-4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1)]
]

/-- Partial product 2 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0002 : Poly :=
[
  term ((-8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (3, 1), (5, 1)],
  term ((4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (3, 2)],
  term ((-8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 2), (4, 1)],
  term ((4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0002_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0002
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0003 : Poly :=
[
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (13, 1)]
]

/-- Partial product 3 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0003 : Poly :=
[
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 2), (11, 1), (13, 1)],
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0003_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0003
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0004 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 4 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0004 : Poly :=
[
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (4, 1), (11, 1), (15, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0004_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0004
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0005 : Poly :=
[
  term ((-12629583748113207277172424999285334478327339947192 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (13, 1), (15, 1)]
]

/-- Partial product 5 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0005 : Poly :=
[
  term ((-25259167496226414554344849998570668956654679894384 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((12629583748113207277172424999285334478327339947192 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-25259167496226414554344849998570668956654679894384 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (4, 1), (13, 1), (15, 1)],
  term ((12629583748113207277172424999285334478327339947192 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0005_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0005
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0006 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (13, 2)]
]

/-- Partial product 6 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0006 : Poly :=
[
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (5, 1), (13, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 2), (13, 2)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (4, 1), (13, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0006_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0006
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0007 : Poly :=
[
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (15, 2)]
]

/-- Partial product 7 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0007 : Poly :=
[
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (5, 1), (15, 2)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 2), (15, 2)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (4, 1), (15, 2)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0007_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0007
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0008 : Poly :=
[
  term ((-2829599996467326029156405637238451307125743223892 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1)]
]

/-- Partial product 8 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0008 : Poly :=
[
  term ((-5659199992934652058312811274476902614251486447784 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (4, 1), (8, 1)],
  term ((2829599996467326029156405637238451307125743223892 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (8, 1)],
  term ((-5659199992934652058312811274476902614251486447784 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (5, 1), (8, 1)],
  term ((2829599996467326029156405637238451307125743223892 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0008_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0008
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0009 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 9 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0009 : Poly :=
[
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0009_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0009
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0010 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 10 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0010 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0010_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0010
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0011 : Poly :=
[
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 11 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0011 : Poly :=
[
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0011_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0011
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0012 : Poly :=
[
  term ((2233179259962788955646838516852669656267923257875 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (10, 1)]
]

/-- Partial product 12 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0012 : Poly :=
[
  term ((4466358519925577911293677033705339312535846515750 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (2, 1), (4, 1), (10, 1)],
  term ((-2233179259962788955646838516852669656267923257875 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (2, 2), (10, 1)],
  term ((4466358519925577911293677033705339312535846515750 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (3, 1), (5, 1), (10, 1)],
  term ((-2233179259962788955646838516852669656267923257875 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0012_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0012
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0013 : Poly :=
[
  term ((-91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 13 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0013 : Poly :=
[
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0013_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0013
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0014 : Poly :=
[
  term ((-306355864512478627006043068269529196251694431508128 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 14 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0014 : Poly :=
[
  term ((-612711729024957254012086136539058392503388863016256 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((306355864512478627006043068269529196251694431508128 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-612711729024957254012086136539058392503388863016256 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((306355864512478627006043068269529196251694431508128 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0014_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0014
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0015 : Poly :=
[
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 2)]
]

/-- Partial product 15 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0015 : Poly :=
[
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 2)],
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (5, 1), (11, 2)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0015_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0015
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0016 : Poly :=
[
  term ((20697730198205204749283408397039353689623959783890 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (12, 1)]
]

/-- Partial product 16 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0016 : Poly :=
[
  term ((41395460396410409498566816794078707379247919567780 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (2, 1), (4, 1), (12, 1)],
  term ((-20697730198205204749283408397039353689623959783890 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (2, 2), (12, 1)],
  term ((41395460396410409498566816794078707379247919567780 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((-20697730198205204749283408397039353689623959783890 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0016_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0016
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0017 : Poly :=
[
  term ((525125778044893814769186691530088420917841547970382 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 17 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0017 : Poly :=
[
  term ((1050251556089787629538373383060176841835683095940764 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-525125778044893814769186691530088420917841547970382 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((1050251556089787629538373383060176841835683095940764 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-525125778044893814769186691530088420917841547970382 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0017_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0017
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0018 : Poly :=
[
  term ((-176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (13, 2)]
]

/-- Partial product 18 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0018 : Poly :=
[
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (4, 1), (13, 2)],
  term ((176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 2), (13, 2)],
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0018_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0018
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0019 : Poly :=
[
  term ((-54217680965502345498149316340438008250761034275550 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (15, 2)]
]

/-- Partial product 19 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0019 : Poly :=
[
  term ((-108435361931004690996298632680876016501522068551100 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((54217680965502345498149316340438008250761034275550 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (15, 2)],
  term ((-108435361931004690996298632680876016501522068551100 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((54217680965502345498149316340438008250761034275550 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0019_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0019
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0020 : Poly :=
[
  term ((733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (13, 1)]
]

/-- Partial product 20 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0020 : Poly :=
[
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 2), (10, 1), (13, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (4, 1), (10, 1), (13, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0020_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0020
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0021 : Poly :=
[
  term ((22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0021 : Poly :=
[
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0021_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0021
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0022 : Poly :=
[
  term ((-366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 22 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0022 : Poly :=
[
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 2), (10, 1), (15, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (4, 1), (10, 1), (15, 1)],
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0022_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0022
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0023 : Poly :=
[
  term ((-11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0023 : Poly :=
[
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (2, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0023_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0023
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0024 : Poly :=
[
  term ((1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 24 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0024 : Poly :=
[
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((-1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((-1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0024_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0024
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0025 : Poly :=
[
  term ((-124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0025 : Poly :=
[
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0025_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0025
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0026 : Poly :=
[
  term ((10475727548036798644727911133257580363027182524536 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 26 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0026 : Poly :=
[
  term ((20951455096073597289455822266515160726054365049072 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)],
  term ((-10475727548036798644727911133257580363027182524536 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((20951455096073597289455822266515160726054365049072 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((-10475727548036798644727911133257580363027182524536 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0026_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0026
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0027 : Poly :=
[
  term ((96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 27 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0027 : Poly :=
[
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (13, 1), (16, 1)],
  term ((-96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0027_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0027
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0028 : Poly :=
[
  term ((36465172367971866891323502946777506132047090505142 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 28 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0028 : Poly :=
[
  term ((72930344735943733782647005893555012264094181010284 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((-36465172367971866891323502946777506132047090505142 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((72930344735943733782647005893555012264094181010284 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-36465172367971866891323502946777506132047090505142 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0028_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0028
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0029 : Poly :=
[
  term ((72506806606940935239 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0029 : Poly :=
[
  term ((72506806606940935239 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-72506806606940935239 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((72506806606940935239 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-72506806606940935239 : Rat) / 247957615123279904066) [(1, 1), (2, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0029_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0029
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0030 : Poly :=
[
  term ((-15263373153136166179658883769356218303568283950 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 1)]
]

/-- Partial product 30 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0030 : Poly :=
[
  term ((-30526746306272332359317767538712436607136567900 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((15263373153136166179658883769356218303568283950 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 2), (3, 1)],
  term ((-30526746306272332359317767538712436607136567900 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 2), (5, 1)],
  term ((15263373153136166179658883769356218303568283950 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0030_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0030
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0031 : Poly :=
[
  term ((-22294404263932086866 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 31 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0031 : Poly :=
[
  term ((-44588808527864173732 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((22294404263932086866 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (3, 1), (10, 1), (16, 1)],
  term ((-44588808527864173732 : Rat) / 17711258223091421719) [(1, 1), (3, 2), (5, 1), (10, 1), (16, 1)],
  term ((22294404263932086866 : Rat) / 17711258223091421719) [(1, 1), (3, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0031_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0031
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0032 : Poly :=
[
  term ((124420536996222728019 : Rat) / 495915230246559808132) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 32 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0032 : Poly :=
[
  term ((124420536996222728019 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((-124420536996222728019 : Rat) / 495915230246559808132) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((124420536996222728019 : Rat) / 247957615123279904066) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-124420536996222728019 : Rat) / 495915230246559808132) [(1, 1), (3, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0032_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0032
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0033 : Poly :=
[
  term ((220244598618700897380655980903072974531507145360 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 33 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0033 : Poly :=
[
  term ((440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1)],
  term ((-220244598618700897380655980903072974531507145360 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (8, 1), (11, 1)],
  term ((440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1)],
  term ((-220244598618700897380655980903072974531507145360 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0033_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0033
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0034 : Poly :=
[
  term ((1854061799617206885 : Rat) / 17711258223091421719) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0034 : Poly :=
[
  term ((3708123599234413770 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1854061799617206885 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (8, 1), (11, 1), (16, 1)],
  term ((3708123599234413770 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1854061799617206885 : Rat) / 17711258223091421719) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0034_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0034
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0035 : Poly :=
[
  term ((-64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0035 : Poly :=
[
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (8, 1), (13, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0035_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0035
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0036 : Poly :=
[
  term ((32413409066683662277 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0036 : Poly :=
[
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-32413409066683662277 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-32413409066683662277 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0036_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0036
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0037 : Poly :=
[
  term ((-60908564361845621745233011650117742797290135240 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (9, 1)]
]

/-- Partial product 37 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0037 : Poly :=
[
  term ((-121817128723691243490466023300235485594580270480 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((60908564361845621745233011650117742797290135240 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 2), (9, 1)],
  term ((-121817128723691243490466023300235485594580270480 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((60908564361845621745233011650117742797290135240 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0037_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0037
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0038 : Poly :=
[
  term ((-586965858123180063665955792964699525649745252240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 38 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0038 : Poly :=
[
  term ((-1173931716246360127331911585929399051299490504480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (9, 1), (10, 1)],
  term ((586965858123180063665955792964699525649745252240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-1173931716246360127331911585929399051299490504480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 1)],
  term ((586965858123180063665955792964699525649745252240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0038_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0038
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0039 : Poly :=
[
  term ((-24028798380516675727 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 39 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0039 : Poly :=
[
  term ((-48057596761033351454 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((24028798380516675727 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (9, 1), (10, 1), (16, 1)],
  term ((-48057596761033351454 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((24028798380516675727 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0039_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0039
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0040 : Poly :=
[
  term ((146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 40 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0040 : Poly :=
[
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (9, 1), (12, 1)],
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1)],
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0040_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0040
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0041 : Poly :=
[
  term ((1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 41 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0041 : Poly :=
[
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (9, 1), (12, 1), (16, 1)],
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0041_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0041
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0042 : Poly :=
[
  term ((-83043861012918301247 : Rat) / 247957615123279904066) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 42 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0042 : Poly :=
[
  term ((-83043861012918301247 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (9, 1), (16, 1)],
  term ((83043861012918301247 : Rat) / 247957615123279904066) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-83043861012918301247 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((83043861012918301247 : Rat) / 247957615123279904066) [(1, 1), (3, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0042_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0042
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0043 : Poly :=
[
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 43 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0043 : Poly :=
[
  term ((-52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1)],
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((-52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0043_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0043
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0044 : Poly :=
[
  term ((7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 44 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0044 : Poly :=
[
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0044_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0044
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0045 : Poly :=
[
  term ((195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0045 : Poly :=
[
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0045_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0045
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0046 : Poly :=
[
  term ((-3924975828260211469885674910094653239703739403200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 46 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0046 : Poly :=
[
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((3924975828260211469885674910094653239703739403200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((3924975828260211469885674910094653239703739403200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0046_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0046
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0047 : Poly :=
[
  term ((-97604741260867448312 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0047 : Poly :=
[
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((97604741260867448312 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((97604741260867448312 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0047_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0047
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0048 : Poly :=
[
  term ((-6468847618320680741787276835718512923953575964960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 48 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0048 : Poly :=
[
  term ((-12937695236641361483574553671437025847907151929920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (10, 1), (13, 1)],
  term ((6468847618320680741787276835718512923953575964960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((-12937695236641361483574553671437025847907151929920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((6468847618320680741787276835718512923953575964960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0048_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0048
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0049 : Poly :=
[
  term ((169436842575973162192 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0049 : Poly :=
[
  term ((338873685151946324384 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-169436842575973162192 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((338873685151946324384 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-169436842575973162192 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0049_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0049
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0050 : Poly :=
[
  term ((-9267705869530276177889762752356853542288102264760 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 50 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0050 : Poly :=
[
  term ((-18535411739060552355779525504713707084576204529520 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1)],
  term ((9267705869530276177889762752356853542288102264760 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-18535411739060552355779525504713707084576204529520 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((9267705869530276177889762752356853542288102264760 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0050_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0050
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0051 : Poly :=
[
  term ((-5243334006560763420 : Rat) / 17711258223091421719) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0051 : Poly :=
[
  term ((-10486668013121526840 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((5243334006560763420 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-10486668013121526840 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((5243334006560763420 : Rat) / 17711258223091421719) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0051_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0051
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0052 : Poly :=
[
  term ((24166888983583965916373133246133907767964677594869 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 1)]
]

/-- Partial product 52 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0052 : Poly :=
[
  term ((48333777967167931832746266492267815535929355189738 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-24166888983583965916373133246133907767964677594869 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (11, 1)],
  term ((48333777967167931832746266492267815535929355189738 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-24166888983583965916373133246133907767964677594869 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0052_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0052
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0053 : Poly :=
[
  term ((-569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 53 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0053 : Poly :=
[
  term ((-1139860887411616415584844440855659116238848957112464 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((-1139860887411616415584844440855659116238848957112464 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0053_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0053
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0054 : Poly :=
[
  term ((207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 54 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0054 : Poly :=
[
  term ((415262605870951993020 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((415262605870951993020 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0054_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0054
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0055 : Poly :=
[
  term ((-49529824177289902144 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0055 : Poly :=
[
  term ((-99059648354579804288 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((49529824177289902144 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-99059648354579804288 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((49529824177289902144 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0055_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0055
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0056 : Poly :=
[
  term ((-308744519292332671819022535804973793089152669397136 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 56 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0056 : Poly :=
[
  term ((-617489038584665343638045071609947586178305338794272 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((308744519292332671819022535804973793089152669397136 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-617489038584665343638045071609947586178305338794272 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((308744519292332671819022535804973793089152669397136 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0056_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0056
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0057 : Poly :=
[
  term ((143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0057 : Poly :=
[
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0057_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0057
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0058 : Poly :=
[
  term ((17238659552139249853785264153564677473514306722322 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 58 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0058 : Poly :=
[
  term ((34477319104278499707570528307129354947028613444644 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-17238659552139249853785264153564677473514306722322 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((34477319104278499707570528307129354947028613444644 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-17238659552139249853785264153564677473514306722322 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0058_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0058
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0059 : Poly :=
[
  term ((-1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0059 : Poly :=
[
  term ((-1115361852418127920205 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1115361852418127920205 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0059_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0059
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0060 : Poly :=
[
  term ((571975492781743400244545827680773289262604404655791 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 1)]
]

/-- Partial product 60 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0060 : Poly :=
[
  term ((1143950985563486800489091655361546578525208809311582 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-571975492781743400244545827680773289262604404655791 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 2), (13, 1)],
  term ((1143950985563486800489091655361546578525208809311582 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-571975492781743400244545827680773289262604404655791 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0060_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0060
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0061 : Poly :=
[
  term ((-608507806358697534579 : Rat) / 495915230246559808132) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0061 : Poly :=
[
  term ((-608507806358697534579 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((608507806358697534579 : Rat) / 495915230246559808132) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-608507806358697534579 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((608507806358697534579 : Rat) / 495915230246559808132) [(1, 1), (3, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0061_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0061
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0062 : Poly :=
[
  term ((51646414824205716341830470225748614862163826314153 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (15, 1)]
]

/-- Partial product 62 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0062 : Poly :=
[
  term ((103292829648411432683660940451497229724327652628306 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-51646414824205716341830470225748614862163826314153 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (15, 1)],
  term ((103292829648411432683660940451497229724327652628306 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-51646414824205716341830470225748614862163826314153 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0062_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0062
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0063 : Poly :=
[
  term ((13296496702222932943 : Rat) / 123978807561639952033) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0063 : Poly :=
[
  term ((26592993404445865886 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-13296496702222932943 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((26592993404445865886 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-13296496702222932943 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0063_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0063
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0064 : Poly :=
[
  term ((-87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1)]
]

/-- Partial product 64 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0064 : Poly :=
[
  term ((-87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (3, 1), (5, 1)],
  term ((87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (3, 2)],
  term ((-87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2), (4, 1)],
  term ((87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0064_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0064
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0065 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 65 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0065 : Poly :=
[
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 2), (10, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 2), (5, 1), (10, 1), (13, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 3), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0065_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0065
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0066 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 66 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0066 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 2), (10, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 2), (5, 1), (10, 1), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 3), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0066_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0066
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0067 : Poly :=
[
  term ((3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 67 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0067 : Poly :=
[
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0067_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0067
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0068 : Poly :=
[
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 68 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0068 : Poly :=
[
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 2), (13, 1)],
  term ((-9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 2), (5, 1), (13, 1)],
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((-9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0068_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0068
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0069 : Poly :=
[
  term ((-9723296525400079459861883668243543548433729734271283200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 69 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0069 : Poly :=
[
  term ((-19446593050800158919723767336487087096867459468542566400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((9723296525400079459861883668243543548433729734271283200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-19446593050800158919723767336487087096867459468542566400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((9723296525400079459861883668243543548433729734271283200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0069_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0069
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0070 : Poly :=
[
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 1), (8, 1)]
]

/-- Partial product 70 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0070 : Poly :=
[
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 1), (3, 1), (5, 1), (8, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 1), (3, 2), (8, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 2), (4, 1), (8, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0070_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0070
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0071 : Poly :=
[
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 71 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0071 : Poly :=
[
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (3, 2), (8, 1), (16, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 2), (4, 1), (8, 1), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0071_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0071
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0072 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 72 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0072 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 2), (9, 1), (10, 1), (13, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 3), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0072_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0072
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0073 : Poly :=
[
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0073 : Poly :=
[
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 3), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0073_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0073
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0074 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 74 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0074 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 2), (9, 1), (10, 1), (15, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 3), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0074_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0074
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0075 : Poly :=
[
  term ((-176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0075 : Poly :=
[
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 3), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0075_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0075
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0076 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 76 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0076 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0076_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0076
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0077 : Poly :=
[
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 77 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0077 : Poly :=
[
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0077_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0077
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0078 : Poly :=
[
  term ((-1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 78 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0078 : Poly :=
[
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0078_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0078
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0079 : Poly :=
[
  term ((6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 79 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0079 : Poly :=
[
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0079_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0079
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0080 : Poly :=
[
  term ((125620454843925422812187724059615263036463 : Rat) / 1884151189316568960391088960779323775500) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 80 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0080 : Poly :=
[
  term ((125620454843925422812187724059615263036463 : Rat) / 942075594658284480195544480389661887750) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-125620454843925422812187724059615263036463 : Rat) / 1884151189316568960391088960779323775500) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((125620454843925422812187724059615263036463 : Rat) / 942075594658284480195544480389661887750) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-125620454843925422812187724059615263036463 : Rat) / 1884151189316568960391088960779323775500) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0080_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0080
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0081 : Poly :=
[
  term ((-320580275395723216452 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0081 : Poly :=
[
  term ((-641160550791446432904 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((320580275395723216452 : Rat) / 619894037808199760165) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-641160550791446432904 : Rat) / 619894037808199760165) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((320580275395723216452 : Rat) / 619894037808199760165) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0081_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0081
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0082 : Poly :=
[
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (10, 1)]
]

/-- Partial product 82 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0082 : Poly :=
[
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (3, 1), (5, 1), (10, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (3, 2), (10, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 2), (4, 1), (10, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0082_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0082
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0083 : Poly :=
[
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 83 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0083 : Poly :=
[
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 2), (10, 1), (11, 1), (13, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 3), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0083_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0083
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0084 : Poly :=
[
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 84 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0084 : Poly :=
[
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0084_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0084
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0085 : Poly :=
[
  term ((6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 85 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0085 : Poly :=
[
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 2), (10, 1), (11, 1), (15, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 3), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0085_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0085
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0086 : Poly :=
[
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0086 : Poly :=
[
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0086_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0086
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0087 : Poly :=
[
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 87 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0087 : Poly :=
[
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (3, 2), (10, 1), (13, 1), (15, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 3), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0087_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0087
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0088 : Poly :=
[
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0088 : Poly :=
[
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0088_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0088
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0089 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 2)]
]

/-- Partial product 89 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0089 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (3, 2), (10, 1), (13, 2)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 2), (4, 1), (10, 1), (13, 2)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 3), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0089_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0089
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0090 : Poly :=
[
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 90 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0090 : Poly :=
[
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (3, 2), (10, 1), (13, 2), (16, 1)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 3), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0090_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0090
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0091 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 91 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0091 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (3, 1), (5, 1), (10, 1), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (3, 2), (10, 1), (15, 2)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 2), (4, 1), (10, 1), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 3), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0091_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0091
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0092 : Poly :=
[
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 92 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0092 : Poly :=
[
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 3), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0092_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0092
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0093 : Poly :=
[
  term ((-6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 93 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0093 : Poly :=
[
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0093_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0093
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0094 : Poly :=
[
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 94 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0094 : Poly :=
[
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0094_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0094
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0095 : Poly :=
[
  term ((-39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 95 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0095 : Poly :=
[
  term ((-78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0095_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0095
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0096 : Poly :=
[
  term ((2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 96 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0096 : Poly :=
[
  term ((2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0096_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0096
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0097 : Poly :=
[
  term ((13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0097 : Poly :=
[
  term ((26307209962806111186576 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((26307209962806111186576 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0097_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0097
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0098 : Poly :=
[
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (11, 2)]
]

/-- Partial product 98 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0098 : Poly :=
[
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (5, 1), (11, 2)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 2), (11, 2)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (4, 1), (11, 2)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0098_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0098
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NYNYN_coefficient_13_0099 : Poly :=
[
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 99 for generator 13. -/
def rs_R009_ueqv_R009NYNYN_partial_13_0099 : Poly :=
[
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (3, 2), (11, 2), (16, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 13. -/
theorem rs_R009_ueqv_R009NYNYN_partial_13_0099_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_13_0099
        rs_R009_ueqv_R009NYNYN_generator_13_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_13_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_13_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_13_0000,
  rs_R009_ueqv_R009NYNYN_partial_13_0001,
  rs_R009_ueqv_R009NYNYN_partial_13_0002,
  rs_R009_ueqv_R009NYNYN_partial_13_0003,
  rs_R009_ueqv_R009NYNYN_partial_13_0004,
  rs_R009_ueqv_R009NYNYN_partial_13_0005,
  rs_R009_ueqv_R009NYNYN_partial_13_0006,
  rs_R009_ueqv_R009NYNYN_partial_13_0007,
  rs_R009_ueqv_R009NYNYN_partial_13_0008,
  rs_R009_ueqv_R009NYNYN_partial_13_0009,
  rs_R009_ueqv_R009NYNYN_partial_13_0010,
  rs_R009_ueqv_R009NYNYN_partial_13_0011,
  rs_R009_ueqv_R009NYNYN_partial_13_0012,
  rs_R009_ueqv_R009NYNYN_partial_13_0013,
  rs_R009_ueqv_R009NYNYN_partial_13_0014,
  rs_R009_ueqv_R009NYNYN_partial_13_0015,
  rs_R009_ueqv_R009NYNYN_partial_13_0016,
  rs_R009_ueqv_R009NYNYN_partial_13_0017,
  rs_R009_ueqv_R009NYNYN_partial_13_0018,
  rs_R009_ueqv_R009NYNYN_partial_13_0019,
  rs_R009_ueqv_R009NYNYN_partial_13_0020,
  rs_R009_ueqv_R009NYNYN_partial_13_0021,
  rs_R009_ueqv_R009NYNYN_partial_13_0022,
  rs_R009_ueqv_R009NYNYN_partial_13_0023,
  rs_R009_ueqv_R009NYNYN_partial_13_0024,
  rs_R009_ueqv_R009NYNYN_partial_13_0025,
  rs_R009_ueqv_R009NYNYN_partial_13_0026,
  rs_R009_ueqv_R009NYNYN_partial_13_0027,
  rs_R009_ueqv_R009NYNYN_partial_13_0028,
  rs_R009_ueqv_R009NYNYN_partial_13_0029,
  rs_R009_ueqv_R009NYNYN_partial_13_0030,
  rs_R009_ueqv_R009NYNYN_partial_13_0031,
  rs_R009_ueqv_R009NYNYN_partial_13_0032,
  rs_R009_ueqv_R009NYNYN_partial_13_0033,
  rs_R009_ueqv_R009NYNYN_partial_13_0034,
  rs_R009_ueqv_R009NYNYN_partial_13_0035,
  rs_R009_ueqv_R009NYNYN_partial_13_0036,
  rs_R009_ueqv_R009NYNYN_partial_13_0037,
  rs_R009_ueqv_R009NYNYN_partial_13_0038,
  rs_R009_ueqv_R009NYNYN_partial_13_0039,
  rs_R009_ueqv_R009NYNYN_partial_13_0040,
  rs_R009_ueqv_R009NYNYN_partial_13_0041,
  rs_R009_ueqv_R009NYNYN_partial_13_0042,
  rs_R009_ueqv_R009NYNYN_partial_13_0043,
  rs_R009_ueqv_R009NYNYN_partial_13_0044,
  rs_R009_ueqv_R009NYNYN_partial_13_0045,
  rs_R009_ueqv_R009NYNYN_partial_13_0046,
  rs_R009_ueqv_R009NYNYN_partial_13_0047,
  rs_R009_ueqv_R009NYNYN_partial_13_0048,
  rs_R009_ueqv_R009NYNYN_partial_13_0049,
  rs_R009_ueqv_R009NYNYN_partial_13_0050,
  rs_R009_ueqv_R009NYNYN_partial_13_0051,
  rs_R009_ueqv_R009NYNYN_partial_13_0052,
  rs_R009_ueqv_R009NYNYN_partial_13_0053,
  rs_R009_ueqv_R009NYNYN_partial_13_0054,
  rs_R009_ueqv_R009NYNYN_partial_13_0055,
  rs_R009_ueqv_R009NYNYN_partial_13_0056,
  rs_R009_ueqv_R009NYNYN_partial_13_0057,
  rs_R009_ueqv_R009NYNYN_partial_13_0058,
  rs_R009_ueqv_R009NYNYN_partial_13_0059,
  rs_R009_ueqv_R009NYNYN_partial_13_0060,
  rs_R009_ueqv_R009NYNYN_partial_13_0061,
  rs_R009_ueqv_R009NYNYN_partial_13_0062,
  rs_R009_ueqv_R009NYNYN_partial_13_0063,
  rs_R009_ueqv_R009NYNYN_partial_13_0064,
  rs_R009_ueqv_R009NYNYN_partial_13_0065,
  rs_R009_ueqv_R009NYNYN_partial_13_0066,
  rs_R009_ueqv_R009NYNYN_partial_13_0067,
  rs_R009_ueqv_R009NYNYN_partial_13_0068,
  rs_R009_ueqv_R009NYNYN_partial_13_0069,
  rs_R009_ueqv_R009NYNYN_partial_13_0070,
  rs_R009_ueqv_R009NYNYN_partial_13_0071,
  rs_R009_ueqv_R009NYNYN_partial_13_0072,
  rs_R009_ueqv_R009NYNYN_partial_13_0073,
  rs_R009_ueqv_R009NYNYN_partial_13_0074,
  rs_R009_ueqv_R009NYNYN_partial_13_0075,
  rs_R009_ueqv_R009NYNYN_partial_13_0076,
  rs_R009_ueqv_R009NYNYN_partial_13_0077,
  rs_R009_ueqv_R009NYNYN_partial_13_0078,
  rs_R009_ueqv_R009NYNYN_partial_13_0079,
  rs_R009_ueqv_R009NYNYN_partial_13_0080,
  rs_R009_ueqv_R009NYNYN_partial_13_0081,
  rs_R009_ueqv_R009NYNYN_partial_13_0082,
  rs_R009_ueqv_R009NYNYN_partial_13_0083,
  rs_R009_ueqv_R009NYNYN_partial_13_0084,
  rs_R009_ueqv_R009NYNYN_partial_13_0085,
  rs_R009_ueqv_R009NYNYN_partial_13_0086,
  rs_R009_ueqv_R009NYNYN_partial_13_0087,
  rs_R009_ueqv_R009NYNYN_partial_13_0088,
  rs_R009_ueqv_R009NYNYN_partial_13_0089,
  rs_R009_ueqv_R009NYNYN_partial_13_0090,
  rs_R009_ueqv_R009NYNYN_partial_13_0091,
  rs_R009_ueqv_R009NYNYN_partial_13_0092,
  rs_R009_ueqv_R009NYNYN_partial_13_0093,
  rs_R009_ueqv_R009NYNYN_partial_13_0094,
  rs_R009_ueqv_R009NYNYN_partial_13_0095,
  rs_R009_ueqv_R009NYNYN_partial_13_0096,
  rs_R009_ueqv_R009NYNYN_partial_13_0097,
  rs_R009_ueqv_R009NYNYN_partial_13_0098,
  rs_R009_ueqv_R009NYNYN_partial_13_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_13_0000_0099 : Poly :=
[
  term ((-8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (3, 1), (5, 1)],
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-25259167496226414554344849998570668956654679894384 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 1), (5, 1), (13, 2)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 1), (5, 1), (15, 2)],
  term ((4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 1), (3, 2)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 2), (11, 1), (13, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (3, 2), (11, 1), (15, 1)],
  term ((12629583748113207277172424999285334478327339947192 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (3, 2), (13, 2)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (3, 2), (15, 2)],
  term ((-32960738867149256265123534695983065832364018282890 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (4, 1)],
  term ((-5659199992934652058312811274476902614251486447784 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (4, 1), (8, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((4466358519925577911293677033705339312535846515750 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (2, 1), (4, 1), (10, 1)],
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-612711729024957254012086136539058392503388863016256 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((41395460396410409498566816794078707379247919567780 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (2, 1), (4, 1), (12, 1)],
  term ((1050251556089787629538373383060176841835683095940764 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 1), (4, 1), (13, 2)],
  term ((-108435361931004690996298632680876016501522068551100 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((16480369433574628132561767347991532916182009141445 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2)],
  term ((-8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 2), (4, 1)],
  term ((36750080019002722068052369329653140855741269391904 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-25259167496226414554344849998570668956654679894384 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (4, 1), (13, 1), (15, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (4, 1), (13, 2)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (4, 1), (15, 2)],
  term ((2829599996467326029156405637238451307125743223892 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (8, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-2233179259962788955646838516852669656267923257875 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (2, 2), (10, 1)],
  term ((91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((306355864512478627006043068269529196251694431508128 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 2), (11, 2)],
  term ((-20697730198205204749283408397039353689623959783890 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (2, 2), (12, 1)],
  term ((-525125778044893814769186691530088420917841547970382 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (2, 2), (13, 2)],
  term ((54217680965502345498149316340438008250761034275550 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 2), (15, 2)],
  term ((4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (2, 3)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 3), (11, 1), (13, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 3), (11, 1), (15, 1)],
  term ((12629583748113207277172424999285334478327339947192 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 3), (13, 1), (15, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 3), (13, 2)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (2, 3), (15, 2)],
  term ((-32960738867149256265123534695983065832364018282890 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (5, 1)],
  term ((-5659199992934652058312811274476902614251486447784 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (5, 1), (8, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((4466358519925577911293677033705339312535846515750 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (3, 1), (5, 1), (10, 1)],
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-612711729024957254012086136539058392503388863016256 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (5, 1), (11, 2)],
  term ((41395460396410409498566816794078707379247919567780 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((1050251556089787629538373383060176841835683095940764 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-353708284443416284256951135001128274344420011809664 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((-108435361931004690996298632680876016501522068551100 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((16480369433574628132561767347991532916182009141445 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 2)],
  term ((2829599996467326029156405637238451307125743223892 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 2), (8, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-2233179259962788955646838516852669656267923257875 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (3, 2), (10, 1)],
  term ((91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((306355864512478627006043068269529196251694431508128 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 2), (11, 2)],
  term ((-20697730198205204749283408397039353689623959783890 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (3, 2), (12, 1)],
  term ((-525125778044893814769186691530088420917841547970382 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((176854142221708142128475567500564137172210005904832 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (3, 2), (13, 2)],
  term ((54217680965502345498149316340438008250761034275550 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 2), (15, 2)],
  term ((-30526746306272332359317767538712436607136567900 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((-44588808527864173732 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((124420536996222728019 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (3, 1), (4, 1), (16, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((20951455096073597289455822266515160726054365049072 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)],
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((72930344735943733782647005893555012264094181010284 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((72506806606940935239 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 2), (10, 1), (13, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (3, 2), (10, 1), (15, 1)],
  term ((11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((-10475727548036798644727911133257580363027182524536 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-36465172367971866891323502946777506132047090505142 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-72506806606940935239 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1)],
  term ((3708123599234413770 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-121817128723691243490466023300235485594580270480 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((-1173931716246360127331911585929399051299490504480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (9, 1), (10, 1)],
  term ((-48057596761033351454 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (9, 1), (12, 1)],
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((-83043861012918301247 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (9, 1), (16, 1)],
  term ((-52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12937695236641361483574553671437025847907151929920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (10, 1), (13, 1)],
  term ((338873685151946324384 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-18535411739060552355779525504713707084576204529520 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1)],
  term ((-10486668013121526840 : Rat) / 17711258223091421719) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((48333777967167931832746266492267815535929355189738 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-1139860887411616415584844440855659116238848957112464 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((415262605870951993020 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-99059648354579804288 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-617489038584665343638045071609947586178305338794272 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((34477319104278499707570528307129354947028613444644 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-1115361852418127920205 : Rat) / 371936422684919856099) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((1143950985563486800489091655361546578525208809311582 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-608507806358697534579 : Rat) / 247957615123279904066) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((103292829648411432683660940451497229724327652628306 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((26592993404445865886 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((15263373153136166179658883769356218303568283950 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 2), (3, 1)],
  term ((22294404263932086866 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (3, 1), (10, 1), (16, 1)],
  term ((-124420536996222728019 : Rat) / 495915230246559808132) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((1466885038017916665141199248246506204472952427520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (4, 1), (10, 1), (13, 1)],
  term ((44201463132784910128 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (4, 1), (10, 1), (15, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((2576513953489632175496213825766950409768091585400 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((-249157563522571195812 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((20951455096073597289455822266515160726054365049072 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((192044587220477498884 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (13, 1), (16, 1)],
  term ((72930344735943733782647005893555012264094181010284 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((72506806606940935239 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-220244598618700897380655980903072974531507145360 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (8, 1), (11, 1)],
  term ((-1854061799617206885 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (8, 1), (11, 1), (16, 1)],
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (8, 1), (13, 1), (16, 1)],
  term ((-32413409066683662277 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((60908564361845621745233011650117742797290135240 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (2, 2), (9, 1)],
  term ((586965858123180063665955792964699525649745252240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((24028798380516675727 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (9, 1), (10, 1), (16, 1)],
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (9, 1), (12, 1), (16, 1)],
  term ((83043861012918301247 : Rat) / 247957615123279904066) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3924975828260211469885674910094653239703739403200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1)],
  term ((97604741260867448312 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6468847618320680741787276835718512923953575964960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((-169436842575973162192 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((9267705869530276177889762752356853542288102264760 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((5243334006560763420 : Rat) / 17711258223091421719) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-24166888983583965916373133246133907767964677594869 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 2), (11, 1)],
  term ((569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((-207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((49529824177289902144 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((308744519292332671819022535804973793089152669397136 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-17238659552139249853785264153564677473514306722322 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-571975492781743400244545827680773289262604404655791 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (2, 2), (13, 1)],
  term ((608507806358697534579 : Rat) / 495915230246559808132) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-51646414824205716341830470225748614862163826314153 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 2), (15, 1)],
  term ((-13296496702222932943 : Rat) / 123978807561639952033) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-733442519008958332570599624123253102236476213760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 3), (10, 1), (13, 1)],
  term ((-22100731566392455064 : Rat) / 123978807561639952033) [(1, 1), (2, 3), (10, 1), (13, 1), (16, 1)],
  term ((366721259504479166285299812061626551118238106880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 3), (10, 1), (15, 1)],
  term ((11050365783196227532 : Rat) / 123978807561639952033) [(1, 1), (2, 3), (10, 1), (15, 1), (16, 1)],
  term ((-1288256976744816087748106912883475204884045792700 : Rat) / 46707613070603555731310429132971736016095050511) [(1, 1), (2, 3), (11, 1)],
  term ((124578781761285597906 : Rat) / 123978807561639952033) [(1, 1), (2, 3), (11, 1), (16, 1)],
  term ((-10475727548036798644727911133257580363027182524536 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 3), (13, 1)],
  term ((-96022293610238749442 : Rat) / 123978807561639952033) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((-36465172367971866891323502946777506132047090505142 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 3), (15, 1)],
  term ((-72506806606940935239 : Rat) / 247957615123279904066) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((440489197237401794761311961806145949063014290720 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1)],
  term ((3708123599234413770 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-121817128723691243490466023300235485594580270480 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-1173931716246360127331911585929399051299490504480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 1)],
  term ((-48057596761033351454 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1)],
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-83043861012918301247 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12937695236641361483574553671437025847907151929920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((338873685151946324384 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-18535411739060552355779525504713707084576204529520 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((-10486668013121526840 : Rat) / 17711258223091421719) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((48333777967167931832746266492267815535929355189738 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-1139860887411616415584844440855659116238848957112464 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((415262605870951993020 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-99059648354579804288 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-617489038584665343638045071609947586178305338794272 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((34477319104278499707570528307129354947028613444644 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-1115361852418127920205 : Rat) / 371936422684919856099) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1143950985563486800489091655361546578525208809311582 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-608507806358697534579 : Rat) / 247957615123279904066) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((103292829648411432683660940451497229724327652628306 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((26592993404445865886 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-30526746306272332359317767538712436607136567900 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 2), (5, 1)],
  term ((-44588808527864173732 : Rat) / 17711258223091421719) [(1, 1), (3, 2), (5, 1), (10, 1), (16, 1)],
  term ((124420536996222728019 : Rat) / 247957615123279904066) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-220244598618700897380655980903072974531507145360 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (8, 1), (11, 1)],
  term ((-1854061799617206885 : Rat) / 17711258223091421719) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)],
  term ((64826818133367324554 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)],
  term ((-32413409066683662277 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((60908564361845621745233011650117742797290135240 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 2), (9, 1)],
  term ((586965858123180063665955792964699525649745252240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((24028798380516675727 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (9, 1), (10, 1), (16, 1)],
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((83043861012918301247 : Rat) / 247957615123279904066) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (10, 1), (12, 1), (13, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3924975828260211469885674910094653239703739403200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1)],
  term ((97604741260867448312 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6468847618320680741787276835718512923953575964960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((-169436842575973162192 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((9267705869530276177889762752356853542288102264760 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((5243334006560763420 : Rat) / 17711258223091421719) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-24166888983583965916373133246133907767964677594869 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 2), (11, 1)],
  term ((569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((49529824177289902144 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((308744519292332671819022535804973793089152669397136 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-17238659552139249853785264153564677473514306722322 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-571975492781743400244545827680773289262604404655791 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (3, 2), (13, 1)],
  term ((608507806358697534579 : Rat) / 495915230246559808132) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-51646414824205716341830470225748614862163826314153 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 2), (15, 1)],
  term ((-13296496702222932943 : Rat) / 123978807561639952033) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((15263373153136166179658883769356218303568283950 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (3, 3)],
  term ((22294404263932086866 : Rat) / 17711258223091421719) [(1, 1), (3, 3), (10, 1), (16, 1)],
  term ((-124420536996222728019 : Rat) / 495915230246559808132) [(1, 1), (3, 3), (16, 1)],
  term ((-87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (3, 1), (5, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 1), (3, 1), (5, 1), (8, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((125620454843925422812187724059615263036463 : Rat) / 942075594658284480195544480389661887750) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-641160550791446432904 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (3, 1), (5, 1), (10, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (3, 1), (5, 1), (10, 1), (15, 2)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((26307209962806111186576 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (5, 1), (11, 2)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 2), (10, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 2), (10, 1), (15, 1)],
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 2), (13, 1)],
  term ((-19446593050800158919723767336487087096867459468542566400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (3, 2)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 2), (5, 1), (10, 1), (13, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 2), (5, 1), (10, 1), (15, 1)],
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((-9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 2), (5, 1), (13, 1)],
  term ((9723296525400079459861883668243543548433729734271283200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 1), (3, 2), (8, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (3, 2), (8, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 2), (9, 1), (10, 1), (13, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 2), (9, 1), (10, 1), (15, 1)],
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((-6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-125620454843925422812187724059615263036463 : Rat) / 1884151189316568960391088960779323775500) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((320580275395723216452 : Rat) / 619894037808199760165) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (3, 2), (10, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 2), (10, 1), (11, 1), (13, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (3, 2), (10, 1), (13, 1), (15, 1)],
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (3, 2), (10, 1), (13, 2)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (3, 2), (10, 1), (13, 2), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (3, 2), (10, 1), (15, 2)],
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (3, 2), (10, 1), (15, 2), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 2), (11, 2)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (3, 2), (11, 2), (16, 1)],
  term ((-888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 174111999793760375975098320602323103284631544428589313926405925460749682688000) [(2, 1), (4, 1)],
  term ((888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 348223999587520751950196641204646206569263088857178627852811850921499365376000) [(2, 2)],
  term ((-87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2), (4, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((-19446593050800158919723767336487087096867459468542566400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 2), (4, 1), (8, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 2), (4, 1), (8, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((125620454843925422812187724059615263036463 : Rat) / 942075594658284480195544480389661887750) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-641160550791446432904 : Rat) / 619894037808199760165) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 2), (4, 1), (10, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 2), (4, 1), (10, 1), (13, 2)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 2), (4, 1), (10, 1), (15, 2)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((26307209962806111186576 : Rat) / 4339258264657398321155) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (4, 1), (11, 2)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((87772474870366012766917887696453457436733810791261805845988862946579967887154973 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 3)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 3), (5, 1), (10, 1), (13, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 3), (5, 1), (10, 1), (15, 1)],
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 3), (5, 1), (11, 1)],
  term ((-9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 3), (5, 1), (13, 1)],
  term ((9723296525400079459861883668243543548433729734271283200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 3), (5, 1), (15, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 3), (8, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 3), (8, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 3), (9, 1), (10, 1), (13, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 3), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 3), (9, 1), (10, 1), (15, 1)],
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 3), (9, 1), (11, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 3), (9, 1), (11, 1), (16, 1)],
  term ((1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 3), (9, 1), (13, 1)],
  term ((-6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 3), (9, 1), (13, 1), (16, 1)],
  term ((-125620454843925422812187724059615263036463 : Rat) / 1884151189316568960391088960779323775500) [(2, 3), (9, 1), (15, 1)],
  term ((320580275395723216452 : Rat) / 619894037808199760165) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 3), (10, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 3), (10, 1), (11, 1), (13, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 3), (10, 1), (11, 1), (15, 1)],
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 3), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 3), (10, 1), (13, 1), (15, 1)],
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 3), (10, 1), (13, 2)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 3), (10, 1), (13, 2), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 3), (10, 1), (15, 2)],
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 3), (10, 1), (15, 2), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 3), (10, 1), (16, 1)],
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 3), (11, 1), (13, 1)],
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((-2354880594027582384295008482905372614165520026001650111591496592929567676639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 3), (11, 1), (15, 1)],
  term ((-13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 3), (11, 2)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 3), (11, 2), (16, 1)],
  term ((-888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 174111999793760375975098320602323103284631544428589313926405925460749682688000) [(3, 1), (5, 1)],
  term ((888774834476710804988324236180915099422999027260078041415405997658567728789798317 : Rat) / 348223999587520751950196641204646206569263088857178627852811850921499365376000) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NYNYN_block_13_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_13_0000_0099
      rs_R009_ueqv_R009NYNYN_block_13_0000_0099 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
