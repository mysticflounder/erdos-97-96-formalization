/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 20:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0100 : Poly :=
[
  term ((-16609382702580368072639480608524239854551218457590702226046089157 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (11, 1)]
]

/-- Partial product 100 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0100 : Poly :=
[
  term ((-33218765405160736145278961217048479709102436915181404452092178314 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-33218765405160736145278961217048479709102436915181404452092178314 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (9, 1), (11, 2)],
  term ((16609382702580368072639480608524239854551218457590702226046089157 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (10, 2), (11, 1)],
  term ((16609382702580368072639480608524239854551218457590702226046089157 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0100_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0100
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0101 : Poly :=
[
  term ((-569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 101 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0101 : Poly :=
[
  term ((-1139860887411616415584844440855659116238848957112464 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1139860887411616415584844440855659116238848957112464 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0101_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0101
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0102 : Poly :=
[
  term ((207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 102 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0102 : Poly :=
[
  term ((415262605870951993020 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((415262605870951993020 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0102_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0102
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0103 : Poly :=
[
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 103 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0103 : Poly :=
[
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0103_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0103
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0104 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0104 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0104_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0104
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0105 : Poly :=
[
  term ((761624868369710359928 : Rat) / 619894037808199760165) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 105 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0105 : Poly :=
[
  term ((1523249736739420719856 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((1523249736739420719856 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-761624868369710359928 : Rat) / 619894037808199760165) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-761624868369710359928 : Rat) / 619894037808199760165) [(1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0105_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0105
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0106 : Poly :=
[
  term ((281642847286108573797104186544373752089004597578536 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 106 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0106 : Poly :=
[
  term ((563285694572217147594208373088747504178009195157072 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((563285694572217147594208373088747504178009195157072 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-281642847286108573797104186544373752089004597578536 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((-281642847286108573797104186544373752089004597578536 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0106_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0106
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0107 : Poly :=
[
  term ((419776911755879833478 : Rat) / 371936422684919856099) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0107 : Poly :=
[
  term ((839553823511759666956 : Rat) / 371936422684919856099) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((839553823511759666956 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-419776911755879833478 : Rat) / 371936422684919856099) [(1, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-419776911755879833478 : Rat) / 371936422684919856099) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0107_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0107
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0108 : Poly :=
[
  term ((-17492387706971084159985796723592539493458735590442 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 108 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0108 : Poly :=
[
  term ((-34984775413942168319971593447185078986917471180884 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-34984775413942168319971593447185078986917471180884 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((17492387706971084159985796723592539493458735590442 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((17492387706971084159985796723592539493458735590442 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0108_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0108
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0109 : Poly :=
[
  term ((-1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0109 : Poly :=
[
  term ((-1115361852418127920205 : Rat) / 371936422684919856099) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1115361852418127920205 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0109_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0109
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0110 : Poly :=
[
  term ((-1682515696293316822142074756838555354576986110321689796780749651608650028815954483986 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (13, 1)]
]

/-- Partial product 110 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0110 : Poly :=
[
  term ((-3365031392586633644284149513677110709153972220643379593561499303217300057631908967972 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-3365031392586633644284149513677110709153972220643379593561499303217300057631908967972 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((1682515696293316822142074756838555354576986110321689796780749651608650028815954483986 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (10, 2), (13, 1)],
  term ((1682515696293316822142074756838555354576986110321689796780749651608650028815954483986 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0110_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0110
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0111 : Poly :=
[
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 111 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0111 : Poly :=
[
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0111_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0111
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0112 : Poly :=
[
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0112 : Poly :=
[
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0112_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0112
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0113 : Poly :=
[
  term ((-14828900939133452010176265011 : Rat) / 400899055848577075104506100) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 113 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0113 : Poly :=
[
  term ((-14828900939133452010176265011 : Rat) / 200449527924288537552253050) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-14828900939133452010176265011 : Rat) / 200449527924288537552253050) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((14828900939133452010176265011 : Rat) / 400899055848577075104506100) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((14828900939133452010176265011 : Rat) / 400899055848577075104506100) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0113_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0113
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0114 : Poly :=
[
  term ((-4271676681212395901291204559263778200122317648575930156813790839 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (15, 1)]
]

/-- Partial product 114 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0114 : Poly :=
[
  term ((-8543353362424791802582409118527556400244635297151860313627581678 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-8543353362424791802582409118527556400244635297151860313627581678 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((4271676681212395901291204559263778200122317648575930156813790839 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (10, 2), (15, 1)],
  term ((4271676681212395901291204559263778200122317648575930156813790839 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0114_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0114
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0115 : Poly :=
[
  term ((8481461131493702551067 : Rat) / 5207109917588877985386) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0115 : Poly :=
[
  term ((8481461131493702551067 : Rat) / 2603554958794438992693) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((8481461131493702551067 : Rat) / 2603554958794438992693) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8481461131493702551067 : Rat) / 5207109917588877985386) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-8481461131493702551067 : Rat) / 5207109917588877985386) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0115_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0115
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0116 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2)]
]

/-- Partial product 116 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0116 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (9, 1), (11, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 2)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0116_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0116
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0117 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 1)]
]

/-- Partial product 117 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0117 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 2)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 1), (11, 2)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0117_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0117
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0118 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 1), (16, 1)]
]

/-- Partial product 118 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0118 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 2), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 1), (11, 2), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0118_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0118
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0119 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (16, 1)]
]

/-- Partial product 119 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0119 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 2), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0119_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0119
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0120 : Poly :=
[
  term ((-487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1)]
]

/-- Partial product 120 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0120 : Poly :=
[
  term ((-487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (8, 1), (10, 1)],
  term ((-487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (9, 1), (11, 1)],
  term ((487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1), (10, 2)],
  term ((487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0120_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0120
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0121 : Poly :=
[
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (9, 1)]
]

/-- Partial product 121 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0121 : Poly :=
[
  term ((7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 2)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2)],
  term ((7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0121_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0121
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0122 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (9, 1), (11, 1)]
]

/-- Partial product 122 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0122 : Poly :=
[
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (9, 1), (10, 2), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (9, 1), (11, 3)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0122_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0122
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0123 : Poly :=
[
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 123 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0123 : Poly :=
[
  term ((-261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (9, 1), (10, 2), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0123_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0123
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0124 : Poly :=
[
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 1), (11, 1)]
]

/-- Partial product 124 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0124 : Poly :=
[
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 1), (10, 2), (11, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 1), (11, 3)],
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0124_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0124
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0125 : Poly :=
[
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 125 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0125 : Poly :=
[
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (10, 2), (13, 1)],
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 2), (13, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0125_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0125
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0126 : Poly :=
[
  term ((144448097556962318454183457693946850859285973606239846400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 126 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0126 : Poly :=
[
  term ((288896195113924636908366915387893701718571947212479692800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-144448097556962318454183457693946850859285973606239846400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-144448097556962318454183457693946850859285973606239846400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((288896195113924636908366915387893701718571947212479692800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0126_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0126
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0127 : Poly :=
[
  term ((-5942184871220140919591816398699791759797248753839513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 127 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0127 : Poly :=
[
  term ((-11884369742440281839183632797399583519594497507679027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((5942184871220140919591816398699791759797248753839513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 2)],
  term ((5942184871220140919591816398699791759797248753839513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (11, 2)],
  term ((-11884369742440281839183632797399583519594497507679027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0127_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0127
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0128 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 128 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0128 : Poly :=
[
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (10, 2), (13, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (11, 2), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0128_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0128
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0129 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 129 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0129 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0129_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0129
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0130 : Poly :=
[
  term ((147322866319685726755310485919541421405460596445697126400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 130 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0130 : Poly :=
[
  term ((294645732639371453510620971839082842810921192891394252800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((294645732639371453510620971839082842810921192891394252800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (11, 2)],
  term ((-147322866319685726755310485919541421405460596445697126400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 2), (11, 1)],
  term ((-147322866319685726755310485919541421405460596445697126400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0130_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0130
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0131 : Poly :=
[
  term ((66341396749407730536105094511021687280616333681217331200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 131 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0131 : Poly :=
[
  term ((132682793498815461072210189022043374561232667362434662400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((132682793498815461072210189022043374561232667362434662400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-66341396749407730536105094511021687280616333681217331200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 2), (13, 1)],
  term ((-66341396749407730536105094511021687280616333681217331200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0131_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0131
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0132 : Poly :=
[
  term ((-35321273786137362524924686379469133610351955397302630400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 132 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0132 : Poly :=
[
  term ((-70642547572274725049849372758938267220703910794605260800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-70642547572274725049849372758938267220703910794605260800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((35321273786137362524924686379469133610351955397302630400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (10, 2), (15, 1)],
  term ((35321273786137362524924686379469133610351955397302630400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0132_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0132
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0133 : Poly :=
[
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2)]
]

/-- Partial product 133 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0133 : Poly :=
[
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (10, 1)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (9, 1), (11, 1)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (10, 2)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0133_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0133
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0134 : Poly :=
[
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1)]
]

/-- Partial product 134 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0134 : Poly :=
[
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (10, 2)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (11, 2)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0134_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0134
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0135 : Poly :=
[
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(2, 1), (6, 1)]
]

/-- Partial product 135 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0135 : Poly :=
[
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(2, 1), (6, 1), (8, 1), (10, 1)],
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(2, 1), (6, 1), (10, 2)],
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(2, 1), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0135_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0135
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0136 : Poly :=
[
  term ((-463412421976306611511 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 136 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0136 : Poly :=
[
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (10, 2), (16, 1)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0136_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0136
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0137 : Poly :=
[
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 1), (8, 1)]
]

/-- Partial product 137 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0137 : Poly :=
[
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (8, 1), (9, 1), (11, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 1), (8, 1), (10, 2)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 1), (8, 1), (11, 2)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0137_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0137
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0138 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 138 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0138 : Poly :=
[
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 3), (13, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0138_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0138
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0139 : Poly :=
[
  term ((97022232964002980125785630293438087957294054656000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 139 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0139 : Poly :=
[
  term ((194044465928005960251571260586876175914588109312000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-97022232964002980125785630293438087957294054656000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-97022232964002980125785630293438087957294054656000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 3), (15, 1)],
  term ((194044465928005960251571260586876175914588109312000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0139_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0139
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0140 : Poly :=
[
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 140 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0140 : Poly :=
[
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0140_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0140
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0141 : Poly :=
[
  term ((-163419204048452491568906774813491856574692326371724288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (15, 2)]
]

/-- Partial product 141 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0141 : Poly :=
[
  term ((-326838408096904983137813549626983713149384652743448576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((163419204048452491568906774813491856574692326371724288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((163419204048452491568906774813491856574692326371724288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-326838408096904983137813549626983713149384652743448576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0141_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0141
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0142 : Poly :=
[
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 142 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0142 : Poly :=
[
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (10, 2), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (11, 2), (16, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0142_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0142
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0143 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 143 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0143 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 3), (13, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0143_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0143
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0144 : Poly :=
[
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0144 : Poly :=
[
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 3), (13, 1), (16, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0144_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0144
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0145 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 145 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0145 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 3), (15, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0145_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0145
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0146 : Poly :=
[
  term ((-176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0146 : Poly :=
[
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0146_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0146
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0147 : Poly :=
[
  term ((-1922822803586202111182856588347249577939699502026247742806924973 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 147 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0147 : Poly :=
[
  term ((-1922822803586202111182856588347249577939699502026247742806924973 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((1922822803586202111182856588347249577939699502026247742806924973 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((1922822803586202111182856588347249577939699502026247742806924973 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (11, 3)],
  term ((-1922822803586202111182856588347249577939699502026247742806924973 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0147_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0147
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0148 : Poly :=
[
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 148 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0148 : Poly :=
[
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 3), (16, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0148_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0148
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0149 : Poly :=
[
  term ((402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 149 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0149 : Poly :=
[
  term ((402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((-402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0149_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0149
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0150 : Poly :=
[
  term ((12691078243966388104898792 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 150 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0150 : Poly :=
[
  term ((25382156487932776209797584 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-12691078243966388104898792 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-12691078243966388104898792 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((25382156487932776209797584 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0150_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0150
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0151 : Poly :=
[
  term ((30056747940448112621827683117151542644957837143305536645014046735565845911 : Rat) / 330115626649169139156634185724586099675939949497121025192027203602916000) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 151 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0151 : Poly :=
[
  term ((30056747940448112621827683117151542644957837143305536645014046735565845911 : Rat) / 165057813324584569578317092862293049837969974748560512596013601801458000) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-30056747940448112621827683117151542644957837143305536645014046735565845911 : Rat) / 330115626649169139156634185724586099675939949497121025192027203602916000) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-30056747940448112621827683117151542644957837143305536645014046735565845911 : Rat) / 330115626649169139156634185724586099675939949497121025192027203602916000) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((30056747940448112621827683117151542644957837143305536645014046735565845911 : Rat) / 165057813324584569578317092862293049837969974748560512596013601801458000) [(2, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0151_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0151
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0152 : Poly :=
[
  term ((-5181294973069623071913 : Rat) / 8678516529314796642310) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0152 : Poly :=
[
  term ((-5181294973069623071913 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5181294973069623071913 : Rat) / 8678516529314796642310) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((5181294973069623071913 : Rat) / 8678516529314796642310) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5181294973069623071913 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0152_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0152
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0153 : Poly :=
[
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (10, 1)]
]

/-- Partial product 153 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0153 : Poly :=
[
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (8, 1), (10, 2)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (10, 1), (11, 2)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0153_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0153
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0154 : Poly :=
[
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 154 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0154 : Poly :=
[
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 3), (13, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0154_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0154
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0155 : Poly :=
[
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 155 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0155 : Poly :=
[
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 3), (13, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0155_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0155
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0156 : Poly :=
[
  term ((6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 156 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0156 : Poly :=
[
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0156_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0156
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0157 : Poly :=
[
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0157 : Poly :=
[
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0157_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0157
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0158 : Poly :=
[
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 158 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0158 : Poly :=
[
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0158_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0158
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0159 : Poly :=
[
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0159 : Poly :=
[
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0159_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0159
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0160 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 2)]
]

/-- Partial product 160 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0160 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (8, 1), (10, 2), (13, 2)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (11, 2), (13, 2)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0160_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0160
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0161 : Poly :=
[
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 161 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0161 : Poly :=
[
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 2), (13, 2), (16, 1)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (11, 2), (13, 2), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0161_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0161
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0162 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 162 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0162 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0162_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0162
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0163 : Poly :=
[
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 163 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0163 : Poly :=
[
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0163_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0163
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0164 : Poly :=
[
  term ((-6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 164 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0164 : Poly :=
[
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (8, 1), (10, 2), (16, 1)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0164_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0164
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0165 : Poly :=
[
  term ((-986267382603788139921538684771684211246707121942190917670546380041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 165 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0165 : Poly :=
[
  term ((-986267382603788139921538684771684211246707121942190917670546380041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-986267382603788139921538684771684211246707121942190917670546380041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((986267382603788139921538684771684211246707121942190917670546380041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (10, 2), (11, 1), (13, 1)],
  term ((986267382603788139921538684771684211246707121942190917670546380041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0165_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0165
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0166 : Poly :=
[
  term ((-39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 166 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0166 : Poly :=
[
  term ((-78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0166_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0166
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0167 : Poly :=
[
  term ((160854894767932680440111483342605055511626411290724528486676696327608254571 : Rat) / 840681362706763075610198367812512418519978026149910388559458166318140250) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 167 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0167 : Poly :=
[
  term ((160854894767932680440111483342605055511626411290724528486676696327608254571 : Rat) / 420340681353381537805099183906256209259989013074955194279729083159070125) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((160854894767932680440111483342605055511626411290724528486676696327608254571 : Rat) / 420340681353381537805099183906256209259989013074955194279729083159070125) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-160854894767932680440111483342605055511626411290724528486676696327608254571 : Rat) / 840681362706763075610198367812512418519978026149910388559458166318140250) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-160854894767932680440111483342605055511626411290724528486676696327608254571 : Rat) / 840681362706763075610198367812512418519978026149910388559458166318140250) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0167_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0167
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0168 : Poly :=
[
  term ((14987344285950305189498 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0168 : Poly :=
[
  term ((29974688571900610378996 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((29974688571900610378996 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-14987344285950305189498 : Rat) / 4339258264657398321155) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-14987344285950305189498 : Rat) / 4339258264657398321155) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0168_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0168
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0169 : Poly :=
[
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (11, 2)]
]

/-- Partial product 169 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0169 : Poly :=
[
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (8, 1), (10, 1), (11, 2)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (9, 1), (11, 3)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (10, 2), (11, 2)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0169_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0169
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0170 : Poly :=
[
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 170 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0170 : Poly :=
[
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (11, 3), (16, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (10, 2), (11, 2), (16, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0170_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0170
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0171 : Poly :=
[
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (12, 1)]
]

/-- Partial product 171 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0171 : Poly :=
[
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (8, 1), (10, 1), (12, 1)],
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (10, 2), (12, 1)],
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0171_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0171
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0172 : Poly :=
[
  term ((904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 172 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0172 : Poly :=
[
  term ((1809939744691845776614 : Rat) / 32049107564750198685) [(2, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((1809939744691845776614 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (10, 2), (12, 1), (16, 1)],
  term ((-904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0172_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0172
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0173 : Poly :=
[
  term ((-1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 173 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0173 : Poly :=
[
  term ((-1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 137811591051044750088486471407638315748706454820858225335628932925458605428832000) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 137811591051044750088486471407638315748706454820858225335628932925458605428832000) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0173_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0173
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0174 : Poly :=
[
  term ((-607733402163340178684804113 : Rat) / 7576344930091817468736630) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0174 : Poly :=
[
  term ((-607733402163340178684804113 : Rat) / 3788172465045908734368315) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-607733402163340178684804113 : Rat) / 3788172465045908734368315) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((607733402163340178684804113 : Rat) / 7576344930091817468736630) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((607733402163340178684804113 : Rat) / 7576344930091817468736630) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0174_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0174
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0175 : Poly :=
[
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (13, 2)]
]

/-- Partial product 175 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0175 : Poly :=
[
  term ((301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (10, 1), (13, 2)],
  term ((301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((-150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (10, 2), (13, 2)],
  term ((-150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0175_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0175
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0176 : Poly :=
[
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 176 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0176 : Poly :=
[
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (10, 2), (13, 2), (16, 1)],
  term ((-89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0176_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0176
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0177 : Poly :=
[
  term ((8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(2, 1), (15, 2)]
]

/-- Partial product 177 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0177 : Poly :=
[
  term ((8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 2331857140095005035380781079495398704704886755740035454371507930277897536000) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 2331857140095005035380781079495398704704886755740035454371507930277897536000) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(2, 1), (10, 2), (15, 2)],
  term ((-8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0177_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0177
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0178 : Poly :=
[
  term ((2337865075894859448097 : Rat) / 64098215129500397370) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 178 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0178 : Poly :=
[
  term ((2337865075894859448097 : Rat) / 32049107564750198685) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((2337865075894859448097 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2337865075894859448097 : Rat) / 64098215129500397370) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-2337865075894859448097 : Rat) / 64098215129500397370) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0178_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0178
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0179 : Poly :=
[
  term ((-10513859879580368560603 : Rat) / 128196430259000794740) [(2, 1), (16, 1)]
]

/-- Partial product 179 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0179 : Poly :=
[
  term ((-10513859879580368560603 : Rat) / 64098215129500397370) [(2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-10513859879580368560603 : Rat) / 64098215129500397370) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((10513859879580368560603 : Rat) / 128196430259000794740) [(2, 1), (10, 2), (16, 1)],
  term ((10513859879580368560603 : Rat) / 128196430259000794740) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0179_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0179
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0180 : Poly :=
[
  term ((52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2)]
]

/-- Partial product 180 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0180 : Poly :=
[
  term ((52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (8, 1), (10, 1)],
  term ((52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (9, 1), (11, 1)],
  term ((-52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2), (10, 2)],
  term ((-52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0180_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0180
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0181 : Poly :=
[
  term ((1175586856283960716627 : Rat) / 32049107564750198685) [(2, 2), (16, 1)]
]

/-- Partial product 181 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0181 : Poly :=
[
  term ((2351173712567921433254 : Rat) / 32049107564750198685) [(2, 2), (8, 1), (10, 1), (16, 1)],
  term ((2351173712567921433254 : Rat) / 32049107564750198685) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1175586856283960716627 : Rat) / 32049107564750198685) [(2, 2), (10, 2), (16, 1)],
  term ((-1175586856283960716627 : Rat) / 32049107564750198685) [(2, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0181_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0181
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0182 : Poly :=
[
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1)]
]

/-- Partial product 182 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0182 : Poly :=
[
  term ((-10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (8, 1), (10, 1)],
  term ((-10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1)],
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (10, 2)],
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0182_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0182
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0183 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 183 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0183 : Poly :=
[
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (9, 1), (11, 2)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (10, 2), (11, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0183_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0183
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0184 : Poly :=
[
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 184 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0184 : Poly :=
[
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (10, 2), (15, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0184_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0184
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0185 : Poly :=
[
  term ((-57097584099315753804024843427688314762867551165056000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1)]
]

/-- Partial product 185 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0185 : Poly :=
[
  term ((-114195168198631507608049686855376629525735102330112000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1), (8, 1), (10, 1)],
  term ((-114195168198631507608049686855376629525735102330112000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((57097584099315753804024843427688314762867551165056000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1), (10, 2)],
  term ((57097584099315753804024843427688314762867551165056000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0185_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0185
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0186 : Poly :=
[
  term ((-1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(3, 1), (7, 1)]
]

/-- Partial product 186 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0186 : Poly :=
[
  term ((-1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(3, 1), (7, 1), (10, 2)],
  term ((1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(3, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0186_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0186
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0187 : Poly :=
[
  term ((-463412421976306611511 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 187 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0187 : Poly :=
[
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0187_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0187
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0188 : Poly :=
[
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 188 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0188 : Poly :=
[
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (11, 2), (13, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0188_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0188
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0189 : Poly :=
[
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 189 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0189 : Poly :=
[
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0189_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0189
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0190 : Poly :=
[
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 190 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0190 : Poly :=
[
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0190_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0190
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0191 : Poly :=
[
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0191 : Poly :=
[
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0191_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0191
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0192 : Poly :=
[
  term ((-14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 1315175374720263463693804089779779427731349943757338210428633306718759697344000) [(3, 1), (9, 1)]
]

/-- Partial product 192 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0192 : Poly :=
[
  term ((-14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(3, 1), (8, 1), (9, 1), (10, 1)],
  term ((14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 1315175374720263463693804089779779427731349943757338210428633306718759697344000) [(3, 1), (9, 1), (10, 2)],
  term ((14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 1315175374720263463693804089779779427731349943757338210428633306718759697344000) [(3, 1), (9, 1), (11, 2)],
  term ((-14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0192_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0192
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0193 : Poly :=
[
  term ((657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 193 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0193 : Poly :=
[
  term ((657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (8, 1), (9, 1), (10, 2)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 3)],
  term ((657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (9, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0193_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0193
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0194 : Poly :=
[
  term ((-279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 194 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0194 : Poly :=
[
  term ((-559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 3), (16, 1)],
  term ((-559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0194_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0194
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0195 : Poly :=
[
  term ((-2583170809312709576430073 : Rat) / 1683632206687070548608140) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 195 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0195 : Poly :=
[
  term ((-2583170809312709576430073 : Rat) / 841816103343535274304070) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((2583170809312709576430073 : Rat) / 1683632206687070548608140) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((2583170809312709576430073 : Rat) / 1683632206687070548608140) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2583170809312709576430073 : Rat) / 841816103343535274304070) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0195_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0195
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0196 : Poly :=
[
  term ((-13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 196 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0196 : Poly :=
[
  term ((-27529190067687589412871730581799460468714 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (8, 1), (10, 2), (11, 1)],
  term ((-27529190067687589412871730581799460468714 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (10, 1), (11, 3)],
  term ((13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0196_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0196
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0197 : Poly :=
[
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 197 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0197 : Poly :=
[
  term ((422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 3), (16, 1)],
  term ((-211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0197_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0197
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0198 : Poly :=
[
  term ((-181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 198 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0198 : Poly :=
[
  term ((-181690192657766865785367309797072973832799 : Rat) / 949612199415550756037108836232779182852) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((-181690192657766865785367309797072973832799 : Rat) / 949612199415550756037108836232779182852) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0198_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0198
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NYNYN_coefficient_20_0199 : Poly :=
[
  term ((-3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 199 for generator 20. -/
def rs_R009_ueqv_R009NYNYN_partial_20_0199 : Poly :=
[
  term ((-7500550714288572467756 : Rat) / 2603554958794438992693) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-7500550714288572467756 : Rat) / 2603554958794438992693) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 20. -/
theorem rs_R009_ueqv_R009NYNYN_partial_20_0199_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_20_0199
        rs_R009_ueqv_R009NYNYN_generator_20_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_20_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_20_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_20_0100,
  rs_R009_ueqv_R009NYNYN_partial_20_0101,
  rs_R009_ueqv_R009NYNYN_partial_20_0102,
  rs_R009_ueqv_R009NYNYN_partial_20_0103,
  rs_R009_ueqv_R009NYNYN_partial_20_0104,
  rs_R009_ueqv_R009NYNYN_partial_20_0105,
  rs_R009_ueqv_R009NYNYN_partial_20_0106,
  rs_R009_ueqv_R009NYNYN_partial_20_0107,
  rs_R009_ueqv_R009NYNYN_partial_20_0108,
  rs_R009_ueqv_R009NYNYN_partial_20_0109,
  rs_R009_ueqv_R009NYNYN_partial_20_0110,
  rs_R009_ueqv_R009NYNYN_partial_20_0111,
  rs_R009_ueqv_R009NYNYN_partial_20_0112,
  rs_R009_ueqv_R009NYNYN_partial_20_0113,
  rs_R009_ueqv_R009NYNYN_partial_20_0114,
  rs_R009_ueqv_R009NYNYN_partial_20_0115,
  rs_R009_ueqv_R009NYNYN_partial_20_0116,
  rs_R009_ueqv_R009NYNYN_partial_20_0117,
  rs_R009_ueqv_R009NYNYN_partial_20_0118,
  rs_R009_ueqv_R009NYNYN_partial_20_0119,
  rs_R009_ueqv_R009NYNYN_partial_20_0120,
  rs_R009_ueqv_R009NYNYN_partial_20_0121,
  rs_R009_ueqv_R009NYNYN_partial_20_0122,
  rs_R009_ueqv_R009NYNYN_partial_20_0123,
  rs_R009_ueqv_R009NYNYN_partial_20_0124,
  rs_R009_ueqv_R009NYNYN_partial_20_0125,
  rs_R009_ueqv_R009NYNYN_partial_20_0126,
  rs_R009_ueqv_R009NYNYN_partial_20_0127,
  rs_R009_ueqv_R009NYNYN_partial_20_0128,
  rs_R009_ueqv_R009NYNYN_partial_20_0129,
  rs_R009_ueqv_R009NYNYN_partial_20_0130,
  rs_R009_ueqv_R009NYNYN_partial_20_0131,
  rs_R009_ueqv_R009NYNYN_partial_20_0132,
  rs_R009_ueqv_R009NYNYN_partial_20_0133,
  rs_R009_ueqv_R009NYNYN_partial_20_0134,
  rs_R009_ueqv_R009NYNYN_partial_20_0135,
  rs_R009_ueqv_R009NYNYN_partial_20_0136,
  rs_R009_ueqv_R009NYNYN_partial_20_0137,
  rs_R009_ueqv_R009NYNYN_partial_20_0138,
  rs_R009_ueqv_R009NYNYN_partial_20_0139,
  rs_R009_ueqv_R009NYNYN_partial_20_0140,
  rs_R009_ueqv_R009NYNYN_partial_20_0141,
  rs_R009_ueqv_R009NYNYN_partial_20_0142,
  rs_R009_ueqv_R009NYNYN_partial_20_0143,
  rs_R009_ueqv_R009NYNYN_partial_20_0144,
  rs_R009_ueqv_R009NYNYN_partial_20_0145,
  rs_R009_ueqv_R009NYNYN_partial_20_0146,
  rs_R009_ueqv_R009NYNYN_partial_20_0147,
  rs_R009_ueqv_R009NYNYN_partial_20_0148,
  rs_R009_ueqv_R009NYNYN_partial_20_0149,
  rs_R009_ueqv_R009NYNYN_partial_20_0150,
  rs_R009_ueqv_R009NYNYN_partial_20_0151,
  rs_R009_ueqv_R009NYNYN_partial_20_0152,
  rs_R009_ueqv_R009NYNYN_partial_20_0153,
  rs_R009_ueqv_R009NYNYN_partial_20_0154,
  rs_R009_ueqv_R009NYNYN_partial_20_0155,
  rs_R009_ueqv_R009NYNYN_partial_20_0156,
  rs_R009_ueqv_R009NYNYN_partial_20_0157,
  rs_R009_ueqv_R009NYNYN_partial_20_0158,
  rs_R009_ueqv_R009NYNYN_partial_20_0159,
  rs_R009_ueqv_R009NYNYN_partial_20_0160,
  rs_R009_ueqv_R009NYNYN_partial_20_0161,
  rs_R009_ueqv_R009NYNYN_partial_20_0162,
  rs_R009_ueqv_R009NYNYN_partial_20_0163,
  rs_R009_ueqv_R009NYNYN_partial_20_0164,
  rs_R009_ueqv_R009NYNYN_partial_20_0165,
  rs_R009_ueqv_R009NYNYN_partial_20_0166,
  rs_R009_ueqv_R009NYNYN_partial_20_0167,
  rs_R009_ueqv_R009NYNYN_partial_20_0168,
  rs_R009_ueqv_R009NYNYN_partial_20_0169,
  rs_R009_ueqv_R009NYNYN_partial_20_0170,
  rs_R009_ueqv_R009NYNYN_partial_20_0171,
  rs_R009_ueqv_R009NYNYN_partial_20_0172,
  rs_R009_ueqv_R009NYNYN_partial_20_0173,
  rs_R009_ueqv_R009NYNYN_partial_20_0174,
  rs_R009_ueqv_R009NYNYN_partial_20_0175,
  rs_R009_ueqv_R009NYNYN_partial_20_0176,
  rs_R009_ueqv_R009NYNYN_partial_20_0177,
  rs_R009_ueqv_R009NYNYN_partial_20_0178,
  rs_R009_ueqv_R009NYNYN_partial_20_0179,
  rs_R009_ueqv_R009NYNYN_partial_20_0180,
  rs_R009_ueqv_R009NYNYN_partial_20_0181,
  rs_R009_ueqv_R009NYNYN_partial_20_0182,
  rs_R009_ueqv_R009NYNYN_partial_20_0183,
  rs_R009_ueqv_R009NYNYN_partial_20_0184,
  rs_R009_ueqv_R009NYNYN_partial_20_0185,
  rs_R009_ueqv_R009NYNYN_partial_20_0186,
  rs_R009_ueqv_R009NYNYN_partial_20_0187,
  rs_R009_ueqv_R009NYNYN_partial_20_0188,
  rs_R009_ueqv_R009NYNYN_partial_20_0189,
  rs_R009_ueqv_R009NYNYN_partial_20_0190,
  rs_R009_ueqv_R009NYNYN_partial_20_0191,
  rs_R009_ueqv_R009NYNYN_partial_20_0192,
  rs_R009_ueqv_R009NYNYN_partial_20_0193,
  rs_R009_ueqv_R009NYNYN_partial_20_0194,
  rs_R009_ueqv_R009NYNYN_partial_20_0195,
  rs_R009_ueqv_R009NYNYN_partial_20_0196,
  rs_R009_ueqv_R009NYNYN_partial_20_0197,
  rs_R009_ueqv_R009NYNYN_partial_20_0198,
  rs_R009_ueqv_R009NYNYN_partial_20_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_20_0100_0199 : Poly :=
[
  term ((-33218765405160736145278961217048479709102436915181404452092178314 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-1139860887411616415584844440855659116238848957112464 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((415262605870951993020 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1523249736739420719856 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((563285694572217147594208373088747504178009195157072 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((839553823511759666956 : Rat) / 371936422684919856099) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-34984775413942168319971593447185078986917471180884 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1115361852418127920205 : Rat) / 371936422684919856099) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3365031392586633644284149513677110709153972220643379593561499303217300057631908967972 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14828900939133452010176265011 : Rat) / 200449527924288537552253050) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8543353362424791802582409118527556400244635297151860313627581678 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((8481461131493702551067 : Rat) / 2603554958794438992693) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((563285694572217147594208373088747504178009195157072 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((839553823511759666956 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-34984775413942168319971593447185078986917471180884 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1115361852418127920205 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3365031392586633644284149513677110709153972220643379593561499303217300057631908967972 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14828900939133452010176265011 : Rat) / 200449527924288537552253050) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8543353362424791802582409118527556400244635297151860313627581678 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((8481461131493702551067 : Rat) / 2603554958794438992693) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33218765405160736145278961217048479709102436915181404452092178314 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (9, 1), (11, 2)],
  term ((-1139860887411616415584844440855659116238848957112464 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((415262605870951993020 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1523249736739420719856 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((16609382702580368072639480608524239854551218457590702226046089157 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (10, 2), (11, 1)],
  term ((569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-761624868369710359928 : Rat) / 619894037808199760165) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-281642847286108573797104186544373752089004597578536 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((-419776911755879833478 : Rat) / 371936422684919856099) [(1, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((17492387706971084159985796723592539493458735590442 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1682515696293316822142074756838555354576986110321689796780749651608650028815954483986 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (10, 2), (13, 1)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((14828900939133452010176265011 : Rat) / 400899055848577075104506100) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((4271676681212395901291204559263778200122317648575930156813790839 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (10, 2), (15, 1)],
  term ((-8481461131493702551067 : Rat) / 5207109917588877985386) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-281642847286108573797104186544373752089004597578536 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-419776911755879833478 : Rat) / 371936422684919856099) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((17492387706971084159985796723592539493458735590442 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((1115361852418127920205 : Rat) / 743872845369839712198) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1682515696293316822142074756838555354576986110321689796780749651608650028815954483986 : Rat) / 852025577964526932792805366327156127502636952333184175211182665375154292598668125) [(1, 1), (11, 2), (13, 1)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((14828900939133452010176265011 : Rat) / 400899055848577075104506100) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((4271676681212395901291204559263778200122317648575930156813790839 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (11, 2), (15, 1)],
  term ((-8481461131493702551067 : Rat) / 5207109917588877985386) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((16609382702580368072639480608524239854551218457590702226046089157 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (11, 3)],
  term ((569930443705808207792422220427829558119424478556232 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 3), (12, 1)],
  term ((-207631302935475996510 : Rat) / 123978807561639952033) [(1, 1), (11, 3), (12, 1), (16, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-761624868369710359928 : Rat) / 619894037808199760165) [(1, 1), (11, 3), (16, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 2)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 2), (16, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (9, 1), (11, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 1), (11, 2)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 1), (11, 2), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 2)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 2), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 3)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 3), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (11, 2)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (11, 2), (16, 1)],
  term ((7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 2)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2)],
  term ((7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (9, 1), (10, 2), (11, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (9, 1), (10, 2), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (9, 1), (11, 3)],
  term ((-261470726477523986510250839701586970519507722194758860800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (4, 1), (9, 2), (11, 1), (15, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (4, 1), (9, 2), (11, 2)],
  term ((-11884369742440281839183632797399583519594497507679027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((288896195113924636908366915387893701718571947212479692800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2)],
  term ((294645732639371453510620971839082842810921192891394252800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((132682793498815461072210189022043374561232667362434662400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-70642547572274725049849372758938267220703910794605260800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 1), (10, 2), (11, 1)],
  term ((-21062052038543994140010148395124948636591588396186828800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (10, 2), (13, 1)],
  term ((-110112472635506262204356627532628754784492168510187520000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 2), (13, 1)],
  term ((-144448097556962318454183457693946850859285973606239846400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 1), (11, 3)],
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (5, 1), (8, 2), (10, 1), (11, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (10, 1), (13, 1)],
  term ((288896195113924636908366915387893701718571947212479692800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 2), (10, 1), (15, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((5942184871220140919591816398699791759797248753839513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 2)],
  term ((132682793498815461072210189022043374561232667362434662400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-70642547572274725049849372758938267220703910794605260800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((300587917510591594430212788237782634570718441645233766400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (11, 2)],
  term ((-11884369742440281839183632797399583519594497507679027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 2), (11, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (11, 2), (13, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-147322866319685726755310485919541421405460596445697126400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 2), (11, 1)],
  term ((-66341396749407730536105094511021687280616333681217331200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 2), (13, 1)],
  term ((35321273786137362524924686379469133610351955397302630400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (10, 2), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 3), (13, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 3), (15, 1)],
  term ((-66341396749407730536105094511021687280616333681217331200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (11, 2), (13, 1)],
  term ((35321273786137362524924686379469133610351955397302630400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-147322866319685726755310485919541421405460596445697126400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 3)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (10, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (10, 2)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (11, 2)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 2), (10, 1)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (9, 1), (11, 1)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (10, 2)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (11, 2)],
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(2, 1), (6, 1), (8, 1), (10, 1)],
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(2, 1), (6, 1), (10, 2)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (10, 2), (16, 1)],
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(2, 1), (6, 1), (11, 2)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-1922822803586202111182856588347249577939699502026247742806924973 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((25382156487932776209797584 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((30056747940448112621827683117151542644957837143305536645014046735565845911 : Rat) / 165057813324584569578317092862293049837969974748560512596013601801458000) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-5181294973069623071913 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (8, 1), (9, 1), (11, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-326838408096904983137813549626983713149384652743448576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((194044465928005960251571260586876175914588109312000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (8, 1), (10, 1)],
  term ((-986267382603788139921538684771684211246707121942190917670546380041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((160854894767932680440111483342605055511626411290724528486676696327608254571 : Rat) / 420340681353381537805099183906256209259989013074955194279729083159070125) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((29974688571900610378996 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (8, 1), (10, 1), (11, 2)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (8, 1), (10, 1), (12, 1)],
  term ((1809939744691845776614 : Rat) / 32049107564750198685) [(2, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 137811591051044750088486471407638315748706454820858225335628932925458605428832000) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-607733402163340178684804113 : Rat) / 3788172465045908734368315) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (10, 1), (13, 2)],
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 2331857140095005035380781079495398704704886755740035454371507930277897536000) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((2337865075894859448097 : Rat) / 32049107564750198685) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10513859879580368560603 : Rat) / 64098215129500397370) [(2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-473319695429009184215726057758608264926036105776268738739680097305348583571 : Rat) / 927232446072769555082110177031799075944910661791652361997304902973488000) [(2, 1), (8, 1), (10, 2)],
  term ((-48619366930769211474071392135498441435791748460779436808219071272 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((18413330959791591616282913083723439039267065329304860632615135636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((115157008530580162235907346936917052694198817285593683178898534264221991091 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (8, 1), (10, 2), (13, 2)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-206728997562182094743875255634085164670183604957291938347869627925 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-37210728310418002212 : Rat) / 3561011951638910965) [(2, 1), (8, 1), (10, 2), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 1), (8, 1), (11, 2)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((163419204048452491568906774813491856574692326371724288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (11, 2), (16, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 3), (13, 1)],
  term ((-97022232964002980125785630293438087957294054656000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 3), (15, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (8, 2), (10, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((194044465928005960251571260586876175914588109312000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-326838408096904983137813549626983713149384652743448576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (10, 1), (15, 2)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (10, 1), (16, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3097093991272347006578835834404290076167037 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-818752286631539806936 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((3097093991272347006578835834404290076167037 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((409376143315769903468 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1922822803586202111182856588347249577939699502026247742806924973 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((-12691078243966388104898792 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-30056747940448112621827683117151542644957837143305536645014046735565845911 : Rat) / 330115626649169139156634185724586099675939949497121025192027203602916000) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((5181294973069623071913 : Rat) / 8678516529314796642310) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 3), (13, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 3), (13, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 3), (15, 1)],
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (9, 1), (11, 1)],
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((1809939744691845776614 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 137811591051044750088486471407638315748706454820858225335628932925458605428832000) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-607733402163340178684804113 : Rat) / 3788172465045908734368315) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 2331857140095005035380781079495398704704886755740035454371507930277897536000) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((2337865075894859448097 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10513859879580368560603 : Rat) / 64098215129500397370) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1452653046163795920596771402335347940029611665561407058127850817711712611584918253 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((-35655060665494470082693304 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((247127795889021978667033087856963781941832077215235336861389161826260714761599 : Rat) / 847406813608417180215079954755012517868137850359109671667933831648685372000) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((13026134423374168765981 : Rat) / 1735703305862959328462) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-76376514559263155933536541781399380446645859502178434122930551171 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (11, 3)],
  term ((2177109905057608628664 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 3), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (9, 2), (11, 1), (13, 1)],
  term ((25382156487932776209797584 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((30056747940448112621827683117151542644957837143305536645014046735565845911 : Rat) / 165057813324584569578317092862293049837969974748560512596013601801458000) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-5181294973069623071913 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1922822803586202111182856588347249577939699502026247742806924973 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 2), (11, 2)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (11, 2), (16, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (10, 1), (11, 2)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (11, 2), (13, 2)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (11, 2), (13, 2), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 3), (13, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 3), (13, 1), (16, 1)],
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1), (10, 2)],
  term ((986267382603788139921538684771684211246707121942190917670546380041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (10, 2), (11, 1), (13, 1)],
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-160854894767932680440111483342605055511626411290724528486676696327608254571 : Rat) / 840681362706763075610198367812512418519978026149910388559458166318140250) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-14987344285950305189498 : Rat) / 4339258264657398321155) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (10, 2), (11, 2)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (10, 2), (11, 2), (16, 1)],
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (10, 2), (12, 1)],
  term ((-904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (10, 2), (12, 1), (16, 1)],
  term ((1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((607733402163340178684804113 : Rat) / 7576344930091817468736630) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (10, 2), (13, 2)],
  term ((-89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (10, 2), (13, 2), (16, 1)],
  term ((-8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(2, 1), (10, 2), (15, 2)],
  term ((-2337865075894859448097 : Rat) / 64098215129500397370) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((10513859879580368560603 : Rat) / 128196430259000794740) [(2, 1), (10, 2), (16, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (10, 3)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 3), (11, 1), (13, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 3), (11, 1), (13, 1), (16, 1)],
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 3), (11, 1), (15, 1)],
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 3), (11, 1), (15, 1), (16, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (10, 3), (13, 1), (15, 1)],
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 3), (13, 2)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 3), (13, 2), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (10, 3), (15, 2)],
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 3), (15, 2), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (10, 3), (16, 1)],
  term ((487130237624020176917582541350834078987736002654014495662463082581225535774385673 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 1), (11, 2)],
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (11, 2), (12, 1)],
  term ((-904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((1118915390468535661882572332802835403555259420722452856579780102579860149054859857283 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((607733402163340178684804113 : Rat) / 7576344930091817468736630) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (11, 2), (13, 2)],
  term ((-89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (11, 2), (13, 2), (16, 1)],
  term ((-8446461967795234733954572402230938007756530209840109626387176004215083410443563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(2, 1), (11, 2), (15, 2)],
  term ((-2337865075894859448097 : Rat) / 64098215129500397370) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((10513859879580368560603 : Rat) / 128196430259000794740) [(2, 1), (11, 2), (16, 1)],
  term ((986267382603788139921538684771684211246707121942190917670546380041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (11, 3), (13, 1)],
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (11, 3), (13, 1), (16, 1)],
  term ((-160854894767932680440111483342605055511626411290724528486676696327608254571 : Rat) / 840681362706763075610198367812512418519978026149910388559458166318140250) [(2, 1), (11, 3), (15, 1)],
  term ((-14987344285950305189498 : Rat) / 4339258264657398321155) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (11, 4)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 4), (16, 1)],
  term ((52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (8, 1), (10, 1)],
  term ((2351173712567921433254 : Rat) / 32049107564750198685) [(2, 2), (8, 1), (10, 1), (16, 1)],
  term ((52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (9, 1), (11, 1)],
  term ((2351173712567921433254 : Rat) / 32049107564750198685) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2), (10, 2)],
  term ((-1175586856283960716627 : Rat) / 32049107564750198685) [(2, 2), (10, 2), (16, 1)],
  term ((-52801722377940617666757453128755197736315286589511870116395682141857480407209997 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2), (11, 2)],
  term ((-1175586856283960716627 : Rat) / 32049107564750198685) [(2, 2), (11, 2), (16, 1)],
  term ((-10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (8, 1), (10, 1)],
  term ((-10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1)],
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (10, 2)],
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (11, 2)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (9, 1), (11, 2)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (10, 2), (11, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (10, 2), (15, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (11, 3)],
  term ((-114195168198631507608049686855376629525735102330112000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1), (8, 1), (10, 1)],
  term ((-114195168198631507608049686855376629525735102330112000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((57097584099315753804024843427688314762867551165056000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1), (10, 2)],
  term ((57097584099315753804024843427688314762867551165056000 : Rat) / 307932358626947755316370600866895220476893430747096231) [(3, 1), (5, 1), (11, 2)],
  term ((-1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(3, 1), (7, 1), (10, 2)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(3, 1), (7, 1), (11, 2)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(3, 1), (8, 1), (9, 1), (10, 1)],
  term ((-2583170809312709576430073 : Rat) / 841816103343535274304070) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (8, 1), (9, 1), (10, 2)],
  term ((-559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27529190067687589412871730581799460468714 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (8, 1), (10, 2), (11, 1)],
  term ((422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-210034756054422200464578755432522058009815470619053168375599344919069563921056393 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((-879279135141393659953916 : Rat) / 180389165002186130208015) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (11, 2), (13, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 2), (10, 1), (13, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (10, 1), (15, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-181690192657766865785367309797072973832799 : Rat) / 949612199415550756037108836232779182852) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-7500550714288572467756 : Rat) / 2603554958794438992693) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2639945942832151523876027749199541781051697 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((3240575332365290892730 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 1315175374720263463693804089779779427731349943757338210428633306718759697344000) [(3, 1), (9, 1), (10, 2)],
  term ((2583170809312709576430073 : Rat) / 1683632206687070548608140) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 3)],
  term ((279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 3), (16, 1)],
  term ((14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 1315175374720263463693804089779779427731349943757338210428633306718759697344000) [(3, 1), (9, 1), (11, 2)],
  term ((2583170809312709576430073 : Rat) / 1683632206687070548608140) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (9, 2), (10, 1), (11, 1)],
  term ((-559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-14664374551449169226657485275890500506612518874644785819005236619261447114353761 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(3, 1), (9, 2), (11, 1)],
  term ((-2583170809312709576430073 : Rat) / 841816103343535274304070) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (10, 1), (11, 3)],
  term ((-211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 3), (16, 1)],
  term ((13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (10, 3), (11, 1)],
  term ((-211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 3), (11, 1), (16, 1)],
  term ((181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (10, 3), (13, 1)],
  term ((3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NYNYN_block_20_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_20_0100_0199
      rs_R009_ueqv_R009NYNYN_block_20_0100_0199 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
