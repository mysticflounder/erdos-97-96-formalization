/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0100 : Poly :=
[
  term ((71359278975297377756386045424884585738221566804792 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 100 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0100 : Poly :=
[
  term ((-71359278975297377756386045424884585738221566804792 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (13, 1)],
  term ((142718557950594755512772090849769171476443133609584 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0100_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0100
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0101 : Poly :=
[
  term ((25160641409518320570934454827162148979057818013376 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 101 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0101 : Poly :=
[
  term ((-25160641409518320570934454827162148979057818013376 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((50321282819036641141868909654324297958115636026752 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (3, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0101_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0101
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0102 : Poly :=
[
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 102 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0102 : Poly :=
[
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0102_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0102
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0103 : Poly :=
[
  term ((127418124265430309589661940179567679909262614861158 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 103 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0103 : Poly :=
[
  term ((254836248530860619179323880359135359818525229722316 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-127418124265430309589661940179567679909262614861158 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0103_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0103
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0104 : Poly :=
[
  term ((-2069773019820520474928340839703935368962395978389 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2)]
]

/-- Partial product 104 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0104 : Poly :=
[
  term ((2069773019820520474928340839703935368962395978389 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2)],
  term ((-4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0104_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0104
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0105 : Poly :=
[
  term ((8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (12, 1)]
]

/-- Partial product 105 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0105 : Poly :=
[
  term ((-8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (12, 1)],
  term ((16558184158564163799426726717631482951699167827112 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0105_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0105
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0106 : Poly :=
[
  term ((-4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (14, 1)]
]

/-- Partial product 106 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0106 : Poly :=
[
  term ((4139546039641040949856681679407870737924791956778 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (14, 1)],
  term ((-8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0106_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0106
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0107 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1)]
]

/-- Partial product 107 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0107 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0107_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0107
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0108 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (11, 1)]
]

/-- Partial product 108 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0108 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0108_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0108
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0109 : Poly :=
[
  term ((264287688237722470205615007224626811720531254058107931 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 1), (6, 1)]
]

/-- Partial product 109 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0109 : Poly :=
[
  term ((-264287688237722470205615007224626811720531254058107931 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 1), (6, 1)],
  term ((528575376475444940411230014449253623441062508116215862 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0109_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0109
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0110 : Poly :=
[
  term ((-528575376475444940411230014449253623441062508116215862 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (14, 1)]
]

/-- Partial product 110 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0110 : Poly :=
[
  term ((528575376475444940411230014449253623441062508116215862 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (14, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0110_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0110
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0111 : Poly :=
[
  term ((125000559809082494321390091596657880085501524607897 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1)]
]

/-- Partial product 111 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0111 : Poly :=
[
  term ((-125000559809082494321390091596657880085501524607897 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1)],
  term ((250001119618164988642780183193315760171003049215794 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0111_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0111
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0112 : Poly :=
[
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 112 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0112 : Poly :=
[
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0112_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0112
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0113 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 113 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0113 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0113_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0113
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0114 : Poly :=
[
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 114 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0114 : Poly :=
[
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0114_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0114
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0115 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 115 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0115 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0115_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0115
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0116 : Poly :=
[
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 116 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0116 : Poly :=
[
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0116_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0116
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0117 : Poly :=
[
  term ((134957048101470742762013767227725894458726015397084 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 117 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0117 : Poly :=
[
  term ((-134957048101470742762013767227725894458726015397084 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((269914096202941485524027534455451788917452030794168 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0117_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0117
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0118 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 118 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0118 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0118_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0118
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0119 : Poly :=
[
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 119 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0119 : Poly :=
[
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0119_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0119
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0120 : Poly :=
[
  term ((-2607145701257534632110758097491832554077090108468 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 120 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0120 : Poly :=
[
  term ((-5214291402515069264221516194983665108154180216936 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2607145701257534632110758097491832554077090108468 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0120_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0120
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0121 : Poly :=
[
  term ((-14808865783514190629830397155870963862109477960788 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (10, 1)]
]

/-- Partial product 121 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0121 : Poly :=
[
  term ((14808865783514190629830397155870963862109477960788 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (10, 1)],
  term ((-29617731567028381259660794311741927724218955921576 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0121_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0121
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0122 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 122 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0122 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0122_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0122
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0123 : Poly :=
[
  term ((-211008132131476028115405355255892112711807871218884 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 123 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0123 : Poly :=
[
  term ((-422016264262952056230810710511784225423615742437768 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((211008132131476028115405355255892112711807871218884 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0123_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0123
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0124 : Poly :=
[
  term ((-45100377215621886937014682691915819626845777734204 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 124 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0124 : Poly :=
[
  term ((45100377215621886937014682691915819626845777734204 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-90200754431243773874029365383831639253691555468408 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0124_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0124
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0125 : Poly :=
[
  term ((490247377682091864389750424763867373914497142852864 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 125 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0125 : Poly :=
[
  term ((-490247377682091864389750424763867373914497142852864 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((980494755364183728779500849527734747828994285705728 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0125_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0125
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0126 : Poly :=
[
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 126 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0126 : Poly :=
[
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0126_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0126
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0127 : Poly :=
[
  term ((16905589337120389476584982983303409294097647668108 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 127 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0127 : Poly :=
[
  term ((33811178674240778953169965966606818588195295336216 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-16905589337120389476584982983303409294097647668108 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0127_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0127
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0128 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2)]
]

/-- Partial product 128 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0128 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0128_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0128
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0129 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (12, 1)]
]

/-- Partial product 129 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0129 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (12, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0129_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0129
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0130 : Poly :=
[
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (14, 1)]
]

/-- Partial product 130 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0130 : Poly :=
[
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (14, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0130_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0130
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0131 : Poly :=
[
  term ((-31355562961790308680412110530857152288349899032276 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (12, 1)]
]

/-- Partial product 131 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0131 : Poly :=
[
  term ((31355562961790308680412110530857152288349899032276 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (12, 1)],
  term ((-62711125923580617360824221061714304576699798064552 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0131_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0131
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0132 : Poly :=
[
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 132 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0132 : Poly :=
[
  term ((-182559114551440662842297360000582335145507102869504 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0132_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0132
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0133 : Poly :=
[
  term ((-6106583302206932820280529778380397390787421853856 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 133 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0133 : Poly :=
[
  term ((-12213166604413865640561059556760794781574843707712 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((6106583302206932820280529778380397390787421853856 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0133_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0133
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0134 : Poly :=
[
  term ((6106583302206932820280529778380397390787421853856 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 134 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0134 : Poly :=
[
  term ((-6106583302206932820280529778380397390787421853856 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((12213166604413865640561059556760794781574843707712 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0134_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0134
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0135 : Poly :=
[
  term ((1213725080940552052071807968565653283617684382399452 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 135 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0135 : Poly :=
[
  term ((2427450161881104104143615937131306567235368764798904 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1213725080940552052071807968565653283617684382399452 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0135_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0135
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0136 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 2)]
]

/-- Partial product 136 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0136 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0136_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0136
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0137 : Poly :=
[
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (13, 2), (14, 1)]
]

/-- Partial product 137 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0137 : Poly :=
[
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((182559114551440662842297360000582335145507102869504 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0137_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0137
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0138 : Poly :=
[
  term ((-1289469536376161216538408414879686530482454728320 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 138 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0138 : Poly :=
[
  term ((-2578939072752322433076816829759373060964909456640 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((1289469536376161216538408414879686530482454728320 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0138_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0138
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0139 : Poly :=
[
  term ((35165505107800815868958889931936023108005778090439 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2)]
]

/-- Partial product 139 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0139 : Poly :=
[
  term ((-35165505107800815868958889931936023108005778090439 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2)],
  term ((70331010215601631737917779863872046216011556180878 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0139_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0139
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0140 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (13, 1)]
]

/-- Partial product 140 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0140 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0140_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0140
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0141 : Poly :=
[
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (15, 1)]
]

/-- Partial product 141 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0141 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0141_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0141
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0142 : Poly :=
[
  term ((6314791874056603638586212499642667239163669973596 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (13, 1), (15, 1)]
]

/-- Partial product 142 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0142 : Poly :=
[
  term ((12629583748113207277172424999285334478327339947192 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-6314791874056603638586212499642667239163669973596 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0142_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0142
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0143 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2), (13, 2)]
]

/-- Partial product 143 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0143 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2), (13, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0143_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0143
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0144 : Poly :=
[
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (15, 2)]
]

/-- Partial product 144 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0144 : Poly :=
[
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (14, 1), (15, 2)],
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0144_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0144
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0145 : Poly :=
[
  term ((401003124742996108403140155054478585539696637461987201906975385684 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 145 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0145 : Poly :=
[
  term ((-401003124742996108403140155054478585539696637461987201906975385684 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((802006249485992216806280310108957171079393274923974403813950771368 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0145_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0145
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0146 : Poly :=
[
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 146 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0146 : Poly :=
[
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0146_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0146
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0147 : Poly :=
[
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 147 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0147 : Poly :=
[
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0147_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0147
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0148 : Poly :=
[
  term ((-1935208804495652114368 : Rat) / 867851652931479664231) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 148 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0148 : Poly :=
[
  term ((-3870417608991304228736 : Rat) / 867851652931479664231) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1935208804495652114368 : Rat) / 867851652931479664231) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0148_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0148
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0149 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 149 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0149 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0149_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0149
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0150 : Poly :=
[
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 150 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0150 : Poly :=
[
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0150_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0150
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0151 : Poly :=
[
  term ((50569444251689072167461930596450326940119186094302585700815841156 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 151 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0151 : Poly :=
[
  term ((-50569444251689072167461930596450326940119186094302585700815841156 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((101138888503378144334923861192900653880238372188605171401631682312 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0151_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0151
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0152 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 152 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0152 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0152_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0152
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0153 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 153 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0153 : Poly :=
[
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0153_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0153
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0154 : Poly :=
[
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 154 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0154 : Poly :=
[
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0154_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0154
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0155 : Poly :=
[
  term ((76108125848973826346617593539666685590994022476156012956597145400 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 155 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0155 : Poly :=
[
  term ((152216251697947652693235187079333371181988044952312025913194290800 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-76108125848973826346617593539666685590994022476156012956597145400 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0155_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0155
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0156 : Poly :=
[
  term ((-3852076819738752 : Rat) / 7342292683791569) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0156 : Poly :=
[
  term ((-7704153639477504 : Rat) / 7342292683791569) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0156_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0156
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0157 : Poly :=
[
  term ((1512199065446714122891694074385529454456949443360 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 157 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0157 : Poly :=
[
  term ((-1512199065446714122891694074385529454456949443360 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (9, 1), (11, 1)],
  term ((3024398130893428245783388148771058908913898886720 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0157_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0157
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0158 : Poly :=
[
  term ((332813006961353549881935574404402712322685218587208 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 158 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0158 : Poly :=
[
  term ((-332813006961353549881935574404402712322685218587208 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((665626013922707099763871148808805424645370437174416 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0158_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0158
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0159 : Poly :=
[
  term ((-20173053105124064606075198454462371100311635858852 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 159 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0159 : Poly :=
[
  term ((20173053105124064606075198454462371100311635858852 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-40346106210248129212150396908924742200623271717704 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0159_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0159
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0160 : Poly :=
[
  term ((148329280573045538559366605000473147305724521081472 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 160 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0160 : Poly :=
[
  term ((-148329280573045538559366605000473147305724521081472 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((296658561146091077118733210000946294611449042162944 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0160_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0160
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0161 : Poly :=
[
  term ((173259355915004051794739167183143125158235893255652 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 161 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0161 : Poly :=
[
  term ((346518711830008103589478334366286250316471786511304 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-173259355915004051794739167183143125158235893255652 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0161_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0161
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0162 : Poly :=
[
  term ((583369547328640742820004957672092927351312278176016 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 162 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0162 : Poly :=
[
  term ((-583369547328640742820004957672092927351312278176016 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (13, 1)],
  term ((1166739094657281485640009915344185854702624556352032 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0162_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0162
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0163 : Poly :=
[
  term ((-1416522024071969943349426292255371590833465338841624 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 163 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0163 : Poly :=
[
  term ((1416522024071969943349426292255371590833465338841624 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-2833044048143939886698852584510743181666930677683248 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0163_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0163
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0164 : Poly :=
[
  term ((17005288384955930200285258234123142114705903015090 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 164 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0164 : Poly :=
[
  term ((-17005288384955930200285258234123142114705903015090 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((34010576769911860400570516468246284229411806030180 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0164_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0164
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0165 : Poly :=
[
  term ((11202675471263204725862420367164552727534856737650 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 165 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0165 : Poly :=
[
  term ((22405350942526409451724840734329105455069713475300 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-11202675471263204725862420367164552727534856737650 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0165_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0165
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0166 : Poly :=
[
  term ((35165505107800815868958889931936023108005778090439 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2)]
]

/-- Partial product 166 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0166 : Poly :=
[
  term ((-35165505107800815868958889931936023108005778090439 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2)],
  term ((70331010215601631737917779863872046216011556180878 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0166_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0166
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0167 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (9, 2), (10, 1)]
]

/-- Partial product 167 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0167 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (9, 2), (10, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0167_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0167
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0168 : Poly :=
[
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 168 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0168 : Poly :=
[
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0168_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0168
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0169 : Poly :=
[
  term ((-140662020431203263475835559727744092432023112361756 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (12, 1)]
]

/-- Partial product 169 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0169 : Poly :=
[
  term ((140662020431203263475835559727744092432023112361756 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (12, 1)],
  term ((-281324040862406526951671119455488184864046224723512 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0169_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0169
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0170 : Poly :=
[
  term ((70331010215601631737917779863872046216011556180878 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (14, 1)]
]

/-- Partial product 170 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0170 : Poly :=
[
  term ((-70331010215601631737917779863872046216011556180878 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (14, 1)],
  term ((140662020431203263475835559727744092432023112361756 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0170_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0170
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0171 : Poly :=
[
  term ((13408265543613781327061681865461029668733461278890618682423160883232815750716343 : Rat) / 32952682092868639025674343053988849410237193781748085379931719620549046660000) [(0, 1), (10, 1)]
]

/-- Partial product 171 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0171 : Poly :=
[
  term ((-13408265543613781327061681865461029668733461278890618682423160883232815750716343 : Rat) / 32952682092868639025674343053988849410237193781748085379931719620549046660000) [(0, 1), (10, 1)],
  term ((13408265543613781327061681865461029668733461278890618682423160883232815750716343 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(0, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0171_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0171
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0172 : Poly :=
[
  term ((110206807495830075500373415817351465151045583932420 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 172 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0172 : Poly :=
[
  term ((220413614991660151000746831634702930302091167864840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-110206807495830075500373415817351465151045583932420 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0172_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0172
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0173 : Poly :=
[
  term ((-53971883006646908829019031165257035914163029529252100813299044638 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 173 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0173 : Poly :=
[
  term ((53971883006646908829019031165257035914163029529252100813299044638 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-107943766013293817658038062330514071828326059058504201626598089276 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0173_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0173
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0174 : Poly :=
[
  term ((-110206807495830075500373415817351465151045583932420 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 174 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0174 : Poly :=
[
  term ((110206807495830075500373415817351465151045583932420 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-220413614991660151000746831634702930302091167864840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0174_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0174
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0175 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 175 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0175 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0175_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0175
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0176 : Poly :=
[
  term ((-59168514273267757272642501113555396572452841732771849186166910866 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 176 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0176 : Poly :=
[
  term ((-118337028546535514545285002227110793144905683465543698372333821732 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((59168514273267757272642501113555396572452841732771849186166910866 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0176_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0176
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0177 : Poly :=
[
  term ((1926038409869376 : Rat) / 7342292683791569) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0177 : Poly :=
[
  term ((3852076819738752 : Rat) / 7342292683791569) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0177_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0177
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0178 : Poly :=
[
  term ((-776973195825153285376877234381317156377527718156256275414337208 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 1), (10, 1), (11, 2)]
]

/-- Partial product 178 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0178 : Poly :=
[
  term ((776973195825153285376877234381317156377527718156256275414337208 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 1), (10, 1), (11, 2)],
  term ((-1553946391650306570753754468762634312755055436312512550828674416 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 1), (10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0178_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0178
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0179 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 179 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0179 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0179_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0179
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0180 : Poly :=
[
  term ((23082214372652249655121253843364058075229688496532 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1)]
]

/-- Partial product 180 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0180 : Poly :=
[
  term ((-23082214372652249655121253843364058075229688496532 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1)],
  term ((46164428745304499310242507686728116150459376993064 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0180_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0180
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0181 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 181 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0181 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0181_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0181
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0182 : Poly :=
[
  term ((16147189110904382543110243492510961106895915339550 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 182 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0182 : Poly :=
[
  term ((32294378221808765086220486985021922213791830679100 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-16147189110904382543110243492510961106895915339550 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0182_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0182
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0183 : Poly :=
[
  term ((-16147189110904382543110243492510961106895915339550 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 183 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0183 : Poly :=
[
  term ((16147189110904382543110243492510961106895915339550 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-32294378221808765086220486985021922213791830679100 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0183_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0183
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0184 : Poly :=
[
  term ((-45154717093893731392729559008474059652852410605158 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 184 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0184 : Poly :=
[
  term ((-90309434187787462785459118016948119305704821210316 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((45154717093893731392729559008474059652852410605158 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0184_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0184
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0185 : Poly :=
[
  term ((-26006517670939816366091603501447243631297243357512 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (13, 2)]
]

/-- Partial product 185 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0185 : Poly :=
[
  term ((26006517670939816366091603501447243631297243357512 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (13, 2)],
  term ((-52013035341879632732183207002894487262594486715024 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0185_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0185
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0186 : Poly :=
[
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 186 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0186 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0186_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0186
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0187 : Poly :=
[
  term ((12847036582461196360035056897711897780950810127187078122959473303185291850936343 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(0, 1), (10, 1), (14, 1)]
]

/-- Partial product 187 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0187 : Poly :=
[
  term ((-12847036582461196360035056897711897780950810127187078122959473303185291850936343 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(0, 1), (10, 1), (14, 1)],
  term ((12847036582461196360035056897711897780950810127187078122959473303185291850936343 : Rat) / 8238170523217159756418585763497212352559298445437021344982929905137261665000) [(0, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0187_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0187
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0188 : Poly :=
[
  term ((2235259353979885465443856 : Rat) / 168738551328409796076525) [(0, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 188 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0188 : Poly :=
[
  term ((-2235259353979885465443856 : Rat) / 168738551328409796076525) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((4470518707959770930887712 : Rat) / 168738551328409796076525) [(0, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0188_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0188
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0189 : Poly :=
[
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (10, 1), (15, 2)]
]

/-- Partial product 189 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0189 : Poly :=
[
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0189_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0189
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0190 : Poly :=
[
  term ((1117629676989942732721928 : Rat) / 168738551328409796076525) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 190 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0190 : Poly :=
[
  term ((2235259353979885465443856 : Rat) / 168738551328409796076525) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1117629676989942732721928 : Rat) / 168738551328409796076525) [(0, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0190_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0190
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0191 : Poly :=
[
  term ((7404432891757095314915198577935481931054738980394 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 2)]
]

/-- Partial product 191 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0191 : Poly :=
[
  term ((-7404432891757095314915198577935481931054738980394 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 2)],
  term ((14808865783514190629830397155870963862109477960788 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0191_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0191
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0192 : Poly :=
[
  term ((337280508658830983660553761229161206879163525428730 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 192 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0192 : Poly :=
[
  term ((-337280508658830983660553761229161206879163525428730 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((674561017317661967321107522458322413758327050857460 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0192_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0192
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0193 : Poly :=
[
  term ((91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 193 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0193 : Poly :=
[
  term ((-91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0193_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0193
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0194 : Poly :=
[
  term ((8777408247896645031342146253354398965433696698285 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 194 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0194 : Poly :=
[
  term ((17554816495793290062684292506708797930867393396570 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8777408247896645031342146253354398965433696698285 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0194_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0194
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0195 : Poly :=
[
  term ((-91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 195 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0195 : Poly :=
[
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0195_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0195
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0196 : Poly :=
[
  term ((-1076091866839551141927173704484853643271305219573018 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 196 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0196 : Poly :=
[
  term ((1076091866839551141927173704484853643271305219573018 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (13, 1)],
  term ((-2152183733679102283854347408969707286542610439146036 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0196_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0196
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0197 : Poly :=
[
  term ((7703677649753162458829190585365533230999934536340 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 197 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0197 : Poly :=
[
  term ((-7703677649753162458829190585365533230999934536340 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((15407355299506324917658381170731066461999869072680 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0197_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0197
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0198 : Poly :=
[
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 198 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0198 : Poly :=
[
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0198_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0198
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0199 : Poly :=
[
  term ((-5812439947764925680445917637578735121927241639531 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 199 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0199 : Poly :=
[
  term ((-11624879895529851360891835275157470243854483279062 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((5812439947764925680445917637578735121927241639531 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0199_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0199
        rs_R009_ueqv_R009NYNYN_generator_28_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_28_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0100,
  rs_R009_ueqv_R009NYNYN_partial_28_0101,
  rs_R009_ueqv_R009NYNYN_partial_28_0102,
  rs_R009_ueqv_R009NYNYN_partial_28_0103,
  rs_R009_ueqv_R009NYNYN_partial_28_0104,
  rs_R009_ueqv_R009NYNYN_partial_28_0105,
  rs_R009_ueqv_R009NYNYN_partial_28_0106,
  rs_R009_ueqv_R009NYNYN_partial_28_0107,
  rs_R009_ueqv_R009NYNYN_partial_28_0108,
  rs_R009_ueqv_R009NYNYN_partial_28_0109,
  rs_R009_ueqv_R009NYNYN_partial_28_0110,
  rs_R009_ueqv_R009NYNYN_partial_28_0111,
  rs_R009_ueqv_R009NYNYN_partial_28_0112,
  rs_R009_ueqv_R009NYNYN_partial_28_0113,
  rs_R009_ueqv_R009NYNYN_partial_28_0114,
  rs_R009_ueqv_R009NYNYN_partial_28_0115,
  rs_R009_ueqv_R009NYNYN_partial_28_0116,
  rs_R009_ueqv_R009NYNYN_partial_28_0117,
  rs_R009_ueqv_R009NYNYN_partial_28_0118,
  rs_R009_ueqv_R009NYNYN_partial_28_0119,
  rs_R009_ueqv_R009NYNYN_partial_28_0120,
  rs_R009_ueqv_R009NYNYN_partial_28_0121,
  rs_R009_ueqv_R009NYNYN_partial_28_0122,
  rs_R009_ueqv_R009NYNYN_partial_28_0123,
  rs_R009_ueqv_R009NYNYN_partial_28_0124,
  rs_R009_ueqv_R009NYNYN_partial_28_0125,
  rs_R009_ueqv_R009NYNYN_partial_28_0126,
  rs_R009_ueqv_R009NYNYN_partial_28_0127,
  rs_R009_ueqv_R009NYNYN_partial_28_0128,
  rs_R009_ueqv_R009NYNYN_partial_28_0129,
  rs_R009_ueqv_R009NYNYN_partial_28_0130,
  rs_R009_ueqv_R009NYNYN_partial_28_0131,
  rs_R009_ueqv_R009NYNYN_partial_28_0132,
  rs_R009_ueqv_R009NYNYN_partial_28_0133,
  rs_R009_ueqv_R009NYNYN_partial_28_0134,
  rs_R009_ueqv_R009NYNYN_partial_28_0135,
  rs_R009_ueqv_R009NYNYN_partial_28_0136,
  rs_R009_ueqv_R009NYNYN_partial_28_0137,
  rs_R009_ueqv_R009NYNYN_partial_28_0138,
  rs_R009_ueqv_R009NYNYN_partial_28_0139,
  rs_R009_ueqv_R009NYNYN_partial_28_0140,
  rs_R009_ueqv_R009NYNYN_partial_28_0141,
  rs_R009_ueqv_R009NYNYN_partial_28_0142,
  rs_R009_ueqv_R009NYNYN_partial_28_0143,
  rs_R009_ueqv_R009NYNYN_partial_28_0144,
  rs_R009_ueqv_R009NYNYN_partial_28_0145,
  rs_R009_ueqv_R009NYNYN_partial_28_0146,
  rs_R009_ueqv_R009NYNYN_partial_28_0147,
  rs_R009_ueqv_R009NYNYN_partial_28_0148,
  rs_R009_ueqv_R009NYNYN_partial_28_0149,
  rs_R009_ueqv_R009NYNYN_partial_28_0150,
  rs_R009_ueqv_R009NYNYN_partial_28_0151,
  rs_R009_ueqv_R009NYNYN_partial_28_0152,
  rs_R009_ueqv_R009NYNYN_partial_28_0153,
  rs_R009_ueqv_R009NYNYN_partial_28_0154,
  rs_R009_ueqv_R009NYNYN_partial_28_0155,
  rs_R009_ueqv_R009NYNYN_partial_28_0156,
  rs_R009_ueqv_R009NYNYN_partial_28_0157,
  rs_R009_ueqv_R009NYNYN_partial_28_0158,
  rs_R009_ueqv_R009NYNYN_partial_28_0159,
  rs_R009_ueqv_R009NYNYN_partial_28_0160,
  rs_R009_ueqv_R009NYNYN_partial_28_0161,
  rs_R009_ueqv_R009NYNYN_partial_28_0162,
  rs_R009_ueqv_R009NYNYN_partial_28_0163,
  rs_R009_ueqv_R009NYNYN_partial_28_0164,
  rs_R009_ueqv_R009NYNYN_partial_28_0165,
  rs_R009_ueqv_R009NYNYN_partial_28_0166,
  rs_R009_ueqv_R009NYNYN_partial_28_0167,
  rs_R009_ueqv_R009NYNYN_partial_28_0168,
  rs_R009_ueqv_R009NYNYN_partial_28_0169,
  rs_R009_ueqv_R009NYNYN_partial_28_0170,
  rs_R009_ueqv_R009NYNYN_partial_28_0171,
  rs_R009_ueqv_R009NYNYN_partial_28_0172,
  rs_R009_ueqv_R009NYNYN_partial_28_0173,
  rs_R009_ueqv_R009NYNYN_partial_28_0174,
  rs_R009_ueqv_R009NYNYN_partial_28_0175,
  rs_R009_ueqv_R009NYNYN_partial_28_0176,
  rs_R009_ueqv_R009NYNYN_partial_28_0177,
  rs_R009_ueqv_R009NYNYN_partial_28_0178,
  rs_R009_ueqv_R009NYNYN_partial_28_0179,
  rs_R009_ueqv_R009NYNYN_partial_28_0180,
  rs_R009_ueqv_R009NYNYN_partial_28_0181,
  rs_R009_ueqv_R009NYNYN_partial_28_0182,
  rs_R009_ueqv_R009NYNYN_partial_28_0183,
  rs_R009_ueqv_R009NYNYN_partial_28_0184,
  rs_R009_ueqv_R009NYNYN_partial_28_0185,
  rs_R009_ueqv_R009NYNYN_partial_28_0186,
  rs_R009_ueqv_R009NYNYN_partial_28_0187,
  rs_R009_ueqv_R009NYNYN_partial_28_0188,
  rs_R009_ueqv_R009NYNYN_partial_28_0189,
  rs_R009_ueqv_R009NYNYN_partial_28_0190,
  rs_R009_ueqv_R009NYNYN_partial_28_0191,
  rs_R009_ueqv_R009NYNYN_partial_28_0192,
  rs_R009_ueqv_R009NYNYN_partial_28_0193,
  rs_R009_ueqv_R009NYNYN_partial_28_0194,
  rs_R009_ueqv_R009NYNYN_partial_28_0195,
  rs_R009_ueqv_R009NYNYN_partial_28_0196,
  rs_R009_ueqv_R009NYNYN_partial_28_0197,
  rs_R009_ueqv_R009NYNYN_partial_28_0198,
  rs_R009_ueqv_R009NYNYN_partial_28_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0100_0199 : Poly :=
[
  term ((-71359278975297377756386045424884585738221566804792 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (13, 1)],
  term ((-11135310638677829494589697646788623792320530828016 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((50321282819036641141868909654324297958115636026752 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((244036123415719660676444715358723433137797608801896 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-127418124265430309589661940179567679909262614861158 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (15, 1)],
  term ((2069773019820520474928340839703935368962395978389 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2)],
  term ((-8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (12, 1)],
  term ((16558184158564163799426726717631482951699167827112 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((-8279092079282081899713363358815741475849583913556 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (3, 2), (14, 2)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-264287688237722470205615007224626811720531254058107931 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 1), (6, 1)],
  term ((2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (14, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (14, 2)],
  term ((-125000559809082494321390091596657880085501524607897 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1)],
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-134957048101470742762013767227725894458726015397084 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((91873022844224668745949775651823328963583042586280 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-427386123851180269678946261683438240636433147545478 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((2607145701257534632110758097491832554077090108468 : Rat) / 146875747125632868022554481972356904821696484137) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((14808865783514190629830397155870963862109477960788 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (10, 1)],
  term ((-29617731567028381259660794311741927724218955921576 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (10, 1), (14, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-422016264262952056230810710511784225423615742437768 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((211008132131476028115405355255892112711807871218884 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((45100377215621886937014682691915819626845777734204 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-222991841068217052434754377096490537285311854861000 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((980494755364183728779500849527734747828994285705728 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((106833598580292816110949480400026419104949696468858 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-16905589337120389476584982983303409294097647668108 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (12, 1)],
  term ((18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-13781280007126020775519638498619927820902976021964 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (14, 1)],
  term ((-9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (11, 2), (14, 2)],
  term ((31355562961790308680412110530857152288349899032276 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (12, 1)],
  term ((-182559114551440662842297360000582335145507102869504 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-62711125923580617360824221061714304576699798064552 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 1), (12, 1), (14, 1)],
  term ((-12213166604413865640561059556760794781574843707712 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((6106583302206932820280529778380397390787421853856 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((1896177414589100948779209846412211994236863063513432 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((12213166604413865640561059556760794781574843707712 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1213725080940552052071807968565653283617684382399452 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 2)],
  term ((-296658561146091077118733210000946294611449042162944 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((182559114551440662842297360000582335145507102869504 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (13, 2), (14, 2)],
  term ((250001119618164988642780183193315760171003049215794 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 1), (14, 1)],
  term ((-2578939072752322433076816829759373060964909456640 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((1289469536376161216538408414879686530482454728320 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 1), (15, 2)],
  term ((-35165505107800815868958889931936023108005778090439 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((12629583748113207277172424999285334478327339947192 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-6314791874056603638586212499642667239163669973596 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2), (13, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2), (13, 2), (14, 1)],
  term ((70331010215601631737917779863872046216011556180878 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (8, 2), (14, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (14, 1), (15, 2)],
  term ((-5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (8, 2), (15, 2)],
  term ((-401003124742996108403140155054478585539696637461987201906975385684 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-18375040009501361034026184664826570427870634695952 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((792584007519375066256676405540684220113923933054389246621037780868 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3870417608991304228736 : Rat) / 867851652931479664231) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((9187520004750680517013092332413285213935317347976 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((1935208804495652114368 : Rat) / 867851652931479664231) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-21600250230281917005758330000823853361455241840840 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-50569444251689072167461930596450326940119186094302585700815841156 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((100670830706054814776555505798298180798243003045672029066394361032 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((151153411024220377831696568226706953255780690340584779181785816990 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7704153639477504 : Rat) / 7342292683791569) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-76108125848973826346617593539666685590994022476156012956597145400 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1512199065446714122891694074385529454456949443360 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (9, 1), (11, 1)],
  term ((-332813006961353549881935574404402712322685218587208 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((665626013922707099763871148808805424645370437174416 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((4593760002375340258506546166206642606967658673988 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-40346106210248129212150396908924742200623271717704 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-148329280573045538559366605000473147305724521081472 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((296658561146091077118733210000946294611449042162944 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((346518711830008103589478334366286250316471786511304 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-173259355915004051794739167183143125158235893255652 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-583369547328640742820004957672092927351312278176016 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (13, 1)],
  term ((41004144741734149666498987422215197548191903098312 : Rat) / 580508905306072764089143904938363004771467056351) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-2833044048143939886698852584510743181666930677683248 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((34010576769911860400570516468246284229411806030180 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-11202675471263204725862420367164552727534856737650 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (9, 1), (15, 1)],
  term ((-35165505107800815868958889931936023108005778090439 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (9, 2), (10, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((140662020431203263475835559727744092432023112361756 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (12, 1)],
  term ((-281324040862406526951671119455488184864046224723512 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((140662020431203263475835559727744092432023112361756 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 2), (14, 2)],
  term ((-13408265543613781327061681865461029668733461278890618682423160883232815750716343 : Rat) / 32952682092868639025674343053988849410237193781748085379931719620549046660000) [(0, 1), (10, 1)],
  term ((220413614991660151000746831634702930302091167864840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-110206807495830075500373415817351465151045583932420 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((53971883006646908829019031165257035914163029529252100813299044638 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-80818399270829921360896690329670766588724745197694918966823059376 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-220413614991660151000746831634702930302091167864840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-118337028546535514545285002227110793144905683465543698372333821732 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((59168514273267757272642501113555396572452841732771849186166910866 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((776973195825153285376877234381317156377527718156256275414337208 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 1), (10, 1), (11, 2)],
  term ((-1553946391650306570753754468762634312755055436312512550828674416 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-23082214372652249655121253843364058075229688496532 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((46164428745304499310242507686728116150459376993064 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((32294378221808765086220486985021922213791830679100 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-16147189110904382543110243492510961106895915339550 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-157897978787031710554605649603267630168843056254098 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-32294378221808765086220486985021922213791830679100 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((45154717093893731392729559008474059652852410605158 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((26006517670939816366091603501447243631297243357512 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (13, 2)],
  term ((-150334133695906377482727828508665263814486363180400 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((46138659520460458659750577368823122829921053726054 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (10, 1), (14, 1)],
  term ((-10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((12847036582461196360035056897711897780950810127187078122959473303185291850936343 : Rat) / 8238170523217159756418585763497212352559298445437021344982929905137261665000) [(0, 1), (10, 1), (14, 2)],
  term ((4470518707959770930887712 : Rat) / 168738551328409796076525) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((5400062557570479251439582500205963340363810460210 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (10, 1), (15, 2)],
  term ((-1117629676989942732721928 : Rat) / 168738551328409796076525) [(0, 1), (10, 1), (16, 1)],
  term ((-7404432891757095314915198577935481931054738980394 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 2)],
  term ((14808865783514190629830397155870963862109477960788 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 2), (14, 1)],
  term ((-337280508658830983660553761229161206879163525428730 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((182442680813507664335366353851394659407475243320344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((17554816495793290062684292506708797930867393396570 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8777408247896645031342146253354398965433696698285 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-182674766514198096647535478685051594452119627992 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((91337383257099048323767739342525797226059813996 : Rat) / 8751390532252353227474531230226577961378900347) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((1076091866839551141927173704484853643271305219573018 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (13, 1)],
  term ((-2221516832526880745983810124237997085621609849973096 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((15407355299506324917658381170731066461999869072680 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-110023981617339141499466099976623195535054159971768 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((10800125115140958502879165000411926680727620920420 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((5812439947764925680445917637578735121927241639531 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0100_0199
      rs_R009_ueqv_R009NYNYN_block_28_0100_0199 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
