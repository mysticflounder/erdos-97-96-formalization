/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:1200-1299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1200 : Poly :=
[
  term ((-43944030495136207 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1200 for generator 21. -/
def ep_Q2_024_partial_21_1200 : Poly :=
[
  term ((-43944030495136207 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((43944030495136207 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 21. -/
theorem ep_Q2_024_partial_21_1200_valid :
    mulPoly ep_Q2_024_coefficient_21_1200
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1201 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 1201 for generator 21. -/
def ep_Q2_024_partial_21_1201 : Poly :=
[
  term ((-4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 21. -/
theorem ep_Q2_024_partial_21_1201_valid :
    mulPoly ep_Q2_024_coefficient_21_1201
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1202 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1202 for generator 21. -/
def ep_Q2_024_partial_21_1202 : Poly :=
[
  term ((1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 21. -/
theorem ep_Q2_024_partial_21_1202_valid :
    mulPoly ep_Q2_024_coefficient_21_1202
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1203 : Poly :=
[
  term ((-786981680427096789129747516813681248002 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1203 for generator 21. -/
def ep_Q2_024_partial_21_1203 : Poly :=
[
  term ((-1573963360854193578259495033627362496004 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((786981680427096789129747516813681248002 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 21. -/
theorem ep_Q2_024_partial_21_1203_valid :
    mulPoly ep_Q2_024_coefficient_21_1203
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1204 : Poly :=
[
  term ((929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1204 for generator 21. -/
def ep_Q2_024_partial_21_1204 : Poly :=
[
  term ((1859489400717863008451309270511497282108 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 21. -/
theorem ep_Q2_024_partial_21_1204_valid :
    mulPoly ep_Q2_024_coefficient_21_1204
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1205 : Poly :=
[
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1205 for generator 21. -/
def ep_Q2_024_partial_21_1205 : Poly :=
[
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 21. -/
theorem ep_Q2_024_partial_21_1205_valid :
    mulPoly ep_Q2_024_coefficient_21_1205
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1206 : Poly :=
[
  term ((7650512415470575 : Rat) / 2325560442306386) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1206 for generator 21. -/
def ep_Q2_024_partial_21_1206 : Poly :=
[
  term ((7650512415470575 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7650512415470575 : Rat) / 2325560442306386) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 21. -/
theorem ep_Q2_024_partial_21_1206_valid :
    mulPoly ep_Q2_024_coefficient_21_1206
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1207 : Poly :=
[
  term ((809512716975816613600951705646573997504922741451614847107 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1207 for generator 21. -/
def ep_Q2_024_partial_21_1207 : Poly :=
[
  term ((809512716975816613600951705646573997504922741451614847107 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-809512716975816613600951705646573997504922741451614847107 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 21. -/
theorem ep_Q2_024_partial_21_1207_valid :
    mulPoly ep_Q2_024_coefficient_21_1207
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1208 : Poly :=
[
  term ((22045241317422277 : Rat) / 13953362653838316) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1208 for generator 21. -/
def ep_Q2_024_partial_21_1208 : Poly :=
[
  term ((22045241317422277 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-22045241317422277 : Rat) / 13953362653838316) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 21. -/
theorem ep_Q2_024_partial_21_1208_valid :
    mulPoly ep_Q2_024_coefficient_21_1208
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1209 : Poly :=
[
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 3), (13, 1)]
]

/-- Partial product 1209 for generator 21. -/
def ep_Q2_024_partial_21_1209 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 3), (13, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 21. -/
theorem ep_Q2_024_partial_21_1209_valid :
    mulPoly ep_Q2_024_coefficient_21_1209
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1210 : Poly :=
[
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 3), (15, 1)]
]

/-- Partial product 1210 for generator 21. -/
def ep_Q2_024_partial_21_1210 : Poly :=
[
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (10, 1), (12, 3), (15, 1)],
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 21. -/
theorem ep_Q2_024_partial_21_1210_valid :
    mulPoly ep_Q2_024_coefficient_21_1210
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1211 : Poly :=
[
  term ((4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 1211 for generator 21. -/
def ep_Q2_024_partial_21_1211 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 21. -/
theorem ep_Q2_024_partial_21_1211_valid :
    mulPoly ep_Q2_024_coefficient_21_1211
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1212 : Poly :=
[
  term ((-129943648889074072142136367760371661717 : Rat) / 1199709457402477296566693528029539267990) [(9, 1), (13, 1)]
]

/-- Partial product 1212 for generator 21. -/
def ep_Q2_024_partial_21_1212 : Poly :=
[
  term ((-129943648889074072142136367760371661717 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1)],
  term ((129943648889074072142136367760371661717 : Rat) / 1199709457402477296566693528029539267990) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 21. -/
theorem ep_Q2_024_partial_21_1212_valid :
    mulPoly ep_Q2_024_coefficient_21_1212
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1213 : Poly :=
[
  term ((1357014382637526864315360876227102787574 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1213 for generator 21. -/
def ep_Q2_024_partial_21_1213 : Poly :=
[
  term ((2714028765275053728630721752454205575148 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1357014382637526864315360876227102787574 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 21. -/
theorem ep_Q2_024_partial_21_1213_valid :
    mulPoly ep_Q2_024_coefficient_21_1213
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1214 : Poly :=
[
  term ((6496927284261146960489421757747003796 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 1214 for generator 21. -/
def ep_Q2_024_partial_21_1214 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-6496927284261146960489421757747003796 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 21. -/
theorem ep_Q2_024_partial_21_1214_valid :
    mulPoly ep_Q2_024_coefficient_21_1214
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1215 : Poly :=
[
  term ((-498874722157433231107836952849296812615738901584834744 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1215 for generator 21. -/
def ep_Q2_024_partial_21_1215 : Poly :=
[
  term ((-997749444314866462215673905698593625231477803169669488 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((498874722157433231107836952849296812615738901584834744 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 21. -/
theorem ep_Q2_024_partial_21_1215_valid :
    mulPoly ep_Q2_024_coefficient_21_1215
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1216 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1216 for generator 21. -/
def ep_Q2_024_partial_21_1216 : Poly :=
[
  term ((1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 21. -/
theorem ep_Q2_024_partial_21_1216_valid :
    mulPoly ep_Q2_024_coefficient_21_1216
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1217 : Poly :=
[
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 1217 for generator 21. -/
def ep_Q2_024_partial_21_1217 : Poly :=
[
  term ((-51975418274089175683915374061976030368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 21. -/
theorem ep_Q2_024_partial_21_1217_valid :
    mulPoly ep_Q2_024_coefficient_21_1217
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1218 : Poly :=
[
  term ((-8134085161510453086479282563191431595436282524794580617 : Rat) / 743999161705615854803818744669012717973877138597969104) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1218 for generator 21. -/
def ep_Q2_024_partial_21_1218 : Poly :=
[
  term ((-8134085161510453086479282563191431595436282524794580617 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((8134085161510453086479282563191431595436282524794580617 : Rat) / 743999161705615854803818744669012717973877138597969104) [(9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 21. -/
theorem ep_Q2_024_partial_21_1218_valid :
    mulPoly ep_Q2_024_coefficient_21_1218
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1219 : Poly :=
[
  term ((12329776359333749 : Rat) / 4651120884612772) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1219 for generator 21. -/
def ep_Q2_024_partial_21_1219 : Poly :=
[
  term ((12329776359333749 : Rat) / 2325560442306386) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12329776359333749 : Rat) / 4651120884612772) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 21. -/
theorem ep_Q2_024_partial_21_1219_valid :
    mulPoly ep_Q2_024_coefficient_21_1219
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1220 : Poly :=
[
  term ((622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 1220 for generator 21. -/
def ep_Q2_024_partial_21_1220 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 21. -/
theorem ep_Q2_024_partial_21_1220_valid :
    mulPoly ep_Q2_024_coefficient_21_1220
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1221 : Poly :=
[
  term ((-156138474323308 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1221 for generator 21. -/
def ep_Q2_024_partial_21_1221 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((156138474323308 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 21. -/
theorem ep_Q2_024_partial_21_1221_valid :
    mulPoly ep_Q2_024_coefficient_21_1221
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1222 : Poly :=
[
  term ((99104402996943989439342730908244621140002902954621176395 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(9, 1), (15, 1)]
]

/-- Partial product 1222 for generator 21. -/
def ep_Q2_024_partial_21_1222 : Poly :=
[
  term ((99104402996943989439342730908244621140002902954621176395 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 1), (10, 1), (15, 1)],
  term ((-99104402996943989439342730908244621140002902954621176395 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 21. -/
theorem ep_Q2_024_partial_21_1222_valid :
    mulPoly ep_Q2_024_coefficient_21_1222
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1223 : Poly :=
[
  term ((-4660408732381323 : Rat) / 2325560442306386) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1223 for generator 21. -/
def ep_Q2_024_partial_21_1223 : Poly :=
[
  term ((-4660408732381323 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4660408732381323 : Rat) / 2325560442306386) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 21. -/
theorem ep_Q2_024_partial_21_1223_valid :
    mulPoly ep_Q2_024_coefficient_21_1223
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1224 : Poly :=
[
  term ((-164811286342967808698294818897798801710593850205157267 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (15, 3)]
]

/-- Partial product 1224 for generator 21. -/
def ep_Q2_024_partial_21_1224 : Poly :=
[
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 1), (15, 3)],
  term ((164811286342967808698294818897798801710593850205157267 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 21. -/
theorem ep_Q2_024_partial_21_1224_valid :
    mulPoly ep_Q2_024_coefficient_21_1224
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1225 : Poly :=
[
  term ((68425302891492 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1225 for generator 21. -/
def ep_Q2_024_partial_21_1225 : Poly :=
[
  term ((136850605782984 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-68425302891492 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 21. -/
theorem ep_Q2_024_partial_21_1225_valid :
    mulPoly ep_Q2_024_coefficient_21_1225
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1226 : Poly :=
[
  term ((65855818555045804241571811182498029599 : Rat) / 199951576233746216094448921338256544665) [(9, 2)]
]

/-- Partial product 1226 for generator 21. -/
def ep_Q2_024_partial_21_1226 : Poly :=
[
  term ((-65855818555045804241571811182498029599 : Rat) / 199951576233746216094448921338256544665) [(9, 2)],
  term ((131711637110091608483143622364996059198 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 21. -/
theorem ep_Q2_024_partial_21_1226_valid :
    mulPoly ep_Q2_024_coefficient_21_1226
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1227 : Poly :=
[
  term ((131711637110091608483143622364996059198 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1)]
]

/-- Partial product 1227 for generator 21. -/
def ep_Q2_024_partial_21_1227 : Poly :=
[
  term ((-131711637110091608483143622364996059198 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1)],
  term ((263423274220183216966287244729992118396 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 21. -/
theorem ep_Q2_024_partial_21_1227_valid :
    mulPoly ep_Q2_024_coefficient_21_1227
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1228 : Poly :=
[
  term ((-1500730149383640044289963879666460622438 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 1228 for generator 21. -/
def ep_Q2_024_partial_21_1228 : Poly :=
[
  term ((1500730149383640044289963879666460622438 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 1)],
  term ((-3001460298767280088579927759332921244876 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 21. -/
theorem ep_Q2_024_partial_21_1228_valid :
    mulPoly ep_Q2_024_coefficient_21_1228
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1229 : Poly :=
[
  term ((-2040314698891280048699368940101319334227481061853414238 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1229 for generator 21. -/
def ep_Q2_024_partial_21_1229 : Poly :=
[
  term ((2040314698891280048699368940101319334227481061853414238 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4080629397782560097398737880202638668454962123706828476 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 21. -/
theorem ep_Q2_024_partial_21_1229_valid :
    mulPoly ep_Q2_024_coefficient_21_1229
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1230 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1230 for generator 21. -/
def ep_Q2_024_partial_21_1230 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 21. -/
theorem ep_Q2_024_partial_21_1230_valid :
    mulPoly ep_Q2_024_coefficient_21_1230
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1231 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (13, 2)]
]

/-- Partial product 1231 for generator 21. -/
def ep_Q2_024_partial_21_1231 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (13, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 21. -/
theorem ep_Q2_024_partial_21_1231_valid :
    mulPoly ep_Q2_024_coefficient_21_1231
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1232 : Poly :=
[
  term ((1228191624313005819433004562942327279176 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 1232 for generator 21. -/
def ep_Q2_024_partial_21_1232 : Poly :=
[
  term ((-1228191624313005819433004562942327279176 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1), (14, 1)],
  term ((2456383248626011638866009125884654558352 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 21. -/
theorem ep_Q2_024_partial_21_1232_valid :
    mulPoly ep_Q2_024_coefficient_21_1232
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1233 : Poly :=
[
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (10, 1), (15, 2)]
]

/-- Partial product 1233 for generator 21. -/
def ep_Q2_024_partial_21_1233 : Poly :=
[
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (10, 1), (15, 2)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 2), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 21. -/
theorem ep_Q2_024_partial_21_1233_valid :
    mulPoly ep_Q2_024_coefficient_21_1233
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1234 : Poly :=
[
  term ((3791843580843907 : Rat) / 2325560442306386) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1234 for generator 21. -/
def ep_Q2_024_partial_21_1234 : Poly :=
[
  term ((-3791843580843907 : Rat) / 2325560442306386) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((3791843580843907 : Rat) / 1162780221153193) [(9, 2), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 21. -/
theorem ep_Q2_024_partial_21_1234_valid :
    mulPoly ep_Q2_024_coefficient_21_1234
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1235 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1235 for generator 21. -/
def ep_Q2_024_partial_21_1235 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 21. -/
theorem ep_Q2_024_partial_21_1235_valid :
    mulPoly ep_Q2_024_coefficient_21_1235
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1236 : Poly :=
[
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1236 for generator 21. -/
def ep_Q2_024_partial_21_1236 : Poly :=
[
  term ((607204489400779876296800121154045767506615342827361630 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 21. -/
theorem ep_Q2_024_partial_21_1236_valid :
    mulPoly ep_Q2_024_coefficient_21_1236
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1237 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1237 for generator 21. -/
def ep_Q2_024_partial_21_1237 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 21. -/
theorem ep_Q2_024_partial_21_1237_valid :
    mulPoly ep_Q2_024_coefficient_21_1237
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1238 : Poly :=
[
  term ((-236113050396874376356810378545819923320 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (12, 1)]
]

/-- Partial product 1238 for generator 21. -/
def ep_Q2_024_partial_21_1238 : Poly :=
[
  term ((-472226100793748752713620757091639846640 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (10, 1), (12, 1)],
  term ((236113050396874376356810378545819923320 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 21. -/
theorem ep_Q2_024_partial_21_1238_valid :
    mulPoly ep_Q2_024_coefficient_21_1238
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1239 : Poly :=
[
  term ((308948681859185114168588673511780125908 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (12, 1), (14, 1)]
]

/-- Partial product 1239 for generator 21. -/
def ep_Q2_024_partial_21_1239 : Poly :=
[
  term ((617897363718370228337177347023560251816 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-308948681859185114168588673511780125908 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 21. -/
theorem ep_Q2_024_partial_21_1239_valid :
    mulPoly ep_Q2_024_coefficient_21_1239
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1240 : Poly :=
[
  term ((-1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2)]
]

/-- Partial product 1240 for generator 21. -/
def ep_Q2_024_partial_21_1240 : Poly :=
[
  term ((-3813787790979841501322937562585614036464 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 2)],
  term ((1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 21. -/
theorem ep_Q2_024_partial_21_1240_valid :
    mulPoly ep_Q2_024_coefficient_21_1240
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1241 : Poly :=
[
  term ((-1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 1241 for generator 21. -/
def ep_Q2_024_partial_21_1241 : Poly :=
[
  term ((-2040314698891280048699368940101319334227481061853414238 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 21. -/
theorem ep_Q2_024_partial_21_1241_valid :
    mulPoly ep_Q2_024_coefficient_21_1241
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1242 : Poly :=
[
  term ((37665296397180 : Rat) / 1162780221153193) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1242 for generator 21. -/
def ep_Q2_024_partial_21_1242 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 21. -/
theorem ep_Q2_024_partial_21_1242_valid :
    mulPoly ep_Q2_024_coefficient_21_1242
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1243 : Poly :=
[
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (13, 2)]
]

/-- Partial product 1243 for generator 21. -/
def ep_Q2_024_partial_21_1243 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (13, 2)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 21. -/
theorem ep_Q2_024_partial_21_1243_valid :
    mulPoly ep_Q2_024_coefficient_21_1243
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1244 : Poly :=
[
  term ((614095812156502909716502281471163639588 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (14, 1)]
]

/-- Partial product 1244 for generator 21. -/
def ep_Q2_024_partial_21_1244 : Poly :=
[
  term ((1228191624313005819433004562942327279176 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1), (14, 1)],
  term ((-614095812156502909716502281471163639588 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 21. -/
theorem ep_Q2_024_partial_21_1244_valid :
    mulPoly ep_Q2_024_coefficient_21_1244
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1245 : Poly :=
[
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (15, 2)]
]

/-- Partial product 1245 for generator 21. -/
def ep_Q2_024_partial_21_1245 : Poly :=
[
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (10, 1), (15, 2)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 21. -/
theorem ep_Q2_024_partial_21_1245_valid :
    mulPoly ep_Q2_024_coefficient_21_1245
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1246 : Poly :=
[
  term ((3791843580843907 : Rat) / 4651120884612772) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1246 for generator 21. -/
def ep_Q2_024_partial_21_1246 : Poly :=
[
  term ((3791843580843907 : Rat) / 2325560442306386) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3791843580843907 : Rat) / 4651120884612772) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 21. -/
theorem ep_Q2_024_partial_21_1246_valid :
    mulPoly ep_Q2_024_coefficient_21_1246
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1247 : Poly :=
[
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 1), (13, 1)]
]

/-- Partial product 1247 for generator 21. -/
def ep_Q2_024_partial_21_1247 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 1), (13, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 21. -/
theorem ep_Q2_024_partial_21_1247_valid :
    mulPoly ep_Q2_024_coefficient_21_1247
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1248 : Poly :=
[
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (10, 1), (15, 1)]
]

/-- Partial product 1248 for generator 21. -/
def ep_Q2_024_partial_21_1248 : Poly :=
[
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (10, 1), (15, 1)],
  term ((-1862017972688907367940148742016867997082388675896278214 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 21. -/
theorem ep_Q2_024_partial_21_1248_valid :
    mulPoly ep_Q2_024_coefficient_21_1248
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1249 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1249 for generator 21. -/
def ep_Q2_024_partial_21_1249 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 3), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 21. -/
theorem ep_Q2_024_partial_21_1249_valid :
    mulPoly ep_Q2_024_coefficient_21_1249
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1250 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (12, 1)]
]

/-- Partial product 1250 for generator 21. -/
def ep_Q2_024_partial_21_1250 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 1), (11, 1), (12, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 21. -/
theorem ep_Q2_024_partial_21_1250_valid :
    mulPoly ep_Q2_024_coefficient_21_1250
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1251 : Poly :=
[
  term ((39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (13, 1)]
]

/-- Partial product 1251 for generator 21. -/
def ep_Q2_024_partial_21_1251 : Poly :=
[
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 1), (13, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 21. -/
theorem ep_Q2_024_partial_21_1251_valid :
    mulPoly ep_Q2_024_coefficient_21_1251
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1252 : Poly :=
[
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 3), (15, 1)]
]

/-- Partial product 1252 for generator 21. -/
def ep_Q2_024_partial_21_1252 : Poly :=
[
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (10, 1), (15, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 21. -/
theorem ep_Q2_024_partial_21_1252_valid :
    mulPoly ep_Q2_024_coefficient_21_1252
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1253 : Poly :=
[
  term ((373787112386234 : Rat) / 1162780221153193) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1253 for generator 21. -/
def ep_Q2_024_partial_21_1253 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 21. -/
theorem ep_Q2_024_partial_21_1253_valid :
    mulPoly ep_Q2_024_coefficient_21_1253
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1254 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 4)]
]

/-- Partial product 1254 for generator 21. -/
def ep_Q2_024_partial_21_1254 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 4)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 21. -/
theorem ep_Q2_024_partial_21_1254_valid :
    mulPoly ep_Q2_024_coefficient_21_1254
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1255 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (10, 1)]
]

/-- Partial product 1255 for generator 21. -/
def ep_Q2_024_partial_21_1255 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (10, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 21. -/
theorem ep_Q2_024_partial_21_1255_valid :
    mulPoly ep_Q2_024_coefficient_21_1255
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1256 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1256 for generator 21. -/
def ep_Q2_024_partial_21_1256 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 21. -/
theorem ep_Q2_024_partial_21_1256_valid :
    mulPoly ep_Q2_024_coefficient_21_1256
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1257 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1257 for generator 21. -/
def ep_Q2_024_partial_21_1257 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((115944433813960 : Rat) / 1162780221153193) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 21. -/
theorem ep_Q2_024_partial_21_1257_valid :
    mulPoly ep_Q2_024_coefficient_21_1257
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1258 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1258 for generator 21. -/
def ep_Q2_024_partial_21_1258 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 21. -/
theorem ep_Q2_024_partial_21_1258_valid :
    mulPoly ep_Q2_024_coefficient_21_1258
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1259 : Poly :=
[
  term ((3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1259 for generator 21. -/
def ep_Q2_024_partial_21_1259 : Poly :=
[
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6225605552608120682397972370504363487258128862913769462 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 21. -/
theorem ep_Q2_024_partial_21_1259_valid :
    mulPoly ep_Q2_024_coefficient_21_1259
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1260 : Poly :=
[
  term ((-2569183513052036 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1260 for generator 21. -/
def ep_Q2_024_partial_21_1260 : Poly :=
[
  term ((2569183513052036 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5138367026104072 : Rat) / 1162780221153193) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 21. -/
theorem ep_Q2_024_partial_21_1260_valid :
    mulPoly ep_Q2_024_coefficient_21_1260
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1261 : Poly :=
[
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1261 for generator 21. -/
def ep_Q2_024_partial_21_1261 : Poly :=
[
  term ((-109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 21. -/
theorem ep_Q2_024_partial_21_1261_valid :
    mulPoly ep_Q2_024_coefficient_21_1261
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1262 : Poly :=
[
  term ((-3654372084731843 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1262 for generator 21. -/
def ep_Q2_024_partial_21_1262 : Poly :=
[
  term ((3654372084731843 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7308744169463686 : Rat) / 1162780221153193) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 21. -/
theorem ep_Q2_024_partial_21_1262_valid :
    mulPoly ep_Q2_024_coefficient_21_1262
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1263 : Poly :=
[
  term ((-3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 1263 for generator 21. -/
def ep_Q2_024_partial_21_1263 : Poly :=
[
  term ((3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(10, 1), (12, 1), (13, 2)],
  term ((-7478985091813737468957094086745190952 : Rat) / 3389009766673664679566930870139941435) [(10, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 21. -/
theorem ep_Q2_024_partial_21_1263_valid :
    mulPoly ep_Q2_024_coefficient_21_1263
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1264 : Poly :=
[
  term ((19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1264 for generator 21. -/
def ep_Q2_024_partial_21_1264 : Poly :=
[
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((39537786970167917942153773089227722208 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 21. -/
theorem ep_Q2_024_partial_21_1264_valid :
    mulPoly ep_Q2_024_coefficient_21_1264
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1265 : Poly :=
[
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1265 for generator 21. -/
def ep_Q2_024_partial_21_1265 : Poly :=
[
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 21. -/
theorem ep_Q2_024_partial_21_1265_valid :
    mulPoly ep_Q2_024_coefficient_21_1265
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1266 : Poly :=
[
  term ((1758553647569664 : Rat) / 1162780221153193) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1266 for generator 21. -/
def ep_Q2_024_partial_21_1266 : Poly :=
[
  term ((-1758553647569664 : Rat) / 1162780221153193) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3517107295139328 : Rat) / 1162780221153193) [(10, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 21. -/
theorem ep_Q2_024_partial_21_1266_valid :
    mulPoly ep_Q2_024_coefficient_21_1266
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1267 : Poly :=
[
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(10, 1), (12, 2), (13, 2)]
]

/-- Partial product 1267 for generator 21. -/
def ep_Q2_024_partial_21_1267 : Poly :=
[
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(10, 1), (12, 2), (13, 2)],
  term ((54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(10, 2), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 21. -/
theorem ep_Q2_024_partial_21_1267_valid :
    mulPoly ep_Q2_024_coefficient_21_1267
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1268 : Poly :=
[
  term ((2630935571061860204683141042587004946833587022868345873 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1268 for generator 21. -/
def ep_Q2_024_partial_21_1268 : Poly :=
[
  term ((-2630935571061860204683141042587004946833587022868345873 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((5261871142123720409366282085174009893667174045736691746 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 21. -/
theorem ep_Q2_024_partial_21_1268_valid :
    mulPoly ep_Q2_024_coefficient_21_1268
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1269 : Poly :=
[
  term ((1250951611561428 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1269 for generator 21. -/
def ep_Q2_024_partial_21_1269 : Poly :=
[
  term ((-1250951611561428 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 21. -/
theorem ep_Q2_024_partial_21_1269_valid :
    mulPoly ep_Q2_024_coefficient_21_1269
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1270 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1270 for generator 21. -/
def ep_Q2_024_partial_21_1270 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 21. -/
theorem ep_Q2_024_partial_21_1270_valid :
    mulPoly ep_Q2_024_coefficient_21_1270
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1271 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1271 for generator 21. -/
def ep_Q2_024_partial_21_1271 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 21. -/
theorem ep_Q2_024_partial_21_1271_valid :
    mulPoly ep_Q2_024_coefficient_21_1271
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1272 : Poly :=
[
  term ((269572619290367145925693031522732522232016406550237283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1272 for generator 21. -/
def ep_Q2_024_partial_21_1272 : Poly :=
[
  term ((-269572619290367145925693031522732522232016406550237283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(10, 1), (13, 1), (15, 1)],
  term ((269572619290367145925693031522732522232016406550237283 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 21. -/
theorem ep_Q2_024_partial_21_1272_valid :
    mulPoly ep_Q2_024_coefficient_21_1272
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1273 : Poly :=
[
  term ((1436814438016135 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1273 for generator 21. -/
def ep_Q2_024_partial_21_1273 : Poly :=
[
  term ((-1436814438016135 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2873628876032270 : Rat) / 1162780221153193) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 21. -/
theorem ep_Q2_024_partial_21_1273_valid :
    mulPoly ep_Q2_024_coefficient_21_1273
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1274 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 1274 for generator 21. -/
def ep_Q2_024_partial_21_1274 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 21. -/
theorem ep_Q2_024_partial_21_1274_valid :
    mulPoly ep_Q2_024_coefficient_21_1274
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1275 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1275 for generator 21. -/
def ep_Q2_024_partial_21_1275 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(10, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 21. -/
theorem ep_Q2_024_partial_21_1275_valid :
    mulPoly ep_Q2_024_coefficient_21_1275
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1276 : Poly :=
[
  term ((-110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2)]
]

/-- Partial product 1276 for generator 21. -/
def ep_Q2_024_partial_21_1276 : Poly :=
[
  term ((110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2)],
  term ((-221106349654177259571146831731159999316 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 21. -/
theorem ep_Q2_024_partial_21_1276_valid :
    mulPoly ep_Q2_024_coefficient_21_1276
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1277 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 1277 for generator 21. -/
def ep_Q2_024_partial_21_1277 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 21. -/
theorem ep_Q2_024_partial_21_1277_valid :
    mulPoly ep_Q2_024_coefficient_21_1277
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1278 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 2), (14, 2)]
]

/-- Partial product 1278 for generator 21. -/
def ep_Q2_024_partial_21_1278 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 2), (14, 2)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 21. -/
theorem ep_Q2_024_partial_21_1278_valid :
    mulPoly ep_Q2_024_coefficient_21_1278
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1279 : Poly :=
[
  term ((2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 1279 for generator 21. -/
def ep_Q2_024_partial_21_1279 : Poly :=
[
  term ((-2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (13, 2), (15, 2)],
  term ((4796472436781460131864501042878907222839008479598572784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 21. -/
theorem ep_Q2_024_partial_21_1279_valid :
    mulPoly ep_Q2_024_coefficient_21_1279
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1280 : Poly :=
[
  term ((-1698235349016064 : Rat) / 1162780221153193) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1280 for generator 21. -/
def ep_Q2_024_partial_21_1280 : Poly :=
[
  term ((1698235349016064 : Rat) / 1162780221153193) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3396470698032128 : Rat) / 1162780221153193) [(10, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 21. -/
theorem ep_Q2_024_partial_21_1280_valid :
    mulPoly ep_Q2_024_coefficient_21_1280
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1281 : Poly :=
[
  term ((75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 3), (15, 1)]
]

/-- Partial product 1281 for generator 21. -/
def ep_Q2_024_partial_21_1281 : Poly :=
[
  term ((-75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 3), (15, 1)],
  term ((150556843096374588081372453778173573184 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 21. -/
theorem ep_Q2_024_partial_21_1281_valid :
    mulPoly ep_Q2_024_coefficient_21_1281
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1282 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1282 for generator 21. -/
def ep_Q2_024_partial_21_1282 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (14, 1), (15, 2)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 21. -/
theorem ep_Q2_024_partial_21_1282_valid :
    mulPoly ep_Q2_024_coefficient_21_1282
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1283 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1283 for generator 21. -/
def ep_Q2_024_partial_21_1283 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((115944433813960 : Rat) / 1162780221153193) [(10, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 21. -/
theorem ep_Q2_024_partial_21_1283_valid :
    mulPoly ep_Q2_024_coefficient_21_1283
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1284 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (15, 2)]
]

/-- Partial product 1284 for generator 21. -/
def ep_Q2_024_partial_21_1284 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 21. -/
theorem ep_Q2_024_partial_21_1284_valid :
    mulPoly ep_Q2_024_coefficient_21_1284
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1285 : Poly :=
[
  term ((-28986108453490 : Rat) / 1162780221153193) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1285 for generator 21. -/
def ep_Q2_024_partial_21_1285 : Poly :=
[
  term ((28986108453490 : Rat) / 1162780221153193) [(10, 1), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 21. -/
theorem ep_Q2_024_partial_21_1285_valid :
    mulPoly ep_Q2_024_coefficient_21_1285
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1286 : Poly :=
[
  term ((110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1286 for generator 21. -/
def ep_Q2_024_partial_21_1286 : Poly :=
[
  term ((221106349654177259571146831731159999316 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 21. -/
theorem ep_Q2_024_partial_21_1286_valid :
    mulPoly ep_Q2_024_coefficient_21_1286
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1287 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1287 for generator 21. -/
def ep_Q2_024_partial_21_1287 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 21. -/
theorem ep_Q2_024_partial_21_1287_valid :
    mulPoly ep_Q2_024_coefficient_21_1287
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1288 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 1288 for generator 21. -/
def ep_Q2_024_partial_21_1288 : Poly :=
[
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 21. -/
theorem ep_Q2_024_partial_21_1288_valid :
    mulPoly ep_Q2_024_coefficient_21_1288
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1289 : Poly :=
[
  term ((-2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1289 for generator 21. -/
def ep_Q2_024_partial_21_1289 : Poly :=
[
  term ((-4796472436781460131864501042878907222839008479598572784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 21. -/
theorem ep_Q2_024_partial_21_1289_valid :
    mulPoly ep_Q2_024_coefficient_21_1289
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1290 : Poly :=
[
  term ((1698235349016064 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1290 for generator 21. -/
def ep_Q2_024_partial_21_1290 : Poly :=
[
  term ((3396470698032128 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1698235349016064 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 21. -/
theorem ep_Q2_024_partial_21_1290_valid :
    mulPoly ep_Q2_024_coefficient_21_1290
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1291 : Poly :=
[
  term ((-75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1291 for generator 21. -/
def ep_Q2_024_partial_21_1291 : Poly :=
[
  term ((-150556843096374588081372453778173573184 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 21. -/
theorem ep_Q2_024_partial_21_1291_valid :
    mulPoly ep_Q2_024_coefficient_21_1291
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1292 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1292 for generator 21. -/
def ep_Q2_024_partial_21_1292 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 21. -/
theorem ep_Q2_024_partial_21_1292_valid :
    mulPoly ep_Q2_024_coefficient_21_1292
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1293 : Poly :=
[
  term ((-1250951611561428 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1293 for generator 21. -/
def ep_Q2_024_partial_21_1293 : Poly :=
[
  term ((-2501903223122856 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1250951611561428 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 21. -/
theorem ep_Q2_024_partial_21_1293_valid :
    mulPoly ep_Q2_024_coefficient_21_1293
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1294 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1294 for generator 21. -/
def ep_Q2_024_partial_21_1294 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 21. -/
theorem ep_Q2_024_partial_21_1294_valid :
    mulPoly ep_Q2_024_coefficient_21_1294
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1295 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1295 for generator 21. -/
def ep_Q2_024_partial_21_1295 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 21. -/
theorem ep_Q2_024_partial_21_1295_valid :
    mulPoly ep_Q2_024_coefficient_21_1295
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1296 : Poly :=
[
  term ((-473019787198636982643394976670540627451621526123728739 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1296 for generator 21. -/
def ep_Q2_024_partial_21_1296 : Poly :=
[
  term ((-473019787198636982643394976670540627451621526123728739 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((473019787198636982643394976670540627451621526123728739 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 21. -/
theorem ep_Q2_024_partial_21_1296_valid :
    mulPoly ep_Q2_024_coefficient_21_1296
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1297 : Poly :=
[
  term ((-1436814438016135 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1297 for generator 21. -/
def ep_Q2_024_partial_21_1297 : Poly :=
[
  term ((-2873628876032270 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1436814438016135 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 21. -/
theorem ep_Q2_024_partial_21_1297_valid :
    mulPoly ep_Q2_024_coefficient_21_1297
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1298 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 1298 for generator 21. -/
def ep_Q2_024_partial_21_1298 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 21. -/
theorem ep_Q2_024_partial_21_1298_valid :
    mulPoly ep_Q2_024_coefficient_21_1298
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1299 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1299 for generator 21. -/
def ep_Q2_024_partial_21_1299 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 21. -/
theorem ep_Q2_024_partial_21_1299_valid :
    mulPoly ep_Q2_024_coefficient_21_1299
        ep_Q2_024_generator_21_1200_1299 =
      ep_Q2_024_partial_21_1299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_1200_1299 : List Poly :=
[
  ep_Q2_024_partial_21_1200,
  ep_Q2_024_partial_21_1201,
  ep_Q2_024_partial_21_1202,
  ep_Q2_024_partial_21_1203,
  ep_Q2_024_partial_21_1204,
  ep_Q2_024_partial_21_1205,
  ep_Q2_024_partial_21_1206,
  ep_Q2_024_partial_21_1207,
  ep_Q2_024_partial_21_1208,
  ep_Q2_024_partial_21_1209,
  ep_Q2_024_partial_21_1210,
  ep_Q2_024_partial_21_1211,
  ep_Q2_024_partial_21_1212,
  ep_Q2_024_partial_21_1213,
  ep_Q2_024_partial_21_1214,
  ep_Q2_024_partial_21_1215,
  ep_Q2_024_partial_21_1216,
  ep_Q2_024_partial_21_1217,
  ep_Q2_024_partial_21_1218,
  ep_Q2_024_partial_21_1219,
  ep_Q2_024_partial_21_1220,
  ep_Q2_024_partial_21_1221,
  ep_Q2_024_partial_21_1222,
  ep_Q2_024_partial_21_1223,
  ep_Q2_024_partial_21_1224,
  ep_Q2_024_partial_21_1225,
  ep_Q2_024_partial_21_1226,
  ep_Q2_024_partial_21_1227,
  ep_Q2_024_partial_21_1228,
  ep_Q2_024_partial_21_1229,
  ep_Q2_024_partial_21_1230,
  ep_Q2_024_partial_21_1231,
  ep_Q2_024_partial_21_1232,
  ep_Q2_024_partial_21_1233,
  ep_Q2_024_partial_21_1234,
  ep_Q2_024_partial_21_1235,
  ep_Q2_024_partial_21_1236,
  ep_Q2_024_partial_21_1237,
  ep_Q2_024_partial_21_1238,
  ep_Q2_024_partial_21_1239,
  ep_Q2_024_partial_21_1240,
  ep_Q2_024_partial_21_1241,
  ep_Q2_024_partial_21_1242,
  ep_Q2_024_partial_21_1243,
  ep_Q2_024_partial_21_1244,
  ep_Q2_024_partial_21_1245,
  ep_Q2_024_partial_21_1246,
  ep_Q2_024_partial_21_1247,
  ep_Q2_024_partial_21_1248,
  ep_Q2_024_partial_21_1249,
  ep_Q2_024_partial_21_1250,
  ep_Q2_024_partial_21_1251,
  ep_Q2_024_partial_21_1252,
  ep_Q2_024_partial_21_1253,
  ep_Q2_024_partial_21_1254,
  ep_Q2_024_partial_21_1255,
  ep_Q2_024_partial_21_1256,
  ep_Q2_024_partial_21_1257,
  ep_Q2_024_partial_21_1258,
  ep_Q2_024_partial_21_1259,
  ep_Q2_024_partial_21_1260,
  ep_Q2_024_partial_21_1261,
  ep_Q2_024_partial_21_1262,
  ep_Q2_024_partial_21_1263,
  ep_Q2_024_partial_21_1264,
  ep_Q2_024_partial_21_1265,
  ep_Q2_024_partial_21_1266,
  ep_Q2_024_partial_21_1267,
  ep_Q2_024_partial_21_1268,
  ep_Q2_024_partial_21_1269,
  ep_Q2_024_partial_21_1270,
  ep_Q2_024_partial_21_1271,
  ep_Q2_024_partial_21_1272,
  ep_Q2_024_partial_21_1273,
  ep_Q2_024_partial_21_1274,
  ep_Q2_024_partial_21_1275,
  ep_Q2_024_partial_21_1276,
  ep_Q2_024_partial_21_1277,
  ep_Q2_024_partial_21_1278,
  ep_Q2_024_partial_21_1279,
  ep_Q2_024_partial_21_1280,
  ep_Q2_024_partial_21_1281,
  ep_Q2_024_partial_21_1282,
  ep_Q2_024_partial_21_1283,
  ep_Q2_024_partial_21_1284,
  ep_Q2_024_partial_21_1285,
  ep_Q2_024_partial_21_1286,
  ep_Q2_024_partial_21_1287,
  ep_Q2_024_partial_21_1288,
  ep_Q2_024_partial_21_1289,
  ep_Q2_024_partial_21_1290,
  ep_Q2_024_partial_21_1291,
  ep_Q2_024_partial_21_1292,
  ep_Q2_024_partial_21_1293,
  ep_Q2_024_partial_21_1294,
  ep_Q2_024_partial_21_1295,
  ep_Q2_024_partial_21_1296,
  ep_Q2_024_partial_21_1297,
  ep_Q2_024_partial_21_1298,
  ep_Q2_024_partial_21_1299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_1200_1299 : Poly :=
[
  term ((-43944030495136207 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1573963360854193578259495033627362496004 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((1859489400717863008451309270511497282108 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((7650512415470575 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((809512716975816613600951705646573997504922741451614847107 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((22045241317422277 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 3), (13, 1)],
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (10, 1), (12, 3), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-129943648889074072142136367760371661717 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1)],
  term ((2714028765275053728630721752454205575148 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-997749444314866462215673905698593625231477803169669488 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-51975418274089175683915374061976030368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-8134085161510453086479282563191431595436282524794580617 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((12329776359333749 : Rat) / 2325560442306386) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((99104402996943989439342730908244621140002902954621176395 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 1), (10, 1), (15, 1)],
  term ((-4660408732381323 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 1), (15, 3)],
  term ((136850605782984 : Rat) / 1162780221153193) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((43944030495136207 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (15, 3)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((786981680427096789129747516813681248002 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 2), (13, 1)],
  term ((-929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-7650512415470575 : Rat) / 2325560442306386) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-809512716975816613600951705646573997504922741451614847107 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 2), (15, 1)],
  term ((-22045241317422277 : Rat) / 13953362653838316) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 3), (13, 1)],
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 3), (15, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((129943648889074072142136367760371661717 : Rat) / 1199709457402477296566693528029539267990) [(9, 1), (13, 1)],
  term ((-1357014382637526864315360876227102787574 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 1)],
  term ((-6496927284261146960489421757747003796 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2)],
  term ((498874722157433231107836952849296812615738901584834744 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (13, 1), (15, 2)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)],
  term ((8134085161510453086479282563191431595436282524794580617 : Rat) / 743999161705615854803818744669012717973877138597969104) [(9, 1), (14, 1), (15, 1)],
  term ((-12329776359333749 : Rat) / 4651120884612772) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-622094993420320212573876102290347507504162012950395683 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (14, 2), (15, 1)],
  term ((156138474323308 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-99104402996943989439342730908244621140002902954621176395 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(9, 1), (15, 1)],
  term ((4660408732381323 : Rat) / 2325560442306386) [(9, 1), (15, 1), (16, 1)],
  term ((164811286342967808698294818897798801710593850205157267 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (15, 3)],
  term ((-68425302891492 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)],
  term ((-65855818555045804241571811182498029599 : Rat) / 199951576233746216094448921338256544665) [(9, 2)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((607204489400779876296800121154045767506615342827361630 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5582661362522591246414347476708137077162 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 1)],
  term ((617897363718370228337177347023560251816 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-3813787790979841501322937562585614036464 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 2)],
  term ((263423274220183216966287244729992118396 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2)],
  term ((-3001460298767280088579927759332921244876 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 2), (12, 1)],
  term ((-4080629397782560097398737880202638668454962123706828476 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 2), (13, 2)],
  term ((2456383248626011638866009125884654558352 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 2), (10, 2), (15, 2)],
  term ((3791843580843907 : Rat) / 1162780221153193) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((236113050396874376356810378545819923320 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (12, 1)],
  term ((-308948681859185114168588673511780125908 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (12, 1), (14, 1)],
  term ((1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2)],
  term ((1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (13, 1), (15, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (13, 2)],
  term ((-614095812156502909716502281471163639588 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (15, 2)],
  term ((-3791843580843907 : Rat) / 4651120884612772) [(9, 2), (15, 2), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 1), (11, 1), (12, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 2), (13, 1)],
  term ((-1862017972688907367940148742016867997082388675896278214 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (10, 2), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 3), (10, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (12, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (13, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 3), (15, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(9, 3), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 4)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (10, 2)],
  term ((221106349654177259571146831731159999316 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4796472436781460131864501042878907222839008479598572784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3396470698032128 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-150556843096374588081372453778173573184 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-473019787198636982643394976670540627451621526123728739 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2873628876032270 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2569183513052036 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-109208270136033462871157923159554621672407524528970593793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3654372084731843 : Rat) / 1162780221153193) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3739492545906868734478547043372595476 : Rat) / 3389009766673664679566930870139941435) [(10, 1), (12, 1), (13, 2)],
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(10, 1), (12, 2), (13, 2)],
  term ((-2630935571061860204683141042587004946833587022868345873 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1250951611561428 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-269572619290367145925693031522732522232016406550237283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(10, 1), (13, 1), (15, 1)],
  term ((-1436814438016135 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (13, 1), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(10, 1), (13, 2), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 2), (14, 2)],
  term ((-2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 1), (13, 2), (15, 2)],
  term ((1698235349016064 : Rat) / 1162780221153193) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(10, 1), (13, 3), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 1), (14, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 1), (15, 2)],
  term ((28986108453490 : Rat) / 1162780221153193) [(10, 1), (15, 2), (16, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((6225605552608120682397972370504363487258128862913769462 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5138367026104072 : Rat) / 1162780221153193) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((109208270136033462871157923159554621672407524528970593793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-7308744169463686 : Rat) / 1162780221153193) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7478985091813737468957094086745190952 : Rat) / 3389009766673664679566930870139941435) [(10, 2), (12, 1), (13, 2)],
  term ((39537786970167917942153773089227722208 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (12, 1), (13, 2), (14, 1)],
  term ((-7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 2), (12, 2), (13, 1), (15, 1)],
  term ((3517107295139328 : Rat) / 1162780221153193) [(10, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(10, 2), (12, 2), (13, 2)],
  term ((5261871142123720409366282085174009893667174045736691746 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((269572619290367145925693031522732522232016406550237283 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 2), (13, 1), (15, 1)],
  term ((2873628876032270 : Rat) / 1162780221153193) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (13, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-221106349654177259571146831731159999316 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (13, 2), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (13, 2), (14, 2)],
  term ((4796472436781460131864501042878907222839008479598572784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 2), (13, 2), (15, 2)],
  term ((-3396470698032128 : Rat) / 1162780221153193) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((150556843096374588081372453778173573184 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (13, 3), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (14, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(10, 2), (15, 2), (16, 1)],
  term ((-110553174827088629785573415865579999658 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((2398236218390730065932250521439453611419504239799286392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1698235349016064 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((75278421548187294040686226889086786592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1250951611561428 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((473019787198636982643394976670540627451621526123728739 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(11, 1), (12, 1), (15, 1)],
  term ((1436814438016135 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (15, 3)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 1200 through 1299. -/
theorem ep_Q2_024_block_21_1200_1299_valid :
    checkProductSumEq ep_Q2_024_partials_21_1200_1299
      ep_Q2_024_block_21_1200_1299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
