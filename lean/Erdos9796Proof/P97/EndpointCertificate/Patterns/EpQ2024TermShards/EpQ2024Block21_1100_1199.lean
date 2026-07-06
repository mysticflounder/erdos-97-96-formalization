/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:1100-1199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1100 : Poly :=
[
  term ((-49011656764650655 : Rat) / 13953362653838316) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1100 for generator 21. -/
def ep_Q2_024_partial_21_1100 : Poly :=
[
  term ((-49011656764650655 : Rat) / 6976681326919158) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49011656764650655 : Rat) / 13953362653838316) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 21. -/
theorem ep_Q2_024_partial_21_1100_valid :
    mulPoly ep_Q2_024_coefficient_21_1100
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1101 : Poly :=
[
  term ((-196041943132850954510154956301731922128 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 1101 for generator 21. -/
def ep_Q2_024_partial_21_1101 : Poly :=
[
  term ((-392083886265701909020309912603463844256 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((196041943132850954510154956301731922128 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 21. -/
theorem ep_Q2_024_partial_21_1101_valid :
    mulPoly ep_Q2_024_coefficient_21_1101
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1102 : Poly :=
[
  term ((-929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1102 for generator 21. -/
def ep_Q2_024_partial_21_1102 : Poly :=
[
  term ((-1859489400717863008451309270511497282108 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 21. -/
theorem ep_Q2_024_partial_21_1102_valid :
    mulPoly ep_Q2_024_coefficient_21_1102
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1103 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1), (14, 1)]
]

/-- Partial product 1103 for generator 21. -/
def ep_Q2_024_partial_21_1103 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 21. -/
theorem ep_Q2_024_partial_21_1103_valid :
    mulPoly ep_Q2_024_coefficient_21_1103
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1104 : Poly :=
[
  term ((-59583489357913830406433971692805233712439082938111255209 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1104 for generator 21. -/
def ep_Q2_024_partial_21_1104 : Poly :=
[
  term ((-59583489357913830406433971692805233712439082938111255209 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((59583489357913830406433971692805233712439082938111255209 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 21. -/
theorem ep_Q2_024_partial_21_1104_valid :
    mulPoly ep_Q2_024_coefficient_21_1104
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1105 : Poly :=
[
  term ((12431018815936527 : Rat) / 2325560442306386) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1105 for generator 21. -/
def ep_Q2_024_partial_21_1105 : Poly :=
[
  term ((12431018815936527 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12431018815936527 : Rat) / 2325560442306386) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 21. -/
theorem ep_Q2_024_partial_21_1105_valid :
    mulPoly ep_Q2_024_coefficient_21_1105
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1106 : Poly :=
[
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1106 for generator 21. -/
def ep_Q2_024_partial_21_1106 : Poly :=
[
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 21. -/
theorem ep_Q2_024_partial_21_1106_valid :
    mulPoly ep_Q2_024_coefficient_21_1106
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1107 : Poly :=
[
  term ((-4569079916135479 : Rat) / 2325560442306386) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1107 for generator 21. -/
def ep_Q2_024_partial_21_1107 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 21. -/
theorem ep_Q2_024_partial_21_1107_valid :
    mulPoly ep_Q2_024_coefficient_21_1107
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1108 : Poly :=
[
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 2), (13, 2)]
]

/-- Partial product 1108 for generator 21. -/
def ep_Q2_024_partial_21_1108 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 2), (13, 2)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 21. -/
theorem ep_Q2_024_partial_21_1108_valid :
    mulPoly ep_Q2_024_coefficient_21_1108
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1109 : Poly :=
[
  term ((-92813365076547770138170359849624035693344747156319939251 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1109 for generator 21. -/
def ep_Q2_024_partial_21_1109 : Poly :=
[
  term ((-92813365076547770138170359849624035693344747156319939251 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((92813365076547770138170359849624035693344747156319939251 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 21. -/
theorem ep_Q2_024_partial_21_1109_valid :
    mulPoly ep_Q2_024_coefficient_21_1109
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1110 : Poly :=
[
  term ((-82731422006668921 : Rat) / 13953362653838316) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1110 for generator 21. -/
def ep_Q2_024_partial_21_1110 : Poly :=
[
  term ((-82731422006668921 : Rat) / 6976681326919158) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((82731422006668921 : Rat) / 13953362653838316) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 21. -/
theorem ep_Q2_024_partial_21_1110_valid :
    mulPoly ep_Q2_024_coefficient_21_1110
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1111 : Poly :=
[
  term ((3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1111 for generator 21. -/
def ep_Q2_024_partial_21_1111 : Poly :=
[
  term ((6662901272101045224807202198331513989515819078990898894 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 21. -/
theorem ep_Q2_024_partial_21_1111_valid :
    mulPoly ep_Q2_024_coefficient_21_1111
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1112 : Poly :=
[
  term ((-207570026772756 : Rat) / 1162780221153193) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1112 for generator 21. -/
def ep_Q2_024_partial_21_1112 : Poly :=
[
  term ((-415140053545512 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((207570026772756 : Rat) / 1162780221153193) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 21. -/
theorem ep_Q2_024_partial_21_1112_valid :
    mulPoly ep_Q2_024_coefficient_21_1112
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1113 : Poly :=
[
  term ((17585409661630061746250391663933747309951082179672291455 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1113 for generator 21. -/
def ep_Q2_024_partial_21_1113 : Poly :=
[
  term ((17585409661630061746250391663933747309951082179672291455 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-17585409661630061746250391663933747309951082179672291455 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 21. -/
theorem ep_Q2_024_partial_21_1113_valid :
    mulPoly ep_Q2_024_coefficient_21_1113
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1114 : Poly :=
[
  term ((26508189435532205 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1114 for generator 21. -/
def ep_Q2_024_partial_21_1114 : Poly :=
[
  term ((26508189435532205 : Rat) / 3488340663459579) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26508189435532205 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 21. -/
theorem ep_Q2_024_partial_21_1114_valid :
    mulPoly ep_Q2_024_coefficient_21_1114
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1115 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (15, 3)]
]

/-- Partial product 1115 for generator 21. -/
def ep_Q2_024_partial_21_1115 : Poly :=
[
  term ((4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 21. -/
theorem ep_Q2_024_partial_21_1115_valid :
    mulPoly ep_Q2_024_coefficient_21_1115
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1116 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1116 for generator 21. -/
def ep_Q2_024_partial_21_1116 : Poly :=
[
  term ((-1249107794586464 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 21. -/
theorem ep_Q2_024_partial_21_1116_valid :
    mulPoly ep_Q2_024_coefficient_21_1116
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1117 : Poly :=
[
  term ((3583054000251694103093751754867206040358 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2)]
]

/-- Partial product 1117 for generator 21. -/
def ep_Q2_024_partial_21_1117 : Poly :=
[
  term ((7166108000503388206187503509734412080716 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (13, 2)],
  term ((-3583054000251694103093751754867206040358 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 21. -/
theorem ep_Q2_024_partial_21_1117_valid :
    mulPoly ep_Q2_024_coefficient_21_1117
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1118 : Poly :=
[
  term ((-6246404976541887939538448212556055439904 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 1118 for generator 21. -/
def ep_Q2_024_partial_21_1118 : Poly :=
[
  term ((-12492809953083775879076896425112110879808 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((6246404976541887939538448212556055439904 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 21. -/
theorem ep_Q2_024_partial_21_1118_valid :
    mulPoly ep_Q2_024_coefficient_21_1118
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1119 : Poly :=
[
  term ((28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2), (14, 2)]
]

/-- Partial product 1119 for generator 21. -/
def ep_Q2_024_partial_21_1119 : Poly :=
[
  term ((56218793397401222444627522532761657312 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (13, 2), (14, 2)],
  term ((-28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 21. -/
theorem ep_Q2_024_partial_21_1119_valid :
    mulPoly ep_Q2_024_coefficient_21_1119
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1120 : Poly :=
[
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 2), (15, 2)]
]

/-- Partial product 1120 for generator 21. -/
def ep_Q2_024_partial_21_1120 : Poly :=
[
  term ((-19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 21. -/
theorem ep_Q2_024_partial_21_1120_valid :
    mulPoly ep_Q2_024_coefficient_21_1120
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1121 : Poly :=
[
  term ((2498215589172928 : Rat) / 1162780221153193) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1121 for generator 21. -/
def ep_Q2_024_partial_21_1121 : Poly :=
[
  term ((4996431178345856 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 21. -/
theorem ep_Q2_024_partial_21_1121_valid :
    mulPoly ep_Q2_024_coefficient_21_1121
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1122 : Poly :=
[
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 3), (15, 1)]
]

/-- Partial product 1122 for generator 21. -/
def ep_Q2_024_partial_21_1122 : Poly :=
[
  term ((-207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (13, 3), (15, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 21. -/
theorem ep_Q2_024_partial_21_1122_valid :
    mulPoly ep_Q2_024_coefficient_21_1122
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1123 : Poly :=
[
  term ((-1838688474506094390713835656421160111936 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (14, 1)]
]

/-- Partial product 1123 for generator 21. -/
def ep_Q2_024_partial_21_1123 : Poly :=
[
  term ((-3677376949012188781427671312842320223872 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (14, 1)],
  term ((1838688474506094390713835656421160111936 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 21. -/
theorem ep_Q2_024_partial_21_1123_valid :
    mulPoly ep_Q2_024_coefficient_21_1123
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1124 : Poly :=
[
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1124 for generator 21. -/
def ep_Q2_024_partial_21_1124 : Poly :=
[
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 21. -/
theorem ep_Q2_024_partial_21_1124_valid :
    mulPoly ep_Q2_024_coefficient_21_1124
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1125 : Poly :=
[
  term ((-12213780129134847 : Rat) / 2325560442306386) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1125 for generator 21. -/
def ep_Q2_024_partial_21_1125 : Poly :=
[
  term ((-12213780129134847 : Rat) / 1162780221153193) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((12213780129134847 : Rat) / 2325560442306386) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 21. -/
theorem ep_Q2_024_partial_21_1125_valid :
    mulPoly ep_Q2_024_coefficient_21_1125
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1126 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (14, 2)]
]

/-- Partial product 1126 for generator 21. -/
def ep_Q2_024_partial_21_1126 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (14, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 21. -/
theorem ep_Q2_024_partial_21_1126_valid :
    mulPoly ep_Q2_024_coefficient_21_1126
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1127 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (15, 2)]
]

/-- Partial product 1127 for generator 21. -/
def ep_Q2_024_partial_21_1127 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 21. -/
theorem ep_Q2_024_partial_21_1127_valid :
    mulPoly ep_Q2_024_coefficient_21_1127
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1128 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1128 for generator 21. -/
def ep_Q2_024_partial_21_1128 : Poly :=
[
  term ((115944433813960 : Rat) / 1162780221153193) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 21. -/
theorem ep_Q2_024_partial_21_1128_valid :
    mulPoly ep_Q2_024_coefficient_21_1128
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1129 : Poly :=
[
  term ((-871557347738064252800882807753378762 : Rat) / 599854728701238648283346764014769633995) [(8, 2)]
]

/-- Partial product 1129 for generator 21. -/
def ep_Q2_024_partial_21_1129 : Poly :=
[
  term ((871557347738064252800882807753378762 : Rat) / 599854728701238648283346764014769633995) [(8, 2)],
  term ((-1743114695476128505601765615506757524 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 21. -/
theorem ep_Q2_024_partial_21_1129_valid :
    mulPoly ep_Q2_024_coefficient_21_1129
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1130 : Poly :=
[
  term ((-121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (9, 1), (11, 1)]
]

/-- Partial product 1130 for generator 21. -/
def ep_Q2_024_partial_21_1130 : Poly :=
[
  term ((-243177881470978164141696144098287893064 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 21. -/
theorem ep_Q2_024_partial_21_1130_valid :
    mulPoly ep_Q2_024_coefficient_21_1130
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1131 : Poly :=
[
  term ((530529358477472352568917751089507728828 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (13, 1)]
]

/-- Partial product 1131 for generator 21. -/
def ep_Q2_024_partial_21_1131 : Poly :=
[
  term ((1061058716954944705137835502179015457656 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-530529358477472352568917751089507728828 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 21. -/
theorem ep_Q2_024_partial_21_1131_valid :
    mulPoly ep_Q2_024_coefficient_21_1131
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1132 : Poly :=
[
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 2), (9, 1), (15, 1)]
]

/-- Partial product 1132 for generator 21. -/
def ep_Q2_024_partial_21_1132 : Poly :=
[
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 21. -/
theorem ep_Q2_024_partial_21_1132_valid :
    mulPoly ep_Q2_024_coefficient_21_1132
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1133 : Poly :=
[
  term ((373787112386234 : Rat) / 1162780221153193) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1133 for generator 21. -/
def ep_Q2_024_partial_21_1133 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 21. -/
theorem ep_Q2_024_partial_21_1133_valid :
    mulPoly ep_Q2_024_coefficient_21_1133
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1134 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2)]
]

/-- Partial product 1134 for generator 21. -/
def ep_Q2_024_partial_21_1134 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 21. -/
theorem ep_Q2_024_partial_21_1134_valid :
    mulPoly ep_Q2_024_coefficient_21_1134
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1135 : Poly :=
[
  term ((-37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1135 for generator 21. -/
def ep_Q2_024_partial_21_1135 : Poly :=
[
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 21. -/
theorem ep_Q2_024_partial_21_1135_valid :
    mulPoly ep_Q2_024_coefficient_21_1135
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1136 : Poly :=
[
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1136 for generator 21. -/
def ep_Q2_024_partial_21_1136 : Poly :=
[
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 21. -/
theorem ep_Q2_024_partial_21_1136_valid :
    mulPoly ep_Q2_024_coefficient_21_1136
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1137 : Poly :=
[
  term ((-1081662649697379 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1137 for generator 21. -/
def ep_Q2_024_partial_21_1137 : Poly :=
[
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 21. -/
theorem ep_Q2_024_partial_21_1137_valid :
    mulPoly ep_Q2_024_coefficient_21_1137
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1138 : Poly :=
[
  term ((-268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 1138 for generator 21. -/
def ep_Q2_024_partial_21_1138 : Poly :=
[
  term ((-537920766019599777996106631007983419660 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 21. -/
theorem ep_Q2_024_partial_21_1138_valid :
    mulPoly ep_Q2_024_coefficient_21_1138
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1139 : Poly :=
[
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 1139 for generator 21. -/
def ep_Q2_024_partial_21_1139 : Poly :=
[
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 21. -/
theorem ep_Q2_024_partial_21_1139_valid :
    mulPoly ep_Q2_024_coefficient_21_1139
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1140 : Poly :=
[
  term ((-4815941933934353 : Rat) / 4651120884612772) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1140 for generator 21. -/
def ep_Q2_024_partial_21_1140 : Poly :=
[
  term ((-4815941933934353 : Rat) / 2325560442306386) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 21. -/
theorem ep_Q2_024_partial_21_1140_valid :
    mulPoly ep_Q2_024_coefficient_21_1140
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1141 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1141 for generator 21. -/
def ep_Q2_024_partial_21_1141 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 21. -/
theorem ep_Q2_024_partial_21_1141_valid :
    mulPoly ep_Q2_024_coefficient_21_1141
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1142 : Poly :=
[
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1142 for generator 21. -/
def ep_Q2_024_partial_21_1142 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 21. -/
theorem ep_Q2_024_partial_21_1142_valid :
    mulPoly ep_Q2_024_coefficient_21_1142
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1143 : Poly :=
[
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)]
]

/-- Partial product 1143 for generator 21. -/
def ep_Q2_024_partial_21_1143 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1), (12, 1), (13, 2)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 21. -/
theorem ep_Q2_024_partial_21_1143_valid :
    mulPoly ep_Q2_024_coefficient_21_1143
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1144 : Poly :=
[
  term ((-1984287240256585494685033589679517837892995138119004575 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 1144 for generator 21. -/
def ep_Q2_024_partial_21_1144 : Poly :=
[
  term ((-3968574480513170989370067179359035675785990276238009150 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((1984287240256585494685033589679517837892995138119004575 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 21. -/
theorem ep_Q2_024_partial_21_1144_valid :
    mulPoly ep_Q2_024_coefficient_21_1144
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1145 : Poly :=
[
  term ((7040003071577984 : Rat) / 1162780221153193) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1145 for generator 21. -/
def ep_Q2_024_partial_21_1145 : Poly :=
[
  term ((14080006143155968 : Rat) / 1162780221153193) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7040003071577984 : Rat) / 1162780221153193) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 21. -/
theorem ep_Q2_024_partial_21_1145_valid :
    mulPoly ep_Q2_024_coefficient_21_1145
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1146 : Poly :=
[
  term ((-9927471372003427337116148397073355364 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (13, 2)]
]

/-- Partial product 1146 for generator 21. -/
def ep_Q2_024_partial_21_1146 : Poly :=
[
  term ((-19854942744006854674232296794146710728 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (10, 1), (13, 2)],
  term ((9927471372003427337116148397073355364 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 21. -/
theorem ep_Q2_024_partial_21_1146_valid :
    mulPoly ep_Q2_024_coefficient_21_1146
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1147 : Poly :=
[
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (14, 1)]
]

/-- Partial product 1147 for generator 21. -/
def ep_Q2_024_partial_21_1147 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (10, 1), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 21. -/
theorem ep_Q2_024_partial_21_1147_valid :
    mulPoly ep_Q2_024_coefficient_21_1147
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1148 : Poly :=
[
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (15, 2)]
]

/-- Partial product 1148 for generator 21. -/
def ep_Q2_024_partial_21_1148 : Poly :=
[
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (10, 1), (15, 2)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 21. -/
theorem ep_Q2_024_partial_21_1148_valid :
    mulPoly ep_Q2_024_coefficient_21_1148
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1149 : Poly :=
[
  term ((3791843580843907 : Rat) / 4651120884612772) [(8, 2), (15, 2), (16, 1)]
]

/-- Partial product 1149 for generator 21. -/
def ep_Q2_024_partial_21_1149 : Poly :=
[
  term ((3791843580843907 : Rat) / 2325560442306386) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3791843580843907 : Rat) / 4651120884612772) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 21. -/
theorem ep_Q2_024_partial_21_1149_valid :
    mulPoly ep_Q2_024_coefficient_21_1149
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1150 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 1150 for generator 21. -/
def ep_Q2_024_partial_21_1150 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (11, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 21. -/
theorem ep_Q2_024_partial_21_1150_valid :
    mulPoly ep_Q2_024_coefficient_21_1150
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1151 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1151 for generator 21. -/
def ep_Q2_024_partial_21_1151 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 21. -/
theorem ep_Q2_024_partial_21_1151_valid :
    mulPoly ep_Q2_024_coefficient_21_1151
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1152 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 1152 for generator 21. -/
def ep_Q2_024_partial_21_1152 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 21. -/
theorem ep_Q2_024_partial_21_1152_valid :
    mulPoly ep_Q2_024_coefficient_21_1152
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1153 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1153 for generator 21. -/
def ep_Q2_024_partial_21_1153 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 21. -/
theorem ep_Q2_024_partial_21_1153_valid :
    mulPoly ep_Q2_024_coefficient_21_1153
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1154 : Poly :=
[
  term ((-391902425265639290744497612690462123944 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1154 for generator 21. -/
def ep_Q2_024_partial_21_1154 : Poly :=
[
  term ((391902425265639290744497612690462123944 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-783804850531278581488995225380924247888 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 21. -/
theorem ep_Q2_024_partial_21_1154_valid :
    mulPoly ep_Q2_024_coefficient_21_1154
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1155 : Poly :=
[
  term ((55374900092972802394501169314545589640 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1155 for generator 21. -/
def ep_Q2_024_partial_21_1155 : Poly :=
[
  term ((-55374900092972802394501169314545589640 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((110749800185945604789002338629091179280 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 21. -/
theorem ep_Q2_024_partial_21_1155_valid :
    mulPoly ep_Q2_024_coefficient_21_1155
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1156 : Poly :=
[
  term ((-5295649380128505904357902612512039113856123150388165775 : Rat) / 278999685639605945551432029250879769240203926974238414) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1156 for generator 21. -/
def ep_Q2_024_partial_21_1156 : Poly :=
[
  term ((5295649380128505904357902612512039113856123150388165775 : Rat) / 278999685639605945551432029250879769240203926974238414) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5295649380128505904357902612512039113856123150388165775 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 21. -/
theorem ep_Q2_024_partial_21_1156_valid :
    mulPoly ep_Q2_024_coefficient_21_1156
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1157 : Poly :=
[
  term ((4758481329221634 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1157 for generator 21. -/
def ep_Q2_024_partial_21_1157 : Poly :=
[
  term ((-4758481329221634 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9516962658443268 : Rat) / 1162780221153193) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 21. -/
theorem ep_Q2_024_partial_21_1157_valid :
    mulPoly ep_Q2_024_coefficient_21_1157
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1158 : Poly :=
[
  term ((-485845956700391670590107728175564530433745706803029458697 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1158 for generator 21. -/
def ep_Q2_024_partial_21_1158 : Poly :=
[
  term ((485845956700391670590107728175564530433745706803029458697 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-485845956700391670590107728175564530433745706803029458697 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 21. -/
theorem ep_Q2_024_partial_21_1158_valid :
    mulPoly ep_Q2_024_coefficient_21_1158
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1159 : Poly :=
[
  term ((10864174184553155 : Rat) / 4651120884612772) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1159 for generator 21. -/
def ep_Q2_024_partial_21_1159 : Poly :=
[
  term ((-10864174184553155 : Rat) / 4651120884612772) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10864174184553155 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 21. -/
theorem ep_Q2_024_partial_21_1159_valid :
    mulPoly ep_Q2_024_coefficient_21_1159
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1160 : Poly :=
[
  term ((-92367204208362985681914065226852087376 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 1160 for generator 21. -/
def ep_Q2_024_partial_21_1160 : Poly :=
[
  term ((92367204208362985681914065226852087376 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-184734408416725971363828130453704174752 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 21. -/
theorem ep_Q2_024_partial_21_1160_valid :
    mulPoly ep_Q2_024_coefficient_21_1160
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1161 : Poly :=
[
  term ((4174537424080125791966244500138790069363717079026362551 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 1161 for generator 21. -/
def ep_Q2_024_partial_21_1161 : Poly :=
[
  term ((-4174537424080125791966244500138790069363717079026362551 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((8349074848160251583932489000277580138727434158052725102 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 21. -/
theorem ep_Q2_024_partial_21_1161_valid :
    mulPoly ep_Q2_024_coefficient_21_1161
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1162 : Poly :=
[
  term ((-3262078739251964 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1162 for generator 21. -/
def ep_Q2_024_partial_21_1162 : Poly :=
[
  term ((3262078739251964 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6524157478503928 : Rat) / 1162780221153193) [(9, 1), (10, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 21. -/
theorem ep_Q2_024_partial_21_1162_valid :
    mulPoly ep_Q2_024_coefficient_21_1162
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1163 : Poly :=
[
  term ((-129943648889074072142136367760371661717 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1163 for generator 21. -/
def ep_Q2_024_partial_21_1163 : Poly :=
[
  term ((129943648889074072142136367760371661717 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1)],
  term ((-259887297778148144284272735520743323434 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 21. -/
theorem ep_Q2_024_partial_21_1163_valid :
    mulPoly ep_Q2_024_coefficient_21_1163
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1164 : Poly :=
[
  term ((2714028765275053728630721752454205575148 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1164 for generator 21. -/
def ep_Q2_024_partial_21_1164 : Poly :=
[
  term ((-2714028765275053728630721752454205575148 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((5428057530550107457261443504908411150296 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 21. -/
theorem ep_Q2_024_partial_21_1164_valid :
    mulPoly ep_Q2_024_coefficient_21_1164
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1165 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 2)]
]

/-- Partial product 1165 for generator 21. -/
def ep_Q2_024_partial_21_1165 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 21. -/
theorem ep_Q2_024_partial_21_1165_valid :
    mulPoly ep_Q2_024_coefficient_21_1165
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1166 : Poly :=
[
  term ((-997749444314866462215673905698593625231477803169669488 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 1166 for generator 21. -/
def ep_Q2_024_partial_21_1166 : Poly :=
[
  term ((997749444314866462215673905698593625231477803169669488 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1995498888629732924431347811397187250462955606339338976 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 21. -/
theorem ep_Q2_024_partial_21_1166_valid :
    mulPoly ep_Q2_024_coefficient_21_1166
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1167 : Poly :=
[
  term ((1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1167 for generator 21. -/
def ep_Q2_024_partial_21_1167 : Poly :=
[
  term ((-1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 21. -/
theorem ep_Q2_024_partial_21_1167_valid :
    mulPoly ep_Q2_024_coefficient_21_1167
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1168 : Poly :=
[
  term ((-51975418274089175683915374061976030368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 1168 for generator 21. -/
def ep_Q2_024_partial_21_1168 : Poly :=
[
  term ((51975418274089175683915374061976030368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 21. -/
theorem ep_Q2_024_partial_21_1168_valid :
    mulPoly ep_Q2_024_coefficient_21_1168
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1169 : Poly :=
[
  term ((-8134085161510453086479282563191431595436282524794580617 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1169 for generator 21. -/
def ep_Q2_024_partial_21_1169 : Poly :=
[
  term ((8134085161510453086479282563191431595436282524794580617 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8134085161510453086479282563191431595436282524794580617 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 21. -/
theorem ep_Q2_024_partial_21_1169_valid :
    mulPoly ep_Q2_024_coefficient_21_1169
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1170 : Poly :=
[
  term ((12329776359333749 : Rat) / 2325560442306386) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1170 for generator 21. -/
def ep_Q2_024_partial_21_1170 : Poly :=
[
  term ((-12329776359333749 : Rat) / 2325560442306386) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12329776359333749 : Rat) / 1162780221153193) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 21. -/
theorem ep_Q2_024_partial_21_1170_valid :
    mulPoly ep_Q2_024_coefficient_21_1170
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1171 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (14, 2), (15, 1)]
]

/-- Partial product 1171 for generator 21. -/
def ep_Q2_024_partial_21_1171 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 21. -/
theorem ep_Q2_024_partial_21_1171_valid :
    mulPoly ep_Q2_024_coefficient_21_1171
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1172 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1172 for generator 21. -/
def ep_Q2_024_partial_21_1172 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 21. -/
theorem ep_Q2_024_partial_21_1172_valid :
    mulPoly ep_Q2_024_coefficient_21_1172
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1173 : Poly :=
[
  term ((99104402996943989439342730908244621140002902954621176395 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1173 for generator 21. -/
def ep_Q2_024_partial_21_1173 : Poly :=
[
  term ((-99104402996943989439342730908244621140002902954621176395 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 1), (10, 1), (15, 1)],
  term ((99104402996943989439342730908244621140002902954621176395 : Rat) / 836999056918817836654296087752639307720611780922715242) [(9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 21. -/
theorem ep_Q2_024_partial_21_1173_valid :
    mulPoly ep_Q2_024_coefficient_21_1173
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1174 : Poly :=
[
  term ((-4660408732381323 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1174 for generator 21. -/
def ep_Q2_024_partial_21_1174 : Poly :=
[
  term ((4660408732381323 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9320817464762646 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 21. -/
theorem ep_Q2_024_partial_21_1174_valid :
    mulPoly ep_Q2_024_coefficient_21_1174
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1175 : Poly :=
[
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 1), (15, 3)]
]

/-- Partial product 1175 for generator 21. -/
def ep_Q2_024_partial_21_1175 : Poly :=
[
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 1), (15, 3)],
  term ((-659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 21. -/
theorem ep_Q2_024_partial_21_1175_valid :
    mulPoly ep_Q2_024_coefficient_21_1175
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1176 : Poly :=
[
  term ((136850605782984 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 1176 for generator 21. -/
def ep_Q2_024_partial_21_1176 : Poly :=
[
  term ((-136850605782984 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((273701211565968 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 21. -/
theorem ep_Q2_024_partial_21_1176_valid :
    mulPoly ep_Q2_024_coefficient_21_1176
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1177 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(9, 1), (11, 1)]
]

/-- Partial product 1177 for generator 21. -/
def ep_Q2_024_partial_21_1177 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 21. -/
theorem ep_Q2_024_partial_21_1177_valid :
    mulPoly ep_Q2_024_coefficient_21_1177
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1178 : Poly :=
[
  term ((2162710809249107709696910021948465857902 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1178 for generator 21. -/
def ep_Q2_024_partial_21_1178 : Poly :=
[
  term ((4325421618498215419393820043896931715804 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2162710809249107709696910021948465857902 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 21. -/
theorem ep_Q2_024_partial_21_1178_valid :
    mulPoly ep_Q2_024_coefficient_21_1178
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1179 : Poly :=
[
  term ((5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1179 for generator 21. -/
def ep_Q2_024_partial_21_1179 : Poly :=
[
  term ((11092207154328007419038131097017187972734945034045553076 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 21. -/
theorem ep_Q2_024_partial_21_1179_valid :
    mulPoly ep_Q2_024_coefficient_21_1179
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1180 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1180 for generator 21. -/
def ep_Q2_024_partial_21_1180 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 21. -/
theorem ep_Q2_024_partial_21_1180_valid :
    mulPoly ep_Q2_024_coefficient_21_1180
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1181 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1181 for generator 21. -/
def ep_Q2_024_partial_21_1181 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 21. -/
theorem ep_Q2_024_partial_21_1181_valid :
    mulPoly ep_Q2_024_coefficient_21_1181
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1182 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1182 for generator 21. -/
def ep_Q2_024_partial_21_1182 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 21. -/
theorem ep_Q2_024_partial_21_1182_valid :
    mulPoly ep_Q2_024_coefficient_21_1182
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1183 : Poly :=
[
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1183 for generator 21. -/
def ep_Q2_024_partial_21_1183 : Poly :=
[
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 21. -/
theorem ep_Q2_024_partial_21_1183_valid :
    mulPoly ep_Q2_024_coefficient_21_1183
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1184 : Poly :=
[
  term ((12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1184 for generator 21. -/
def ep_Q2_024_partial_21_1184 : Poly :=
[
  term ((12213780129134847 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 21. -/
theorem ep_Q2_024_partial_21_1184_valid :
    mulPoly ep_Q2_024_coefficient_21_1184
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1185 : Poly :=
[
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 2)]
]

/-- Partial product 1185 for generator 21. -/
def ep_Q2_024_partial_21_1185 : Poly :=
[
  term ((56960453299830809226902458886729156568 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 21. -/
theorem ep_Q2_024_partial_21_1185_valid :
    mulPoly ep_Q2_024_coefficient_21_1185
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1186 : Poly :=
[
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1186 for generator 21. -/
def ep_Q2_024_partial_21_1186 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 21. -/
theorem ep_Q2_024_partial_21_1186_valid :
    mulPoly ep_Q2_024_coefficient_21_1186
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1187 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1187 for generator 21. -/
def ep_Q2_024_partial_21_1187 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 21. -/
theorem ep_Q2_024_partial_21_1187_valid :
    mulPoly ep_Q2_024_coefficient_21_1187
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1188 : Poly :=
[
  term ((-28986108453490 : Rat) / 1162780221153193) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1188 for generator 21. -/
def ep_Q2_024_partial_21_1188 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((28986108453490 : Rat) / 1162780221153193) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 21. -/
theorem ep_Q2_024_partial_21_1188_valid :
    mulPoly ep_Q2_024_coefficient_21_1188
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1189 : Poly :=
[
  term ((-7509951046140879314352820905384457618217 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1189 for generator 21. -/
def ep_Q2_024_partial_21_1189 : Poly :=
[
  term ((-15019902092281758628705641810768915236434 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((7509951046140879314352820905384457618217 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 21. -/
theorem ep_Q2_024_partial_21_1189_valid :
    mulPoly ep_Q2_024_coefficient_21_1189
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1190 : Poly :=
[
  term ((1356627102281457081769070868501772900444 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1190 for generator 21. -/
def ep_Q2_024_partial_21_1190 : Poly :=
[
  term ((2713254204562914163538141737003545800888 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1356627102281457081769070868501772900444 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 21. -/
theorem ep_Q2_024_partial_21_1190_valid :
    mulPoly ep_Q2_024_coefficient_21_1190
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1191 : Poly :=
[
  term ((-28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 1191 for generator 21. -/
def ep_Q2_024_partial_21_1191 : Poly :=
[
  term ((-56218793397401222444627522532761657312 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 21. -/
theorem ep_Q2_024_partial_21_1191_valid :
    mulPoly ep_Q2_024_coefficient_21_1191
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1192 : Poly :=
[
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1192 for generator 21. -/
def ep_Q2_024_partial_21_1192 : Poly :=
[
  term ((19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 21. -/
theorem ep_Q2_024_partial_21_1192_valid :
    mulPoly ep_Q2_024_coefficient_21_1192
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1193 : Poly :=
[
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1193 for generator 21. -/
def ep_Q2_024_partial_21_1193 : Poly :=
[
  term ((-4996431178345856 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 21. -/
theorem ep_Q2_024_partial_21_1193_valid :
    mulPoly ep_Q2_024_coefficient_21_1193
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1194 : Poly :=
[
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1194 for generator 21. -/
def ep_Q2_024_partial_21_1194 : Poly :=
[
  term ((207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 21. -/
theorem ep_Q2_024_partial_21_1194_valid :
    mulPoly ep_Q2_024_coefficient_21_1194
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1195 : Poly :=
[
  term ((269416180545544673251388698221741892407721712501471956147 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1195 for generator 21. -/
def ep_Q2_024_partial_21_1195 : Poly :=
[
  term ((269416180545544673251388698221741892407721712501471956147 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-269416180545544673251388698221741892407721712501471956147 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 21. -/
theorem ep_Q2_024_partial_21_1195_valid :
    mulPoly ep_Q2_024_coefficient_21_1195
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1196 : Poly :=
[
  term ((112186277095531045 : Rat) / 13953362653838316) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1196 for generator 21. -/
def ep_Q2_024_partial_21_1196 : Poly :=
[
  term ((112186277095531045 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112186277095531045 : Rat) / 13953362653838316) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 21. -/
theorem ep_Q2_024_partial_21_1196_valid :
    mulPoly ep_Q2_024_coefficient_21_1196
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1197 : Poly :=
[
  term ((-3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1197 for generator 21. -/
def ep_Q2_024_partial_21_1197 : Poly :=
[
  term ((-6662901272101045224807202198331513989515819078990898894 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 21. -/
theorem ep_Q2_024_partial_21_1197_valid :
    mulPoly ep_Q2_024_coefficient_21_1197
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1198 : Poly :=
[
  term ((207570026772756 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1198 for generator 21. -/
def ep_Q2_024_partial_21_1198 : Poly :=
[
  term ((415140053545512 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-207570026772756 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 21. -/
theorem ep_Q2_024_partial_21_1198_valid :
    mulPoly ep_Q2_024_coefficient_21_1198
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1199 : Poly :=
[
  term ((-813817643158087501683105003281679194004386353358799528281 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1199 for generator 21. -/
def ep_Q2_024_partial_21_1199 : Poly :=
[
  term ((-813817643158087501683105003281679194004386353358799528281 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((813817643158087501683105003281679194004386353358799528281 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 21. -/
theorem ep_Q2_024_partial_21_1199_valid :
    mulPoly ep_Q2_024_coefficient_21_1199
        ep_Q2_024_generator_21_1100_1199 =
      ep_Q2_024_partial_21_1199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_1100_1199 : List Poly :=
[
  ep_Q2_024_partial_21_1100,
  ep_Q2_024_partial_21_1101,
  ep_Q2_024_partial_21_1102,
  ep_Q2_024_partial_21_1103,
  ep_Q2_024_partial_21_1104,
  ep_Q2_024_partial_21_1105,
  ep_Q2_024_partial_21_1106,
  ep_Q2_024_partial_21_1107,
  ep_Q2_024_partial_21_1108,
  ep_Q2_024_partial_21_1109,
  ep_Q2_024_partial_21_1110,
  ep_Q2_024_partial_21_1111,
  ep_Q2_024_partial_21_1112,
  ep_Q2_024_partial_21_1113,
  ep_Q2_024_partial_21_1114,
  ep_Q2_024_partial_21_1115,
  ep_Q2_024_partial_21_1116,
  ep_Q2_024_partial_21_1117,
  ep_Q2_024_partial_21_1118,
  ep_Q2_024_partial_21_1119,
  ep_Q2_024_partial_21_1120,
  ep_Q2_024_partial_21_1121,
  ep_Q2_024_partial_21_1122,
  ep_Q2_024_partial_21_1123,
  ep_Q2_024_partial_21_1124,
  ep_Q2_024_partial_21_1125,
  ep_Q2_024_partial_21_1126,
  ep_Q2_024_partial_21_1127,
  ep_Q2_024_partial_21_1128,
  ep_Q2_024_partial_21_1129,
  ep_Q2_024_partial_21_1130,
  ep_Q2_024_partial_21_1131,
  ep_Q2_024_partial_21_1132,
  ep_Q2_024_partial_21_1133,
  ep_Q2_024_partial_21_1134,
  ep_Q2_024_partial_21_1135,
  ep_Q2_024_partial_21_1136,
  ep_Q2_024_partial_21_1137,
  ep_Q2_024_partial_21_1138,
  ep_Q2_024_partial_21_1139,
  ep_Q2_024_partial_21_1140,
  ep_Q2_024_partial_21_1141,
  ep_Q2_024_partial_21_1142,
  ep_Q2_024_partial_21_1143,
  ep_Q2_024_partial_21_1144,
  ep_Q2_024_partial_21_1145,
  ep_Q2_024_partial_21_1146,
  ep_Q2_024_partial_21_1147,
  ep_Q2_024_partial_21_1148,
  ep_Q2_024_partial_21_1149,
  ep_Q2_024_partial_21_1150,
  ep_Q2_024_partial_21_1151,
  ep_Q2_024_partial_21_1152,
  ep_Q2_024_partial_21_1153,
  ep_Q2_024_partial_21_1154,
  ep_Q2_024_partial_21_1155,
  ep_Q2_024_partial_21_1156,
  ep_Q2_024_partial_21_1157,
  ep_Q2_024_partial_21_1158,
  ep_Q2_024_partial_21_1159,
  ep_Q2_024_partial_21_1160,
  ep_Q2_024_partial_21_1161,
  ep_Q2_024_partial_21_1162,
  ep_Q2_024_partial_21_1163,
  ep_Q2_024_partial_21_1164,
  ep_Q2_024_partial_21_1165,
  ep_Q2_024_partial_21_1166,
  ep_Q2_024_partial_21_1167,
  ep_Q2_024_partial_21_1168,
  ep_Q2_024_partial_21_1169,
  ep_Q2_024_partial_21_1170,
  ep_Q2_024_partial_21_1171,
  ep_Q2_024_partial_21_1172,
  ep_Q2_024_partial_21_1173,
  ep_Q2_024_partial_21_1174,
  ep_Q2_024_partial_21_1175,
  ep_Q2_024_partial_21_1176,
  ep_Q2_024_partial_21_1177,
  ep_Q2_024_partial_21_1178,
  ep_Q2_024_partial_21_1179,
  ep_Q2_024_partial_21_1180,
  ep_Q2_024_partial_21_1181,
  ep_Q2_024_partial_21_1182,
  ep_Q2_024_partial_21_1183,
  ep_Q2_024_partial_21_1184,
  ep_Q2_024_partial_21_1185,
  ep_Q2_024_partial_21_1186,
  ep_Q2_024_partial_21_1187,
  ep_Q2_024_partial_21_1188,
  ep_Q2_024_partial_21_1189,
  ep_Q2_024_partial_21_1190,
  ep_Q2_024_partial_21_1191,
  ep_Q2_024_partial_21_1192,
  ep_Q2_024_partial_21_1193,
  ep_Q2_024_partial_21_1194,
  ep_Q2_024_partial_21_1195,
  ep_Q2_024_partial_21_1196,
  ep_Q2_024_partial_21_1197,
  ep_Q2_024_partial_21_1198,
  ep_Q2_024_partial_21_1199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_1100_1199 : Poly :=
[
  term ((-49011656764650655 : Rat) / 6976681326919158) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-392083886265701909020309912603463844256 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-1859489400717863008451309270511497282108 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-59583489357913830406433971692805233712439082938111255209 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((12431018815936527 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 2), (13, 2)],
  term ((-92813365076547770138170359849624035693344747156319939251 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-82731422006668921 : Rat) / 6976681326919158) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6662901272101045224807202198331513989515819078990898894 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-415140053545512 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17585409661630061746250391663933747309951082179672291455 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((26508189435532205 : Rat) / 3488340663459579) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-1249107794586464 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7166108000503388206187503509734412080716 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (13, 2)],
  term ((-12492809953083775879076896425112110879808 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((56218793397401222444627522532761657312 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (13, 2), (14, 2)],
  term ((-19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((4996431178345856 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (13, 3), (15, 1)],
  term ((-3677376949012188781427671312842320223872 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (14, 1)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-12213780129134847 : Rat) / 1162780221153193) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (14, 2)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((49011656764650655 : Rat) / 13953362653838316) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((196041943132850954510154956301731922128 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1), (13, 2)],
  term ((929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1), (14, 1)],
  term ((59583489357913830406433971692805233712439082938111255209 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (12, 1), (15, 2)],
  term ((-12431018815936527 : Rat) / 2325560442306386) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 2), (13, 2)],
  term ((92813365076547770138170359849624035693344747156319939251 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((82731422006668921 : Rat) / 13953362653838316) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((207570026772756 : Rat) / 1162780221153193) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17585409661630061746250391663933747309951082179672291455 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (13, 1), (15, 1)],
  term ((-26508189435532205 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3583054000251694103093751754867206040358 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2)],
  term ((6246404976541887939538448212556055439904 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (14, 1)],
  term ((-28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2), (14, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 2), (15, 2)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 3), (15, 1)],
  term ((1838688474506094390713835656421160111936 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (14, 1)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (14, 1), (15, 2)],
  term ((12213780129134847 : Rat) / 2325560442306386) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (14, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(8, 1), (15, 2), (16, 1)],
  term ((871557347738064252800882807753378762 : Rat) / 599854728701238648283346764014769633995) [(8, 2)],
  term ((-243177881470978164141696144098287893064 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((1061058716954944705137835502179015457656 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (9, 1), (11, 1)],
  term ((-530529358477472352568917751089507728828 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (13, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 2), (9, 1), (15, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (10, 1)],
  term ((-1743114695476128505601765615506757524 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-537920766019599777996106631007983419660 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-4815941933934353 : Rat) / 2325560442306386) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1), (12, 1), (13, 2)],
  term ((-3968574480513170989370067179359035675785990276238009150 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((14080006143155968 : Rat) / 1162780221153193) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19854942744006854674232296794146710728 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (10, 1), (13, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (10, 1), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (10, 1), (15, 2)],
  term ((3791843580843907 : Rat) / 2325560442306386) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (13, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (11, 1), (15, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)],
  term ((1984287240256585494685033589679517837892995138119004575 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 2), (13, 1), (15, 1)],
  term ((-7040003071577984 : Rat) / 1162780221153193) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((9927471372003427337116148397073355364 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (13, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (15, 2)],
  term ((-3791843580843907 : Rat) / 4651120884612772) [(8, 2), (15, 2), (16, 1)],
  term ((4325421618498215419393820043896931715804 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((11092207154328007419038131097017187972734945034045553076 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((12213780129134847 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((56960453299830809226902458886729156568 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-11492780264891005012005163296554756120938 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((2547129504283995756354638229059909031968 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-56218793397401222444627522532761657312 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4996431178345856 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((125109722716038263779515583490660891561614725169745090549 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((83635389120201241 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6662901272101045224807202198331513989515819078990898894 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((415140053545512 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-76119288641052222185073485225852923838335133327637973191 : Rat) / 743999161705615854803818744669012717973877138597969104) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-10864174184553155 : Rat) / 4651120884612772) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((92367204208362985681914065226852087376 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-4174537424080125791966244500138790069363717079026362551 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((3262078739251964 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((129943648889074072142136367760371661717 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1)],
  term ((-2714028765275053728630721752454205575148 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((997749444314866462215673905698593625231477803169669488 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((51975418274089175683915374061976030368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((8134085161510453086479282563191431595436282524794580617 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-12329776359333749 : Rat) / 2325560442306386) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-99104402996943989439342730908244621140002902954621176395 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 1), (10, 1), (15, 1)],
  term ((4660408732381323 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 1), (15, 3)],
  term ((-136850605782984 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (11, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-783804850531278581488995225380924247888 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((110749800185945604789002338629091179280 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-5295649380128505904357902612512039113856123150388165775 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((9516962658443268 : Rat) / 1162780221153193) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-485845956700391670590107728175564530433745706803029458697 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((10864174184553155 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-184734408416725971363828130453704174752 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 2), (12, 2), (13, 1)],
  term ((8349074848160251583932489000277580138727434158052725102 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 2), (12, 2), (15, 1)],
  term ((-6524157478503928 : Rat) / 1162780221153193) [(9, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-259887297778148144284272735520743323434 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1)],
  term ((5428057530550107457261443504908411150296 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((-1995498888629732924431347811397187250462955606339338976 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-8134085161510453086479282563191431595436282524794580617 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((12329776359333749 : Rat) / 1162780221153193) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((99104402996943989439342730908244621140002902954621176395 : Rat) / 836999056918817836654296087752639307720611780922715242) [(9, 1), (10, 2), (15, 1)],
  term ((-9320817464762646 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 2), (15, 3)],
  term ((273701211565968 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(9, 1), (11, 1)],
  term ((-2162710809249107709696910021948465857902 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1)],
  term ((-5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 2)],
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 1), (15, 2)],
  term ((28986108453490 : Rat) / 1162780221153193) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((7509951046140879314352820905384457618217 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)],
  term ((-1356627102281457081769070868501772900444 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-269416180545544673251388698221741892407721712501471956147 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-112186277095531045 : Rat) / 13953362653838316) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-207570026772756 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((813817643158087501683105003281679194004386353358799528281 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 1100 through 1199. -/
theorem ep_Q2_024_block_21_1100_1199_valid :
    checkProductSumEq ep_Q2_024_partials_21_1100_1199
      ep_Q2_024_block_21_1100_1199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
