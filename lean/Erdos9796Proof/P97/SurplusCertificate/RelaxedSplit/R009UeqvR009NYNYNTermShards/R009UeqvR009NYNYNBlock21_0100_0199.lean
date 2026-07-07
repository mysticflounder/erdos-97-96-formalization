/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 21:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 : Poly :=
[
  term (2 : Rat) [(8, 1), (14, 1)],
  term (2 : Rat) [(9, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0100 : Poly :=
[
  term ((53241884213466178349 : Rat) / 106267549338548530314) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0100 : Poly :=
[
  term ((53241884213466178349 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((53241884213466178349 : Rat) / 53133774669274265157) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-53241884213466178349 : Rat) / 106267549338548530314) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-53241884213466178349 : Rat) / 106267549338548530314) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0100_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0100
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0101 : Poly :=
[
  term ((-16960804649418855735610764704090796330528299934388 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (13, 1)]
]

/-- Partial product 101 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0101 : Poly :=
[
  term ((-33921609298837711471221529408181592661056599868776 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-33921609298837711471221529408181592661056599868776 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((16960804649418855735610764704090796330528299934388 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (13, 1), (14, 2)],
  term ((16960804649418855735610764704090796330528299934388 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0101_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0101
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0102 : Poly :=
[
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 102 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0102 : Poly :=
[
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0102_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0102
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0103 : Poly :=
[
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 103 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0103 : Poly :=
[
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0103_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0103
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0104 : Poly :=
[
  term ((6335176435538651663567 : Rat) / 1487745690739679424396) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 104 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0104 : Poly :=
[
  term ((6335176435538651663567 : Rat) / 743872845369839712198) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((6335176435538651663567 : Rat) / 743872845369839712198) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6335176435538651663567 : Rat) / 1487745690739679424396) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6335176435538651663567 : Rat) / 1487745690739679424396) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0104_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0104
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0105 : Poly :=
[
  term ((-93459463953226618234728225354043046503444686377 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (15, 1)]
]

/-- Partial product 105 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0105 : Poly :=
[
  term ((-186918927906453236469456450708086093006889372754 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-186918927906453236469456450708086093006889372754 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (9, 1), (15, 2)],
  term ((93459463953226618234728225354043046503444686377 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (14, 2), (15, 1)],
  term ((93459463953226618234728225354043046503444686377 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0105_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0105
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0106 : Poly :=
[
  term ((-350870370375966281290 : Rat) / 371936422684919856099) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0106 : Poly :=
[
  term ((-701740740751932562580 : Rat) / 371936422684919856099) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-701740740751932562580 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((350870370375966281290 : Rat) / 371936422684919856099) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((350870370375966281290 : Rat) / 371936422684919856099) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0106_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0106
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0107 : Poly :=
[
  term ((79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 436344680504832731803345965662023094562310899666659935057555248458112000) [(2, 1)]
]

/-- Partial product 107 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0107 : Poly :=
[
  term ((79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 218172340252416365901672982831011547281155449833329967528777624229056000) [(2, 1), (8, 1), (14, 1)],
  term ((79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 218172340252416365901672982831011547281155449833329967528777624229056000) [(2, 1), (9, 1), (15, 1)],
  term ((-79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 436344680504832731803345965662023094562310899666659935057555248458112000) [(2, 1), (14, 2)],
  term ((-79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 436344680504832731803345965662023094562310899666659935057555248458112000) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0107_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0107
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0108 : Poly :=
[
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 108 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0108 : Poly :=
[
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0108_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0108
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0109 : Poly :=
[
  term ((-914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 109 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0109 : Poly :=
[
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (15, 2)],
  term ((914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (15, 3)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0109_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0109
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0110 : Poly :=
[
  term ((4113820295460097559717411352946009679859633752658124800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 110 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0110 : Poly :=
[
  term ((8227640590920195119434822705892019359719267505316249600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-4113820295460097559717411352946009679859633752658124800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (14, 2)],
  term ((-4113820295460097559717411352946009679859633752658124800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((8227640590920195119434822705892019359719267505316249600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0110_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0110
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0111 : Poly :=
[
  term ((1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 111 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0111 : Poly :=
[
  term ((2747669637540564397162249049910166650950567627857920000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((2747669637540564397162249049910166650950567627857920000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0111_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0111
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0112 : Poly :=
[
  term ((-686917409385141099290562262477541662737641906964480000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 112 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0112 : Poly :=
[
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((686917409385141099290562262477541662737641906964480000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((686917409385141099290562262477541662737641906964480000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0112_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0112
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0113 : Poly :=
[
  term ((-9940199429414404522231090023327553737871056322860236800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 113 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0113 : Poly :=
[
  term ((-19880398858828809044462180046655107475742112645720473600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-19880398858828809044462180046655107475742112645720473600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((9940199429414404522231090023327553737871056322860236800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((9940199429414404522231090023327553737871056322860236800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0113_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0113
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0114 : Poly :=
[
  term ((-9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 114 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0114 : Poly :=
[
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0114_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0114
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0115 : Poly :=
[
  term ((57616109721168571331009092150228565280146513510759526400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 115 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0115 : Poly :=
[
  term ((115232219442337142662018184300457130560293027021519052800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((115232219442337142662018184300457130560293027021519052800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((-57616109721168571331009092150228565280146513510759526400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-57616109721168571331009092150228565280146513510759526400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0115_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0115
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0116 : Poly :=
[
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2)]
]

/-- Partial product 116 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0116 : Poly :=
[
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (14, 1)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (9, 1), (15, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (14, 2)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0116_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0116
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0117 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (8, 1)]
]

/-- Partial product 117 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0117 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (8, 1), (14, 2)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (8, 1), (15, 2)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0117_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0117
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0118 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 118 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0118 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0118_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0118
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0119 : Poly :=
[
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 119 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0119 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (15, 3)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0119_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0119
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0120 : Poly :=
[
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 120 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0120 : Poly :=
[
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (15, 3)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0120_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0120
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0121 : Poly :=
[
  term ((32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (15, 2)]
]

/-- Partial product 121 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0121 : Poly :=
[
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (15, 3)],
  term ((-32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (14, 2), (15, 2)],
  term ((-32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (15, 4)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0121_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0121
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0122 : Poly :=
[
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 122 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0122 : Poly :=
[
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (14, 2), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0122_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0122
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0123 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 123 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0123 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0123_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0123
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0124 : Poly :=
[
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 124 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0124 : Poly :=
[
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0124_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0124
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0125 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 125 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0125 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 1), (15, 3)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0125_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0125
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0126 : Poly :=
[
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0126 : Poly :=
[
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0126_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0126
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0127 : Poly :=
[
  term ((-3973529702006812009569926395678532100689109399058610028687475027 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 127 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0127 : Poly :=
[
  term ((-3973529702006812009569926395678532100689109399058610028687475027 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((3973529702006812009569926395678532100689109399058610028687475027 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((3973529702006812009569926395678532100689109399058610028687475027 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-3973529702006812009569926395678532100689109399058610028687475027 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0127_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0127
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0128 : Poly :=
[
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 128 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0128 : Poly :=
[
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0128_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0128
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0129 : Poly :=
[
  term ((-402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 129 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0129 : Poly :=
[
  term ((-402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0129_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0129
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0130 : Poly :=
[
  term ((-12691078243966388104898792 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 130 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0130 : Poly :=
[
  term ((-25382156487932776209797584 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12691078243966388104898792 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((12691078243966388104898792 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25382156487932776209797584 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0130_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0130
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0131 : Poly :=
[
  term ((2830925962765784778854986596144924611155684363019131303855681970100542580917341 : Rat) / 13605262497106173762349697480480476838600171831972464245813448000538893420800) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 131 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0131 : Poly :=
[
  term ((2830925962765784778854986596144924611155684363019131303855681970100542580917341 : Rat) / 6802631248553086881174848740240238419300085915986232122906724000269446710400) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2830925962765784778854986596144924611155684363019131303855681970100542580917341 : Rat) / 13605262497106173762349697480480476838600171831972464245813448000538893420800) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2830925962765784778854986596144924611155684363019131303855681970100542580917341 : Rat) / 13605262497106173762349697480480476838600171831972464245813448000538893420800) [(2, 1), (9, 1), (15, 3)],
  term ((2830925962765784778854986596144924611155684363019131303855681970100542580917341 : Rat) / 6802631248553086881174848740240238419300085915986232122906724000269446710400) [(2, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0131_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0131
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0132 : Poly :=
[
  term ((6208785290316328380472624 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0132 : Poly :=
[
  term ((12417570580632656760945248 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6208785290316328380472624 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6208785290316328380472624 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((12417570580632656760945248 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0132_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0132
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0133 : Poly :=
[
  term ((22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 133 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0133 : Poly :=
[
  term ((45671190677972704413695000643485550596477344010237007922471871272 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((45671190677972704413695000643485550596477344010237007922471871272 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0133_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0133
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0134 : Poly :=
[
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 134 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0134 : Poly :=
[
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0134_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0134
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0135 : Poly :=
[
  term ((-11417797669493176103423750160871387649119336002559251980617967818 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 135 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0135 : Poly :=
[
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((11417797669493176103423750160871387649119336002559251980617967818 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((11417797669493176103423750160871387649119336002559251980617967818 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0135_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0135
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0136 : Poly :=
[
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0136 : Poly :=
[
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0136_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0136
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0137 : Poly :=
[
  term ((-101390148622435599073629931829565698435976010229045670240321693258721575091 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 137 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0137 : Poly :=
[
  term ((-101390148622435599073629931829565698435976010229045670240321693258721575091 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-101390148622435599073629931829565698435976010229045670240321693258721575091 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((101390148622435599073629931829565698435976010229045670240321693258721575091 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((101390148622435599073629931829565698435976010229045670240321693258721575091 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0137_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0137
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0138 : Poly :=
[
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0138 : Poly :=
[
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0138_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0138
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0139 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 2)]
]

/-- Partial product 139 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0139 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 2), (14, 2)],
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0139_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0139
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0140 : Poly :=
[
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 140 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0140 : Poly :=
[
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0140_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0140
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0141 : Poly :=
[
  term ((269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 141 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0141 : Poly :=
[
  term ((269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(2, 1), (9, 1), (10, 1), (15, 3)],
  term ((-269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (10, 1), (14, 2), (15, 2)],
  term ((-269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0141_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0141
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0142 : Poly :=
[
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0142 : Poly :=
[
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0142_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0142
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0143 : Poly :=
[
  term ((1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 143 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0143 : Poly :=
[
  term ((1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0143_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0143
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0144 : Poly :=
[
  term ((22233877413239826640220192 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0144 : Poly :=
[
  term ((44467754826479653280440384 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((44467754826479653280440384 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22233877413239826640220192 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-22233877413239826640220192 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0144_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0144
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0145 : Poly :=
[
  term ((-2937998416978756049805697116082782965852288574386105735115826963481121080791 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 145 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0145 : Poly :=
[
  term ((-2937998416978756049805697116082782965852288574386105735115826963481121080791 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2937998416978756049805697116082782965852288574386105735115826963481121080791 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((2937998416978756049805697116082782965852288574386105735115826963481121080791 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((2937998416978756049805697116082782965852288574386105735115826963481121080791 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0145_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0145
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0146 : Poly :=
[
  term ((-16423038729140118859592 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0146 : Poly :=
[
  term ((-32846077458280237719184 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32846077458280237719184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((16423038729140118859592 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((16423038729140118859592 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0146_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0146
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0147 : Poly :=
[
  term ((392605441001686140743468804816812959919787262531752714547491572 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (11, 2)]
]

/-- Partial product 147 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0147 : Poly :=
[
  term ((785210882003372281486937609633625919839574525063505429094983144 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (8, 1), (11, 2), (14, 1)],
  term ((785210882003372281486937609633625919839574525063505429094983144 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-392605441001686140743468804816812959919787262531752714547491572 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (11, 2), (14, 2)],
  term ((-392605441001686140743468804816812959919787262531752714547491572 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0147_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0147
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0148 : Poly :=
[
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 148 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0148 : Poly :=
[
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0148_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0148
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0149 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (12, 1)]
]

/-- Partial product 149 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0149 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (8, 1), (12, 1), (14, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (12, 1), (14, 2)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0149_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0149
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0150 : Poly :=
[
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 150 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0150 : Poly :=
[
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0150_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0150
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0151 : Poly :=
[
  term ((6695847069507941267179781970441953242164789476503792483558719606841760417893867411537 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 151 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0151 : Poly :=
[
  term ((6695847069507941267179781970441953242164789476503792483558719606841760417893867411537 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((6695847069507941267179781970441953242164789476503792483558719606841760417893867411537 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-6695847069507941267179781970441953242164789476503792483558719606841760417893867411537 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6695847069507941267179781970441953242164789476503792483558719606841760417893867411537 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0151_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0151
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0152 : Poly :=
[
  term ((272669425241007769493769242 : Rat) / 3788172465045908734368315) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0152 : Poly :=
[
  term ((545338850482015538987538484 : Rat) / 3788172465045908734368315) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((545338850482015538987538484 : Rat) / 3788172465045908734368315) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-272669425241007769493769242 : Rat) / 3788172465045908734368315) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-272669425241007769493769242 : Rat) / 3788172465045908734368315) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0152_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0152
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0153 : Poly :=
[
  term ((-150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (13, 2)]
]

/-- Partial product 153 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0153 : Poly :=
[
  term ((-301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (13, 2), (14, 1)],
  term ((-301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (13, 2), (14, 2)],
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0153_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0153
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0154 : Poly :=
[
  term ((-89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 154 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0154 : Poly :=
[
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (14, 2), (16, 1)],
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0154_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0154
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0155 : Poly :=
[
  term ((-58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (15, 2)]
]

/-- Partial product 155 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0155 : Poly :=
[
  term ((-58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (9, 1), (15, 3)],
  term ((58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (14, 2), (15, 2)],
  term ((58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0155_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0155
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0156 : Poly :=
[
  term ((-1169707052054176376051 : Rat) / 32049107564750198685) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 156 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0156 : Poly :=
[
  term ((-2339414104108352752102 : Rat) / 32049107564750198685) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2339414104108352752102 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((1169707052054176376051 : Rat) / 32049107564750198685) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((1169707052054176376051 : Rat) / 32049107564750198685) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0156_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0156
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0157 : Poly :=
[
  term ((17341104038566791669 : Rat) / 3561011951638910965) [(2, 1), (16, 1)]
]

/-- Partial product 157 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0157 : Poly :=
[
  term ((34682208077133583338 : Rat) / 3561011951638910965) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((34682208077133583338 : Rat) / 3561011951638910965) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17341104038566791669 : Rat) / 3561011951638910965) [(2, 1), (14, 2), (16, 1)],
  term ((-17341104038566791669 : Rat) / 3561011951638910965) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0157_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0157
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0158 : Poly :=
[
  term ((-24274205914176426404226583571501920789828905581304883200 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1)]
]

/-- Partial product 158 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0158 : Poly :=
[
  term ((-48548411828352852808453167143003841579657811162609766400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (8, 1), (14, 1)],
  term ((-48548411828352852808453167143003841579657811162609766400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((24274205914176426404226583571501920789828905581304883200 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (14, 2)],
  term ((24274205914176426404226583571501920789828905581304883200 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0158_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0158
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0159 : Poly :=
[
  term ((2742546863640065039811607568630673119906422501772083200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1)]
]

/-- Partial product 159 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0159 : Poly :=
[
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2742546863640065039811607568630673119906422501772083200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (14, 2)],
  term ((-2742546863640065039811607568630673119906422501772083200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0159_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0159
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0160 : Poly :=
[
  term ((3149149553489948 : Rat) / 449528123497443) [(3, 1), (7, 1)]
]

/-- Partial product 160 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0160 : Poly :=
[
  term ((6298299106979896 : Rat) / 449528123497443) [(3, 1), (7, 1), (8, 1), (14, 1)],
  term ((6298299106979896 : Rat) / 449528123497443) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 449528123497443) [(3, 1), (7, 1), (14, 2)],
  term ((-3149149553489948 : Rat) / 449528123497443) [(3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0160_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0160
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0161 : Poly :=
[
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 161 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0161 : Poly :=
[
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (13, 1), (14, 2)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0161_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0161
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0162 : Poly :=
[
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 162 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0162 : Poly :=
[
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0162_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0162
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0163 : Poly :=
[
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 163 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0163 : Poly :=
[
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (15, 3)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0163_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0163
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0164 : Poly :=
[
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0164 : Poly :=
[
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0164_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0164
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0165 : Poly :=
[
  term ((16189492878484995573612845028778976004888571515096108196393044217494264391478441 : Rat) / 563646589165827198725916038477048326170578547324573518755128560022325584576000) [(3, 1), (9, 1)]
]

/-- Partial product 165 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0165 : Poly :=
[
  term ((16189492878484995573612845028778976004888571515096108196393044217494264391478441 : Rat) / 281823294582913599362958019238524163085289273662286759377564280011162792288000) [(3, 1), (8, 1), (9, 1), (14, 1)],
  term ((-16189492878484995573612845028778976004888571515096108196393044217494264391478441 : Rat) / 563646589165827198725916038477048326170578547324573518755128560022325584576000) [(3, 1), (9, 1), (14, 2)],
  term ((-16189492878484995573612845028778976004888571515096108196393044217494264391478441 : Rat) / 563646589165827198725916038477048326170578547324573518755128560022325584576000) [(3, 1), (9, 1), (15, 2)],
  term ((16189492878484995573612845028778976004888571515096108196393044217494264391478441 : Rat) / 281823294582913599362958019238524163085289273662286759377564280011162792288000) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0165_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0165
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0166 : Poly :=
[
  term ((-657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 166 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0166 : Poly :=
[
  term ((-657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (9, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0166_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0166
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0167 : Poly :=
[
  term ((279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 167 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0167 : Poly :=
[
  term ((559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0167_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0167
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0168 : Poly :=
[
  term ((4494046841792732854062214 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 168 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0168 : Poly :=
[
  term ((8988093683585465708124428 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4494046841792732854062214 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-4494046841792732854062214 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((8988093683585465708124428 : Rat) / 1262724155015302911456105) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0168_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0168
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0169 : Poly :=
[
  term ((4750436489936515791271227448286481064001326996958066742457610729 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 169 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0169 : Poly :=
[
  term ((9500872979873031582542454896572962128002653993916133484915221458 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((9500872979873031582542454896572962128002653993916133484915221458 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4750436489936515791271227448286481064001326996958066742457610729 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-4750436489936515791271227448286481064001326996958066742457610729 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0169_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0169
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0170 : Poly :=
[
  term ((-211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 170 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0170 : Poly :=
[
  term ((-422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0170_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0170
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0171 : Poly :=
[
  term ((193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 1652230370251587265946990062537411341371042642911228907573659933063768464000) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 171 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0171 : Poly :=
[
  term ((193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 826115185125793632973495031268705670685521321455614453786829966531884232000) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 826115185125793632973495031268705670685521321455614453786829966531884232000) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 1652230370251587265946990062537411341371042642911228907573659933063768464000) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 1652230370251587265946990062537411341371042642911228907573659933063768464000) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0171_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0171
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0172 : Poly :=
[
  term ((1445356799258258932082194 : Rat) / 420908051671767637152035) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 172 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0172 : Poly :=
[
  term ((2890713598516517864164388 : Rat) / 420908051671767637152035) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2890713598516517864164388 : Rat) / 420908051671767637152035) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1445356799258258932082194 : Rat) / 420908051671767637152035) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1445356799258258932082194 : Rat) / 420908051671767637152035) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0172_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0172
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0173 : Poly :=
[
  term ((-92937499068441141676825082144025085055566311657821272687250582312956521007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 173 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0173 : Poly :=
[
  term ((-92937499068441141676825082144025085055566311657821272687250582312956521007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-92937499068441141676825082144025085055566311657821272687250582312956521007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((92937499068441141676825082144025085055566311657821272687250582312956521007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((92937499068441141676825082144025085055566311657821272687250582312956521007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0173_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0173
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0174 : Poly :=
[
  term ((-15487550434283321134 : Rat) / 10683035854916732895) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0174 : Poly :=
[
  term ((-30975100868566642268 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30975100868566642268 : Rat) / 10683035854916732895) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((15487550434283321134 : Rat) / 10683035854916732895) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((15487550434283321134 : Rat) / 10683035854916732895) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0174_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0174
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0175 : Poly :=
[
  term ((-5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(3, 1), (11, 1)]
]

/-- Partial product 175 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0175 : Poly :=
[
  term ((-5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(3, 1), (11, 1), (14, 2)],
  term ((5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0175_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0175
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0176 : Poly :=
[
  term ((-23788130097278761849153258 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 176 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0176 : Poly :=
[
  term ((-47576260194557523698306516 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-47576260194557523698306516 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((23788130097278761849153258 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((23788130097278761849153258 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0176_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0176
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0177 : Poly :=
[
  term ((1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 551246364204179000353945885630553262994825819283432901342515731701834421715328000) [(3, 1), (13, 1)]
]

/-- Partial product 177 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0177 : Poly :=
[
  term ((1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 551246364204179000353945885630553262994825819283432901342515731701834421715328000) [(3, 1), (13, 1), (14, 2)],
  term ((-1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 551246364204179000353945885630553262994825819283432901342515731701834421715328000) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0177_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0177
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0178 : Poly :=
[
  term ((176265690346598912889231763 : Rat) / 3788172465045908734368315) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 178 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0178 : Poly :=
[
  term ((352531380693197825778463526 : Rat) / 3788172465045908734368315) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((352531380693197825778463526 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176265690346598912889231763 : Rat) / 3788172465045908734368315) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-176265690346598912889231763 : Rat) / 3788172465045908734368315) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0178_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0178
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0179 : Poly :=
[
  term ((-8468904103854531900805458932020889129742517280709558593962997582778178442267519 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(3, 1), (15, 1)]
]

/-- Partial product 179 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0179 : Poly :=
[
  term ((-8468904103854531900805458932020889129742517280709558593962997582778178442267519 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-8468904103854531900805458932020889129742517280709558593962997582778178442267519 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(3, 1), (9, 1), (15, 2)],
  term ((8468904103854531900805458932020889129742517280709558593962997582778178442267519 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(3, 1), (14, 2), (15, 1)],
  term ((8468904103854531900805458932020889129742517280709558593962997582778178442267519 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0179_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0179
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0180 : Poly :=
[
  term ((-1176539100276118777763 : Rat) / 64098215129500397370) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 180 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0180 : Poly :=
[
  term ((-1176539100276118777763 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1176539100276118777763 : Rat) / 32049107564750198685) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((1176539100276118777763 : Rat) / 64098215129500397370) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((1176539100276118777763 : Rat) / 64098215129500397370) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0180_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0180
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0181 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 181 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0181 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0181_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0181
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0182 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 182 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0182 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0182_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0182
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0183 : Poly :=
[
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 183 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0183 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0183_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0183
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0184 : Poly :=
[
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 184 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0184 : Poly :=
[
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0184_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0184
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0185 : Poly :=
[
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 185 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0185 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0185_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0185
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0186 : Poly :=
[
  term ((88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 186 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0186 : Poly :=
[
  term ((176842424023488231875269468335849602919759873421491200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((176842424023488231875269468335849602919759873421491200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0186_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0186
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0187 : Poly :=
[
  term ((-148651294733428855559192742769519175705771866642047078400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 187 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0187 : Poly :=
[
  term ((-297302589466857711118385485539038351411543733284094156800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((148651294733428855559192742769519175705771866642047078400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((148651294733428855559192742769519175705771866642047078400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (15, 3)],
  term ((-297302589466857711118385485539038351411543733284094156800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0187_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0187
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0188 : Poly :=
[
  term ((-22188315225460029934204305727260265993026244970850073600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1)]
]

/-- Partial product 188 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0188 : Poly :=
[
  term ((-44376630450920059868408611454520531986052489941700147200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((22188315225460029934204305727260265993026244970850073600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (14, 2)],
  term ((22188315225460029934204305727260265993026244970850073600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (15, 2)],
  term ((-44376630450920059868408611454520531986052489941700147200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0188_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0188
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0189 : Poly :=
[
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 189 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0189 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (14, 2)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0189_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0189
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0190 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 190 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0190 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0190_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0190
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0191 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 191 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0191 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0191_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0191
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0192 : Poly :=
[
  term ((-142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 192 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0192 : Poly :=
[
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0192_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0192
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0193 : Poly :=
[
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 193 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0193 : Poly :=
[
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0193_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0193
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0194 : Poly :=
[
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 194 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0194 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (15, 4)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0194_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0194
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0195 : Poly :=
[
  term ((-4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 195 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0195 : Poly :=
[
  term ((-8583906230364014062456707540329524018698451274013081600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-8583906230364014062456707540329524018698451274013081600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0195_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0195
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0196 : Poly :=
[
  term ((354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 196 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0196 : Poly :=
[
  term ((709076355980682925522682492894512105021443479024985702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((709076355980682925522682492894512105021443479024985702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0196_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0196
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0197 : Poly :=
[
  term ((-177269088995170731380670623223628026255360869756246425600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 197 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0197 : Poly :=
[
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((177269088995170731380670623223628026255360869756246425600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((177269088995170731380670623223628026255360869756246425600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0197_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0197
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0198 : Poly :=
[
  term ((23226385202611787019464123921458848127507721249831014400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 198 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0198 : Poly :=
[
  term ((46452770405223574038928247842917696255015442499662028800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((46452770405223574038928247842917696255015442499662028800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-23226385202611787019464123921458848127507721249831014400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((-23226385202611787019464123921458848127507721249831014400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0198_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0198
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0199 : Poly :=
[
  term ((471586265544832885199393634604285170325223482060953600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 199 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0199 : Poly :=
[
  term ((943172531089665770398787269208570340650446964121907200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((943172531089665770398787269208570340650446964121907200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-471586265544832885199393634604285170325223482060953600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-471586265544832885199393634604285170325223482060953600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0199_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0199
        rs_R009_ueqv_R009NYNYN_generator_21_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_21_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_21_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_21_0100,
  rs_R009_ueqv_R009NYNYN_partial_21_0101,
  rs_R009_ueqv_R009NYNYN_partial_21_0102,
  rs_R009_ueqv_R009NYNYN_partial_21_0103,
  rs_R009_ueqv_R009NYNYN_partial_21_0104,
  rs_R009_ueqv_R009NYNYN_partial_21_0105,
  rs_R009_ueqv_R009NYNYN_partial_21_0106,
  rs_R009_ueqv_R009NYNYN_partial_21_0107,
  rs_R009_ueqv_R009NYNYN_partial_21_0108,
  rs_R009_ueqv_R009NYNYN_partial_21_0109,
  rs_R009_ueqv_R009NYNYN_partial_21_0110,
  rs_R009_ueqv_R009NYNYN_partial_21_0111,
  rs_R009_ueqv_R009NYNYN_partial_21_0112,
  rs_R009_ueqv_R009NYNYN_partial_21_0113,
  rs_R009_ueqv_R009NYNYN_partial_21_0114,
  rs_R009_ueqv_R009NYNYN_partial_21_0115,
  rs_R009_ueqv_R009NYNYN_partial_21_0116,
  rs_R009_ueqv_R009NYNYN_partial_21_0117,
  rs_R009_ueqv_R009NYNYN_partial_21_0118,
  rs_R009_ueqv_R009NYNYN_partial_21_0119,
  rs_R009_ueqv_R009NYNYN_partial_21_0120,
  rs_R009_ueqv_R009NYNYN_partial_21_0121,
  rs_R009_ueqv_R009NYNYN_partial_21_0122,
  rs_R009_ueqv_R009NYNYN_partial_21_0123,
  rs_R009_ueqv_R009NYNYN_partial_21_0124,
  rs_R009_ueqv_R009NYNYN_partial_21_0125,
  rs_R009_ueqv_R009NYNYN_partial_21_0126,
  rs_R009_ueqv_R009NYNYN_partial_21_0127,
  rs_R009_ueqv_R009NYNYN_partial_21_0128,
  rs_R009_ueqv_R009NYNYN_partial_21_0129,
  rs_R009_ueqv_R009NYNYN_partial_21_0130,
  rs_R009_ueqv_R009NYNYN_partial_21_0131,
  rs_R009_ueqv_R009NYNYN_partial_21_0132,
  rs_R009_ueqv_R009NYNYN_partial_21_0133,
  rs_R009_ueqv_R009NYNYN_partial_21_0134,
  rs_R009_ueqv_R009NYNYN_partial_21_0135,
  rs_R009_ueqv_R009NYNYN_partial_21_0136,
  rs_R009_ueqv_R009NYNYN_partial_21_0137,
  rs_R009_ueqv_R009NYNYN_partial_21_0138,
  rs_R009_ueqv_R009NYNYN_partial_21_0139,
  rs_R009_ueqv_R009NYNYN_partial_21_0140,
  rs_R009_ueqv_R009NYNYN_partial_21_0141,
  rs_R009_ueqv_R009NYNYN_partial_21_0142,
  rs_R009_ueqv_R009NYNYN_partial_21_0143,
  rs_R009_ueqv_R009NYNYN_partial_21_0144,
  rs_R009_ueqv_R009NYNYN_partial_21_0145,
  rs_R009_ueqv_R009NYNYN_partial_21_0146,
  rs_R009_ueqv_R009NYNYN_partial_21_0147,
  rs_R009_ueqv_R009NYNYN_partial_21_0148,
  rs_R009_ueqv_R009NYNYN_partial_21_0149,
  rs_R009_ueqv_R009NYNYN_partial_21_0150,
  rs_R009_ueqv_R009NYNYN_partial_21_0151,
  rs_R009_ueqv_R009NYNYN_partial_21_0152,
  rs_R009_ueqv_R009NYNYN_partial_21_0153,
  rs_R009_ueqv_R009NYNYN_partial_21_0154,
  rs_R009_ueqv_R009NYNYN_partial_21_0155,
  rs_R009_ueqv_R009NYNYN_partial_21_0156,
  rs_R009_ueqv_R009NYNYN_partial_21_0157,
  rs_R009_ueqv_R009NYNYN_partial_21_0158,
  rs_R009_ueqv_R009NYNYN_partial_21_0159,
  rs_R009_ueqv_R009NYNYN_partial_21_0160,
  rs_R009_ueqv_R009NYNYN_partial_21_0161,
  rs_R009_ueqv_R009NYNYN_partial_21_0162,
  rs_R009_ueqv_R009NYNYN_partial_21_0163,
  rs_R009_ueqv_R009NYNYN_partial_21_0164,
  rs_R009_ueqv_R009NYNYN_partial_21_0165,
  rs_R009_ueqv_R009NYNYN_partial_21_0166,
  rs_R009_ueqv_R009NYNYN_partial_21_0167,
  rs_R009_ueqv_R009NYNYN_partial_21_0168,
  rs_R009_ueqv_R009NYNYN_partial_21_0169,
  rs_R009_ueqv_R009NYNYN_partial_21_0170,
  rs_R009_ueqv_R009NYNYN_partial_21_0171,
  rs_R009_ueqv_R009NYNYN_partial_21_0172,
  rs_R009_ueqv_R009NYNYN_partial_21_0173,
  rs_R009_ueqv_R009NYNYN_partial_21_0174,
  rs_R009_ueqv_R009NYNYN_partial_21_0175,
  rs_R009_ueqv_R009NYNYN_partial_21_0176,
  rs_R009_ueqv_R009NYNYN_partial_21_0177,
  rs_R009_ueqv_R009NYNYN_partial_21_0178,
  rs_R009_ueqv_R009NYNYN_partial_21_0179,
  rs_R009_ueqv_R009NYNYN_partial_21_0180,
  rs_R009_ueqv_R009NYNYN_partial_21_0181,
  rs_R009_ueqv_R009NYNYN_partial_21_0182,
  rs_R009_ueqv_R009NYNYN_partial_21_0183,
  rs_R009_ueqv_R009NYNYN_partial_21_0184,
  rs_R009_ueqv_R009NYNYN_partial_21_0185,
  rs_R009_ueqv_R009NYNYN_partial_21_0186,
  rs_R009_ueqv_R009NYNYN_partial_21_0187,
  rs_R009_ueqv_R009NYNYN_partial_21_0188,
  rs_R009_ueqv_R009NYNYN_partial_21_0189,
  rs_R009_ueqv_R009NYNYN_partial_21_0190,
  rs_R009_ueqv_R009NYNYN_partial_21_0191,
  rs_R009_ueqv_R009NYNYN_partial_21_0192,
  rs_R009_ueqv_R009NYNYN_partial_21_0193,
  rs_R009_ueqv_R009NYNYN_partial_21_0194,
  rs_R009_ueqv_R009NYNYN_partial_21_0195,
  rs_R009_ueqv_R009NYNYN_partial_21_0196,
  rs_R009_ueqv_R009NYNYN_partial_21_0197,
  rs_R009_ueqv_R009NYNYN_partial_21_0198,
  rs_R009_ueqv_R009NYNYN_partial_21_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_21_0100_0199 : Poly :=
[
  term ((53241884213466178349 : Rat) / 53133774669274265157) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33921609298837711471221529408181592661056599868776 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6335176435538651663567 : Rat) / 743872845369839712198) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-186918927906453236469456450708086093006889372754 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-701740740751932562580 : Rat) / 371936422684919856099) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((53241884213466178349 : Rat) / 53133774669274265157) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33921609298837711471221529408181592661056599868776 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((6335176435538651663567 : Rat) / 743872845369839712198) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-186918927906453236469456450708086093006889372754 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (9, 1), (15, 2)],
  term ((-701740740751932562580 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-53241884213466178349 : Rat) / 106267549338548530314) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-53241884213466178349 : Rat) / 106267549338548530314) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((16960804649418855735610764704090796330528299934388 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (13, 1), (14, 2)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6335176435538651663567 : Rat) / 1487745690739679424396) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((16960804649418855735610764704090796330528299934388 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (13, 1), (15, 2)],
  term ((-6335176435538651663567 : Rat) / 1487745690739679424396) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (15, 4)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((93459463953226618234728225354043046503444686377 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (14, 2), (15, 1)],
  term ((350870370375966281290 : Rat) / 371936422684919856099) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((93459463953226618234728225354043046503444686377 : Rat) / 82929843615153252012734843562623286395923865193) [(1, 1), (15, 3)],
  term ((350870370375966281290 : Rat) / 371936422684919856099) [(1, 1), (15, 3), (16, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((8227640590920195119434822705892019359719267505316249600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (15, 2)],
  term ((2747669637540564397162249049910166650950567627857920000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-19880398858828809044462180046655107475742112645720473600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((115232219442337142662018184300457130560293027021519052800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (15, 3)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1)],
  term ((2747669637540564397162249049910166650950567627857920000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-19880398858828809044462180046655107475742112645720473600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4113820295460097559717411352946009679859633752658124800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (14, 2)],
  term ((111118399146877045102300772947511120880433393268860928000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((8227640590920195119434822705892019359719267505316249600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((686917409385141099290562262477541662737641906964480000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((686917409385141099290562262477541662737641906964480000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (10, 1), (15, 3)],
  term ((9940199429414404522231090023327553737871056322860236800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((9940199429414404522231090023327553737871056322860236800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-57616109721168571331009092150228565280146513510759526400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-57616109721168571331009092150228565280146513510759526400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (15, 3)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (14, 1)],
  term ((-7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (9, 1), (15, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (14, 2)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (15, 2)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3973529702006812009569926395678532100689109399058610028687475027 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-25382156487932776209797584 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((2830925962765784778854986596144924611155684363019131303855681970100542580917341 : Rat) / 6802631248553086881174848740240238419300085915986232122906724000269446710400) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((12417570580632656760945248 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (15, 3)],
  term ((45671190677972704413695000643485550596477344010237007922471871272 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101390148622435599073629931829565698435976010229045670240321693258721575091 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((44467754826479653280440384 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2937998416978756049805697116082782965852288574386105735115826963481121080791 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-32846077458280237719184 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (15, 3)],
  term ((785210882003372281486937609633625919839574525063505429094983144 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (8, 1), (11, 2), (14, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (8, 1), (12, 1), (14, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((6695847069507941267179781970441953242164789476503792483558719606841760417893867411537 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((545338850482015538987538484 : Rat) / 3788172465045908734368315) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (15, 3)],
  term ((-301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (13, 2), (14, 1)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 218172340252416365901672982831011547281155449833329967528777624229056000) [(2, 1), (8, 1), (14, 1)],
  term ((-58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2339414104108352752102 : Rat) / 32049107564750198685) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((34682208077133583338 : Rat) / 3561011951638910965) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (8, 1), (14, 2)],
  term ((-32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (14, 2), (15, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (14, 2), (16, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (8, 1), (15, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (15, 4)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (8, 2), (14, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (14, 1), (15, 2)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (14, 1), (16, 1)],
  term ((45671190677972704413695000643485550596477344010237007922471871272 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6738105287223009666016871845965663745394018748935256437028230177523188967419 : Rat) / 158888777551578221290327491516564847100275846942333063437737593434128507250) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((2107389547967881582976 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((881543854718285994042569467491814473537857051101051182028718745665920166437 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (9, 1), (10, 1), (15, 3)],
  term ((438377816784593949612 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((44467754826479653280440384 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3973529702006812009569926395678532100689109399058610028687475027 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-17470626055144008777699987853212897653519118515912119307304905281253433218 : Rat) / 35450418909321334513683063702937270660481001102707064577808476892933625) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-4826566619387962945624 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((785210882003372281486937609633625919839574525063505429094983144 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((12691078243966388104898792 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((1012738412446311651592881967354773048688500401397941091535092824131534732998412845229 : Rat) / 137811591051044750088486471407638315748706454820858225335628932925458605428832000) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((116682417042782940660446972 : Rat) / 757634493009181746873663) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2830925962765784778854986596144924611155684363019131303855681970100542580917341 : Rat) / 13605262497106173762349697480480476838600171831972464245813448000538893420800) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-6208785290316328380472624 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 218172340252416365901672982831011547281155449833329967528777624229056000) [(2, 1), (9, 1), (15, 1)],
  term ((34682208077133583338 : Rat) / 3561011951638910965) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7355621947197669588067043083701309605589500497140926217896694631189485241953411522469 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (9, 1), (15, 3)],
  term ((-59028552712490434417424434 : Rat) / 757634493009181746873663) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (15, 2)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3973529702006812009569926395678532100689109399058610028687475027 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-402169547664867376247844377343004190853490115830056397941646382493847354902885997 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-25382156487932776209797584 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((2830925962765784778854986596144924611155684363019131303855681970100542580917341 : Rat) / 6802631248553086881174848740240238419300085915986232122906724000269446710400) [(2, 1), (9, 2), (15, 2)],
  term ((12417570580632656760945248 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11417797669493176103423750160871387649119336002559251980617967818 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((11417797669493176103423750160871387649119336002559251980617967818 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (15, 3)],
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((101390148622435599073629931829565698435976010229045670240321693258721575091 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((101390148622435599073629931829565698435976010229045670240321693258721575091 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (10, 1), (13, 1), (15, 3)],
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 2), (14, 2)],
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 2), (15, 2)],
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (10, 1), (14, 2), (15, 2)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (10, 1), (15, 4)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 4), (16, 1)],
  term ((-1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-22233877413239826640220192 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1127412634952300425921815740500793994483747553829926742140556530354427910443218477 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-22233877413239826640220192 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2937998416978756049805697116082782965852288574386105735115826963481121080791 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((16423038729140118859592 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2937998416978756049805697116082782965852288574386105735115826963481121080791 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (11, 1), (15, 3)],
  term ((16423038729140118859592 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-392605441001686140743468804816812959919787262531752714547491572 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (11, 2), (14, 2)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((-392605441001686140743468804816812959919787262531752714547491572 : Rat) / 4899915196056249398982590859489073593843071041795168172920125) [(2, 1), (11, 2), (15, 2)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (12, 1), (14, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (12, 1), (15, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6695847069507941267179781970441953242164789476503792483558719606841760417893867411537 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-272669425241007769493769242 : Rat) / 3788172465045908734368315) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6695847069507941267179781970441953242164789476503792483558719606841760417893867411537 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (13, 1), (15, 3)],
  term ((-272669425241007769493769242 : Rat) / 3788172465045908734368315) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (13, 2), (14, 2)],
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (14, 2), (16, 1)],
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (13, 2), (15, 2)],
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 436344680504832731803345965662023094562310899666659935057555248458112000) [(2, 1), (14, 2)],
  term ((58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (14, 2), (15, 2)],
  term ((1169707052054176376051 : Rat) / 32049107564750198685) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-17341104038566791669 : Rat) / 3561011951638910965) [(2, 1), (14, 2), (16, 1)],
  term ((-79036165872829341622701703805718332899566916932818059947269266966363997443 : Rat) / 436344680504832731803345965662023094562310899666659935057555248458112000) [(2, 1), (15, 2)],
  term ((-17341104038566791669 : Rat) / 3561011951638910965) [(2, 1), (15, 2), (16, 1)],
  term ((58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (15, 4)],
  term ((1169707052054176376051 : Rat) / 32049107564750198685) [(2, 1), (15, 4), (16, 1)],
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((-48548411828352852808453167143003841579657811162609766400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (8, 1), (14, 1)],
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-48548411828352852808453167143003841579657811162609766400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-2742546863640065039811607568630673119906422501772083200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (14, 2)],
  term ((-2742546863640065039811607568630673119906422501772083200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((24274205914176426404226583571501920789828905581304883200 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (14, 2)],
  term ((24274205914176426404226583571501920789828905581304883200 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (15, 2)],
  term ((6298299106979896 : Rat) / 449528123497443) [(3, 1), (7, 1), (8, 1), (14, 1)],
  term ((6298299106979896 : Rat) / 449528123497443) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 449528123497443) [(3, 1), (7, 1), (14, 2)],
  term ((-3149149553489948 : Rat) / 449528123497443) [(3, 1), (7, 1), (15, 2)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((16189492878484995573612845028778976004888571515096108196393044217494264391478441 : Rat) / 281823294582913599362958019238524163085289273662286759377564280011162792288000) [(3, 1), (8, 1), (9, 1), (14, 1)],
  term ((8988093683585465708124428 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((9500872979873031582542454896572962128002653993916133484915221458 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 826115185125793632973495031268705670685521321455614453786829966531884232000) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((2890713598516517864164388 : Rat) / 420908051671767637152035) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-92937499068441141676825082144025085055566311657821272687250582312956521007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-30975100868566642268 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-47576260194557523698306516 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((352531380693197825778463526 : Rat) / 3788172465045908734368315) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (13, 1), (14, 2)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8468904103854531900805458932020889129742517280709558593962997582778178442267519 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1176539100276118777763 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (15, 3)],
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((9500872979873031582542454896572962128002653993916133484915221458 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 826115185125793632973495031268705670685521321455614453786829966531884232000) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((2890713598516517864164388 : Rat) / 420908051671767637152035) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((-279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((30013854239224577695395731171874504512662184083124518487400755846249771406594967 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-4068335476096540020607162 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-47576260194557523698306516 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 275623182102089500176972942815276631497412909641716450671257865850917210857664000) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((352531380693197825778463526 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16189492878484995573612845028778976004888571515096108196393044217494264391478441 : Rat) / 563646589165827198725916038477048326170578547324573518755128560022325584576000) [(3, 1), (9, 1), (14, 2)],
  term ((-4494046841792732854062214 : Rat) / 1262724155015302911456105) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1016849320206660141814297802744082912779216823004353110063904748531507304272444393579 : Rat) / 551246364204179000353945885630553262994825819283432901342515731701834421715328000) [(3, 1), (9, 1), (15, 2)],
  term ((-3113222155896227795408071 : Rat) / 77309642143794055803435) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (9, 2), (10, 1), (15, 1)],
  term ((559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((16189492878484995573612845028778976004888571515096108196393044217494264391478441 : Rat) / 281823294582913599362958019238524163085289273662286759377564280011162792288000) [(3, 1), (9, 2), (15, 1)],
  term ((8988093683585465708124428 : Rat) / 1262724155015302911456105) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4750436489936515791271227448286481064001326996958066742457610729 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-4750436489936515791271227448286481064001326996958066742457610729 : Rat) / 61738931470308742427180644829562327282422695126619118978793575) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 1652230370251587265946990062537411341371042642911228907573659933063768464000) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1445356799258258932082194 : Rat) / 420908051671767637152035) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-193755618717889786799168347706847700840130693923816221641629767897723949247669 : Rat) / 1652230370251587265946990062537411341371042642911228907573659933063768464000) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1445356799258258932082194 : Rat) / 420908051671767637152035) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((92937499068441141676825082144025085055566311657821272687250582312956521007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((15487550434283321134 : Rat) / 10683035854916732895) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((92937499068441141676825082144025085055566311657821272687250582312956521007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (10, 1), (15, 3)],
  term ((15487550434283321134 : Rat) / 10683035854916732895) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(3, 1), (11, 1), (14, 2)],
  term ((23788130097278761849153258 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((5258034081745291483361012900811283389017052589720798877717541615598379302492460543 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(3, 1), (11, 1), (15, 2)],
  term ((23788130097278761849153258 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 551246364204179000353945885630553262994825819283432901342515731701834421715328000) [(3, 1), (13, 1), (14, 2)],
  term ((-176265690346598912889231763 : Rat) / 3788172465045908734368315) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1299385286162607892222987333675368715874711942982403014779733339247573054749014145577 : Rat) / 551246364204179000353945885630553262994825819283432901342515731701834421715328000) [(3, 1), (13, 1), (15, 2)],
  term ((-176265690346598912889231763 : Rat) / 3788172465045908734368315) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8468904103854531900805458932020889129742517280709558593962997582778178442267519 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(3, 1), (14, 2), (15, 1)],
  term ((1176539100276118777763 : Rat) / 64098215129500397370) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((8468904103854531900805458932020889129742517280709558593962997582778178442267519 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(3, 1), (15, 3)],
  term ((1176539100276118777763 : Rat) / 64098215129500397370) [(3, 1), (15, 3), (16, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((176842424023488231875269468335849602919759873421491200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-44376630450920059868408611454520531986052489941700147200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-297302589466857711118385485539038351411543733284094156800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((-8583906230364014062456707540329524018698451274013081600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((709076355980682925522682492894512105021443479024985702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((46452770405223574038928247842917696255015442499662028800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((943172531089665770398787269208570340650446964121907200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((148651294733428855559192742769519175705771866642047078400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((148651294733428855559192742769519175705771866642047078400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (15, 3)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((176842424023488231875269468335849602919759873421491200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-297302589466857711118385485539038351411543733284094156800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-8583906230364014062456707540329524018698451274013081600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((709076355980682925522682492894512105021443479024985702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((46452770405223574038928247842917696255015442499662028800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (14, 2)],
  term ((2373823569483668114141571859263491010433522176457420800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((22188315225460029934204305727260265993026244970850073600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (14, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((22188315225460029934204305727260265993026244970850073600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (15, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (15, 4)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (10, 1), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((-44376630450920059868408611454520531986052489941700147200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (15, 3)],
  term ((4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((177269088995170731380670623223628026255360869756246425600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((177269088995170731380670623223628026255360869756246425600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (15, 3)],
  term ((-23226385202611787019464123921458848127507721249831014400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((-23226385202611787019464123921458848127507721249831014400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-471586265544832885199393634604285170325223482060953600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-471586265544832885199393634604285170325223482060953600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NYNYN_block_21_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_21_0100_0199
      rs_R009_ueqv_R009NYNYN_block_21_0100_0199 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
