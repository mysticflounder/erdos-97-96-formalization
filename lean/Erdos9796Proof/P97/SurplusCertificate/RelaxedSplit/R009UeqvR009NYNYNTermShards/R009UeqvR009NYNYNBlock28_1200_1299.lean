/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1200-1299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1200 : Poly :=
[
  term ((4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1200 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1200 : Poly :=
[
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((9325932268072708854458716040813738515395836204022169600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1200
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1201 : Poly :=
[
  term ((-1165741533509088606807339505101717314424479525502771200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 1201 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1201 : Poly :=
[
  term ((1165741533509088606807339505101717314424479525502771200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1201
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1202 : Poly :=
[
  term ((-2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1202 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1202 : Poly :=
[
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1202
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1203 : Poly :=
[
  term ((-1065886251342536739661880934403710834298832484450816000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (10, 1)]
]

/-- Partial product 1203 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1203 : Poly :=
[
  term ((1065886251342536739661880934403710834298832484450816000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (10, 1)],
  term ((-2131772502685073479323761868807421668597664968901632000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1203
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1204 : Poly :=
[
  term ((-338851041231323676916723471027631221821258692991382835200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1)]
]

/-- Partial product 1204 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1204 : Poly :=
[
  term ((338851041231323676916723471027631221821258692991382835200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1)],
  term ((-677702082462647353833446942055262443642517385982765670400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1204
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1205 : Poly :=
[
  term ((-195758266651082108892513137960379466300265751493443584000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1205 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1205 : Poly :=
[
  term ((195758266651082108892513137960379466300265751493443584000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1)],
  term ((-391516533302164217785026275920758932600531502986887168000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1205
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1206 : Poly :=
[
  term ((44502933993792598947936359188036529688955295342051328000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (10, 1), (12, 2)]
]

/-- Partial product 1206 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1206 : Poly :=
[
  term ((-44502933993792598947936359188036529688955295342051328000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (10, 1), (12, 2)],
  term ((89005867987585197895872718376073059377910590684102656000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1206
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1207 : Poly :=
[
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 1)]
]

/-- Partial product 1207 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1207 : Poly :=
[
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1207
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1208 : Poly :=
[
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 3)]
]

/-- Partial product 1208 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1208 : Poly :=
[
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 3)],
  term ((-868872128907968576194619627244813105388047518713905152000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1208
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1209 : Poly :=
[
  term ((-2359328447878846068910779486097651360092702444691814400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (14, 1)]
]

/-- Partial product 1209 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1209 : Poly :=
[
  term ((2359328447878846068910779486097651360092702444691814400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (14, 1)],
  term ((-4718656895757692137821558972195302720185404889383628800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1209
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1210 : Poly :=
[
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1210 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1210 : Poly :=
[
  term ((-2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1210
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1211 : Poly :=
[
  term ((3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1211 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1211 : Poly :=
[
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1211
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1212 : Poly :=
[
  term ((-2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 1212 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1212 : Poly :=
[
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1212
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1213 : Poly :=
[
  term ((-4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1213 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1213 : Poly :=
[
  term ((4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-8583906230364014062456707540329524018698451274013081600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1213
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1214 : Poly :=
[
  term ((8460100757732492353259450459750943583621517506604750694400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1)]
]

/-- Partial product 1214 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1214 : Poly :=
[
  term ((-8460100757732492353259450459750943583621517506604750694400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1)],
  term ((16920201515464984706518900919501887167243035013209501388800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1214
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1215 : Poly :=
[
  term ((-10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1215 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1215 : Poly :=
[
  term ((-21561755347201795088849994705388272164806835695287091200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1215
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1216 : Poly :=
[
  term ((3793319204980381916036049894275658814427061224435507763200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (14, 1)]
]

/-- Partial product 1216 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1216 : Poly :=
[
  term ((-3793319204980381916036049894275658814427061224435507763200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((7586638409960763832072099788551317628854122448871015526400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1216
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1217 : Poly :=
[
  term ((-1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 1217 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1217 : Poly :=
[
  term ((-3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1217
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1218 : Poly :=
[
  term ((-4935476826358386384842161755408285961369910400097040588800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (12, 2)]
]

/-- Partial product 1218 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1218 : Poly :=
[
  term ((4935476826358386384842161755408285961369910400097040588800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (12, 2)],
  term ((-9870953652716772769684323510816571922739820800194081177600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1218
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1219 : Poly :=
[
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 2), (14, 1)]
]

/-- Partial product 1219 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1219 : Poly :=
[
  term ((2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 2), (14, 1)],
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1219
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1220 : Poly :=
[
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 3)]
]

/-- Partial product 1220 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1220 : Poly :=
[
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 3)],
  term ((11551667310583032515927016764277664408408974002272169984000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1220
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1221 : Poly :=
[
  term ((17478322415106023262507979411850167294095426440547225600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1221 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1221 : Poly :=
[
  term ((-17478322415106023262507979411850167294095426440547225600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((34956644830212046525015958823700334588190852881094451200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1221
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1222 : Poly :=
[
  term ((8739161207553011631253989705925083647047713220273612800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 1222 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1222 : Poly :=
[
  term ((17478322415106023262507979411850167294095426440547225600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8739161207553011631253989705925083647047713220273612800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1222
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1223 : Poly :=
[
  term ((-119311461013968869559618765654766558905604681173097779200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 1223 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1223 : Poly :=
[
  term ((119311461013968869559618765654766558905604681173097779200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (14, 1)],
  term ((-238622922027937739119237531309533117811209362346195558400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1223
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1224 : Poly :=
[
  term ((-1226126397858994195270667409513911446965596775561041787027808335813133125505163 : Rat) / 2560470585202358470222034126504751518891640359243960498917734197952201216000) [(3, 1), (7, 1)]
]

/-- Partial product 1224 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1224 : Poly :=
[
  term ((1226126397858994195270667409513911446965596775561041787027808335813133125505163 : Rat) / 2560470585202358470222034126504751518891640359243960498917734197952201216000) [(3, 1), (7, 1)],
  term ((-1226126397858994195270667409513911446965596775561041787027808335813133125505163 : Rat) / 1280235292601179235111017063252375759445820179621980249458867098976100608000) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1224
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1225 : Poly :=
[
  term ((-3149149553489948 : Rat) / 449528123497443) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 1225 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1225 : Poly :=
[
  term ((3149149553489948 : Rat) / 449528123497443) [(3, 1), (7, 1), (8, 1)],
  term ((-6298299106979896 : Rat) / 449528123497443) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1225
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1226 : Poly :=
[
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 1226 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1226 : Poly :=
[
  term ((50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1)],
  term ((-100772785711678336 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1226
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1227 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 1227 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1227 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1227
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1228 : Poly :=
[
  term ((50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 2)]
]

/-- Partial product 1228 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1228 : Poly :=
[
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 2)],
  term ((100772785711678336 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1228
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1229 : Poly :=
[
  term ((1228688864199850721273780665124088527318572412452475728315408038033157529473163 : Rat) / 3840705877803537705333051189757127278337460538865940748376601296928301824000) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 1229 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1229 : Poly :=
[
  term ((-1228688864199850721273780665124088527318572412452475728315408038033157529473163 : Rat) / 3840705877803537705333051189757127278337460538865940748376601296928301824000) [(3, 1), (7, 1), (14, 1)],
  term ((1228688864199850721273780665124088527318572412452475728315408038033157529473163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(3, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1229
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1230 : Poly :=
[
  term ((463412421976306611511 : Rat) / 64098215129500397370) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1230 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1230 : Poly :=
[
  term ((-463412421976306611511 : Rat) / 64098215129500397370) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1230
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1231 : Poly :=
[
  term ((-463412421976306611511 : Rat) / 42732143419666931580) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 1231 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1231 : Poly :=
[
  term ((-463412421976306611511 : Rat) / 21366071709833465790) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((463412421976306611511 : Rat) / 42732143419666931580) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1231
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1232 : Poly :=
[
  term ((31544428263238735964740344579467960356590523751156034480746317891770299380774783 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 1232 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1232 : Poly :=
[
  term ((-31544428263238735964740344579467960356590523751156034480746317891770299380774783 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(3, 1), (8, 1), (9, 1)],
  term ((31544428263238735964740344579467960356590523751156034480746317891770299380774783 : Rat) / 328793843680065865923451022444944856932837485939334552607158326679689924336000) [(3, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1232
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1233 : Poly :=
[
  term ((1426693417885731035264472391514652665982413 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 1233 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1233 : Poly :=
[
  term ((-1426693417885731035264472391514652665982413 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (8, 1), (9, 1), (10, 1)],
  term ((1426693417885731035264472391514652665982413 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1233
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1234 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 1234 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1234 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1234
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1235 : Poly :=
[
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1235 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1235 : Poly :=
[
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1235
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1236 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1236 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1236 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1236
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1237 : Poly :=
[
  term ((-176733422091409371708 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1237 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1237 : Poly :=
[
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1237
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1238 : Poly :=
[
  term ((-2427257404745233260168 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1238 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1238 : Poly :=
[
  term ((-4854514809490466520336 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2427257404745233260168 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1238
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1239 : Poly :=
[
  term ((-269353485786549218742219655551404880122268316358384632780733418973622992984791593 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 1239 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1239 : Poly :=
[
  term ((269353485786549218742219655551404880122268316358384632780733418973622992984791593 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((-269353485786549218742219655551404880122268316358384632780733418973622992984791593 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1239
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1240 : Poly :=
[
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1240 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1240 : Poly :=
[
  term ((176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1240
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1241 : Poly :=
[
  term ((600026359323760732128 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1241 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1241 : Poly :=
[
  term ((-600026359323760732128 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1241
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1242 : Poly :=
[
  term ((-7738828054221771441736 : Rat) / 180389165002186130208015) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1242 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1242 : Poly :=
[
  term ((-15477656108443542883472 : Rat) / 180389165002186130208015) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((7738828054221771441736 : Rat) / 180389165002186130208015) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1242
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1243 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 2)]
]

/-- Partial product 1243 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1243 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 2)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1243
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1244 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 1244 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1244 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1244
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1245 : Poly :=
[
  term ((192415952305356414758940892598427596605884208295393341899102678124224445429283993 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 1245 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1245 : Poly :=
[
  term ((-192415952305356414758940892598427596605884208295393341899102678124224445429283993 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (8, 1), (9, 1), (14, 1)],
  term ((192415952305356414758940892598427596605884208295393341899102678124224445429283993 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1245
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1246 : Poly :=
[
  term ((409071106131859854243101 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1246 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1246 : Poly :=
[
  term ((-409071106131859854243101 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((818142212263719708486202 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1246
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1247 : Poly :=
[
  term ((-86914646705914938493223 : Rat) / 24051888666958150694402) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1247 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1247 : Poly :=
[
  term ((-86914646705914938493223 : Rat) / 12025944333479075347201) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((86914646705914938493223 : Rat) / 24051888666958150694402) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1247
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1248 : Poly :=
[
  term ((-30984721386856189529977230896404364613135946720841413195482238772 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 1248 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1248 : Poly :=
[
  term ((30984721386856189529977230896404364613135946720841413195482238772 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (10, 1), (11, 1)],
  term ((-61969442773712379059954461792808729226271893441682826390964477544 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1248
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1249 : Poly :=
[
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1249 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1249 : Poly :=
[
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1249
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1250 : Poly :=
[
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1250 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1250 : Poly :=
[
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1250
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1251 : Poly :=
[
  term ((6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1251 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1251 : Poly :=
[
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1251
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1252 : Poly :=
[
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1252 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1252 : Poly :=
[
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1252
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1253 : Poly :=
[
  term ((1834614938618477793248 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1253 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1253 : Poly :=
[
  term ((3669229877236955586496 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1834614938618477793248 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1253_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1253
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1254 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1254 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1254 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1254_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1254
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1255 : Poly :=
[
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1255 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1255 : Poly :=
[
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1255_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1255
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1256 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1256 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1256 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1256_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1256
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1257 : Poly :=
[
  term ((1040806163970936 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1257 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1257 : Poly :=
[
  term ((2081612327941872 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1257_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1257
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1258 : Poly :=
[
  term ((-394038860753454819874969526848915153572083 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 1258 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1258 : Poly :=
[
  term ((394038860753454819874969526848915153572083 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-394038860753454819874969526848915153572083 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1258_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1258
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1259 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1259 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1259 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1259_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1259
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1260 : Poly :=
[
  term ((-2368828224337722640324 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1260 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1260 : Poly :=
[
  term ((2368828224337722640324 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1260_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1260
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1261 : Poly :=
[
  term ((-32533494683984410979704 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1261 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1261 : Poly :=
[
  term ((-65066989367968821959408 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((32533494683984410979704 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1261_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1261
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1262 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1262 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1262 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1262_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1262
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1263 : Poly :=
[
  term ((-520403081985468 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1263 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1263 : Poly :=
[
  term ((520403081985468 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1263_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1263
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1264 : Poly :=
[
  term ((-370453003636932348110790705367265595921271081121725185056202084131 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 1264 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1264 : Poly :=
[
  term ((-370453003636932348110790705367265595921271081121725185056202084131 : Rat) / 4798743665759789441695183709227627395897562734399724475206521462) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((370453003636932348110790705367265595921271081121725185056202084131 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1264_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1264
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1265 : Poly :=
[
  term ((5232682275838776 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1265 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1265 : Poly :=
[
  term ((10465364551677552 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5232682275838776 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1265_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1265
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1266 : Poly :=
[
  term ((718396603408299011920230581506755599855625462526361994267269053023483557314839653 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 1266 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1266 : Poly :=
[
  term ((-718396603408299011920230581506755599855625462526361994267269053023483557314839653 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (8, 1), (11, 1)],
  term ((718396603408299011920230581506755599855625462526361994267269053023483557314839653 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1266_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1266
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1267 : Poly :=
[
  term ((-757086947444533776355060823475937051900351411988606398788109806493547359634113193 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 1267 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1267 : Poly :=
[
  term ((757086947444533776355060823475937051900351411988606398788109806493547359634113193 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((-757086947444533776355060823475937051900351411988606398788109806493547359634113193 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1267_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1267
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1268 : Poly :=
[
  term ((-5268070330158275330585001821240906458653468426210860475590599888 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1268 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1268 : Poly :=
[
  term ((5268070330158275330585001821240906458653468426210860475590599888 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10536140660316550661170003642481812917306936852421720951181199776 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1268_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1268
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1269 : Poly :=
[
  term ((-453523108108829767808 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1269 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1269 : Poly :=
[
  term ((453523108108829767808 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1269_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1269
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1270 : Poly :=
[
  term ((-941374372266499254056 : Rat) / 76449970031803772565) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1270 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1270 : Poly :=
[
  term ((-1882748744532998508112 : Rat) / 76449970031803772565) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((941374372266499254056 : Rat) / 76449970031803772565) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1270_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1270
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1271 : Poly :=
[
  term ((10536140660316550661170003642481812917306936852421720951181199776 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 2)]
]

/-- Partial product 1271 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1271 : Poly :=
[
  term ((-10536140660316550661170003642481812917306936852421720951181199776 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 2)],
  term ((21072281320633101322340007284963625834613873704843441902362399552 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1271_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1271
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1272 : Poly :=
[
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1272 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1272 : Poly :=
[
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1272_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1272
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1273 : Poly :=
[
  term ((94852548573315604064387671297266033276551243810423997664380424255998703259096399 : Rat) / 281823294582913599362958019238524163085289273662286759377564280011162792288000) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1273 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1273 : Poly :=
[
  term ((-94852548573315604064387671297266033276551243810423997664380424255998703259096399 : Rat) / 281823294582913599362958019238524163085289273662286759377564280011162792288000) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((94852548573315604064387671297266033276551243810423997664380424255998703259096399 : Rat) / 140911647291456799681479009619262081542644636831143379688782140005581396144000) [(3, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1273_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1273
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1274 : Poly :=
[
  term ((5753305989686297112426176 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1274 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1274 : Poly :=
[
  term ((-5753305989686297112426176 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((11506611979372594224852352 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1274_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1274
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1275 : Poly :=
[
  term ((28111876716384455010742634 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1275 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1275 : Poly :=
[
  term ((56223753432768910021485268 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28111876716384455010742634 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1275_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1275
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1276 : Poly :=
[
  term ((239919399771318478933268418470509459754193924932651224484423962262771362066182457 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1276 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1276 : Poly :=
[
  term ((-239919399771318478933268418470509459754193924932651224484423962262771362066182457 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((239919399771318478933268418470509459754193924932651224484423962262771362066182457 : Rat) / 123297691380024699721294133416854321349814057227250457227684372504883721626000) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1276_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1276
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1277 : Poly :=
[
  term ((14303258951245005080802194151938440166425281618850814295281067938 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1277 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1277 : Poly :=
[
  term ((-14303258951245005080802194151938440166425281618850814295281067938 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((28606517902490010161604388303876880332850563237701628590562135876 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1277_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1277
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1278 : Poly :=
[
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1278 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1278 : Poly :=
[
  term ((-8042391521042253719584 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1278_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1278
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1279 : Poly :=
[
  term ((19850304915601139472429392 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1279 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1279 : Poly :=
[
  term ((39700609831202278944858784 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19850304915601139472429392 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1279_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1279
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1280 : Poly :=
[
  term ((51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1280 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1280 : Poly :=
[
  term ((-51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((103660443689146089854918022381471780647586661280656 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1280_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1280
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1281 : Poly :=
[
  term ((-285891633730278756292407074163931128214853326041737110286074547238125347035919 : Rat) / 80408866899827759840716588948117196713961612266897774288672687250961984000) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1281 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1281 : Poly :=
[
  term ((-285891633730278756292407074163931128214853326041737110286074547238125347035919 : Rat) / 40204433449913879920358294474058598356980806133448887144336343625480992000) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((285891633730278756292407074163931128214853326041737110286074547238125347035919 : Rat) / 80408866899827759840716588948117196713961612266897774288672687250961984000) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1281_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1281
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1282 : Poly :=
[
  term ((-2221095093239436649534 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1282 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1282 : Poly :=
[
  term ((-4442190186478873299068 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2221095093239436649534 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1282_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1282
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1283 : Poly :=
[
  term ((-28606517902490010161604388303876880332850563237701628590562135876 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 2), (13, 1)]
]

/-- Partial product 1283 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1283 : Poly :=
[
  term ((28606517902490010161604388303876880332850563237701628590562135876 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 2), (13, 1)],
  term ((-57213035804980020323208776607753760665701126475403257181124271752 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1283_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1283
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1284 : Poly :=
[
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1284 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1284 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1284_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1284
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1285 : Poly :=
[
  term ((-103660443689146089854918022381471780647586661280656 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1285 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1285 : Poly :=
[
  term ((-207320887378292179709836044762943561295173322561312 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((103660443689146089854918022381471780647586661280656 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1285_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1285
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1286 : Poly :=
[
  term ((-10039833385216323338371124875977153769535717722734887670316683426654032796385658879623 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 1286 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1286 : Poly :=
[
  term ((10039833385216323338371124875977153769535717722734887670316683426654032796385658879623 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(3, 1), (8, 1), (13, 1)],
  term ((-10039833385216323338371124875977153769535717722734887670316683426654032796385658879623 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1286_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1286
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1287 : Poly :=
[
  term ((-569307479584050922084300857995394565816002970527296612029268543064000970876361 : Rat) / 1409116472914567996814790096192620815426446368311433796887821400055813961440) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1287 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1287 : Poly :=
[
  term ((569307479584050922084300857995394565816002970527296612029268543064000970876361 : Rat) / 1409116472914567996814790096192620815426446368311433796887821400055813961440) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-569307479584050922084300857995394565816002970527296612029268543064000970876361 : Rat) / 704558236457283998407395048096310407713223184155716898443910700027906980720) [(3, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1287_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1287
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1288 : Poly :=
[
  term ((-2650578604669472045223335 : Rat) / 252544831003060582291221) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1288 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1288 : Poly :=
[
  term ((2650578604669472045223335 : Rat) / 252544831003060582291221) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5301157209338944090446670 : Rat) / 252544831003060582291221) [(3, 1), (8, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1288_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1288
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1289 : Poly :=
[
  term ((-384518802269387895581187503 : Rat) / 7576344930091817468736630) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 1289 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1289 : Poly :=
[
  term ((-384518802269387895581187503 : Rat) / 3788172465045908734368315) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((384518802269387895581187503 : Rat) / 7576344930091817468736630) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1289_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1289
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1290 : Poly :=
[
  term ((58779623162093584795611327669688111623732824887688110507677575087852285517978941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1290 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1290 : Poly :=
[
  term ((-58779623162093584795611327669688111623732824887688110507677575087852285517978941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((58779623162093584795611327669688111623732824887688110507677575087852285517978941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(3, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1290_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1290
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1291 : Poly :=
[
  term ((1168158023840683072046 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1291 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1291 : Poly :=
[
  term ((-1168158023840683072046 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2336316047681366144092 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1291_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1291
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1292 : Poly :=
[
  term ((11570656074374208922536427278789600740165162106870897002371679468048684079252019 : Rat) / 6529199992266014099066187022587116373173682916072099272240222204778113100800) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 1292 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1292 : Poly :=
[
  term ((11570656074374208922536427278789600740165162106870897002371679468048684079252019 : Rat) / 3264599996133007049533093511293558186586841458036049636120111102389056550400) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-11570656074374208922536427278789600740165162106870897002371679468048684079252019 : Rat) / 6529199992266014099066187022587116373173682916072099272240222204778113100800) [(3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1292_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1292
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1293 : Poly :=
[
  term ((5541505294535038567 : Rat) / 154453530432531078) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1293 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1293 : Poly :=
[
  term ((5541505294535038567 : Rat) / 77226765216265539) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5541505294535038567 : Rat) / 154453530432531078) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1293_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1293
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1294 : Poly :=
[
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (13, 1)]
]

/-- Partial product 1294 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1294 : Poly :=
[
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (13, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1294_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1294
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1295 : Poly :=
[
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (13, 1), (16, 1)]
]

/-- Partial product 1295 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1295 : Poly :=
[
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1295_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1295
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1296 : Poly :=
[
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 2), (15, 1)]
]

/-- Partial product 1296 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1296 : Poly :=
[
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1296_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1296
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1297 : Poly :=
[
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 1297 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1297 : Poly :=
[
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1297_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1297
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1298 : Poly :=
[
  term ((-557204738809564374023922488226862859485004198495314419148600787055338829401651209 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (9, 1)]
]

/-- Partial product 1298 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1298 : Poly :=
[
  term ((557204738809564374023922488226862859485004198495314419148600787055338829401651209 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (9, 1)],
  term ((-557204738809564374023922488226862859485004198495314419148600787055338829401651209 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1298_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1298
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1299 : Poly :=
[
  term ((-10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 1299 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1299 : Poly :=
[
  term ((10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1)],
  term ((-10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1299_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1299
        rs_R009_ueqv_R009NYNYN_generator_28_1200_1299 =
      rs_R009_ueqv_R009NYNYN_partial_28_1299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1200_1299 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1200,
  rs_R009_ueqv_R009NYNYN_partial_28_1201,
  rs_R009_ueqv_R009NYNYN_partial_28_1202,
  rs_R009_ueqv_R009NYNYN_partial_28_1203,
  rs_R009_ueqv_R009NYNYN_partial_28_1204,
  rs_R009_ueqv_R009NYNYN_partial_28_1205,
  rs_R009_ueqv_R009NYNYN_partial_28_1206,
  rs_R009_ueqv_R009NYNYN_partial_28_1207,
  rs_R009_ueqv_R009NYNYN_partial_28_1208,
  rs_R009_ueqv_R009NYNYN_partial_28_1209,
  rs_R009_ueqv_R009NYNYN_partial_28_1210,
  rs_R009_ueqv_R009NYNYN_partial_28_1211,
  rs_R009_ueqv_R009NYNYN_partial_28_1212,
  rs_R009_ueqv_R009NYNYN_partial_28_1213,
  rs_R009_ueqv_R009NYNYN_partial_28_1214,
  rs_R009_ueqv_R009NYNYN_partial_28_1215,
  rs_R009_ueqv_R009NYNYN_partial_28_1216,
  rs_R009_ueqv_R009NYNYN_partial_28_1217,
  rs_R009_ueqv_R009NYNYN_partial_28_1218,
  rs_R009_ueqv_R009NYNYN_partial_28_1219,
  rs_R009_ueqv_R009NYNYN_partial_28_1220,
  rs_R009_ueqv_R009NYNYN_partial_28_1221,
  rs_R009_ueqv_R009NYNYN_partial_28_1222,
  rs_R009_ueqv_R009NYNYN_partial_28_1223,
  rs_R009_ueqv_R009NYNYN_partial_28_1224,
  rs_R009_ueqv_R009NYNYN_partial_28_1225,
  rs_R009_ueqv_R009NYNYN_partial_28_1226,
  rs_R009_ueqv_R009NYNYN_partial_28_1227,
  rs_R009_ueqv_R009NYNYN_partial_28_1228,
  rs_R009_ueqv_R009NYNYN_partial_28_1229,
  rs_R009_ueqv_R009NYNYN_partial_28_1230,
  rs_R009_ueqv_R009NYNYN_partial_28_1231,
  rs_R009_ueqv_R009NYNYN_partial_28_1232,
  rs_R009_ueqv_R009NYNYN_partial_28_1233,
  rs_R009_ueqv_R009NYNYN_partial_28_1234,
  rs_R009_ueqv_R009NYNYN_partial_28_1235,
  rs_R009_ueqv_R009NYNYN_partial_28_1236,
  rs_R009_ueqv_R009NYNYN_partial_28_1237,
  rs_R009_ueqv_R009NYNYN_partial_28_1238,
  rs_R009_ueqv_R009NYNYN_partial_28_1239,
  rs_R009_ueqv_R009NYNYN_partial_28_1240,
  rs_R009_ueqv_R009NYNYN_partial_28_1241,
  rs_R009_ueqv_R009NYNYN_partial_28_1242,
  rs_R009_ueqv_R009NYNYN_partial_28_1243,
  rs_R009_ueqv_R009NYNYN_partial_28_1244,
  rs_R009_ueqv_R009NYNYN_partial_28_1245,
  rs_R009_ueqv_R009NYNYN_partial_28_1246,
  rs_R009_ueqv_R009NYNYN_partial_28_1247,
  rs_R009_ueqv_R009NYNYN_partial_28_1248,
  rs_R009_ueqv_R009NYNYN_partial_28_1249,
  rs_R009_ueqv_R009NYNYN_partial_28_1250,
  rs_R009_ueqv_R009NYNYN_partial_28_1251,
  rs_R009_ueqv_R009NYNYN_partial_28_1252,
  rs_R009_ueqv_R009NYNYN_partial_28_1253,
  rs_R009_ueqv_R009NYNYN_partial_28_1254,
  rs_R009_ueqv_R009NYNYN_partial_28_1255,
  rs_R009_ueqv_R009NYNYN_partial_28_1256,
  rs_R009_ueqv_R009NYNYN_partial_28_1257,
  rs_R009_ueqv_R009NYNYN_partial_28_1258,
  rs_R009_ueqv_R009NYNYN_partial_28_1259,
  rs_R009_ueqv_R009NYNYN_partial_28_1260,
  rs_R009_ueqv_R009NYNYN_partial_28_1261,
  rs_R009_ueqv_R009NYNYN_partial_28_1262,
  rs_R009_ueqv_R009NYNYN_partial_28_1263,
  rs_R009_ueqv_R009NYNYN_partial_28_1264,
  rs_R009_ueqv_R009NYNYN_partial_28_1265,
  rs_R009_ueqv_R009NYNYN_partial_28_1266,
  rs_R009_ueqv_R009NYNYN_partial_28_1267,
  rs_R009_ueqv_R009NYNYN_partial_28_1268,
  rs_R009_ueqv_R009NYNYN_partial_28_1269,
  rs_R009_ueqv_R009NYNYN_partial_28_1270,
  rs_R009_ueqv_R009NYNYN_partial_28_1271,
  rs_R009_ueqv_R009NYNYN_partial_28_1272,
  rs_R009_ueqv_R009NYNYN_partial_28_1273,
  rs_R009_ueqv_R009NYNYN_partial_28_1274,
  rs_R009_ueqv_R009NYNYN_partial_28_1275,
  rs_R009_ueqv_R009NYNYN_partial_28_1276,
  rs_R009_ueqv_R009NYNYN_partial_28_1277,
  rs_R009_ueqv_R009NYNYN_partial_28_1278,
  rs_R009_ueqv_R009NYNYN_partial_28_1279,
  rs_R009_ueqv_R009NYNYN_partial_28_1280,
  rs_R009_ueqv_R009NYNYN_partial_28_1281,
  rs_R009_ueqv_R009NYNYN_partial_28_1282,
  rs_R009_ueqv_R009NYNYN_partial_28_1283,
  rs_R009_ueqv_R009NYNYN_partial_28_1284,
  rs_R009_ueqv_R009NYNYN_partial_28_1285,
  rs_R009_ueqv_R009NYNYN_partial_28_1286,
  rs_R009_ueqv_R009NYNYN_partial_28_1287,
  rs_R009_ueqv_R009NYNYN_partial_28_1288,
  rs_R009_ueqv_R009NYNYN_partial_28_1289,
  rs_R009_ueqv_R009NYNYN_partial_28_1290,
  rs_R009_ueqv_R009NYNYN_partial_28_1291,
  rs_R009_ueqv_R009NYNYN_partial_28_1292,
  rs_R009_ueqv_R009NYNYN_partial_28_1293,
  rs_R009_ueqv_R009NYNYN_partial_28_1294,
  rs_R009_ueqv_R009NYNYN_partial_28_1295,
  rs_R009_ueqv_R009NYNYN_partial_28_1296,
  rs_R009_ueqv_R009NYNYN_partial_28_1297,
  rs_R009_ueqv_R009NYNYN_partial_28_1298,
  rs_R009_ueqv_R009NYNYN_partial_28_1299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1200_1299 : Poly :=
[
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((9325932268072708854458716040813738515395836204022169600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1165741533509088606807339505101717314424479525502771200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((1065886251342536739661880934403710834298832484450816000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (10, 1)],
  term ((338851041231323676916723471027631221821258692991382835200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1)],
  term ((-160647938603855081646977934698294325780750544829774028800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1)],
  term ((-391516533302164217785026275920758932600531502986887168000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 2)],
  term ((-44502933993792598947936359188036529688955295342051328000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (10, 1), (12, 2)],
  term ((1651905195512297011764672179086330970589110524687679488000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 2)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 3)],
  term ((-868872128907968576194619627244813105388047518713905152000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 3), (14, 1)],
  term ((-12563079070916668286355553595554300320090952337619609600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (14, 1)],
  term ((-4718656895757692137821558972195302720185404889383628800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (14, 2)],
  term ((-2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-8583906230364014062456707540329524018698451274013081600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((-8460100757732492353259450459750943583621517506604750694400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1)],
  term ((-21561755347201795088849994705388272164806835695287091200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((4375627436828200930160950341742076117605324596257997875200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((-3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((7586638409960763832072099788551317628854122448871015526400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (14, 2)],
  term ((1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((4935476826358386384842161755408285961369910400097040588800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (12, 2)],
  term ((-3817849161500651454295888048768614238016745557144885862400 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(3, 1), (5, 1), (12, 2), (14, 1)],
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 2), (14, 2)],
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 3)],
  term ((11551667310583032515927016764277664408408974002272169984000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 3), (14, 1)],
  term ((34956644830212046525015958823700334588190852881094451200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-8739161207553011631253989705925083647047713220273612800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((119311461013968869559618765654766558905604681173097779200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (14, 1)],
  term ((-238622922027937739119237531309533117811209362346195558400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (14, 2)],
  term ((1226126397858994195270667409513911446965596775561041787027808335813133125505163 : Rat) / 2560470585202358470222034126504751518891640359243960498917734197952201216000) [(3, 1), (7, 1)],
  term ((3149149553489948 : Rat) / 449528123497443) [(3, 1), (7, 1), (8, 1)],
  term ((-6298299106979896 : Rat) / 449528123497443) [(3, 1), (7, 1), (8, 1), (14, 1)],
  term ((50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1)],
  term ((-25193196427919584 : Rat) / 1048898954827367) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1), (14, 2)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 2)],
  term ((100772785711678336 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 2), (14, 1)],
  term ((-1226767014444208326771445723416455717053840684783900272349708261368139226497163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(3, 1), (7, 1), (14, 1)],
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((1228688864199850721273780665124088527318572412452475728315408038033157529473163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(3, 1), (7, 1), (14, 2)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((463412421976306611511 : Rat) / 42732143419666931580) [(3, 1), (7, 1), (16, 1)],
  term ((-31544428263238735964740344579467960356590523751156034480746317891770299380774783 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(3, 1), (8, 1), (9, 1)],
  term ((-1426693417885731035264472391514652665982413 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (8, 1), (9, 1), (10, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((5499012921055318015644787651640502386533921 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4677781387399057148628 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 2)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((2427257404745233260168 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((269353485786549218742219655551404880122268316358384632780733418973622992984791593 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((-52112267351558409313074941575786083943776199380247228255044931606221337186371157 : Rat) / 98638153104019759777035306733483457079851245781800365782147498003906977300800) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-282951263322319173233552 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 2)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((7738828054221771441736 : Rat) / 180389165002186130208015) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 2)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (8, 1), (9, 1), (12, 2), (14, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-89982363597828542014252146331995270466887593955918143274993450674361404132437 : Rat) / 56364658916582719872591603847704832617057854732457351875512856002232558457600) [(3, 1), (8, 1), (9, 1), (14, 1)],
  term ((-9535109010252928396031516 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((192415952305356414758940892598427596605884208295393341899102678124224445429283993 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (9, 1), (14, 2)],
  term ((818142212263719708486202 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((86914646705914938493223 : Rat) / 24051888666958150694402) [(3, 1), (8, 1), (9, 1), (16, 1)],
  term ((30984721386856189529977230896404364613135946720841413195482238772 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (10, 1), (11, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-74861328569603808693566407699686562295048431669513292814456045362 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((3535647927630709861808 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1834614938618477793248 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2081612327941872 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((394038860753454819874969526848915153572083 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1518773942261724252095443649165048554769311 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-62698161143631099319084 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((32533494683984410979704 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-390378890121852550122126058607597296257353921115642656797319153533 : Rat) / 6398324887679719255593578278970169861196750312532965966942028616) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((10985767633663020 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((370453003636932348110790705367265595921271081121725185056202084131 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-5232682275838776 : Rat) / 7342292683791569) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-718396603408299011920230581506755599855625462526361994267269053023483557314839653 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (8, 1), (11, 1)],
  term ((757086947444533776355060823475937051900351411988606398788109806493547359634113193 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((-748670333884598814934407262914616812947666585857490699228428987878402298627712681 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-30173534442233850121461008 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10536140660316550661170003642481812917306936852421720951181199776 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((941374372266499254056 : Rat) / 76449970031803772565) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10536140660316550661170003642481812917306936852421720951181199776 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 2)],
  term ((21072281320633101322340007284963625834613873704843441902362399552 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((5083204987253182866911130952973182565909144993537927970487489454395877535705042431 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((50470447443082612909059092 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((94852548573315604064387671297266033276551243810423997664380424255998703259096399 : Rat) / 140911647291456799681479009619262081542644636831143379688782140005581396144000) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((11506611979372594224852352 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-28111876716384455010742634 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-239919399771318478933268418470509459754193924932651224484423962262771362066182457 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((78209875419368153955639591182803249632531079829594493608660580885600376726813619 : Rat) / 41099230460008233240431377805618107116604685742416819075894790834961240542000) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((12973499284553726778019712 : Rat) / 420908051671767637152035) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((28606517902490010161604388303876880332850563237701628590562135876 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19850304915601139472429392 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-58140100543728849141550293054150774575778253786478739014735814901714238013795557 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4442190186478873299068 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((103660443689146089854918022381471780647586661280656 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((285891633730278756292407074163931128214853326041737110286074547238125347035919 : Rat) / 80408866899827759840716588948117196713961612266897774288672687250961984000) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((2221095093239436649534 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((28606517902490010161604388303876880332850563237701628590562135876 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 2), (13, 1)],
  term ((-57213035804980020323208776607753760665701126475403257181124271752 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 1), (8, 1), (12, 2), (13, 1), (14, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-207320887378292179709836044762943561295173322561312 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((103660443689146089854918022381471780647586661280656 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((10039833385216323338371124875977153769535717722734887670316683426654032796385658879623 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(3, 1), (8, 1), (13, 1)],
  term ((-9260337584169840815853300141209859530020446455488913149126208937490802667061745398423 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-344760123199345814902837478 : Rat) / 3788172465045908734368315) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-569307479584050922084300857995394565816002970527296612029268543064000970876361 : Rat) / 704558236457283998407395048096310407713223184155716898443910700027906980720) [(3, 1), (8, 1), (13, 1), (14, 2)],
  term ((-5301157209338944090446670 : Rat) / 252544831003060582291221) [(3, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((384518802269387895581187503 : Rat) / 7576344930091817468736630) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((40345101050069811785792306958333023230275546549270630415336087592228600478059 : Rat) / 23136782396406853646584645721428477580346147824493618966124104198363264000) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((1131566673391357933259 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((58779623162093584795611327669688111623732824887688110507677575087852285517978941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((2336316047681366144092 : Rat) / 32049107564750198685) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11570656074374208922536427278789600740165162106870897002371679468048684079252019 : Rat) / 6529199992266014099066187022587116373173682916072099272240222204778113100800) [(3, 1), (8, 1), (15, 1)],
  term ((-5541505294535038567 : Rat) / 154453530432531078) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (13, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((-180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((180284542971921970351934041146321853766111201668232389990664878305339567007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 2), (15, 1)],
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((557204738809564374023922488226862859485004198495314419148600787055338829401651209 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(3, 1), (9, 1)],
  term ((10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (9, 1), (10, 1)],
  term ((-10747646953720085093629610446778772544235248041191979215593893729724644921313121 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-557204738809564374023922488226862859485004198495314419148600787055338829401651209 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1200 through 1299. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1200_1299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1200_1299
      rs_R009_ueqv_R009NYNYN_block_28_1200_1299 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
