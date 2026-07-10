/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 21:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 : Poly :=
[
  term (2 : Rat) [(8, 1), (14, 1)],
  term (2 : Rat) [(9, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0200 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1)]
]

/-- Partial product 200 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0200 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0200
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0201 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (15, 1)]
]

/-- Partial product 201 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0201 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (15, 2)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0201
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0202 : Poly :=
[
  term ((147060818970673251106288751510681874473696740933476736000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1)]
]

/-- Partial product 202 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0202 : Poly :=
[
  term ((294121637941346502212577503021363748947393481866953472000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((294121637941346502212577503021363748947393481866953472000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-147060818970673251106288751510681874473696740933476736000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (14, 2)],
  term ((-147060818970673251106288751510681874473696740933476736000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0202
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0203 : Poly :=
[
  term ((147231005669515408733727392084779594223782630434748825600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 203 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0203 : Poly :=
[
  term ((294462011339030817467454784169559188447565260869497651200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((294462011339030817467454784169559188447565260869497651200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-147231005669515408733727392084779594223782630434748825600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-147231005669515408733727392084779594223782630434748825600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0203
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0204 : Poly :=
[
  term ((2505579761848784161152388745201979933879527502680268800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 204 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0204 : Poly :=
[
  term ((5011159523697568322304777490403959867759055005360537600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5011159523697568322304777490403959867759055005360537600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2505579761848784161152388745201979933879527502680268800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2505579761848784161152388745201979933879527502680268800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0204
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0205 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1)]
]

/-- Partial product 205 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0205 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (14, 2)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0205
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0206 : Poly :=
[
  term ((2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 206 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0206 : Poly :=
[
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0206
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0207 : Poly :=
[
  term ((-1497262680871108008179732047860561699513887792876569753600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 207 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0207 : Poly :=
[
  term ((-2994525361742216016359464095721123399027775585753139507200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2994525361742216016359464095721123399027775585753139507200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((1497262680871108008179732047860561699513887792876569753600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((1497262680871108008179732047860561699513887792876569753600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0207
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0208 : Poly :=
[
  term ((-2027476803982458087786886467167775407500476450850235648000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1)]
]

/-- Partial product 208 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0208 : Poly :=
[
  term ((-4054953607964916175573772934335550815000952901700471296000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-4054953607964916175573772934335550815000952901700471296000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((2027476803982458087786886467167775407500476450850235648000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1), (14, 2)],
  term ((2027476803982458087786886467167775407500476450850235648000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0208
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0209 : Poly :=
[
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 209 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0209 : Poly :=
[
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0209
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0210 : Poly :=
[
  term ((297526322736072701990555547202495019642373253374130892800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (15, 1)]
]

/-- Partial product 210 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0210 : Poly :=
[
  term ((595052645472145403981111094404990039284746506748261785600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((595052645472145403981111094404990039284746506748261785600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (15, 2)],
  term ((-297526322736072701990555547202495019642373253374130892800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (14, 2), (15, 1)],
  term ((-297526322736072701990555547202495019642373253374130892800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0210
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0211 : Poly :=
[
  term ((4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2)]
]

/-- Partial product 211 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0211 : Poly :=
[
  term ((9751277737386897919330160244020171093000613339634073600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 1), (14, 1)],
  term ((9751277737386897919330160244020171093000613339634073600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (9, 1), (15, 1)],
  term ((-4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (14, 2)],
  term ((-4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0211
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0212 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 1)]
]

/-- Partial product 212 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0212 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (9, 1), (15, 2)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (14, 2), (15, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0212
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0213 : Poly :=
[
  term ((-39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 87055999896880187987549160301161551642315772214294656963202962730374841344000) [(8, 1)]
]

/-- Partial product 213 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0213 : Poly :=
[
  term ((-39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(8, 1), (9, 1), (15, 1)],
  term ((39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 87055999896880187987549160301161551642315772214294656963202962730374841344000) [(8, 1), (14, 2)],
  term ((39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 87055999896880187987549160301161551642315772214294656963202962730374841344000) [(8, 1), (15, 2)],
  term ((-39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0213
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0214 : Poly :=
[
  term ((23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 214 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0214 : Poly :=
[
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((47622713320727805942769070883885620007104 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((47622713320727805942769070883885620007104 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0214
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0215 : Poly :=
[
  term ((-729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 215 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0215 : Poly :=
[
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1458383754819408878592 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1458383754819408878592 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0215
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0216 : Poly :=
[
  term ((-11905678330181951485692267720971405001776 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 216 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0216 : Poly :=
[
  term ((11905678330181951485692267720971405001776 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((11905678330181951485692267720971405001776 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (15, 2)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0216
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0217 : Poly :=
[
  term ((364595938704852219648 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0217 : Poly :=
[
  term ((-364595938704852219648 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-364595938704852219648 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0217
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0218 : Poly :=
[
  term ((-6502018975493988258691244423970380086924 : Rat) / 68219267199393014083125634786837584975) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 218 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0218 : Poly :=
[
  term ((6502018975493988258691244423970380086924 : Rat) / 68219267199393014083125634786837584975) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((6502018975493988258691244423970380086924 : Rat) / 68219267199393014083125634786837584975) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-13004037950987976517382488847940760173848 : Rat) / 68219267199393014083125634786837584975) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-13004037950987976517382488847940760173848 : Rat) / 68219267199393014083125634786837584975) [(8, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0218
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0219 : Poly :=
[
  term ((-4192416506056903729088 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 219 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0219 : Poly :=
[
  term ((4192416506056903729088 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((4192416506056903729088 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8384833012113807458176 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8384833012113807458176 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0219
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0220 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 220 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0220 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0220
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0221 : Poly :=
[
  term ((-5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 221 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0221 : Poly :=
[
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0221
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0222 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 222 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0222 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 2), (12, 1), (15, 2)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0222
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0223 : Poly :=
[
  term ((2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0223 : Poly :=
[
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0223
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0224 : Poly :=
[
  term ((461334922805863186025204925086520162880196603651799165467235262637155703017481779 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 224 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0224 : Poly :=
[
  term ((-461334922805863186025204925086520162880196603651799165467235262637155703017481779 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-461334922805863186025204925086520162880196603651799165467235262637155703017481779 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((461334922805863186025204925086520162880196603651799165467235262637155703017481779 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((461334922805863186025204925086520162880196603651799165467235262637155703017481779 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0224
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0225 : Poly :=
[
  term ((33221922531485895281631743 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0225 : Poly :=
[
  term ((-33221922531485895281631743 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-33221922531485895281631743 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((66443845062971790563263486 : Rat) / 3788172465045908734368315) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((66443845062971790563263486 : Rat) / 3788172465045908734368315) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0225
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0226 : Poly :=
[
  term ((-453290575491358049069022829651586355577827731643374510717000607352034447807979661 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 226 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0226 : Poly :=
[
  term ((453290575491358049069022829651586355577827731643374510717000607352034447807979661 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((453290575491358049069022829651586355577827731643374510717000607352034447807979661 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (15, 3)],
  term ((-453290575491358049069022829651586355577827731643374510717000607352034447807979661 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 2), (15, 2)],
  term ((-453290575491358049069022829651586355577827731643374510717000607352034447807979661 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0226
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0227 : Poly :=
[
  term ((-2999547645139968220767569 : Rat) / 757634493009181746873663) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0227 : Poly :=
[
  term ((2999547645139968220767569 : Rat) / 757634493009181746873663) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2999547645139968220767569 : Rat) / 757634493009181746873663) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-5999095290279936441535138 : Rat) / 757634493009181746873663) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-5999095290279936441535138 : Rat) / 757634493009181746873663) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0227
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0228 : Poly :=
[
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2)]
]

/-- Partial product 228 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0228 : Poly :=
[
  term ((176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (14, 2)],
  term ((176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (15, 2)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 3), (15, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0228
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0229 : Poly :=
[
  term ((600026359323760732128 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (16, 1)]
]

/-- Partial product 229 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0229 : Poly :=
[
  term ((-600026359323760732128 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-600026359323760732128 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0229
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0230 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(8, 1), (10, 1)]
]

/-- Partial product 230 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0230 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(8, 1), (10, 1), (14, 2)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(8, 1), (10, 1), (15, 2)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0230
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0231 : Poly :=
[
  term ((25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 231 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0231 : Poly :=
[
  term ((50063560325304607969311248683434671884928 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((50063560325304607969311248683434671884928 : Rat) / 40706970139555502230671675078565637125) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0231
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0232 : Poly :=
[
  term ((551151397787377453056 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 232 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0232 : Poly :=
[
  term ((1102302795574754906112 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-551151397787377453056 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-551151397787377453056 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1102302795574754906112 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0232
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0233 : Poly :=
[
  term ((-12515890081326151992327812170858667971232 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 233 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0233 : Poly :=
[
  term ((-25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((12515890081326151992327812170858667971232 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((12515890081326151992327812170858667971232 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (15, 3)],
  term ((-25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0233
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0234 : Poly :=
[
  term ((-275575698893688726528 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0234 : Poly :=
[
  term ((-551151397787377453056 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((275575698893688726528 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((275575698893688726528 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-551151397787377453056 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0234
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0235 : Poly :=
[
  term ((2812866475276599446854861323327586952920518371875852713055622491703407604 : Rat) / 50440881762405784536611902068750745111198681568994623313567489979088415) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 235 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0235 : Poly :=
[
  term ((5625732950553198893709722646655173905841036743751705426111244983406815208 : Rat) / 50440881762405784536611902068750745111198681568994623313567489979088415) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2812866475276599446854861323327586952920518371875852713055622491703407604 : Rat) / 50440881762405784536611902068750745111198681568994623313567489979088415) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2812866475276599446854861323327586952920518371875852713055622491703407604 : Rat) / 50440881762405784536611902068750745111198681568994623313567489979088415) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((5625732950553198893709722646655173905841036743751705426111244983406815208 : Rat) / 50440881762405784536611902068750745111198681568994623313567489979088415) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0235
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0236 : Poly :=
[
  term ((-647616766377517848192 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0236 : Poly :=
[
  term ((-1295233532755035696384 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((647616766377517848192 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((647616766377517848192 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1295233532755035696384 : Rat) / 4339258264657398321155) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0236
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0237 : Poly :=
[
  term ((-6576465366573568116486207219032033763232 : Rat) / 131890583252159827227376227254552664285) [(8, 1), (10, 1), (13, 2)]
]

/-- Partial product 237 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0237 : Poly :=
[
  term ((-13152930733147136232972414438064067526464 : Rat) / 131890583252159827227376227254552664285) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((6576465366573568116486207219032033763232 : Rat) / 131890583252159827227376227254552664285) [(8, 1), (10, 1), (13, 2), (14, 2)],
  term ((6576465366573568116486207219032033763232 : Rat) / 131890583252159827227376227254552664285) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-13152930733147136232972414438064067526464 : Rat) / 131890583252159827227376227254552664285) [(8, 2), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0237
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0238 : Poly :=
[
  term ((-3257882747407971780096 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 238 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0238 : Poly :=
[
  term ((-6515765494815943560192 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3257882747407971780096 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((3257882747407971780096 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6515765494815943560192 : Rat) / 4339258264657398321155) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0238
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0239 : Poly :=
[
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 239 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0239 : Poly :=
[
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (15, 4)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 2), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0239
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0240 : Poly :=
[
  term ((1926038409869376 : Rat) / 7342292683791569) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 240 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0240 : Poly :=
[
  term ((3852076819738752 : Rat) / 7342292683791569) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(8, 1), (10, 1), (15, 4), (16, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0240
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0241 : Poly :=
[
  term ((515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 241 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0241 : Poly :=
[
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0241
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0242 : Poly :=
[
  term ((4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 242 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0242 : Poly :=
[
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0242
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0243 : Poly :=
[
  term ((-257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 243 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0243 : Poly :=
[
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0243
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0244 : Poly :=
[
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0244 : Poly :=
[
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0244
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0245 : Poly :=
[
  term ((-60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 476271757056667441581107831542337953321546505262490346407836150) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 245 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0245 : Poly :=
[
  term ((-60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 238135878528333720790553915771168976660773252631245173203918075) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 476271757056667441581107831542337953321546505262490346407836150) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 476271757056667441581107831542337953321546505262490346407836150) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 238135878528333720790553915771168976660773252631245173203918075) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0245
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0246 : Poly :=
[
  term ((-1464782164788945897716 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 246 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0246 : Poly :=
[
  term ((-2929564329577891795432 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1464782164788945897716 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1464782164788945897716 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2929564329577891795432 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0246
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0247 : Poly :=
[
  term ((51477392028538417882129278964687740908279161118180314343615049103991604703 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 247 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0247 : Poly :=
[
  term ((51477392028538417882129278964687740908279161118180314343615049103991604703 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-51477392028538417882129278964687740908279161118180314343615049103991604703 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-51477392028538417882129278964687740908279161118180314343615049103991604703 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(8, 1), (11, 1), (15, 3)],
  term ((51477392028538417882129278964687740908279161118180314343615049103991604703 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0247
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0248 : Poly :=
[
  term ((-4145454608327882275628 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0248 : Poly :=
[
  term ((-8290909216655764551256 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4145454608327882275628 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4145454608327882275628 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-8290909216655764551256 : Rat) / 4339258264657398321155) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0248
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0249 : Poly :=
[
  term ((15287631268744418680267553533172170909168 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (11, 2)]
]

/-- Partial product 249 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0249 : Poly :=
[
  term ((30575262537488837360535107066344341818336 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-15287631268744418680267553533172170909168 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (11, 2), (14, 2)],
  term ((-15287631268744418680267553533172170909168 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (11, 2), (15, 2)],
  term ((30575262537488837360535107066344341818336 : Rat) / 157012599109714080032590746731610314625) [(8, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0249
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0250 : Poly :=
[
  term ((769258366770815172352 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 250 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0250 : Poly :=
[
  term ((1538516733541630344704 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-769258366770815172352 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-769258366770815172352 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((1538516733541630344704 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0250
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0251 : Poly :=
[
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 251 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0251 : Poly :=
[
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0251
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0252 : Poly :=
[
  term ((79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0252 : Poly :=
[
  term ((159009514516881327386792 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((159009514516881327386792 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0252
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0253 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 253 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0253 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0253_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0253
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0254 : Poly :=
[
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 254 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0254 : Poly :=
[
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0254_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0254
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0255 : Poly :=
[
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 255 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0255 : Poly :=
[
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (12, 1), (15, 4)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0255_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0255
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0256 : Poly :=
[
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 256 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0256 : Poly :=
[
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0256_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0256
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0257 : Poly :=
[
  term ((-2974814105175463913957446672415425235701692269082391554386168864489080180754021392177 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 257 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0257 : Poly :=
[
  term ((-2974814105175463913957446672415425235701692269082391554386168864489080180754021392177 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((2974814105175463913957446672415425235701692269082391554386168864489080180754021392177 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((2974814105175463913957446672415425235701692269082391554386168864489080180754021392177 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (13, 1), (15, 3)],
  term ((-2974814105175463913957446672415425235701692269082391554386168864489080180754021392177 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0257_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0257
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0258 : Poly :=
[
  term ((-52543176123461147441978023 : Rat) / 1262724155015302911456105) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0258 : Poly :=
[
  term ((-105086352246922294883956046 : Rat) / 1262724155015302911456105) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((52543176123461147441978023 : Rat) / 1262724155015302911456105) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((52543176123461147441978023 : Rat) / 1262724155015302911456105) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-105086352246922294883956046 : Rat) / 1262724155015302911456105) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0258_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0258
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0259 : Poly :=
[
  term ((47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 77872226134752441929238400052750097694619404564579236143800656318873929448000) [(8, 1), (13, 2)]
]

/-- Partial product 259 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0259 : Poly :=
[
  term ((47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 38936113067376220964619200026375048847309702282289618071900328159436964724000) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 77872226134752441929238400052750097694619404564579236143800656318873929448000) [(8, 1), (13, 2), (14, 2)],
  term ((-47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 77872226134752441929238400052750097694619404564579236143800656318873929448000) [(8, 1), (13, 2), (15, 2)],
  term ((47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 38936113067376220964619200026375048847309702282289618071900328159436964724000) [(8, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0259_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0259
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0260 : Poly :=
[
  term ((2118280150403436148790281 : Rat) / 199377498160310986019385) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 260 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0260 : Poly :=
[
  term ((4236560300806872297580562 : Rat) / 199377498160310986019385) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2118280150403436148790281 : Rat) / 199377498160310986019385) [(8, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2118280150403436148790281 : Rat) / 199377498160310986019385) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((4236560300806872297580562 : Rat) / 199377498160310986019385) [(8, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0260_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0260
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0261 : Poly :=
[
  term ((67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (15, 2)]
]

/-- Partial product 261 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0261 : Poly :=
[
  term ((67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (9, 1), (15, 3)],
  term ((-67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (14, 2), (15, 2)],
  term ((-67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (15, 4)],
  term ((67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0261_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0261
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0262 : Poly :=
[
  term ((1171271353191215465621 : Rat) / 64098215129500397370) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 262 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0262 : Poly :=
[
  term ((1171271353191215465621 : Rat) / 32049107564750198685) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1171271353191215465621 : Rat) / 64098215129500397370) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1171271353191215465621 : Rat) / 64098215129500397370) [(8, 1), (15, 4), (16, 1)],
  term ((1171271353191215465621 : Rat) / 32049107564750198685) [(8, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0262_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0262
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0263 : Poly :=
[
  term ((-945934416344657130989 : Rat) / 85464286839333863160) [(8, 1), (16, 1)]
]

/-- Partial product 263 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0263 : Poly :=
[
  term ((-945934416344657130989 : Rat) / 42732143419666931580) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((945934416344657130989 : Rat) / 85464286839333863160) [(8, 1), (14, 2), (16, 1)],
  term ((945934416344657130989 : Rat) / 85464286839333863160) [(8, 1), (15, 2), (16, 1)],
  term ((-945934416344657130989 : Rat) / 42732143419666931580) [(8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0263_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0263
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0264 : Poly :=
[
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (13, 1)]
]

/-- Partial product 264 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0264 : Poly :=
[
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (13, 1), (14, 2)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (13, 1), (15, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0264_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0264
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0265 : Poly :=
[
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 265 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0265 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0265_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0265
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0266 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (15, 1)]
]

/-- Partial product 266 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0266 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (14, 2), (15, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (15, 3)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (15, 2)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0266_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0266
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0267 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0267 : Poly :=
[
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0267_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0267
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0268 : Poly :=
[
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 268 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0268 : Poly :=
[
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (13, 1), (14, 2)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0268_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0268
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0269 : Poly :=
[
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 269 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0269 : Poly :=
[
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0269_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0269
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0270 : Poly :=
[
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 270 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0270 : Poly :=
[
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (15, 3)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0270_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0270
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0271 : Poly :=
[
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0271 : Poly :=
[
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0271_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0271
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0272 : Poly :=
[
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 272 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0272 : Poly :=
[
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 1), (15, 3)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0272_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0272
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0273 : Poly :=
[
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0273 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0273_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0273
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0274 : Poly :=
[
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2)]
]

/-- Partial product 274 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0274 : Poly :=
[
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2), (14, 2)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2), (15, 2)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0274_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0274
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0275 : Poly :=
[
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (16, 1)]
]

/-- Partial product 275 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0275 : Poly :=
[
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (14, 2), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0275_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0275
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0276 : Poly :=
[
  term ((401308262877256766441821087514698750256771 : Rat) / 5652453567949706881173266882337971326500) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 276 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0276 : Poly :=
[
  term ((401308262877256766441821087514698750256771 : Rat) / 2826226783974853440586633441168985663250) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-401308262877256766441821087514698750256771 : Rat) / 5652453567949706881173266882337971326500) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-401308262877256766441821087514698750256771 : Rat) / 5652453567949706881173266882337971326500) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((401308262877256766441821087514698750256771 : Rat) / 2826226783974853440586633441168985663250) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0276_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0276
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0277 : Poly :=
[
  term ((-730238899432268909332 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 277 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0277 : Poly :=
[
  term ((-1460477798864537818664 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((730238899432268909332 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((730238899432268909332 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1460477798864537818664 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0277_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0277
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0278 : Poly :=
[
  term ((-160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 278 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0278 : Poly :=
[
  term ((-321142345704795997351005236398889129693428 : Rat) / 659452916260799136136881136272763321425) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-321142345704795997351005236398889129693428 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0278_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0278
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0279 : Poly :=
[
  term ((1639094552796876054624 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 279 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0279 : Poly :=
[
  term ((3278189105593752109248 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3278189105593752109248 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0279_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0279
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0280 : Poly :=
[
  term ((80285586426198999337751309099722282423357 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 280 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0280 : Poly :=
[
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-80285586426198999337751309099722282423357 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-80285586426198999337751309099722282423357 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0280_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0280
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0281 : Poly :=
[
  term ((-819547276398438027312 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0281 : Poly :=
[
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((819547276398438027312 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((819547276398438027312 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0281_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0281
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0282 : Poly :=
[
  term ((-337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 282 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0282 : Poly :=
[
  term ((-337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0282_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0282
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0283 : Poly :=
[
  term ((-1678765776824935199400959 : Rat) / 199377498160310986019385) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 283 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0283 : Poly :=
[
  term ((-3357531553649870398801918 : Rat) / 199377498160310986019385) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1678765776824935199400959 : Rat) / 199377498160310986019385) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((1678765776824935199400959 : Rat) / 199377498160310986019385) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3357531553649870398801918 : Rat) / 199377498160310986019385) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0283_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0283
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0284 : Poly :=
[
  term ((85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 284 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0284 : Poly :=
[
  term ((85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 1), (10, 1), (15, 3)],
  term ((85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0284_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0284
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0285 : Poly :=
[
  term ((30297148998618629852737727 : Rat) / 7576344930091817468736630) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0285 : Poly :=
[
  term ((30297148998618629852737727 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30297148998618629852737727 : Rat) / 7576344930091817468736630) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-30297148998618629852737727 : Rat) / 7576344930091817468736630) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((30297148998618629852737727 : Rat) / 3788172465045908734368315) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0285_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0285
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0286 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (13, 1)]
]

/-- Partial product 286 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0286 : Poly :=
[
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0286_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0286
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0287 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 287 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0287 : Poly :=
[
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (14, 2), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0287_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0287
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0288 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 288 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0288 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (15, 3)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0288_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0288
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0289 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0289 : Poly :=
[
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0289_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0289
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0290 : Poly :=
[
  term ((-147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(9, 1), (11, 1)]
]

/-- Partial product 290 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0290 : Poly :=
[
  term ((-147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(9, 1), (11, 1), (14, 2)],
  term ((147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(9, 1), (11, 1), (15, 2)],
  term ((-147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0290_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0290
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0291 : Poly :=
[
  term ((360088503282033322208412614062835103125617 : Rat) / 4164965786910310333496091386985873609000) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 291 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0291 : Poly :=
[
  term ((360088503282033322208412614062835103125617 : Rat) / 2082482893455155166748045693492936804500) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-360088503282033322208412614062835103125617 : Rat) / 4164965786910310333496091386985873609000) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-360088503282033322208412614062835103125617 : Rat) / 4164965786910310333496091386985873609000) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((360088503282033322208412614062835103125617 : Rat) / 2082482893455155166748045693492936804500) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0291_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0291
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0292 : Poly :=
[
  term ((1247728766855647262902 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 292 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0292 : Poly :=
[
  term ((2495457533711294525804 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1247728766855647262902 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1247728766855647262902 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2495457533711294525804 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0292_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0292
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0293 : Poly :=
[
  term ((2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 293 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0293 : Poly :=
[
  term ((2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0293_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0293
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0294 : Poly :=
[
  term ((-22790793191585225162374 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0294 : Poly :=
[
  term ((-45581586383170450324748 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22790793191585225162374 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((22790793191585225162374 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-45581586383170450324748 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0294_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0294
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0295 : Poly :=
[
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 295 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0295 : Poly :=
[
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0295_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0295
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0296 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 296 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0296 : Poly :=
[
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0296_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0296
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0297 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 297 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0297 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (11, 1), (15, 4)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0297_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0297
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0298 : Poly :=
[
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 298 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0298 : Poly :=
[
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0298_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0298
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0299 : Poly :=
[
  term ((-61328952110826534529245839 : Rat) / 15152689860183634937473260) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 299 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0299 : Poly :=
[
  term ((-61328952110826534529245839 : Rat) / 7576344930091817468736630) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((61328952110826534529245839 : Rat) / 15152689860183634937473260) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((61328952110826534529245839 : Rat) / 15152689860183634937473260) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-61328952110826534529245839 : Rat) / 7576344930091817468736630) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0299_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0299
        rs_R009_ueqv_R009NYNYN_generator_21_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_21_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_21_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_21_0200,
  rs_R009_ueqv_R009NYNYN_partial_21_0201,
  rs_R009_ueqv_R009NYNYN_partial_21_0202,
  rs_R009_ueqv_R009NYNYN_partial_21_0203,
  rs_R009_ueqv_R009NYNYN_partial_21_0204,
  rs_R009_ueqv_R009NYNYN_partial_21_0205,
  rs_R009_ueqv_R009NYNYN_partial_21_0206,
  rs_R009_ueqv_R009NYNYN_partial_21_0207,
  rs_R009_ueqv_R009NYNYN_partial_21_0208,
  rs_R009_ueqv_R009NYNYN_partial_21_0209,
  rs_R009_ueqv_R009NYNYN_partial_21_0210,
  rs_R009_ueqv_R009NYNYN_partial_21_0211,
  rs_R009_ueqv_R009NYNYN_partial_21_0212,
  rs_R009_ueqv_R009NYNYN_partial_21_0213,
  rs_R009_ueqv_R009NYNYN_partial_21_0214,
  rs_R009_ueqv_R009NYNYN_partial_21_0215,
  rs_R009_ueqv_R009NYNYN_partial_21_0216,
  rs_R009_ueqv_R009NYNYN_partial_21_0217,
  rs_R009_ueqv_R009NYNYN_partial_21_0218,
  rs_R009_ueqv_R009NYNYN_partial_21_0219,
  rs_R009_ueqv_R009NYNYN_partial_21_0220,
  rs_R009_ueqv_R009NYNYN_partial_21_0221,
  rs_R009_ueqv_R009NYNYN_partial_21_0222,
  rs_R009_ueqv_R009NYNYN_partial_21_0223,
  rs_R009_ueqv_R009NYNYN_partial_21_0224,
  rs_R009_ueqv_R009NYNYN_partial_21_0225,
  rs_R009_ueqv_R009NYNYN_partial_21_0226,
  rs_R009_ueqv_R009NYNYN_partial_21_0227,
  rs_R009_ueqv_R009NYNYN_partial_21_0228,
  rs_R009_ueqv_R009NYNYN_partial_21_0229,
  rs_R009_ueqv_R009NYNYN_partial_21_0230,
  rs_R009_ueqv_R009NYNYN_partial_21_0231,
  rs_R009_ueqv_R009NYNYN_partial_21_0232,
  rs_R009_ueqv_R009NYNYN_partial_21_0233,
  rs_R009_ueqv_R009NYNYN_partial_21_0234,
  rs_R009_ueqv_R009NYNYN_partial_21_0235,
  rs_R009_ueqv_R009NYNYN_partial_21_0236,
  rs_R009_ueqv_R009NYNYN_partial_21_0237,
  rs_R009_ueqv_R009NYNYN_partial_21_0238,
  rs_R009_ueqv_R009NYNYN_partial_21_0239,
  rs_R009_ueqv_R009NYNYN_partial_21_0240,
  rs_R009_ueqv_R009NYNYN_partial_21_0241,
  rs_R009_ueqv_R009NYNYN_partial_21_0242,
  rs_R009_ueqv_R009NYNYN_partial_21_0243,
  rs_R009_ueqv_R009NYNYN_partial_21_0244,
  rs_R009_ueqv_R009NYNYN_partial_21_0245,
  rs_R009_ueqv_R009NYNYN_partial_21_0246,
  rs_R009_ueqv_R009NYNYN_partial_21_0247,
  rs_R009_ueqv_R009NYNYN_partial_21_0248,
  rs_R009_ueqv_R009NYNYN_partial_21_0249,
  rs_R009_ueqv_R009NYNYN_partial_21_0250,
  rs_R009_ueqv_R009NYNYN_partial_21_0251,
  rs_R009_ueqv_R009NYNYN_partial_21_0252,
  rs_R009_ueqv_R009NYNYN_partial_21_0253,
  rs_R009_ueqv_R009NYNYN_partial_21_0254,
  rs_R009_ueqv_R009NYNYN_partial_21_0255,
  rs_R009_ueqv_R009NYNYN_partial_21_0256,
  rs_R009_ueqv_R009NYNYN_partial_21_0257,
  rs_R009_ueqv_R009NYNYN_partial_21_0258,
  rs_R009_ueqv_R009NYNYN_partial_21_0259,
  rs_R009_ueqv_R009NYNYN_partial_21_0260,
  rs_R009_ueqv_R009NYNYN_partial_21_0261,
  rs_R009_ueqv_R009NYNYN_partial_21_0262,
  rs_R009_ueqv_R009NYNYN_partial_21_0263,
  rs_R009_ueqv_R009NYNYN_partial_21_0264,
  rs_R009_ueqv_R009NYNYN_partial_21_0265,
  rs_R009_ueqv_R009NYNYN_partial_21_0266,
  rs_R009_ueqv_R009NYNYN_partial_21_0267,
  rs_R009_ueqv_R009NYNYN_partial_21_0268,
  rs_R009_ueqv_R009NYNYN_partial_21_0269,
  rs_R009_ueqv_R009NYNYN_partial_21_0270,
  rs_R009_ueqv_R009NYNYN_partial_21_0271,
  rs_R009_ueqv_R009NYNYN_partial_21_0272,
  rs_R009_ueqv_R009NYNYN_partial_21_0273,
  rs_R009_ueqv_R009NYNYN_partial_21_0274,
  rs_R009_ueqv_R009NYNYN_partial_21_0275,
  rs_R009_ueqv_R009NYNYN_partial_21_0276,
  rs_R009_ueqv_R009NYNYN_partial_21_0277,
  rs_R009_ueqv_R009NYNYN_partial_21_0278,
  rs_R009_ueqv_R009NYNYN_partial_21_0279,
  rs_R009_ueqv_R009NYNYN_partial_21_0280,
  rs_R009_ueqv_R009NYNYN_partial_21_0281,
  rs_R009_ueqv_R009NYNYN_partial_21_0282,
  rs_R009_ueqv_R009NYNYN_partial_21_0283,
  rs_R009_ueqv_R009NYNYN_partial_21_0284,
  rs_R009_ueqv_R009NYNYN_partial_21_0285,
  rs_R009_ueqv_R009NYNYN_partial_21_0286,
  rs_R009_ueqv_R009NYNYN_partial_21_0287,
  rs_R009_ueqv_R009NYNYN_partial_21_0288,
  rs_R009_ueqv_R009NYNYN_partial_21_0289,
  rs_R009_ueqv_R009NYNYN_partial_21_0290,
  rs_R009_ueqv_R009NYNYN_partial_21_0291,
  rs_R009_ueqv_R009NYNYN_partial_21_0292,
  rs_R009_ueqv_R009NYNYN_partial_21_0293,
  rs_R009_ueqv_R009NYNYN_partial_21_0294,
  rs_R009_ueqv_R009NYNYN_partial_21_0295,
  rs_R009_ueqv_R009NYNYN_partial_21_0296,
  rs_R009_ueqv_R009NYNYN_partial_21_0297,
  rs_R009_ueqv_R009NYNYN_partial_21_0298,
  rs_R009_ueqv_R009NYNYN_partial_21_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_21_0200_0299 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term ((294462011339030817467454784169559188447565260869497651200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((5011159523697568322304777490403959867759055005360537600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((294121637941346502212577503021363748947393481866953472000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2994525361742216016359464095721123399027775585753139507200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4054953607964916175573772934335550815000952901700471296000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((595052645472145403981111094404990039284746506748261785600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (15, 2)],
  term ((294462011339030817467454784169559188447565260869497651200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((5011159523697568322304777490403959867759055005360537600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((294121637941346502212577503021363748947393481866953472000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2994525361742216016359464095721123399027775585753139507200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-4054953607964916175573772934335550815000952901700471296000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((595052645472145403981111094404990039284746506748261785600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (15, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (15, 3)],
  term ((-147231005669515408733727392084779594223782630434748825600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-147231005669515408733727392084779594223782630434748825600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2505579761848784161152388745201979933879527502680268800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2505579761848784161152388745201979933879527502680268800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-147060818970673251106288751510681874473696740933476736000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (14, 2)],
  term ((-147060818970673251106288751510681874473696740933476736000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (15, 2)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (14, 2)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((1497262680871108008179732047860561699513887792876569753600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((1497262680871108008179732047860561699513887792876569753600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (15, 3)],
  term ((2027476803982458087786886467167775407500476450850235648000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1), (14, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((2027476803982458087786886467167775407500476450850235648000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1), (15, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (15, 4)],
  term ((-297526322736072701990555547202495019642373253374130892800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (14, 2), (15, 1)],
  term ((-297526322736072701990555547202495019642373253374130892800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (15, 3)],
  term ((9751277737386897919330160244020171093000613339634073600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 1), (14, 1)],
  term ((9751277737386897919330160244020171093000613339634073600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (9, 1), (15, 1)],
  term ((-4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (14, 2)],
  term ((-4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (15, 2)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (9, 1), (15, 2)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (14, 2), (15, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 3)],
  term ((50063560325304607969311248683434671884928 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1102302795574754906112 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((401308262877256766441821087514698750256771 : Rat) / 2826226783974853440586633441168985663250) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1460477798864537818664 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-551151397787377453056 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-321142345704795997351005236398889129693428 : Rat) / 659452916260799136136881136272763321425) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((3278189105593752109248 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3357531553649870398801918 : Rat) / 199377498160310986019385) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((113323727558581849002763039242760685435637539139474588541111390694306270536 : Rat) / 1261022044060144613415297551718768627779967039224865582839187249477210375) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-566041655345331257088 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13152930733147136232972414438064067526464 : Rat) / 131890583252159827227376227254552664285) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-6515765494815943560192 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((30297148998618629852737727 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11905678330181951485692267720971405001776 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-364595938704852219648 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2802518640286084749820228233010667126580275993692371705618915723825320852 : Rat) / 140113560451127179268366394635418736419996337691651731426576361053023375) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((1911962201376651518592 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((360088503282033322208412614062835103125617 : Rat) / 2082482893455155166748045693492936804500) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((2495457533711294525804 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-45581586383170450324748 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 238135878528333720790553915771168976660773252631245173203918075) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2929564329577891795432 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-61328952110826534529245839 : Rat) / 7576344930091817468736630) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((6502018975493988258691244423970380086924 : Rat) / 68219267199393014083125634786837584975) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((4192416506056903729088 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2987260527102509336626488523491987769524672507211082906026226818298973903667 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-4098492710598860822168 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((30575262537488837360535107066344341818336 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((1538516733541630344704 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((203306595155916068229601636584398967248664586355055190333003150558977853005859 : Rat) / 158888777551578221290327491516564847100275846942333063437737593434128507250) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((176466869154746602984064 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11673484561811966709984252460129255958885743117215154523463667303066154358557 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-16411819566739026323532 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-461334922805863186025204925086520162880196603651799165467235262637155703017481779 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-33221922531485895281631743 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-10127603794204082931026074461871920291896629549571066886697056158424942615731656656163 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-348480979272252779933499881 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 38936113067376220964619200026375048847309702282289618071900328159436964724000) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((4236560300806872297580562 : Rat) / 199377498160310986019385) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((453290575491358049069022829651586355577827731643374510717000607352034447807979661 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((2999547645139968220767569 : Rat) / 757634493009181746873663) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(8, 1), (9, 1), (15, 1)],
  term ((-945934416344657130989 : Rat) / 42732143419666931580) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1315072384918380485977434621110869397686301807933397705693436711580410012664042033021 : Rat) / 551246364204179000353945885630553262994825819283432901342515731701834421715328000) [(8, 1), (9, 1), (15, 3)],
  term ((153440840901548317924774424 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((47622713320727805942769070883885620007104 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1458383754819408878592 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (15, 2)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13004037950987976517382488847940760173848 : Rat) / 68219267199393014083125634786837584975) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-8384833012113807458176 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 2), (12, 1), (15, 2)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((461334922805863186025204925086520162880196603651799165467235262637155703017481779 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((66443845062971790563263486 : Rat) / 3788172465045908734368315) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (14, 2)],
  term ((-600026359323760732128 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-440102351948222290803755408142874664972746752457651773458737465938259987228575949 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 2), (15, 2)],
  term ((-4359899923298475046689062 : Rat) / 541167495006558390624045) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 3), (15, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-551151397787377453056 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-551151397787377453056 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12515890081326151992327812170858667971232 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((275575698893688726528 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((12515890081326151992327812170858667971232 : Rat) / 40706970139555502230671675078565637125) [(8, 1), (10, 1), (11, 1), (15, 3)],
  term ((275575698893688726528 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2812866475276599446854861323327586952920518371875852713055622491703407604 : Rat) / 50440881762405784536611902068750745111198681568994623313567489979088415) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((647616766377517848192 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2812866475276599446854861323327586952920518371875852713055622491703407604 : Rat) / 50440881762405784536611902068750745111198681568994623313567489979088415) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((647616766377517848192 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((6576465366573568116486207219032033763232 : Rat) / 131890583252159827227376227254552664285) [(8, 1), (10, 1), (13, 2), (14, 2)],
  term ((3257882747407971780096 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((6576465366573568116486207219032033763232 : Rat) / 131890583252159827227376227254552664285) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((3257882747407971780096 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(8, 1), (10, 1), (14, 2)],
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(8, 1), (10, 1), (15, 2)],
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (15, 4)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(8, 1), (10, 1), (15, 4), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 476271757056667441581107831542337953321546505262490346407836150) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((1464782164788945897716 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 476271757056667441581107831542337953321546505262490346407836150) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1464782164788945897716 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-51477392028538417882129278964687740908279161118180314343615049103991604703 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((4145454608327882275628 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-51477392028538417882129278964687740908279161118180314343615049103991604703 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(8, 1), (11, 1), (15, 3)],
  term ((4145454608327882275628 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-15287631268744418680267553533172170909168 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (11, 2), (14, 2)],
  term ((-769258366770815172352 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-15287631268744418680267553533172170909168 : Rat) / 157012599109714080032590746731610314625) [(8, 1), (11, 2), (15, 2)],
  term ((-769258366770815172352 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (12, 1), (15, 4)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term ((2974814105175463913957446672415425235701692269082391554386168864489080180754021392177 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((52543176123461147441978023 : Rat) / 1262724155015302911456105) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2974814105175463913957446672415425235701692269082391554386168864489080180754021392177 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (13, 1), (15, 3)],
  term ((52543176123461147441978023 : Rat) / 1262724155015302911456105) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 77872226134752441929238400052750097694619404564579236143800656318873929448000) [(8, 1), (13, 2), (14, 2)],
  term ((-2118280150403436148790281 : Rat) / 199377498160310986019385) [(8, 1), (13, 2), (14, 2), (16, 1)],
  term ((-47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 77872226134752441929238400052750097694619404564579236143800656318873929448000) [(8, 1), (13, 2), (15, 2)],
  term ((-2118280150403436148790281 : Rat) / 199377498160310986019385) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 87055999896880187987549160301161551642315772214294656963202962730374841344000) [(8, 1), (14, 2)],
  term ((-67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (14, 2), (15, 2)],
  term ((-1171271353191215465621 : Rat) / 64098215129500397370) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((945934416344657130989 : Rat) / 85464286839333863160) [(8, 1), (14, 2), (16, 1)],
  term ((39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 87055999896880187987549160301161551642315772214294656963202962730374841344000) [(8, 1), (15, 2)],
  term ((945934416344657130989 : Rat) / 85464286839333863160) [(8, 1), (15, 2), (16, 1)],
  term ((-67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (15, 4)],
  term ((-1171271353191215465621 : Rat) / 64098215129500397370) [(8, 1), (15, 4), (16, 1)],
  term ((47622713320727805942769070883885620007104 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1458383754819408878592 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13004037950987976517382488847940760173848 : Rat) / 68219267199393014083125634786837584975) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-8384833012113807458176 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((461334922805863186025204925086520162880196603651799165467235262637155703017481779 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((66443845062971790563263486 : Rat) / 3788172465045908734368315) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (13, 1), (14, 2)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2754286873323887518097516780509817146652512 : Rat) / 29675381231735961126159651132274349464125) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-39369882396054143663872 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-453290575491358049069022829651586355577827731643374510717000607352034447807979661 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-5999095290279936441535138 : Rat) / 757634493009181746873663) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (14, 2), (15, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (15, 3)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (13, 1), (15, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (14, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (14, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 2), (15, 2)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((50063560325304607969311248683434671884928 : Rat) / 40706970139555502230671675078565637125) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((1102302795574754906112 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25031780162652303984655624341717335942464 : Rat) / 40706970139555502230671675078565637125) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-551151397787377453056 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5625732950553198893709722646655173905841036743751705426111244983406815208 : Rat) / 50440881762405784536611902068750745111198681568994623313567489979088415) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1295233532755035696384 : Rat) / 4339258264657398321155) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13152930733147136232972414438064067526464 : Rat) / 131890583252159827227376227254552664285) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((-6515765494815943560192 : Rat) / 4339258264657398321155) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 2), (10, 1), (14, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60820547339990097973566194474524069077360519541995009691649217433 : Rat) / 238135878528333720790553915771168976660773252631245173203918075) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2929564329577891795432 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (13, 1), (14, 2)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((51477392028538417882129278964687740908279161118180314343615049103991604703 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-8290909216655764551256 : Rat) / 4339258264657398321155) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (15, 3)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((30575262537488837360535107066344341818336 : Rat) / 157012599109714080032590746731610314625) [(8, 2), (11, 2), (14, 1)],
  term ((1538516733541630344704 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((159009514516881327386792 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (12, 1), (13, 2), (14, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2974814105175463913957446672415425235701692269082391554386168864489080180754021392177 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-105086352246922294883956046 : Rat) / 1262724155015302911456105) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 1), (15, 3)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((47341629499328676928623082494928761898378514102745705927852393986126876590543147 : Rat) / 38936113067376220964619200026375048847309702282289618071900328159436964724000) [(8, 2), (13, 2), (14, 1)],
  term ((4236560300806872297580562 : Rat) / 199377498160310986019385) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2), (14, 2)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (14, 2), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2), (15, 2)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-39234344790765647654748325687558473678265820429700300571588742244606585635888639 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(8, 2), (14, 1)],
  term ((67879803327838658616993636224035301216229730635689500045720517069423296717950941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 2), (14, 1), (15, 2)],
  term ((1171271353191215465621 : Rat) / 32049107564750198685) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-945934416344657130989 : Rat) / 42732143419666931580) [(8, 2), (14, 1), (16, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (13, 1), (14, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 3), (9, 1), (14, 1), (15, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (13, 1), (14, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 3), (11, 1), (14, 1), (15, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 1), (14, 1), (15, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 3), (13, 2), (14, 1)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 3), (13, 2), (14, 1), (16, 1)],
  term ((-401308262877256766441821087514698750256771 : Rat) / 5652453567949706881173266882337971326500) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((730238899432268909332 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-401308262877256766441821087514698750256771 : Rat) / 5652453567949706881173266882337971326500) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((730238899432268909332 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-80285586426198999337751309099722282423357 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((819547276398438027312 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-80285586426198999337751309099722282423357 : Rat) / 659452916260799136136881136272763321425) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((819547276398438027312 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((1678765776824935199400959 : Rat) / 199377498160310986019385) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((1678765776824935199400959 : Rat) / 199377498160310986019385) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-30297148998618629852737727 : Rat) / 7576344930091817468736630) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 1), (10, 1), (15, 3)],
  term ((-30297148998618629852737727 : Rat) / 7576344930091817468736630) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (14, 2), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 2), (15, 3)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-360088503282033322208412614062835103125617 : Rat) / 4164965786910310333496091386985873609000) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1247728766855647262902 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-360088503282033322208412614062835103125617 : Rat) / 4164965786910310333496091386985873609000) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1247728766855647262902 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((22790793191585225162374 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((22790793191585225162374 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(9, 1), (11, 1), (14, 2)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((61328952110826534529245839 : Rat) / 15152689860183634937473260) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(9, 1), (11, 1), (15, 2)],
  term ((61328952110826534529245839 : Rat) / 15152689860183634937473260) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (11, 1), (15, 4)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((401308262877256766441821087514698750256771 : Rat) / 2826226783974853440586633441168985663250) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1460477798864537818664 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-321142345704795997351005236398889129693428 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3278189105593752109248 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 1), (15, 2)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-337732096386905665025322058246035955055052269173551051688800826062541486634934007 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3357531553649870398801918 : Rat) / 199377498160310986019385) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((85307839421903164828925432162201538448595671853598894697062713511521436050150231 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(9, 2), (10, 1), (15, 2)],
  term ((30297148998618629852737727 : Rat) / 3788172465045908734368315) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (15, 2)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((360088503282033322208412614062835103125617 : Rat) / 2082482893455155166748045693492936804500) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2495457533711294525804 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-45581586383170450324748 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-147366372643567424086355631956079300546657824920130860823157938621381581979086477 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(9, 2), (11, 1), (15, 1)],
  term ((-61328952110826534529245839 : Rat) / 7576344930091817468736630) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 2), (11, 1), (15, 3)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NYNYN_block_21_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_21_0200_0299
      rs_R009_ueqv_R009NYNYN_block_21_0200_0299 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
